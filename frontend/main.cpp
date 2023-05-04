/*
 * Copyright (C) 2023 Verifoxx Limited
 * Main program for the wamr-app frontend
 */

#include <iostream>
#include <fstream>
#include <cstddef>
#include <cstdint>
#include <iterator>
#include <vector>
#include <array>
#include <string>
#include <cstdlib>
#include <exception>

#include "wasm_c_api.h"
#include "wasm_export.h"
#include "bh_log.h"
#include "wasm_memory.h"
#include "wasm_native.h"
#include "wasm_runtime_common.h"
#include "cheri_mem_mgmt.h"

using namespace std;

// Reference to the CheriMemMgr instance
CheriMemMgr* mem_mgr_instance = nullptr;



class CRunnerException : public std::runtime_error
{
public:
    CRunnerException(const std::string& msg = "") : std::runtime_error(msg) {}
};

class Runner
{
    static constexpr size_t EXCEPTION_ARR_SIZE = 250;
    static constexpr size_t STACK_SIZE = 8092;
    static constexpr size_t HEAP_SIZE = 8092;

    wasm_module_t m_module = nullptr;
    wasm_module_inst_t m_module_inst = nullptr;
    wasm_exec_env_t m_exec_env = nullptr;
    wasm_function_inst_t m_fn = nullptr;

    array<char, EXCEPTION_ARR_SIZE> ex_buff;

public:
    void raise(const string& msg)
    {
        throw(CRunnerException(msg));
    }

    explicit Runner(vector<char>& module_buff, const string& fn_name, int64_t argc = 0, char* argv[] = nullptr)
    {
        if (!do_wasm_init())
        {
            raise("wasm_init() failed");
        }



        /* parse the WASM file from buffer and create a WASM module */
        if (!(m_module = wasm_runtime_load((uint8_t*)module_buff.data(), module_buff.size(), ex_buff.begin(), ex_buff.size())))
        {
            raise("wasm_runtime_load failed!");
        }

        wasm_runtime_set_wasi_args(m_module, NULL, 0, NULL, 0, NULL, 0, argv, argc);
        wasm_runtime_set_wasi_addr_pool(m_module, NULL, 0);
        wasm_runtime_set_wasi_ns_lookup_pool(m_module, NULL, 0);

        /* create an instance of the WASM module (WASM linear memory is ready) */
        if (!(m_module_inst = wasm_runtime_instantiate(m_module, STACK_SIZE, HEAP_SIZE, ex_buff.begin(), ex_buff.size())))
        {
            raise("wasm_runtime_instantiate failed!");
        }

        if (!(m_exec_env = wasm_runtime_create_exec_env(m_module_inst, STACK_SIZE)))
        {
            raise("wasm_runtime_create_exec_env failed!");
        }

        if (fn_name != "main")
        {
            m_fn = wasm_runtime_lookup_function(m_module_inst, fn_name.c_str(), NULL);
        }
    }

    ~Runner()
    {
        // Cleanup
        if (m_exec_env)
        {
            wasm_runtime_destroy_exec_env(m_exec_env);
        }

        if (m_module_inst)
        {
            wasm_runtime_deinstantiate(m_module_inst);
        }

        if (m_module)
        {
            wasm_runtime_unload(m_module);
        }

        wasm_runtime_destroy();
        delete mem_mgr_instance;
        mem_mgr_instance = nullptr;
    }

    bool Run(bool expect_return_val = false, int64_t argc = 0, char *argv[] = nullptr)
    {
        bool result;
        uint32_t retval = 0;

        if (m_fn)
        {
            cout << "Running Function" << endl;

            // Convert arguments to a list of integers
            vector<uint32_t> params;

            while(argc--)
            {
                params.push_back( (uint32_t)atoi(*argv++));
            }

            result = wasm_runtime_call_wasm(m_exec_env, m_fn, params.size(), params.data());
            if (result && expect_return_val && !params.empty())
            {
                retval = params[0];
            }
        }
        else
        {
            cout << "Running main()" << endl;
            result = wasm_application_execute_main(m_module_inst, argc, argv);
            if (result)
            {
                retval = wasm_runtime_get_wasi_exit_code(m_module_inst);
            }
        }
            
        if (!result)
        {
            cerr << "Failed to run!: Exception -> " << wasm_runtime_get_exception(m_module_inst) << endl;
        }
        else
        {
            cout << "WASM execution: result ";
                
            if (expect_return_val)
            {
                cout << retval;
            }
            else
            {
                cout << "not applicable";
            }
            cout << endl;
        }
            
        return result;
    }

protected:
    bool do_wasm_init()
    {
        try
        {
            mem_mgr_instance = new CheriMemMgr{ STACK_SIZE, HEAP_SIZE};
            mem_mgr_instance->setup_wasm_stack();
            mem_mgr_instance->wasm_memory_init();
            return true;
        }
        catch (exception&)
        {
            cout << "Cheri Mem Manager failed" << endl;
            if (mem_mgr_instance)
            {
                mem_mgr_instance->cleanup_wasm_stack();
            }
            return false;
        }
    }
};

int main(int argc, char* argv[])
{
    cout << "Launching default WAMR-APP front end" << endl;

    if (argc < 3)
    {
        cerr << "Usage: " << argv[0] << "<wasm-file> <fn|main> [param1 param2 param3...]" << endl;
        return -1;
    }

    ifstream fin(argv[1], ios::in | ios::binary | ios::ate);
    if (!fin.good())
    {
        cerr << "Cannot find file or process it: " << argv[1] << endl;
        return -2;
    }

    // Enable all logging in the VM lib
    bh_log_set_verbose_level(BH_LOG_LEVEL_VERBOSE);

    fin.seekg(0, std::ios::end);
    auto sz = fin.tellg();
    fin.seekg(0, std::ios::beg);

    vector<char> buff(sz);

    if (!fin.read(buff.data(), sz))
    {
        cerr << "Failed to read in WASM file " << argv[1] << endl;
        fin.close();
        return -2;
    }
    fin.close();

    string fn_name{ argv[2] };

    try
    {
        Runner runner{ buff, fn_name };

        int exitCode = runner.Run(true, argc - 2, (argc > 2) ? &argv[3] : nullptr) ? 0 : -1;
        return exitCode;
    }
    catch (CRunnerException &ex)
    {
        cerr << "Exception while processing: " << ex.what() << endl;
    }
    return -2;
}

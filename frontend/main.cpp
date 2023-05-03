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
#include "cheri_mem_mgmt_c_api.h"

#include "cheri_wasm_native_test.h"

using namespace std;

static constexpr uint32 LOG_LEVEL = BH_LOG_LEVEL_WARNING;

class CRunnerException : public std::runtime_error
{
  public:
    CRunnerException(const std::string &msg = "")
      : std::runtime_error(msg)
    {
    }
};

class Runner
{
    static constexpr size_t EXCEPTION_ARR_SIZE = 250;
    static constexpr size_t STACK_SIZE = 8092 * 2;
    static constexpr size_t HEAP_SIZE = 8092;

    wasm_module_t m_module = nullptr;
    wasm_module_inst_t m_module_inst = nullptr;
    wasm_exec_env_t m_exec_env = nullptr;
    wasm_function_inst_t m_fn = nullptr;

    array<char, EXCEPTION_ARR_SIZE> ex_buff;

  public:
    void raise(const string &msg) { throw(CRunnerException(msg)); }

    explicit Runner(vector<char> &module_buff, const string &fn_name,
                    int64_t argc = 0, char *argv[] = nullptr)
    {
        if (!do_wasm_init()) {
            raise("wasm_init() failed");
        }

        if (!do_wasm_register_natives()) {
            raise("wasm_runtime_register_natives() failed");
        }

        /* parse the WASM file from buffer and create a WASM module */
        cout << "WAMR-app: Loading module..." << endl;
        if (!(m_module = wasm_runtime_load((uint8_t *)module_buff.data(),
                                           module_buff.size(), ex_buff.begin(),
                                           ex_buff.size()))) {
            raise("wasm_runtime_load failed!");
        }

        wasm_runtime_set_wasi_args(m_module, NULL, 0, NULL, 0, NULL, 0, argv,
                                   argc);
        wasm_runtime_set_wasi_addr_pool(m_module, NULL, 0);
        wasm_runtime_set_wasi_ns_lookup_pool(m_module, NULL, 0);

        /* create an instance of the WASM module (WASM linear memory is ready)
         */
        if (!(m_module_inst =
                  wasm_runtime_instantiate(m_module, STACK_SIZE, HEAP_SIZE,
                                           ex_buff.begin(), ex_buff.size()))) {
            raise("wasm_runtime_instantiate failed!");
        }

        if (!(m_exec_env =
                  wasm_runtime_create_exec_env(m_module_inst, STACK_SIZE))) {
            raise("wasm_runtime_create_exec_env failed!");
        }

        if (fn_name != "main") {
            cout << "WAMR-app: Will execute function \"" << fn_name << "\""
                 << endl;
            m_fn = wasm_runtime_lookup_function(m_module_inst, fn_name.c_str(),
                                                NULL);
        }
        else {
            cout << "WAMR-app: Will execute function: main()" << endl;
        }
    }

    ~Runner()
    {
        // Cleanup
        if (m_exec_env) {
            wasm_runtime_destroy_exec_env(m_exec_env);
        }

        if (m_module_inst) {
            wasm_runtime_deinstantiate(m_module_inst);
        }

        if (m_module) {
            wasm_runtime_unload(m_module);
        }

        wasm_runtime_destroy();
        delete_cheri_mem_mgr(); // Destroy the C API version
    }

    bool Run(bool expect_return_val = false, int64_t argc = 0,
             char *argv[] = nullptr)
    {
        bool result;
        uint32_t retval = 0;

        cout << "WAMR-app: Executing WASM Module..." << endl;
        if (m_fn) {

            // Convert arguments to a list of integers
            vector<uint32_t> params;

            while (argc--) {
                params.push_back((uint32_t)atoi(*argv++));
            }

            result = wasm_runtime_call_wasm(m_exec_env, m_fn, params.size(),
                                            params.data());
            if (result && expect_return_val && !params.empty()) {
                retval = params[0];
            }
        }
        else {
            result = wasm_application_execute_main(m_module_inst, argc, argv);
            if (result) {
                retval = wasm_runtime_get_wasi_exit_code(m_module_inst);
            }
        }

        if (!result) {
            cerr << "WAMR-app: Module execution failed!: Exception -> "
                 << wasm_runtime_get_exception(m_module_inst) << endl;
        }
        else {
            cout << "WAMR-app: Run completes ok! Function return value=";

            if (expect_return_val) {
                cout << retval;
            }
            else {
                cout << "<none>";
            }
            cout << endl;
        }

        return result;
    }

  protected:
    bool do_wasm_init()
    {
        try {
            auto mem_mgr_instance = create_cheri_mem_mgr();
            mem_mgr_instance->set_stack_size(STACK_SIZE);

            if (mem_mgr_instance->create_stack_struct()
                && wasm_runtime_memory_init(
                    Alloc_With_System_Allocator,
                    NULL) /* Use system allocator currently */
                && wasm_runtime_set_default_running_mode(Mode_Interp)
                && wasm_native_init()
#ifdef OS_ENABLE_HW_BOUND_CHECK
                && runtime_signal_init()
#endif
            ) {
                return true;
            }

            wasm_runtime_memory_destroy();
            return false;

        } catch (exception &) {
            cerr << "Cheri Mem Manager failed" << endl;
            return false;
        }
    }

    bool do_wasm_register_natives()
    {
        return wasm_runtime_register_natives("env", native_symbols_table(),
                                             num_native_symbols());
    }
};

int
main(int argc, char *argv[])
{
    cout << endl << "**** WAMR-APP: C++ front end to run WAMR ****" << endl;
    cout << "WAMR-app is starting up..." << endl;

#if WASM_ENABLE_FAST_INTERP
    cout << "Fast interpreter ENABLED" << endl;
#else
    cout << "Fast interpreter DISABLED" << endl;
#endif

    if (argc < 2) {
        cerr << "Usage: " << argv[0]
             << " <wasm-file> [<fn_to_run_default_main>] [param1 param2 "
                "param3...]"
             << endl;
        return -1;
    }

    cout << "WAMR-app: Loading " << argv[1] << "..." << endl;
    ifstream fin(argv[1], ios::in | ios::binary | ios::ate);
    if (!fin.good()) {
        cerr << "Cannot find file or process it: " << argv[1] << endl;
        return -2;
    }

    // Enable all logging in the VM lib
    bh_log_set_verbose_level(LOG_LEVEL);

    fin.seekg(0, std::ios::end);
    auto sz = fin.tellg();
    fin.seekg(0, std::ios::beg);

    vector<char> buff(sz);

    if (!fin.read(buff.data(), sz)) {
        cerr << "Failed to read in WASM file " << argv[1] << endl;
        fin.close();
        return -2;
    }
    fin.close();

    string fn_name{ argc == 2 ? "main" : argv[2] };

    try {
        cout << "WAMR-app: Module loaded, WAMR Initialising..." << endl;
        Runner runner{ buff, fn_name };

        int exitCode =
            runner.Run(true, argc - 3, (argc > 3) ? &argv[3] : nullptr) ? 0
                                                                        : -1;
        cout << "WAMR-app: Exiting, returning: " << exitCode << endl;
        cout << "*** End ***" << endl << endl;
        return exitCode;
    } catch (CRunnerException &ex) {
        cerr << "Exception while processing: " << ex.what() << endl;
    }
    return -2;
}

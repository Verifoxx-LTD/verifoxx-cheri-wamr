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
#include <sstream>
#include <memory>
#include <cheriintrin.h>

#include "wasm_c_api.h"
#include "wasm_export.h"
#include "bh_log.h"
#include "wasm_memory.h"
#include "wasm_native.h"
#include "wasm_runtime_common.h"

#include "CCapability.h"
#include "CCompartment.h"
#include "CCompartmentData.h"
#include "CCompartmentLibs.h"

#include "CWamrProxy.h"

#include "CCapMgrLogger.h"
using namespace CapMgr;
using namespace std;


static constexpr uint32 LOG_LEVEL = BH_LOG_LEVEL_DEBUG;
static constexpr uint32 STACK_SIZE = 64 * 1024;
static constexpr uint32 HEAP_SIZE = 16 * 1024;
static constexpr char ADDR_POOL[] = "0.0.0.0/0";
static constexpr char NAME_RESOLVE[] = "*";

array<const char *, 1> user_addr_pool = { ADDR_POOL };
array<const char *, 1> user_lookup_pool = { NAME_RESOLVE };

class CRunnerException : public std::runtime_error
{
  public:
    CRunnerException(const std::string &msg = "")
      : std::runtime_error(msg)
    {
    }
};

// Native symbols - none yet
static NativeSymbol native_symbols[]{};


class CRunner
{
private:

    static constexpr size_t EXCEPTION_ARR_SIZE = 250;
    static constexpr size_t STACK_SIZE = 8092 * 2;
    static constexpr size_t HEAP_SIZE = 8092;

    wasm_module_t m_module = nullptr;
    wasm_module_inst_t m_module_inst = nullptr;
    wasm_exec_env_t m_exec_env = nullptr;
    wasm_function_inst_t m_fn = nullptr;

    array<char, EXCEPTION_ARR_SIZE> m_ex_buff;

    const CCompartmentLibs* m_plibs;

    CWamrProxy m_proxy;

    // Setup WAMR environment
    bool setup()
    {
        // Enable all logging
        m_proxy.bh_log_set_verbose_level(LOG_LEVEL);

        RuntimeInitArgs init_args;
        memset(&init_args, 0, sizeof(RuntimeInitArgs));

        // Use sys allocator for CHERI
        init_args.mem_alloc_type = Alloc_With_System_Allocator;

        // Add any native symbols
        init_args.native_module_name = "env";
        init_args.n_native_symbols = sizeof(native_symbols) / sizeof(NativeSymbol);
        init_args.native_symbols = native_symbols;

        // Init runtime
        m_proxy.wasm_runtime_full_init(&init_args);
        return true;
    }

    // Load module
    bool load_module(vector<char>& module_buff, int argc, char** argv)
    {

        if (!(m_module = m_proxy.wasm_runtime_load( (uint8*)module_buff.data(), module_buff.size(), m_ex_buff.data(), m_ex_buff.size())))
        {
            L_(ERROR) << "Failed to create module: " << m_ex_buff.data();
            return false;
        }

#if WASM_ENABLE_LIBC_WASI != 0
        // Setup WASI now we have a module - no dir or env list currently
        m_proxy.wasm_runtime_set_wasi_args(m_module, nullptr, 0, nullptr, 0, nullptr, 0, argv, argc);
        m_proxy.wasm_runtime_set_wasi_addr_pool(m_module, user_addr_pool.data(), user_addr_pool.size());
        m_proxy.wasm_runtime_set_wasi_ns_lookup_pool(m_module, user_lookup_pool.data(), user_lookup_pool.size());
#endif
        return true;
    }

    // Instantiate module
    bool instantiate_module()
    {
        if (!(m_module_inst = m_proxy.wasm_runtime_instantiate(m_module, STACK_SIZE, HEAP_SIZE, m_ex_buff.data(), m_ex_buff.size())))
        {
            L_(ERROR) << "Failed to instantiate module";
            return false;
        }

        return true;
    }

    // Create exec env
    bool create_exec_env()
    {
        if (!(m_exec_env = m_proxy.wasm_runtime_create_exec_env(m_module_inst, STACK_SIZE)))
        {
            L_(ERROR) << "Failed create exec env";
            return false;
        }

        return true;
    }


    // Set runtime function (which could be "main" or "_start"
    bool lookup_function(const string& fn_name)
    {
        if (fn_name.empty())
        {
            // Try and resolve name
#if WASM_ENABLE_LIBC_WASI != 0
            if ((m_fn = m_proxy.wasm_runtime_lookup_wasi_start_function(m_module_inst)))
            {
                return true;
            }
#endif
            else if ((m_fn = m_proxy.wasm_runtime_lookup_function(m_module_inst, "main", nullptr)))
            {
                return true;
            }
            else if ((m_fn = m_proxy.wasm_runtime_lookup_function(m_module_inst, "_main_argc_argv", nullptr)))
            {
                return true;
            }
            else if ((m_fn = m_proxy.wasm_runtime_lookup_function(m_module_inst, "_main", nullptr)))
            {
                return true;
            }
        }
        else if ((m_fn = m_proxy.wasm_runtime_lookup_function(m_module_inst, fn_name.c_str(), nullptr)))
        {
            L_(DEBUG) << "Resolved function \"" << fn_name << "\"";
            return true;
        }

        m_proxy.wasm_runtime_set_exception(m_module_inst, "Resolve entry point function failed");
        return false;
    }


public:
    void raise(const string& msg) { throw(CRunnerException(msg)); }

    ~CRunner()
    {
        if (m_exec_env)
        {
            m_proxy.wasm_runtime_destroy_exec_env(m_exec_env);
        }

        if (m_module_inst)
        {
            m_proxy.wasm_runtime_deinstantiate(m_module_inst);
        }

        if (m_module)
        {
            m_proxy.wasm_runtime_unload(m_module);
        }

        m_proxy.wasm_runtime_destroy();
    }

    explicit CRunner(const CCompartmentLibs *plibs, vector<char>& module_buff, const string& fn_name,
        int64 argc = 0, char* argv[] = nullptr) : m_plibs{ plibs }, m_proxy(plibs, CCompartment::CompartmentId::kCallFuncCompartment, CALL_FUNC_STACK_SIZE, CALL_FUNC_SEAL_ID)
    {
        bool result = setup();

        result = result && load_module(module_buff, argc, argv);

        result = result && instantiate_module();

        result = result && create_exec_env();

        result = result && lookup_function(fn_name);

        if (!result)
        {
            ostringstream ostr;
            ostr << "Errors occurred during setup: " << (m_module_inst ? m_proxy.wasm_runtime_get_exception(m_module_inst) : "<unknown>") << endl;
            raise(ostr.str());
        }
        else
        {
            L_(DEBUG) << "Setup ok";
        }
    }

    bool CallFuncNoReturn(int argc, char* argv[])
    {
        vector<wasm_val_t> args;

        while (argc-- > 0)
        {
            wasm_val_t arg{ WASM_I32, {reinterpret_cast<int32>(stoi(*argv++))} };
            args.push_back(arg);
        }

        L_(ALWAYS) << "CallFuncNoReturn(): args prepared, call wasm_runtime_call_wasm_a()...";

        bool result = m_proxy.wasm_runtime_call_wasm_a(
            m_exec_env,
            m_fn,
            0,
            nullptr,
            args.size(),
            args.data() ? args.data() : nullptr
        );

        if (result)
        {
            L_(ALWAYS) << "wasm_runtime_call_wasm_a() succeeds!";
            return true;
        }
        return false;
    }
};

constexpr size_t CRunner::EXCEPTION_ARR_SIZE;
constexpr size_t CRunner::STACK_SIZE;
constexpr size_t CRunner::HEAP_SIZE;


// Call this to load libs when cap manager starts
static bool lib_load_and_fix(const std::string& libname, CCompartmentLibs*& plibs)
{
    auto rwcap{ Capability(getauxptr(AT_CHERI_EXEC_RW_CAP)) };
    auto fixup_cap{ Capability(getauxptr(AT_CHERI_EXEC_RW_CAP)) };

#if CAPMGR_BUILT_STATIC_ENABLE
    bool load_new = false;  // For static build, the cap mgr has no linkmap so cannot load a new one
#else
    bool load_new = true;
#endif
    plibs = new CCompartmentLibs{ libname, rwcap, fixup_cap, load_new };

    if (Log::Level() == VERBOSE)
    {
        L_(VERBOSE) << "Dump libs phdrs: " << *plibs;
        L_(VERBOSE) << "Dump reloc tables: " << plibs->DumpRelocTables();
    }
    
    L_(DEBUG) << "Do capability relocation fixups...";
    return plibs->DoAllLibCapFixups();
}

// Call this after cap manager ends to restore libs
// @todo: make it part of CCompartmentLibs destructor
static bool lib_restore_and_end(CCompartmentLibs* plibs)
{
#if CAPMGR_BUILT_STATIC_ENABLE
    L_(VERBOSE) << "No action to revert fixups needed for static build";
    return true;
#else

    L_(DEBUG) << "Revert capability relocation fixups...";

    auto result = plibs->DoAllLibCapFixups(false);

    L_(DEBUG) << "Delete the libs and dlclose()";
    delete plibs;
    return result;
#endif
}

int main(int argc, char *argv[])
{
    int exitcode = -1;

    Log::Level() = DEBUG;

    L_(ALWAYS) << endl << argv[0] << " : Starting up...";

    if (argc < 3) {
        L_(ALWAYS) << "Usage: " << argv[0]
            << "<libiwasm.so> <wasm|aot-file> [<fn_to_run_or_default>] [param1 param2 "
            << "param3...]";
        return exitcode;
    }

    string libname{ argv[1] };

    L_(ALWAYS) << "Will load DLL " << libname;

    L_(ALWAYS) << "Loading WASM file \"" << argv[2] << "\"...";
    ifstream fin(argv[2], ios::in | ios::binary | ios::ate);
    if (!fin.good()) {
        L_(ERROR) << "Cannot find file or process it: " << argv[2];
        return exitcode;
    }

    fin.seekg(0, std::ios::end);
    auto sz = fin.tellg();
    fin.seekg(0, std::ios::beg);

    vector<char> buff(sz);

    if (!fin.read(buff.data(), sz)) {
        L_(ERROR) << "Failed to read in WASM file " << argv[2];
        fin.close();
        return exitcode;
    }
    fin.close();

    string fn_name(argc == 3 ? "" : argv[3]);

    try {
        // Do lib fixup
        CCompartmentLibs* plibs = nullptr;
        if (!lib_load_and_fix(libname, plibs))
        {
            return -1;
        }

        L_(DEBUG) << "Lib loaded, WAMR Initialising...";

        // Skip past the prog name, library, loaded file arg and optionally the function arg
        argc-=3, argv+=3;
        if (!fn_name.empty())
            argc--, argv++;

        if (!argc)
            argv = nullptr;

        auto runner = new CRunner{ plibs, buff, fn_name, argc, argv };

        if (runner->CallFuncNoReturn(argc, argv))
        {
            L_(ALWAYS) << "PASSED";
            exitcode = 0;
        }
        else
        {
            L_(ALWAYS) << "FAILED during CallFuncNoReturn()";
        }

        delete runner;

        if (!lib_restore_and_end(plibs))
        {
            return -1;
        }

    } catch (CRunnerException &ex) {
        L_(ERROR) << "Exception while processing: " << ex.what();
    }

    L_(ALWAYS) << "*** End ***" << endl;
    return exitcode;
}

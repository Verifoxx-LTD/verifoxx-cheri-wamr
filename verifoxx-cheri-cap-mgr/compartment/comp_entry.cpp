// Compartment entry in resticted

#include <iostream>
#include <cstdlib>
#include <memory>

#include "../common/comp_common_defs.h"
#include "../common/comp_caller.h"
#include "../common/CCompartmentData.h"

#include "bh_log.h"
#include "wasm_memory.h"

#include "service_call_proxy.h"

// Global CServiceCallProxy ptr which is set to the single CServiceCallProxy on each compartment call
static std::unique_ptr<CServiceCallProxy> g_service_call_proxy;

// Accessor for user classes
CServiceCallProxy *CServiceCallProxy::GetInstance()
{
    return g_service_call_proxy.get();
}

// Call function looks up type of derived class data and then static_cast() to resolve
static uintptr_t CallFunction(CCompartmentData* p)
{
    uintptr_t result{ 0 };

    switch (p->wamr_call_type)
    {
        case WAMRCALL_callwasm:
        {
            auto p_d = static_cast<CWasmCallCompartmentData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_call_wasm_a>(p_d->fp);

            LOG_DEBUG("Calling call_wasm_a");
            result = (uintptr_t)real_fp(p_d->exec_env, p_d->function, p_d->num_results, p_d->results, p_d->num_args, p_d->args);
        }
        break;

        case WAMRCall_callFullInit:
        {
            auto p_d = static_cast<CWasmCallFullInitData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_full_init>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_full_init");
            result = (uintptr_t)real_fp(p_d->init_args);
        }
        break;

        case WAMRCall_callRuntimeLoad:
        {
            auto p_d = static_cast<CWasmCallRuntimeLoadData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_load>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_load");
            result = (uintptr_t)real_fp(p_d->buf, p_d->size, p_d->error_buf, p_d->error_buf_size);
        }
        break;

        case WAMRCall_callRuntimeInstantiate:
        {
            auto p_d = static_cast<CWasmCallRuntimeInstantiateData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_instantiate>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_instantiate");
            result = (uintptr_t)real_fp(p_d->module, p_d->default_stack_size, p_d->host_managed_heap_size,
                p_d->error_buf, p_d->error_buf_size);
        }
        break;

        case WAMRCall_callCreateExecEnv:
        {
            auto p_d = static_cast<CWasmCallRuntimeCreateExecEnvData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_create_exec_env>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_create_exec_env");
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->stack_size);
        }
        break;

        case WAMRCall_callLookupFunction:
        {
            auto p_d = static_cast<CWasmCallRuntimeLookupFunctionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_lookup_function>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_lookup_function");
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->name, p_d->signature);
        }
        break;

        case WAMRCall_callLookupWasiStartFunction:
        {
            auto p_d = static_cast<CWasmCallRuntimeLookupWasiStartFunctionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_lookup_wasi_start_function>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_lookup_wasi_start_function");
            result = (uintptr_t)real_fp(p_d->module_inst);
        }
        break;

        case WAMRCall_callLogSetVerboseLevel:
        {
            auto p_d = static_cast<CWasmCallLogSetVerboseLevelData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_bh_log_set_verbose_level>(p_d->fp);

            LOG_DEBUG("Calling bh_log_set_verbose_level");
            real_fp(p_d->level);
        }
        break;

        case WAMRCall_callSetWasiArgs:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetWasiArgsData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_wasi_args>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_set_wasi_args");
            real_fp(p_d->module,
                p_d->dir_list, p_d->dir_count,
                p_d->map_dir_list, p_d->map_dir_count,
                p_d->env, p_d->env_count,
                p_d->argv, p_d->argc);
        }
        break;

        case WAMRCall_callSetWasiAddrPool:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetWasiAddrPoolData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_wasi_addr_pool>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_set_wasi_addr_pool");
            real_fp(p_d->module,
                p_d->addr_pool, p_d->addr_pool_size
            );
        }
        break;

        case WAMRCall_callSetWasiNsPool:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetWasiNsLookupPoolData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_wasi_ns_lookup_pool>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_set_wasi_ns_lookup_pool");
            real_fp(p_d->module, p_d->ns_lookup_pool, p_d->ns_lookup_pool_size);
        }
        break;

        case WAMRCall_callSetException:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetExceptionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_exception>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_set_exception");
            real_fp(p_d->module_inst, p_d->exception);
        }
        break;

        case WAMRCall_callGetException:
        {
            auto p_d = static_cast<CWasmCallRuntimeGetExceptionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_get_exception>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_set_exception");
            result = (uintptr_t)real_fp(p_d->module_inst);
        }
        break;

        case WAMRCall_callDestroyExecEnv:
        {
            auto p_d = static_cast<CWasmCallRuntimeDestroyExecEnvData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_destroy_exec_env>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_destroy_exec_env");
            real_fp(p_d->exec_env);
        }
        break;

        case WAMRCall_callDesinstantiate:
        {
            auto p_d = static_cast<CWasmCallRuntimeDeInstantiateData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_deinstantiate>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_deinstantiate");
            real_fp(p_d->module_inst);
        }
        break;
        
        case WAMRCall_callUnload:
        {
            auto p_d = static_cast<CWasmCallRuntimeUnloadData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_unload>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_unload");
            real_fp(p_d->module);

        }
        break;

        case WAMRCall_callDestroy:
        {
            auto p_d = static_cast<CWasmCallRuntimeDestroy*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_destroy>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_destroy");
            real_fp();
        }
        break;

        case WAMRCall_callExecuteMain:
        {
            auto p_d = static_cast<CWasmCallExecuteMainData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_application_execute_main>(p_d->fp);

            LOG_DEBUG("Calling wasm_application_execute_main");
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->argc, p_d->argv);
        }
        break;

        case WAMRCall_callExecuteFunc:
        {
            auto p_d = static_cast<CWasmCallExecuteFuncData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_application_execute_func>(p_d->fp);

            LOG_DEBUG("Calling wasm_application_execute_func");
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->name, p_d->argc, p_d->argv);
        }
        break;

        case WAMRCall_callGetVersion:
        {
            auto p_d = static_cast<CWasmCallGetVersionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_get_version>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_get_version");
            real_fp(p_d->major, p_d->minor, p_d->patch);
        }
        break;

        case WAMRCall_callIsXipFile:
        {
            auto p_d = static_cast<CWasmCallIsXipFileData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_is_xip_file>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_is_xip_file");
            result = (uintptr_t)real_fp(p_d->buf, p_d->size);
        }
        break;

        case WAMRCall_callGetWasiExitCode:
        {
            auto p_d = static_cast<CWasmCallGetWasiExitCodeData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_get_wasi_exit_code>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_get_wasi_exit_code");
            result = (uintptr_t)real_fp(p_d->module_inst);
        }
        break;

        case WAMRCall_callRegisterNatives:
        {
            auto p_d = static_cast<CWasmCallRegisterNativesData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_register_natives>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_register_natives");
            result = (uintptr_t)real_fp(p_d->module_name, p_d->native_symbols, p_d->n_native_symbols);
        }
        break;

        case WAMRCall_callUnregisterNatives:
        {
            auto p_d = static_cast<CWasmCallUnregisterNativesData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_unregister_natives>(p_d->fp);

            LOG_DEBUG("Calling wasm_runtime_unregister_natives");
            result = (uintptr_t)real_fp(p_d->module_name, p_d->native_symbols);
        }
        break;

        default:
        {
            LOG_ERROR("Failed to call WAMR function - unsupported function");
        }
        break;
    }
    LOG_DEBUG("\tWAMR function call returned");
    return result;
}

// CompartmentUnwrap: Given pointer to the data table
extern "C" void CompartmentUnwrap(void* comp_data_object)
{
    LOG_DEBUG("--> COMPARTMENT ENTRY -->");

    CCompartmentData *comp_fn_data = reinterpret_cast<CCompartmentData*>(comp_data_object);

    // Create the service call proxy
    g_service_call_proxy = std::make_unique<CServiceCallProxy>(comp_fn_data);

    LOG_VERBOSE("Dump capabilities from capability manager:\n"
        "\t\tCapMgr return FP=%#p\n"
        "\t\tWAMR Fn to call FP=%#p\n"
        "\t\tService Callback Entry FP=%#p\n"
        "\t\tService Callback Handler FP=%#p\n"
        "\t\tService Callback FP LUT=%#p\n"
        "\t\tSealer Capability=%#p",
        comp_fn_data->comp_exit_fp,
        comp_fn_data->fp,
        comp_fn_data->service_callback_entry_fp,
        comp_fn_data->capmgr_service_fp,
        (void*)comp_fn_data->service_func_table,
        comp_fn_data->sealer_cap);

    // Get compartment data to call implementation specific function
    uintptr_t retval = CallFunction(comp_fn_data);

    g_service_call_proxy.release(); // Cleanup, proxy no longer needed

    // Call compartment return passing our exit function pointer
    CompartmentReturn(comp_fn_data->comp_exit_fp, retval);
}

extern "C" void CompartmentReturn(CompExitAsmFnPtr fp, uintptr_t return_arg)
{
    // Compartment calls fp to return, pass back return_arg as argument
    LOG_DEBUG("<-- COMPARTMENT EXIT <--");

    fp(return_arg);
    __builtin_unreachable();
}

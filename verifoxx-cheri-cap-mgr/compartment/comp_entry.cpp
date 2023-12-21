// Compartment entry in resticted

#include <iostream>

#include "../common/comp_common_defs.h"
#include "../common/CCompartmentData.h"

#include "bh_log.h"
#include "wasm_memory.h"

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

            std::cout << "Calling call_wasm_a" << std::endl;
            result = (uintptr_t)real_fp(p_d->exec_env, p_d->function, p_d->num_results, p_d->results, p_d->num_args, p_d->args);
        }
        break;

        case WAMRCall_callFullInit:
        {
            auto p_d = static_cast<CWasmCallFullInitData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_full_init>(p_d->fp);

            std::cout << "Calling wasm_runtime_full_init" << std::endl;
            result = (uintptr_t)real_fp(p_d->init_args);
        }
        break;

        case WAMRCall_callRuntimeLoad:
        {
            auto p_d = static_cast<CWasmCallRuntimeLoadData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_load>(p_d->fp);

            std::cout << "Calling wasm_runtime_load" << std::endl;
            result = (uintptr_t)real_fp(p_d->buf, p_d->size, p_d->error_buf, p_d->error_buf_size);
        }
        break;

        case WAMRCall_callRuntimeInstantiate:
        {
            auto p_d = static_cast<CWasmCallRuntimeInstantiateData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_instantiate>(p_d->fp);

            std::cout << "Calling wasm_runtime_instantiate" << std::endl;
            result = (uintptr_t)real_fp(p_d->module, p_d->default_stack_size, p_d->host_managed_heap_size,
                p_d->error_buf, p_d->error_buf_size);
        }
        break;

        case WAMRCall_callCreateExecEnv:
        {
            auto p_d = static_cast<CWasmCallRuntimeCreateExecEnvData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_create_exec_env>(p_d->fp);

            std::cout << "Calling wasm_runtime_create_exec_env" << std::endl;
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->stack_size);
        }
        break;

        case WAMRCall_callLookupFunction:
        {
            auto p_d = static_cast<CWasmCallRuntimeLookupFunctionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_lookup_function>(p_d->fp);

            std::cout << "Calling wasm_runtime_lookup_function" << std::endl;
            result = (uintptr_t)real_fp(p_d->module_inst, p_d->name, p_d->signature);
        }
        break;

        case WAMRCall_callLookupWasiStartFunction:
        {
            auto p_d = static_cast<CWasmCallRuntimeLookupWasiStartFunctionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_lookup_wasi_start_function>(p_d->fp);

            std::cout << "Calling wasm_runtime_lookup_wasi_start_function" << std::endl;
            result = (uintptr_t)real_fp(p_d->module_inst);
        }
        break;

        case WAMRCall_callLogSetVerboseLevel:
        {
            auto p_d = static_cast<CWasmCallLogSetVerboseLevelData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_bh_log_set_verbose_level>(p_d->fp);

            std::cout << "Calling bh_log_set_verbose_level" << std::endl;
            real_fp(p_d->level);
        }
        break;

        case WAMRCall_callSetWasiArgs:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetWasiArgsData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_wasi_args>(p_d->fp);

            std::cout << "Calling wasm_runtime_set_wasi_args" << std::endl;
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

            std::cout << "Calling wasm_runtime_set_wasi_addr_pool" << std::endl;
            real_fp(p_d->module,
                p_d->addr_pool, p_d->addr_pool_size
            );
        }
        break;

        case WAMRCall_callSetWasiNsPool:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetWasiNsLookupPoolData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_wasi_ns_lookup_pool>(p_d->fp);

            std::cout << "Calling wasm_runtime_set_wasi_ns_lookup_pool" << std::endl;
            real_fp(p_d->module, p_d->ns_lookup_pool, p_d->ns_lookup_pool_size);
        }
        break;

        case WAMRCall_callSetException:
        {
            auto p_d = static_cast<CWasmCallRuntimeSetExceptionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_set_exception>(p_d->fp);

            std::cout << "Calling wasm_runtime_set_exception" << std::endl;
            real_fp(p_d->module_inst, p_d->exception);
        }
        break;

        case WAMRCall_callGetException:
        {
            auto p_d = static_cast<CWasmCallRuntimeGetExceptionData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_get_exception>(p_d->fp);

            std::cout << "Calling wasm_runtime_set_exception" << std::endl;
            result = (uintptr_t)real_fp(p_d->module_inst);
        }
        break;

        case WAMRCall_callDestroyExecEnv:
        {
            auto p_d = static_cast<CWasmCallRuntimeDestroyExecEnvData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_destroy_exec_env>(p_d->fp);

            std::cout << "Calling wasm_runtime_destroy_exec_env" << std::endl;
            real_fp(p_d->exec_env);
        }
        break;

        case WAMRCall_callDesinstantiate:
        {
            auto p_d = static_cast<CWasmCallRuntimeDeInstantiateData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_deinstantiate>(p_d->fp);

            std::cout << "Calling wasm_runtime_deinstantiate" << std::endl;
            real_fp(p_d->module_inst);
        }
        break;
        
        case WAMRCall_callUnload:
        {
            auto p_d = static_cast<CWasmCallRuntimeUnloadData*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_unload>(p_d->fp);

            std::cout << "Calling wasm_runtime_unload" << std::endl;
            real_fp(p_d->module);

        }
        break;

        case WAMRCall_callDestroy:
        {
            auto p_d = static_cast<CWasmCallRuntimeDestroy*>(p);
            auto real_fp = reinterpret_cast<FnPtr_wasm_runtime_destroy>(p_d->fp);

            std::cout << "Calling wasm_runtime_destroy" << std::endl;
            real_fp();
        }
        break;

        default:
        {
            std::cout << "Failed to call WAMR function - unsupported function" << std::endl;
        }
        break;
    }
    std::cout << "WAMR function returns" << std::endl;
    return result;
}

// CompartmentUnwrap: Given pointer to the data table
// To Do: This needs to figure out what it needs to call in future, not hard coded
extern "C" void CompartmentUnwrap(void* comp_data_object)
{
    CCompartmentData *comp_fn_data = reinterpret_cast<CCompartmentData*>(comp_data_object);

    std::cout << "Call WAMR function in compartment" << std::endl;

    // Get compartment data to call implementation specific function
    uintptr_t retval = CallFunction(comp_fn_data);
    std::cout << "Result from WAMR function compartment call: " << (bool)retval << std::endl;

    // Call compartment return passing our exit function pointer
    CompartmentReturn(comp_fn_data->comp_exit_fp, retval);
}

extern "C" void CompartmentReturn(CompExitAsmFnPtr fp, uintptr_t return_arg)
{
    // Compartment calls fp to return, pass back return_arg as argument
    fp(return_arg);
}

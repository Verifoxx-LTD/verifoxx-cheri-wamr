// CWamrProxy: Proxy calls which use compartment

#ifndef _CWAMRPROXY_H__
#define _CWAMRPROXY_H__

#include <string>
#include <memory>

#include "wasm_c_api.h"
#include "wasm_runtime_common.h"
#include "CCompartment.h"
#include "common/comp_common_defs.h"
#include "common/CCompartmentData.h"

class CWamrProxy
{
    CCompartment m_compartment;

public:
    CWamrProxy(const CCompartmentLibs* comp_libs, CCompartment::CompartmentId id, uint32_t stack_size, uint32_t seal_id)
        : m_compartment(comp_libs, id, stack_size, seal_id) {}

    template <typename T, typename... Args>
    uintptr_t CallWamrFn(const std::string& fn_name, Args&&... args)
    {
        return m_compartment.CallCompartmentFunction(fn_name,
            std::make_shared<T>(std::forward<Args>(args)...)
        );
    }

    void bh_log_set_verbose_level(uint32_t level)
    {
        CallWamrFn<CWasmCallLogSetVerboseLevelData>(__func__, level);
    }

    void wasm_runtime_set_exception(wasm_module_inst_t module_inst, const char* exception)
    {
        CallWamrFn<CWasmCallRuntimeSetExceptionData>(__func__, module_inst, exception);
    }

    const char *wasm_runtime_get_exception(wasm_module_inst_t module_inst)
    {
        return (const char*)CallWamrFn<CWasmCallRuntimeGetExceptionData>(__func__, module_inst);
    }

    wasm_function_inst_t wasm_runtime_lookup_wasi_start_function(wasm_module_inst_t module_inst)
    {
        return (wasm_function_inst_t)CallWamrFn<CWasmCallRuntimeLookupWasiStartFunctionData>(__func__, module_inst);
    }

    void wasm_runtime_set_wasi_args(wasm_module_t module,
        const char* dir_list[], uint32_t dir_count,
        const char* map_dir_list[], uint32_t map_dir_count,
        const char* env[], uint32_t env_count,
        char* argv[], int argc)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiArgsData>(__func__, module, dir_list, dir_count,
            map_dir_list, map_dir_count, env, env_count, argv, argc);
    }

    void wasm_runtime_set_wasi_addr_pool(wasm_module_t module, const char* addr_pool[],
        uint32_t addr_pool_size)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiAddrPoolData>(__func__, module, addr_pool, addr_pool_size);
    }


    void wasm_runtime_set_wasi_ns_lookup_pool(wasm_module_t module, const char* ns_lookup_pool[],
        uint32_t ns_lookup_pool_size)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiNsLookupPoolData>(__func__, module, ns_lookup_pool, ns_lookup_pool_size);
    }


    void wasm_runtime_destroy_exec_env(wasm_exec_env_t exec_env)
    {
        CallWamrFn<CWasmCallRuntimeDestroyExecEnvData>(__func__, exec_env);
    }

    void wasm_runtime_deinstantiate(wasm_module_inst_t module_inst)
    {
        CallWamrFn<CWasmCallRuntimeDeInstantiateData>(__func__, module_inst);
    }

    void wasm_runtime_destroy()
    {
        CallWamrFn<CWasmCallRuntimeDestroy>(__func__);
    }
    
    void wasm_runtime_unload(wasm_module_t module)
    {
        CallWamrFn<CWasmCallRuntimeUnloadData>(__func__, module);
    }

    bool wasm_runtime_full_init(RuntimeInitArgs* init_args)
    {
        return (bool)CallWamrFn<CWasmCallFullInitData>(__func__, init_args);
    }

    wasm_module_t wasm_runtime_load(uint8_t* buf, uint32_t size,
        char* error_buf, uint32_t error_buf_size)
    {
        return (wasm_module_t)CallWamrFn<CWasmCallRuntimeLoadData>(__func__, buf, size,
            error_buf, error_buf_size);
    }

    wasm_module_inst_t wasm_runtime_instantiate(const wasm_module_t module,
        uint32_t default_stack_size, uint32_t host_managed_heap_size,
        char* error_buf, uint32_t error_buf_size)
    {
        return (wasm_module_inst_t)CallWamrFn<CWasmCallRuntimeInstantiateData>(__func__,
            module, default_stack_size, host_managed_heap_size,
            error_buf, error_buf_size);
    }

    wasm_exec_env_t wasm_runtime_create_exec_env(wasm_module_inst_t module_inst,
        uint32_t stack_size)
    {
        return (wasm_exec_env_t)CallWamrFn<CWasmCallRuntimeCreateExecEnvData>(__func__, module_inst, stack_size);
    }


    wasm_function_inst_t wasm_runtime_lookup_function(wasm_module_inst_t const module_inst,
        const char* name, const char* signature)
    {
        return (wasm_function_inst_t)CallWamrFn<CWasmCallRuntimeLookupFunctionData>(__func__, module_inst, name, signature);
    }

    bool wasm_runtime_call_wasm_a(WASMExecEnv* exec_env,
        WASMFunctionInstanceCommon* function,
        uint32 num_results, wasm_val_t results[],
        uint32 num_args, wasm_val_t args[])
    {
        return (bool)CallWamrFn<CWasmCallCompartmentData>(__func__, exec_env, function, num_results, results, num_args, args);
    }

};

#endif /* _CWAMRPROXY_H__ */

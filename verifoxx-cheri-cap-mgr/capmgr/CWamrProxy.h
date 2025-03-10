// CWamrProxy: Proxy calls which use compartment

#ifndef _CWAMRPROXY_H__
#define _CWAMRPROXY_H__

// Sanity check on build flags
#if !ENABLE_CHERI_PURECAP || !ENABLE_CHERI_CAPMGR || ENABLE_CHERI_COMPARTMENT
#error "Bad make definitions; capability manager must have ENABLE_CHERI_PURECAP=1, ENABLE_CHERI_CAPMGR=1 and ENABLE_CHERI_COMPARTMEMT=0"
#endif

#include <string>
#include <memory>

#include "wasm_c_api.h"
#include "wasm_runtime_common.h"
#include "CCompartment.h"
#include "comp_common_defs.h"
#include "CCompartmentData.h"

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

    template <typename... Args>
    void bh_log_set_verbose_level(Args&&... args)
    {
        CallWamrFn<CWasmCallLogSetVerboseLevelData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_set_exception(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeSetExceptionData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    const char *wasm_runtime_get_exception(Args&&... args)
    {
        return (const char*)CallWamrFn<CWasmCallRuntimeGetExceptionData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    wasm_function_inst_t wasm_runtime_lookup_wasi_start_function(Args&&... args)
    {
        return (wasm_function_inst_t)CallWamrFn<CWasmCallRuntimeLookupWasiStartFunctionData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_set_wasi_args(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiArgsData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_set_wasi_addr_pool(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiAddrPoolData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_set_wasi_ns_lookup_pool(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeSetWasiNsLookupPoolData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_destroy_exec_env(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeDestroyExecEnvData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_deinstantiate(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeDeInstantiateData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_destroy(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeDestroy>(__func__, std::forward<Args>(args)...);
    }
    
    template <typename... Args>
    void wasm_runtime_unload(Args&&... args)
    {
        CallWamrFn<CWasmCallRuntimeUnloadData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_runtime_full_init(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallFullInitData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    wasm_module_t wasm_runtime_load(Args&&... args)
    {
        return (wasm_module_t)CallWamrFn<CWasmCallRuntimeLoadData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    wasm_module_inst_t wasm_runtime_instantiate(Args&&... args)
    {
        return (wasm_module_inst_t)CallWamrFn<CWasmCallRuntimeInstantiateData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    wasm_exec_env_t wasm_runtime_create_exec_env(Args&&... args)
    {
        return (wasm_exec_env_t)CallWamrFn<CWasmCallRuntimeCreateExecEnvData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    wasm_function_inst_t wasm_runtime_lookup_function(Args&&... args)
    {
        return (wasm_function_inst_t)CallWamrFn<CWasmCallRuntimeLookupFunctionData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_runtime_call_wasm_a(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallCompartmentData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_application_execute_main(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallExecuteMainData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_application_execute_func(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallExecuteFuncData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void wasm_runtime_get_version(Args&&... args)
    {
        CallWamrFn<CWasmCallGetVersionData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_runtime_is_xip_file(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallIsXipFileData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    uint32_t wasm_runtime_get_wasi_exit_code(Args&&... args)
    {
        return (uint32_t)CallWamrFn<CWasmCallGetWasiExitCodeData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_runtime_register_natives(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallRegisterNativesData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    bool wasm_runtime_unregister_natives(Args&&... args)
    {
        return (bool)CallWamrFn<CWasmCallUnregisterNativesData>(__func__, std::forward<Args>(args)...);
    }
};

#endif /* _CWAMRPROXY_H__ */


// CompartmentData classes are used to transfer the arguments for functions to call in the compartment.

#ifndef _COMPARTMENT_DATA_H__
#define _COMPARTMENT_DATA_H__

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "wasm.h"
#include "wasm_runtime_common.h"
#include "comp_common_defs.h"

// WAMR Fn Call type - not a C++ enum
typedef enum
{
    WAMRCALL_callwasm,
    WAMRCall_callFullInit,
    WAMRCall_callRuntimeLoad,
    WAMRCall_callRuntimeInstantiate,
    WAMRCall_callCreateExecEnv,
    WAMRCall_callLookupFunction,
    WAMRCall_callLookupWasiStartFunction,
    WAMRCall_callLogSetVerboseLevel,
    WAMRCall_callSetWasiArgs,
    WAMRCall_callSetWasiAddrPool,
    WAMRCall_callSetWasiNsPool,
    WAMRCall_callSetException,
    WAMRCall_callGetException,
    WAMRCall_callDestroyExecEnv,
    WAMRCall_callDesinstantiate,
    WAMRCall_callUnload,
    WAMRCall_callDestroy
} WamrCall_t;

// Base class for any WAMR function data
// Contains needed function pointers and a dervied type ID to determine which underlying function to call
class alignas(__BIGGEST_ALIGNMENT__) CCompartmentData
{
public:
    CompExitAsmFnPtr comp_exit_fp;   // Function pointer to the return function in the cap manager
    void* fp;                        // Function pointer to the WASM function to call
    WamrCall_t       wamr_call_type;    // Which derived class it is

public:
    CCompartmentData(WamrCall_t call_type) : wamr_call_type(call_type), comp_exit_fp(nullptr), fp(nullptr) {}
    virtual ~CCompartmentData() {}
};

// Params for the call wasm function
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallCompartmentData : public CCompartmentData
{
public:
    WASMExecEnv* exec_env;
    WASMFunctionInstanceCommon* function;
    uint32 num_results;
    wasm_val_t* results;
    uint32 num_args;
    wasm_val_t* args;

public:
    CWasmCallCompartmentData(
        WASMExecEnv* exec_env_,
        WASMFunctionInstanceCommon* function_,
        uint32 num_results_,
        wasm_val_t* results_,
        uint32 num_args_,
        wasm_val_t* args_
    ) : CCompartmentData(WAMRCALL_callwasm), exec_env(exec_env_), function(function_), num_results(num_results_),
        results(results_), num_args(num_args_), args(args_) {}

};

// Params for wasm_runtime_fill_init()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallFullInitData : public CCompartmentData
{
public:
    RuntimeInitArgs* init_args;

public:
    CWasmCallFullInitData(
        RuntimeInitArgs* init_args_
    ) : CCompartmentData(WAMRCall_callFullInit), init_args(init_args_) {}

};

// Params for wasm_runtime_load()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeLoadData : public CCompartmentData
{
public:
    uint8_t* buf;
    uint32_t size;
    char* error_buf;
    uint32_t error_buf_size;

public:
    CWasmCallRuntimeLoadData(
        uint8_t* buf_,
        uint32_t size_,
        char* error_buf_,
        uint32_t error_buf_size_
        ) : CCompartmentData(WAMRCall_callRuntimeLoad), buf(buf_), size(size_), error_buf(error_buf_), error_buf_size(error_buf_size_) {}
};

// Params for wasm_runtime_instantiate()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeInstantiateData : public CCompartmentData
{
public:
    const wasm_module_t module;
    uint32_t default_stack_size;
    uint32_t host_managed_heap_size;
    char* error_buf;
    uint32_t error_buf_size;

public:
    CWasmCallRuntimeInstantiateData(
        const wasm_module_t module_,
        uint32_t default_stack_size_,
        uint32_t host_managed_heap_size_,
        char* error_buf_,
        uint32_t error_buf_size_
    ) : CCompartmentData(WAMRCall_callRuntimeInstantiate),
        module(module_),
        default_stack_size(default_stack_size_),
        host_managed_heap_size(host_managed_heap_size_),
        error_buf(error_buf_),
        error_buf_size(error_buf_size_)
    {}
};

// Params for wasm_runtime_create_exec_env()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeCreateExecEnvData : public CCompartmentData
{
public:
    wasm_module_inst_t module_inst;
    uint32_t stack_size;

public:
    CWasmCallRuntimeCreateExecEnvData(
        wasm_module_inst_t module_inst_,
        uint32_t stack_size_
    ) : CCompartmentData(WAMRCall_callCreateExecEnv),
        module_inst(module_inst_),
        stack_size(stack_size_)
    {}
};

// Params for wasm_runtime_lookup_function()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeLookupFunctionData : public CCompartmentData
{
public:
    wasm_module_inst_t const module_inst;
    const char* name;
    const char* signature;

public:
    CWasmCallRuntimeLookupFunctionData(
        wasm_module_inst_t const module_inst_,
        const char* name_,
        const char* signature_
    ) : CCompartmentData(WAMRCall_callLookupFunction),
        module_inst(module_inst_),
        name(name_),
        signature(signature_)
    {}
};

// Params for wasm_runtime_destroy_exec_env()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeDestroyExecEnvData : public CCompartmentData
{
public:
    wasm_exec_env_t exec_env;

public:
    CWasmCallRuntimeDestroyExecEnvData(
        wasm_exec_env_t exec_env_
    ) : CCompartmentData(WAMRCall_callDestroyExecEnv),
        exec_env(exec_env_)
    {}
};

// Params for wasm_runtime_deinstantiate()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeDeInstantiateData : public CCompartmentData
{
public:
    wasm_module_inst_t module_inst;

public:
    CWasmCallRuntimeDeInstantiateData(
        wasm_module_inst_t module_inst_
    ) : CCompartmentData(WAMRCall_callDesinstantiate),
        module_inst(module_inst_)
    {}
};

// Params for wasm_runtime_unload()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeUnloadData : public CCompartmentData
{
public:
    wasm_module_t module;

public:
    CWasmCallRuntimeUnloadData(
        wasm_module_t module_
    ) : CCompartmentData(WAMRCall_callUnload),
        module(module_)
    {}
};

// Params for wasm_runtime_destroy()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeDestroy : public CCompartmentData
{
public:
    CWasmCallRuntimeDestroy() : CCompartmentData(WAMRCall_callDestroy) {}
};

// Params for wasm_runtime_lookup_wasi_start_function()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeLookupWasiStartFunctionData : public CCompartmentData
{
public:
    wasm_module_inst_t module_inst;

public:
    CWasmCallRuntimeLookupWasiStartFunctionData(
        wasm_module_inst_t module_inst_
    ) : CCompartmentData(WAMRCall_callLookupWasiStartFunction),
        module_inst(module_inst_)
    {}
};

// Params for wasm_runtime_set_wasi_args()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeSetWasiArgsData : public CCompartmentData
{
public:
    wasm_module_t module;
    const char **dir_list;
    uint32_t dir_count;
    const char **map_dir_list;
    uint32_t map_dir_count;
    const char **env;
    uint32_t env_count;
    char **argv;
    int argc;

public:
    CWasmCallRuntimeSetWasiArgsData(
        wasm_module_t module_,
        const char* dir_list_[],
        uint32_t dir_count_,
        const char* map_dir_list_[],
        uint32_t map_dir_count_,
        const char* env_[],
        uint32_t env_count_,
        char* argv_[],
        int argc_
    ) : CCompartmentData(WAMRCall_callSetWasiArgs),
        module(module_),
        dir_list(dir_list_),
        dir_count(dir_count_),
        map_dir_list(map_dir_list_),
        map_dir_count(map_dir_count_),
        env(env_),
        env_count(env_count_),
        argv(argv_),
        argc(argc_)
    {}
};

// Params for wasm_runtime_set_wasi_addr_pool()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeSetWasiAddrPoolData : public CCompartmentData
{
public:
    wasm_module_t module;
    const char** addr_pool;
    uint32_t addr_pool_size;
public:
    CWasmCallRuntimeSetWasiAddrPoolData(
        wasm_module_t module_,
        const char* addr_pool_[],
        uint32_t addr_pool_size_
    ) : CCompartmentData(WAMRCall_callSetWasiAddrPool),
        module(module_),
        addr_pool(addr_pool_),
        addr_pool_size(addr_pool_size_)
    {}
};

// Params for wasm_runtime_set_wasi_ns_lookup_pool()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeSetWasiNsLookupPoolData : public CCompartmentData
{
public:
    wasm_module_t module;
    const char** ns_lookup_pool;
    uint32_t ns_lookup_pool_size;
public:
    CWasmCallRuntimeSetWasiNsLookupPoolData(
        wasm_module_t module_,
        const char* ns_lookup_pool_[],
        uint32_t ns_lookup_pool_size_
    ) : CCompartmentData(WAMRCall_callSetWasiNsPool),
        module(module_),
        ns_lookup_pool(ns_lookup_pool_),
        ns_lookup_pool_size(ns_lookup_pool_size_)
    {}
};

// Params for wasm_runtime_set_exception()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeSetExceptionData : public CCompartmentData
{
public:
    wasm_module_inst_t module_inst;
    const char* exception;
public:
    CWasmCallRuntimeSetExceptionData(
        wasm_module_inst_t module_inst_,
        const char* exception_
    ) : CCompartmentData(WAMRCall_callSetException),
        module_inst(module_inst_),
        exception(exception_)
    {}
};

// Params for wasm_runtime_get_exception()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallRuntimeGetExceptionData : public CCompartmentData
{
public:
    wasm_module_inst_t module_inst;
public:
    CWasmCallRuntimeGetExceptionData(
        wasm_module_inst_t module_inst_
    ) : CCompartmentData(WAMRCall_callGetException),
        module_inst(module_inst_)
    {}
};

// Params for bh_log_set_verbose_level()
class alignas(__BIGGEST_ALIGNMENT__) CWasmCallLogSetVerboseLevelData : public CCompartmentData
{
public:
    uint32_t level;
public:
    CWasmCallLogSetVerboseLevelData(
        uint32_t level_
    ) : CCompartmentData(WAMRCall_callLogSetVerboseLevel),
        level(level_)
    {}
};

#endif /* _COMPARTMENT_DATA_H__ */

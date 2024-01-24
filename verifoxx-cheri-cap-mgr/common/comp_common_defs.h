// Common definitions needed by compartments and the capability manager

#ifndef _COMP_COMMON_H__
#define _COMP_COMMON_H__

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "wasm.h"
#include "wasm_runtime_common.h"
#include "comp_common_asm.h"

#ifdef __cplusplus
extern "C"
{
#endif
    /* Fn Ptr for the unwrap function */
    typedef void(*CompUnwrapFnPtr)(void*);

    /* Fn Ptr for the callback service function */
    typedef uintptr_t(*CompServiceCallbackFnPtr)(void*);

    /* Function pointer typedefs for all WAMR functions called from capability manager
    * C not C++ typedefs
    */
    typedef bool(*FnPtr_wasm_runtime_call_wasm_a)(WASMExecEnv*,
        WASMFunctionInstanceCommon*,
        uint32, wasm_val_t*,
        uint32, wasm_val_t*);

    typedef bool(*FnPtr_wasm_runtime_full_init)(RuntimeInitArgs* init_args);

    typedef wasm_module_t(*FnPtr_wasm_runtime_load)(uint8_t* buf, uint32_t size,
            char* error_buf, uint32_t error_buf_size);

    typedef wasm_module_inst_t(*FnPtr_wasm_runtime_instantiate)(const wasm_module_t module,
        uint32_t default_stack_size, uint32_t host_managed_heap_size,
        char* error_buf, uint32_t error_buf_size);

    typedef wasm_exec_env_t(*FnPtr_wasm_runtime_create_exec_env)(wasm_module_inst_t module_inst,
        uint32_t stack_size);

    typedef wasm_function_inst_t(*FnPtr_wasm_runtime_lookup_function)(wasm_module_inst_t const module_inst,
        const char* name, const char* signature);

    typedef void(*FnPtr_bh_log_set_verbose_level)(uint32 level);
    typedef void(*FnPtr_wasm_runtime_set_exception)(wasm_module_inst_t module_inst, const char* exception);
    typedef const char *(*FnPtr_wasm_runtime_get_exception)(wasm_module_inst_t module_inst);

    typedef wasm_function_inst_t(*FnPtr_wasm_runtime_lookup_wasi_start_function)(wasm_module_inst_t module_inst);
    typedef void(*FnPtr_wasm_runtime_set_wasi_args)(wasm_module_t module,
        const char* dir_list[], uint32_t dir_count,
        const char* map_dir_list[], uint32_t map_dir_count,
        const char* env[], uint32_t env_count,
        char* argv[], int argc);

    typedef void(*FnPtr_wasm_runtime_set_wasi_addr_pool)(wasm_module_t module, const char* addr_pool[],
        uint32_t addr_pool_size);

    typedef void(*FnPtr_wasm_runtime_set_wasi_ns_lookup_pool)(wasm_module_t module, const char* ns_lookup_pool[],
        uint32_t ns_lookup_pool_size);

    typedef void(*FnPtr_wasm_runtime_destroy_exec_env)(wasm_exec_env_t exec_env);
    typedef void(*FnPtr_wasm_runtime_deinstantiate)(wasm_module_inst_t module_inst);
    typedef void(*FnPtr_wasm_runtime_unload)(wasm_module_t module);
    typedef void(*FnPtr_wasm_runtime_destroy)();

    // Declare the initial function in the compartment
    void CompartmentUnwrap(void* comp_data_table);

    // Declare the return function in the compartment
    void CompartmentReturn(CompExitAsmFnPtr fp, uintptr_t return_arg);

    // Declare the service callback function in the compartment
    uintptr_t CompartmentServiceCallback(void* comp_data_ptr_void, void* args_data);

#ifdef __cplusplus
}
#endif

#endif /* _COMP_COMMON_H__ */


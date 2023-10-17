// Common definitions needed by compartments and the capability manager

#ifndef _COMP_COMMON_H__
#define _COMP_COMMON_H__

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "wasm.h"
#include "wasm_runtime_common.h"
#include "common/comp_common_asm.h"

#ifdef __cplusplus
extern "C"
{
#endif
    // Fn pointer for compartment entry fn which is a C function
    typedef void(*CompUnwrapFnPtr)(void*);

    // Fn pointer for the target WASM function
    typedef bool(*FnPtr_wasm_runtime_call_wasm_a)(WASMExecEnv*,
        WASMFunctionInstanceCommon*,
        uint32, wasm_val_t*,
        uint32, wasm_val_t*);

    // Declare the initial function in the compartment
    void CompartmentUnwrap(void* comp_data_table);

    // Declare the return function in the compartment
    void CompartmentReturn(CompExitAsmFnPtr fp, uintptr_t return_arg);

    // The test
    uint32_t do_add_test(uint32_t a, uint32_t b);

    // "packed" params for the call wasm compartment
    struct CompartmentWasmCall_t
    {
        FnPtr_wasm_runtime_call_wasm_a fp;
        WASMExecEnv* exec_env;
        WASMFunctionInstanceCommon* function;
        uint32 num_results;
        wasm_val_t* results;
        uint32 num_args;
        wasm_val_t* args;
        CompExitAsmFnPtr comp_exit_fp;   // Function pointer to the return function
    } __attribute__((aligned(__BIGGEST_ALIGNMENT__)));


#ifdef __cplusplus
}
#endif

#endif /* _COMP_COMMON_H__ */


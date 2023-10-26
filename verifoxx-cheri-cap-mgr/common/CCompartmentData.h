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
    WAMRCall_callInit
} WamrCall_t;

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

#endif /* _COMPARTMENT_DATA_H__ */



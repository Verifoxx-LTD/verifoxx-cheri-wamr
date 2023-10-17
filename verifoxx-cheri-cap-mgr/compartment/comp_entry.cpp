// Compartment entry in resticted

#include <iostream>

#include "../common/comp_common_defs.h"

#if 0
typedef uint32_t(*TestFnPtr)(uint32_t, uint32_t);

// Function which we will call be pointer (testing a global)
extern "C" uint32_t do_add_test(uint32_t a, uint32_t b)
{
    std::cout << "Doing do_add_test(" << a << ", " << b << ")" << std::endl;
    return a + b;
}

extern "C" volatile const uint64_t kConstTest = 5;
extern "C" volatile TestFnPtr pfn = do_add_test;
#endif
#include "bh_log.h"
#include "wasm_memory.h"

// CompartmentUnwrap: Given pointer to the data table
// To Do: This needs to figure out what it needs to call in future, not hard coded
extern "C" void CompartmentUnwrap(void* comp_data_table)
{
    struct CompartmentWasmCall_t* ptr_table = reinterpret_cast<struct CompartmentWasmCall_t*>(comp_data_table);
    FnPtr_wasm_runtime_call_wasm_a wasm_runtime_call_wasm_a_fp = ptr_table->fp;

    std::cout << "TEMP TO BE REMOVED - init memory" << std::endl;
    wasm_runtime_memory_init(Alloc_With_System_Allocator, nullptr);

    std::cout << "TEMP TO BE REMOVED - set log" << std::endl;
    bh_log_set_verbose_level(BH_LOG_LEVEL_VERBOSE);

    std::cout << "Call wasm_runtime_call_wasm_a()" << std::endl;

    bool result = wasm_runtime_call_wasm_a_fp(ptr_table->exec_env, ptr_table->function, ptr_table->num_results, ptr_table->results, ptr_table->num_args, ptr_table->args);

    std::cout << "Result from wasm_runtime_call_wasm_a: " << result << std::endl;

    CompartmentReturn(ptr_table->comp_exit_fp, (uintptr_t)result);
}

extern "C" void CompartmentReturn(CompExitAsmFnPtr fp, uintptr_t return_arg)
{
    // Compartment calls fp to return, pass back return_arg as argument
    fp(return_arg);
}

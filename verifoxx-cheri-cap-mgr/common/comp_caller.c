// Calls ASM to switch to compartment from capability manager, or capability manager service from compartment

#include "comp_caller.h"

uintptr_t CompartmentCaller(CompEntryAsmFnPtr switcher_fp, void *comp_data, void* target_fp, void* sealed_arg_data, void* sealer_cap)
{
    // Call Asm
    volatile register uintptr_t c0 asm("c0") = comp_data;
    volatile register uintptr_t c1 asm("c1") = target_fp;
    volatile register uintptr_t c2 asm("c2") = sealed_arg_data;
    volatile register uintptr_t c3 asm("c3") = sealer_cap;

    asm("blr %[fn]"
        : "+C"(c0)
        : [fn] "C"(switcher_fp), "C"(c1), "C"(c2), "C"(c3)
            // Callee-saved registers are not preserved by the compartment switcher, so mark all of them
            // as clobbered to get the compiler to save and restore them.
            // Also mark FP and LR as clobbered, because we are effectively making a function call and
            // therefore the compiler should create a frame record.
            // Note that FP is not actually clobbered, because CompartmentEntry() does preserve FP.
            : "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27", "x28", "c29", "c30");

    return c0;
}


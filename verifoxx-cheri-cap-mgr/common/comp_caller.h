// Compartment Caller: Calls compartment from capability manager, or capability manager service from compartment

#ifndef _COMP_CALLER_H__
#define _COMP_CALLER_H__

#include "comp_common_defs.h"

#ifdef __cplusplus
extern "C"
{
#endif

    #include <stddef.h>
    #include <stdint.h>

    /// <summary>
    /// Call entry function from compartment to switch to capability manager services, or cap mgr to switch to compartment entry point.
    /// </summary>
    /// <param name="entry_fp">Asm switching function in Capability Manager (Executive)</param>
    /// <param name="comp_data">Compartment CSP/DDC/CTPIDR data to set restricted state (if applicable)</param>
    /// <param name="target_fp">Target function to be called by the switcher, compartment entry point or capability service handler</param>
    /// <param name="sealed_arg_data">Argument data for "target_fp", sealed</param>
    /// <param name="sealer_cap">Capability used to seal "sealed_arg_data"</param>
    /// <returns>return value from "target_fp", cast to uintptr_t</returns>
    uintptr_t CompartmentCaller(CompEntryAsmFnPtr switcher_fp, void* comp_data, void* target_fp, void* sealed_arg_data, void* sealer_cap);


#ifdef __cplusplus
}
#endif


#endif /* _COMP_CALLER_H__ */

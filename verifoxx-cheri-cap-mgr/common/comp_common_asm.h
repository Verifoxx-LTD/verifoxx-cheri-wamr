// Defines needed in asm and C, both compartments and capability manager

#ifndef _COMP_COMMON_ASM_H__
#define _COMP_COMMON_ASM_H__


#ifdef __cplusplus
extern "C"
{
#endif

    #define COMPDATA_CSP_OFFSET (0 * 16)
    #define COMPDATA_DDC_OFFSET (1 * 16)
    #define COMPDATA_CTPIDR_OFFSET (2 * 16)
    #define COMPDATA_CLR_OFFSET (3 * 16)    // Not part of C structure, but need space on stack for it 
    #define COMPDATA_STRUCT_SIZE (4 * 16)   // Includes CLR space

#ifndef __ASSEMBLER__
    
    // CompartmentSwitchEntry: ASM call to switch to Compartment Entry point or Capability Service Callback Handler
    // Given:
    // (1) The compartment data (CSP etc)
    // (2) The handling function (pointer) to switch to (Compartment Entry or service callback handler)
    // (3) The sealed data needed by the handling function
    // (4) The sealer capability used to seal the above
    void CompartmentSwitchEntry(void *comp_data, void *pf, void *comp_ptr_sealed, void *sealer_cap);
    
    // CompartmentSwitchReturn: Return from a Compartment handling function, with a state change restricted->executive
    // Given: return value from the handling function
    void CompartmentSwitchReturn(uintptr_t retval);

    // CompartmentServiceCallbackSwitchReturn: Return from a capability service callback function, with a state change executive->restricted
    // Given: return value from the handling function
    void CompartmentServiceCallbackSwitchReturn(uintptr_t retval);

    // Fn pointer for the compartment entry fn which is ASM function in executive
    typedef void(*CompEntryAsmFnPtr)(void*, void*, void*, void*);

    // Fn pointer for the compartment exit fn which is ASM function in executive
    typedef void(*CompExitAsmFnPtr)(uintptr_t);

    // Setup data for the compartment
    struct CompartmentData_t
    {
        void* csp;
        void* ddc;
        void* ctpidr;
    };
#endif  /* ASSEMBLER */

#ifdef __cplusplus
}
#endif

#endif /* _COMP_COMMON_ASM_H__ */

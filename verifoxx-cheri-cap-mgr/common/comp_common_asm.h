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

    // CompartmentEntry: ASM call into restricted
    // Given:
    // (1) The compartment data (CSP etc)
    // (2) The unwrapping function (pointer) in restricted
    // (3) The sealed comp ptr table
    // (4) The sealer capability
    void CompartmentEntry(void *comp_data, void *pf, void *comp_ptr_sealed, void *sealer_cap);
    
    // CompartmentExit: Return back from restricted
    void CompartmentExit(uintptr_t retval);


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

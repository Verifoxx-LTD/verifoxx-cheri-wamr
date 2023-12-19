#include <iostream>
#include <sys/mman.h>
#include <sys/auxv.h>
#include <unistd.h>
#include <type_traits>
#include <cheriintrin.h>

#include "CCompartment.h"
#include "comp_caller.h"
#include "CCapability.h"


using namespace std;


CCompartment::CCompartment(const CCompartmentLibs *comp_libs, CompartmentId id, uint32_t stack_size, uint32_t seal_id,
                const std::string comp_unwrap_function) : m_comp_libs(comp_libs), m_id(id)
{
    cout << "CCompartment: Constructing compartment id = " << 
        static_cast<typename underlying_type<CompartmentId>::type>(id) << endl;
    
    m_comp_data.csp = CreateStack(stack_size);
    
    void *cpidr = reinterpret_cast<void*>(SetCtpidr());

    // Need to make this restricted
    m_comp_data.ctpidr = Capability(cpidr)
        .SetPerms(kCompartmentDataPerms);

    m_comp_data.ddc = nullptr;  // Should not need a DDC in use

    // Create a sealer cap
    m_sealer_cap = Capability(getauxptr(AT_CHERI_SEAL_CAP))
        .SetBounds(seal_id, seal_id + 1)
        .SetAddress(reinterpret_cast<void*>(seal_id))
        .SetPerms(kCompartmentSealerPerms);
                  
    // Lookup the compartment's entry function
    void *unwrap_fn = m_comp_libs->GetDllSymbolByName(comp_unwrap_function);
    if (!unwrap_fn)
    {
        throw CCompartmentException("Cannot find compartment unwrap function!");
    }

    // Make a restricted capability from our PCC (TO DO - FOR NOW) and the above address
    m_comp_entry = Capability(cheri_ddc_get()) /* cheri_pcc_get()) */
        .SetAddress(unwrap_fn)
        .SetPerms(kCompartmentExecPerms)
        .SEntry();

    // Return function in executive
    CompExitAsmFnPtr exit_fn = CompartmentExit;
    void* exit_fn_void = Capability(reinterpret_cast<uintptr_t>(exit_fn));
    m_exit_fn = reinterpret_cast<CompExitAsmFnPtr>(exit_fn_void);
}

void* CCompartment::CreateStack(uint32_t stack_size)
{
    uint32_t page_size = getpagesize();
    uint64_t mmap_size = cheri_align_up(stack_size, page_size);

    void* mapped_stack = mmap(nullptr, mmap_size, PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);

    if (!mapped_stack)
    {
        throw CCompartmentException("No memory for stack!");
    }

    cout << "Mapped stack at address" << cheri_address_get(mapped_stack) << endl;

    // The stack grows down, so use the actual size for TOS.  Leave a 16 byte guard though and align down.
    uint8_t* tos = &reinterpret_cast<uint8_t*>(mapped_stack)[cheri_align_down(mmap_size - 32, __BIGGEST_ALIGNMENT__)];

    auto top_of_stack = Capability(mapped_stack)
        .SetBounds(mapped_stack, cheri_align_down(mmap_size - 16, __BIGGEST_ALIGNMENT__))
        .SetAddress(tos)
        .SetPerms(kCompartmentDataPerms);

    cout << "Top of stack: [" << top_of_stack << "]" << endl;

    return top_of_stack;
}

uintptr_t CCompartment::SetCtpidr()
{
    // Read ctpidr register that we currently have
    volatile register uintptr_t c0 asm("c0");

    asm("mrs c0, ctpidr_el0"
        : "+C"(c0)
    );

    return c0;
}

void* CCompartment::RestrictAndSeal(CCompartmentData* comp_fn_data)
{
    // Set tight perms on the compartment's data table and seal it
    void* restricted_cap = Capability(comp_fn_data)
        .SetPerms(kCompartmentDataPerms);

    return cheri_seal(restricted_cap, m_sealer_cap);
}

// Call the unwrapper function in the restricted
// Seal the compartments data params
uintptr_t CCompartment::CallCompartmentFunction(const std::string& fn_to_call, const std::shared_ptr<CCompartmentData> &comp_fn_data)
{
    cout << "CallCompartment: Calling ASM to call into restricted" << endl;

    // Lookup the compartment's entry function
    void* wamr_fn = m_comp_libs->GetDllSymbolByName(fn_to_call);
    if (!wamr_fn)
    {
        throw CCompartmentException("Cannot find compartment WAMR function!");
    }

    // Lookup and then build a capability for the WAMR function
    void* wamr_fn_void = Capability(cheri_ddc_get()) /* cheri_pcc_get()) */
        .SetAddress(wamr_fn)
        .SetPerms(kCompartmentExecPerms)
        .SEntry();

    // Finish building the compartment data
    // To avoid extra functionality being in the header, we update these parameters here
    comp_fn_data->comp_exit_fp = m_exit_fn;
    comp_fn_data->fp = wamr_fn_void;

    // Get the compartment's data table, which now needs to be sealed
    // For the compartment, we use the underlying pointer to the shared_ptr
    void* comp_fn_data_sealed = RestrictAndSeal(comp_fn_data.get());
    
    // Call the (C code) ASM wrapper. Arguments:
    // 1. Asm func to call for entry
    // 2. The compartment data (csp etc.)
    // 3. The unwrapping function (pointer) in restricted
    // 4. The sealed comp function data
    // 5. The sealer capability

    uintptr_t result = CompartmentCaller(&CompartmentEntry, reinterpret_cast<void*>(&m_comp_data),
                                m_comp_entry, comp_fn_data_sealed, m_sealer_cap);
    return result;
}


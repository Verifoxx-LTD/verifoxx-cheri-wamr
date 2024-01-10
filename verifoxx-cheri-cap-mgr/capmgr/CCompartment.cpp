#include <iostream>
#include <sys/mman.h>
#include <sys/auxv.h>
#include <unistd.h>
#include <type_traits>
#include <cheriintrin.h>

#include "CCapMgrLogger.h"

#include "CCompartment.h"
#include "comp_caller.h"
#include "CCapability.h"
#include "capmgr_services.h"

using namespace std;
using namespace CapMgr;

CCompartment::CCompartment(const CCompartmentLibs *comp_libs, CompartmentId id, uint32_t stack_size, uint32_t seal_id,
                const std::string comp_entry_trampoine_function) : m_comp_libs(comp_libs), m_id(id)
{
    L_(DEBUG) << "CCompartment: Constructing compartment id = " <<
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
    
    // Lookup the compartment's entry trampoline function
    void *entry_fn_ptr = m_comp_libs->GetDllSymbolByName(comp_entry_trampoine_function);
    if (!entry_fn_ptr)
    {
        throw CCompartmentException("Cannot find compartment entry point function!");
    }

    // Make a restricted capability from our PCC and the above capability unwrap function
    m_comp_entry = Capability(getauxptr(AT_CHERI_EXEC_RX_CAP))
        .SetBoundsAndAddress(Capability(entry_fn_ptr))
        .SetPerms(kCompartmentExecPerms)
        .SEntry();

    // Return function in executive
    void* exit_fn_void = Capability(reinterpret_cast<uintptr_t>(&CompartmentSwitchReturn));
    m_exit_fn = reinterpret_cast<CompExitAsmFnPtr>(exit_fn_void);

    // Compartment services entry function in executive
    void *capmgr_service_entry_void = Capability(reinterpret_cast<uintptr_t>(&CompartmentSwitchEntry));
    m_capmgr_service_entry_fn = reinterpret_cast<CompEntryAsmFnPtr>(capmgr_service_entry_void);

    // Compartment services callback handler function
    void *service_callback_void = Capability(reinterpret_cast<uintptr_t>(CompartmentServiceHandler));
    m_capmgr_service_fn = reinterpret_cast<CompServiceCallbackFnPtr>(service_callback_void);
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

    L_(VERBOSE) << "Mapped stack at address" << cheri_address_get(mapped_stack);

    // The stack grows down, so use the actual size for TOS.  Leave a 16 byte guard though and align down.
    uint8_t* tos = &reinterpret_cast<uint8_t*>(mapped_stack)[cheri_align_down(mmap_size - 32, __BIGGEST_ALIGNMENT__)];

    auto top_of_stack = Capability(mapped_stack)
        .SetBounds(mapped_stack, cheri_align_down(mmap_size - 16, __BIGGEST_ALIGNMENT__))
        .SetAddress(tos)
        .SetPerms(kCompartmentDataPerms);

    L_(VERBOSE) << "Top of stack: [" << top_of_stack << "]";

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
    L_(DEBUG) << "CallCompartment: Calling ASM to call into restricted";

    // Lookup the compartment's entry function
    void* wamr_fn = m_comp_libs->GetDllSymbolByName(fn_to_call);
    if (!wamr_fn)
    {
        throw CCompartmentException("Cannot find compartment WAMR function!");
    }

    // Lookup and then build a capability for the WAMR function
    void* wamr_fn_void = Capability(getauxptr(AT_CHERI_EXEC_RX_CAP))
        .SetAddress(wamr_fn)
        .SetPerms(kCompartmentExecPerms)
        .SEntry();

    // Finish building the compartment data
    // To avoid extra functionality being in the header, we update these parameters here
    comp_fn_data->comp_exit_fp = m_exit_fn;
    comp_fn_data->fp = wamr_fn_void;
    
    // Service callback entry point
    comp_fn_data->service_callback_entry_fp = m_capmgr_service_entry_fn;

    // Service callback function to call
    comp_fn_data->capmgr_service_fp = m_capmgr_service_fn;

    // Sealing capability
    comp_fn_data->sealer_cap = m_sealer_cap;


    // Get the compartment's data table, which now needs to be sealed
    // For the compartment, we use the underlying pointer to the shared_ptr
    void* comp_fn_data_sealed = RestrictAndSeal(comp_fn_data.get());
    
    // Call the (C code) ASM wrapper. Arguments:
    // 1. Asm func to call for entry
    // 2. The compartment data (csp etc.)
    // 3. The unwrapping function (pointer) in restricted
    // 4. The sealed comp function data
    // 5. The sealer capability

    uintptr_t result = CompartmentCaller(&CompartmentSwitchEntry, reinterpret_cast<void*>(&m_comp_data),
                                m_comp_entry, comp_fn_data_sealed, m_sealer_cap);
    return result;
}


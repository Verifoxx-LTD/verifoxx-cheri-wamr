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


CCompartment::CCompartment(CompartmentId id, uint32_t stack_size, uint32_t seal_id) : m_id(id)
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

void* CCompartment::RestrictAndSeal(void* comp_ptr_table)
{
    // Set tight perms on the compartment's data table and seal it
    void* restricted_cap = Capability(comp_ptr_table)
        .SetPerms(kCompartmentDataPerms);

    return cheri_seal(restricted_cap, m_sealer_cap);
}

// Call the unwrapper function in the restricted
// Seal the compartments data params
bool CCompartment::CallCompartment(void *unwrap_fn)
{
    cout << "CallCompartment: Calling ASM to call into restricted" << endl;
    
    // Get the compartment's data table, which now needs to be sealed
    void* comp_table_sealed = RestrictAndSeal(GetCompTable());

    // Get the pointer to the unwrapping function we need to call in the compartment
    //CompUnwrapFnPtr fn = CompartmentUnwrap;

    // Get its address only - we will built a new cap from this
    //void *fn_addr = cheri_address_get(reinterpret_cast<uintptr_t>(fn));

    // Make a restricted capability from our PCC (TO DO - FOR NOW) and the above address
    void* comp_entry = Capability(cheri_ddc_get()) /* cheri_pcc_get()) */
        .SetAddress(unwrap_fn)
        .SetPerms(kCompartmentExecPerms)
        .SEntry();
    
    // Call the (C code) ASM wrapper. Arguments:
    // 1. Asm func to call for entry
    // 2. The compartment data (csp etc.)
    // 3. The unwrapping function (pointer) in restricted
    // 4. The sealed comp data table
    // 5. The sealer capability

    uintptr_t p_result = CompartmentCaller(&CompartmentEntry, reinterpret_cast<void*>(&m_comp_data), comp_entry, comp_table_sealed, m_sealer_cap);
    bool result = (bool)p_result;
    return result;
}


CWasmCallFuncCompartment::CWasmCallFuncCompartment(void* wamr_fn,
    WASMExecEnv* exec_env,
    WASMFunctionInstanceCommon* function,
    uint32 num_results,
    wasm_val_t* results,
    uint32 num_args,
    wasm_val_t* args) : CCompartment(CompartmentId::kCallFuncCompartment, CALL_FUNC_STACK_SIZE, CALL_FUNC_SEAL_ID)
{
    // Return function in executive
    CompExitAsmFnPtr exit_fn = CompartmentExit;
    void* exit_fn_void = Capability(reinterpret_cast<uintptr_t>(exit_fn));
    exit_fn = reinterpret_cast<CompExitAsmFnPtr>(exit_fn_void);

    // Build a capability for the WAMR function
    void *wamr_fn_void = Capability(cheri_ddc_get()) /* cheri_pcc_get()) */
        .SetAddress(wamr_fn)
        .SetPerms(kCompartmentExecPerms)
        .SEntry();

    // Create params and build table
    m_comp_params = new CompartmentWasmCall_t{
        reinterpret_cast<FnPtr_wasm_runtime_call_wasm_a>(wamr_fn_void),
        exec_env,
        function,
        num_results,
        results,
        num_args,
        args,
        exit_fn
    };
}

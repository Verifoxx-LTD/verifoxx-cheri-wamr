#include "cheri_mem_mgmt.h"
#include "cheri_mem_mgt_c_api.h"
#include <cstdlib>
#include <iostream>

// Get the stack struct
extern "C" WASMCheriStack_t * __capability cheri_wasm_get_stack_struct()
{
    return (!mem_mgr_instance) ? NULL : mem_mgr_instance->stack_struct();
}

// Get the stack size
extern "C" size_t cheri_wasm_get_stack_size()
{
    return (!mem_mgr_instance) ? 0 : mem_mgr_instance->stack_size();
}

void* __capability CheriMemMgr::cheri_malloc(size_t sz_bytes)
{
    std::cout << "cheri_malloc() called: alloc " << sz_bytes << " bytes" << std::endl;

#if ENABLE_CHERI_PURECAP
    return malloc(sz_bytes);
#else
    void* allocd_p = malloc(sz_bytes);
    return cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif
}

void* __capability CheriMemMgr::cheri_realloc(void* __capability ptr, size_t sz_bytes)
{
    std::cout << "cheri_malloc() called: realloc " << sz_bytes << " bytes" << std::endl;

#if ENABLE_CHERI_PURECAP
    return realloc(ptr, sz_bytes);
#else
    void* allocd_p = realloc((void*)cheri_address_get(ptr), sz_bytes);
    return cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif
}

 void CheriMemMgr::cheri_free(void* __capability ptr)
{
    std::cout << "cheri_malloc() called: free"<< std::endl;

#if ENABLE_CHERI_PURECAP
    free(ptr);
#else
    free((void*)cheri_address_get(ptr));
#endif
}

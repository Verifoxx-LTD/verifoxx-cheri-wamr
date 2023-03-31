#include "cheri_mem_mgmt.h"
#include "cheri_mem_mgmt_c_api.h"
#include <cstdlib>
#include <iostream>

static CheriMemMgr* mem_mgr = nullptr;

// Create mem mgr
extern "C" CheriMemMgr *create_cheri_mem_mgr(uint32_t stack_size, uint32_t heap_size)
{
    if (!mem_mgr)
    {
        mem_mgr = new CheriMemMgr{ stack_size, heap_size };
    }
    return mem_mgr;
}

extern "C" void delete_cheri_mem_mgr()
{
    if (mem_mgr)
    {
        delete mem_mgr; // calls CheriMemMgr::cleanup_wasm_stack()
    }
    mem_mgr = nullptr;
}

// Allocate a linear memory
extern "C" void* __capability cheri_wasm_linear_memory_alloc(size_t size)
{
    return (mem_mgr) ? mem_mgr->alloc_linear_memory(size) : NULL;
}

// Get the stack struct
extern "C" WASMCheriStack_t * __capability cheri_wasm_get_stack_struct()
{
    return (mem_mgr) ? mem_mgr->stack_struct() : NULL;
}

// Get the stack size
extern "C" size_t cheri_wasm_get_stack_size()
{
    return (mem_mgr) ? mem_mgr->stack_size() : 0;
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

 void* __capability CheriMemMgr::alloc_linear_memory(size_t sz)
 {
     std::cout << "Allocating linear memory of size " << sz << " bytes" << std::endl;
     std::cout << "TODO: set this up from a central map, restricted to the module sandbox" << std::endl;

     return cheri_malloc(sz);
 }

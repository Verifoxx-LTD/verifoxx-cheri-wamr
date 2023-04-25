/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* C API & C++ Definition for the CheriMemMgr */

#include "cheri_mem_mgmt.h"
#include "cheri_mem_mgmt_c_api.h"
#include <cstdlib>
#include <iostream>
#include <cstring>

static CheriMemMgr* mem_mgr = nullptr;

// Create mem mgr (C Api)
extern "C" CheriMemMgr *create_cheri_mem_mgr()
{
    if (!mem_mgr)
    {
        mem_mgr = new CheriMemMgr{ };
    }
    return mem_mgr;
}

// Delete mem mgr (C Api)
extern "C" void delete_cheri_mem_mgr()
{
    if (mem_mgr)
    {
        delete mem_mgr; // calls CheriMemMgr::cleanup_wasm_stack()
    }
    mem_mgr = nullptr;
}

// Set the heap offset in linear memory and the size, and check for validity (C Api)
// Future need at the moment
bool cheri_wasm_set_check_heap_metrics(uint32_t heap_size, uint32_t heap_offset)
{
    return (mem_mgr) ? mem_mgr->set_heap_metrics(heap_size, heap_offset) : NULL;
}

// Allocate a linear memory  (C Api)
extern "C" void* __capability cheri_wasm_linear_memory_alloc(size_t size)
{
    return (mem_mgr) ? mem_mgr->alloc_linear_memory(size) : NULL;
}

// Create / get the stack struct  (C Api)
extern "C" WASMCheriStack_t * __capability cheri_wasm_create_stack_struct()
{
    return (mem_mgr) ? mem_mgr->create_stack_struct() : NULL;
}

// Update the stack size with supplied value and return aligned value
extern "C" uint32_t cheri_wasm_update_stack_size(uint32_t requested_size)
{
    return (mem_mgr) ? mem_mgr->set_stack_size(requested_size) : 0;
}

// Malloc Implementation
void* __capability CheriMemMgr::cheri_malloc(size_t sz_bytes)
{
    LOG_VERBOSE("cheri_malloc() called: alloc %d bytes\n", sz_bytes);

#if ENABLE_CHERI_PURECAP
    void *addr = malloc(sz_bytes);
#else
    void* allocd_p = malloc(sz_bytes);
    void *__capability addr = cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif
    if (addr)
    {
        std::memset(addr, 0, sz_bytes);
    }
    return addr;
}

// Realloc Implementation
void* __capability CheriMemMgr::cheri_realloc(void* __capability ptr, size_t sz_bytes)
{
    LOG_VERBOSE("cheri_realloc() called: realloc %d bytes\n", sz_bytes);

    size_t curr_size = cheri_length_get(ptr);
#if ENABLE_CHERI_PURECAP
    void *addr = realloc(ptr, sz_bytes);
#else
    void* allocd_p = realloc((void*)cheri_address_get(ptr), sz_bytes);
    void *__capability addr = cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif
    if (sz_bytes > curr_size)
    {
        // Zero the uninitialized bit
        std::memset(&((uint8_t*)addr)[sz_bytes], 0, sz_bytes - curr_size);
    }
    return addr;
}

// Free Implementation
 void CheriMemMgr::cheri_free(void* __capability ptr)
{
    LOG_VERBOSE("cheri_free() called");

#if ENABLE_CHERI_PURECAP
    free(ptr);
#else
    free((void*)cheri_address_get(ptr));
#endif
}

 // Allocate linear memory buffer implementation
 void* __capability CheriMemMgr::alloc_linear_memory(size_t sz)
 {
     LOG_DEBUG("WAMR-app: allocates linear memory of size %d", sz);
     LOG_VERBOSE("TODO: set this up from a central map, restricted to the module sandbox");

     return cheri_malloc(sz);
 }

 void CheriMemMgr::setup_wasm_stack()
 {
     if (!m_stack_size.HasValue())
     {
         LOG_ERROR("Must set stack size before attempting to create the CHERI stack");
         return;
     }

     try
     {
         // Allocate the actual stack.  Note - to avoid the top boundary being out of bounds, allocate extra space
         m_stack = static_cast<uint8 * __capability>(new uint8[m_stack_size.Get() + CHERI_ALIGNMENT]);

         // And our stack structure
         {
             m_stack_struct = static_cast<WASMCheriStack_t * __capability>(new WASMCheriStack_t{});
         }

         m_stack = cheri_perms_and(m_stack, WASM_STACK_PERMS);

         // Setup
         m_stack_struct->bottom = m_stack;
         m_stack_struct->top = m_stack;
         m_stack_struct->top_boundary = m_stack + m_stack_size.Get();

         LOG_DEBUG("Created CHERI stack: size %d", m_stack_size.Get());

         /* Our stack structure:
             |.................<allocated space>......................|xx|
             ^           ^                                             ^
             |           |                                             |
             bottom    -->  top grows -->                        top_boundary
         */
     }
     catch (std::bad_alloc&)
     {
         LOG_ERROR("Stack allocation failed");
     }
 }

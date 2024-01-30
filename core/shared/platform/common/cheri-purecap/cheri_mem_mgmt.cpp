/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* C API & C++ Definition for the CheriMemMgr */

#include "cheri_mem_wrapper.h"
#include "cheri_mem_mgmt.h"
#include "cheri_mem_mgmt_c_api.h"

#include <cheriintrin.h>
#include <cstdlib>
#include <iostream>
#include <cstring>

static CheriMemMgr* mem_mgr = nullptr;
static int32_t max_native_heap_used = 0;
static int32_t curr_native_heap_used = 0;
static int32_t alloc_count = 0;

// Get the actual size of an allocated memory block, this may be
// a little larger than requested size due to necessary machine
// alignments.
static inline size_t get_actual_alloc_size(void* __capability ptr)
{
    return cheri_length_get(ptr) - cheri_offset_get(ptr);
}

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
    LOG_VERBOSE("cheri_malloc() called: alloc %d bytes", sz_bytes);

#if ENABLE_CHERI_PURECAP
    void *addr = cheri_malloc_wrapper(sz_bytes);
#else
    void* allocd_p = malloc(sz_bytes);
    void *__capability addr = cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif
    if (addr)
    {
        if (TRACE_MEM)
        {
            curr_native_heap_used += get_actual_alloc_size(addr);
            LOG_VERBOSE("  - Memory usage now: %d", curr_native_heap_used);
            alloc_count++;
            if (curr_native_heap_used > max_native_heap_used)
            {
                max_native_heap_used = curr_native_heap_used;
            }
        }
    }
    return addr;
}

// Realloc Implementation
void* __capability CheriMemMgr::cheri_realloc(void* __capability ptr, size_t sz_bytes)
{
    LOG_VERBOSE("cheri_realloc() called: realloc %d bytes", sz_bytes);

#if ENABLE_CHERI_PURECAP
    void *addr = cheri_realloc_wrapper(ptr, sz_bytes);
#else
    void* allocd_p = realloc((void*)cheri_address_get(ptr), sz_bytes);
    void *__capability addr = cheri_address_set(cheri_ddc_get(), (uintptr_t)allocd_p);
#endif

    if (TRACE_MEM)
    {
        curr_native_heap_used -= get_actual_alloc_size(ptr);
        curr_native_heap_used += get_actual_alloc_size(addr);

        LOG_VERBOSE("  - Memory usage now: %d", curr_native_heap_used);
        
        if (curr_native_heap_used > max_native_heap_used)
        {
            max_native_heap_used = curr_native_heap_used;
        }
    }
    return addr;
}

// Free Implementation
 void CheriMemMgr::cheri_free(void* __capability ptr)
{
    LOG_VERBOSE("cheri_free() called");

    if (TRACE_MEM)
    {
        size_t curr_size = get_actual_alloc_size(ptr);
        curr_native_heap_used -= curr_size;
        LOG_VERBOSE("  - Memory usage now: %d", curr_native_heap_used);
        alloc_count--;
    }

#if ENABLE_CHERI_PURECAP
    cheri_free_wrapper(ptr);
#else
    free((void*)cheri_address_get(ptr));
#endif

}

 // Allocate linear memory buffer implementation
 void* __capability CheriMemMgr::alloc_linear_memory(size_t sz)
 {
     LOG_DEBUG("WAMR-app: allocates linear memory of size %d", sz);
     LOG_VERBOSE("TODO: set this up from a central map, restricted to the module sandbox");

#if ENABLE_CHERI_PURECAP
     return cheri_alloc_linear_mem_wrapper(sz);
#else
     auto ptr = cheri_malloc(sz);

     if (ptr)
     {
         std::memset(ptr, 0, sz);
     }
     return ptr;
#endif
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
         // Also allocate stack struct
#if ENABLE_CHERI_PURECAP
         m_stack = reinterpret_cast<uint8_t*>(cheri_alloc_stack_wrapper(m_stack_size.Get() + CHERI_ALIGNMENT));
         m_stack_struct = reinterpret_cast<WASMCheriStack_t*>(cheri_malloc_wrapper(sizeof(WASMCheriStack_t)));

#else
         m_stack = (uint8_t * __capability)cheri_address_set(cheri_ddc_get(), (uintptr_t)new uint8[m_stack_size.Get() + CHERI_ALIGNMENT]);
         m_stack_struct = (WASMCheriStack_t * __capability)cheri_address_set(cheri_ddc_get(), (uintptr_t)new WASMCheriStack_t{});
#endif

         // Setup
         m_stack_struct->bottom = m_stack;
         m_stack_struct->top = m_stack;
         m_stack_struct->top_boundary = m_stack + m_stack_size.Get();

         LOG_DEBUG("Created CHERI stack: size %d", m_stack_size.Get());

         if (TRACE_MEM)
         {
             os_printf("CHERI WASM stack:\n    usable size: %d\n    overall size alloc'd: %d\n",
                 m_stack_size.Get(), m_stack_size.Get() + CHERI_ALIGNMENT + sizeof(WASMCheriStack_t));
             curr_native_heap_used += get_actual_alloc_size(m_stack);
             curr_native_heap_used += get_actual_alloc_size(m_stack_struct);
             LOG_VERBOSE("  - Memory usage now: %d", curr_native_heap_used);

             if (curr_native_heap_used > max_native_heap_used)
             {
                 max_native_heap_used = curr_native_heap_used;
             }

             alloc_count += 2;
         }


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

void CheriMemMgr::cleanup_wasm_stack()
{
    if (m_stack_struct)
    {
        if (TRACE_MEM)
        {
            curr_native_heap_used -= get_actual_alloc_size(m_stack_struct);
            alloc_count--;
        }

#if ENABLE_CHERI_PURECAP
        cheri_free_wrapper(m_stack_struct);
#else
        delete m_stack_struct;
#endif
        m_stack_struct = nullptr;
    }

    if (m_stack)
    {
        if (TRACE_MEM)
        {
            curr_native_heap_used -= get_actual_alloc_size(m_stack);
            alloc_count--;
        }

#if ENABLE_CHERI_PURECAP
        cheri_free_stack_wrapper(m_stack);
#else
        delete[] m_stack;
#endif
        m_stack = nullptr;
    }

    if (TRACE_MEM)
    {
        LOG_VERBOSE("  - Memory usage now: %d", curr_native_heap_used);
        os_printf("Native heap memory peak usage not more than: %d bytes\n", max_native_heap_used);
        os_printf("Number of unmatched alloc vs free (should be zero): %d\n", alloc_count);
    }
}

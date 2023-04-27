/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_mem_mgmt.h: Manage some WASM structures with suitable capability pointers */

#ifndef _CHERI_MEM_MGMT_H_
#define _CHERI_MEM_MGMT_H_

#include <iostream>
#include <new>
#include <cheriintrin.h>

#include "wasm_exec_env.h"
#include "wasm_export.h"
#include "wasm_memory.h"
#include "wasm_native.h"
#include "wasm_runtime_common.h"
#include "bh_log.h"

#include "optional_value.h"

class CheriMemMgr
{
public:
    using MallocPointer_t = void *__capability (*)(size_t);
    using ReallocPointer_t = void* __capability(*)(void* __capability, size_t);
    using FreePointer_t = void (*)(void *__capability);

    static void* __capability cheri_malloc(size_t sz_bytes);
    static void* __capability cheri_realloc(void* __capability ptr, size_t sz_bytes);
    static void cheri_free(void *__capability ptr);
    

private:

#if WASM_ENABLE_MEMORY_TRACING
    static constexpr bool TRACE_MEM = true;
#else
    static constexpr bool TRACE_MEM = false;
#endif

    static constexpr size_t CHERI_ALIGNMENT = alignof(void* __capability);
    static constexpr size_t WASM_STACK_PERMS =
        CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
        CHERI_PERM_STORE | CHERI_PERM_STORE_CAP | CHERI_PERM_STORE_LOCAL_CAP |
        CHERI_PERM_GLOBAL;

    OptionalValue<uint32_t> m_stack_size;
    OptionalValue<uint32_t> m_heap_size;
    OptionalValue<uint32_t> m_heap_offset;  // Into linear memory area

    uint8_t* __capability m_stack = nullptr;
    WASMCheriStack_t* __capability m_stack_struct = nullptr;
    MallocPointer_t m_malloc_func = nullptr;
    ReallocPointer_t m_realloc_func = nullptr;
    FreePointer_t m_free_func = nullptr;

    void setup_wasm_stack();

public:
    // Construct: optionally supply malloc/realloc/free functions
    CheriMemMgr(MallocPointer_t malloc_func=nullptr, ReallocPointer_t realloc_func=nullptr, FreePointer_t free_func=nullptr)
    {
        m_malloc_func = malloc_func ? malloc_func : &CheriMemMgr::cheri_malloc;
        m_realloc_func = realloc_func ? realloc_func : &CheriMemMgr::cheri_realloc;
        m_free_func = free_func ? free_func : &CheriMemMgr::cheri_free;
    }

    ~CheriMemMgr()
    {
        cleanup_wasm_stack();
    }

    // Allocate linear memory
    void* __capability alloc_linear_memory(size_t sz);

    void cleanup_wasm_stack();

    // Set stack size / get size used
    uint32_t set_stack_size(uint32_t size)
    {
        m_stack_size.SetIfEmpty(cheri_align_up(size, CHERI_ALIGNMENT));
        return m_stack_size.Get();
    }

    bool set_heap_metrics(uint32_t heap_size, uint32_t heap_offset)
    {
        if (  (!m_heap_size.HasValue() && !cheri_is_aligned(heap_size, CHERI_ALIGNMENT))
            || (!m_heap_offset.HasValue() && !cheri_is_aligned(heap_offset, CHERI_ALIGNMENT))
            )
        {
            LOG_ERROR("Heap offset and size must be capability pointer size aligned on CHERI!");
            return false;
        }

        m_heap_size.SetIfEmpty(heap_size);
        m_heap_offset.SetIfEmpty(heap_offset);

        return true;
    }

    // Create / get the stack struct
    WASMCheriStack_t* __capability create_stack_struct()
    {
        if (!m_stack_struct)
        {
            setup_wasm_stack();
        }
        return m_stack_struct;  // If still nullptr then was an alloc problem
    }
};

#endif /* _CHERI_MEM_MGMT_H_*/
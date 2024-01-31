/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_mem_wrapper_capmgr: Capability manager implementation of the cheri mem wrapper */

#if !ENABLE_CHERI_PURECAP || !ENABLE_CHERI_CAPMGR
#error "This file only valid within capability manager"
#endif

#include "cheri_mem_wrapper.h"
#include <cstdlib>
#include <cstring>
#include <cheriintrin.h>
#include "CCapMgrLogger.h"

using namespace CapMgr;

static constexpr size_t WASM_STACK_PERMS =
    CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
    CHERI_PERM_STORE | CHERI_PERM_STORE_CAP | CHERI_PERM_STORE_LOCAL_CAP |
    CHERI_PERM_GLOBAL;

void* cheri_malloc_wrapper(size_t size)
{
    L_(DEBUG) << "System malloc: size=" << size;
    void *ptr = std::malloc(size);
    return cheri_perms_clear(ptr, ARM_CAP_PERMISSION_EXECUTIVE);    // Set suitable for restricted
}

void* cheri_realloc_wrapper(void* ptr, size_t size)
{
    L_(DEBUG) << "System realloc: size=" << size;
    void *new_ptr = std::realloc(ptr, size);
    return cheri_perms_clear(new_ptr, ARM_CAP_PERMISSION_EXECUTIVE);    // Set suitable for restricted
}

void* cheri_alloc_linear_mem_wrapper(size_t size)
{
    L_(DEBUG) << "System alloc linear memory: size=" << size;
    void *ptr = std::malloc(size);
    if (ptr)
    {
        std::memset(ptr, 0, size);
    }
    return cheri_perms_clear(ptr, ARM_CAP_PERMISSION_EXECUTIVE);    // Set suitable for restricted
}

void* cheri_alloc_stack_wrapper(size_t size)
{
    L_(DEBUG) << "System alloc WAMR stack: size=" << size;
    void* ptr = std::malloc(size);

    if (ptr)
    {
        std::memset(ptr, 0, size);
    }
    
    ptr = cheri_perms_and(ptr, WASM_STACK_PERMS);
    return cheri_perms_clear(ptr, ARM_CAP_PERMISSION_EXECUTIVE);    // Set suitable for restricted
}

void  cheri_free_wrapper(void* ptr)
{
    L_(DEBUG) << "System free memory";
    std::free(ptr);
}

void  cheri_free_stack_wrapper(void* ptr)
{
    L_(DEBUG) << "System free WAMR stack memory";
    std::free(ptr);
}

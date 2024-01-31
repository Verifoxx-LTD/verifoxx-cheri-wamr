/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_mem_wrapper: Implement the low-level functions around memory allocation, for purecap only */

#if ENABLE_CHERI_PURECAP

#include "cheri_mem_wrapper.h"
#include <cstdlib>
#include <cstring>
#include <cheriintrin.h>

static constexpr size_t WASM_STACK_PERMS =
    CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
    CHERI_PERM_STORE | CHERI_PERM_STORE_CAP | CHERI_PERM_STORE_LOCAL_CAP |
    CHERI_PERM_GLOBAL;

extern "C" void* cheri_malloc_wrapper(size_t size)
{
    return std::malloc(size);
}

extern "C" void* cheri_realloc_wrapper(void* ptr, size_t size)
{
    return std::realloc(ptr, size);
}

extern "C" void* cheri_alloc_linear_mem_wrapper(size_t size)
{
    void *ptr = std::malloc(size);
    if (ptr)
    {
        std::memset(ptr, 0, size);
    }
    return ptr;
}

extern "C" void* cheri_alloc_stack_wrapper(size_t size)
{
    void* ptr = std::malloc(size);

    if (ptr)
    {
        std::memset(ptr, 0, size);
    }
    
    ptr = cheri_perms_and(ptr, WASM_STACK_PERMS);

    return ptr;
}

extern "C" void  cheri_free_wrapper(void* ptr)
{
    std::free(ptr);
}

extern "C" void  cheri_free_stack_wrapper(void* ptr)
{
    std::free(ptr);
}

#endif /* ENABLE_CHERI_PURECAP */


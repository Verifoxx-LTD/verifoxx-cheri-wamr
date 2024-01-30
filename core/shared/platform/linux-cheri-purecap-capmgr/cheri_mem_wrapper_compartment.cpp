/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_mem_wrapper_compartment: Implement the low-level functions around memory allocation.
* They call into the capability manager
*/

#if !ENABLE_CHERI_PURECAP || !ENABLE_CHERI_COMPARTMENT
#error "This file only valid within a compartment"
#endif

#include "cheri_mem_wrapper.h"
#include "service_call_proxy.h"

extern "C" void* cheri_malloc_wrapper(size_t size)
{
    return CServiceCallProxy::GetInstance()->cheri_malloc_wrapper(size);
}

extern "C" void* cheri_realloc_wrapper(void* ptr, size_t size)
{
    return CServiceCallProxy::GetInstance()->cheri_realloc_wrapper(ptr, size);
}

extern "C" void* cheri_alloc_linear_mem_wrapper(size_t size)
{
    CServiceCallProxy::GetInstance()->cheri_alloc_linear_mem_wrapper(size);
}

extern "C" void* cheri_alloc_stack_wrapper(size_t size)
{
    CServiceCallProxy::GetInstance()->cheri_alloc_stack_wrapper(size);
}

extern "C" void cheri_free_wrapper(void* ptr)
{
    CServiceCallProxy::GetInstance()->cheri_free_wrapper(ptr);
}

extern "C" void cheri_free_stack_wrapper(void* ptr)
{
    CServiceCallProxy::GetInstance()->cheri_free_stack_wrapper(ptr);
}

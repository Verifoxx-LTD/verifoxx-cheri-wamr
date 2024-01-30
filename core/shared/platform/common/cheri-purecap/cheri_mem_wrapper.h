/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_mem_wrapper.h: Purecap functions to wrap low-level OS calls (which may route through a capability manager) */

#ifndef _CHERI_MEM_WRAPPER_H_
#define _CHERI_MEM_WRAPPER_H_

#ifdef __cplusplus
#include <cstddef>
extern "C" {
#else
#include <stddef.h>
#endif

    void* cheri_malloc_wrapper(size_t size);
    void* cheri_realloc_wrapper(void *ptr, size_t size);
    void* cheri_alloc_linear_mem_wrapper(size_t size);
    void* cheri_alloc_stack_wrapper(size_t size);
    void  cheri_free_wrapper(void* ptr);
    void  cheri_free_stack_wrapper(void* ptr);

#ifdef __cplusplus
}
#endif

#endif /* _CHERI_MEM_WRAPPER_H_ */

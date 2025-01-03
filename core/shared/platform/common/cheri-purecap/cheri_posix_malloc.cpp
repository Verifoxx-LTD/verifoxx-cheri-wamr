/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* cheri_posix_malloc: Use CHERI version of malloc/realloc/free */
#include "platform_api_vmcore.h"
#include "cheri_mem_mgmt.h"
#include "cheri_mem_mgmt_c_api.h"

#if ENABLE_CHERI_PURECAP
extern "C" void*
os_malloc(unsigned size)
{
    return create_cheri_mem_mgr()->cheri_malloc(size);
}

void *
os_realloc(void *ptr, unsigned size)
{
    return create_cheri_mem_mgr()->cheri_realloc(ptr, size);
}

void
os_free(void *ptr)
{
    return create_cheri_mem_mgr()->cheri_free(ptr);
}
#else
#include <cheriintrin.h>

extern "C" void*
os_malloc(unsigned size)
{
    auto alloc_ptr = create_cheri_mem_mgr()->cheri_malloc(size);
    return (void*)cheri_address_get(alloc_ptr);
}

void*
os_realloc(void* ptr, unsigned size)
{
    auto alloc_ptr = create_cheri_mem_mgr()->cheri_realloc(cheri_address_set(cheri_ddc_get(), (uintptr_t)ptr), size);
    return (void*)cheri_address_get(alloc_ptr);
}

void
os_free(void* ptr)
{
    create_cheri_mem_mgr()->cheri_free(cheri_address_set(cheri_ddc_get(), (uintptr_t)ptr));
}
#endif /* ENABLE_CHERI_PURECAP */

int
os_dumps_proc_mem_info(char *out, unsigned int size)
{
    int ret = -1;
    FILE *f;
    char line[128] = { 0 };
    unsigned int out_idx = 0;

    if (!out || !size)
        goto quit;

    f = fopen("/proc/self/status", "r");
    if (!f) {
        perror("fopen failed: ");
        goto quit;
    }

    memset(out, 0, size);

    while (fgets(line, sizeof(line), f)) {
#if WASM_ENABLE_MEMORY_PROFILING != 0
        if (strncmp(line, "Vm", 2) == 0 || strncmp(line, "Rss", 3) == 0) {
#else
        if (strncmp(line, "VmRSS", 5) == 0
            || strncmp(line, "RssAnon", 7) == 0) {
#endif
            size_t line_len = strlen(line);
            if (line_len >= size - 1 - out_idx)
                goto close_file;

            /* copying without null-terminated byte */
            memcpy(out + out_idx, line, line_len);
            out_idx += line_len;
        }
    }

    if (ferror(f)) {
        perror("fgets failed: ");
        goto close_file;
    }

    ret = 0;
close_file:
    fclose(f);
quit:
    return ret;
}
/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/* Linux CHERI platform init */

#include "platform_api_vmcore.h"
#include "cheri_mem_mgmt_c_api.h"
#include "bh_log.h"

int
bh_platform_init()
{
    if (NULL == create_cheri_mem_mgr())
    {
        LOG_ERROR("Failed to create CHERI Memory Manager");
        return -1;
    }
    return 0;
}

void
bh_platform_destroy()
{
    delete_cheri_mem_mgr();
}

int
os_printf(const char *format, ...)
{
    int ret = 0;
    va_list ap;

    va_start(ap, format);
#ifndef BH_VPRINTF
    ret += vprintf(format, ap);
#else
    ret += BH_VPRINTF(format, ap);
#endif
    va_end(ap);

    return ret;
}

int
os_vprintf(const char *format, va_list ap)
{
#ifndef BH_VPRINTF
    return vprintf(format, ap);
#else
    return BH_VPRINTF(format, ap);
#endif
}

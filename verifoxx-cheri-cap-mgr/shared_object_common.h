// shared_object_common: Common header for capability managing functionality

#ifndef __SHARED_OBJECT_COMMON_H_
#define __SHARED_OBJECT_COMMON_H_

#include <cstddef>
#include <cstdio>
#include <cstdint>
#include <cstring>

// Add C library function headers
extern "C"
{
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

// On morello, dynamic section is readonly (hard-coded with constant)
#ifndef DL_RO_DYN_SECTION
#define DL_RO_DYN_SECTION
#endif

#include <elf.h>
#include <link.h>
#include <dlfcn.h>
#include <sys/auxv.h>
#include <sys/mman.h>
#include <unistd.h>
}


#endif /*__SHARED_OBJECT_COMMON_H_ */

# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set (PLATFORM_SHARED_DIR ${CMAKE_CURRENT_LIST_DIR})

add_definitions(-DBH_PLATFORM_LINUX_CHERI_PURECAP)

if (CHERI_PURECAP)
    add_compile_definitions(ENABLE_CHERI_PURECAP=1)
endif ()

if (DEFINED WAMR_BUILD_AOT_CHERI_PTR AND WAMR_BUILD_AOT_CHERI_PTR GREATER 0)
    # Force use of CHERI pointer with given alignment
    add_compile_definitions(AOT_CHERI_PTR_SIZE=${WAMR_BUILD_AOT_CHERI_PTR})
endif ()

include (${CMAKE_CURRENT_LIST_DIR}/../common/cheri-purecap/platform_cheri-purecap.cmake)

include_directories(${PLATFORM_SHARED_DIR})
include_directories(${PLATFORM_SHARED_DIR}/../include)
include_directories(${PLATFORM_SHARED_DIR}/../common/cheri-purecap)

# Manually add POSIX files we require
set (PLATFORM_COMMON_POSIX_DIR ${CMAKE_CURRENT_LIST_DIR}/../common/posix)
set (PLATFORM_COMMON_POSIX_SOURCE
    "${PLATFORM_COMMON_POSIX_DIR}/posix_memmap.c"
    "${PLATFORM_COMMON_POSIX_DIR}/posix_socket.c"
    "${PLATFORM_COMMON_POSIX_DIR}/posix_thread.c"
    "${PLATFORM_COMMON_POSIX_DIR}/posix_time.c"
)


file (GLOB_RECURSE source_all ${PLATFORM_SHARED_DIR}/*.c ${PLATFORM_SHARED_DIR}/*.cpp)

# Include the cheri-purecap common files
set (PLATFORM_SHARED_SOURCE ${source_all} ${PLATFORM_COMMON_POSIX_SOURCE} ${COMMON_CHERI_PURECAP_SOURCE})

file (GLOB header ${PLATFORM_SHARED_DIR}/../include/*.h)
LIST (APPEND RUNTIME_LIB_HEADER_LIST ${header} ${COMMON_CHERI_PURECAP_INCLUDE})

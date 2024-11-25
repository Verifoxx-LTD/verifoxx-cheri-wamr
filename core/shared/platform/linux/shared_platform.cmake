# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set (PLATFORM_SHARED_DIR ${CMAKE_CURRENT_LIST_DIR})

add_definitions(-DBH_PLATFORM_LINUX)

# Make it possible to build any Linux build when
# wamrc was built to have CHERI large pointer alignments
if (DEFINED WAMR_BUILD_AOT_CHERI_PTR AND WAMR_BUILD_AOT_CHERI_PTR GREATER 0)
    # Force use of CHERI pointer with given alignment
    add_compile_definitions(AOT_CHERI_PTR_SIZE=${WAMR_BUILD_AOT_CHERI_PTR})
endif ()


include_directories(${PLATFORM_SHARED_DIR})
include_directories(${PLATFORM_SHARED_DIR}/../include)

include (${CMAKE_CURRENT_LIST_DIR}/../common/posix/platform_api_posix.cmake)

file (GLOB_RECURSE source_all ${PLATFORM_SHARED_DIR}/*.c)

set (PLATFORM_SHARED_SOURCE ${source_all} ${PLATFORM_COMMON_POSIX_SOURCE})

file (GLOB header ${PLATFORM_SHARED_DIR}/../include/*.h)
LIST (APPEND RUNTIME_LIB_HEADER_LIST ${header})

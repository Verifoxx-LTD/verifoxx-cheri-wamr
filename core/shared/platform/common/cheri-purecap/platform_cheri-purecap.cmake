# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 
# Common folder for linux-cheri-purecap and linux-cheri-purecap-capmgr
set (COMMON_CHERI_PURECAP_DIR ${CMAKE_CURRENT_LIST_DIR})

file (GLOB_RECURSE source_all ${COMMON_CHERI_PURECAP_DIR}/*.c ${COMMON_CHERI_PURECAP_DIR}/*.cpp)
file (GLOB header ${COMMON_CHERI_PURECAP_DIR}/*.h)

set (COMMON_CHERI_PURECAP_SOURCE ${source_all} )
set (COMMON_CHERI_PURECAP_INCLUDE ${header} )
# Copyright (C) 2023 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# CMake file for linux-cheri-purecap to produce externref app for WAMR testing.

cmake_minimum_required (VERSION 3.14)

project("externref-app" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

message(STATUS "*** Build WAMR externref-app ***")

set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_SYSTEM_VERSION 1)

message(STATUS "*** Linux CHERI Pure-cap platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

if (NOT DEFINED CMAKE_C_COMPILER)
    set (CMAKE_C_COMPILER "gcc")
endif ()

if (NOT_DEFINED_CMAKE_CXX_COMPLIER)
    set (CMAKE_CXX_COMPILER "g++")
endif ()

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused")

if (NOT DEFINED WAMR_BUILD_PLATFORM)
    set (WAMR_BUILD_PLATFORM "linux-cheri-purecap")
endif ()

# Reset default linker flags
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set (CMAKE_C_STANDARD 99)

enable_language(C CXX ASM)

if (NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif ()
message(STATUS "Build Type=${CMAKE_BUILD_TYPE}")

# Provide fixed set of WAMR configuration
set (WAMR_BUILD_INTERP 1)
set (WAMR_BUILD_AOT 1)
set (WAMR_BUILD_JIT 0)
set (WAMR_BUILD_LIBC_BUILTIN 1)
set (WAMR_BUILD_LIBC_WASI 1)
set (WAMR_DISABLE_HW_BOUND_CHECK 0)
set (WAMR_BUILD_REF_TYPES 1)
set (WAMR_BUILD_AOT_CHERI_PTR 16)
set (WAMR_BUILD_AOT_EXCEPTION_WORKAROUND 1)

# build vmlib
set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../..)
set (WAMR_INCLUDE_DIR "${WAMR_ROOT_DIR}/core/iwasm/include")

set (WAMR_BUILD_ROOT_DIR ${CMAKE_CURRENT_BINARY_DIR}/../..)

include (${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)

add_library(vmlib ${WAMR_RUNTIME_LIB_SOURCE})

include (${WAMR_ROOT_DIR}/core/shared/utils/uncommon/shared_uncommon.cmake)

add_executable (${PROJECT_NAME} "../main.c" ${UNCOMMON_SHARED_SOURCE} "../test_routines.cpp" "../test_routines.h")

check_pie_supported()
set_target_properties (${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE CXX)

target_link_options(${PROJECT_NAME} PUBLIC "SHELL:-Xlinker -Map" "SHELL:-Xlinker externrefapp.map")

target_link_libraries (${PROJECT_NAME} vmlib ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -lm -ldl -lpthread "-static")

# In the case that fast interp is used, and we have debug mode, we need to optimise the file size as
# handler table too big for range of +/-sizeof(int16)
if (WAMR_BUILD_FAST_INTERP AND CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "**** IMPORTANT **** Optimising fast interp file for size on CHERI Debug builds")
    set_source_files_properties( ${IWASM_INTERP_DIR}/${INTERPRETER} PROPERTIES COMPILE_FLAGS "-Os" )
endif()

install (TARGETS ${PROJECT_NAME} DESTINATION bin)

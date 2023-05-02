# Copyright (C) 2023 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# CMake file for linux to produce native shared object library for WAMR testing.
# Script assumes the build output folder will be <wamr_build_root>/native-test-lib/<platform> where
# the WAMR build output folder is <wamr_build_root>/<platform>.

cmake_minimum_required (VERSION 3.14)

project("wamr-native-test-lib" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

message(STATUS "*** Build WAMR native test Lib ***")

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** Linux platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

# Set WAMR_BUILD_TARGET, currently values supported:
# "X86_64", "AMD_64", "X86_32", "AARCH64[sub]", "ARM[sub]", "THUMB[sub]",
# "MIPS", "XTENSA", "RISCV64[sub]", "RISCV32[sub]"
if (NOT DEFINED WAMR_BUILD_TARGET)
  if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
    set (WAMR_BUILD_TARGET "AARCH64")
  elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv64")
    set (WAMR_BUILD_TARGET "RISCV64")
  elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
    # Build as X86_64 by default in 64-bit platform
    set (WAMR_BUILD_TARGET "X86_64")
  elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
    # Build as X86_32 by default in 32-bit platform
    set (WAMR_BUILD_TARGET "X86_32")
  else ()
    message(SEND_ERROR "Unsupported build target platform!")
  endif ()
endif ()

if (NOT DEFINED CMAKE_C_COMPILER)
    set (CMAKE_C_COMPILER "gcc")
endif ()

if (NOT_DEFINED_CMAKE_CXX_COMPLIER)
    set (CMAKE_CXX_COMPILER "g++")
endif ()

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused")

if (NOT DEFINED WAMR_BUILD_PLATFORM)
    set (WAMR_BUILD_PLATFORM "linux")
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

set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../..)
set (WAMR_INCLUDE_DIR "${WAMR_ROOT_DIR}/core/iwasm/include")

set (WAMR_BUILD_ROOT_DIR ${CMAKE_CURRENT_BINARY_DIR}/../..)
set (WAMR_LIBIWASM_DIR "${WAMR_BUILD_ROOT_DIR}/${WAMR_BUILD_PLATFORM}")

add_library (${PROJECT_NAME} SHARED)

set_target_properties (${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE CXX)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)

set_target_properties (${PROJECT_NAME} PROPERTIES OUTPUT_NAME "wamr-native-test")

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}../ ${WAMR_INCLUDE_DIR})

target_sources(${PROJECT_NAME} PRIVATE "../cheri_wasm_native_test.h" "../cheri_wasm_native_test.cpp")

# Note on library linking:
# - libiwasm is only built as shared object
# - libm will still be needed dynamically (must be a dependency that cannot seem to resolve)
target_link_libraries(${PROJECT_NAME} -static-libstdc++ -static-libgcc -L${WAMR_LIBIWASM_DIR} -Wl,-Bstatic,-lm -Wl,-Bdynamic,-liwasm -Wl,-Bdynamic,-lc)

install (TARGETS ${PROJECT_NAME} DESTINATION lib)


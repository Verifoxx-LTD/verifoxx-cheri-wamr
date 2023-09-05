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

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

set (WAMR_BUILD_TARGET AARCH64)

set (TOOLCHAIN_PREFIX "aarch64-none-linux-gnu")

# Set the GNU toolchain builders
if (NOT DEFINED CHERI_GNU_TOOLCHAIN_DIR)
    set (CHERI_GNU_TOOLCHAIN_DIR "")		# Assume would be on path
else ()
    # Search paths
    set (CMAKE_FIND_ROOT_PATH "${CHERI_GNU_TOOLCHAIN_DIR}")
    set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

    message(STATUS "Toolchain binaries=${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-*")
    message(STATUS "CMAKE_FIND_ROOT_PATH=${CMAKE_FIND_ROOT_PATH}")

    if (NOT DEFINED CMAKE_SYS_ROOT)
        set(CMAKE_SYS_ROOT "${CHERI_GNU_TOOLCHAIN_DIR}/libc")
        message(STATUS "CMAKE_SYS_ROOT=${CHERI_GNU_TOOLCHAIN_DIR}")
    endif ()
endif ()

if (NOT DEFINED CMAKE_C_COMPILER)
    set (CMAKE_C_COMPILER "${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-gcc")
endif ()

if (NOT_DEFINED_CMAKE_CXX_COMPLIER)
    set (CMAKE_CXX_COMPILER "${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-g++")
endif ()

if (NOT DEFINED CHERI_COMPILER_FLAGS)
    set (CHERI_COMPILER_FLAGS "")
else ()
    message(STATUS "Initial compiler flags passed in: ${CHERI_COMPILER_FLAGS}")
endif ()

# Set Build flags for the targetted architecture
if (CHERI_PURECAP)
    message(STATUS "CHERI pure-cap mode enabled")

    set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} -march=morello+c64 -mabi=purecap")
    add_compile_definitions(ENABLE_CHERI_PURECAP=1)

else ()
    message(STATUS "CHERI hybrid capability mode enabled")
    set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} -march=morello")
    message (STATUS "** Hybrid versions of needed dynamic libraries will be searched in standard Library path, you need to copy libiwasm.so to e.g /lib and then run ldconfig to update cache **")
endif ()

# Final common compiler flags adds options to save build files and set the __FILE__ mapping folder
set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} -save-temps")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CHERI_COMPILER_FLAGS}")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CHERI_COMPILER_FLAGS}")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

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

set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused")

# Provide fixed set of WAMR configuration
set (WAMR_BUILD_INTERP 1)
set (WAMR_BUILD_AOT 1)
set (WAMR_BUILD_JIT 0)
set (WAMR_BUILD_LIBC_BUILTIN 1)
set (WAMR_BUILD_LIBC_WASI 1)
set (WAMR_DISABLE_HW_BOUND_CHECK 1)
set (WAMR_BUILD_REF_TYPES 1)
set (WAMR_BUILD_AOT_CHERI_PTR 0)
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

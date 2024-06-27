# Copyright (C) 2023 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# CMake file for linux-cheri-purecap to produce native shared object library for WAMR testing.
# Script assumes the build output folder will be <wamr_build_root>/native-test-lib/<platform> where
# the WAMR build output folder is <wamr_build_root>/<platform>.

cmake_minimum_required (VERSION 3.14)

project("wamr-native-test-lib" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

message(STATUS "*** Build WAMR native test Lib ***")

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** Linux CHERI Pure-cap platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

if (NOT DEFINED MORELLO_PURECAP_LIBS_FOLDER)
    set(MORELLO_PURECAP_LIBS_FOLDER "/purecap-lib")
endif ()

set (WAMR_BUILD_TARGET AARCH64)

if (CHERI_USE_LLVM_TOOLCHAIN)
    message(STATUS "*** LLVM TOOLCHAIN SELECTED ***")

    # Set the LLVM toolchain builders
    if (NOT DEFINED CHERI_LLVM_TOOLCHAIN_DIR)
        set (CHERI_LLVM_TOOLCHAIN_DIR "")		# Assume would be on path
    else ()
        set (CMAKE_FIND_ROOT_PATH "${CHERI_LLVM_TOOLCHAIN_DIR}")
        set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
        set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
        set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

        message(STATUS "Toolchain binaries=${CHERI_LLVM_TOOLCHAIN_DIR}/bin/clang")
        message(STATUS "CMAKE_FIND_ROOT_PATH=${CMAKE_FIND_ROOT_PATH}")
    endif ()

    if (NOT DEFINED CHERI_MUSL_TOOLCHAIN_DIR)
        message(STATUS "CHERI_MUSL_TOOLCHAIN_DIR not being set therefore no bespoke SYSROOT being used")
    elseif (NOT DEFINED CMAKE_SYSROOT)
        set (CMAKE_SYSROOT ${CHERI_MUSL_TOOLCHAIN_DIR})
        message(STATUS "SYSROOT set to ${CMAKE_SYSROOT}")
    endif ()

    if (NOT DEFINED CMAKE_C_COMPILER)
        set (CMAKE_C_COMPILER "${CHERI_LLVM_TOOLCHAIN_DIR}/bin/clang")
    endif ()

    if (NOT_DEFINED_CMAKE_CXX_COMPLIER)
        set (CMAKE_CXX_COMPILER "${CHERI_LLVM_TOOLCHAIN_DIR}/bin/clang++")
    endif ()

    # Build flags - purecap or not	
    if (CHERI_PURECAP)
        message(STATUS "CHERI pure-cap mode enabled")
        set (CHERI_ARCH_ABI "-march=morello+c64 -mabi=purecap")
        set (CHERI_ARCH_ABI "${CHERI_ARCH_ABI} --target=aarch64-unknown-linux-musl_purecap")

        # Link options
        set (LINK_OPTIONS_SETTINGS "-Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER}" "-Wl,--gc-sections")
    else ()
        message(STATUS "CHERI hybrid capability mode enabled")
        set (CHERI_ARCH_ABI "-march=morello --target=aarch64-unknown-linux-gnu")
        
        # Link options
        set (LINK_OPTIONS_SETTINGS "")
    endif ()
else ()
    message(STATUS "*** Using GNU TOOLCHAIN ***")

    # If a toolchain file has not been used, try and figure out the toolchain based on
    # CHERI_GNU_TOOLCHAIN_DIR and the machine architecture

    # Figure out the toolchain prefix depending on whether we are on an aarch64 host or not
    # If not we are doing cross-compilation, if so we are on the target
    if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
        message(STATUS "Target compilation detected")
	    set (CHERI_BUILD_HOST_TARGET "aarch64")
    else ()
        set (CHERI_BUILD_HOST_TARGET "none")
	    message(STATUS "Cross-compilation detected")
    endif ()

    set (TOOLCHAIN_PREFIX "aarch64-${CHERI_BUILD_HOST_TARGET}-linux-gnu")

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

    # Build flags - purecap or not	
    if (CHERI_PURECAP)
        message(STATUS "CHERI pure-cap mode enabled")
        set (CHERI_ARCH_ABI "${CHERI_COMPILER_FLAGS} -march=morello+c64 -mabi=purecap")
        set(LINK_OPTIONS_SETTINGS "-Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER}" "-Wl,--gc-sections")
    else ()
        message(STATUS "CHERI hybrid capability mode enabled")
        set (CHERI_ARCH_ABI "${CHERI_COMPILER_FLAGS} -march=morello")
        set(LINK_OPTIONS_SETTINGS "")
    endif ()

endif()

if (NOT DEFINED CHERI_COMPILER_FLAGS)
    set (CHERI_COMPILER_FLAGS "")
else ()
    message(STATUS "Initial compiler flags passed in: ${CHERI_COMPILER_FLAGS}")
endif ()

# Final common compiler flags
set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} ${CHERI_ARCH_ABI}")

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

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-unused")

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

target_link_options(${PROJECT_NAME} PRIVATE ${LINK_OPTIONS_SETTINGS})

# Note on library linking:
# - libiwasm is only built as shared object
# - libm will still be needed dynamically (must be a dependency that cannot seem to resolve)
if (CHERI_USE_LLVM_TOOLCHAIN)
    target_link_libraries (${PROJECT_NAME} -L${WAMR_LIBIWASM_DIR} -Wl,-Bstatic,-lc++ -Wl,-Bstatic,-lc++abi -Wl,-Bstatic,-lunwind -Wl,-Bstatic,-lm -Wl,-Bdynamic,-liwasm, -Wl,-Bdynamic,-lc)
else ()
    target_link_libraries(${PROJECT_NAME} -static-libstdc++ -static-libgcc -L${WAMR_LIBIWASM_DIR} -Wl,-Bstatic,-lm -Wl,-Bdynamic,-liwasm -Wl,-Bdynamic,-lc)
endif ()

install (TARGETS ${PROJECT_NAME} DESTINATION lib)

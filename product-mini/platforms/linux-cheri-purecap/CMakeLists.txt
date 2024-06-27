# Copyright (C) 2023 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# CMake script for Linux-Cheri-purecap builds.
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds
# Must set CHERI_GNU_TOOLCHAIN_DIR to location of the GNU toolchain root
# Use CHERI_STATIC_BUILD=1/0 (default 1) for static linking


cmake_minimum_required (VERSION 3.14)

project("wasm" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** Linux CHERI Pure-cap platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

# Static build?
if (NOT DEFINED CHERI_STATIC_BUILD)
    set (CHERI_STATIC_BUILD 1)
endif ()

# Default for purecap library rpath folder
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

# Link options
set (LINK_OPTIONS_SETTINGS ${LINK_OPTIONS_SETTINGS} -Wl,-Map=iwasm.map)

if (NOT DEFINED CHERI_COMPILER_FLAGS)
    set (CHERI_COMPILER_FLAGS "")
else ()
    message(STATUS "Initial compiler flags passed in: ${CHERI_COMPILER_FLAGS}")
endif ()

if (CHERI_STATIC_BUILD)
    message(STATUS "Final link is static")
    set (CHERI_STATIC_LINK_FINAL "-static")
else ()
    message(STATUS "Final link is dyanmic (you will require CRT and C++ stdlib along with all DLLs")
    set (CHERI_STATIC_LINK_FINAL "")
endif ()

# Final common compiler flags adds option to set the __FILE__ mapping folder
set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} ${CHERI_ARCH_ABI} -ffile-prefix-map=${CMAKE_SOURCE_DIR}=.")

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
set (CMAKE_CXX_STANDARD 14)

enable_language(C CXX ASM)

if (NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif ()
message(STATUS "Build Type=${CMAKE_BUILD_TYPE}")

##### Configure WAMR features #####
if (NOT DEFINED WAMR_BUILD_MEMORY_TRACING)
set (WAMR_BUILD_MEMORY_TRACING 0)  # Disable by default
endif ()

if (NOT DEFINED WAMR_BUILD_INTERP)
  # Enable Interpreter by default
  set (WAMR_BUILD_INTERP 1)
endif ()

if (NOT DEFINED WAMR_BUILD_AOT)
  # Enable AOT by default.
  set (WAMR_BUILD_AOT 1)
endif ()

if (NOT DEFINED WAMR_BUILD_JIT)
  # Disable JIT by default.
  set (WAMR_BUILD_JIT 0)
endif ()

if (NOT DEFINED WAMR_BUILD_FAST_JIT)
  # Disable Fast JIT by default
  set (WAMR_BUILD_FAST_JIT 0)
endif ()

if (NOT DEFINED WAMR_BUILD_LIBC_BUILTIN)
  # Enable libc builtin support by default
  set (WAMR_BUILD_LIBC_BUILTIN 1)
endif ()

if (NOT DEFINED WAMR_BUILD_LIBC_WASI)
  # Enable libc wasi support by default
  set (WAMR_BUILD_LIBC_WASI 1)
endif ()

if (NOT DEFINED WAMR_BUILD_FAST_INTERP)
  # Enable fast interpreter
  set (WAMR_BUILD_FAST_INTERP 1)
endif ()

if (NOT DEFINED WAMR_BUILD_MULTI_MODULE)
  # Disable multiple modules by default
  set (WAMR_BUILD_MULTI_MODULE 0)
endif ()

if (NOT DEFINED WAMR_BUILD_LIB_PTHREAD)
  # Disable pthread library by default
  set (WAMR_BUILD_LIB_PTHREAD 0)
endif ()

if (NOT DEFINED WAMR_BUILD_LIB_WASI_THREADS)
  # Disable wasi threads library by default
  set (WAMR_BUILD_LIB_WASI_THREADS 0)
endif()

if (NOT DEFINED WAMR_BUILD_MINI_LOADER)
  # Disable wasm mini loader by default
  set (WAMR_BUILD_MINI_LOADER 0)
endif ()

if (NOT DEFINED WAMR_BUILD_SIMD)
  # Enable SIMD by default
  set (WAMR_BUILD_SIMD 1)
endif ()

if (NOT DEFINED WAMR_BUILD_REF_TYPES)
  # Disable reference types by default
  set (WAMR_BUILD_REF_TYPES 0)
endif ()

if (NOT DEFINED WAMR_BUILD_DEBUG_INTERP)
  # Disable Debug feature by default
  set (WAMR_BUILD_DEBUG_INTERP 0)
endif ()

if (NOT DEFINED WAMR_BUILD_DEBUG_PREPROCESSOR)
  # Disable Debug Preprocessor by default
  set (WAMR_BUILD_DEBUG_PREPROCESSOR 0)
endif ()

if (DEFINED WAMR_BUILD_PERF_PROFILING)
  # Set the CHERI perf profiling extension for this build target
  set (WAMR_BUILD_CHERI_PERF_PROFILING ${WAMR_BUILD_PERF_PROFILING})
endif ()

if (WAMR_BUILD_DEBUG_INTERP EQUAL 1)
  set (WAMR_BUILD_FAST_INTERP 0)
  set (WAMR_BUILD_MINI_LOADER 0)
  set (WAMR_BUILD_SIMD 0)
endif ()

set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../..)

include (${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)
add_library(vmlib ${WAMR_RUNTIME_LIB_SOURCE})

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused")

if ( CMAKE_BUILD_TYPE STREQUAL "Release")
    message(STATUS "Stripping debug symbols")
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,--strip-debug")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wl,--strip-debug")
endif ()


# The following flags are to enhance security, but it may impact performance,
# we disable them by default.
#if (WAMR_BUILD_TARGET MATCHES "X86_.*" OR WAMR_BUILD_TARGET STREQUAL "AMD_64")
#  set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ftrapv -D_FORTIFY_SOURCE=2")
#endif ()
#set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector-strong --param ssp-buffer-size=4")
#set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,-z,noexecstack,-z,relro,-z,now")

include (${SHARED_DIR}/utils/uncommon/shared_uncommon.cmake)

add_executable (iwasm main.c ${UNCOMMON_SHARED_SOURCE})

check_pie_supported()
set_target_properties (iwasm PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE CXX)

target_link_options(iwasm PUBLIC ${LINK_OPTIONS_SETTINGS})

if (CHERI_USE_LLVM_TOOLCHAIN)
    target_link_libraries (iwasm vmlib ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -lc++ -lc++abi -lunwind -lm -ldl -lpthread -lc ${CHERI_STATIC_LINK_FINAL})
else ()
    target_link_libraries (iwasm vmlib ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -static-libstdc++ -static-libgcc -lm -ldl -lpthread ${CHERI_STATIC_LINK_FINAL})
endif ()

add_library (libiwasm SHARED ${WAMR_RUNTIME_LIB_SOURCE})

set_target_properties (libiwasm PROPERTIES OUTPUT_NAME iwasm)

# In the case that fast interp is used, and we have debug mode, we need to optimise the file size as
# handler table too big for range of +/-sizeof(int16)

if (WAMR_BUILD_FAST_INTERP AND CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "**** IMPORTANT **** Optimising fast interp file for size on CHERI Debug builds")
    set_source_files_properties( ${IWASM_INTERP_DIR}/${INTERPRETER} PROPERTIES COMPILE_FLAGS "-Os" )
endif()


# NOTE: Morello shared libraries will be built for hybrid
# For building the libiwasm shared object, build as much as possible statically and for purecap provide the RPATH so it can find needed runtime dependencies
if (CHERI_PURECAP)
    target_link_options(libiwasm PUBLIC "-Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER}")
endif()
target_link_libraries (libiwasm ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -static-libstdc++ -static-libgcc -Wl,-Bstatic,-lm -Wl,-Bstatic,-ldl -Wl,-Bstatic,-lpthread -Wl,-Bdynamic,-lc)

install (TARGETS iwasm DESTINATION bin)
install (TARGETS libiwasm DESTINATION lib)
install (FILES ${CMAKE_CURRENT_BINARY_DIR}/iwasm.map DESTINATION bin)

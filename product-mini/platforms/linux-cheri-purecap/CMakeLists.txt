# Copyright (C) 2023 Verifoxx Limited.  All rights reserved.
# CMake script for Linux-Cheri-purecap builds.
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds
# Must set CHERI_GNU_TOOLCHAIN_DIR to location of the GNU toolchain root
# Use CHERI_STATIC_BUILD=1/0 (default 1) for static linking


cmake_minimum_required (VERSION 3.14)

project(wasm NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

if (NOT DEFINED CHERI_GNU_TOOLCHAIN_DIR)
    message(FATAL_ERROR "Must set CHERI_GNU_TOOLCHAIN_DIR to root of the GNU toolchain on the build machine!")
endif ()

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

set (WAMR_BUILD_TARGET AARCH64)

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
set (CMAKE_C_COMPILER "${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-gcc")
set (CMAKE_CXX_COMPILER "${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-g++")
set (LD_LINKER_NAME "${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-ld")

# Search paths
set (CMAKE_FIND_ROOT_PATH "${CHERI_GNU_TOOLCHAIN_DIR}")
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

message(STATUS "Toolchain binaries=${CHERI_GNU_TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PREFIX}-*")
message(STATUS "CMAKE_FIND_ROOT_PATH=${CMAKE_FIND_ROOT_PATH}")

# Build flags - purecap or not	
if (CHERI_PURECAP)
    message(STATUS "CHERI pure-cap mode enabled")
    set (CHERI_ARCH_ABI "-march=morello+c64 -mabi=purecap")
else ()
    message(STATUS "CHERI hybrid capability mode enabled")
    set (CHERI_ARCH_ABI "-march=morello")
endif ()

if (CHERI_STATIC_BUILD)
    message(STATUS "Final link is static")
    set (CHERI_STATIC_LINK_FLAG "-static")
else ()
    message(STATUS "Final link is dyanmic (you will require CRT and C++ stdlib along with all DLLs")
    set (CHERI_STATIC_LINK_FLAG "")
endif ()


set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CHERI_ARCH_ABI}")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CHERI_ARCH_ABI}")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

set (WAMR_BUILD_PLATFORM "linux-cheri-purecap")

# Reset default linker flags
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set (CMAKE_C_STANDARD 99)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif ()

enable_language(C CXX)

if (NOT DEFINED WAMR_BUILD_INTERP)
  # Enable Interpreter by default
  set (WAMR_BUILD_INTERP 1)
endif ()

if (NOT DEFINED WAMR_BUILD_FAST_INTERP)
  # Enable fast interpreter
  set (WAMR_BUILD_FAST_INTERP 1)
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
  set (WAMR_BUILD_LIBC_BUILTIN 0)		# Disable libc builtin
endif ()

if (NOT DEFINED WAMR_BUILD_LIBC_WASI)
  # Enable libc wasi support by default
  set (WAMR_BUILD_LIBC_WASI 1)
endif ()

if (NOT DEFINED WAMR_BUILD_MULTI_MODULE)
  # Disable multiple modules by default
  set (WAMR_BUILD_MULTI_MODULE 0)
endif ()

if (NOT DEFINED WAMR_BUILD_LIB_PTHREAD)
  # Disable pthread library by default
  set (WAMR_BUILD_LIB_PTHREAD 0)
endif ()

if (NOT DEFINED WAMR_BUILD_MINI_LOADER)
  # Disable wasm mini loader by default
  set (WAMR_BUILD_MINI_LOADER 0)
endif ()

if (NOT DEFINED WAMR_BUILD_SIMD)
  # Enable SIMD by default
  set (WAMR_BUILD_SIMD 0)	# Disable for morello
endif ()

if (NOT DEFINED WAMR_BUILD_REF_TYPES)
  # Disable reference types by default
  set (WAMR_BUILD_REF_TYPES 0)
endif ()

if (NOT DEFINED WAMR_BUILD_DEBUG_INTERP)
  # Disable Debug feature by default
  set (WAMR_BUILD_DEBUG_INTERP 0)
endif ()

if (WAMR_BUILD_DEBUG_INTERP EQUAL 1)
  set (WAMR_BUILD_FAST_INTERP 0)
  set (WAMR_BUILD_MINI_LOADER 0)
  set (WAMR_BUILD_SIMD 0)
endif ()

if (COLLECT_CODE_COVERAGE EQUAL 1)
  set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-arcs -ftest-coverage")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif ()

set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../..)

include (${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)
add_library(vmlib ${WAMR_RUNTIME_LIB_SOURCE})

set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused")

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
set_target_properties (iwasm PROPERTIES POSITION_INDEPENDENT_CODE ON)

install (TARGETS iwasm DESTINATION bin)

target_link_libraries (iwasm vmlib ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -lm -ldl -lpthread ${CHERI_STATIC_LINK_FLAG})

add_library (libiwasm SHARED ${WAMR_RUNTIME_LIB_SOURCE})

install (TARGETS libiwasm DESTINATION lib)

set_target_properties (libiwasm PROPERTIES OUTPUT_NAME iwasm)

target_link_libraries (libiwasm ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -lm -ldl -lpthread)

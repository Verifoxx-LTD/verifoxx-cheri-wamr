# Copyright (C) 2023 Verifoxx Limited.  All rights reserved.
# CMake script for wamr-app, Linux-Cheri-purecap builds.
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds
# Must set CHERI_GNU_TOOLCHAIN_DIR to location of the GNU toolchain root
# Use CHERI_STATIC_BUILD=1/0 (default 1) for static linking
# Use WAMR_APP=1 to build this app


cmake_minimum_required (VERSION 3.14)

project("wamr-native-test-lib" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)

message(STATUS "*** Build WAMR native test Lib ***")

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** Linux CHERI Pure-cap platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

if (NOT DEFINED MORELLO_PURECAP_LIBS_FOLDER)
set(MORELLO_PURECAP_LIBS_FOLDER "/purecap-lib")
endif ()

message(STATUS "Purecap versions of needed dynamic libraries will be searched in ${MORELLO_PURECAP_LIBS_FOLDER}")


# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

set (WAMR_BUILD_TARGET AARCH64)

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


if (NOT DEFINED CHERI_COMPILER_FLAGS)
    set (CHERI_COMPILER_FLAGS "")
else ()
    message(STATUS "Initial compiler flags passed in: ${CHERI_COMPILER_FLAGS}")
endif ()

# Set Build flags for the targetted architecture
if (CHERI_PURECAP)
    message(STATUS "CHERI pure-cap mode enabled")
    set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} -march=morello+c64 -mabi=purecap")
else ()
    message(STATUS "CHERI hybrid capability mode enabled")
    set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} -march=morello")
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

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-unused")# -Wl,-Bstatic,-lstdc++,-lm,-lc,-Bdynamic")

set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../..)
set (WAMR_INCLUDE_DIR "${WAMR_ROOT_DIR}/core/iwasm/include")

set (WAMR_BUILD_ROOT_DIR ${CMAKE_CURRENT_BINARY_DIR}/../../..)
set (WAMR_LIBIWASM_DIR "${WAMR_BUILD_ROOT_DIR}/${WAMR_BUILD_PLATFORM}")

add_library (${PROJECT_NAME} SHARED)

set_target_properties (${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE CXX)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)

set_target_properties (${PROJECT_NAME} PROPERTIES OUTPUT_NAME "wamr-native-test")

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${WAMR_INCLUDE_DIR})

target_sources(${PROJECT_NAME} PRIVATE "cheri_wasm_native_test.h" "cheri_wasm_native_test.cpp")

target_link_libraries(${PROJECT_NAME} "-static-libstdc++ -static-libgcc -L${WAMR_LIBIWASM_DIR} -Wl,-Bdynamic,-liwasm -Wl,-Bdynamic,-lc -Wl,-Bstatic,-lm -Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER}")

install (TARGETS ${PROJECT_NAME} DESTINATION lib)

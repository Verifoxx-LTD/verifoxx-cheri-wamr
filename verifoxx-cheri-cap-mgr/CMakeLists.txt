# Copyright (C) 2023 Verifoxx Limited.  All rights reserved.
# CMake script for wamr-app, Linux-Cheri-purecap builds.
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds
# Must set CHERI_GNU_TOOLCHAIN_DIR to location of the GNU toolchain root
# Use CHERI_STATIC_BUILD=1/0 (default 1) for static linking
# Use WAMR_APP=1 to build this app


cmake_minimum_required (VERSION 3.14)

project("cheri-cap-mgr" LANGUAGES C CXX ASM)

include(CheckPIESupported)
include(CMakeForceCompiler)

check_pie_supported()

add_executable (${PROJECT_NAME})

# Build WAMR as .so
set (WAMR_LIB "libiwasm")

message(STATUS "*** Verifoxx CHERI Capability Manager Example ***")

set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_SYSTEM_VERSION 1)

set(CMAKE_VERBOSE_MAKEFILE ON)

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

if (NOT DEFINED CAPMGR_BUILT_STATIC)
    set (CAPMGR_BUILT_STATIC 0)
endif ()

set (WAMR_BUILD_TARGET AARCH64)

# Support cross-compilation only (makes things easier) - LLVM or GNU

if ( (DEFINED CHERI_USE_LLVM_TOOLCHAIN) AND (CHERI_USE_LLVM_TOOLCHAIN) )
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
        set (LINK_OPTIONS_SETTINGS "-Wl,--gc-sections" "-nostdlib" "-L${CHERI_MUSL_TOOLCHAIN_DIR}/lib"
                "${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crt1.o"
                "${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crti.o"
                "${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crtn.o"
                "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/13.0.0/lib/aarch64-unknown-linux-musl_purecap/clang_rt.crtbegin.o"
                "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/13.0.0/lib/aarch64-unknown-linux-musl_purecap/clang_rt.crtend.o"
                "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/13.0.0/lib/aarch64-unknown-linux-musl_purecap/libclang_rt.builtins.a"
                )

    else ()
        message(STATUS "CHERI hybrid capability mode enabled")
        set (CHERI_ARCH_ABI "-march=morello")
        if (DEFINED CHERI_USE_LLVM_TOOLCHAIN)
            set (CHERI_ARCH_ABI "${CHERI_ARCH_ABI} --target=aarch64-unknown-linux-gnu")
        endif ()

        # Link options
        #set (LINK_OPTIONS_SETTINGS "-static")
        set (LINK_OPTIONS_SETTINGS "")
    endif ()

else ()
    message(STATUS "*** GNU TOOLCHAIN SELECTED ***")

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

    # Set Build flags for the target architecture
    if (CHERI_PURECAP)
        message(STATUS "CHERI pure-cap mode enabled")
        set (CHERI_ARCH_ABI "-march=morello+c64 -mabi=purecap")
    else ()
        message(STATUS "CHERI hybrid capability mode enabled")
        set (CHERI_ARCH_ABI "-march=morello")
    endif ()

    set (LINK_OPTIONS_SETTINGS "")

endif () # TOOLCHAIN #

if (NOT DEFINED CHERI_COMPILER_FLAGS)
    set (CHERI_COMPILER_FLAGS "")
else ()
    message(STATUS "Initial compiler flags passed in: ${CHERI_COMPILER_FLAGS}")
endif ()

if (NOT DEFINED MORELLO_PURECAP_LIBS_FOLDER)
    set(MORELLO_PURECAP_LIBS_FOLDER "/purecap-lib")
endif()

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CHERI_ARCH_ABI} ${CHERI_COMPILER_FLAGS}")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CHERI_ARCH_ABI} ${CHERI_COMPILER_FLAGS}")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

set (WAMR_BUILD_PLATFORM "linux-cheri-purecap")

# Reset default linker flags
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set (CMAKE_C_STANDARD 99)
set (CMAKE_CXX_STANDARD 14)

if (NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif ()
message(STATUS "Build Type=${CMAKE_BUILD_TYPE}")

# Configure WAMR features
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
  set (WAMR_BUILD_SIMD 0)
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


if (WAMR_BUILD_DEBUG_INTERP EQUAL 1)
  set (WAMR_BUILD_FAST_INTERP 0)
  set (WAMR_BUILD_MINI_LOADER 0)
  set (WAMR_BUILD_SIMD 0)
endif ()


set (WAMR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)

include (${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)

set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wshadow -fno-eliminate-unused-debug-symbols")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wformat -Wformat-security -Wno-unused -fno-eliminate-unused-debug-symbols")

include (${SHARED_DIR}/utils/uncommon/shared_uncommon.cmake)

###### WAMR libiwasm ########
add_library (${WAMR_LIB} SHARED ${WAMR_RUNTIME_LIB_SOURCE}
    "common/comp_common_defs.h"
    "common/comp_common_asm.h"
    "compartment/comp_entry.cpp"
    "compartment/comp_entry_trampoline_asm.S"
    "common/CCompartmentData.h"
)

target_include_directories(${WAMR_LIB} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/compartment
    ${CMAKE_CURRENT_SOURCE_DIR}/common
    ${CMAKE_CURRENT_SOURCE_DIR}/utils
)

# Note that static vmlib not needed - WAMR only in DLL now

add_dependencies(${PROJECT_NAME} ${WAMR_LIB})

set_target_properties (${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE CXX)
set_property(TARGET ${PROJECT_NAME}  PROPERTY CXX_STANDARD 14)

# Cap manager static build or not
if (CAPMGR_BUILD_STATIC)
    target_compile_definitions(${PROJECT_NAME} PUBLIC CAPMGR_BUILT_STATIC_ENABLE=1)
else ()
    target_compile_definitions(${PROJECT_NAME} PUBLIC CAPMGR_BUILT_STATIC_ENABLE=0)
endif ()


set_target_properties (${WAMR_LIB} PROPERTIES OUTPUT_NAME iwasm)

# In the case that fast interp is used, and we have debug mode, we need to optimise the file size as
# handler table too big for range of +/-sizeof(int16)

if (WAMR_BUILD_FAST_INTERP AND CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "**** IMPORTANT **** Optimising fast interp file for size on CHERI Debug builds")
    set_source_files_properties( ${IWASM_INTERP_DIR}/${INTERPRETER} PROPERTIES COMPILE_FLAGS "-Os" )
endif()

# WAMR lib is built with RPATH so dependencies can be found
target_link_options(${WAMR_LIB} BEFORE PRIVATE -static-libstdc++ -static-libgcc -Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER})
target_link_libraries (${WAMR_LIB} ${LLVM_AVAILABLE_LIBS} ${UV_A_LIBS} -Wl,-Bstatic,-lpthread -Wl,-Bstatic,-ldl -Wl,-Bdynamic,-lm -Wl,-Bdynamic,-lc)

include(${CMAKE_CURRENT_LIST_DIR}/macros.cmake)

# Capmgr files
ALL_FILES_AND_INC_FOLDERS(${CMAKE_CURRENT_SOURCE_DIR}/capmgr CAPMGR_FILES CAPMGR_INC_FOLDERS)

# Utils files
ALL_FILES_AND_INC_FOLDERS(${CMAKE_CURRENT_SOURCE_DIR}/utils UTILS_FILES UTILS_INC_FOLDERS)

# Common files
ALL_FILES_AND_INC_FOLDERS(${CMAKE_CURRENT_SOURCE_DIR}/common COMMON_FILES COMMON_INC_FOLDERS)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CAPMGR_INC_FOLDERS}
    ${UTILS_INC_FOLDERS}
    ${COMMON_INC_FOLDERS}
)

target_sources(${PROJECT_NAME} PRIVATE
    ${CAPMGR_FILES}
    ${UTILS_FILES}
    ${COMMON_FILES}
)

if (CAPMGR_BUILD_STATIC)
    target_link_options(${PROJECT_NAME} BEFORE PRIVATE ${LINK_OPTIONS_SETTINGS} -static-libstdc++ -static-libgcc)
    target_link_libraries(${PROJECT_NAME} -lpthread -ldl -lm -lc -static)
else ()
    target_link_options(${PROJECT_NAME} BEFORE PRIVATE ${LINK_OPTIONS_SETTINGS} -static-libstdc++ -static-libgcc -Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER})
    target_link_libraries(${PROJECT_NAME} -Wl,-Bstatic,-lpthread -Wl,-Bstatic,-ldl -Wl,-Bdynamic,-lm -Wl,-Bdynamic,-lc)
endif ()

install (TARGETS ${PROJECT_NAME})
install (TARGETS ${WAMR_LIB})

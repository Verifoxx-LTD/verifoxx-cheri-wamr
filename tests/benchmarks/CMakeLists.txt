# Copyright (C) 2023 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# CMake script for building debug versions of native benchmark code
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds

cmake_minimum_required (VERSION 3.20)

project("benchmarks" NONE)

include(CheckPIESupported)
include(CMakeForceCompiler)
include(FetchContent)

function(CloneRepository repositoryURL branchname projectName sourceDir)
  message(STATUS "Clone ${projectName} from ${repositoryURL} into ${sourceDir}")
  FetchContent_Declare(
    "${projectName}"
    GIT_REPOSITORY "${repositoryURL}"
    GIT_TAG "origin/${branchname}"
    SOURCE_DIR "${sourceDir}"
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
  )
  FetchContent_MakeAvailable(${projectName})
endfunction(CloneRepository)

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** Linux CHERI Pure-cap platform set ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

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

    # Build flags - purecap or not	
    if (CHERI_PURECAP)
        message(STATUS "CHERI pure-cap mode enabled")
        set (CHERI_ARCH_ABI "-march=morello+c64 -mabi=purecap-benchmark")
        set (CHERI_ARCH_ABI "${CHERI_ARCH_ABI} --target=aarch64-unknown-linux-musl_purecap")

        # Link options - note we always build statically
        set (LINK_OPTIONS_SETTINGS "-Wl,--gc-sections")
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

    # Build flags - purecap or not	
    if (CHERI_PURECAP)
        message(STATUS "CHERI pure-cap mode enabled")
        set (CHERI_ARCH_ABI "${CHERI_COMPILER_FLAGS} -march=morello+c64 -mabi=purecap")
        set(LINK_OPTIONS_SETTINGS "-Wl,--gc-sections")
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

message(STATUS "Final link is static")
set (CHERI_STATIC_LINK_FINAL "-static")

set (CHERI_COMPILER_FLAGS "${CHERI_COMPILER_FLAGS} ${CHERI_ARCH_ABI} -ffile-prefix-map=${CMAKE_SOURCE_DIR}=.")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CHERI_COMPILER_FLAGS}")

if (NOT DEFINED WAMR_BUILD_PLATFORM)
    set (WAMR_BUILD_PLATFORM "linux-cheri-purecap")
endif ()

# Reset default linker flags
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set (CMAKE_C_STANDARD 99)

enable_language(C)

if (NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif ()
message(STATUS "Build Type=${CMAKE_BUILD_TYPE}")

# Even for debug, build with -O3
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")

if ( CMAKE_BUILD_TYPE STREQUAL "Release")
    message(STATUS "Stripping debug symbols")
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,--strip-debug")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wl,--strip-debug")
endif ()

set (COREMARK_DIR ${CMAKE_CURRENT_SOURCE_DIR}/coremark/coremark)
set (DHRYSTONE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/dhrystone)
set (POLYBENCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/polybench/PolyBenchC-4.2.1)
set (SIGHTGLASS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/sightglass/sightglass)

### Install from git repos
CloneRepository("https://github.com/eembc/coremark.git" "main" "Coremark" ${COREMARK_DIR})
CloneRepository("https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1.git" "master" "Polybench" ${POLYBENCH_DIR})
CloneRepository("https://github.com/wasm-micro-runtime/sightglass.git" "main" "Sightglass" ${SIGHTGLASS_DIR})

set (COREMARKS "coremark")
set (DHRYSTONES "dhrystone")

# Polybenches is a bit different, we enumarate C files in the various folders...
set (POLYBENCH_CASES "datamining;linear-algebra;medley;stencils")

set (SIGHTGLASSES "base64;fib2;gimli;heapsort;matrix;memmove;nestedloop;nestedloop2;nestedloop3;random;seqhash;sieve;strchr;switch2")

message(STATUS "Process coremark...")
FILE(GLOB COREMARK_INCLUDE_FILES LIST_DIRECTORIES false "${COREMARK_DIR}/*.h")
FILE(GLOB COREMARK_INCLUDE_FILES_POSIX LIST_DIRECTORIES false "${COREMARK_DIR}/posix/*.h")

FOREACH (COREMARK ${COREMARKS})

    message(STATUS "Executable ${COREMARK}...")
    add_executable (${COREMARK}
        ${COREMARK_DIR}/core_list_join.c
        ${COREMARK_DIR}/core_main.c
        ${COREMARK_DIR}/core_matrix.c
        ${COREMARK_DIR}/core_state.c
        ${COREMARK_DIR}/core_util.c
        ${COREMARK_DIR}/posix/core_portme.c
    )
    target_sources(${COREMARK} PRIVATE ${COREMARK_INCLUDE_FILES} ${COREMARK_INCLUDE_FILES_POSIX})
    set_target_properties(${COREMARK} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE C)

	target_include_directories(${COREMARK} PUBLIC ${COREMARK_DIR} ${COREMARK_DIR}/posix)
    target_compile_definitions(${COREMARK} PUBLIC ITERATIONS=400000 SEED_METHOD=SEED_VOLATILE PERFORMANCE_RUN=1 CORE_DEBUG=1)
    target_compile_definitions(${COREMARK} PUBLIC FLAGS_STR="-O3 -DPERFORMANCE_RUN=1  -lrt")
	target_link_options(${COREMARK} PUBLIC ${LINK_OPTIONS_SETTINGS})
	target_link_libraries(${COREMARK} -lrt ${CHERI_STATIC_LINK_FINAL})
	
    if (CHERI_PURECAP)
	    set_target_properties (${COREMARK} PROPERTIES OUTPUT_NAME ${COREMARK}_native-purecap)
    else ()
	    set_target_properties (${COREMARK} PROPERTIES OUTPUT_NAME ${COREMARK}_native-hybrid)
    endif ()

    install (TARGETS ${COREMARK} DESTINATION bin)
ENDFOREACH ()

message(STATUS "Process Dhrystone...")
FILE(GLOB DHRYSTONE_INCLUDE_FILES LIST_DIRECTORIES false "${DHRYSTONE_DIR}/include/*.h")

FOREACH (DHRYSTONE ${DHRYSTONES})

    message(STATUS "Executable ${DHRYSTONE}...")
    add_executable (${DHRYSTONE}
        ${DHRYSTONE_DIR}/src/dhry_1.c
        ${DHRYSTONE_DIR}/src/dhry_2.c
    )
    target_sources(${DHRYSTONE} PRIVATE ${DHRYSTONE_INCLUDE_FILES})
    set_target_properties(${DHRYSTONE} PROPERTIES POSITION_INDEPENDENT_CODE ON LINKER_LANGUAGE C)

    target_include_directories(${DHRYSTONE} PUBLIC ${DHRYSTONE_DIR}/include)
	target_link_options(${DHRYSTONE} PUBLIC ${LINK_OPTIONS_SETTINGS})
	target_link_libraries(${DHRYSTONE} ${CHERI_STATIC_LINK_FINAL})

    if (CHERI_PURECAP)
	    set_target_properties (${DHRYSTONE} PROPERTIES OUTPUT_NAME ${DHRYSTONE}_native-purecap)
    else ()
	    set_target_properties (${DHRYSTONE} PROPERTIES OUTPUT_NAME ${DHRYSTONE}_native-hybrid)
    endif ()

    install (TARGETS ${DHRYSTONE} DESTINATION bin)
ENDFOREACH ()


message(STATUS "Process Polybench...")
FILE(GLOB POLYBENCH_UTIL_INCLUDE_FILES LIST_DIRECTORIES false "${POLYBENCH_DIR}/utilities/*.h")
FOREACH (POLYBENCH_CASE ${POLYBENCH_CASES})
    FILE(GLOB_RECURSE POLYBENCH_CASE_FILES "${POLYBENCH_DIR}/${POLYBENCH_CASE}/*.c")
    FOREACH(POLYBENCH_CASE_FILE ${POLYBENCH_CASE_FILES})
         CMAKE_PATH(GET POLYBENCH_CASE_FILE STEM LAST_ONLY POLYBENCH_TEST_NAME)

         # Ignore particular file
         if (${POLYBENCH_TEST_NAME} STREQUAL "Nussinov.orig")
             message(STATUS "SKIPPING ${POLYBENCH_TEST_NAME}")
         else ()
		     message(STATUS "Process ${POLYBENCH_TEST_NAME}...")

             add_executable(${POLYBENCH_TEST_NAME}
                 ${POLYBENCH_DIR}/utilities/polybench.c
                 ${POLYBENCH_CASE_FILE}
             )

             target_compile_definitions(${POLYBENCH_TEST_NAME} PUBLIC POLYBENCH_TIME=1)

             set(POLYBENCH_CASE_PATH ${POLYBENCH_CASE_FILE})
             CMAKE_PATH(REMOVE_FILENAME POLYBENCH_CASE_PATH)
             FILE(GLOB POLYBENCH_CASE_PATH_INCLUDE_FILES LIST_DIRECTORIES false "${POLYBENCH_CASE_PATH}/*.h")
             target_include_directories(${POLYBENCH_TEST_NAME} PUBLIC ${POLYBENCH_CASE_PATH} ${POLYBENCH_DIR}/utilities)
             target_sources(${POLYBENCH_TEST_NAME} PRIVATE ${POLYBENCH_UTIL_INCLUDE_FILES} ${POLYBENCH_CASE_PATH_INCLUDE_FILES})

	         target_link_options(${POLYBENCH_TEST_NAME} PUBLIC ${LINK_OPTIONS_SETTINGS})
	         target_link_libraries(${POLYBENCH_TEST_NAME} -lm ${CHERI_STATIC_LINK_FINAL})

             if (CHERI_PURECAP)
                 set_target_properties (${POLYBENCH_TEST_NAME} PROPERTIES OUTPUT_NAME polybench-${POLYBENCH_TEST_NAME}_native-purecap)
             else ()
                 set_target_properties (${POLYBENCH_TEST_NAME} PROPERTIES OUTPUT_NAME polybench-${POLYBENCH_TEST_NAME}_native-hybrid)
             endif ()

             install (TARGETS ${POLYBENCH_TEST_NAME} DESTINATION bin)
         endif ()
	ENDFOREACH ()
ENDFOREACH ()

message(STATUS "Process Sightglass...")
set (SIGHTGLASS_SHOOTOUT_DIR "${SIGHTGLASS_DIR}/benchmarks/shootout")
FILE(GLOB SIGHTGLASS_INCLUDE_FILES LIST_DIRECTORIES false "${SIGHTGLASS_DIR}/include/*.h")
FOREACH (SIGHTGLASS ${SIGHTGLASSES})

    message(STATUS "Process ${SIGHTGLASS}...")

    add_executable(${SIGHTGLASS}
        ${SIGHTGLASS_SHOOTOUT_DIR}/${SIGHTGLASS}.c
        ${SIGHTGLASS_SHOOTOUT_DIR}/main/main_${SIGHTGLASS}.c
        ${SIGHTGLASS_SHOOTOUT_DIR}/main/my_libc.c
     )

     target_sources(${SIGHTGLASS} PRIVATE ${SIGHTGLASS_INCLUDE_FILES})
     target_compile_definitions(${SIGHTGLASS} PUBLIC black_box=set_res bench=${SIGHTGLASS})

     target_include_directories(${SIGHTGLASS} PUBLIC "${SIGHTGLASS_DIR}/include")

     if (CHERI_USE_LLVM_TOOLCHAIN)
         message("For LLVM for Sightglass, we must add -Wl,--allow-multiple-definition as it does not recognise some gcc attributes")     
         target_link_options(${SIGHTGLASS} PUBLIC ${LINK_OPTIONS_SETTINGS} -Wl,--allow-multiple-definition)
     else ()
         target_link_options(${SIGHTGLASS} PUBLIC ${LINK_OPTIONS_SETTINGS})
     endif ()
	 target_link_libraries(${SIGHTGLASS} ${CHERI_STATIC_LINK_FINAL})

     if (CHERI_PURECAP)
         set_target_properties (${SIGHTGLASS} PROPERTIES OUTPUT_NAME sightglass-${SIGHTGLASS}_native-purecap)
     else ()
         set_target_properties (${SIGHTGLASS} PROPERTIES OUTPUT_NAME sightglass-${SIGHTGLASS}_native-hybrid)
     endif ()

     install (TARGETS ${SIGHTGLASS} DESTINATION bin)

ENDFOREACH ()

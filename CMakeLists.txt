# Copyright (C) 2023 Verifoxx Limited.  All rights reserved.
# CMake script for Linux-Cheri-purecap builds.
# Use CHERI_PURECAP=1/0 (default 1) for Pure-cap vs hybrid compatibility builds
# Must set CHERI_GNU_TOOLCHAIN_DIR to location of the GNU toolchain root
# Use CHERI_STATIC_BUILD=1/0 (default 1) for static linking

cmake_minimum_required (VERSION 3.0)

project("iwasm")

if (NOT DEFINED WAMR_BUILD_PLATFORM)
    message(FATAL_ERROR "When using cmake on root you must define WAMR_BUILD_PLATFORM")
endif ()

if ( (DEFINED WAMRC_TOOL) AND (WAMRC_TOOL) )
    add_subdirectory(wamr-compiler)

elseif ( (DEFINED WAMR_EXTERNREF_APP) AND (WAMR_EXTERNREF_APP) )
    # Build the native app only
    add_subdirectory(tests/wamr-linux-cheri-purecap-tests/externref-app/${WAMR_BUILD_PLATFORM} ${CMAKE_CURRENT_BINARY_DIR}/externref-app/${WAMR_BUILD_PLATFORM})

elseif ( (NOT DEFINED WAMR_APP) OR (NOT WAMR_APP) )
    add_subdirectory(product-mini/platforms/${WAMR_BUILD_PLATFORM} ${CMAKE_CURRENT_BINARY_DIR}/${WAMR_BUILD_PLATFORM})

    # If requested, also build native .so for test - depends on libiwasm.so so build AFTER WAMR build
    if ( (DEFINED WAMR_BUILD_NATIVE_TEST_LIB) AND WAMR_BUILD_NATIVE_TEST_LIB)
        add_subdirectory(tests/wamr-linux-cheri-purecap-tests/native_libs/${WAMR_BUILD_PLATFORM} ${CMAKE_CURRENT_BINARY_DIR}/native-test-lib/${WAMR_BUILD_PLATFORM})
    endif ()

else ()
    add_subdirectory(frontend)
endif ()

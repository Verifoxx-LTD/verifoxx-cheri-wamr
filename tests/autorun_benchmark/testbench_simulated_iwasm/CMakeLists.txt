# CMakeList.txt : CMake project for compartments example
#
cmake_minimum_required (VERSION 3.14)

project ("benchmark_iwasm_sim" LANGUAGES C CXX ASM)

include(CheckPIESupported)
include(CMakeForceCompiler)

add_executable (${PROJECT_NAME})

set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE TRUE)
set_property (TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)

set (CMAKE_SYSTEM_NAME Linux) # this one is important
set (CMAKE_SYSTEM_VERSION 1) # this one not so much
set (CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

# CHERI pure-cap enabled?
if (NOT DEFINED CHERI_PURECAP)
    set (CHERI_PURECAP 1)
endif ()

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
    if (DEFINED CHERI_USE_LLVM_TOOLCHAIN)
        set (CHERI_ARCH_ABI "${CHERI_ARCH_ABI} --target=aarch64-unknown-linux-musl_purecap")
    endif ()
else ()
    message(STATUS "CHERI hybrid capability mode enabled")
    set (CHERI_ARCH_ABI "-march=morello")
    if (DEFINED CHERI_USE_LLVM_TOOLCHAIN)
        set (CHERI_ARCH_ABI "${CHERI_ARCH_ABI} --target=aarch64-unknown-linux-gnu")
    endif ()
endif ()


set (COMPILER_COMMON_FLAGS "-Wall -Wextra -O0")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CHERI_ARCH_ABI} ${COMPILER_COMMON_FLAGS}")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CHERI_ARCH_ABI} ${COMPILER_COMMON_FLAGS}")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

# Reset default linker flags
set (CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set (CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set (CMAKE_C_STANDARD 99)

if (CHERI_PURECAP)
	set (LINK_OPTIONS_SETTINGS "-Wl,--gc-sections" "-nostdlib" "-L${CHERI_MUSL_TOOLCHAIN_DIR}/lib" -lc -lc++ -lc++abi -lunwind
		"${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crt1.o"
        "${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crti.o"
		"${CHERI_MUSL_TOOLCHAIN_DIR}/lib/crtn.o"
        "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/14.0.0/lib/aarch64-unknown-linux-musl_purecap/clang_rt.crtbegin.o"
        "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/14.0.0/lib/aarch64-unknown-linux-musl_purecap/clang_rt.crtend.o"
        "${CHERI_LLVM_TOOLCHAIN_DIR}/lib/clang/14.0.0/lib/aarch64-unknown-linux-musl_purecap/libclang_rt.builtins.a"
        -static)
else ()
	set (LINK_OPTIONS_SETTINGS "-static")
endif ()

target_link_options(${PROJECT_NAME} BEFORE PRIVATE "-fuse-ld=lld" ${LINK_OPTIONS_SETTINGS})

target_sources(${PROJECT_NAME} PRIVATE
        "main.cpp"
)
		
install (TARGETS ${PROJECT_NAME} DESTINATION bin)

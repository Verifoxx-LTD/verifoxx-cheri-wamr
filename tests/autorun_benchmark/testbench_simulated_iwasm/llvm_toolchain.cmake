if (NOT DEFINED CHERI_LLVM_TOOLCHAIN_DIR)
    if (NOT DEFINED ENV{CHERI_LLVM_TOOLCHAIN_DIR})
        message(FATAL_ERROR "Please set CHERI_LLVM_TOOLCHAIN_DIR to your LLVM root in bash env")
    else ()
        set(CHERI_LLVM_TOOLCHAIN_DIR $ENV{CHERI_LLVM_TOOLCHAIN_DIR})
    endif ()
endif ()

if (NOT DEFINED CHERI_MUSL_TOOLCHAIN_DIR)
    if (NOT DEFINED ENV{CHERI_MUSL_TOOLCHAIN_DIR})
        message(STATUS "CHERI_MUSL_TOOLCHAIN_DIR not set therefore no MUSL sysroot will be used (will use clang default)")
    else ()
        set(CHERI_MUSL_TOOLCHAIN_DIR $ENV{CHERI_MUSL_TOOLCHAIN_DIR})
        set(CMAKE_SYS_ROOT "${CHERI_MUSL_TOOLCHAIN_DIR}")
        message(STATUS "CMake sys root set to ${CMAKE_SYS_ROOT}")
    endif ()
endif ()

if (NOT DEFINED CMAKE_C_COMPILER)
    set(CMAKE_C_COMPILER "${CHERI_LLVM_TOOLCHAIN_DIR}/bin/clang")
endif ()

if (NOT DEFINED CMAKE_CXX_COMPILER)
    set(CMAKE_CXX_COMPILER "${CHERI_LLVM_TOOLCHAIN_DIR}/bin/clang++")
endif ()


set(CHERI_USE_LLVM_TOOLCHAIN 1)

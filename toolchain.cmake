if (NOT DEFINED CMAKE_C_COMPILER)
    set(CMAKE_C_COMPILER "aarch64-none-linux-gnu-gcc")
endif ()

if (NOT DEFINED CMAKE_CXX_COMPILER)
    set(CMAKE_CXX_COMPILER "aarch64-none-linux-gnu-g++")
endif ()

if (NOT DEFINED CHERI_GNU_TOOLCHAIN_DIR)
    if (NOT DEFINED ENV{CHERI_GNU_TOOLCHAIN_DIR})
        message(FATAL_ERROR "Please set CHERI_GNU_TOOLCHAIN_DIR to your gcc sysroot in bash env")
    else ()
        set(CHERI_GNU_TOOLCHAIN_DIR $ENV{CHERI_GNU_TOOLCHAIN_DIR})
    endif ()
endif ()

set(CMAKE_SYSROOT "${CHERI_GNU_TOOLCHAIN_DIR}/libc")
message(STATUS "CMake sys root set to ${CMAKE_SYSROOT}")

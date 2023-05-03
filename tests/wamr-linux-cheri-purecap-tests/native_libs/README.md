Native Libs Test Folder
=======================
This is a CMake folder used to build a shared object (.so) library containing native code which can be used with WASM that tests native functions.

The *iwasm* program requires loading native functions from a shared object, although if you were using WAMR with the VMLib for example then you would implement your own front end.

The contents here are therefore to enable testing of iwasm.
Supported Platforms:
- CHERI Morello Linux Pure-cap
- CHERI Morello Linux Hybrid-cap
- Linux x86_64 (baseline test)

CHERI Morello targets are built using *./linux-cheri-purecap/CMakeLists.txt* and x86_64 using *./linux/CMakeLists.txt*.

## Building the native library
The build is intended to be run as a sub-directory build from the CMakeLists.txt at the root level.
The same flags and configuration are required to set up the target platform - please refer to the ReadMe.md at the root level.

## Understanding the native library
The native library is some simple C++ code which implements native functions that can be called from WASM.
Additionally, some of these will call back into WASM exports.  Therefore this shared object library has a dependency on WAMR's *libiwasm.so*.
This library will export a single ordinal, *get_native_lib()*, which provides a function name string, signature and function pointer for each native function so that WAMR can load it.  Refer to standard WAMR documentation and samples for more on providing a native function library.

## Supporting Shared Objects on Morello
Unlike producing a dedicated codebase for native functions, the concept of creating a shared object library for iwasm presents a problem on Morello because the Morello platform is intended for static building only (at the present time).  This is because the Debian Linux SW stack produced for the Morello board is Arm64 only - CHERI pure-cap mode is not supported.  Therefore all shared object libraries, such as the C standard library, will not support pure-cap.

For Morello, we therefore have an issue because we need to build a shared object to contain our native functions (we cannot support a static library if it will work with dlopen()) but we somehow need to provide the dependent libraries such as the C++ and C standard libraries normally provided with glibc.

The solution to the problem for Linux pure-cap is as follows:
- Build the shared object library and include static versions of required runtime libraries were possible (e.g the C++ standard library)
- Override the default Linux library search path by specifying an rpath in our shared object.

This will cause dlopen() to ignore the standard library path, which will mean it will not load named libraries and accidentally try and pick the non-pure-cap versions

Populate the specified rpath folder on the Morello board with the pure-cap versions of required shared objects.

This requires a change to the build flags when building a shared object for our native code.  Assuming CMake is being used for this, the modified instructions are as given below:

```cmake
add_library (${PROJECT_NAME} SHARED)
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CHERI_COMPILER_FLAGS} -Wl,-rpath,${MORELLO_PURECAP_LIBS_FOLDER}")
target_link_libraries(${PROJECT_NAME} -static-libstdc++ -static-libgcc -L${WAMR_LIBIWASM_DIR} -Wl,-Bstatic,-lm -Wl,-Bdynamic,-liwasm -Wl,-Bdynamic,-lc)
```

The flags *-static-libstdc++* and *-static-libgcc* instruct to load the .a variant of these libraries instead if the .so ones as would normally be done, i.e to link them statically. We also attempt to link the rest of glibc, i.e the math functions, statically although it turns out there must be a dependency of the rest of the C standard library functions as this is still needed dynamically.  Additionally, libiwasm is still needed dynamically as it is not available statically (libiwasm is a WAMR generated library which provides functionality needed by native functions that call WASM exports).

The flag -Wl,-rpath,<path> instructs the linker to set the RPATH (or RUNPATH) to the given folder.  This is set previously to be a known folder on the Morello box where we can install purecap libraries without clashing with the built-in LD_LIBRARY_PATH on Morello (as if we did, we would break all the shell commands which need glibc, e.g ls command).  By default, we choose */purecap-libs/*.

The result of this is that a shared object library can be built, but only the following are the dependencies needed at runtime:
- libc.so
- libm.so
- libiwasm.so

These are copied into the e.g */purecap-libs/* folder on the Morello board, so they will be found when the library is loaded.

### Building libiwasm
Without libiwasm our native functions cannot call WASM functions, because to do so they require WAMR code in order to obtain the execution environment and allocate memory from the application heap (so that it is available to WASM code).

This functionality is made available by the libiwasm shared object library which is then a dependency of our native functions library.

Building libiwasm needs the same changes as for our native shared object library, as it also depends on pure-cap versions of glibc provided libraries.  Therefore the WAMR build for *libiwasm.so* on linux-cheri-purecap with Pure-cap mode enabled has a modified CMakeLists.txt to support these changes.

**NOTE:** No rpath needs to be supplied for the libiwasm build because it will be inherited from the parent shared object (in the same way a shared object inherits from its parent executable, if provided - consult the documentation for dlopen() for more details on this).  libiwasm will therefore use the libc.so and libm.so already provided for our native function library.

### Building for Linux-hybrid-cap Mode
In Hybrid we can use the shared objects that came with the Debian install.  Therefore supplying the shared objects separately is no longer required.
However, we do need to supply libiwasm.so since this is clearly not part of a standard Linux install.

The easiest solution to this is to copy it to a folder already on the library search path on the Morello box, such as */usr/lib*.
We must then though update the library cache by running ldconfig (with no arguments) from the Morello board shell, in order that our new libiwasm can be picked up and cached.

ExternRefs Test App Folder
==========================
This is a CMake folder used to build an small native executable which embeds WAMR as a static library.  This is used for externref testing, because for full testing a standalone execution environment is needed to call native -> WASM.

The *externref-app* program built here includes a number of native functions which are called back from WASM.
This test program is intended to be used with the *externrefs_for_app.wasm* application.

Supported Platforms:
- CHERI Morello Linux Pure-cap
- CHERI Morello Linux Hybrid-cap (not directly supported from the VS build system, set *CHERI_PUREPCAP=0* CMake variable)
- Linux x86_64 (baseline test)

CHERI Morello targets are built using *./linux-cheri-purecap/CMakeLists.txt* and x86_64 using *./linux/CMakeLists.txt*.

## Building the Test Application
The build is intended to be run as a sub-directory build from the CMakeLists.txt at the root level.
The same flags and configuration are required to set up the target platform - please refer to the ReadMe.md at the root level.

### CMake Configuration
The test application is intended to be built standalone.  To this end, a separate build target is defined in the supplied *CMakePresets.json* at the root level.
To build the test application, set *WAMR_EXTERNREF_APP=1*.
Note also that any WAMR configuration flags sourced from *CMakePresets* are ignored - the test app defines a basic minimal configuration itself, suitable for the target platform (linux-cheri-purecap or linux).

### Building WAMR Source Code
As per the WAMR guidelines for embedding WAMR functionality in a native application, the static *vmlib* is built as part of the test application build process and then linked with the executable and application source code.

## Using the Test Application
Simply run the program supplying a single argument which is the name of the WASM or AOT file to load.  Example:
```bash
externref-app externrefs_for_app.aot
```

## Understanding the Test Application
The application native *main()* function loads the module, creates the environment and then calls a number of test functions which must be exported from WASM.
The *test_routines.cpp* file provides a number of native functions which are called back from WASM to test externref operations.
Tests in the native code validate that externrefs returned from WASM functions match what was expected, and where applicable test data in the memory buffer passed is a match.
On CHERI purecap, in some tests capabilities are sealed before passing back to WASM and unsealed after returning.  In other tests, for simplification purposes, non-valid capabilities are used.

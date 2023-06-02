WAMR Linux CHERI Pure-cap Test Vectors
======================================
These WASM files have been used to test the WAMR port onto the Morello board.

The source from which they were generated (either C code or WAT) can be found in *src/* folder.  Each file includes instructions on how to generate the WASM.

A text version of the WASMs can be found in *wat_dumps/*.

Note that version which call native functions are primarily designed to run with the WAMR frontend, wamr-app.
This application includes a built set of native functions which are imported by the WASM.

## Building WASM
Any WASM which is generated from C code is built with Clang, for most of the tests you will need WASI 
support.  Although LLVM 8.0 or later supports WASM, to build the *wasm32-unknown-***wasi** target you will require the WASI-SDK libc to go with it.  By far the easiest thing is to obtain LLVM from WASI-SDK as then you don't need to install a separate download.

## TO DO
In future we should add either full instructions to download and build the LLVM provided from WASI or (better) an environment e.g a docker image to automatically build all the test WASMs directly from the C code or WAT.

For now, we include all WASMs instead even though they can be considered an "intermediate" fileset.

## Native Libs
This folder makes a unix shared object (.so) containing native functions, for use with iwasm native testing.

## WASI-testsuite
Support to run the WASI-testsuite remotely on Morello is provided, full details and needed scripts can be found [in this folder](wasi-testsuite).

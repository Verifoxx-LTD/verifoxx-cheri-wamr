Native Libs Test Folder
=======================
This is a CMake folder used to build a shared object (.so) library containing native code which can be used with WASM that tests native functions.

The *iwasm* program requires loading native functions from a shared object, although if you were using WAMR with the VMLib for example then you would implement your own front end.

The contents here are therefore to enable testing of iwasm.

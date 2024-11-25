WAMR Compiler Updates in VERIFOXX-CHERI-WAMR
============================================
This document has been updated with additional information on building and using the WAMRc AOT Compiler with CHERI Platforms.

## Building wamrc to support CHERI Pure-cap platforms
An additional CMake flag is provided, WAMR_BUILD_AOT_CHERI_PTR.  By default, this is set to 0 (same as undefined).
If a CHERI pure-cap platform will be one of the possible targets wamrc can generate AOT for, then you should set WAMR_BUILD_AOT_CHERI_PTR to the pure-cap capability pointer size in bytes.
This will affect **all** targets, which means that each target must be built with WAMR_BUILD_AOT_CHERI_PTR set the same as for wamrc.
However on the CHERI pure-cap target WAMR_BUILD_AOT_CHERI_PTR should be set equal to 0 because the native pointer size is already correct.

Note that on CHERI Morello Pure-cap the native capability pointer size is 16 bytes, therefore WAMR_BUILD_AOT_CHERI_PTR=16 when building wamrc.

### Using WAMR_BUILD_AOT_CHERI_PTR build flag
This macro is used on both WAMRc and WAMR.
When non-zero, it specifies the maximum size of a pointer on **any** target which WAMRc can generate an AOT file for.  This causes WAMRc to always pad and align structure pointers to the value given in WAMR_BUILD_AOT_CHERI_PTR.

In order for this to then work, the WAMR which will execute the AOT file must also be sure to align and pad pointers in the same structures to the same size.
On CHERI pure-cap platforms, when building WAMR then WAMR_BUILD_AOT_CHERI_PTR should be set to 0.  This is because the pointers are naturally the specified size anyway.
On all other platforms, when building WAMR then WAMR_BUILD_AOT_CHERI_PTR should be set the same as on WAMRc.

### Runtime checks when WAMR_BUILD_AOT_CHERI_PTR used
When WAMR_BUILD_AOT_CHERI_PTR is != 0 then the following checks will take place:
- When running WAMRc, it will warn you need to build WAMR with the flag set if you build for a target that is not CHERI Pure-cap
- When running WAMR, it will check affected structures are laid out correctly based on the value of WAMR_BUILD_AOT_CHERI_PTR

### Example of using WAMR_BUILD_AOT_CHERI_PTR
When CHERI Morello pure-cap is a *potential* WAMRc Target:
	- Build WAMRc with WAMR_BUILD_AOT_CHERI_PTR=16
	- Build Linux x86_64 with WAMR_BUILD_AOT_CHERI_PTR=16
	- Build Morello Hybrid-cap with WAMR_BUILD_AOT_CHERI_PTR=16
	- Build Morello pure-cap with WAMR_BUILD_AOT_CHERI_PTR=0 (or not defined)

## Using a Custom LLVM to Support CHERI Cross-Compilation in wamrc
By default, wamrc will find the built LLVM Toolchain in `<wamr_root>/core/deps/llvm` as this is where LLVM would be built if using scripts found within this project.

However to support Morello targets you may need to use a different, dedicated copy of the LLVM toolchain (e.g one provided by Arm which supports Morello).

To tell wamrc to use a different LLVM version proceed as follows:
1. Define the CMake flag WAMR_BUILD_WITH_CUSTOM_LLVM=1
2. Set the CMake flag LLVM_DIR to the LLVM Toolchain folder in your LLVM build which contains *LLVMConfig.cmake*.  This is almost certainly `<llvm_release_root_folder>/lib/cmake/llvm`.

Note that LLVM Libraries and Paths are echo'd by CMake when running CMakeLists.txt so it is possible to check the correct path is used.

**NOTE: This mechanism should be followed when building LLVM for Morello - do not use the LLC_COMPILER environment variables. **


## Build wamrc AOT compiler

Both wasm binary file and AOT file are supported by iwasm. The wamrc AOT compiler is to compile wasm binary file to AOT file which can also be run by iwasm. Execute following commands to build **wamrc** compiler for Linux:

```shell
cd wamr-compiler
./build_llvm.sh (or "./build_llvm_xtensa.sh" to support xtensa target)
mkdir build && cd build
cmake [-DWAMR_BUILD_AOT_CHERI_PTR=0|8|16] .. (or "cmake .. -DWAMR_BUILD_PLATFORM=darwin" for MacOS)
make
# wamrc is generated under current directory
```

For **Windows**：
```shell
cd wamr-compiler
python build_llvm.py
mkdir build && cd build
cmake ..
cmake --build . --config Release
# wamrc.exe is generated under .\Release directory
```

**NOTE: For Cross-Compilation to Morello, build wamrc on Linux x86_64 using any suitable toolchain and provide arguments to utilise the custom LLVM Toolchain as described previously in this document"".

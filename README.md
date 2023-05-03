VERIFOXX-CHERI-WAMR
===================

This is a private "fork" of the WebAssembly Micro Runtime Repository which is modified to be CHERI-capability-aware and support features to compartmentalise executed WASM.
The version in "main" will build the iwasm program (VM Core) for both CHERI Hybrid and pure-cap on Linux, but note the pure-cap version is very cut down and is likely to only run the simplest WASM code!

The version in "develop" is latest completed changes representing the port to CHERI Morello Linux.
Interpreter mode is supported, both Fast and Classic, and all build-time flags apart from WAMR_BUILD_DEBUG_INTERP.
AOT and JIT are not supported currently.

## Building CHERI-WAMR with CMake
You can build from the root folder directly with CMake, but this requires a number of flags to configure WAMR and the build system.
It is therefore recommended to consult *./build_iwasm.sh* which allows you to configure the following:
- CHERI_PURECAP=[0|1]		(set to 1 for purecap mode, 0 for hybrid)
- CONFIG_TYPE=Debug|Release
- NATIVE_TEST_LIB=[0|1]		(set to 1 to additionally build a native test shared object for iwasm, 0 to skip this)
- INSTALL_PREFIX=<install folder>	(where you want output to be written from cmake *--install*)

This bash script assumes you will be using a toolchain file, see below for more on tihs.

### The Toolchain File on CHERI platforms
The Cmake build can use the toolchain file *toolchain.cmake* to build for CHERI platforms.  You should edit this file accordingly to specify the path to the GCC and GCC compiler binaries.
The default provided assumes that their location is on your path.

To use the toolchain file for CHERI you should also set an environment variable CHERI_GNU_TOOLCHAIN_DIR, which is the root of the GNU toolchain.

**Use of the toolchain file is optional**.  If you do not use the toolchain file, the cmakelists.txt will attempt to resolve your GNU compilers based on the architecture you are running on.
If this is aarch64 then it assumes you are building on the morello board.  Otherwise, it assumes you are cross-compiling.

You will though need to provide the path to the GNU toolchain root, if they are not on your path.
You can provide this directly by passing *-DCHERI_GNU_TOOLCHAIN_DIR=/path/to/gnu/root* as a Cmake argument.

### The Toolchain File on Linux x86_64 native platforms
A basic toolchain file is also provided to build for *Linux* on non-CHERI (assumed to be x86_64) platforms.
This can be used to build a baseline test-harness for Linux that can run natively.

### Native Test Harness Library
To call from WASM -> native or native -> WASM requires an implementation of suitable native functions which need to be known by WAMR.
*iwasm* handles this by loading a DLL (linux shared object library) at runtime and discovering native functions.

The CMake build system supports building a test native library as part of the root-level CMake build.  This can build on Linux x86_64, Linux CHERI Morello Pure-cap and hybrid-cap.  The code can be found in *tests/wamr-linux-cheri-purecap-tests/native_libs* and there is a CMakeLists.txt for each supported target.

The root CMakeLists.txt will build the native libs shared object after building WAMR if CMake flag WAMR_BUILD_NATIVE_TEST_LIB flag is set to 1.

**Please refer to [the Native Test Library ReadMe](./tests/wamr-linux-cheri-purecap-tests/native_libs) for further information.**

### Building without the bash script
``` Bash
mkdir build && cd build
cmake .. [--toolchain ../toolchain.cmake|-DCHERI_GNU_TOOLCHAIN_DIR=<path>] -DCMAKE_BUILD_TYPE=Debug|Release --install-prefix=<path> -DWAMR_BUILD_PLATFORM=linux-cheri-purecap [-DCHERI_PURECAP=0|1] [-DCHERI_STATIC_BUILD=1|0] [-DWAMR_BUILD_NATIVE_TEST_LIB=0|1] [<wamr-build-flags>]

cmake --build .
cmake --install .
```

Where:
- WAMR_BUILD_PLATFORM is required, for CHERI this must be "linux-cheri-purecap"
- CHERI_GNU_TOOLCHAIN_DIR is path to the morello gnu toolchain root on the build machine, not required if folder containing binaries is on your bash path OR you are using a toolchain file
- CHERI_PURECAP is 1 for purecap builds and 0 for hybrid capability builds (default 1)
- CHERI_STATIC_BUILD is 1 for making a static executable, 0 for requiring .so libs (default 1)
- WAMR_BUILD_NATIVE_TEST_LIB is 0 for not additionally building the native test lib, 1 for building it (default 0)
- <wamr-build-flags> are any flags to configure WAMR (refer to WAMR build readme for more info).

**Note:** For CHERI Morello WAMR build options contain some restrictions:
- AOT mode is not yet supported so must be 0
- JIT mode is not supported so must be 0
- WAMR_BUILD_DEBUG_INTERP is not yet supported
- WAMR_BUILD_SIMD must be 0
- WAMR_DISABLE_HW_BOUND_CHECK must be 1

### Bulding on the Morello Target
This document assumes you will be cross-compiling, however you can build on the Morello target itself.
To do this *either* update the *toolchain.cmake* file *or* supply the CHERI_GNU_TOOLCHAIN_DIR flag if the GNU toolchain is not on your path (on the Morello board).
The cmake script will then resolve the correct toolchain binaries, as if the architecure where it is being run is aarch64 then it is assumed to be building on the morello target.
Otherwise, it will cross-compile.


## Building CHERI-WAMR using Visual Studio and WSL2
The file *CMakePresets.json* is provided to support visual studio C++ CMake remote builds on a Linux Ubuntu machine running under WSL2.
This provides separate configurations for:
- Hybrid Debug
- PureCap Debug
- Hybrid Release
- PureCap Release
- Linux x86_64 Debug (a non-CHERI baseline for santity testing)
- Linux x86_64 Release (a non-CHERI baseline for santity testing)

To use VS with CMake and this project "out of the box" you will need to have first carried out the following pre-requisite steps:
1. Enable WSL2 in Windows (10 or 11) and installed a suitable Ubuntu distro
2. Install CMake on the Ubuntu machine, you will need version 3.19 or newer (note: not 100% guaranteed to work with earlier than 3.24!)
3. Set up the Arm Morello GNU Toolchain on your WSL2 distribution for cross-compilation to Morello (i.e linux-x86_64 -> aarch64(+c64))
4. Add the path to the GNU toolchain binaries (gcc, g++ etc.) to your sign-on bash shell path (e.g in .bashrc)
5. Add *export CHERI_GNU_TOOLCHAIN_DIR=/path/to/gnu/toolchain/root* to your sign-on bash shell path (e.g in .bashrc)
5. Install Visual Studio 2019 or newer with the C++ for Linux / CMake component

### Launching the project
In Visual Studio, select to open and choose CMake and then locate the *CMakeLists.txt* in the WAMR root folder.  Visual Studio will automatically detect the CMakePresets.json.

You must then select the your Ubuntu machine as the build target.  You can then choose your configuration, the following are available:
- Debug armC64 Hybrid		(internal name "ARMc64-hybrid-debug")
- Debug armC64+ PureCap		(internal name "ARMc64-PureCap-debug")
- Release armC64 Hybrid		(internal name "ARMc64-hybrid-release")
- Release armC64+ PureCap	(internal name "ARMc64-PureCap-release")
- Linux Debug x86_64		(internal name "Linux_x86_64_Debug")
- Linux Release x86_64		(internal name "Linux_x86_64_Release")

All options are then set up correctly.  Visual Studio will automatically build makefiles via CMake and you can build the codebase.
**NOTE:** Please modify the following flags as necessary to configure your build:
- WAMR_BUILD_FAST_INTERP			(default 1, set to 0 for classic interpreter mode)
- WAMR_BUILD_DEBUG_PREPROCESSOR		(default 0, set to 1 for debug info)
- WAMR_BUILD_MEMORY_TRACING			(default 0, set to 1 for extra trace info)
- WAMR_BUILD_NATIVE_TEST_LIB		(default 0, set to 1 to additionally build the native test shared object file)

### Troubleshooting
1. If your project is located on a virtual drive under windows (i.e a subst drive) then you will have to make this available to WSL2.  Although most files are copied to WSL2 via *rsync*, the Ubuntu installation will still need your virtual drive mounted (i.e available as */mnt/drive_letter*).

There are a number of ways to do this, but by far the easiest is to create a symbolic link.  For example, assuming your windows substituted drive is N: which maps to C:\Verifoxx then proceed as follows on Ubunutu:

``` Bash
sudo ln -s /mnt/c/Verifoxx /mnt/n
```

2. You should ensure your .bashrc is able to be executed in "headless" mode i.e when there is no terminal.  The easiest way to achieve this is to add the following line near the top of your .bashrc:

``` Bash
[[ $- != *i* ]] && return
```

3. You are recommended to add the path to the toolchain binaries to your .bashrc file.  *Ensure this is BEFORE the line shown in the no terminal mode, above.*  However it can be supplied by modifying CMakePresets.json.  The problem though with this is it will reduce the portability of the project.

**Note: The CMakePresets.json is set up with the correct WAMR options to build a version that works in Fast Interpreter mode without a native .so included **

### Debugging on Morello Board with Visual Studio
You can remotely debug from Visual Studio with the target being the Morello board.  However, this requires some setup because the debug target is not the same as the build target.

You can either run gdb on the morello board, or run gdbserver on the morello board and gdb locally.  The former is recommended, not least as there were some issues with gdbserver on morello-aarch64+c64 at the time of writing.  This is the method described below.

#### Prerequisites
1. The Morello board must have a known IP address on the internal network (e.g configure it with a static IP)
2. The Morello board should be running sshd and accept remote connections
3. You may need to enable connections in your firewall

#### Visual Studio Setup
1. In Tools -> Options, add a remote connection.  You will need to supply the IP address of the morello board along with the login credentials (user="root", pass="morello").
2. Once a build has succeeded, under Debug configure a launch configuration.  This will open a file *launch.vs.json* which you must then edit to resemble the below:

``` JSON
{
  "version": "0.2.1",
  "defaults": {},
  "configurations": [
    {
      "args": [
        "-v=5",
        "--interp",
        "--native-lib=/root/libwamr-native-test.so",
        "/root/wamr_natives_and_call_wasm.wasm"
      ],
      "cwd": "/root",
      "debuggerConfiguration": "gdb",
      "env": {},
      "gdbPath": "/root/morello_gnu/bin/aarch64-none-linux-gnu-gdb",
      "name": "Morello Target",
      "project": "CMakeLists.txt",
      "projectTarget": "iwasm",
      "remoteMachineName": "192.168.0.39",
      "type": "cppgdb",
      "targetArchitecture": "arm64",
      "externalConsole": true,
      "deployDirectory": "/root/tmp",
      "disableDeploy": false,
    }
  ]
}
```

Where:
- *args* are command-line arguments to pass to *iwasm*, run *iwasm --help* for details
- *cwd* is the working folder for debug session
- *debuggerConfiguration* should be gdb
- *gdbPath* is the filepath for the gdb binary.  Version shown above is built for the morello board (i.e runs on morello).
- *name* and *projectTarget* set to appropriate for your project configuration
- *remoteMachineName* is the IP address of the Arm morello board
- *targetArchitecture* must be an architecture known to visual studio; the nearest we can get is "arm64"
- *name* is the debug target name to display in the debug target selection box.
- *externalConsole* should be true to correctly view terminal output in VS Debugger window
- *deployDirectory* is the folder to copy the target to on debugger launch
- *disableDeploy* should be false

You can now proceed to select debug target as per *name*, above, and then debug.  The process will launch remotely on the Morello board connecting across your internal network.

#### Debugging and Intellisense Operation
There are limitations to how well intellisense and debugging can work with Visual Studio, because it has to be told the architecture is Arm64 and it doesn't know about Morello.

However, the CMakePresets.json has been specifically set up - and this is why it also needs to use a toolchain file - to make the process as effective as possible:
- C and C++ headers will be picked up from the GNU toolchain on the Linux machine, not the VS local flavour
- C/C++ flags and built-in macro definitions should work in Intellisense, for example __CHERI_PURE_CAPABILITY__ is defined for morello pure-cap.
- Debugging should work fairly seamlessly although you are unlikely to be able to debug into library functions and e.g STL headers (this feature can be enabled/disabled in VS Tools -> Options)

The only real problem is that compiler builtins which are pure-cap specific will likely not work.

## WAMR Front-end
For development purposes a WAMR front-end is provided which can be used instead of iwasm.  This is found in */front-end* folder.

You can build for the front-end instead of iwasm by passing an additional flag to CMake or add to CMakePresets.json as follows:
    WAMR_APP=1
	
(default is 0).
This will cause the **root** CMakeLists.txt to include the CMakeLists.txt in *frontend/* which will build wamr-app instead of iwasm.  Note that wamr-app does not include the *libvm* instead all source code is built into the application.

Basic usage of wamr-app:
``` Bash
wamr-app <wasm_file_to_execute>
```

For full usage run *wamr-app* with no arguments.

wamr-app is functional in classic or fast interpreter mode, verbose logging is enabled (and cannot be changed) and stack and app heap size are fixed.
Test native functions are included by building them into the wamr-app program.


ORIGINAL DOCUMENT -> WebAssembly Micro Runtime
==============================================

**A [Bytecode Alliance][BA] project**

[BA]: https://bytecodealliance.org/

**[Guide](https://wamr.gitbook.io/)**&emsp;&emsp;**[Website](https://bytecodealliance.github.io/wamr.dev)**&emsp;&emsp;**[Chat](https://bytecodealliance.zulipchat.com/#narrow/stream/290350-wamr)**

[Build WAMR](./doc/build_wamr.md) | [Build AOT Compiler](./README.md#build-wamrc-aot-compiler) | [Embed WAMR](./doc/embed_wamr.md) | [Export Native API](./doc/export_native_api.md) | [Build WASM Apps](./doc/build_wasm_app.md) | [Samples](./README.md#samples)

WebAssembly Micro Runtime (WAMR) is a lightweight standalone WebAssembly (WASM) runtime with small footprint, high performance and highly configurable features for applications cross from embedded, IoT, edge to Trusted Execution Environment (TEE), smart contract, cloud native and so on. It includes a few parts as below:
- The [**"iwasm" VM core**](./README.md#iwasm-vm-core) to run WASM applications, supporting interpreter mode, AOT mode (Ahead-of-Time compilation) and JIT modes (Just-in-Time compilation, LLVM JIT and Fast JIT are supported)

- The [**"wamrc" AOT compiler**](./README.md#build-wamrc-aot-compiler) to compile WASM file into AOT file for best performance and smaller runtime footprint, which is run by "iwasm" VM Core

- The [**application framework**](./README.md#application-framework) and the supporting APIs for the WASM applications

- The [**dynamic management**](./README.md#remote-application-management) of the WASM applications

Getting started
==================
- [Build iwasm VM core](./doc/build_wamr.md) on [Linux](./doc/build_wamr.md#linux), [SGX](./doc/linux_sgx.md), [MacOS](./doc/build_wamr.md#macos) and [Windows](./doc/build_wamr.md#windows), and [Build wamrc AOT compiler](./README.md#build-wamrc-aot-compiler)
- [Embed WAMR into host applications](./doc/embed_wamr.md)
  - [Embed into C/C++](./doc/embed_wamr.md), [Embed into Python](./language-bindings/python), [Embed into Go](./language-bindings/go)

- [Register native APIs for WASM applications](./doc/export_native_api.md)
- [Build WASM applications](./doc/build_wasm_app.md)
- [Port WAMR to a new platform](./doc/port_wamr.md)
- [Benchmarks](./tests/benchmarks) and [Samples](./samples)
- [VS Code development container](./doc/devcontainer.md)

iwasm VM core
=========================

### Key features

- Full compliant to the W3C WASM MVP
- Small runtime binary size (~85K for interpreter and ~50K for AOT) and low memory usage
- Near to native speed by AOT and JIT
- Self-implemented AOT module loader to enable AOT working on Linux, Windows, MacOS, Android, SGX and MCU systems
- Choices of WASM application libc support: the built-in libc subset for the embedded environment or [WASI](https://github.com/WebAssembly/WASI) for the standard libc
- [The simple C APIs to embed WAMR into host environment](./doc/embed_wamr.md), see [how to integrate WAMR](./doc/embed_wamr.md) and the [API list](./core/iwasm/include/wasm_export.h)
- [The mechanism to export native APIs to WASM applications](./doc/export_native_api.md), see [how to register native APIs](./doc/export_native_api.md)
- [Multiple modules as dependencies](./doc/multi_module.md), ref to [document](./doc/multi_module.md) and [sample](samples/multi-module)
- [Multi-thread, pthread APIs and thread management](./doc/pthread_library.md), ref to [document](./doc/pthread_library.md) and [sample](samples/multi-thread)
- [Linux SGX (Intel Software Guard Extension) support](./doc/linux_sgx.md), ref to [document](./doc/linux_sgx.md)
- [Source debugging support](./doc/source_debugging.md), ref to [document](./doc/source_debugging.md)
- [WAMR-IDE (Experimental)](./test-tools/wamr-ide) to develop WebAssembly applications with build, run and debug support, ref to [document](./test-tools/wamr-ide)
- [XIP (Execution In Place) support](./doc/xip.md), ref to [document](./doc/xip.md)
- [Berkeley/Posix Socket support](./doc/socket_api.md), ref to [document](./doc/socket_api.md) and [sample](./samples/socket-api)
- Language bindings: [Go](./language-bindings/go/README.md), [Python](./language-bindings/python/README.md)

### WASM post-MVP features
- [wasm-c-api](https://github.com/WebAssembly/wasm-c-api), ref to [document](doc/wasm_c_api.md) and [sample](samples/wasm-c-api)
- [128-bit SIMD](https://github.com/WebAssembly/simd), ref to [samples/workload](samples/workload)
- [Reference Types](https://github.com/WebAssembly/reference-types), ref to [document](doc/ref_types.md) and [sample](samples/ref-types)
- [Non-trapping float-to-int conversions](https://github.com/WebAssembly/nontrapping-float-to-int-conversions)
- [Sign-extension operators](https://github.com/WebAssembly/sign-extension-ops), [Bulk memory operations](https://github.com/WebAssembly/bulk-memory-operations)
- [Multi-value](https://github.com/WebAssembly/multi-value), [Tail-call](https://github.com/WebAssembly/tail-call), [Shared memory](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md#shared-linear-memory)

### Supported architectures and platforms

The iwasm supports the following architectures:

- X86-64, X86-32
- ARM, THUMB (ARMV7 Cortex-M7 and Cortex-A15 are tested)
- AArch64 (Cortex-A57 and Cortex-A53 are tested)
- RISCV64, RISCV32 (RISC-V LP64 and RISC-V LP64D are tested)
- XTENSA, MIPS, ARC

The following platforms are supported, click each link below for how to build iwasm on that platform. Refer to [WAMR porting guide](./doc/port_wamr.md) for how to port WAMR to a new platform.

- [Linux](./doc/build_wamr.md#linux),  [Linux SGX (Intel Software Guard Extension)](./doc/linux_sgx.md),  [MacOS](./doc/build_wamr.md#macos),  [Android](./doc/build_wamr.md#android), [Windows](./doc/build_wamr.md#windows), [Windows (MinGW)](./doc/build_wamr.md#mingw)
- [Zephyr](./doc/build_wamr.md#zephyr),  [AliOS-Things](./doc/build_wamr.md#alios-things),  [VxWorks](./doc/build_wamr.md#vxworks), [NuttX](./doc/build_wamr.md#nuttx), [RT-Thread](./doc/build_wamr.md#RT-Thread), [ESP-IDF](./doc/build_wamr.md#esp-idf)

### Build iwasm VM core (mini product)

WAMR supports building the iwasm VM core only (no app framework) to the mini product. The WAMR mini product takes the WASM application file name or AOT file name as input and then executes it. For the detailed procedure, please see **[build WAMR VM core](./doc/build_wamr.md)** and **[build and run WASM application](./doc/build_wasm_app.md)**. Also we can click the link of each platform above to see how to build iwasm on it.

### Build wamrc AOT compiler

Both wasm binary file and AOT file are supported by iwasm. The wamrc AOT compiler is to compile wasm binary file to AOT file which can also be run by iwasm. Execute following commands to build **wamrc** compiler for Linux:

```shell
cd wamr-compiler
./build_llvm.sh (or "./build_llvm_xtensa.sh" to support xtensa target)
mkdir build && cd build
cmake .. (or "cmake .. -DWAMR_BUILD_PLATFORM=darwin" for MacOS)
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

### Performance and Footprint

- [Performance and footprint data](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/Performance): checkout [here](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/Performance) for the performance and footprint data
- [Memory usage tunning](./doc/memory_tune.md): checkout [here](./doc/memory_tune.md) for the memory model and how to tune the memory usage
- [Memory usage profiling](./doc/build_wamr.md#enable-memory-profiling-experiment): checkout [here](./doc/build_wamr.md#enable-memory-profiling-experiment) for how to profile the memory usage
- [Benchmarks](./tests/benchmarks): checkout these links for how to run the benchmarks: [PolyBench](./tests/benchmarks/polybench), [CoreMark](./tests/benchmarks/coremark), [Sightglass](./tests/benchmarks/sightglass), [JetStream2](./tests/benchmarks/jetstream)

### User cases

WAMR is widely used in a lot areas, here are some cases:
- [Hyperledger Private Data Objects](https://github.com/hyperledger-labs/private-data-objects/blob/main/common/interpreter/wawaka_wasm/README.md)
- [Inclavare Containers](https://github.com/alibaba/inclavare-containers)
- [Fassm](https://github.com/faasm/faasm)
- [Waft](https://developer.aliyun.com/article/787582)
- [Envoy Proxy](https://github.com/envoyproxy/envoy)
- [Apache Teaclave](https://teaclave.apache.org/docs/executing-wasm)

Application framework
===================================

By using the iwasm VM core, we are flexible to build different application frameworks for the specific domains, although it would take quite some effort.

The WAMR has offered a comprehensive framework for programming WASM applications for device and IoT usages. The framework supports running multiple applications, that are based on the event driven programming model. Here are the supporting API sets by the [WAMR application framework library](./doc/wamr_api.md) :

- Timer,  Inter-app communication (request/response and pub/sub), Sensor, Connectivity and data transmission, 2D graphic UI

Browse the folder  [core/app-framework](./core/app-framework) for how to extend the application framework.

# Remote application management

The WAMR application manager supports [remote application management](./core/app-mgr) from the host environment or the cloud through any physical communications such as TCP, UPD, UART, BLE, etc. Its modular design makes it able to support application management for different managed runtimes.

The tool [host_tool](./test-tools/host-tool) communicates to the WAMR app manager for installing/uninstalling the WASM applications on companion chip from the host system. And the [IoT App Store Demo](./test-tools/IoT-APP-Store-Demo/) shows the conception of remotely managing the device applications from the cloud.


WAMR SDK
==========

Usually there are two tasks for integrating the WAMR into a particular project:

- Select what WAMR components (vmcore, libc, app-mgr, app-framework components) to be integrated, and get the associated source files added into the project building configuration
- Generate the APP SDK for developing the WASM apps on the selected libc and framework components

The **[WAMR SDK](./wamr-sdk)** tools is helpful to finish the two tasks quickly. It supports menu configuration for selecting WAMR components and builds the WAMR to a SDK package that includes **runtime SDK** and **APP SDK**. The runtime SDK is used for building the native application and the APP SDK should be shipped to WASM application developers.


Samples
=================

The WAMR [samples](./samples) integrate the iwasm VM core, application manager and selected application framework components.

- [**basic**](./samples/basic): Demonstrating how to use runtime exposed API's to call WASM functions, how to register native functions and call them, and how to call WASM function from native function.
- **[simple](./samples/simple/README.md)**: The runtime is integrated with most of the WAMR APP libraries, and a few WASM applications are provided for testing the WAMR APP API set. It uses **built-in libc** and executes apps in **interpreter** mode by default.
- **[file](./samples/file/README.md)**: Demonstrating the supported file interaction API of WASI. This sample can also demonstrate the SGX IPFS (Intel Protected File System), enabling an enclave to seal and unseal data at rest.
- **[littlevgl](./samples/littlevgl/README.md)**: Demonstrating the graphic user interface application usage on WAMR. The whole [LVGL](https://github.com/lvgl/lvgl) 2D user graphic library and the UI application are built into WASM application.  It uses **WASI libc** and executes apps in **AOT mode** by default.
- **[gui](./samples/gui/README.md)**: Move the [LVGL](https://github.com/lvgl/lvgl) library into the runtime and define a WASM application interface by wrapping the littlevgl API. It uses **WASI libc** and executes apps in **interpreter** mode by default.
- **[multi-thread](./samples/multi-thread/)**: Demonstrating how to run wasm application which creates multiple threads to execute wasm functions concurrently, and uses mutex/cond by calling pthread related API's.
- **[spawn-thread](./samples/spawn-thread)**: Demonstrating how to execute wasm functions of the same wasm application concurrently, in threads created by host embedder or runtime, but not the wasm application itself.
- **[multi-module](./samples/multi-module)**: Demonstrating the [multiple modules as dependencies](./doc/multi_module.md) feature which implements the [load-time dynamic linking](https://webassembly.org/docs/dynamic-linking/).
- **[ref-types](./samples/ref-types)**: Demonstrating how to call wasm functions with argument of externref type introduced by [reference types proposal](https://github.com/WebAssembly/reference-types).
- **[wasm-c-api](./samples/wasm-c-api/README.md)**: Demonstrating how to run some samples from [wasm-c-api proposal](https://github.com/WebAssembly/wasm-c-api) and showing the supported API's.
- **[socket-api](./samples/socket-api/README.md)**: Demonstrating how to run wasm tcp server and tcp client applications, and how they communicate with each other.
- **[workload](./samples/workload/README.md)**: Demonstrating how to build and run some complex workloads, e.g. tensorflow-lite, XNNPACK, wasm-av1, meshoptimizer and bwa.
- **[sgx-ra](./samples/sgx-ra/README.md)**: Demonstrating how to execute Remote Attestation on SGX with [librats](https://github.com/inclavare-containers/librats), which enables mutual attestation with other runtimes or other entities that support librats to ensure that each is running within the TEE.


Project Technical Steering Committee
====================================
The [WAMR PTSC Charter](./TSC_Charter.md) governs the operations of the project TSC.
The current TSC members:
- [dongsheng28849455](https://github.com/dongsheng28849455) - **Dongsheng Yan**, <dongsheng.yan@sony.com>
- [loganek](https://github.com/loganek) - **Marcin Kolny**, <mkolny@amazon.co.uk>
- [lum1n0us](https://github.com/lum1n0us) - **Liang He**， <liang.he@intel.com>
- [no1wudi](https://github.com/no1wudi) **Qi Huang**, <huangqi3@xiaomi.com>
- [qinxk-inter](https://github.com/qinxk-inter) - **Xiaokang Qin**， <xiaokang.qxk@antgroup.com>
- [wei-tang](https://github.com/wei-tang) - **Wei Tang**， <tangwei.tang@antgroup.com>
- [wenyongh](https://github.com/wenyongh) - **Wenyong Huang**， <wenyong.huang@intel.com>
- [xujuntwt95329](https://github.com/xujuntwt95329) - **Jun Xu**， <Jun1.Xu@intel.com>
- [xwang98](https://github.com/xwang98) - **Xin Wang**， <xin.wang@intel.com> (chair)
- [yamt](https://github.com/yamt) - **Takashi Yamamoto**, <yamamoto@midokura.com>


License
=======
WAMR uses the same license as LLVM: the `Apache 2.0 license` with the LLVM
exception. See the LICENSE file for details. This license allows you to freely
use, modify, distribute and sell your own products based on WAMR.
Any contributions you make will be under the same license.

# More resources

Check out the [Wiki documents ](https://github.com/bytecodealliance/wasm-micro-runtime/wiki) for more resources:

- [Community news and events](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/Events)
- [Roadmap](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/Roadmap)
- [WAMR TSC meetings](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/TSC-meeting)
- Technical documents


CHERI-WAMR
==========

This is a private "fork" of the WebAssembly Micro Runtime Repository which is modified to be CHERI-capability-aware and support features to compartmentalise executed WASM.
The version in "main" will build the iwasm program (VM Core) for both CHERI Hybrid and pure-cap on Linux.
However note the pure-cap version is very cut down and is likely to only run the simplest WASM code!

The version in "sandbox" is latest bleeding-edge changes intended to try and fix various issues that cause CHERI capability faults.

**IMPORTANT:** At the moment, iwasm build is not working with linux-cheri-purecap.  Instead, build the WAMR front end by setting WAMR_APP=1 in your CMake options.


## Building CHERI-WAMR with CMake
You can build from the root folder directly with CMake, but this requires a number of flags to configure WAMR and the build system.
It is therefore recommended to consult *./build_iwasm.sh* which allows you to configure the following:
- CHERI_PURECAP=[0|1]		(set to 1 for purecap mode, 0 for hybrid)
- CONFIG_TYPE=Debug|Release
- INSTALL_PREFIX=<install folder>	(where you want output to be written from cmake *--install*)

This bash script assumes you will be using a toolchain file, see below for more on tihs.

### The Toolchain File
The Cmake build can use the toolchain file *toolchain.cmake*.  You should edit this file accordingly to specify the path to the GCC and GCC compiler binaries.
The default provided assumes that their location is on your path.

To use the toolchain file you should also set an environment variable CHERI_GNU_TOOLCHAIN_DIR, which is the root of the GNU toolchain.

**Use of the toolchain file is optional**.  If you do not use the toolchain file, the cmakelists.txt will attempt to resolve your GNU compilers based on the architecture you are running on.
If this is aarch64 then it assumes you are building on the morello board.  Otherwise, it assumes you are cross-compiling.

You will though need to provide the path to the GNU toolchain root, if they are not on your path.
You can provide this directly by passing *-DCHERI_GNU_TOOLCHAIN_DIR=/path/to/gnu/root* as a Cmake argument.

### Building without the bash script
``` Bash
mkdir build && cd build
cmake .. [--toolchain ../toolchain.cmake|-DCHERI_GNU_TOOLCHAIN_DIR=<path>] -DCMAKE_BUILD_TYPE=Debug|Release --install-prefix=<path> -DWAMR_BUILD_PLATFORM=linux-cheri-purecap [-DCHERI_PURECAP=0|1] [-DCHERI_STATIC_BUILD=1|0] [<wamr-build-flags>]

cmake --build .
cmake --install .
```

Where:
- WAMR_BUILD_PLATFORM is required, for CHERI this must be "linux-cheri-purecap"
- CHERI_GNU_TOOLCHAIN_DIR is path to the morello gnu toolchain root on the build machine, not required if folder containing binaries is on your bash path OR you are using a toolchain file
- CHERI_PURECAP is 1 for purecap builds and 0 for hybrid capability builds (default 1)
- CHERI_STATIC_BUILD is 1 for making a static executable, 0 for requiring .so libs (default 1)
- <wamr-build-flags> are any flags to configure WAMR (refer to WAMR build readme for more info).  Note that for purecap we currently have minimal spec of disabling AOT, SIMD and enabling Fast Interp

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

All options are then set up correctly.  Visual Studio will automatically build makefiles via CMake and you can build the codebase.

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

**Note: The CMakePresets.json is set up with the correct WAMR options to build a version that works with the simple WASM file**

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
      "args": [],
      "comment": "Learn how to configure WSL debugging. For more info, see http://aka.ms/vslinuxdebug",
      "cwd": "/root",
      "debuggerConfiguration": "gdb",
      "env": {},
      "gdbPath": "/root/morello_gnu/bin/aarch64-none-linux-gnu-gdb",
      "name": "Morello Target",
      "project": "CMakeLists.txt",
      "projectTarget": "cheri-wamr",
      "remoteMachineName": "192.168.0.39",
      "type": "cppgdb",
      "targetArchitecture": "arm64"
    }
  ]
}
```

Where:
- *cwd* is the working folder for debug session
- *debuggerConfiguration* should be gdb
- *gdbPath* is the filepath for the gdb binary.  Version shown above is built for the morello board (i.e runs on morello).
- *name* and *projectTarget* set to appropriate for your project configuration
- *remoteMachineName* is the IP address of the Arm morello board
- *targetArchitecture* must be an architecture known to visual studio; the nearest we can get is "arm64"
- *name* is the debug target name to display in the debug target selection box.

You can now proceed to select debug target as per *name*, above, and then debug.  The process will launch remotely on the Morello board connecting across your internal network.

#### Debugging and Intellisense Operation
There are limitations to how well intellisense and debugging can work with Visual Studio, because it has to be told the architecture is Arm64 and it doesn't know about Morello.

However, the CMakePresets.json has been specifically set up - and this is why it also needs to use a toolchain file - to make the process as effective as possible:
- C and C++ headers will be picked up from the GNU toolchain on the Linux machine, not the VS local flavour
- C/C++ flags and built-in macro definitions should work in Intellisense, for example __CHERI_PURE_CAPABILITY__ is defined for morello pure-cap.
- Debugging should work fairly seamlessly although you are unlikely to be able to debug into library functions and e.g STL headers (this feature can be enabled/disabled in VS Tools -> Options)

The only real problem is that compiler builtins which are pure-cap specific will likely not work.



ORIGINAL DOCUMENT -> WebAssembly Micro Runtime
==============================================

**A [Bytecode Alliance][BA] project**

[BA]: https://bytecodealliance.org/

**[Guide](https://wamr.gitbook.io/)**&emsp;&emsp;**[Website](https://bytecodealliance.github.io/wamr.dev)**&emsp;&emsp;**[Chat](https://bytecodealliance.zulipchat.com/#narrow/stream/290350-wamr)**

[Build WAMR](./doc/build_wamr.md) | [Build AOT Compiler](./wamr-compiler/README.md) | [Embed WAMR](./doc/embed_wamr.md) | [Export Native API](./doc/export_native_api.md) | [Build Wasm Apps](./doc/build_wasm_app.md) | [Samples](./samples/README.md)

WebAssembly Micro Runtime (WAMR) is a lightweight standalone WebAssembly (Wasm) runtime with small footprint, high performance and highly configurable features for applications cross from embedded, IoT, edge to Trusted Execution Environment (TEE), smart contract, cloud native and so on. It includes a few parts as below:
- [**VMcore**](./core/iwasm/): A set of runtime libraries for loading and running Wasm modules. It supports several execution modes including interpreter, Ahead-of-Time compilation(AoT) and Just-in-Time compilation (JIT). The WAMR supports two JIT tiers - Fast JIT, LLVM JIT, and dynamic tier-up from Fast JIT to LLVM JIT.
- [**iwasm**](./product-mini/): The executable binary built with WAMR VMcore supports WASI and command line interface.
- [**wamrc**](./wamr-compiler/): The AOT compiler to compile Wasm file into AOT file
- Useful components and tools for building real solutions with WAMR vmcore:
  - [App-framework](./core/app-framework/README.md): A framework for supporting APIs for the Wasm applications
  - [App-manager](./core/app-mgr/README.md): a framework for dynamical loading the Wasm module remotely
  - [WAMR-IDE](./test-tools/wamr-ide): An experimental VSCode extension for developping WebAssembly applications with C/C++


### Key features
- Full compliant to the W3C Wasm MVP
- Small runtime binary size (~85K for interpreter and ~50K for AOT) and low memory usage
- Near to native speed by AOT and JIT
- Self-implemented AOT module loader to enable AOT working on Linux, Windows, MacOS, Android, SGX and MCU systems
- Choices of Wasm application libc support: the built-in libc subset for the embedded environment or [WASI](https://github.com/WebAssembly/WASI) for the standard libc
- [The simple C APIs to embed WAMR into host environment](./doc/embed_wamr.md), see [how to integrate WAMR](./doc/embed_wamr.md) and the [API list](./core/iwasm/include/wasm_export.h)
- [The mechanism to export native APIs to Wasm applications](./doc/export_native_api.md), see [how to register native APIs](./doc/export_native_api.md)
- [Multiple modules as dependencies](./doc/multi_module.md), ref to [document](./doc/multi_module.md) and [sample](samples/multi-module)
- [Multi-thread, pthread APIs and thread management](./doc/pthread_library.md), ref to [document](./doc/pthread_library.md) and [sample](samples/multi-thread)
- [wasi-threads](./doc/pthread_impls.md#wasi-threads-new), ref to [document](./doc/pthread_impls.md#wasi-threads-new) and [sample](samples/wasi-threads)
- [Linux SGX (Intel Software Guard Extension) support](./doc/linux_sgx.md), ref to [document](./doc/linux_sgx.md)
- [Source debugging support](./doc/source_debugging.md), ref to [document](./doc/source_debugging.md)
- [XIP (Execution In Place) support](./doc/xip.md), ref to [document](./doc/xip.md)
- [Berkeley/Posix Socket support](./doc/socket_api.md), ref to [document](./doc/socket_api.md) and [sample](./samples/socket-api)
- [Multi-tier JIT](./product-mini#linux) and [Running mode control](https://bytecodealliance.github.io/wamr.dev/blog/introduction-to-wamr-running-modes/)
- Language bindings: [Go](./language-bindings/go/README.md), [Python](./language-bindings/python/README.md)

### Wasm post-MVP features
- [wasm-c-api](https://github.com/WebAssembly/wasm-c-api), ref to [document](doc/wasm_c_api.md) and [sample](samples/wasm-c-api)
- [128-bit SIMD](https://github.com/WebAssembly/simd), ref to [samples/workload](samples/workload)
- [Reference Types](https://github.com/WebAssembly/reference-types), ref to [document](doc/ref_types.md) and [sample](samples/ref-types)
- [Non-trapping float-to-int conversions](https://github.com/WebAssembly/nontrapping-float-to-int-conversions)
- [Sign-extension operators](https://github.com/WebAssembly/sign-extension-ops), [Bulk memory operations](https://github.com/WebAssembly/bulk-memory-operations)
- [Multi-value](https://github.com/WebAssembly/multi-value), [Tail-call](https://github.com/WebAssembly/tail-call), [Shared memory](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md#shared-linear-memory)

### Supported architectures and platforms
The WAMR VMcore supports the following architectures:  
- X86-64, X86-32
- ARM, THUMB (ARMV7 Cortex-M7 and Cortex-A15 are tested)
- AArch64 (Cortex-A57 and Cortex-A53 are tested)
- RISCV64, RISCV32 (RISC-V LP64 and RISC-V LP64D are tested)
- XTENSA, MIPS, ARC

The following platforms are supported, click each link below for how to build iwasm on that platform. Refer to [WAMR porting guide](./doc/port_wamr.md) for how to port WAMR to a new platform.  
- [Linux](./product-mini/README.md#linux),  [Linux SGX (Intel Software Guard Extension)](./doc/linux_sgx.md),  [MacOS](./product-mini/README.md#macos),  [Android](./product-mini/README.md#android), [Windows](./product-mini/README.md#windows), [Windows (MinGW)](./product-mini/README.md#mingw)
- [Zephyr](./product-mini/README.md#zephyr),  [AliOS-Things](./product-mini/README.md#alios-things),  [VxWorks](./product-mini/README.md#vxworks), [NuttX](./product-mini/README.md#nuttx), [RT-Thread](./product-mini/README.md#RT-Thread), [ESP-IDF](./product-mini/README.md#esp-idf)


## Getting started
- [Build VM core](./doc/build_wamr.md) and [Build wamrc AOT compiler](./wamr-compiler/README.md)
- [Build iwasm (mini product)](./product-mini/README.md): [Linux](./product-mini/README.md#linux), [SGX](./doc/linux_sgx.md), [MacOS](./product-mini/README.md#macos) and [Windows](./product-mini/README.md#windows)
- [Embed into C/C++](./doc/embed_wamr.md), [Embed into Python](./language-bindings/python), [Embed into Go](./language-bindings/go)
- [Register native APIs for Wasm applications](./doc/export_native_api.md)
- [Build wamrc AOT compiler](./wamr-compiler/README.md)
- [Build Wasm applications](./doc/build_wasm_app.md)
- [Port WAMR to a new platform](./doc/port_wamr.md)
- [VS Code development container](./doc/devcontainer.md)
- [Samples](./samples) and [Benchmarks](./tests/benchmarks) 



### Performance and memory
- [Blog: The WAMR memory model](https://bytecodealliance.github.io/wamr.dev/blog/the-wamr-memory-model/)
- [Blog: Understand WAMR heaps](https://bytecodealliance.github.io/wamr.dev/blog/understand-the-wamr-heaps/) and [stacks](https://bytecodealliance.github.io/wamr.dev/blog/understand-the-wamr-stacks/)
- [Blog: Introduction to WAMR running modes](https://bytecodealliance.github.io/wamr.dev/blog/introduction-to-wamr-running-modes/)
- [Memory usage tunning](./doc/memory_tune.md): the memory model and how to tune the memory usage
- [Memory usage profiling](./doc/build_wamr.md#enable-memory-profiling-experiment): how to profile the memory usage
- [Benchmarks](./tests/benchmarks): checkout these links for how to run the benchmarks: [PolyBench](./tests/benchmarks/polybench), [CoreMark](./tests/benchmarks/coremark), [Sightglass](./tests/benchmarks/sightglass), [JetStream2](./tests/benchmarks/jetstream)
- [Performance and footprint data](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/Performance): the performance and footprint data



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
- [Who use WAMR?](https://github.com/bytecodealliance/wasm-micro-runtime/wiki)
- [WAMR Blogs](https://bytecodealliance.github.io/wamr.dev/blog/)
- [Community news and events](https://bytecodealliance.github.io/wamr.dev/events/)
- [WAMR TSC meetings](https://github.com/bytecodealliance/wasm-micro-runtime/wiki/TSC-meeting-notes)


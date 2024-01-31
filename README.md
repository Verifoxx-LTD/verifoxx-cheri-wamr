VERIFOXX-CHERI-WAMR
===================

This is a private "fork" of the WebAssembly Micro Runtime Repository which is modified to be CHERI-capability-aware and support features to compartmentalise executed WASM.
The version in "main" will build the iwasm program (VM Core) for both CHERI Hybrid and pure-cap on Linux, but note the pure-cap version is very cut down and is likely to only run the simplest WASM code!

The version in "develop" is latest completed changes representing the port to CHERI Morello Linux.
Interpreter mode is supported, both Fast and Classic, and all build-time flags apart from WAMR_BUILD_DEBUG_INTERP.
AOT mode is supported, JIT mode is not supported.

An experimental compartmentalised WAMR is additionally supported - this is implemented as a separate "mini-product".  This utilises *iwasm* as a capability manager executable which manages a compartment that contains all WAMR code.
All WAMR API calls therefore take place via a switch to the compartment.  During a WAMR function processing, the function can "call back" to a service in the compartment to perform system functions such as allocating memory.
Note this work is very much in progress and therefore the compartment product does not have as much functional support as the main WAMR port to CHERI.  The following are not currently supported in the compartmentalised version:
- AOT mode
- Calling native functions in a loaded library ("*native-lib*" option) (including building a native test library)
- Most system functions are not moved to the capability manager
- The full WAMR API is not supported (only a subset to implement *iwasm*)
- Building with the LLVM toolchain is not supported yet, only GNU/GCC is supported

**Note: The compartmentalised version is only available in pure-cap, hybrid-cap cannot be supported*

## Building CHERI-WAMR with CMake
You can build from the root folder directly with CMake, but this requires a number of flags to configure WAMR and the build system.
It is therefore recommended to consult *./build_iwasm.sh* which allows you to configure the following:
- CHERI_PURECAP=[0|1]		(set to 1 for purecap mode, 0 for hybrid)
- CONFIG_TYPE=Debug|Release
- NATIVE_TEST_LIB=[0|1]		(set to 1 to additionally build a native test shared object for iwasm, 0 to skip this)
- AOT_CHERI_PTR=[0|8|16]		(set to 0 when building CHERI pure-cap, set to pure-cap native pointer size when building other architectures.  **Must match setting used to build WAMRc**.)
- WAMR_EXTERNREF_APP=[0|1]  (set to 1 to build a native executable for externref testing INSTEAD of building WAMR.  Defaults to build WAMR.)
- INSTALL_PREFIX=<install folder>	(where you want output to be written from cmake *--install*)
- CHERI_STATIC_BUILD=[0|1]	(set to 0 to build dynamic iwasm which requires e.g libc available at runtime.  Default to static.)

This bash script assumes you will be using a toolchain file, see below for more on tihs.

### Supported WAMR Mini-Products
The CMake flag WAMR_BUILD_PLATFORM determines which product platform to build for, these map to a folder in the WAMR source tree.
For CHERI-WAMR we derive products from *linux* which is a native Linux build (e.g on x86_64 platforms).

The following are supported:
- WAMR_BUILD_PLATFORM=linux-cheri-purecap          : The standard CHERI port of WAMR, enables you to build either pure-cap or hybrid-cap WAMR
- WAMR_BUILD_PLATFORM=linux-cheri-purcap-capmgr    : The experimantal compartmentalised version which builds iwasm as a capability manager executable, and WAMR into a dynamic shared object library (libiwasm.so)

### The Toolchain File on CHERI platforms
The Cmake build can use the toolchain file *toolchain.cmake* to build for CHERI platforms.  You should edit this file accordingly to specify the path to the GCC and GCC compiler binaries.
The default provided assumes that their location is on your path.

To use the toolchain file for CHERI you should also set an environment variable CHERI_GNU_TOOLCHAIN_DIR, which is the root of the GNU toolchain, or CHERI_LLVM_TOOLCHAIN_DIR, which is the root of the LLVM toolchain, as applicable.

**Use of the toolchain file is optional**.  If you do not use the toolchain file, the CMakelists.txt will attempt to resolve your compilers based on the architecture you are running on.
If this is aarch64 then it assumes you are building on the morello board.  Otherwise, it assumes you are cross-compiling.

You will though need to provide the path to the GNU or LLVM toolchain root if they are not on your path.
You can provide this directly by passing *-DCHERI_GNU_TOOLCHAIN_DIR=/path/to/gnu/root* or *-DCHERI_LLVM_TOOLCHAIN_DIR=/path/to/llvm/root* as a Cmake argument.

**Note: LLVM toolchain port for CHERI uses MUSL C library. When using LLVM, to specify a MUSL root folder, use the flag CHERI_MUSL_TOOLCHAIN_DIR for example *-DCHERI_MUSL_TOOLCHAIN_DIR=/path/to/musl/root*.**

### The Toolchain File on Linux x86_64 native platforms
A basic toolchain file is also provided for GNU and LLVM to build for *Linux* on non-CHERI (assumed to be x86_64) platforms.
This can be used to build a baseline test-harness for Linux that can run natively.

### Native Test Harness Library
**Note: Native Test Library not currently supported on the compartmentalised / capability manager WAMR.**

To call from WASM -> native or native -> WASM requires an implementation of suitable native functions which need to be known by WAMR.
*iwasm* handles this by loading a DLL (linux shared object library) at runtime and discovering native functions.

The CMake build system supports building a test native library as part of the root-level CMake build.  This can build on Linux x86_64, Linux CHERI Morello Pure-cap and hybrid-cap.  The code can be found in *tests/wamr-linux-cheri-purecap-tests/native_libs* and there is a CMakeLists.txt for each supported target.

The root CMakeLists.txt will build the native libs shared object after building WAMR if CMake flag WAMR_BUILD_NATIVE_TEST_LIB flag is set to 1.

**Please refer to [the Native Test Library ReadMe](./tests/wamr-linux-cheri-purecap-tests/native_libs) for further information.**

### Building without the bash script
``` Bash
mkdir build && cd build
cmake .. [--toolchain ../toolchain.cmake|-DCHERI_GNU_TOOLCHAIN_DIR=<path>|-DCHERI_LLVM_TOOLCHAIN_DIR=<path> -DCHERI_MUSL_TOOLCHAIN_DIR=<path>] \
     -DCMAKE_BUILD_TYPE=Debug|Release --install-prefix=<path> \
	-DWAMR_BUILD_PLATFORM=[linux-cheri-purecap|linux-cheri-purecap-capmgr] [-DCHERI_PURECAP=0|1] [-DCHERI_STATIC_BUILD=1|0] [-DWAMR_BUILD_NATIVE_TEST_LIB=0|1] \
	-DWAMR_BUILD_AOT_CHERI_PTR=[0|8|16] -DWAMR_BUILD_AOT_EXCEPTION_WORKAROUND=[0|1] [-DWAMR_EXTERNREF_APP=0|1][<wamr-build-flags>]

cmake --build .
cmake --install .
```

Where:
- WAMR_BUILD_PLATFORM is required, for CHERI this must be "linux-cheri-purecap" for the main port, or "linux-cheri-purecap-capmgr" for the experimantal compartmentalisation CHERI-WAMR.
- CHERI_GNU_TOOLCHAIN_DIR is path to the morello gnu toolchain root on the build machine, not required if folder containing binaries is on your bash path OR you are using a toolchain file
- CHERI_PURECAP is 1 for purecap builds and 0 for hybrid capability builds (default 1)
- CHERI_STATIC_BUILD is 1 for making a static executable, 0 for requiring .so libs (default 1)
- WAMR_BUILD_NATIVE_TEST_LIB is 0 for not additionally building the native test lib, 1 for building it (default 0)
- WAMR_BUILD_AOT_CHERI_PTR is 0 on pure-cap platforms, pure-cap pointer size for hybrid or non-CHERI platforms (refer to WAMRc build for more details, and below)
- WAMR_BUILD_AOT_EXCEPTION_WORKAROUND is 1 to include, 0 to exclude, a workaround for *_wasi_proc_exit* not terminating the AOT script when DWAMR_DISABLE_HW_BOUND_CHECK=1 (ByteCodeAlliance WAMR deficit)
- WAMR_EXTERNREF_APP is 1 to build a standalone native application for externref testing INSTEAD of WAMR. Using this flag will NOT build WAMR at all (default 0).
- <wamr-build-flags> are any flags to configure WAMR (refer to WAMR build readme for more info).


**Note:** For CHERI Morello WAMR build options contain some restrictions:
- JIT mode is not supported so must be 0
- WAMR_BUILD_DEBUG_INTERP is not yet supported
- WAMR_BUILD_SIMD must be 0
- WAMR_DISABLE_HW_BOUND_CHECK must be 1

**Note:** For *linux-cheri-purecap-capmgr* the following must at this time be set otherwise WASMR will not build or run correctly:
- WAMR_BUILD_AOT=0
- WAMR_EXTERNREF_APP=0
- WAMR_BUILD_NATIVE_TEST_LIB=0
- CHERI_PURECAP=1

### Bulding on the Morello Target
This document assumes you will be cross-compiling, however you can build on the Morello target itself.
To do this *either* update the *toolchain.cmake* file *or* supply the CHERI_[GNU|LLVM]_TOOLCHAIN_DIR flag if the GNU toolchain is not on your path (on the Morello board).
The cmake script will then resolve the correct toolchain binaries, as if the architecure where it is being run is aarch64 then it is assumed to be building on the morello target.
Otherwise, it will cross-compile.


## Building CHERI-WAMR using Visual Studio and WSL2
The file *CMakePresets.json* is provided to support visual studio C++ CMake remote builds on a Linux Ubuntu machine running under WSL2.
This provides separate configurations for:
- Hybrid Debug
- PureCap Debug (Standard CHERI port)
- PureCap CapMgr Debug (Experimental compartmentalised CHERI port)
- Hybrid Release
- PureCap Release (Standard CHERI port)
- PureCap CapMgr Release (Experimental compartmentalised CHERI port)
- Linux x86_64 Debug (a non-CHERI baseline for santity testing)
- Linux x86_64 Release (a non-CHERI baseline for santity testing)
- Externref_App_Purecap (build a separate, standalone native exe for externref testing instead of WAMR (on Morello purecap))
- Externref_App_x86_64 (build a separate, standalone native exe for externref testing instead of WAMR (on x86_64))

To use VS with CMake and this project "out of the box" you will need to have first carried out the following pre-requisite steps:
1. Enable WSL2 in Windows (10 or 11) and installed a suitable Ubuntu distro
2. Install CMake on the Ubuntu machine, you will need version 3.19 or newer (note: not 100% guaranteed to work with earlier than 3.24!)
3. Set up the Arm Morello GNU Toolchain on your WSL2 distribution for cross-compilation to Morello (i.e linux-x86_64 -> aarch64(+c64))
4. Add the path to the GNU toolchain binaries (gcc, g++ etc.) to your sign-on bash shell path (e.g in .bashrc)
5. Add *export CHERI_GNU_TOOLCHAIN_DIR=/path/to/toolchain/root*, or *export CHERI_LLVM_TOOLCHAIN_DIR=/path/to/toolchain/root* and *export CHERI_MUSL_TOOLCHAIN_DIR=/path/to/musl/root*, to your sign-on bash shell path (e.g in .bashrc)
5. Install Visual Studio 2019 or newer with the C++ for Linux / CMake component

### Launching the project
In Visual Studio, select to open and choose CMake and then locate the *CMakeLists.txt* in the WAMR root folder.  Visual Studio will automatically detect the CMakePresets.json.

You must then select the your Ubuntu machine as the build target.  You can then choose your configuration, the following are available:
- Debug armC64 Hybrid			(internal name "ARMc64-hybrid-debug")
- Debug armC64+ PureCap			(internal name "ARMc64-PureCap-debug")
- Debug armC64+ CapMgr PureCap	(internal name "ARMc64-PureCap-CapMgr-debug")
- Release armC64 Hybrid			(internal name "ARMc64-hybrid-release")
- Release armC64+ PureCap		(internal name "ARMc64-PureCap-release")
- Release armC64+ CapMgr PureCap(internal name "ARMc64-PureCap-CapMgr-release")
- Linux Debug x86_64			(internal name "Linux_x86_64_Debug")
- Linux Release x86_64			(internal name "Linux_x86_64_Release")
- Externref_App_Purecap     	(internal name "Externref_App_Purecap")
- Externref_App_x86_64      	(internal name "Externref_App_x86_64")

**NOTE:** CapMgr PureCap versions are for the experimental compartmentalisation CHERI-WAMR, other PureCap versions are for the standard CHERI-WAMR port.

All options are then set up correctly.  Visual Studio will automatically build makefiles via CMake and you can build the codebase.
**NOTE:** Please modify the following flags as necessary to configure your build:
- WAMR_BUILD_AOT					(default to 1 to include AOT support, set to 0 to exclude AOT)
- WAMR_BUILD_FAST_INTERP			(default 1, set to 0 for classic interpreter mode)
- WAMR_BUILD_DEBUG_PREPROCESSOR		(default 0, set to 1 for debug info)
- WAMR_BUILD_MEMORY_TRACING			(default 0, set to 1 for extra trace info)
- WAMR_BUILD_NATIVE_TEST_LIB		(default 0, set to 1 to additionally build the native test shared object file)

#### Building the Externref Test Application
Note that if building *Externref_App* then WAMR is **Not** additionally built, instead a native application is built which embeds WAMR library.
Also note that all WAMR build options are hardcoded for this native application and cannot be overriden from *CMakePresets*.

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

##### Enhanced Visual Studio Debug Configuration
You can define additional debug configurations.  For example, you may have a separate configuration for the experiemental compartmentalisation version of *iwasm*.
As this requires a shared object (.so) at runtime which contains the WAMR compartment code, it is beneficial to have the debug step automatically copy files to the remote target.

The configuration shown below will achieve this:

``` JSON
{
  "version": "0.2.1",
  "defaults": {},
  "configurations": [
    {
	  "name": "Morello CAP-MGR",
      "args": [
        "-v=5",
        "/root/helloworld.wasm"
      ],
      "cwd": "/purecap-lib",
      "debuggerConfiguration": "gdb",
      "env": {},
      "gdbPath": "/root/morello_gnu/bin/aarch64-none-linux-gnu-gdb",
      "project": "CMakeLists.txt",
      "projectTarget": "iwasm",
      "remoteMachineName": "192.168.0.39",
      "type": "cppgdb",
      "targetArchitecture": "arm64",
      "externalConsole": true,
      "deployDirectory": "/purecap-lib",
      "deployDebugRuntimeLibraries": "true",
      "disableDeploy": false,
      "program": "/purecap-lib/iwasm",
      "MIMode": "gdb",
      "miDebuggerServerAddress": "192.168.0.39",
      "deploy": [
        {
          "targetMachine": "192.168.0.39",
          "sourcePath": "${cmake.remoteBuildRoot}/linux-cheri-purecap-capmgr/libiwasm.so",
          "targetPath": "/purecap-lib/libiwasm.so",
          "deploymentType": "RemoteRemote",
          "executable": false
        },
        {
          "targetMachine": "192.168.0.39",
          "sourcePath": "${cmake.remoteBuildRoot}/linux-cheri-purecap-capmgr/iwasm",
          "targetPath": "/purecap-lib/iwasm",
          "deploymentType": "RemoteRemote",
          "executable": true
        }
      ]
    }
  ]
}
```
This version will deploy both *iwasm* (capability manager iwasm executable) and *libiwasm.so* (WAMR compartment library) to a folder */purecap-lib*.  This folder is what was set as the library RPATH so that WAMR can find all other dynamic shared objects at runtime.

The *deploy* settings tell Visual Studio the files to be copied to the remote machine - these are sourced from the default build folder for *linux-cheri-purecap-capmgr*.

This configruation is named "Morello CAP-MGR".  Therefore if you have a "Morello Target" configuration this can be used to debug standard WAMR, and "Morello CAP-MGR" can be used for the experimental capability manager / commpartments version.

#### Debugging and Intellisense Operation
There are limitations to how well intellisense and debugging can work with Visual Studio, because it has to be told the architecture is Arm64 and it doesn't know about Morello.

However, the CMakePresets.json has been specifically set up - and this is why it also needs to use a toolchain file - to make the process as effective as possible:
- C and C++ headers will be picked up from the GNU toolchain on the Linux machine, not the VS local flavour
- C/C++ flags and built-in macro definitions should work in Intellisense, for example __CHERI_PURE_CAPABILITY__ is defined for morello pure-cap.
- Debugging should work fairly seamlessly although you are unlikely to be able to debug into library functions and e.g STL headers (this feature can be enabled/disabled in VS Tools -> Options)

The only real problem is that compiler builtins which are pure-cap specific will likely not work.

## Experimental Compartmentalised WAMR
The experimental version of CHERI-WAMR is added as the separate product *linux-cheri-purcap-capmgr* to avoid corrupting the main CHERI-WAMR port.
This product builds an executable, iwasm, and a dynamic shared object library, libiwasm.so.  The executable is a capability manager which will dynamically load (via dlopen()) the WAMR library at runtime.

The iwasm executable manages a single CHERI compartment within which all WAMR API functions are run.  Each call to a WAMR function involves a switch from the capability manager into the compartment, then the function is executed, and then execution returns to the capability manager.  At the moment only a single compartment is implemented.

The capability manager runs in the Morello Executive PE state and all compartment functions run in the Restricted PE state.  To support this, all global code and data symbols implemented in the compartment library need to be patched after the library is first loaded, as by default the dynamic loader will resolve all the symbol addresses with a capability that has the executive permissions and bounds set to the executable.  This "symbol relocation patching" is performed by the capability manager executable after the library is first loaded.

Additionally, during processing a WAMR function in the compartment it may be necessary to call a "service" within the capability manager.  This needs to be done whenever there is a native or system call that can only be performed from the executive PE state.
This is supported via a framework which allows for a call back into the capability manager to run a particulr service, before then returning to the compartment.
Currently, memory allocation are the only services which make use of this mechanism.

**NOTE:** System calls should not be possible from within the compartment, but currently we still make use of this because the Arm Linux port does not prevent said calls from the PE restricted state.

### Runtime Changes to iwasm Program
This experiemental version of iwasm introduces a modified command-line option and a new command-line option.  With reference to *iwasm* usage information, the following are changed:

``` Bash
iwasm [--wamr-lib=/path/to/libiwasm.so] [-v=0|1|2|3|4|5|6]
```

Where:
- *--wamr-lib* is a new optional argument which specifies the name of the WAMR compartment shared object library to load at runtime.  The default value is *./libiwasm.so* i.e libiwasm.so in the current directory.
- *-v=6* is a new debug level which is identical to the WAMR verbose level of 5, but additionally causes the capability manager to dump all symbol relocation tables parsed from the libiwasm.so ELF

### Toolchain Support
At the current time LLVM is not supported, therefore the GNU toolchain is required.  LLVM support will need to deal with the differences in how symbol relocation is performed when a shared object is loaded at runtime.

### Install Location
Performing the install step (e.g "install iwasm" from Visual Studio, or *cmake --install* from command-line) will generate:
- <install-dir>/bin/iwasm
- <install-dir>/lib/libiwasm.so

By default, <install-dir> will be *${HOME}/install/ARMc64-PureCap-CapMgr-debug*.

### Static or Dynamic Capability Manager
The capability manager can either be built to be a statically linked executable or a dynamically linked executable.
This is controlled with the **CHERI_STATIC_BUILD** CMake flag.
The default is statically linked, and at the time this is recommended.  Dynamically linked executable is likely to be needed in the future, when libraries for which there is not a static version will be needed.

Note that the WAMR compartment library (libiwasm.so) has to always be built dynamically.

#### Implications of Dynamic Capability Manager Executable
If the capability manager is build to a dyanmic executable then all dependent libraries must be loaded at runtime, as is the case for the libiwasm.so WAMR library.
However the same copy of depedent libraries cannot be used by the executable and the libiwasm.so, because they run in different PE states.
Therefore if the capability manager executable is built dynamic, the libiwasm.so library is loaded to a different namespace (via Linux system call *dlmopen()*) which will cause multiple versions of dependent libraries (such as libc.so) to be loaded.  This is all handled by the capability manager.

### Library Search Path
The WAMR library requires other shared object libraries (e.g libC) at runtime.  As these need to be a PureCap flavour, the default search path cannot be used therefore the search path must be specified.
By default, this is */purecap-lib* on the Morello box.  **It is recommended that all libraries and capability manager iwasm executable are placed in this same folder, to make things easier during development.**

If you want to change the search path, modify the following flag in *CMakePresets.json*:
- MORELLO_PURECAP_LIBS_FOLDER=your/path/here

**NOTE: If the capability manager executable is dynamically linked, it will search for needed libraries in this folder as well.**

### Capability Manager Logging
The iwasm Capability Manager executable uses a separate logger to the WAMR library, but the logging levels are analagous to WAMR.  The level of both is controlled by the *-v=n* iwasm command-line argument.

Note that at VERBOSE levels (> 4) a significant amount of logging is produced by the capability manager because all symbol reloctaion tables and patch-ups are logged.
Note also that the log is not flushed each time and happens through separate mechanisms, therefore is is possible for a WAMR log point to be written before an earlier capability manager log point.

### Source Code Changes for Compartmentalisation
A new folder is created specifically for supporting the capability manager and compartment framework, this can be found in:
./verifoxx-cheri-cap-mgr

Subfolders within this are:
- compartment/	: Compartment entry point and wrapper to call into a WAMR function
- common/	: Code shared between compartment and capability manager
- utils/	: Logger and utility classes for managing capabilities
- capgmr/	: Capability Manager files including main(), within main.cpp
- capmgr/cap_relocs/	: Responsible for patching relocation tables of loaded libraries
- capmgr/cap_relocs/link_map_internal/	: Access to internal GNU libC structures that are not normally available through the Std C API

Additionally, to support service callbacks for memory allocation and the now two CHERI related products, a shared folder is created for product platform specifics:
./core/shared/platform/common/cheri-purecap

With the specialisations in:
- ./core/shared/platform/common/cheri-purecap
- ./core/shared/platform/linux-cheri-purecap 		(standard CHERI-WAMR port)
- ./core/shared/platform/linux-cheri-purecap-capmgr	(experiemental compartmentalised CHERI-WAMR)

### Incomplete Functionality
At the time of writing there are a number of features not supported by the experimantal capability manager and compartments port:
- AOT mode is not supported yet (requires code changes to the internal PLT table in WAMR AOT handling)
- User native library functions are not supported (requires code changes to be able to call back to capability manager service for native calls)
- Most system calls / native calls (e.g WASI low-level calls) remain in compartment (only memory allocation calls back to capability manager; requires extensive changes to split WAMR into multiple parts)
- Full WAMR API is not yet supported, so only iwasm calls can be used (means calling WAMR from a native application may be limited; would require additional WAMR functions to be compartmentalised)

## WAMR-App Front-end
**IMPORTANT: The separate front-end is now deprecated and should no longer be used**

For development purposes a *Limited* WAMR front-end is provided which can be used instead of iwasm.  This is found in */front-end* folder.

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

## Externref Test Application
The externref test application is a native application that embeds WAMR functionality.  It is needed for testing externrefs when it is not possible to call WASM -> native -> WASM, because the called native cannot create a full execution environment.
Refer to [Externref Test Application](./tests/wamr-linux-cheri-purecap-tests/externref-app/README.md) for details.

**NOTE:** The Extenref Test Application does not suppor the experiemental compartmentalised WAMR at this time.

## Using AOT Mode and Compatibility with WAMRc
**Please also refer to [Building the AOT Compiler](./wamr-compiler/README.md) for more details on WAMRc support for CHERI.**

WAMRc is used to compile WASM and generate an AOT file.  This works by compiling WASM to LLVM IR and then generating target-specific object code from this.

Unlike WAMR, WAMRc is not intended to be built for a single target.  Instead, the WAMRc target is resolved from WAMRc command line arguments.

In the case of CHERI Morello targets, WAMRc will run on Linux x86_64 and cross-compile for Morello hybrid-cap or pure-cap.

However this causes a problem because some WAMR structures must be laid out identically on both WAMRc build machine and WAMR run machine.
In the case of WAMR on Morello pure-cap, all pointers are full capability and twice the size of a non-pure-cap platform.
To solve this issue, the build flag WAMR_BUILD_AOT_CHERI_PTR is introduced.

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


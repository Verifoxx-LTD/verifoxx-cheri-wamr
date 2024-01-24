CHERI-WAMR Capability Manager
=============================

**THIS DOCUMENT IS NOW OUT OF DATE**

This is an experimental front end program which implements a "capability manager" executable that calls WAMR API functions within a compartment in order to run a WASM application.  The executable provides similar functionality to the WAMR *iwasm* executable.

WAMR code is built to a dynamic library (shared object ELF) and loaded at runtime.

The information in the [top-level readme](./../README.md) is still valid, this document provides additional information which may supersede that Readme file.

## Building
By default, the *CMake* files will build the Capability Manager front end by including *CMakeLists.txt* from this folder.  Therefore the normal *CMakePresets.json* and Visual Studio can be used as per normal WAMR building.

However **only PureCap (+C64) Debug is currently supported**.
Therefore ensure you choose the *Debug armC64+ PureCap* configuration before building.

### Toolchain Support
At the current time LLVM is not supported therefore the GNU toolchain is required.
[The top-level readme](./../README.md) describes how a toolchain file can be configured and how one can set up for the GNU Toolchain (to use gcc).

### Static or Dynamic Capability Manager
The capability manager can either be built to be a statically linked executable or a dynamically linked executable.  The default is statically linked, and at the time this is recommended.  Dynamically linked executable is likely to be needed in the future, when libraries for which there is not a static version will be needed.

To build a dyanmically linked executable, in e.g the *CMakePresets.json* set:
- CAPMGR_BUILD_STATIC=0
(by default this is defined as CAPMGR_BUILD_STATIC=1).

### Library Search Path
The WAMR library requires other shared object libraries (e.g libC) at runtime.  As these need to be a PureCap flavour, the default search path cannot be used therefore the search path must be specified.

By default, this is */purecap-lib* on the Morello box.  **It is recommended that all libraries and capability manager executable are placed in this same folder, to make things easier during development.**

If you want to change the search path, modify the following flag in *CMakePresets.json*:
- MORELLO_PURECAP_LIBS_FOLDER=your/path/here

*NOTE: If the capability manager executable is dynamically linked, it will search for needed libraries in this folder as well*.

### Building normal WAMR
If it is desired to build the normal *iwasm* WAMR program, this can be achieved by adding this flag to the e.g *CMakePresets.json*:
- CAP_MGR=0

Note that the **absence** of this flag will default to building the capability manager, therefore is must be explicitly added and defined as zero.

### Build and Install Targets
The build will generate two targets:
- cheri-cap-mgr	: This is the capability manager executable front-end, it does not contain any WAMR code
- libiwasm.so : This is a dynamically-linked shared object containing all the WAMR code, along with a small wrapper to marshal running existing WAMR functions in the compartment

Performing the install step (e.g "install iwasm" from Visual Studio, or *cmake --install* from command-line) will generate:
- <install-dir>/bin/cheri-cap-mgr
- <install-dir>/lib/libiwasm.so

By default, <install-dir> will be *${HOME}/install/ARMc64-PureCap-debug*.

## Running
You can transfer the cheri-cap-mgr and libiwasm.so to Morello via e.g SCP, and move them to the target folder (e.g /purecap-lib).

The command string is then as follows:
``` Bash
cheri-cap-mgr [0|1|2|3|4|5] <libiwasm.so> <wasm-file> [<fn_to_run_or_default>] [param1 param2 param3...]
```

Where:
- 0, 1, 2, 3, 4 or 5 is an optional logging level.  0 is minimal logging, 4 is Verbose, 5 is Verbose + dump loaded library ELF relocation tables.  This logging level (0..4) is analagous to the WAMR *iwasm* logging verbosity level
- <libiwasm.so> is the WAMR dynamically linked shared object library which was built previously
- <wasm-file> is the WASM to load
- <fn_to_run_or_default> is an optional name of the WASM function to run; if this is ommitted the main() or WASI standard start() function is run.  Many WASM applications will not need a function name to be supplied.  **Note: The default WASI entry function is "_start"**
- Any further arguments are parameters which need to be passed to the WASM function being run.

Example, run WASM module built from code with a C main() function using default logging level:
``` Bash
cheri-cap-mgr ./libiwasm.so ~/my_wasm.wasm
```

Example, running a WASM function called wasm_test() which takes two integer arguments and verbose logging:
``` Bash
cheri-cap-mgr 4 ./libiwasm.so ~/some_wasm.wasm wasm_test 1 2
```

## Debugging on Morello with Visual Studio
With reference to *README.MD* in the root folder, to debug on Visual Studio with GDB it is necessary to include a debug configuration in *launch.vs.json* which will launch the cheri-cap-mgr with correct arguments in the /purecap-lib folder.

It is useful as part of the debugging step to be able to copy the targets across to Morello into the correct folder.  This means one can build and then debug without having to manually copy the targets - useful given there are now two build targets (an executable and a library).

Below is JSON to achieve all of this, which can be copied to your Debug launch configuration file .  Please though **note the lines which require modification** and also note that this is configured for a single debug configuration called **Morello CAP-MGR**.  If you have additional existing configurations, simply add the configuration below to the *configurations* element list.

``` JSON
{
  "version": "0.2.1",
  "defaults": {},
  "configurations": [
    {
      "args": [
        "4",
        "./libiwasm.so",
        "/root/helloworld.wasm"
      ],
      "cwd": "/purecap-lib",
      "debuggerConfiguration": "gdb",
      "env": {},
      "gdbPath": "/root/MORELLO-TOOLS/bin/aarch64-none-linux-gnu-gdb",
      "name": "Morello CAP-MGR",
      "project": "CMakeLists.txt",
      "projectTarget": "cheri-cap-mgr",
      "remoteMachineName": "192.168.0.39",
      "type": "cppgdb",
      "targetArchitecture": "arm64",
      "externalConsole": true,
      "deployDirectory": "/purecap-lib",
      "deployDebugRuntimeLibraries": "true",
      "disableDeploy": false,
      "program": "/purecap-lib/cheri-cap-mgr",
      "MIMode": "gdb",
      "miDebuggerServerAddress": "192.168.0.39",
      "deploy": [
        {
          "targetMachine": "192.168.0.39",
          "sourcePath": "${cmake.remoteBuildRoot}/verifoxx-cheri-cap-mgr/libiwasm.so",
          "targetPath": "/purecap-lib/libiwasm.so",
          "deploymentType": "RemoteRemote",
          "executable": false
        },
        {
          "targetMachine": "192.168.0.39",
          "sourcePath": "${cmake.remoteBuildRoot}/verifoxx-cheri-cap-mgr/cheri-cap-mgr",
          "targetPath": "/purecap-lib/cheri-cap-mgr",
          "deploymentType": "RemoteRemote",
          "executable": true
        }
      ],
      "comment": "Configuration for Capability Manager Testing"
    }
  ]
}
```
Where the following must be modified to fit your setup:
- *args* : specify as appropriate for the location of files on your system
- *gdbPath* : Full pathname of the aarch64-none-linux-gnu-gdb you installed as part of installing GNU Toolchain for Morello, on the morello box
- *remoteMachineName*, *miDebuggerServerAddress*, *targetMachine* : IP address of the Morello box on your network

### Note on Debugging for Dyanmically Linked Capability Manager
**This note is not applicable for a statically linked capability manager executable, which is the default.**

In the dynamic case, *libiwasm* is loaded at runtime via dlmopen() and so it will not be possible to debug symbols within this library.  Therefore although you can debug into assembly, setting breakpoints in source code will not work.  This is because the library needs to be opened in its own namespace, to isolate it from the capability manager executable.  If this was not done then there would only be a single copy of libraries needed by cheri-cap-mgr and libiwasm, e.g libc.so, and therefore it would not be possible to patch the procedure linkage relocation table because the symbol lookup would need to some of the time resolve to executive PE state and some of the time to restricted.

When statically linking the executable this is not applicable because all symbols used by the executable have been resolved at linktime, and therefore the only dynamic lookups will apply to libiwasm.so.

# Folder Structure
Everything related to the capability manager and compartments is located in this folder.  WAMR code remains unmodified.

Folders are:
- compartment\	: Compartment entry point and wrapper to call into a WAMR function
- common\	: Code shared between compartment and capability manager
- utils\	: Logger and utility classes for managing capabilities
- capgmr\	: Capability Manager files including main(), within main.cpp
- capmgr\cap_relocs\	: Responsible for patching relocation tables of loaded libraries
- capmgr\cap_relocs\link_map_internal\	: Access to internal GNU libC structures that are not normally available through the Std C API

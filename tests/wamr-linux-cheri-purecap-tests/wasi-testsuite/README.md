WASI-TestSuite running on CHERI Morello
=======================================

WASI Test Suite comprises a test environment written in Python and a number of WASM test cases specifically designed to verify WASI functionality on web assembly run times such as WAMR and wasmtime.
It is can be downloaded [here](https://github.com/WebAssembly/wasi-testsuite).

WASI test suite uses adapters to run the underlying runtime (e.g the *iwasm* program) in a sub-process, these are python files designed to massage the arguments for the program being tested.
In order to run the wasi-testsuite tests on Morello it is necessary to provide a *custom adapter file*.  This is because on Morello we must run the test environment locally on the host, but run the iwasm program remotely on Morello.  In the case of AOT testing, `wamrc` must also be run in order to compile the WASM test vector file to an AOT file.  The compilation can either be done locally or on a second remote machine.

This folder supplies two suitable adapters - the file *wamr-cheri.py* for testing interpreter mode and *wamr-cheri-aot.py* for testing AOT mode; instructions on how to use them are provided below.

Additionally, a set of WASM test cases is provided as two WASI Test Suite test sets.  These have been designed to be run alongside the set distributed with WASI Test Suite itself.
Please refer to instructions in [this folder](tests) to use those.

## How the Adapters Work
The wamr-cheri.py adapter works by remote copying needed files to a working area on the Morello board using SSH to login to the device.
The adapter then remotely runs the iwasm program with suitable arguments.
Finally it copies back the test vector files because some tests may be dependent on others (not ideal but how wasi-testsuite works) and deletes the working area on Morello.
The Python *fabric* package is used to handle file transfer and remote execution - this is a library commonly used in remote deployment.

The wamr-cheri-aot.py works in the same way, however that has an additional step which is to compile the provided WASM test case file to AOT.  This is done using `wamrc`, with supplied arguments to identify the target.
`wamrc` can either be run locally (if you are executing the python code on a suitable Linux machine) or remotely by SSH connection to a remote Linux machine (which can be a WSL2 installation).  In the case of a remotely executing compilation step then a temporary folder on the machine where python is running is used as an intermediate transfer location.

Note that due to all the file copying, running remotely is somewhat slow with each test taking several seconds to execute (for WASM) and typically up to 30s longer for AOT.  Note that the AOT time is dependent on the time to compile WASM to AOT; for large WASM files this can easily be 30s or more.

Due to the number of files and tests this is not significant - it was considered to use e.g rsync but this is not available on windows, and other mechanisms would lead to higher complexity.

### Configuration Data
The wasi-testsuite adapter file does not have access to the command-line because it is used internally from the main wasi-testsuite test runner program, however for the remote execution a number of parameters are required.
These are instead provided in a JSON file and an environment variable WAMR_CHERI_ADAPTER_JSON is set to be the pathname of the JSON file to load.
As there is no persistence between test execution, the JSON is loaded for each test.

Some JSON settings are mandatory and some are optional, only needed for AOT or running `wamrc` remotely for example.  Note that at the time of writing the WASI Test Suite limits what arguments can be passed to `iwasm`, for example for networking address pool and allowed domains.  To get around this, for tests that need it, these arguments can also be provided in the JSON settings file and applied globally to all tests that run with the adapter.

## Setting up the Environment
**NOTE: This section includes setting up the wasi-testsuite environment.

### Obtain wasi-testsuite
Clone or download [wasi-testsuite](https://github.com/WebAssembly/wasi-testsuite) to a suitable location on your machine (linux or windows).
Note you should pick the pre-built branch to get pre-built WASM files, as per wasi-testsuite documentation:

```bash
git clone --branch prod/testsuite-base https://github.com/WebAssembly/wasi-testsuite
```

### Use of Virtual Python Environment
It is recommended to set up a python venv whenever working on a new project.
You can do this in the standard way, for example :

```bash
python -m venv path/to/your/venv/folder
```

### Install Dependencies
First install dependencies specific for Morello testing, by installing from *wamr-cheri-requirements.txt* in this folder, e.g:

``` Bash
pip install -r wamr-cheri-requirements.txt
```

Now install wasi-testsuite dependencies as described in the wasi-testsuite readme, for example (from the wasi-testsuite root folder):

```bash
pip install -r test-runner/requirements.txt
```

### Create a suitable Settings JSON File
Several examples and templates are provided in the folder *adapter-json-configs/'.

The following examples are provided in that folder:
- *example_wamr_cheri_adapter_settings.json* : Basic example, for non-AOT testing
- *example_with_aot_wamr_cheri_adapter_settings_local_wamrc.json* : Includes the WASM -> AOT converion, `wamrc` runs on the local machine
- *example_with_aot_wamr_cheri_adapter_settings_remote_wamrc.json* : Includes the WASM -> AOT converion, `wamrc` runs on a remote linux machine, access details provided in the JSON

There are also some templates for testing different modes; these can be used for the AOT or non-AOT adapter (AOT settings are ignored in the latter case):
- *wamr_hybrid_adapter_settings.json* : Shows wamrc arguments to build an AOT suitable for Morello hybrid-cap
- *wamr_hybrid_network_adapter_settings.json* : As above, but includes settings to provide additional networking arguments to `iwasm`
- *wamr_purecap_network_adapter_settings.json* : wamrc arguments to build an AOT for Morello pure-cap, also with the networking support
- *wamr_x86_64_adapter_settings.json* : Shows running a wamrc remotely on a Linux x86_64 machine, and executing iwasm on the same machine
- *wamr_x86_64_network_adapter_settings.json* : As above, but with the additional networking arguments

#### The JSON Settings File
The following keys are mandatory for both the *wamr-cheri.py* and the *wamr-cheri-aot.py* adapters:
- **hostname**: This is the IP address and optional port of the Morello machine on your network, an SSH connection will be made to this machine.  Format is `<ip_or_domain>:[port_number]`.  Port defaults to 22, SSH standard port.
- **key**: An SSH private key file which has previously been configured to access the Morello machine without a password (use of "~" for home directory is supported)
- **user**: Username to log in to Morello.  Should be "root"
- **dest**: A temporary work area on the Morello machine which wasi-testsuite can use (absolute pathname).  Within this, for each test a working folder is created and then deleted after the test.
- **wamr**: Absolute pathname of WAMR's *iwasm* program on the Morello machine

Additional optional keys can be provided for networking support:
- **addrpool**: Value of the *--addr-pool=<value>* WAMR argument; forces *--addr-pool* to be added to all `iwasm` executions
- **allowres**: Value of the *--allow-resolve=<value>* WAMR argument; forces *--allow-resolve* to be added to all `iwasm` executions

When using the `wamr-cheri-aot.py` adapter, an additional mandatory argument is needed to provide the full path of the WAMR compiler.  This is ignored if using the non-AOT adapter:
- **wamrc**: Absolute pathname of WAMR compiler *wamrc* program on the local or remote machine

Further optional keys can be added for the WASM to AOT file compilation - these are also ignored when not using the *wamr-cheri-aot.py* adapter:
- **wamrc_args**: Provide arguments for `wamrc`; this string is added verbatim to the command string when launching `wamrc` (typically used to select a target triple).  Can be omitted or empty.
- **wamrc_host**: A dictionary of further keys to be used when running `wamrc` remotely.  Optional, omit when running `wamrc` locally.  The sub-keys are:
   - **hostname**: IP address and optional port of the remote machine where `wamrc` is run.  Format is `<ip_or_domain>:[port_number]`.  Port defaults to 22, SSH standard port.
   - **user**: Username to log in to the remote Linux machine which will run `wamrc`.
   - **key**: An SSH private key file which has previously been configured to access the remote Linux machine without a password (use of "~" for home directory is supported)
   - **dest**: A temporary work area on the remote Linux machine which wasi-testsuite can use to create the AOT file (absolute pathname).
   
### Set up WAMR_CHERI_ADAPTER_JSON
Add an environment variable WAMR_CHERI_ADAPTER_JSON to be set to the absolute pathname of the JSON file you created above.

For example:

```bash
export WAMR_CHERI_ADAPTER_JSON=/home/username/wamr_cheri_adapter_settings.json
```

On Linux you could provide this on the command line for running the testsuite program.

## Running
With reference to the wasi-testsuite documentation, run the testsuite and pass in *wamr-cheri.py* or *wamr-cheri-aot.py* for the adapter name.  Examples:

```bash
python3 ./test-runner/wasi_test_runner.py -t ./tests/c/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri.py
```
will run all the C test cases using the WASM Interpreter.

```bash
python3 ./test-runner/wasi_test_runner.py -t ./tests/rust/testsuite ./tests/assemblyscript/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri-aot.py
```
will run all the Assemblyscript and Rust test cases using the AOT Interpreter, by first compiling WASM to AOT for each test.

## Skipped Tests
Currently three Rust test cases fail due to internal WAMR libc-wasi or C standard library behaviours which differ from that expected by the test cases.
For this reason, these tests should be skipped as it it not an error if they fail on WAMR on a Linux based architecture.

A "skip tests" JSON file has been created, *skiptests.json* which is found in this folder.
Use it by supplying the *-f* option to *wasi_test_runner.py* for example:

```bash
python3 ./test-runner/wasi_test_runner.py -t ./tests/rust/testsuite -f ./verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/skiptests.json -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri-aot.py
```

## Results
The tests have been run on CHERI Morello Pure-cap, CHERI Morello Hybrid and Linux x86_64.  At the time of writing the results are as follows:

*WASM Interprer Mode*:
- All 11 C tests pass
- All 12 Assemblyscript tests pass
- 9 of 12 Rust tests pass, 3 being skipped.

*AOT Mode*:
- All 11 C tests pass
- All 12 Assemblyscript tests pass
- 9 of 12 Rust tests pass, 3 being skipped

All results are identical for all three test architectures.

The three skipped tests are:
1. close_preopen.wasm/.rs
2. fd_filestat_get.wasm/.rs
3. interesting_paths.wasm/.rs

A Verifoxx JIRA ticket has been raised to cover explanation of why these are skipped.

## Experimental CHERI-WAMR Compartmentalisation Testing
The *linux-cheri-purecap-capmgr* product build generates the experimental iwasm capability manager and WAMR as libiwasm, a dynamic shared object library.
This application can be tested with the WASI-TestSuite for CHERI Morello using the same methods as described above, but please note the following:

1. The WASI Test Suite program does not support passing the new *--wamr-lib=<.so>* option, therefore ensure you place the *libiwasm.so* in the same folder as *iwasm* so it can be found using the default search path.
2. AOT is not currently supported on this experimental product version, therefore use the *wamr-cheri.py* adapter and not *wamr-cheri-aot.py*.
3. It is possible some tests may fail on the experimental platform as it is still a work in progress.

WASI-TestSuite running on CHERI Morello
=======================================

WASI Test Suite comprises a test environment written in Python and a number of WASM test cases specifically designed to verify WASI functionality on web assembly run times such as WAMR and wasmtime.
It is can be downloaded [here](https://github.com/WebAssembly/wasi-testsuite).

WASI test suite uses adapters to run the underlying runtime (e.g the *iwasm* program) in a sub-process, these are python files designed to massage the arguments for the program being tested.
In order to run the wasi-testsuite tests on Morello it is necessary to provide a *customer adapter file*.  This is because on Morello we must run the test environment locally on the host, but run the iwasm program remotely on Morello.

This folder supplies a suitable adapter - the file *wamr-cheri.py*; instructions on how to use it are provided below.

## How the Adapter Works
The wamr-cheri.py adapter works by remote copying needed files to a working area on the Morello board using SSH to login to the device.
It then remotely runs the iwasm program with suitable arguments.
Finally it copies back the test vector files because some tests may be dependent on others (not ideal but how wasi-testsuite works) and deletes the working area on Morello.
The Python *fabric* package is used to handle file transfer and remote execution - this is a library commonly used in remote deployment.

Note that due to all the file copying, running remotely is somewhat slow with each test taking several seconds to execute.
Due to the number of files and tests this is not significant - it was considered to use e.g rsync but this is not available on windows, and other mechanisms would lead to higher complexity.

### Configuration Data
The wasi-testsuite adapter file does not have access to the command-line because it is used internally from the main wasi-testsuite test runner program, however for the remote execution a number of parameters are required.
These are instead provided in a JSON file and an environment variable WAMR_CHERI_ADAPTER_JSON is set to be the pathname of the JSON file to load.
As there is no persistence between test execution, the JSON is loaded for each test.

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
An example is provided in this folder as *example_wamr_cheri_adapter_settings.json*.  You can use this as a template and modify.
You need to provide te following JSON keys:
- **hostname**: This is the IP address of the Morello machine on your network, an SSH connection will be made to this machine
- **key**: An SSH private key file which has previously been configured to access the Morello machine without a password (Use of "~" for home directory is supported)
- **user**: Username to log in to Morello.  Should be "root"
- **dest**: A temporary work area on the Morello machine which wasi-testsuite can use (absolute pathname).  Within this, for each test a working folder is created and then deleted after the test.
- **wamr**: Absolute pathname of WAMR's *iwasm* program on the Morello machine

### Set up WAMR_CHERI_ADAPTER_JSON
Add an environment variable WAMR_CHERI_ADAPTER_JSON to be set to the absolute pathname of the JSON file you created above.

For example:

```bash
export WAMR_CHERI_ADAPTER_JSON=/home/username/wamr_cheri_adapter_settings.json
```

On Linux you could provide this on the command line for running the testsuite program.

## Running
With reference to the wasi-testsuite documentation, run the testsuite and pass in *wamr_cheri.py* for the adapter name.  For example:

```bash
python3 ./test-runner/wasi_test_runner.py -t ./tests/c/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri.py
```
will run all the C test cases.

## Results
At the time of writing:
- All 11 C tests pass
- All 12 Assemblyscript tests pass
- 6 of 9 Rust tests pass, 3 failures

The three failures occur on non-Morello WAMR (tested on Linux x86_64) and one fails on wasmtime also.
There appear to be no problems with WAMR and there are likely issues with the exepted results from the test not complying with WAMR or the underlying tools used to build it.

The three failures are:
1. close_preopen.wasm/.rs
2. fd_filestat_get.wasm/.rs
3. interesting_paths.wasm/.rs

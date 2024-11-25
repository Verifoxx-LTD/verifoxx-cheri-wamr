WASI-TestSuite CHERI Test Case Sets
===================================

This folder contains two test sets with a number of WASM test cases that have been adapted ro run using the WASI Test Suite.

*./cheri/* comprises a set of tests which should be run using an adapter **without** networking support, i.e a JSON settings file without `allowres` and `addrpool` keys.
*./cheri-net/* is a set of tests which require networking support; recommended to add `allowres: "*"` and `addrpool: "0.0.0.0/0"` to your JSON settings file.

## Running the test suites
Set the adapter as necessary and then run using WASI Test Suite test runner, for example:

```bash
export WAMR_CHERI_ADAPTER_JSON=wamr_cheri_adapter_with_aot_settings.json
python3 ./test-runner/wasi_test_runner.py -t ./tests/cheri/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri.py
python3 ./test-runner/wasi_test_runner.py -t ./tests/cheri/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri-aot.py
```

```bash
export WAMR_CHERI_ADAPTER_JSON=wamr_cheri_adapter_with_aot_settings_with_networking.json
python3 ./test-runner/wasi_test_runner.py -t ./tests/cheri-net/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri.py
python3 ./test-runner/wasi_test_runner.py -t ./tests/cheri-net/testsuite -r ~/verifoxx-cheri-wamr/tests/wamr-linux-cheri-purecap-tests/wasi-testsuite/wamr-cheri-aot.py
```

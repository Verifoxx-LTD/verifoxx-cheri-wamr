// cheri_wasm_native_test.h: Some functions so WASM can call native

#ifndef _CHERI_WASM_NATIVE_TEST_H_
#define _CHERI_WASM_NATIVE_TEST_H_

#include "wasm_export.h"

#ifdef __cplusplus
#include <cstdint>
extern "C"
{
#else
#include <stdint.h>
#endif

#define WASM_STACK_SIZE 4096
#define WASM_HEAP_SIZE 2048


int32_t print_externref(wasm_exec_env_t exec_env, uintptr_t extref);
uintptr_t get_externref(wasm_exec_env_t exec_env);
int32_t put_externref(wasm_exec_env_t exec_env, uintptr_t extref);
int32_t externref_test_called_from_native(wasm_exec_env_t exec_env, wasm_module_inst_t module_inst);

#ifdef __cplusplus
}
#endif
#endif /* _CHERI_WASM_NATIVE_TEST */

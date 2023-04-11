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

NativeSymbol* native_symbols_table();
uint32_t num_native_symbols();

uint32_t do_sum(wasm_exec_env_t exec_env, uint32_t a, uint32_t b, uint32_t c);
uint32_t do_sum_ex(wasm_exec_env_t exec_env, uint32_t a, uint32_t b, uint32_t c);   // Version which calls back to WASM from native
uint32_t do_sum_many_args(wasm_exec_env_t exec_env,
    uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4,
    uint32_t a5, uint32_t a6, uint32_t a7, uint32_t a8,
    uint32_t a9, uint32_t a10, uint32_t a11, uint32_t a12,
    char* str13, uint32_t a14);

uint64_t print_something(wasm_exec_env_t exec_env, char* buffer);
uint64_t print_something_ex(wasm_exec_env_t exec_env, char* buffer);    // Version which calls back to WASM from native



#ifdef __cplusplus
}
#endif
#endif /* _CHERI_WASM_NATIVE_TEST */

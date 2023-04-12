/* clang --target=wasm32-unknown-wasi -Wl,--allow-undefined -o wamr_natives_and_call_wasm.wasm wamr_natives_and_call_wasm.c */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

// WASM functions we will export for native calls
uint32_t print_in_wasm(char *buffer);
int64_t subtract_in_wasm(int32_t a, int32_t b);

extern uint32_t do_sum_ex(uint32_t a, uint32_t b, uint32_t c);
extern uint64_t print_something_ex(char* buffer);
extern uint32_t do_sum_many_args(
    uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4,
    uint32_t a5, uint32_t a6, uint32_t a7, uint32_t a8,
    uint32_t a9, uint32_t a10, uint32_t a11, uint32_t a12,
    char* str13, uint32_t a14);



int main()
{
	uint32_t sumval = do_sum_ex(1, 2, 3);
	printf("Do sum (ex) = %u\n", sumval);
	
	sumval = do_sum_many_args(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, "*SUM!*", 14);
	printf("Do sum many args = %u\n", sumval);
	
	uint64_t num_chars = print_something_ex("Print using native");
	
	printf("Printed %llu chars\n", num_chars);
	
	return 0;
}

__attribute__((export_name("print_in_wasm")))
uint32_t print_in_wasm(char *buffer)
{
	printf("print_in_wasm(): buffer: %s\n", buffer);
	return strlen(buffer);
}

__attribute__((export_name("subtract_in_wasm")))
int64_t subtract_in_wasm(int32_t a, int32_t b)
{
	return (int64_t)(a - b);
}


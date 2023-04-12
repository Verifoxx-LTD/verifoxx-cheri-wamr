/* Build with clang --target=wasm32-unknown-wasi -o wamr_native_calls.wasm wamr_native_calls.c */

#include <stdint.h>
#include <stdio.h>

extern uint32_t do_sum(uint32_t a, uint32_t b, uint32_t c);
extern uint64_t print_something(char* buffer);


int main()
{
	printf("wamr_native_calls.wasm: Test calling native C++ from WASM\n");
	printf("  WASM: call native do_sum(1,2,3)\n");
	uint32_t sumval = do_sum(1, 2, 3);
	printf("  WASM: do_sum() returns: %u\n", sumval);

	char *my_string = "String passed from WASM -> native";
	printf("  WASM: call native print_something(<string>)\n");
	uint64_t num_chars = print_something(my_string);
	printf("  WASM: print_something() returns: %llu\n", num_chars);
	printf("Native function printed %llu characters\n", num_chars);
	return 0;
}


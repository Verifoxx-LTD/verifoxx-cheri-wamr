/* Build with clang --target=wasm32-unknown-wasi -O3 -nostdlib -Wl,--entry=main -Wl,--allow-undefined -o hello_puts.wasm hello_puts.c */

/** IMPORTANT: Has no start function, and returns single argument.
	When running with wamr-app frontend run as:
		wamr-app hello_puts.wasm __original_main 0
**/


extern int puts(const char *str);

int main(void)
{
	puts("Hello WAMR!");
	return 1;
}


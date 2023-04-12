/* Build with clang --target=wasm32-unknown-wasi -o hello_wamr.wasm hello_wamr.c */
#include <stdio.h>

int main(void)
{
    printf("printf() says \"Hello WAMR!\"\n");
    return 1;
}


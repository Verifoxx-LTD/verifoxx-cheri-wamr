/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

 // Standalone random number test for WASI-libC using standard library functions
 
 /* Build with clang --target=wasm32-unknown-wasi -o wasi_random.wasm wasi_random.c */

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    int i;
    time_t t;

    srand((unsigned)time(&t));

    for (i = 0; i < 5; i++) {
        printf("Random: %d\n", rand());
    }

    return EXIT_SUCCESS;
}

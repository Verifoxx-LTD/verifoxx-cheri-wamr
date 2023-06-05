/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

 // Standalone time test for WASI-libC using standard library functions
 // ref https://github.com/WebAssembly/wasi-testsuite/

 /* Build with clang --target=wasm32-unknown-wasi -o wasi_clock.wasm wasi_clock.c */

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    struct timespec ts, ts1, ts2;

    printf("Test monotonic clock resolution\n");
    assert(clock_getres(CLOCK_MONOTONIC, &ts) == 0);
    printf("Test monotonic clock resolution PASS\n");

    printf("Test realtime clock resolution\n");
    assert(clock_getres(CLOCK_REALTIME, &ts) == 0);
    printf("Test realtime clock resolution PASS\n");

    printf("Test monotonic clock delta\n");
    assert(clock_gettime(CLOCK_MONOTONIC, &ts1) == 0);
    assert(clock_gettime(CLOCK_MONOTONIC, &ts2) == 0);

    if (ts1.tv_sec == ts2.tv_sec)
        assert(ts1.tv_nsec < ts2.tv_nsec);
    else
        assert(ts1.tv_sec < ts2.tv_sec);

    printf("Test monotonic clock delta PASS\n");

    printf("Test realtime clock value\n");
    assert(clock_gettime(CLOCK_REALTIME, &ts) == 0);
    printf("Test realtime clock PASS [secs=%llu]\n", ts.tv_sec);

    return EXIT_SUCCESS;
}
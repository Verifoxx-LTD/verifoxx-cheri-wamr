/*
 * Copyright (C) 2019 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

// Standalone simple file test for WASI-libC using POSIX functions
// Copy a file: ref WASI Wasmtime tutorial

/* Build with clang --target=wasm32-unknown-wasi -o wasi_simple_file.wasm wasi_simple_file.c */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int main(int argc, char** argv) {
    ssize_t n, m;
    char buf[BUFSIZ];

    if (argc != 3) {
        fprintf(stderr, "usage: %s <from> <to>\n", argv[0]);
        exit(1);
    }

    int in = open(argv[1], O_RDONLY);
    if (in < 0) {
        fprintf(stderr, "error opening input %s: %s\n", argv[1], strerror(errno));
        exit(1);
    }

    int out = open(argv[2], O_WRONLY | O_CREAT, 0660);
    if (out < 0) {
        fprintf(stderr, "error opening output %s: %s\n", argv[2], strerror(errno));
        exit(1);
    }

	printf("Copying contents of %s to %s...\n", argv[1], argv[2]);
    while ((n = read(in, buf, BUFSIZ)) > 0) {
        char* ptr = buf;
        while (n > 0) {
			printf("Read %zu bytes...\n", n);
            m = write(out, ptr, (size_t)n);
            if (m < 0) {
                fprintf(stderr, "write error: %s\n", strerror(errno));
                exit(1);
            }
			printf("Wrote %zu bytes...\n", m);
            n -= m;
            ptr += m;
        }
    }

    if (n < 0) {
        fprintf(stderr, "read error: %s\n", strerror(errno));
        exit(1);
    }

	printf("**Finished**\n");
    return EXIT_SUCCESS;
}

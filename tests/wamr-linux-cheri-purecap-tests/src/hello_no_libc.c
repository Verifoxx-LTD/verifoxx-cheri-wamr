/* Build with clang -Os -nostdlib --target=wasm32 -Wl,--allow-undefined hello_no_libc.c -o hello_no_libc.wasm */
// ----------------------------------------------------
// Short version of
// https://github.com/WebAssembly/wasi-libc/blob/main/libc-bottom-half/headers/public/wasi/api.h
// to support the WASI fd_write function


typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

typedef long size_t;
typedef uint16_t __wasi_errno_t;
typedef uint32_t __wasi_fd_t;

typedef struct __wasi_ciovec_t {
    const void *buf;
    size_t buf_len;
} __wasi_ciovec_t;

#define __WASI_SYSCALL_NAME(name) \
    __attribute__((__import_module__("wasi_unstable"), __import_name__(#name)))

__wasi_errno_t __wasi_fd_write(
    __wasi_fd_t fd,
    const __wasi_ciovec_t *iovs,
    size_t iovs_len,
    size_t *nwritten
) __WASI_SYSCALL_NAME(fd_write);

// ----------------------------------------------------
// returns the length of the string
size_t slen(const char *str)
{
    const char *s;
    for (s = str; *s; ++s)
        ;
    return (s - str);
}

// sends string to stdout
void print(const char *str)
{
    const __wasi_fd_t stdout = 1;
    size_t nwritten;
    __wasi_errno_t error;
    __wasi_ciovec_t iovec;

    iovec.buf = str;
    iovec.buf_len = slen(str);
    error =__wasi_fd_write(stdout, &iovec, 1, &nwritten);
}

// ----------------------------------------------------

// main entry point
__attribute__((export_name("_start")))
void _start()
{
    print("Hello WAMR!\n");
}


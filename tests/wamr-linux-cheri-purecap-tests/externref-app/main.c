// Main file for building the native test application which calls WASM

#include <stdio.h>
#include <stddef.h>
#include <malloc.h>
#include <sys/stat.h>
#include <sys/auxv.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

#ifdef __CHERI__
#include <cheriintrin.h>
#endif

#include "test_routines.h"

static NativeSymbol native_symbols[] = {
    EXPORT_WASM_API_WITH_SIG(print_externref, "(r)i"),
    EXPORT_WASM_API_WITH_SIG(get_externref, "()r"),
    EXPORT_WASM_API_WITH_SIG(put_externref, "(r)i")
};

static char* read_file_to_buffer(const char* filename, uint32_t* ret_size)
{
    char* buffer;
    int file;
    uint32_t file_size, buf_size, read_size;
    struct stat stat_buf;

    if (!filename || !ret_size) {
        printf("Read file to buffer failed: invalid filename or ret size.\n");
        return NULL;
    }

    if ((file = open(filename, O_RDONLY, 0)) == -1) {
        printf("Read file to buffer failed: open file %s failed.\n", filename);
        return NULL;
    }

    if (fstat(file, &stat_buf) != 0) {
        printf("Read file to buffer failed: fstat file %s failed.\n", filename);
        close(file);
        return NULL;
    }

    file_size = (uint32_t)stat_buf.st_size;

    /* At lease alloc 1 byte to avoid malloc failed */
    buf_size = file_size > 0 ? file_size : 1;

    if (!(buffer = malloc(buf_size))) {
        printf("Read file to buffer failed: alloc memory failed.\n");
        close(file);
        return NULL;
    }

    read_size = (uint32_t)read(file, buffer, file_size);
    close(file);

    if (read_size < file_size) {
        printf("Read file to buffer failed: read file content failed.\n");
        free(buffer);
        return NULL;
    }

    *ret_size = file_size;
    return buffer;
}

static void destroy_app_wasm_runtime(wasm_exec_env_t exec_env, wasm_module_inst_t module_inst, wasm_module_t wasm_module, uint8_t *wasm_file_buf)
{
    if (exec_env)
        wasm_runtime_destroy_exec_env(exec_env);
    
    if (module_inst)
        wasm_runtime_deinstantiate(module_inst);
    
    if (wasm_module)
        wasm_runtime_unload(wasm_module);

    wasm_runtime_destroy();

    if (wasm_file_buf)
        free(wasm_file_buf);

}

int main(int argc, char* argv[])
{
    uint8_t* wasm_file_buf = NULL;
    wasm_module_t wasm_module = NULL;
    wasm_module_inst_t wasm_module_inst = NULL;
    wasm_exec_env_t exec_env = NULL;
    wasm_function_inst_t func = NULL;
    char error_buf[128];
    uint32_t wasm_file_size = 0;

    RuntimeInitArgs init_args;
    int result = -2;

    if (argc != 2)
    {
        printf("Usage: %s <wasm_or_aot_file>\n", argv[0]);
        return -1;
    }

    printf("%s running, loading %s...\n", argv[0], argv[1]);

    memset(&init_args, 0, sizeof(RuntimeInitArgs));

    /* configure the memory allocator for the runtime */
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.mem_alloc_option.allocator.malloc_func = NULL;
    init_args.mem_alloc_option.allocator.realloc_func = NULL;
    init_args.mem_alloc_option.allocator.free_func = NULL;

    // Set up native symbols
    init_args.native_module_name = "env";
    init_args.n_native_symbols = sizeof(native_symbols) / sizeof(NativeSymbol);
    init_args.native_symbols = native_symbols;

    /* initialize runtime environment with user configurations*/
    wasm_runtime_full_init(&init_args);

    /* load WASM byte buffer from WASM bin file */
    if (!(wasm_file_buf = (uint8_t*)read_file_to_buffer(argv[1], &wasm_file_size)))
    {
        printf("Failed to read WASM or AOT file\n");
        destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);
        return -1;
    }

    /* load WASM module */
    if (!(wasm_module = wasm_runtime_load(wasm_file_buf, wasm_file_size, error_buf, sizeof(error_buf))))
    {
        printf("Failed to create module: %s\n", error_buf);
        destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);
        free(wasm_file_buf);
        return -1;
    }
    
    /* Create module instance */
    if (!(wasm_module_inst = wasm_runtime_instantiate(wasm_module, WASM_STACK_SIZE, WASM_HEAP_SIZE, NULL, 0)))
    {
        printf("Failed to instantiate module\n");
        destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);
        return -1;
    }

    /* And create an execution environment */
    if (!(exec_env = wasm_runtime_create_exec_env(wasm_module_inst, WASM_STACK_SIZE)))
    {
        printf("Failed create exec env\n");
        destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);
        return -1;
    }

    printf("Performing tests...\n");
    if (!(func = wasm_runtime_lookup_function(wasm_module_inst, "externref_test_in_wasm", NULL)))
    {
        printf("Func not found\n");
        destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);
        return -1;
    }

    result = externref_test_called_from_native(exec_env, wasm_module_inst);
    
    destroy_app_wasm_runtime(exec_env, wasm_module_inst, wasm_module, wasm_file_buf);

    if (0 == result)
    {
        printf("Tests PASS\n");
    }
    else
    {
        printf("Tests FALIED - return code: %d\n", result);
    }
    return result;
}


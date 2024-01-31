/*
 * Copyright (C) 2023 Intel Corporation.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

/*
 * Copyright (C) 2023 Verifoxx Limited
 * Main program for the wamr-app frontend
 */

 /* C++ port of linux-cheri-purecap/main.c to enable use with C++ capability manager and
 * removal of WAMR specific parts
 */

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

// C includes
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstddef>
#include <cstdint>
#include <cheriintrin.h>
#include <sys/mman.h>

// C++ includes
#include <iostream>
#include <fstream>
#include <string>
#include <memory>
#include <vector>

// WAMR includes
#include "wasm_export.h"

// CapMgr Includes
#include "CCapability.h"
#include "CCompartment.h"
#include "CCompartmentData.h"
#include "CCompartmentLibs.h"
#include "CWamrProxy.h"
#include "CCapMgrLogger.h"

using namespace CapMgr;

#if BH_HAS_DLFCN
#include <dlfcn.h>
#endif

static int app_argc;
static char** app_argv;

void set_capmgr_log_level(uint32 log_level)
{
    if (log_level > (uint32)VERBOSE)
        log_level = (uint32)VERBOSE;

    Log::Level() = (TLogLevel)log_level;
}


/* Capability Manager Support: Load DLL and patch relocation symbols */
static bool lib_load_and_fix(const std::string& libname, CCompartmentLibs*& plibs, bool dump_tables = false)
{
    auto rwcap{ Capability(getauxptr(AT_CHERI_EXEC_RW_CAP)) };
    auto fixup_cap{ Capability(getauxptr(AT_CHERI_EXEC_RW_CAP)) };

#if CAPMGR_BUILT_STATIC_ENABLE
    bool load_new = false;  // For static build, the cap mgr has no linkmap so cannot load a new one
#else
    bool load_new = true;
#endif
    plibs = new CCompartmentLibs{ libname, rwcap, fixup_cap, load_new };

    if (dump_tables)
    {
        L_(VERBOSE) << "Dump libs phdrs: " << *plibs;
        L_(VERBOSE) << "Dump reloc tables: " << plibs->DumpRelocTables();
    }

    L_(DEBUG) << "Do capability relocation fixups...";
    return plibs->DoAllLibCapFixups();
}

/* Capability Manager Support: Fixup relocation symbols ahead of program exit */
// @todo: make it part of CCompartmentLibs destructor
static bool lib_restore_and_end(CCompartmentLibs* plibs)
{
#if CAPMGR_BUILT_STATIC_ENABLE
    L_(VERBOSE) << "No action to revert fixups needed for static build";
    return true;
#else

    L_(DEBUG) << "Revert capability relocation fixups...";

    auto result = plibs->DoAllLibCapFixups(false);

    L_(DEBUG) << "Delete the libs and dlclose()";
    delete plibs;
    return result;
#endif
}

// C++ function made to look like original WAMR C function
static char* load_file_to_buffer(const char* filename, uint32* ret_size, std::vector<char> &buff)
{
    *ret_size = 0;
    std::ifstream fin(filename, std::ios::in | std::ios::binary | std::ios::ate);
    if (!fin.good())
    {
        printf("Cannot find file %s, or processing it failed\n", filename);
        return NULL;
    }

    fin.seekg(0, std::ios::end);
    auto sz = fin.tellg();
    fin.seekg(0, std::ios::beg);

    buff.resize(sz);

    if (!fin.read(buff.data(), sz))
    {
        printf("Failed to read in file %s\n", filename);
        fin.close();
        return NULL;
    }
    fin.close();
    *ret_size = sz;
    return buff.data();
}

static void *do_aot_mmap(uint32 size)
{
    int map_prot = PROT_READ | PROT_WRITE | PROT_EXEC;
    int map_flags = MAP_ANONYMOUS | MAP_PRIVATE;

    uint64 request_size, page_size;
    uint8* addr = (uint8*)MAP_FAILED;
    uint32 i;

    page_size = (uint64)getpagesize();
    request_size = cheri_align_up(size, page_size);

    if ((size_t)request_size < size)
        /* integer overflow */
        return NULL;

    if (request_size > 16 * (uint64)UINT32_MAX)
        /* at most 16 G is allowed */
        return NULL;

    // For CHERI pure-cap we must request full access and use mprotect to adjust
    // Otherwise the capability returned has no r/w/x permissions
    L_(DEBUG) << "CHERI-PURECAP mode calls mmap() with full access and mprotect() with flags: " << map_prot;
    addr = (uint8*)mmap(NULL, request_size, PROT_MAX(PROT_READ | PROT_WRITE | PROT_EXEC), map_flags, -1, 0);
    if (MAP_FAILED == addr || 0 != mprotect(addr, request_size, map_prot))
    {
        addr = (uint8*)MAP_FAILED;  // Either mmap() or mprotect() failed
    }

    if (addr == MAP_FAILED)
    {
        printf("AOT mmap failed\n");
        return NULL;
    }
    
    L_(DEBUG) << "AOT Memory mapped ok to address: " << addr;
    return addr;
}

static void do_aot_unmap(void* addr, size_t size)
{
    uint64 page_size = (uint64)getpagesize();
    uint64 request_size = cheri_align_up(size, page_size);

    if (addr)
    {
        if (munmap(addr, request_size))
        {
            printf("AOT munmap error addr:%p, size:0x%" PRIx64 ", errno:%d\n",
                addr, request_size, errno);
            return;
        }
    }
    L_(DEBUG) << "AOT Mapped memory recovered ok";
}

int do_aot_memcpy_s(void* s1, unsigned int s1max, const void* s2, unsigned int n)
{
    if (n)
    {
        char* dest = (char*)s1;
        char* src = (char*)s2;

        if (s1 == NULL) {
            return -1;
        }
        if (s2 == NULL || n > s1max) {
            std::memset(dest, 0, s1max);
            return -1;
        }
        std::memcpy(dest, src, n);
    }
    return 0;
}

/* clang-format off */
static int
print_help()
{
    printf("iwasm CHERI Capability Manager - WAMR runs within a compartment\n");
    printf("Usage: iwasm [-options] wasm_file [args...]\n");
    printf("options:\n");

/* Capability Manager Addition */
    printf("  --wamr-lib=<lib>       Load Shared object (.so) containing WAMR\n");
    printf("                           Defaults to .\\libiwasm.so\n");

    printf("  -f|--function name       Specify a function name of the module to run rather\n"
        "                           than main\n");
#if WASM_ENABLE_LOG != 0
    printf("  -v=n                     Set log verbose level (0 to 6, default is 2) larger\n"
        "                           level with more log.  Level 5 verbose, 6 is verbose with\n"
        "                           dump of symbol relocation tables in WAMR library\n");
#endif
#if WASM_ENABLE_INTERP != 0
    printf("  --interp                 Run the wasm app with interpreter mode\n");
#endif
#if WASM_ENABLE_FAST_JIT != 0
    printf("  --fast-jit               Run the wasm app with fast jit mode\n");
#endif
#if WASM_ENABLE_JIT != 0
    printf("  --llvm-jit               Run the wasm app with llvm jit mode\n");
#endif
#if WASM_ENABLE_JIT != 0 && WASM_ENABLE_FAST_JIT != 0 && WASM_ENABLE_LAZY_JIT != 0
    printf("  --multi-tier-jit         Run the wasm app with multi-tier jit mode\n");
#endif
    printf("  --stack-size=n           Set maximum stack size in bytes, default is 64 KB\n");
    printf("  --heap-size=n            Set maximum heap size in bytes, default is 16 KB\n");
#if WASM_ENABLE_FAST_JIT != 0
    printf("  --jit-codecache-size=n   Set fast jit maximum code cache size in bytes,\n");
    printf("                           default is %u KB\n", FAST_JIT_DEFAULT_CODE_CACHE_SIZE / 1024);
#endif
#if WASM_ENABLE_JIT != 0
    printf("  --llvm-jit-size-level=n  Set LLVM JIT size level, default is 3\n");
    printf("  --llvm-jit-opt-level=n   Set LLVM JIT optimization level, default is 3\n");
#endif
    printf("  --repl                   Start a very simple REPL (read-eval-print-loop) mode\n"
        "                           that runs commands in the form of \"FUNC ARG...\"\n");
#if WASM_ENABLE_LIBC_WASI != 0
    printf("  --env=<env>              Pass wasi environment variables with \"key=value\"\n");
    printf("                           to the program, for example:\n");
    printf("                             --env=\"key1=value1\" --env=\"key2=value2\"\n");
    printf("  --dir=<dir>              Grant wasi access to the given host directories\n");
    printf("                           to the program, for example:\n");
    printf("                             --dir=<dir1> --dir=<dir2>\n");
    printf("  --addr-pool=<addrs>      Grant wasi access to the given network addresses in\n");
    printf("                           CIRD notation to the program, seperated with ',',\n");
    printf("                           for example:\n");
    printf("                             --addr-pool=1.2.3.4/15,2.3.4.5/16\n");
    printf("  --allow-resolve=<domain> Allow the lookup of the specific domain name or domain\n");
    printf("                           name suffixes using a wildcard, for example:\n");
    printf("                           --allow-resolve=example.com # allow the lookup of the specific domain\n");
    printf("                           --allow-resolve=*.example.com # allow the lookup of all subdomains\n");
    printf("                           --allow-resolve=* # allow any lookup\n");
#endif
#if BH_HAS_DLFCN
    printf("  --native-lib=<lib>       Register native libraries to the WASM module, which\n");
    printf("                           are shared object (.so) files, for example:\n");
    printf("                             --native-lib=test1.so --native-lib=test2.so\n");
#endif
#if WASM_ENABLE_MULTI_MODULE != 0
    printf("  --module-path=<path>     Indicate a module search path. default is current\n"
        "                           directory('./')\n");
#endif
#if WASM_ENABLE_LIB_PTHREAD != 0 || WASM_ENABLE_LIB_WASI_THREADS != 0
    printf("  --max-threads=n          Set maximum thread number per cluster, default is 4\n");
#endif
#if WASM_ENABLE_DEBUG_INTERP != 0
    printf("  -g=ip:port               Set the debug sever address, default is debug disabled\n");
    printf("                             if port is 0, then a random port will be used\n");
#endif
    printf("  --version                Show version information\n");
    return 1;
}
/* clang-format on */

static const void*
app_instance_main(CWamrProxy &proxy, wasm_module_inst_t module_inst)
{
    const char* exception;

    proxy.wasm_application_execute_main(module_inst, app_argc, app_argv);
    if ((exception = proxy.wasm_runtime_get_exception(module_inst)))
        printf("%s\n", exception);
    return exception;
}

static const void*
app_instance_func(CWamrProxy &proxy, wasm_module_inst_t module_inst, const char* func_name)
{
    proxy.wasm_application_execute_func(module_inst, func_name, app_argc - 1,
        app_argv + 1);
    /* The result of wasm function or exception info was output inside
       wasm_application_execute_func(), here we don't output them again. */
    return proxy.wasm_runtime_get_exception(module_inst);
}

/**
 * Split a space separated strings into an array of strings
 * Returns NULL on failure
 * Memory must be freed by caller
 * Based on: http://stackoverflow.com/a/11198630/471795
 */
static char**
split_string(char* str, int* count)
{
    char** res = NULL, ** res1;
    char* p;
    int idx = 0;

    /* split string and append tokens to 'res' */
    do {
        p = strtok(str, " ");
        str = NULL;
        res1 = res;
        res = (char**)realloc(res1, sizeof(char*) * (uint32)(idx + 1));
        if (res == NULL) {
            free(res1);
            return NULL;
        }
        res[idx++] = p;
    } while (p);

    /**
     * Due to the function name,
     * res[0] might contain a '\' to indicate a space
     * func\name -> func name
     */
    p = strchr(res[0], '\\');
    while (p) {
        *p = ' ';
        p = strchr(p, '\\');
    }

    if (count) {
        *count = idx - 1;
    }
    return res;
}

static void*
app_instance_repl(CWamrProxy &proxy, wasm_module_inst_t module_inst)
{
    char* cmd = NULL;
    size_t len = 0;
    ssize_t n;

    while ((printf("webassembly> "), fflush(stdout),
        n = getline(&cmd, &len, stdin))
        != -1) {
        
        if (n <= 0)
        {
            L_(ALWAYS) << "No input provided - abort program";
            abort();
        }
        if (cmd[n - 1] == '\n') {
            if (n == 1)
                continue;
            else
                cmd[n - 1] = '\0';
        }
        if (!strcmp(cmd, "__exit__")) {
            printf("exit repl mode\n");
            break;
        }
        app_argv = split_string(cmd, &app_argc);
        if (app_argv == NULL) {
            L_(ERROR) << "Wasm prepare param failed: split string failed.";
            break;
        }
        if (app_argc != 0) {
            proxy.wasm_application_execute_func(module_inst, app_argv[0],
                app_argc - 1, app_argv + 1);
        }
        free(app_argv);
    }
    free(cmd);
    return NULL;
}

#if WASM_ENABLE_LIBC_WASI != 0
static bool
validate_env_str(char* env)
{
    char* p = env;
    int key_len = 0;

    while (*p != '\0' && *p != '=') {
        key_len++;
        p++;
    }

    if (*p != '=' || key_len == 0)
        return false;

    return true;
}
#endif

void print_wamr_version(CWamrProxy& proxy)
{
    uint32 major, minor, patch;
    proxy.wasm_runtime_get_version(&major, &minor, &patch);
    printf("iwasm %" PRIu32 ".%" PRIu32 ".%" PRIu32 "\n", major, minor,
        patch);
}

#if BH_HAS_DLFCN
typedef uint32(*get_native_lib_func)(char** p_module_name,
    NativeSymbol** p_native_symbols);

static uint32
load_and_register_native_libs(CWamrProxy &proxy, const char** native_lib_list,
    uint32 native_lib_count,
    void** native_handle_list)
{
    uint32 i, native_handle_count = 0, n_native_symbols;
    NativeSymbol* native_symbols;
    char* module_name;
    void* handle;

    for (i = 0; i < native_lib_count; i++) {
        /* open the native library */
        if (!(handle = dlopen(native_lib_list[i], RTLD_NOW | RTLD_GLOBAL))
            && !(handle = dlopen(native_lib_list[i], RTLD_LAZY))) {
            L_(ERROR) << "Failed: Error " << dlerror();
            L_(WARNING) << "warning: failed to load native library " <<
                native_lib_list[i];
            continue;
        }

        /* lookup get_native_lib func */
        get_native_lib_func get_native_lib = (get_native_lib_func)dlsym(handle, "get_native_lib");
        if (!get_native_lib) {
            L_(WARNING) << "warning: failed to lookup `get_native_lib` function "
                "from native lib " << 
                native_lib_list[i];
            dlclose(handle);
            continue;
        }

        n_native_symbols = get_native_lib(&module_name, &native_symbols);

        /* register native symbols */
        if (!(n_native_symbols > 0 && module_name && native_symbols
            && proxy.wasm_runtime_register_natives(module_name, native_symbols,
                n_native_symbols))) {
            L_(WARNING) << "warning: failed to register native lib " <<
                native_lib_list[i];
            dlclose(handle);
            continue;
        }

        native_handle_list[native_handle_count++] = handle;
    }

    return native_handle_count;
}

static void
unregister_and_unload_native_libs(CWamrProxy &proxy, uint32 native_lib_count,
    void** native_handle_list)
{
    uint32 i, n_native_symbols;
    NativeSymbol* native_symbols;
    char* module_name;
    void* handle;

    for (i = 0; i < native_lib_count; i++) {
        handle = native_handle_list[i];

        /* lookup get_native_lib func */
        get_native_lib_func get_native_lib = (get_native_lib_func)dlsym(handle, "get_native_lib");
        if (!get_native_lib) {
            L_(WARNING) << "warning: failed to lookup `get_native_lib` function "
                "from native lib " << handle;
            continue;
        }

        n_native_symbols = get_native_lib(&module_name, &native_symbols);
        if (n_native_symbols == 0 || module_name == NULL
            || native_symbols == NULL) {
            L_(WARNING) << "warning: get_native_lib returned different values for "
                "native lib " << handle;
            continue;
        }

        /* unregister native symbols */
        if (!proxy.wasm_runtime_unregister_natives(module_name, native_symbols)) {
            L_(WARNING) << "warning: failed to unregister native lib " << handle;
            continue;
        }

        dlclose(handle);
    }
}
#endif /* BH_HAS_DLFCN */

#if WASM_ENABLE_MULTI_MODULE != 0
static char*
handle_module_path(const char* module_path)
{
    /* next character after = */
    return (strchr(module_path, '=')) + 1;
}

static char* module_search_path = ".";

static bool
module_reader_callback(const char* module_name, uint8** p_buffer,
    uint32* p_size)
{
    const char* format = "%s/%s.wasm";
    int sz = strlen(module_search_path) + strlen("/") + strlen(module_name)
        + strlen(".wasm") + 1;
    char* wasm_file_name = BH_MALLOC(sz);
    if (!wasm_file_name) {
        return false;
    }

    snprintf(wasm_file_name, sz, format, module_search_path, module_name);

    *p_buffer = (uint8_t*)bh_read_file_to_buffer(wasm_file_name, p_size);

    wasm_runtime_free(wasm_file_name);
    return *p_buffer != NULL;
}

static void
moudle_destroyer(uint8* buffer, uint32 size)
{
    if (!buffer) {
        return;
    }

    wasm_runtime_free(buffer);
    buffer = NULL;
}
#endif /* WASM_ENABLE_MULTI_MODULE */

#if WASM_ENABLE_GLOBAL_HEAP_POOL != 0
static char global_heap_buf[WASM_GLOBAL_HEAP_SIZE] = { 0 };
#endif


int
main(int argc, char* argv[])
{
    int32 ret = -1;
    char* wasm_file = NULL;
    const char* func_name = NULL;
    uint8* wasm_file_buf = NULL;
    uint32 wasm_file_size;
    uint32 stack_size = 64 * 1024, heap_size = 16 * 1024;
#if WASM_ENABLE_FAST_JIT != 0
    uint32 jit_code_cache_size = FAST_JIT_DEFAULT_CODE_CACHE_SIZE;
#endif
#if WASM_ENABLE_JIT != 0
    uint32 llvm_jit_size_level = 3;
    uint32 llvm_jit_opt_level = 3;
#endif
    wasm_module_t wasm_module = NULL;
    wasm_module_inst_t wasm_module_inst = NULL;
    RunningMode running_mode = Mode_Interp;
    RuntimeInitArgs init_args;
    char error_buf[128] = { 0 };
#if WASM_ENABLE_LOG != 0
    int log_verbose_level = 2;
#endif
    bool is_repl_mode = false;
    bool is_xip_file = false;
#if WASM_ENABLE_LIBC_WASI != 0
    const char* dir_list[8] = { NULL };
    uint32 dir_list_size = 0;
    const char* env_list[8] = { NULL };
    uint32 env_list_size = 0;
    const char* addr_pool[8] = { NULL };
    uint32 addr_pool_size = 0;
    const char* ns_lookup_pool[8] = { NULL };
    uint32 ns_lookup_pool_size = 0;
#endif
#if BH_HAS_DLFCN
    const char* native_lib_list[8] = { NULL };
    uint32 native_lib_count = 0;
    void* native_handle_list[8] = { NULL };
    uint32 native_handle_count = 0;
#endif
#if WASM_ENABLE_DEBUG_INTERP != 0
    char* ip_addr = NULL;
    int instance_port = 0;
#endif

    /* Capability manager addition */
    std::string wamr_lib{"./libiwasm.so"};
    bool display_version_and_quit{ false };
    bool dump_relocation_tables{ false };
    std::vector<char> wasm_file_buffer_store;

    L_(DEBUG) << "WAMR Launched!";

    /* Process options. */
    for (argc--, argv++; argc > 0 && argv[0][0] == '-'; argc--, argv++) {
        
        /* Capability Manager Addition */
        if (!strncmp(argv[0], "--wamr-lib=", 11)) {
            if (argv[0][11] == '\0')
                return print_help();
            wamr_lib = argv[0] + 11;
        }
        else if (!strcmp(argv[0], "-f") || !strcmp(argv[0], "--function")) {
            argc--, argv++;
            if (argc < 2) {
                return print_help();
            }
            func_name = argv[0];
        }
#if WASM_ENABLE_INTERP != 0
        else if (!strcmp(argv[0], "--interp")) {
            running_mode = Mode_Interp;
        }
#endif
#if WASM_ENABLE_FAST_JIT != 0
        else if (!strcmp(argv[0], "--fast-jit")) {
            running_mode = Mode_Fast_JIT;
        }
#endif
#if WASM_ENABLE_JIT != 0
        else if (!strcmp(argv[0], "--llvm-jit")) {
            running_mode = Mode_LLVM_JIT;
        }
#endif
#if WASM_ENABLE_JIT != 0 && WASM_ENABLE_FAST_JIT != 0 \
    && WASM_ENABLE_LAZY_JIT != 0
        else if (!strcmp(argv[0], "--multi-tier-jit")) {
            running_mode = Mode_Multi_Tier_JIT;
        }
#endif
#if WASM_ENABLE_LOG != 0
        else if (!strncmp(argv[0], "-v=", 3)) {
            log_verbose_level = atoi(argv[0] + 3);

            if (log_verbose_level == 6)
            {
                log_verbose_level--;
                dump_relocation_tables = true;
            }
            if (log_verbose_level < 0 || log_verbose_level > 5)
                return print_help();
        }
#endif
        else if (!strcmp(argv[0], "--repl")) {
            is_repl_mode = true;
        }
        else if (!strncmp(argv[0], "--stack-size=", 13)) {
            if (argv[0][13] == '\0')
                return print_help();
            stack_size = atoi(argv[0] + 13);
        }
        else if (!strncmp(argv[0], "--heap-size=", 12)) {
            if (argv[0][12] == '\0')
                return print_help();
            heap_size = atoi(argv[0] + 12);
        }
#if WASM_ENABLE_FAST_JIT != 0
        else if (!strncmp(argv[0], "--jit-codecache-size=", 21)) {
            if (argv[0][21] == '\0')
                return print_help();
            jit_code_cache_size = atoi(argv[0] + 21);
        }
#endif
#if WASM_ENABLE_JIT != 0
        else if (!strncmp(argv[0], "--llvm-jit-size-level=", 22)) {
            if (argv[0][22] == '\0')
                return print_help();
            llvm_jit_size_level = atoi(argv[0] + 22);
            if (llvm_jit_size_level < 1) {
                printf("LLVM JIT size level shouldn't be smaller than 1, "
                    "setting it to 1\n");
                llvm_jit_size_level = 1;
            }
            else if (llvm_jit_size_level > 3) {
                printf("LLVM JIT size level shouldn't be greater than 3, "
                    "setting it to 3\n");
                llvm_jit_size_level = 3;
            }
        }
        else if (!strncmp(argv[0], "--llvm-jit-opt-level=", 21)) {
            if (argv[0][21] == '\0')
                return print_help();
            llvm_jit_opt_level = atoi(argv[0] + 21);
            if (llvm_jit_opt_level < 1) {
                printf("LLVM JIT opt level shouldn't be smaller than 1, "
                    "setting it to 1\n");
                llvm_jit_opt_level = 1;
            }
            else if (llvm_jit_opt_level > 3) {
                printf("LLVM JIT opt level shouldn't be greater than 3, "
                    "setting it to 3\n");
                llvm_jit_opt_level = 3;
            }
        }
#endif
#if WASM_ENABLE_LIBC_WASI != 0
        else if (!strncmp(argv[0], "--dir=", 6)) {
            if (argv[0][6] == '\0')
                return print_help();
            if (dir_list_size >= sizeof(dir_list) / sizeof(char*)) {
                printf("Only allow max dir number %d\n",
                    (int)(sizeof(dir_list) / sizeof(char*)));
                return 1;
            }
            dir_list[dir_list_size++] = argv[0] + 6;
        }
        else if (!strncmp(argv[0], "--env=", 6)) {
            char* tmp_env;

            if (argv[0][6] == '\0')
                return print_help();
            if (env_list_size >= sizeof(env_list) / sizeof(char*)) {
                printf("Only allow max env number %d\n",
                    (int)(sizeof(env_list) / sizeof(char*)));
                return 1;
            }
            tmp_env = argv[0] + 6;
            if (validate_env_str(tmp_env))
                env_list[env_list_size++] = tmp_env;
            else {
                printf("Wasm parse env string failed: expect \"key=value\", "
                    "got \"%s\"\n",
                    tmp_env);
                return print_help();
            }
        }
        /* TODO: parse the configuration file via --addr-pool-file */
        else if (!strncmp(argv[0], "--addr-pool=", strlen("--addr-pool="))) {
            /* like: --addr-pool=100.200.244.255/30 */
            char* token = NULL;

            if ('\0' == argv[0][12])
                return print_help();

            token = strtok(argv[0] + strlen("--addr-pool="), ",");
            while (token) {
                if (addr_pool_size >= sizeof(addr_pool) / sizeof(char*)) {
                    printf("Only allow max address number %d\n",
                        (int)(sizeof(addr_pool) / sizeof(char*)));
                    return 1;
                }

                addr_pool[addr_pool_size++] = token;
                token = strtok(NULL, ";");
            }
        }
        else if (!strncmp(argv[0], "--allow-resolve=", 16)) {
            if (argv[0][16] == '\0')
                return print_help();
            if (ns_lookup_pool_size
                >= sizeof(ns_lookup_pool) / sizeof(ns_lookup_pool[0])) {
                printf(
                    "Only allow max ns lookup number %d\n",
                    (int)(sizeof(ns_lookup_pool) / sizeof(ns_lookup_pool[0])));
                return 1;
            }
            ns_lookup_pool[ns_lookup_pool_size++] = argv[0] + 16;
        }
#endif /* WASM_ENABLE_LIBC_WASI */
#if BH_HAS_DLFCN
        else if (!strncmp(argv[0], "--native-lib=", 13)) {
            if (argv[0][13] == '\0')
                return print_help();
            if (native_lib_count >= sizeof(native_lib_list) / sizeof(char*)) {
                printf("Only allow max native lib number %d\n",
                    (int)(sizeof(native_lib_list) / sizeof(char*)));
                return 1;
            }
            native_lib_list[native_lib_count++] = argv[0] + 13;
        }
#endif
#if WASM_ENABLE_MULTI_MODULE != 0
        else if (!strncmp(argv[0],
            "--module-path=", strlen("--module-path="))) {
            module_search_path = handle_module_path(argv[0]);
            if (!strlen(module_search_path)) {
                return print_help();
            }
        }
#endif
#if WASM_ENABLE_LIB_PTHREAD != 0 || WASM_ENABLE_LIB_WASI_THREADS != 0
        else if (!strncmp(argv[0], "--max-threads=", 14)) {
            if (argv[0][14] == '\0')
                return print_help();
            wasm_runtime_set_max_thread_num(atoi(argv[0] + 14));
        }
#endif
#if WASM_ENABLE_DEBUG_INTERP != 0
        else if (!strncmp(argv[0], "-g=", 3)) {
            char* port_str = strchr(argv[0] + 3, ':');
            char* port_end;
            if (port_str == NULL)
                return print_help();
            *port_str = '\0';
            instance_port = strtoul(port_str + 1, &port_end, 10);
            if (port_str[1] == '\0' || *port_end != '\0')
                return print_help();
            ip_addr = argv[0] + 3;
        }
#endif
        else if (!strncmp(argv[0], "--version", 9)) {
            display_version_and_quit = true;
        }
        else
            return print_help();
    }

    if (argc == 0 && !display_version_and_quit)
        return print_help();

    wasm_file = argv[0];
    app_argc = argc;
    app_argv = argv;

    // Set cap mgr logger level
    set_capmgr_log_level(log_verbose_level);

    std::memset(&init_args, 0, sizeof(RuntimeInitArgs));

    /* Capability Manager Support: Load libiwasm and resolve symbol relocations
     * Then create proxy object for WAMR calls
     */
    CCompartmentLibs* plibs = nullptr;
    if (!lib_load_and_fix(wamr_lib, plibs, dump_relocation_tables))
    {
        printf("WAMR Libary %s is not valid or could not be found\n", wamr_lib.c_str());
        return -1;
    }

    // Create the proxy - note the compartment sizes are defined in CCompartment.h
    CWamrProxy proxy(plibs, CCompartment::CompartmentId::kCallFuncCompartment, CALL_FUNC_STACK_SIZE, CALL_FUNC_SEAL_ID);

    // Check for do version and exit
    if (display_version_and_quit)
    {
        print_wamr_version(proxy);
        lib_restore_and_end(plibs); // Ignore any error which might happen here
        return 0;
    }

    init_args.running_mode = running_mode;
#if WASM_ENABLE_GLOBAL_HEAP_POOL != 0
#error "Linux CHERI platforms cannot support allocation with pool"
#endif

    // On CHERI, with CHERI Memory Manager, using the system allocator will call CHERI versions
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.mem_alloc_option.allocator.malloc_func = NULL;
    init_args.mem_alloc_option.allocator.realloc_func = NULL;
    init_args.mem_alloc_option.allocator.free_func = NULL;

#if WASM_ENABLE_FAST_JIT != 0
    init_args.fast_jit_code_cache_size = jit_code_cache_size;
#endif

#if WASM_ENABLE_JIT != 0
    init_args.llvm_jit_size_level = llvm_jit_size_level;
    init_args.llvm_jit_opt_level = llvm_jit_opt_level;
#endif

#if WASM_ENABLE_DEBUG_INTERP != 0
    init_args.instance_port = instance_port;
    if (ip_addr)
        strcpy(init_args.ip_addr, ip_addr);
#endif

    /* initialize runtime environment */
    if (!proxy.wasm_runtime_full_init(&init_args)) {
        printf("Init runtime environment failed.\n");
        return -1;
    }

#if WASM_ENABLE_LOG != 0
    proxy.bh_log_set_verbose_level(log_verbose_level);
#endif

#if BH_HAS_DLFCN
    native_handle_count = load_and_register_native_libs(proxy,
        native_lib_list, native_lib_count, native_handle_list);
#endif

    /* load WASM byte buffer from WASM bin file */
    if (!(wasm_file_buf =
        (uint8*)load_file_to_buffer(wasm_file, &wasm_file_size, wasm_file_buffer_store)))
        goto fail1;

#if WASM_ENABLE_AOT != 0
    if (proxy.wasm_runtime_is_xip_file(wasm_file_buf, wasm_file_size)) {
        uint8* wasm_file_mapped;

        if (!(wasm_file_mapped =
            (uint8*)do_aot_mmap((uint32)wasm_file_size))) {
            printf("mmap memory failed\n");
            goto fail1;
        }

        do_aot_memcpy_s(wasm_file_mapped, wasm_file_size, wasm_file_buf,
            wasm_file_size);
        wasm_file_buf = wasm_file_mapped;
        is_xip_file = true;
    }
#endif

#if WASM_ENABLE_MULTI_MODULE != 0
    wasm_runtime_set_module_reader(module_reader_callback, moudle_destroyer);
#endif

    /* load WASM module */
    if (!(wasm_module = proxy.wasm_runtime_load(wasm_file_buf, wasm_file_size,
        error_buf, sizeof(error_buf)))) {
        printf("%s\n", error_buf);
        goto fail2;
    }

#if WASM_ENABLE_LIBC_WASI != 0
    proxy.wasm_runtime_set_wasi_args(wasm_module, dir_list, dir_list_size, nullptr, 0,
        env_list, env_list_size, argv, argc);

    proxy.wasm_runtime_set_wasi_addr_pool(wasm_module, addr_pool, addr_pool_size);
    proxy.wasm_runtime_set_wasi_ns_lookup_pool(wasm_module, ns_lookup_pool,
        ns_lookup_pool_size);
#endif

    /* instantiate the module */
    if (!(wasm_module_inst =
        proxy.wasm_runtime_instantiate(wasm_module, stack_size, heap_size,
            error_buf, sizeof(error_buf)))) {
        printf("%s\n", error_buf);
        goto fail3;
    }

#if WASM_ENABLE_DEBUG_INTERP != 0
    if (ip_addr != NULL) {
        wasm_exec_env_t exec_env =
            wasm_runtime_get_exec_env_singleton(wasm_module_inst);
        uint32_t debug_port;
        if (exec_env == NULL) {
            printf("%s\n", wasm_runtime_get_exception(wasm_module_inst));
            goto fail4;
        }
        debug_port = wasm_runtime_start_debug_instance(exec_env);
        if (debug_port == 0) {
            printf("Failed to start debug instance\n");
            goto fail4;
        }
    }
#endif

    ret = 0;
    if (is_repl_mode) {
        app_instance_repl(proxy, wasm_module_inst);
    }
    else if (func_name) {
        if (app_instance_func(proxy, wasm_module_inst, func_name)) {
            /* got an exception */
            ret = 1;
        }
    }
    else {
        if (app_instance_main(proxy, wasm_module_inst)) {
            /* got an exception */
            ret = 1;
        }
    }

#if WASM_ENABLE_LIBC_WASI != 0
    if (ret == 0) {
        /* propagate wasi exit code. */
        ret = proxy.wasm_runtime_get_wasi_exit_code(wasm_module_inst);
    }
#endif

#if WASM_ENABLE_DEBUG_INTERP != 0
    fail4:
#endif
    /* destroy the module instance */
    proxy.wasm_runtime_deinstantiate(wasm_module_inst);

fail3:
    /* unload the module */
    proxy.wasm_runtime_unload(wasm_module);

fail2:
    /* free the file buffer */
    if (is_xip_file)
    {
        do_aot_unmap(wasm_file_buf, wasm_file_size);
    }

fail1:
#if BH_HAS_DLFCN
    /* unload the native libraries */
    unregister_and_unload_native_libs(proxy, native_handle_count, native_handle_list);
#endif

    /* destroy runtime environment */
    proxy.wasm_runtime_destroy();

    /* Capability manager support - cleanup the relocation symbols*/
    if (!lib_restore_and_end(plibs))
    {
        printf("Error unloading WAMR library %s\n", wamr_lib.c_str());
        ret = -1;
    }

    L_(DEBUG) << "WAMR Exits with return code: " << ret << "!";
    return ret;
}

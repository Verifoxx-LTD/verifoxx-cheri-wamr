#include "cheri_wasm_native_test.h"
#include <iostream>
#include <sstream>
#include <string>
#include <array>
#include <cstring>
#include <stdio.h>
#include <signal.h>
#ifdef __CHERI__
#include <cheriintrin.h>
#include <sys/auxv.h>
#endif

#include "wasm_export.h"

// Add handler for a capability

#if ENABLE_CHERI_PURECAP
constexpr uint32_t ELEM_SIZE = 2 * sizeof(void*) / sizeof(int);
#else
constexpr uint32_t ELEM_SIZE = sizeof(void*) / sizeof(uint32_t);
#endif

static const std::array<uint32_t, 10> test_vals = { 0xdead, 0xbeef, 0xfaff, 0xbabe, 0xcafe, 0xfeed, 0xdeaf, 0xface, 0xfabb, 0xbead };

constexpr uint32_t TEST_ARR_SIZE = 25;  // Arbitrary value

static uint32_t get_test_val()
{
    static uint32_t i = 0;

    return test_vals.at(i++ % test_vals.size());
}

static bool check_test_val(uint32_t value)
{
    static uint32_t i = 0;
    return test_vals.at(i++ % test_vals.size()) == value;
}


static NativeSymbol native_symbols[] = {
    EXPORT_WASM_API_WITH_SIG(do_sum, "(iii)i"),
    EXPORT_WASM_API_WITH_SIG(print_something, "($)I"),
    EXPORT_WASM_API_WITH_SIG(do_sum_ex, "(iii)i"),
    EXPORT_WASM_API_WITH_SIG(print_something_ex, "($)I"),
    EXPORT_WASM_API_WITH_SIG(do_sum_many_args, "(iiiiiiiiiiii$i)i"),

    // Externref support
    EXPORT_WASM_API_WITH_SIG(get_externref, "()r"),
    EXPORT_WASM_API_WITH_SIG(put_externref, "(r)i"),
};

static char errbuf[128];


extern "C" uint32_t do_sum(wasm_exec_env_t exec_env, uint32_t a, uint32_t b, uint32_t c)
{
    (exec_env); // Unused
    std::cout << "    native do_sum()++: args=" << a << "," << b << "," << c << std::endl;
    uint32_t result = a + b + c;

    std::cout << "    native do_sum()--: return=" << result << std::endl;

    return result;
}

bool create_local_runtime(wasm_module_inst_t * p_module_inst, wasm_exec_env_t * p_exec_env, wasm_module_inst_t curr_module_inst)
{
    // @ToDo : Error checks

    RuntimeInitArgs init_args;

    std::memset(&init_args, 0, sizeof(RuntimeInitArgs));

    /* configure the memory allocator for the runtime */
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.mem_alloc_option.allocator.malloc_func = NULL;
    init_args.mem_alloc_option.allocator.realloc_func = NULL;
    init_args.mem_alloc_option.allocator.free_func = NULL;

    std::cout << "    native doing full init" << std::endl;

    /* initialize runtime environment with user configurations*/
    wasm_runtime_full_init(&init_args);

    std::cout << "    native create new module instance" << std::endl;

    /* Create module instance */
    *p_module_inst = wasm_runtime_instantiate(wasm_runtime_get_module(curr_module_inst),
        WASM_STACK_SIZE, WASM_HEAP_SIZE, NULL, 0);
    
    std::cout << "    native creating execution environment" << std::endl;
    *p_exec_env = wasm_runtime_create_exec_env(*p_module_inst, WASM_STACK_SIZE);

    return true;
}

bool destroy_local_runtime(wasm_module_inst_t module_inst, wasm_exec_env_t exec_env)
{
    wasm_runtime_destroy_exec_env(exec_env);
    wasm_runtime_deinstantiate(module_inst);
    wasm_runtime_destroy();
    return true;
}

extern "C" uint32_t do_sum_ex(wasm_exec_env_t exec_env, uint32_t a, uint32_t b, uint32_t c)
{
    (exec_env); // Unused
    std::cout << "    native do_sum()++: args=" << a << "," << b << "," << c << std::endl;
    uint32_t result = a + b + c;

    std::cout << "    native call back into wasm to do subtract_in_wasm()" << std::endl;

    std::array<uint32_t, 2> args{ a, b };   // Note: Result passed back occupies two*32bits

    auto module_inst = get_module_inst(exec_env);

    wasm_module_inst_t new_module_inst;
    wasm_exec_env_t new_exec_env;

    if (!create_local_runtime(&new_module_inst, &new_exec_env, module_inst))
    {
        std::cout << "    native FAILED created local runtime" << std::endl;
        return 0;
    }

    auto func = wasm_runtime_lookup_function(new_module_inst, "subtract_in_wasm", NULL);

    std::cout << "    native got WASM func" << std::endl;
    if (NULL != func && wasm_runtime_call_wasm(new_exec_env, func, args.size(), args.data()))
    {
        auto result_64bit = *(reinterpret_cast<int64_t*>(&args[0]));
        std::cout << "    native successfully called WASM subtract_in_wasm(): result=" << result_64bit << std::endl;
    }
    else
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
    }


    destroy_local_runtime(new_module_inst, new_exec_env);

    std::cout << "    native do_sum()--: return=" << result << std::endl;

    return result;
}

extern "C" uint64_t print_something(wasm_exec_env_t exec_env, char* buffer)
{
    (exec_env); // Unused
    std::string str{ buffer };
    std::cout << "    native print_something()++: string=\"" << str << "\"" << std::endl;
    uint64_t result = str.length();

    std::cout << "    native print_something()--: return=" << result << std::endl;
    return result;
}

extern "C" uint64_t print_something_ex(wasm_exec_env_t exec_env, char* buffer)
{
    (exec_env); // Unused
    std::string str{ buffer };
    std::cout << "    native print_something()++: string=\"" << str << "\"" << std::endl;
    uint64_t result = str.length();

    std::cout << "    native call back into wasm to do print_in_wasm()" << std::endl;

    str.insert(0, "Native pass string->");

    auto module_inst = get_module_inst(exec_env);

    wasm_module_inst_t new_module_inst;
    wasm_exec_env_t new_exec_env;

    if (!create_local_runtime(&new_module_inst, &new_exec_env, module_inst))
    {
        std::cout << "    native FAILED created local runtime" << std::endl;
        return 0;
    }

    auto buffer_idx = wasm_runtime_module_dup_data(new_module_inst, str.data(), str.length());
    auto func = wasm_runtime_lookup_function(new_module_inst, "print_in_wasm", NULL);

    std::array<uint32_t, 1> args{ buffer_idx };

    if (buffer_idx && NULL != func && wasm_runtime_call_wasm(new_exec_env, func, args.size(), args.data()))
    {
        std::cout << "    native successfully called WASM print_in_wasm(): result (length of buffer printed)=" << args[0] << std::endl;
    }
    else
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
    }

    if (buffer_idx)
    {
        wasm_runtime_module_free(new_module_inst, buffer_idx);
    }

    destroy_local_runtime(new_module_inst, new_exec_env);

    std::cout << "    native print_something()--: return=" << result << std::endl;
    return result;
}

extern "C" uint32_t do_sum_many_args(wasm_exec_env_t exec_env,
    uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4,
    uint32_t a5, uint32_t a6, uint32_t a7, uint32_t a8,
    uint32_t a9, uint32_t a10, uint32_t a11, uint32_t a12,
    char* str13, uint32_t a14)
{
    (exec_env); // Unused
    uint32_t sumval = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a14;
    std::cout << "Message: " << str13 << std::endl;
    return sumval;
}

// Extern ref support

#if ENABLE_CHERI_PURECAP
uint8_t* get_sealer()
{
    static uint8_t* sealer = (uint8_t*)getauxptr(AT_CHERI_SEAL_CAP) + 0x1234;

    return sealer;
}
#endif

extern "C" uintptr_t get_externref(wasm_exec_env_t exec_env)
{
    std::cout << "   **** native get_externref() called" << std::endl;

    // Alloc some memory and pass value to it
    // This should not be on the sandbox heap as we won't use it in WASM
    uint32_t* p = new uint32_t[TEST_ARR_SIZE];

    for (uint32_t i = 0; i < TEST_ARR_SIZE; ++i)
    {
        p[i] = get_test_val();
    }

#if ENABLE_CHERI_PURECAP
    std::cout << "    native SEALING CAPABILITY" << std::endl;
    p = (uint32_t*)cheri_seal(p, get_sealer());
    std::cout << "       --> Capability SEALED? " << cheri_is_sealed(p) << std::endl;
    std::cout << "       --> Capability Tag: " << cheri_tag_get(p) << std::endl;
#endif
    return reinterpret_cast<uintptr_t>(p);
}

extern "C" int32_t put_externref(wasm_exec_env_t exec_env, uintptr_t extref)
{
    std::cout << "   **** native put_externref() called" << std::endl;
    uint32_t* p = reinterpret_cast<uint32_t*>(extref);

#if ENABLE_CHERI_PURECAP
    std::cout << "       --> Capability SEALED? " << cheri_is_sealed(p) << std::endl;
    std::cout << "       --> Capability Tag: " << cheri_tag_get(p) << std::endl;

    p = (uint32_t*)cheri_unseal(p, get_sealer());
    auto array = reinterpret_cast<uint32_t*>(cheri_unseal(p, get_sealer()));

    std::cout << "    native UNSEALING CAPABILITY" << std::endl;

    if (!cheri_tag_get(p))
    {
        std::cout << "    native FAILED put value - capability tag should be set" << std::endl;
        return -1;
    }
#endif
    bool result{ true };
    for (uint32_t i = 0; i < TEST_ARR_SIZE && result; ++i)
    {
        result = check_test_val(p[i]);
        if (!result)
        {
            std::cout << "    native put_externref(): value check FAILED 0x" << std::hex << p[i] << " not expected" << std::endl;
        }
    }

    delete[] p;
    return (result) ? 0 : -1;
}


static NativeSymbol * native_symbols_table()
{
    return native_symbols;
}

static uint32_t num_native_symbols()
{
    return sizeof(native_symbols) / sizeof(NativeSymbol);
}


// get_native_lib called from iwasm
extern "C" uint32_t get_native_lib(char** p_module_name, NativeSymbol **p_native_symbols)
{
    *p_module_name = (char*)"env";
    *p_native_symbols = native_symbols_table();
    return num_native_symbols();
}

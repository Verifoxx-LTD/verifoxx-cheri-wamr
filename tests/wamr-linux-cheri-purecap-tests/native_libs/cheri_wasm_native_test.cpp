#include "cheri_wasm_native_test.h"
#include <iostream>
#include <string>
#include <array>
#include <cstring>
#include "wasm_export.h"

constexpr uint32_t WASM_STACK_SIZE = 4096;
constexpr uint32_t WASM_HEAP_SIZE = 256;  // Small heap

static NativeSymbol native_symbols[] = {
    EXPORT_WASM_API_WITH_SIG(do_sum, "(iii)i"),
    EXPORT_WASM_API_WITH_SIG(print_something, "($)I"),
    EXPORT_WASM_API_WITH_SIG(do_sum_ex, "(iii)i"),
    EXPORT_WASM_API_WITH_SIG(print_something_ex, "($)I"),
    EXPORT_WASM_API_WITH_SIG(do_sum_many_args, "(iiiiiiiiiiii$i)i")
};


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

    /* initialize runtime environment with user configurations*/
    wasm_runtime_full_init(&init_args);

    /* Create module instance */
    *p_module_inst = wasm_runtime_instantiate(wasm_runtime_get_module(curr_module_inst),
        WASM_STACK_SIZE, WASM_HEAP_SIZE, NULL, 0);
    
    *p_exec_env = wasm_runtime_create_exec_env(*p_module_inst, WASM_STACK_SIZE);

    return true;
}

bool destroy_local_runtime(wasm_module_inst_t module_inst, wasm_exec_env_t exec_env)
{
    // @ToDo Error checks!
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


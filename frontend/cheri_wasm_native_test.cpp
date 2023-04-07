#include "cheri_wasm_native_test.h"
#include <iostream>
#include <string>

static NativeSymbol native_symbols[] = {
    EXPORT_WASM_API_WITH_SIG(do_sum, "(iii)i"),
    EXPORT_WASM_API_WITH_SIG(print_something, "($)I"),
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

extern "C" uint64_t print_something(wasm_exec_env_t exec_env, char* buffer)
{
    (exec_env); // Unused
    std::string str{ buffer };
    std::cout << "    native print_something()++: string=\"" << str << "\"" << std::endl;
    uint64_t result = str.length();
    std::cout << str << std::endl;
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

extern "C" NativeSymbol * native_symbols_table()
{
    return native_symbols;
}

extern "C" uint32_t num_native_symbols()
{
    return sizeof(native_symbols) / sizeof(NativeSymbol);
}

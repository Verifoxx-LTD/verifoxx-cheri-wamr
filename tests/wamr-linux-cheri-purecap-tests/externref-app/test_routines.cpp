#include "test_routines.h"
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

static std::string print_extref(uintptr_t p)
{
    std::stringstream strstr;
    char arr[120];

#ifdef ENABLE_CHERI_PURECAP
    snprintf(arr, sizeof(arr), "%#p", (void*)p);
#else
    snprintf(arr, sizeof(arr), "%p", (void*)p);
#endif
    strstr << arr;
    return strstr.str();
}

static uint32_t get_test_val()
{
    static uint32_t i = 0;
    std::array<uint32_t, 10> test_vals = { 0xdead, 0xbeef, 0xfaff, 0xbabe, 0xcafe, 0xfeed, 0xdeaf, 0xface, 0xfabb, 0xbead };

    return test_vals.at(i++ % test_vals.size());
}


/* Check value is not a valid capability (on CHERI), and print it */
extern "C" int32_t print_externref(wasm_exec_env_t exec_env, uintptr_t extref)
{
    std::cout << "    native print_externref()++" << std::endl;

    uint64_t value;
#if ENABLE_CHERI_PURECAP
    if (cheri_tag_get(extref))
    {
        std::cout << "    native print value - capability tag is set.  Full cap == " << print_extref(extref) << std::endl;
    }

    value = (uint64_t)cheri_address_get(extref);
#else
    value = (uint64_t)extref;
#endif

    std::cout << "    native extref value: 0x" << std::hex << value << std::endl;
    return 0;
}


#if ENABLE_CHERI_PURECAP
uint8_t* get_sealer()
{
    static uint8_t* sealer = (uint8_t*)getauxptr(AT_CHERI_SEAL_CAP) + 0x1234;

    return sealer;
}
#endif


extern "C" uintptr_t get_externref(wasm_exec_env_t exec_env)
{
    // Alloc some memory and pass value to it
    // This should not be on the sandbox heap as we won't use it in WASM
    uint32_t *p = new uint32_t[2];
    p[0] = get_test_val();
    p[1] = get_test_val();

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
    std::cout << "    native UNSEALING CAPABILITY" << std::endl;

    if (!cheri_tag_get(p))
    {
        std::cout << "    native FAILED put value - capability tag should be set" << std::endl;
        return -1;
    }
#endif
    std::cout << "Values: " << std::hex << "0x" << p[0] << " and 0x" << p[1] << std::endl;
    delete[] p;
    return 0;
}


// Do the externref call into wasm test using args in array
static int32_t externref_test_call_wasm(wasm_exec_env_t exec_env, wasm_function_inst_t func, wasm_module_inst_t module_inst)
{
    uintptr_t p1 = get_externref(exec_env);  // p is on heap, values set
    uintptr_t p2 = get_externref(exec_env);  // p is on heap, values set

    uint32_t argv[ELEM_SIZE * 2];
    uint32_t* argv_p = &argv[0];

#if ENABLE_CHERI_PURECAP
    argv_p = cheri_align_up(argv_p, __BIGGEST_ALIGNMENT__);
#endif
    * ((uintptr_t*)argv_p) = p1;

    argv_p = &argv[ELEM_SIZE];

#if ENABLE_CHERI_PURECAP
    argv_p = cheri_align_up(argv_p, __BIGGEST_ALIGNMENT__);
#endif
    *((uintptr_t*)argv_p) = p2;

    std::cout << "    **** native calling wasm function externref_test_in_wasm() with wasm_runtime_call_wasm" << std::endl;

    if (!wasm_runtime_call_wasm(exec_env, func, 16, argv))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM externref_test_in_wasm()" << std::endl;
    
    // Result should be p2
    argv_p = &argv[0];
#if ENABLE_CHERI_PURECAP
    argv_p = cheri_align_up(argv_p, __BIGGEST_ALIGNMENT__);
#endif
    uintptr_t result_p = *((uintptr_t*)argv_p);
    if (p2 != result_p)
    {
        std::cout << "    native failed to retrieve correct return value from function" << std::endl;
        return -1;
    }
    else
    {
        std::cout << "    native got return value ok!" << std::endl;
        return put_externref(exec_env, p2);
    }
}

// Do the externref call into wasm test using arguments
static int32_t externref_test_call_wasm_a(wasm_exec_env_t exec_env, wasm_function_inst_t func, wasm_module_inst_t module_inst)
{
    uintptr_t p1 = get_externref(exec_env);  // p is on heap, values set
    uintptr_t p2 = get_externref(exec_env);  // p is on heap, values set

    uint32_t num_args = 2, num_results = 1;
    wasm_val_t args[2], results[1];

    // Args types and values
    args[0].kind = WASM_ANYREF;
    args[0].of.foreign = p1;

    args[1].kind = WASM_ANYREF;
    args[1].of.foreign = p2;

    std::cout << "    **** native calling wasm function externref_test_in_wasm() with wasm_runtime_call_wasm_a" << std::endl;

    if (!wasm_runtime_call_wasm_a(exec_env, func, num_results, results, num_args, args))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM externref_test_in_wasm()" << std::endl;

    // Result should be p2
    if (results[0].kind != WASM_ANYREF)
    {
        std::cout << "    native bad call_wasm_a result type, expected WASM_ANYREF" << std::endl;
        return -1;
    }
    uintptr_t result_p = results[0].of.foreign;

    if (p2 != result_p)
    {
        std::cout << "    native failed to retrieve correct return value from function" << std::endl;
        return -1;
    }
    else
    {
        std::cout << "    native got return value ok!" << std::endl;
        return put_externref(exec_env, p2);
    }
}

// Do the externref call into wasm test using variant args
static int32_t externref_test_call_wasm_v(wasm_exec_env_t exec_env, wasm_function_inst_t func, wasm_module_inst_t module_inst)
{
    uintptr_t p1 = get_externref(exec_env);  // p is on heap, values set
    uintptr_t p2 = get_externref(exec_env);  // p is on heap, values set

    uint32_t num_args = 2, num_results = 1;
    wasm_val_t args[2], results[1];

    std::cout << "    **** native calling wasm function externref_test_in_wasm() with wasm_runtime_call_wasm_v" << std::endl;

    if (!wasm_runtime_call_wasm_v(exec_env, func, num_results, results, num_args, p1, p2))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM externref_test_in_wasm()" << std::endl;

    // Result should be p2
    if (results[0].kind != WASM_ANYREF)
    {
        std::cout << "    native bad call_wasm_a result type, expected WASM_ANYREF" << std::endl;
        return -1;
    }
    uintptr_t result_p = results[0].of.foreign;

    if (p2 != result_p)
    {
        std::cout << "    native failed to retrieve correct return value from function" << std::endl;
        return -1;
    }
    else
    {
        std::cout << "    native got return value ok!" << std::endl;
        return put_externref(exec_env, p2);
    }
}

static int32_t do_table_get_test(wasm_exec_env_t &exec_env, wasm_module_inst_t &module_inst)
{
    auto getfunc = wasm_runtime_lookup_function(module_inst, "table_test_get", NULL);
    auto nullcheck = wasm_runtime_lookup_function(module_inst, "table_test_null", NULL);

    uint32_t num_results = 1;
    uint32_t num_args = 1;
    
    wasm_val_t results[1];

    for (uint32_t i = 0; i < 5; ++i)
    {
        std::cout << "    **** native calling table_test_get() func" << std::endl;

        // Note: Last value should be the internal null, i.e "-1"
        if (!wasm_runtime_call_wasm_v(exec_env, getfunc, num_results, results, num_args, i))
        {
            std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
            return -1;
        }

        std::cout << "    native successfully called WASM table_test_get()" << std::endl;

        // Result should be i32 and output val
        if (results[0].kind != WASM_ANYREF)
        {
            std::cout << "    native bad call_wasm_a result type, expected WASM_ANYREF" << std::endl;
            return -1;
        }
        uintptr_t result_val = results[0].of.foreign;

        std::cout << "    native returned value " << std::hex << "0x" << (uint64_t)result_val << std::endl;

        // Check for null
        if (!wasm_runtime_call_wasm_v(exec_env, nullcheck, num_results, results, num_args, i))
        {
            std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
            return -1;
        }
        std::cout << "    native successfully called WASM table_check_null()" << std::endl;

        // Result should be i32 and output val
        if (results[0].kind != WASM_I32)
        {
            std::cout << "    native bad call_wasm_a result type, expected WASM_I32" << std::endl;
            return -1;
        }
        std::cout << "    native result of is value null?: " << (uint32_t)results[0].of.i32 << std::endl;
    }
    return 0;
}

static int32_t externref_table_test(wasm_exec_env_t exec_env, wasm_module_inst_t module_inst)
{
    // For this test let's just use non-capabilities

    uint32_t num_args = 4, num_results = 1;
    wasm_val_t args[2], results[1];

    auto setfunc = wasm_runtime_lookup_function(module_inst, "table_test_set", NULL);
    auto opstest = wasm_runtime_lookup_function(module_inst, "table_test_ops", NULL);

    std::cout << "    **** native calling table_test_set() func" << std::endl;

    uintptr_t p1 = (uintptr_t)0x11LL;
    uintptr_t p2 = (uintptr_t)0x22LL;
    uintptr_t p3 = (uintptr_t)0x33LL;
    uintptr_t p4 = (uintptr_t)0x44LL;

    if (!wasm_runtime_call_wasm_v(exec_env, setfunc, num_results, results, num_args, p1, p2, p3, p4))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM table_test_set()" << std::endl;

    // Result should be i32 and size of table, i.e 4
    if (results[0].kind != WASM_I32)
    {
        std::cout << "    native bad call_wasm_a result type, expected WASM_I32" << std::endl;
        return -1;
    }
    uint32_t result_size = results[0].of.i32;

    if (4+1 != result_size)
    {
        std::cout << "    native failed to retrieve correct return value from function, expected 4 got " << result_size << std::endl;
        return -1;
    }
    else
    {
        std::cout << "    native got return value \"" << result_size << "\" ok!" << std::endl;
    }


    int32_t result = do_table_get_test(exec_env, module_inst);
    if (0 != result)
    {
        return result;
    }

    if (!wasm_runtime_call_wasm(exec_env, opstest, 0, NULL))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM table_test_ops()" << std::endl;

    // Now repeat the "get" test
    return do_table_get_test(exec_env, module_inst);
}

static int32_t funcref_table_test(wasm_exec_env_t exec_env, wasm_module_inst_t module_inst)
{
    // For this test let's just use non-capabilities

    uint32_t num_args = 1, num_results = 1;
    wasm_val_t args[2], results[1];

    auto func = wasm_runtime_lookup_function(module_inst, "funcref_test", NULL);

    std::cout << "    **** native calling funcref_test() func" << std::endl;

    uintptr_t p1 = (uintptr_t)0xFFLL;

    if (!wasm_runtime_call_wasm_v(exec_env, func, num_results, results, num_args, p1))
    {
        std::cout << "    native FAILED call back to wasm, exception: " << wasm_runtime_get_exception(module_inst) << std::endl;
        return -1;
    }
    // else...

    std::cout << "    native successfully called WASM funcref_test()" << std::endl;

    // Result should be i32 and 0 on success
    if (results[0].kind != WASM_I32)
    {
        std::cout << "    native bad call_wasm_v result type, expected WASM_I32" << std::endl;
        return -1;
    }
    int32_t result = results[0].of.i32;
    std::cout << "    native funcref_test() result = " << result << std::endl;

    return result;
}


// Test calling into WASM with an extern ref.  It should then call put_externref and return
extern "C" int32_t externref_test_called_from_native(wasm_exec_env_t exec_env, wasm_module_inst_t module_inst)
{
    auto func = wasm_runtime_lookup_function(module_inst, "externref_test_in_wasm", NULL);

    std::cout << "    native got function" << std::endl;

    uint32_t result = 0;

    if (0 != externref_test_call_wasm(exec_env, func, module_inst) ||
        0 != externref_test_call_wasm_a(exec_env, func, module_inst) ||
        0 != externref_test_call_wasm_v(exec_env, func, module_inst) ||
        0 != externref_table_test(exec_env, module_inst) ||
        0 != funcref_table_test(exec_env, module_inst)
        )
    {
        std::cout << "    native testing FAILED" << std::endl;
        result = -1;
    }

    return result;
}

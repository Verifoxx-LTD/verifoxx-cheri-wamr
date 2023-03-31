// cheri_mem_mgmt.h: Manage some WASM structures with suitable capability pointers

#ifndef _CHERI_MEM_MGMT_H_
#define _CHERI_MEM_MGMT_H_

#include "wasm_exec_env.h"
#include "wasm_export.h"
#include "wasm_memory.h"
#include "wasm_native.h"
#include "wasm_runtime_common.h"

#include <cheriintrin.h>

class CheriMemMgr
{
public:
    using MallocPointer_t = void *__capability (*)(size_t);
    using ReallocPointer_t = void* __capability(*)(void* __capability, size_t);
    using FreePointer_t = void (*)(void *__capability);

    static void* __capability cheri_malloc(size_t sz_bytes);
    static void* __capability cheri_realloc(void* __capability ptr, size_t sz_bytes);
    static void cheri_free(void *__capability ptr);
    

private:
    static constexpr size_t CHERI_ALIGNMENT = sizeof(void* __capability);
    static constexpr size_t WASM_STACK_PERMS =
        CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
        CHERI_PERM_STORE | CHERI_PERM_STORE_CAP | CHERI_PERM_STORE_LOCAL_CAP |
        CHERI_PERM_GLOBAL;

    size_t m_stack_size;
    size_t m_heap_size;
    uint8_t* __capability m_stack;
    WASMCheriStack_t* __capability m_stack_struct;
    MallocPointer_t m_malloc_func = nullptr;
    ReallocPointer_t m_realloc_func = nullptr;
    FreePointer_t m_free_func = nullptr;


public:
    // Construct: note - align stack size up to 16 byte boundary
    CheriMemMgr(uint32_t stack_size, uint32_t heap_size, MallocPointer_t malloc_func=nullptr, ReallocPointer_t realloc_func=nullptr, FreePointer_t free_func=nullptr)
    {
        m_stack_size = cheri_align_up(stack_size, CHERI_ALIGNMENT);
        m_heap_size = cheri_align_up(heap_size, CHERI_ALIGNMENT);
        
        m_malloc_func = malloc_func ? malloc_func : &CheriMemMgr::cheri_malloc;
        m_realloc_func = realloc_func ? realloc_func : &CheriMemMgr::cheri_realloc;
        m_free_func = free_func ? free_func : &CheriMemMgr::cheri_free;
    }

    ~CheriMemMgr()
    {
        cleanup_wasm_stack();
    }

    void setup_wasm_stack()
    {
        m_stack = (uint8 * __capability)m_malloc_func(m_stack_size + CHERI_ALIGNMENT);
        m_stack_struct = (WASMCheriStack_t * __capability)m_malloc_func(sizeof(WASMCheriStack_t));

        m_stack = cheri_perms_and(m_stack, WASM_STACK_PERMS);

        // Allocate the actual stack.  Note - to avoid the top boundary being out of bounds, allocate extra space
        // Adjust stack size to be 16 byte aligned
        m_stack = (uint8 * __capability)m_malloc_func(m_stack_size + CHERI_ALIGNMENT);
        m_stack = cheri_perms_and(m_stack, WASM_STACK_PERMS);

        // Allocate the stack structure
        m_stack_struct = (WASMCheriStack_t * __capability)m_malloc_func(sizeof(WASMCheriStack_t));

        // Setup
        m_stack_struct->bottom = m_stack;
        m_stack_struct->top = m_stack;
        m_stack_struct->top_boundary = m_stack + m_stack_size;

        /* Our stack structure:
            |.................<allocated space>......................|xx|
            ^           ^                                             ^
            |           |                                             |
            bottom    -->  top grows -->                        top_boundary
        */
    }

    // Allocate linear memory
    void* __capability alloc_linear_memory(size_t sz);

    bool wasm_memory_init()
    {
        if (wasm_memory_init_with_allocator((void*)m_malloc_func, (void*)m_realloc_func, (void*)m_free_func)
            && wasm_runtime_set_default_running_mode(Mode_Interp)
            && wasm_native_init()
#ifdef OS_ENABLE_HW_BOUND_CHECK
            && runtime_signal_init()
#endif
            )
        {
            return true;
        }

        wasm_runtime_memory_destroy();
        return false;

    }

    void cleanup_wasm_stack()
    {
        if (m_stack_struct)
        {
            m_free_func(m_stack_struct);
            m_stack_struct = nullptr;
        }

        if (m_stack)
        {
            m_free_func(m_stack);
            m_stack = nullptr;
        }
    }

    // Get the actual stack size used
    size_t stack_size() const
    {
        return m_stack_size;
    }

    // Get the stack struct
    WASMCheriStack_t* __capability stack_struct() const
    {
        return m_stack_struct;
    }

};

#endif /* _CHERI_MEM_MGMT_H_*/
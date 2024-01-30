// cheri_mem_mgmt_c_api.h: Call into the CheriMemMgr from C
// Uses global declared in main.cpp

#ifndef _CHERI_MEM_MGMT_C_API_H_
#define _CHERI_MEM_MGMT_C_API_H_

#include "wasm_exec_env.h"

#ifdef __cplusplus
class CheriMemMgr;
extern "C" {
#else
struct CheriMemMgr;
typedef struct CheriMemMgr CheriMemMgr;
#endif

// Instance of the CheriMemMgr, created & maintained for C code
extern CheriMemMgr* mem_mgr_instance;

// Create mem manager
CheriMemMgr *create_cheri_mem_mgr();

// Destroy mem mgr when exiting
void delete_cheri_mem_mgr();

// Create & get the stack struct
WASMCheriStack_t* __capability cheri_wasm_create_stack_struct();

// Update the stack size with supplied value and return aligned value
uint32_t cheri_wasm_update_stack_size(uint32_t requested_size);

// Set the heap offset in linear memory and the size, and check for validity
// Future need at the moment
bool cheri_wasm_set_check_heap_metrics(uint32_t heap_size, uint32_t heap_offset);


// Alloc a linear memory
void* __capability cheri_wasm_linear_memory_alloc(size_t size);

#ifdef __cplusplus
}
#endif
#endif /* _CHERI_MEM_MGMT_C_API_H_ */

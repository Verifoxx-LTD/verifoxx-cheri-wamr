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

extern CheriMemMgr* mem_mgr_instance;   // see main.cpp

// Get the stack struct
WASMCheriStack_t* __capability cheri_wasm_get_stack_struct();

// Get the stack size
size_t cheri_wasm_get_stack_size();

#ifdef __cplusplus
}
#endif
#endif /* _CHERI_MEM_MGMT_C_API_H_ */

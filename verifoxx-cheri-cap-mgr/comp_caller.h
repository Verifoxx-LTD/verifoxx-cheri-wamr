#ifndef _COMP_CALLER_H__
#define _COMP_CALLER_H__

#include "common/comp_common_defs.h"

#ifdef __cplusplus
extern "C"
{
#endif

    #include <stddef.h>
    #include <stdint.h>

    uintptr_t CompartmentCaller(CompEntryAsmFnPtr entry_fp, void *comp_data, void* unwrapping_ptr, void* comp_ptr, void* sealer_cap);

#ifdef __cplusplus
}
#endif


#endif /* _COMP_CALLER_H__ */
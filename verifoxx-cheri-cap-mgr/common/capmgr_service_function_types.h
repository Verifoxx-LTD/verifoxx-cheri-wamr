#ifndef _CAPMGR_SERVICE_FUNCTION_TYPES_H__
#define _CAPMGR_SERVICE_FUNCTION_TYPES_H__

// Table of function pointers in the capability manager

#ifdef __cplusplus
extern "C"
{
#endif

    #include <stddef.h>
    #include <stdint.h>

    // Service function pointer types (C types)
    typedef uintptr_t(*ServiceHandlerCheriMallocFp)(size_t sz_bytes);
    typedef uintptr_t(*ServiceHandlerCheriReallocFp)(void* ptr, size_t sz_bytes);
    typedef uintptr_t(*ServiceHandlerCheriAllocLinearMemFp)(size_t sz_bytes);
    typedef uintptr_t(*ServiceHandlerCheriAllocStackFp)(size_t sz_bytes);
    typedef uintptr_t(*ServiceHandlerCheriFreeFp)(void* ptr);
    typedef uintptr_t(*ServiceHandlerCheriFreeStackFp)(void* ptr);
#ifdef __cplusplus
}

// Type for implementing the service function table

#include <map>
#include <string>
using ServiceFunctionTable = std::map<std::string, void*>;

#endif


#endif /* _CAPMGR_SERVICE_FUNCTION_TYPES_H__ */

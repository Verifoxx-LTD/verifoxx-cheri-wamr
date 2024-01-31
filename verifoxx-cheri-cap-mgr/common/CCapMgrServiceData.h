// CapMgrServiceData classes supply arguments to callback from compartment to execute services

#ifndef _CAPMGRSERVICE_DATA_H__
#define _CAPMGRSERVICE_DATA_H__

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include "capmgr_service_function_types.h"

// Fn Call type - not a C++ enum
typedef enum
{
    ServiceCall_cheri_malloc,
    ServiceCall_cheri_realloc,
    ServiceCall_cheri_alloc_linear_mem,
    ServiceCall_cheri_alloc_stack,
    ServiceCall_cheri_free,
    ServiceCall_cheri_free_stack
} ServiceCall_t;


// Base class for any callback function
// Contains needed function pointers
class alignas(__BIGGEST_ALIGNMENT__) CCapMgrServiceData
{
public:
    void* fp;                           // Function pointer to the capability manager function to be called
    ServiceCall_t       call_type;      // Which derived class it is

    CCapMgrServiceData(ServiceCall_t call_type_) : call_type(call_type_), fp(nullptr) {}
    virtual ~CCapMgrServiceData() {}
};

// Params for the cheri_malloc_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriMallocCapMgrServiceData : public CCapMgrServiceData
{
public:
    size_t sz_bytes;

public:
    CCheriMallocCapMgrServiceData(
        size_t sz_bytes_
    ) : CCapMgrServiceData(ServiceCall_cheri_malloc), sz_bytes(sz_bytes_) {}
};

// Params for the cheri_realloc_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriReallocCapMgrServiceData : public CCapMgrServiceData
{
public:
    void* ptr;
    size_t sz_bytes;

public:
    CCheriReallocCapMgrServiceData(
        void *ptr_,
        size_t sz_bytes_
    ) : CCapMgrServiceData(ServiceCall_cheri_realloc), ptr(ptr_), sz_bytes(sz_bytes_) {}
};

// Params for the cheri_alloc_linear_mem_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriAllocLinearMemCapMgrServiceData : public CCapMgrServiceData
{
public:
    size_t sz_bytes;

public:
    CCheriAllocLinearMemCapMgrServiceData(
        size_t sz_bytes_
    ) : CCapMgrServiceData(ServiceCall_cheri_alloc_linear_mem), sz_bytes(sz_bytes_) {}
};

// Params for the cheri_alloc_stack_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriAllocStackCapMgrServiceData : public CCapMgrServiceData
{
public:
    size_t sz_bytes;

public:
    CCheriAllocStackCapMgrServiceData(
        size_t sz_bytes_
    ) : CCapMgrServiceData(ServiceCall_cheri_alloc_stack), sz_bytes(sz_bytes_) {}
};

// Params for the cheri_free_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriFreeCapMgrServiceData : public CCapMgrServiceData
{
public:
    void* ptr;

public:
    CCheriFreeCapMgrServiceData(
        void* ptr_
    ) : CCapMgrServiceData(ServiceCall_cheri_free), ptr(ptr_) {}
};

// Params for the cheri_free_stack_wrapper() function call
class alignas(__BIGGEST_ALIGNMENT__) CCheriFreeStackCapMgrServiceData : public CCapMgrServiceData
{
public:
    void* ptr;

public:
    CCheriFreeStackCapMgrServiceData(
        void* ptr_
    ) : CCapMgrServiceData(ServiceCall_cheri_free_stack), ptr(ptr_) {}
};

#endif /* _CAPMGR_SERVICE_DATA_H__ */

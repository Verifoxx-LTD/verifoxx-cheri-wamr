// Implements capability manager services callback

#include <cheriintrin.h>
#include <cstdlib>
#include <functional>

#include "capmgr_services.h"
#include "CCapMgrServiceData.h"
#include "CCapMgrLogger.h"
#include "comp_common_asm.h"


using namespace CapMgr;


static uintptr_t CallServiceFunction(CCapMgrServiceData* p)
{
    uintptr_t result{ 0 };

    switch (p->call_type)
    {
    case ServiceCall_cheri_malloc:
    {
        auto p_d = static_cast<CCheriMallocCapMgrServiceData*>(p);
        auto real_fp = reinterpret_cast<ServiceHandlerCheriMallocFp>(p_d->fp);

        L_(DEBUG) << "Calling cheri_malloc()";
        result = (uintptr_t)real_fp(p_d->sz_bytes);
    }
    break;

    case ServiceCall_cheri_realloc:
    {
        auto p_d = static_cast<CCheriReallocCapMgrServiceData*>(p);
        auto real_fp = reinterpret_cast<ServiceHandlerCheriReallocFp>(p_d->fp);

        L_(DEBUG) << "Calling cheri_realloc()";
        result = (uintptr_t)real_fp(p_d->ptr, p_d->sz_bytes);
    }
    break;

    case ServiceCall_cheri_free:
    {
        auto p_d = static_cast<CCheriFreeCapMgrServiceData*>(p);
        auto real_fp = reinterpret_cast<ServiceHandlerCheriFreeFp>(p_d->fp);

        L_(DEBUG) << "Calling cheri_free()";
        result = (uintptr_t)real_fp(p_d->ptr);
    }
    break;

    default:
    {
        L_(ERROR) << "Failed to call WAMR function - unsupported function";
    }
    break;
    }
    
    L_(DEBUG) << "CapMgr Service function returns";

    return result;
}


// Compartment Service Handler is passed a CCapMgrServiceData object as void *
extern "C" uintptr_t CompartmentServiceHandler(void* service_data_object)
{
    auto capmgr_service_data_ptr = reinterpret_cast<CCapMgrServiceData*>(service_data_object);

    L_(DEBUG) << "CompartmentServiceHandler: Handling service function...";
    uintptr_t result = CallServiceFunction(capmgr_service_data_ptr);
    L_(DEBUG) << "CompartmentServiceHandler: Returned from actual service function";

    CompartmentServiceCallbackSwitchReturn(result);
    __builtin_unreachable();
}



// Actual service functions
extern "C" void* cheri_malloc(size_t sz_bytes)
{
    // Test
    return (void*)(sz_bytes << 1);
}

extern "C" void* cheri_realloc(void* ptr, size_t sz_bytes)
{
    return NULL;
}

extern "C" void cheri_free(void* ptr)
{
}

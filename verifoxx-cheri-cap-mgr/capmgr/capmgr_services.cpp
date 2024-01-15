// Implements capability manager services callback

#include <cheriintrin.h>
#include <cstdlib>

#include "capmgr_services.h"
#include "CCapMgrLogger.h"
#include "comp_common_asm.h"


using namespace CapMgr;

extern "C" uintptr_t CompartmentServiceHandler(void* callback_data)
{
    uint32_t* pval = reinterpret_cast<uint32_t*>(callback_data);

    L_(DEBUG) << "CompartmentServiceHandler++: Received value=" << *pval;

    uint32_t retval = *pval + 1;

    L_(DEBUG) << "CompartmentServiceHandler--: Returning value+1=" << retval;

    CompartmentServiceCallbackSwitchReturn((uintptr_t)retval);
    __builtin_unreachable();
}

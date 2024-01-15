// capmgr_services.h: Compartment callback to provide capability manager services

#ifndef _CAPMGR_SERVICES_H__
#define _CAPMGR_SERVICES_H__

#ifdef __cplusplus
extern "C"
{
#endif

    #include <stddef.h>
    #include <stdint.h>

    // For now, we will just hard code this to do memory allocation
    uintptr_t CompartmentServiceHandler(void* callback_data);

#ifdef __cplusplus
}
#endif


#endif /* _CAPMGR_SERVICES_H__ */

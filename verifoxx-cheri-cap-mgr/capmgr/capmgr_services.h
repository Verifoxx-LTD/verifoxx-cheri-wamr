// capmgr_services.h: Compartment callback to provide capability manager services

#ifndef _CAPMGR_SERVICES_H__
#define _CAPMGR_SERVICES_H__

#ifdef __cplusplus
extern "C"
{
#endif

    #include <stddef.h>
    #include <stdint.h>

    uintptr_t CompartmentServiceHandler(void* service_data_object);

#ifdef __cplusplus
}
#endif


#endif /* _CAPMGR_SERVICES_H__ */

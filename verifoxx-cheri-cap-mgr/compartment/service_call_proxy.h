// Proxy calls for calling capability manager service functions

#ifndef _SERVICECALL_PROXY_H__
#define _SERVICECALL_PROXY_H__

#if !ENABLE_CHERI_PURECAP || !ENABLE_CHERI_COMPARTMENT || ENABLE_CHERI_CAPMGR
#error "Bad make definitions; compartment must have ENABLE_CHERI_PURECAP=1, ENABLE_CHERI_COMPARTMENT=1 and ENABLE_CHERI_CAPMGR=0"
#endif

#include <stdexcept>
#include <string>
#include <memory>

#include "comp_caller.h"
#include "CCapMgrServiceData.h"
#include "capmgr_service_function_types.h"
#include "CCompartmentData.h"

class CCapMgrServiceException : public std::runtime_error
{
public:
    CCapMgrServiceException(const std::string& msg = "")
        : std::runtime_error(msg)
    {
    }
};


class CServiceCallProxy
{
    const CCompartmentData *m_compartment_data;   // compartment data used to source needed pointers

public:
    static CServiceCallProxy* GetInstance();

    CServiceCallProxy(const CCompartmentData* compartment_data) : m_compartment_data(compartment_data) {}

    // Call the function with transfer to the compartment
    uintptr_t CompartmentServiceCallback(std::string service_fn_name, const std::shared_ptr<CCapMgrServiceData>& service_fn_data)
    {
        // Lookup the service function pointer which we require
        auto service_fn_ptr_entry = m_compartment_data->service_func_table->find(service_fn_name);

        if (service_fn_ptr_entry == m_compartment_data->service_func_table->end())
        {
            throw CCapMgrServiceException("Callback service function does not exit");
        }

        // Retrieve the actual function to be called in the capability manager and set it in the 
        // arguments object
        service_fn_data->fp = service_fn_ptr_entry->second;

        // Build compartment data (stack etc.): in this case, set to NULL as it is not required for cap mgr
        struct CompartmentData_t    comp_data_nulls;
        comp_data_nulls.csp = (void*)NULL;
        comp_data_nulls.ctpidr = (void*)NULL;
        comp_data_nulls.ddc = (void*)NULL;

        // Seal the underlying ptr to the argument data using the sealer passed from CCompartmentData
        void* sealed = cheri_seal(service_fn_data.get(), m_compartment_data->sealer_cap);

        LOG_VERBOSE("Dump capabilities for capability manager:\n"
            "\t\tService Callback Entry FP=%#p\n"
            "\t\tService Callback Handler FP=%#p\n"
            "\t\tService Callback Actual function=[\"%s\" -> %#p]\n"
            "\t\tSealer Capability=%#p",
            m_compartment_data->service_callback_entry_fp,
            m_compartment_data->capmgr_service_fp,
            service_fn_name.c_str(),
            service_fn_data->fp,
            m_compartment_data->sealer_cap);

        // Call into the capability manager
        LOG_DEBUG("<-- COMPARTMENT EXIT TO CAPMGR SERVICE <--");
        auto ret = CompartmentCaller(
            m_compartment_data->service_callback_entry_fp,   /* CapMgr entry function in Asm */
            &comp_data_nulls,                               /* Stack etc. to switch in (n/a) */
            reinterpret_cast<void*>(m_compartment_data->capmgr_service_fp),           /* CapMgr service handler called from Asm */
            sealed,                                         /* Sealed argument data including the underlying function to call */
            m_compartment_data->sealer_cap);                 /* Capability used to seal */

        LOG_DEBUG("--> COMPARTMENT ENTRY FROM CAPMGR SERVICE -->");
        return ret;
    }

    template <typename T, typename... Args>
    uintptr_t CallServiceFn(const std::string& fn_name, Args&&... args)
    {
        return CompartmentServiceCallback(fn_name,
            std::make_shared<T>(std::forward<Args>(args)...)
        );
    }

    template <typename... Args>
    void *cheri_malloc_wrapper(Args&&... args)
    {
        return (void*)CallServiceFn<CCheriMallocCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void *cheri_realloc_wrapper(Args&&... args)
    {
        return (void*)CallServiceFn<CCheriReallocCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void* cheri_alloc_linear_mem_wrapper(Args&&... args)
    {
        return (void*)CallServiceFn<CCheriAllocLinearMemCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void* cheri_alloc_stack_wrapper(Args&&... args)
    {
        return (void*)CallServiceFn<CCheriAllocStackCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void cheri_free_wrapper(Args&&... args)
    {
        CallServiceFn<CCheriFreeCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

    template <typename... Args>
    void cheri_free_stack_wrapper(Args&&... args)
    {
        CallServiceFn<CCheriFreeStackCapMgrServiceData>(__func__, std::forward<Args>(args)...);
    }

};

#endif /* _SERVICECALL_PROXY_H__ */

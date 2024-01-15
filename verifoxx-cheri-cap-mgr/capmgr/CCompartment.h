// CCompartment: Information about the compartment

#ifndef _CCOMPARTMENT_H__
#define _CCOMPARTMENT_H__

#include <exception>
#include <memory>

#include "comp_common_defs.h"
#include "CCompartmentData.h"
#include "CCompartmentLibs.h"

// Comp perms
constexpr size_t kCompartmentDataPerms =
CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
CHERI_PERM_STORE | CHERI_PERM_STORE_CAP | CHERI_PERM_STORE_LOCAL_CAP |
CHERI_PERM_GLOBAL;

// Compartment execution needs load permissions for PC relative addressing
constexpr size_t kCompartmentExecPerms =
CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
CHERI_PERM_EXECUTE | CHERI_PERM_GLOBAL;// | ARM_CAP_PERMISSION_EXECUTIVE;   // TO BE REMOVED

constexpr size_t kCompartmentSealerPerms =
CHERI_PERM_SEAL | CHERI_PERM_UNSEAL;

// Comp stack sizes
constexpr uint32_t CALL_FUNC_STACK_SIZE = 1024 * 1024;

// Sealing object_ids
constexpr uint32_t CALL_FUNC_SEAL_ID = 0x1234;

class CCompartmentException : public std::runtime_error
{
public:
    CCompartmentException(const std::string& msg = "")
        : std::runtime_error(msg)
    {
    }
};

class CCompartment
{
public:
    // Different compartment types - is it needed?
    enum class CompartmentId
    {
        kCallFuncCompartment
    };

private:
    // Entry point in the compartment which we need to call - always a single trampoline address
    static constexpr const char* COMPARTMENT_ENTRY_POINT_FUNCTION = "CompartmentEntryPoint";
    struct CompartmentData_t    m_comp_data;
    const CCompartmentLibs  *m_comp_libs;
    CompartmentId               m_id;
    void* m_sealer_cap;         // Capability used for sealing
    void* m_comp_entry;         // Capability which is the compartment's entry function (in restricted)
    CompExitAsmFnPtr m_exit_fn;   // and the exit function (in executive).

    CompEntryAsmFnPtr m_capmgr_service_entry_fn;      // Compartment service callback entry function pointer.
    CompServiceCallbackFnPtr m_capmgr_service_fn;    // Compartment service callback handler function pointer. 

    void* CreateStack(uint32_t stack_size);
    void* RestrictAndSeal(CCompartmentData* comp_fn_data);
    uintptr_t SetCtpidr();

public:
    // Create compartment with needed mappings and optionally name of the unwrap function
    explicit CCompartment(const CCompartmentLibs* comp_libs, CompartmentId id, uint32_t stack_size, uint32_t seal_id,
        const std::string comp_entry_trampoine_function = COMPARTMENT_ENTRY_POINT_FUNCTION);

    // Call into restricted, give the compartment data to pass for the function and the name of the function
    uintptr_t CallCompartmentFunction(const std::string &fn_to_call, const std::shared_ptr<CCompartmentData> &comp_fn_data);
};

#endif /* _CCOMPARTMENT_H__ */

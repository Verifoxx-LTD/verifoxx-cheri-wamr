// CCompartment: Information about the compartment

#ifndef _CCOMPARTMENT_H__
#define _CCOMPARTMENT_H__

#include <exception>
#include <memory>

#include "common/comp_common_defs.h"
#include "common/CCompartmentData.h"
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
    // Unwrap function which in the compartment which we need to call
    static constexpr const char *UNWRAP_DEFAULT_FUNCTION = "CompartmentUnwrap";
    struct CompartmentData_t    m_comp_data;
    const CCompartmentLibs  *m_comp_libs;
    CompartmentId               m_id;
    void* m_sealer_cap;         // Capability used for sealing
    void* m_comp_entry;         // Capability which is the compartment's entry function (in restricted)
    CompExitAsmFnPtr m_exit_fn;   // and the exit function (in executive)

    void* CreateStack(uint32_t stack_size);
    void* RestrictAndSeal(CCompartmentData* comp_fn_data);
    uintptr_t SetCtpidr();

public:
    // Create compartment with needed mappings and optionally name of the unwrap function
    explicit CCompartment(const CCompartmentLibs *comp_libs, CompartmentId id, uint32_t stack_size, uint32_t seal_id,
                            const std::string comp_unwrap_function = UNWRAP_DEFAULT_FUNCTION);

    // Call into restricted, give the compartment data to pass for the function and the name of the function
    uintptr_t CallCompartmentFunction(const std::string &fn_to_call, const std::shared_ptr<CCompartmentData> &comp_fn_data);

#if 0
    bool wasm_runtime_call_wasm_a(wasm_exec_env_t exec_env,
        wasm_function_inst_t function,
        uint32_t num_results, wasm_val_t results[],
        uint32_t num_args, wasm_val_t* args);
#endif
};

#endif /* _CCOMPARTMENT_H__ */
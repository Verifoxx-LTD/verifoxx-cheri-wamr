// CCompartment: Information about the compartment

#ifndef _CCOMPARTMENT_H__
#define _CCOMPARTMENT_H__

#include <exception>

#include "common/comp_common_defs.h"

// Different compartment types
enum class CompartmentId
{
    kCallFuncCompartment
};

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

    struct CompartmentData_t    m_comp_data;
    CompartmentId               m_id;
    void* m_sealer_cap;         // Capability used for sealing

    void* CreateStack(uint32_t stack_size);
    void* RestrictAndSeal(void* comp_ptr_table);
    uintptr_t SetCtpidr();

public:
    // Create compartment with needed mappings
    explicit CCompartment(CompartmentId id, uint32_t stack_size, uint32_t seal_id);

    // Call into restricted, pass pointer to the unwrap function
    bool CallCompartment(void *unwrap_fn);

    virtual void* GetCompTable() const = 0;
};

class CWasmCallFuncCompartment : public CCompartment
{
    struct CompartmentWasmCall_t    *m_comp_params; // Goes on heap, used by compartment

public:
    // Create the WASM call func compartment
    explicit CWasmCallFuncCompartment(void *wamr_fn,
        WASMExecEnv* exec_env,
        WASMFunctionInstanceCommon* function,
        uint32 num_results,
        wasm_val_t* results,
        uint32 num_args,
        wasm_val_t* args);

    ~CWasmCallFuncCompartment() { delete m_comp_params; }
    
    virtual void* GetCompTable() const { return reinterpret_cast<void*>(m_comp_params); }

};
#endif /* _CCOMPARTMENT_H__ */

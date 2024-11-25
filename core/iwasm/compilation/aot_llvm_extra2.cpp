/*
 * Copyright (c)2023 YAMAMOTO Takashi.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <llvm-c/TargetMachine.h>

#if defined(__has_include)
#if __has_include("llvm/MC/TargetRegistry.h")
#include <llvm/MC/TargetRegistry.h> // llvm-14
#else
#include <llvm/Support/TargetRegistry.h>    // llvm-11
#endif /* __has_include() */
#endif /* defined(__has_include)*/

#include <llvm/Target/TargetMachine.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/IRBuilder.h>

#include "bh_assert.h"

#include "aot_llvm_extra2.h"

static llvm::Optional<llvm::Reloc::Model>
convert(LLVMRelocMode reloc_mode)
{
    switch (reloc_mode) {
        case LLVMRelocDefault:
            return llvm::None;
        case LLVMRelocStatic:
            return llvm::Reloc::Static;
        case LLVMRelocPIC:
            return llvm::Reloc::PIC_;
        case LLVMRelocDynamicNoPic:
            return llvm::Reloc::DynamicNoPIC;
        case LLVMRelocROPI:
            return llvm::Reloc::ROPI;
        case LLVMRelocRWPI:
            return llvm::Reloc::RWPI;
        case LLVMRelocROPI_RWPI:
            return llvm::Reloc::ROPI_RWPI;
    }
    bh_assert(0);
    return llvm::None;
}

static llvm::CodeGenOpt::Level
convert(LLVMCodeGenOptLevel opt_level)
{
    switch (opt_level) {
        case LLVMCodeGenLevelNone:
            return llvm::CodeGenOpt::None;
        case LLVMCodeGenLevelLess:
            return llvm::CodeGenOpt::Less;
        case LLVMCodeGenLevelDefault:
            return llvm::CodeGenOpt::Default;
        case LLVMCodeGenLevelAggressive:
            return llvm::CodeGenOpt::Aggressive;
    }
    bh_assert(0);
    return llvm::CodeGenOpt::None;
}

static llvm::Optional<llvm::CodeModel::Model>
convert(LLVMCodeModel code_model, bool *jit)
{
    *jit = false;
    switch (code_model) {
        case LLVMCodeModelDefault:
            return llvm::None;
        case LLVMCodeModelJITDefault:
            *jit = true;
            return llvm::None;
        case LLVMCodeModelTiny:
            return llvm::CodeModel::Tiny;
        case LLVMCodeModelSmall:
            return llvm::CodeModel::Small;
        case LLVMCodeModelKernel:
            return llvm::CodeModel::Kernel;
        case LLVMCodeModelMedium:
            return llvm::CodeModel::Medium;
        case LLVMCodeModelLarge:
            return llvm::CodeModel::Large;
    }
    bh_assert(0);
    return llvm::None;
}

LLVMTargetMachineRef
LLVMCreateTargetMachineWithOpts(LLVMTargetRef ctarget, const char *triple,
                                const char *cpu, const char *features,
                                LLVMCodeGenOptLevel opt_level,
                                LLVMRelocMode reloc_mode,
                                LLVMCodeModel code_model,
                                bool EmitStackSizeSection,
                                const char *StackUsageOutput,
                                const char* abi    /* NULL or ABI to set */)
{
    llvm::TargetOptions opts;

    if (abi)
    {
        opts.MCOptions.ABIName = abi;
    }

    // -fstack-size-section equiv
    // emit it to ".stack_sizes" section in case of ELF
    // you can read it with "llvm-readobj --stack-sizes"
    opts.EmitStackSizeSection = EmitStackSizeSection;

    // -fstack-usage equiv
    if (StackUsageOutput != NULL) {
        opts.StackUsageOutput = StackUsageOutput;
    }

    auto target = reinterpret_cast<llvm::Target *>(ctarget);
    auto rm = convert(reloc_mode);
    auto ol = convert(opt_level);
    bool jit;
    auto cm = convert(code_model, &jit);
    auto targetmachine = target->createTargetMachine(triple, cpu, features,
                                                     opts, rm, cm, ol, jit);
    return reinterpret_cast<LLVMTargetMachineRef>(targetmachine);
}

// Return the default Program AS
unsigned getLLVMDefaultProgramAS(LLVMTargetDataRef ref)
{
    return (reinterpret_cast<llvm::DataLayout *>(ref))->getProgramAddressSpace();
}

// Return the default Alloc AS
unsigned getLLVMDefaultAllocAS(LLVMTargetDataRef ref)
{
    return (reinterpret_cast<llvm::DataLayout *>(ref))->getAllocaAddrSpace();
}

// Return the default globals AS
unsigned getLLVMDefaultGlobalsAS(LLVMTargetDataRef ref)
{
    return (reinterpret_cast<llvm::DataLayout *>(ref))->getDefaultGlobalsAddressSpace();
}

void set_module_data_layout(LLVMTargetDataRef ref, LLVMModuleRef mod)
{
    llvm::Module* pmod = reinterpret_cast<llvm::Module*>(mod);

    llvm::DataLayout* dl = reinterpret_cast<llvm::DataLayout*>(ref);
    pmod->setDataLayout(*dl);

}

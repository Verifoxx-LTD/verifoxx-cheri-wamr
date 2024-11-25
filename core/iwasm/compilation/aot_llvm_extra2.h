/*
 * Copyright (c)2023 YAMAMOTO Takashi.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <llvm-c/TargetMachine.h>
#include <llvm-c/Types.h>

LLVM_C_EXTERN_C_BEGIN
LLVMTargetMachineRef
LLVMCreateTargetMachineWithOpts(LLVMTargetRef ctarget, const char *triple,
                                const char *cpu, const char *features,
                                LLVMCodeGenOptLevel opt_level,
                                LLVMRelocMode reloc_mode,
                                LLVMCodeModel code_model,
                                bool EmitStackSizeSection,
                                const char *StackUsageOutput,
                                const char *abi /* NULL for no ABI to set */);

unsigned getLLVMDefaultProgramAS(LLVMTargetDataRef ref);
unsigned getLLVMDefaultAllocAS(LLVMTargetDataRef ref);
unsigned getLLVMDefaultGlobalsAS(LLVMTargetDataRef ref);

void set_module_data_layout(LLVMTargetDataRef ref, LLVMModuleRef mod);

LLVM_C_EXTERN_C_END

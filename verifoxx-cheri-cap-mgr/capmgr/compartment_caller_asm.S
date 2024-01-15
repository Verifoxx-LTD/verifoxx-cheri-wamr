#include "comp_common_asm.h"

#define comp_csp		c25
#define comp_ddc		c26
#define comp_ctpidr		c27
#define zero_reg		xzr
#define link_reg		c30
#define frame_ptr		c29
#define stack_ptr		csp
#define ctmp			c6
#define ctmp2			c7

#define ENTRY(f) \
    .globl f; \
    .balign 16; \
    .type f, %function; \
    f: \
    .cfi_startproc

#define END(f) \
    .cfi_endproc; \
    .size f, .-f;

// Create a frame record at `sp + offset`, update fp accordingly and add CFI
// information to use the saved frame record.
// Note that it is assumed that the frame record is stored at the top of the
// frame, i.e. that `sp + offset + 16` is equal to the caller's stack pointer.
.macro create_frame_record offset : req
    stp	c29, c30, [csp, #\offset]
	add	c29, csp, #\offset
	.cfi_def_cfa fp, 16
	.cfi_offset lr, -8
	.cfi_offset fp, -16
.endm

// Use .irp for iterating over the register numbers, so we need to list them
// explicitly.
#define ALL_REGS_NR \
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,\
	16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

// Clear all the general-purpose registers (including LR), except those passed
// as arguments.
.macro clear_all_registers_except exclusion_list:vararg
	// Iterate over all the registers.
	.irp	cur_reg, ALL_REGS_NR
	.set	clear_reg, 1

	// Iterate over the excluded register number list.
	.irp	excluded_reg, \exclusion_list
	// Registers can be specified as either x<n> or c<n>.
	.ifc	\excluded_reg, x\cur_reg
	.set	clear_reg, 0
	.else
	.ifc	\excluded_reg, c\cur_reg
	.set	clear_reg, 0
	.endif
	.endif
	.endr // .irp excluded_reg

	.if	clear_reg == 1
	mov x\cur_reg, zero_reg
	.endif
	.endr // .irp cur_reg
.endm


ENTRY(CompartmentSwitchEntry)
	// Frame record + space for a compdata object + space for CLR
	sub	stack_ptr, stack_ptr, #(16 + COMPDATA_STRUCT_SIZE)
	create_frame_record offset=COMPDATA_STRUCT_SIZE

	// c0 = comp data
    // c1 = func ptr
	// c2 = comp_ptr_table_sealed
	// c3 = sealing capability
	
	// Load the compartment data
	ldp	comp_csp, comp_ddc, [c0, #COMPDATA_CSP_OFFSET]
	ldr	comp_ctpidr, [c0, #COMPDATA_CTPIDR_OFFSET]

    // Save Restricted capability registers, and CLR so that we know where
	// to return. Same layout as the compartment struct, and CLR follows this
	mrs	ctmp, rcsp_el0
	mrs	ctmp2, rddc_el0
	stp	ctmp, ctmp2, [stack_ptr, #COMPDATA_CSP_OFFSET]
	mrs	ctmp, rctpidr_el0
	stp	ctmp, clr, [stack_ptr, #COMPDATA_CTPIDR_OFFSET]

	// Setup Restricted registers for the target compartment.
	msr	rcsp_el0, comp_csp
	msr	rddc_el0, comp_ddc
	msr	rctpidr_el0, comp_ctpidr

	// Clear all registers, except those still needed.
	// At this point we have:
	// c1: func ptr, i.e func we here call
	// c2: comp_ptr_table (sealed)
	// c3: capability to unseal c2
	// Frame Pointer

	clear_all_registers_except c1, c2, c3, c29

	// Call into the compartment, which can involve switching to
	// restricted.  Unfortunately not possible to unseal cap (or pair)
	// at the same time as switching to restricted.
	
	// Place unsealed cap in c0 ready for the call
	unseal c0, c2, c3
	brr	c1

	.globl CompartmentSwitchReturn
CompartmentSwitchReturn:
	// The compartment has returned.
	// Restore the restricted state environment and return to the caller.
	ldp	ctmp, ctmp2, [stack_ptr, #COMPDATA_CSP_OFFSET]
	msr	rcsp_el0, ctmp
	msr	rddc_el0, ctmp2
	ldp	ctmp, clr, [stack_ptr, #COMPDATA_CTPIDR_OFFSET]
	msr	rctpidr_el0, ctmp
	
	ldr	frame_ptr, [stack_ptr, #COMPDATA_STRUCT_SIZE]
	add	stack_ptr, stack_ptr, #(16 + COMPDATA_STRUCT_SIZE)

	// We also need to clear the registers apart from c0, FP and LR
	clear_all_registers_except c0, c29, c30 

	// use RETR to allow switching to Restricted.
	retr	clr

	.globl CompartmentServiceCallbackSwitchReturn
CompartmentServiceCallbackSwitchReturn:
	// Capability manager service return to compartment
    // Remove the last stack Frame
    // Note our "frame" is arranged differently to the compilers
    ldr frame_ptr, [frame_ptr]
	sub stack_ptr, frame_ptr, #COMPDATA_STRUCT_SIZE

    // Everything else is same as CompartmentExit
    b CompartmentSwitchReturn

END(CompartmentSwitchEntry)


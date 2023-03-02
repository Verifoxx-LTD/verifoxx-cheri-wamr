/*
 * Copyright (C) 2023 Verifoxx Limited.  All rights reserved.
 * Licence TBD.
 */

 /*
  * CHERI Pure-Cap AACH64 for Morello Platform.
  */
        .text
        .align  2

        .globl invokeNative
        .type  invokeNative, function
invokeNative:

/*
 * Arguments passed in:
 *
 * C0 (function ptr) - as uint64_t *
 * C1 argv (all arguments) - as uint64_t *
 * x2 nstacks - uint32_t as 64 bit unsigned
 */

/* Structure of argv for AARCH64 purecap is different than other archs, and is as follows:
 * argv[0..1] -> purecap ptr, exec_env (WASMExecEnv *)
 * argv[2..9] -> float or double, passed as uint64_t		(8 registers on Arm64)
 * argv[10..17] -> integers, passed as uint64_t				(8 registers total on Arm64)
 * argv[18..nStacks]	-> Stack arguments, passed as uint64_t
 */
 
 /* NOTE: Need to check if the capability pointer argv[8] is preserved when passed as integer */
 
 
        sub     csp, csp, #0x60
        stp     c19, c20, [csp, #0x40] 	/* save the registers - as full capability */
        stp     c21, c22, [csp, #0x20]
        stp     c23, c24, [csp, #0x0]

        mov     c19, c0          /* C19 = function ptr (cptr) */
        mov     c20, c1          /* C20 = argv (cptr) */
        mov     x21, x2          /* x21 = nstacks (uint64) */
        mov     c22, csp         /* save the Csp before call function */

		ldapr   c0, [c20]		/* c0 = exec_env */
		add     c20, c20, #16   /* Move past cptr */
		
        /* Fill in float-point registers - these are standard 64 bit */
        ldp     d0, d1, [c20], #16 /* d0 = argv[0], d1 = argv[1] */
        ldp     d2, d3, [c20], #16 /* d2 = argv[2], d3 = argv[3] */
        ldp     d4, d5, [c20], #16 /* d4 = argv[4], d5 = argv[5] */
        ldp     d6, d7, [c20], #16 /* d6 = argv[6], d7 = argv[7] */

        /* Fill integer registers */
		
		/* TO DO Save exec_env pointer as integer (cap check) */
        ldp     x1, x2, [c20], #16 /* x1 = argv[9], x2 = argv[10] */
        ldp     x3, x4, [c20], #16 /* x3 = argv[11], x4 = argv[12] */
        ldp     x5, x6, [c20], #16 /* x5 = argv[13], x6 = argv[14] */
        ldr     x7, [c20]          /* x7 = argv[15] */
		add     c20, c20, #16      /* Move to the start of the stack args */

        /* Now C20 points to stack args */

        /* Directly call the fucntion if no args in stack */
        cmp     x21, #0
        beq     call_func

        /* Fill all stack args: reserve stack space and fill one by one */
        mov     c23, csp
        bicflgs csp, c23, #15    /* Ensure stack is 16 bytes aligned */
        lsl     x23, x21, #3     /* x23 = nstacks * 8 */
        add     x23, x23, #15    /* x23 = (x23 + 15) & ~15 */
        bic     x23, x23, #15
		
		neg     x24, x23
		add     csp, csp, x24
		
        /* sub     csp, csp, x23   */ /* here reg n23 is the amount of extra stack we need */
       
	   mov     c23, csp		/* Now reg n23 is being used for our new stack */

loop_stack_args:                 /* copy stack arguments to stack */
        cmp     x21, #0
        beq     call_func
        ldr     x24, [c20], #8	/* c20 is argv inputs src */
        str     x24, [c23], #8	/* c23 is stack copy dest */
        sub     x21, x21, #1
        b       loop_stack_args

call_func:
        mov     c20, c30         /* save LR (c30) */
        blr     c19
        mov     csp, c22          /* restore sp which is saved before calling fuction*/

return:
        mov     c30,  c20              /* restore LR (c30) */
        ldp     c19, c20, [csp, #0x40]  /* restore the registers in stack */
        ldp     c21, c22, [csp, #0x20]
        ldp     c23, c24, [csp, #0x0]
        add     csp, csp, #0x60          /* restore sp */
        ret


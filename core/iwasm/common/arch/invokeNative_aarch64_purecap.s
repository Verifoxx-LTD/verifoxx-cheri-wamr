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
 * C0 (function ptr) - as capability, exec_env ptr
 * C1 argv (all arguments) - as capability, pointer to all args
 * x2 stack space used in bytes - uint32_t as 64 bit unsigned
 */

/* Structure of argv for AARCH64 purecap is different than other archs, and is as follows:
 * argv[0..15]     : CPtr exec_env (128-bit), exec_env (WASMExecEnv *)
 * argv[16..79]    : float or double, passed as uint64_t 					( 8 registers on Aarch64)
 * argv[80..207]   : integers or pointers, passed as 128-bit capability		(8 registers on Aarch64)
 * argv[208..463+] : stack args, passed as either uint64_t or 128-bit capability
 *					Note: Stack args will be aligned as per C call standard for Morello
 *					- 64-bit aligned for non-cap-ptr, 128-bit aligned for cap-ptr
 */
 
 /* NOTE: Need to check if the capability pointer argv[8] is preserved when passed as integer */
 
        stp     c19, c20, [csp, #-32]! 	/* save the registers - as full capability */
        stp     c21, c22, [csp, #-32]!
        stp     c23, c24, [csp, #-32]!

        mov     c19, c0          /* C19 = function ptr (cptr) */
        mov     c20, c1          /* C20 = argv (cptr) */
        mov     x21, x2          /* x21 = stack used in bytes (uint64) */
        mov     c22, csp         /* save the Csp before call function */

		ldr   	c0, [c20], #16	/* c0 = exec_env */
		
        /* Fill in float-point registers - these are standard 64 bit */
        ldp     d0, d1, [c20], #16 /* d0 = argv[0], d1 = argv[1] */
        ldp     d2, d3, [c20], #16 /* d2 = argv[2], d3 = argv[3] */
        ldp     d4, d5, [c20], #16 /* d4 = argv[4], d5 = argv[5] */
        ldp     d6, d7, [c20], #16 /* d6 = argv[6], d7 = argv[7] */

        /* Fill integer registers, as capabilities */
        ldp     c1, c2, [c20], #32 /* x1 = argv[9], x2 = argv[10] */
        ldp     c3, c4, [c20], #32 /* x3 = argv[11], x4 = argv[12] */
        ldp     c5, c6, [c20], #32 /* x5 = argv[13], x6 = argv[14] */
        ldr     c7, [c20], #16     /* x7 = argv[15] and move to the start of the stack args */

        /* Now C20 points to stack args */

        /* Directly call the fucntion if no args in stack */
        cmp     x21, #0
        beq     call_func

        /* Fill all stack args: reserve stack space and fill one by one
			Note: Stack space is in BYTES.  Will be aligned to at least a 64-bit value.
		*/
        mov     c23, csp
        bicflgs csp, c23, #15    /* Ensure stack is 16 bytes aligned */
        add     x21, x21, #15    /* x23 = (x21 + 15) & ~15 - alignment */
        bic     x21, x21, #15
		
		neg     x24, x21
		add     csp, csp, x24	/* Make stack space by subtract amount of bytes needed */
		
		mov     c23, csp		/* Now reg c23 is being used for our new stack dest */

loop_stack_bytes:                 /* copy stack data to stack */
        cmp     x21, #0			/* x21 is aligned data needed (aligned up) */
        beq     call_func
        ldr     c24, [c20], #16	/* c20 is argv inputs src, copy 16 bytes at a time */
        str     c24, [c23], #16	/* c23 is stack copy dest, copy 16 bytes at a time */
        sub     x21, x21, #16
        b       loop_stack_bytes

call_func:
        mov     c20, c30         /* save LR (c30) */
        blr     c19
        mov     csp, c22          /* restore sp which is saved before calling fuction*/

return:
        mov     c30,  c20              /* restore LR (c30) */
        
		ldp     c23, c24, [csp], #32
        ldp     c21, c22, [csp], #32
        ldp     c19, c20, [csp], #32  /* restore the registers in stack */

        ret     c30

// Trampoline entry point

.extern CompartmentUnwrap
    .globl CompartmentEntryPoint;
    .balign 16;
    .type CompartmentEntryPoint, %function;

CompartmentEntryPoint:
    .cfi_startproc

    B CompartmentUnwrap

    .cfi_endproc;
    .size CompartmentEntryPoint, .-CompartmentEntryPoint;

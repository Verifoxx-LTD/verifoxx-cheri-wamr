// Implement cheri syscall overrides

#include "cheri_compartment_temp_syscalls.h"

#include "bh_log.h"
#include <stddef.h>

// Make a bit less than stack size as used - but still a massive number
#define COMPARTMENT_STACK_SIZE  ((1024LL * 1024LL) >> 1)

int cheri_pthread_attr_getstack(const pthread_attr_t* attr, void** stackaddr, size_t *stacksize)
{
    // If not running restricted, just call the libc function
    if (0 != (cheri_perms_get(cheri_pcc_get()) & ARM_CAP_PERMISSION_EXECUTIVE))
    {
        // running in executive - delegate to the system call
        return pthread_attr_getstack(attr, stackaddr, stacksize);
    }

    LOG_VERBOSE("cheri_pthread_attr_getstack(): Running in restricted, so faking stack settings");

    // Get the stack pointer - i.e the RCSP - which is TOS
    volatile register uintptr_t c0 asm("c0");

    asm("mov %[c0], csp\n"
        : [c0]"+C"(c0)
        : );

    *stackaddr = (uint8_t*)c0 - (ptrdiff_t)COMPARTMENT_STACK_SIZE;
    *stacksize = COMPARTMENT_STACK_SIZE;

    LOG_VERBOSE("cheri_pthread_attr_getstack(): setting stackaddr=%#p and size=%d", *stackaddr, *stacksize);

    return 0;
}

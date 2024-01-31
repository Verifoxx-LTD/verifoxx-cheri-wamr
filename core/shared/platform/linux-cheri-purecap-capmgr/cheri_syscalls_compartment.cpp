// Implement cheri syscall overrides for compartment

#if !ENABLE_CHERI_PURECAP || !ENABLE_CHERI_COMPARTMENT
#error "This file only valid within a compartment"
#endif

#include "cheri_syscalls.h"
#include "service_call_proxy.h"

#include "bh_log.h"
#include <stddef.h>

// Fake stack size as used - large number
#define COMPARTMENT_STACK_SIZE_FAKE  ((1024LL * 1024LL) >> 1)

//@ToDo: This should call into the capability manager, but there is currently no mechanism
// to obtain the compartment's stack bottom and size.  This requires making a list of all active
// compartments and then using the compartments ID to retrive the settings
extern "C" int cheri_pthread_attr_getstack(const pthread_attr_t * attr, void** stackaddr, size_t * stacksize)
{
    LOG_VERBOSE("cheri_pthread_attr_getstack(): Running in restricted, so faking stack settings");

    // Get the stack pointer - i.e the RCSP - which is TOS
    volatile register uintptr_t c0 asm("c0");

    asm("mov %[c0], csp\n"
        : [c0] "+C"(c0)
        : );

    *stackaddr = (uint8_t*)c0 - (ptrdiff_t)COMPARTMENT_STACK_SIZE_FAKE;
    *stacksize = COMPARTMENT_STACK_SIZE_FAKE;

    LOG_VERBOSE("cheri_pthread_attr_getstack(): setting stackaddr=%#p and size=%d", *stackaddr, *stacksize);

    return 0;
}

// Implement cheri syscall overrides

#include "cheri_syscalls.h"

extern "C" int cheri_pthread_attr_getstack(const pthread_attr_t * attr, void** stackaddr, size_t * stacksize)
{
    // As not in compartment, directly call the libc function
    return pthread_attr_getstack(attr, stackaddr, stacksize);
}

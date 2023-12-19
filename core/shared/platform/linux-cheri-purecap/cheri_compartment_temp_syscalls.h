// Temporary system call overrides which should be in the capability manager

#ifndef _CHERI_COMPARTMENT_TEMP_SYSCALLS_H_
#define _CHERI_COMPARTMENT_TEMP_SYSCALLS_H_

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <pthread.h>
#include <cheriintrin.h>

// Override for when running in compartment
int cheri_pthread_attr_getstack(const pthread_attr_t* attr, void** stackaddr, size_t *stacksize);

#endif /* _CHERI_COMPARTMENT_TEMP_SYSCALLS_H_ */

// Temporary system call overrides which should be in the capability manager

#ifndef _CHERI_SYSCALLS_H_
#define _CHERI_SYSCALLS_H_

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

// Must override and call capmgr if running in compartment
int cheri_pthread_attr_getstack(const pthread_attr_t* attr, void** stackaddr, size_t *stacksize);

#ifdef __cplusplus
}
#endif

#endif /* _CHERI_SYSCALLS_H_ */

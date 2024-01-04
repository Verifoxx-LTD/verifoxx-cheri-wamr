// Helper class to build capabilities

#ifndef _CCAPABILITY__
#define _CCAPABILITY__

#include <iostream>
#include <string>
#include <cstdio>
#include <cheriintrin.h>
#include <cstddef>

class Capability
{

private:
    void* m_cap;

public:
    Capability() : m_cap(nullptr) {}

    Capability(void* c)
        : m_cap(c) {}

    Capability(uintptr_t c)
        : m_cap(reinterpret_cast<void*>(c)) {}

    template <typename T>
    Capability& SetAddress(T* addr) {
        m_cap = cheri_address_set(m_cap, reinterpret_cast<uintptr_t>(addr));
        return *this;
    }

    // This sets the base and length of the capability, but also sets the address to the base,
    // because the original address may be out of the new bounds.
    Capability& SetBounds(void* base, size_t length) {
        m_cap = cheri_address_set(m_cap, reinterpret_cast<uintptr_t>(base));
        m_cap = cheri_bounds_set(m_cap, length);
        return *this;
    }

    // Set the bounds to whatever the bounds are of the target capability which must be
    // within the range of the existing capability, and set the address to the other capability
    Capability& SetBoundsAndAddress(const Capability &other_cap) {
        m_cap = cheri_address_set(m_cap, cheri_base_get(other_cap.m_cap));            // Restrict lower bound to same as other
        m_cap = cheri_bounds_set(m_cap, cheri_length_get(other_cap.m_cap));           // Restrict upper bound same as other
        m_cap = cheri_offset_set(m_cap, cheri_offset_get(other_cap.m_cap));           // Current offset (like address) same as other
        return *this;
    }

    Capability& SetBounds(uintptr_t base, size_t length) {
        return SetBounds(reinterpret_cast<void*>(base), length);
    }

    Capability& SetPerms(size_t perms) {
        m_cap = cheri_perms_and(m_cap, perms);
        return *this;
    }

    Capability& SEntry() {
        m_cap = cheri_sentry_create(m_cap);
        return *this;
    }

    // Derive bounds, address, perms and sentry from an existing capability (passed as void *)
    // and any supplied perms
    // Will restrict bounds to new cap only if existing bounds are within this range
    // Note: A little complex which is needed to restict the range to exactly the cap passed in
    Capability& DeriveFromCap(void *p, size_t set_perms=0, size_t clear_perms=0) {

        // If requested, make sure p is within range of existing
        if (cheri_base_get(p) >= cheri_base_get(m_cap) &&
            (cheri_length_get(p) + cheri_base_get(p)) <= (cheri_length_get(m_cap) + cheri_base_get(m_cap)))
        {
            m_cap = cheri_address_set(m_cap, cheri_base_get(p));            // Restrict lower bound to same as p
            m_cap = cheri_bounds_set(m_cap, cheri_length_get(p));           // Restrict upper bound same as p
            m_cap = cheri_offset_set(m_cap, cheri_offset_get(p));           // Current offset (like address) same as p
        }
        else
        {
            m_cap = cheri_address_set(m_cap, cheri_address_get(p));
        }

        size_t desired_perms = cheri_perms_get(p);
        m_cap = cheri_perms_and(m_cap, desired_perms | set_perms);
        m_cap = cheri_perms_clear(m_cap, clear_perms);
        if (cheri_is_sentry(p))
        {
            m_cap = cheri_sentry_create(m_cap);
        }
        return *this;
    }

    bool IsValid() {
        return cheri_tag_get(m_cap) != 0;
    }

    operator void*() const {
        return m_cap;
    }

    operator uintptr_t() const {
        return reinterpret_cast<uintptr_t>(m_cap);
    }

    friend std::ostream& operator<<(std::ostream& ostr, const Capability& cap)
    {
        char buff[256];
        snprintf(buff, sizeof(buff), "%#p", cap.m_cap);

        ostr << std::string(buff);

        return ostr;
    }

};

#endif /* _C_CAPABILITY__ */

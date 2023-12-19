// Range: Simple range structure type

#ifndef __RANGE_H_
#define __RANGE_H_

#include <cstddef>
#include <cstdint>
#include <iostream>

// Basic range class
struct Range
{
    uintptr_t base; // Base address.
    uintptr_t top;  // Top address, exclusive (one byte after the last byte in the range).

    Range() : Range(reinterpret_cast<uintptr_t>(reinterpret_cast<void*>(0)), 0) {}
    Range(uintptr_t addr, size_t sz) : base(addr), top(base + sz) {}

    size_t Size() const
    {
        return top > base ? top - base : 0;
    }

    bool Intersects(const Range& other) const
    {
        return base < other.top&& other.base < top;
    }

    bool Contains(const Range& other) const
    {
        return base <= other.base && other.top <= top;
    }

    bool Contains(uintptr_t addr) const
    {
        return base <= addr && addr < top;
    }

    friend std::ostream& operator<<(std::ostream& o, const Range& r) {
        auto f{ o.flags() };
        o << std::hex << std::showbase << "[" << r.base << ", " << r.top << "]";
        o.flags(f);
        return o;
    }

};

#endif /* __RANGE_H_ */

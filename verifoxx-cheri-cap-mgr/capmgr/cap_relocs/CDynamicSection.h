// CDynamicSection: Represents the dynamic section of the ELF

#ifndef __CDYNAMICSECTION_H_
#define __CDYNAMICSECTION_H_

#include <string>
#include <map>
#include <iostream>

#include "CCapMgrLogger.h"
#include "shared_object_common.h"
#include "Range.h"

using namespace CapMgr;

// CDynamicSection: The shared objects dynamic section map, where we map
// by tag to absolute address.
class CDynamicSection
{
private:
    bool m_readonly;
    uint8_t *m_base;                    // Base address
    std::map<Elf64_Sxword, Elf64_Addr> m_secmap;

    //Get entry and throw if not found
    Elf64_Addr GetEntry(Elf64_Sxword tag) const
    {
        return m_secmap.at(tag);
    }

public:
    CDynamicSection() {}
    CDynamicSection(elfptr_t base_addr, Elf64_Addr vaddr,
        Elf64_Xword mem_size, bool dyn_readonly);

    // Getter functions to read the section.
    // Different types are supported: ranges (address + size), values, address (without size e.g C strings)
    // They throw on not found.

    // Have separate functions as shown

    Range GetPltRel(bool &isRela, size_t &elem_size) const;    // Returns is Rela or rel by ref
    Range GetRelRel(size_t &elem_size) const;
    Range GetRelaRel(size_t &elem_size) const;

    Range GetStrTab() const;
    Range GetSymTab() const;


    std::string GetSoName() const;

    uintptr_t GetHashAddr() const;

    Range GetInitFn() const;
    Range GetFiniFn() const;
    Range GetInitArray() const;
    Range GetFiniArray() const;

    // Stream out whole thing
    friend std::ostream& operator<<(std::ostream& ostr, const CDynamicSection& dynsec)
    {
        for (const auto& entry : dynsec.m_secmap)
        {
            L_(VERBOSE) << "{0x" << std::dec << entry.first << "->0x" << std::hex << entry.second << "}";
        }

        return ostr;
    }

};

#endif /* __CDYNAMICSECTION_H_ */

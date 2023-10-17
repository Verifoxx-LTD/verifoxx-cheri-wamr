// CSharedObject.h: Declaration for the shared object handling class, which processes ELF program headers

#ifndef __CSHARED_OBJECT_H_
#define __CSHARED_OBJECT_H_

#include <string>
#include <iostream>
#include <map>
#include <vector>
#include <memory>

#include "shared_object_common.h"
#include "CCapability.h"
#include "CDynamicSection.h"
#include "CRelocationTable.h"

// CSharedObject: Info about single shared object loaded from the Dlopen
class CSharedObject
{
private:
    Capability  m_base;                 // Base address
    std::string m_name_full;            // SO name

    std::multimap<Elf64_Word, Elf64_Phdr> m_phdrs;    // Individual phdrs, keyed by type

    CDynamicSection m_dynsec;           // Dynamic section created after phdrs

    bool m_loaded = false;                      // Loaded yet?
    uint64_t    m_page_size;

    // Pointers to all the different relocation tables for the so;
    std::vector<std::shared_ptr<CRelocationTable>>  m_reloctables;

    // ProtectBlock: mprotect() the phdr block either to restore original or to provided protection flags
    bool ProtectBlock(const Elf64_Phdr& phdr, bool restore_original = true, int64_t prot_required = PROT_NONE) const;

    // ProtectAllBlocks: Change the protection for all blocks matching the given type to the given value / original
    bool ProtectAllBlocks(Elf64_Word type, bool restore_original = true, int64_t prot_required = PROT_NONE) const;

    // Generate a dynamic section from the loaded data
    CDynamicSection parseDynamicSection() const;



public:
    CSharedObject() {}
    // fullcap is a capability with needed permissions - used to construct base
    CSharedObject(const std::string& so_name, const Capability& base_addr) :
        m_name_full(so_name), m_base(base_addr), m_page_size(getpagesize()) {}

    // Load phdr data
    // Fixup cap is a capability which will be used to derive all the fixed up caabilities
    // It should have range of all so sections
    void Load(const Elf64_Phdr* phdrs, Elf64_Half num_hdrs, const Capability &fixup_cap);

    elfptr_t GetBase() const { return m_base; }

    std::string DumpRelocTables() const;

    // Do all the reloc fixups
    // Can make restricted or executive
    bool DoLibCapFixups(bool makeRestricted) const;

    // Stream out whole thing
    friend std::ostream& operator<<(std::ostream& ostr, const CSharedObject& soinfo)
    {
        if (soinfo.m_loaded)
        {
            ostr << "{Actual libname=" << soinfo.m_name_full << "}" << std::endl;

            ostr << "{Base addr=" << soinfo.m_base << "}" << std::endl;

            for (const auto& phdr_entry : soinfo.m_phdrs)
            {
                auto phdr{ &phdr_entry.second };

                ostr << "{Hdr: Type=0x" << phdr->p_type
                    << " Flags=0x" << phdr->p_flags
                    << " Offset=0x" << phdr->p_offset
                    << " vaddr=0x" << phdr->p_vaddr
                    << " paddr=0x" << phdr->p_paddr
                    << " filesz=0x" << phdr->p_filesz
                    << " memsz=0x" << phdr->p_memsz
                    << " alignment=0x" << phdr->p_align
                    << "}" << std::endl;
            }
        }

        ostr << "]";
        return ostr;
    }
};


#endif /* __CSHARED_OBJECT_H_ */

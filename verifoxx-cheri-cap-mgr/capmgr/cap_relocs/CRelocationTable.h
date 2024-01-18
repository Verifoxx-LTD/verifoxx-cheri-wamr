// CRelocationTable: Virtual and actual classes for different types of relocation table info.

#ifndef __CRELOCATIONTABLE_H_
#define __CRELOCATIONTABLE_H_

#include <string>
#include <iostream>
#include <vector>

#include "shared_object_common.h"
#include "Range.h"
#include "CDynamicSection.h"

// A relocation table either .rela.dyn or .rela.plt
// Note dynamic tags of interest:
// DT_JMPREL    => address of plt relocs
// DT_PLTREL    => type of plt relocs   (set to DT_RELA or DT_REL it seems)
// DT_PLTRELSZ  => byte size of plt relocs

// DT_REL   => address of rel relocs
// DT_RELSZ => total size of rel relocs
// DT_RELENT=> size of one rel reloc

// DT_RELA  => address of rela relocs
// DT_RELASZ => total sie of rela relocs
// DT_RELAENT => size of one rela reloc

// CRelocationTable: Virtual base for common reltable fns
class CRelocationTable
{
    // Morello IDs which are interested in
    static const std::map< Elf64_Xword, std::string> m_reloc_id_map;

protected:
    // Need to find out if RELA or REL
    const CDynamicSection& m_dynsec;
    elfptr_t m_base;                    // Base address
    const Capability m_fixup_cap;       // Capability to use for fixup addresses (should have range of ALL shared objects)

    virtual Range GetRelTableRange(size_t& elem_size) const = 0; // Range for this reltable
    virtual bool IsRela() const = 0;            // True means this is a relA table, false is rel
    const std::string m_tabname;

    Range CheckAndGetRange() const;

    // Given an r_info field, check if the reloc type is one of those which needs fixing up
    bool RelocTypeNeedFixUp(Elf64_Xword r_info) const
    {
        return (m_reloc_id_map.count(ELF64_R_TYPE(r_info)) != 0);
    }

public:
    CRelocationTable(const CDynamicSection& dynsec, elfptr_t elf_base_addr, const std::string &&tab_name, const Capability &fixup_cap) :
        m_dynsec{ dynsec }, m_base{ elf_base_addr }, m_tabname{ tab_name }, m_fixup_cap{ fixup_cap } {}

    friend std::ostream& operator<<(std::ostream& ostr, const CRelocationTable& reltable)
    {
        size_t elem_size;
        Range range = reltable.GetRelTableRange(elem_size);

        ostr << "{Name=" << reltable.m_tabname << " Range=" << range
            << " elem_size=" << elem_size << " is_rela=" << reltable.IsRela() << " }";
        return ostr;
    }

    // Dump the whole table to a string
    std::string DumpTable() const;

    // Patch-up target caps
    // Can supply ignore range and choose if to set restricted or to executive
    bool PatchCaps(const std::vector<Range>& unmodify_ranges = {}, bool makeRestricted=true) const;

    // Check if an address is valid, reject if it is within one of the skip ranges
    static bool IsValid(uintptr_t *pAddress, const std::vector<Range>& unmodify_ranges);

    // Work out the fixup value from the base cap
    uintptr_t DeriveFixupValue(uintptr_t val_to_fixup, bool makeRestricted = true) const
    {
        auto cap = Capability(m_fixup_cap)
            .DeriveFromCap(reinterpret_cast<void*>(val_to_fixup),
                makeRestricted ? 0 : ARM_CAP_PERMISSION_EXECUTIVE,  // Perms we explicitly want to add
                makeRestricted ? ARM_CAP_PERMISSION_EXECUTIVE : 0   // Perms we explicitly want to remove
            );
            
        return cap;
    }
};

// .rela.dyn table
class CRelaDyn : public CRelocationTable
{

    virtual Range GetRelTableRange(size_t& elem_size) const
    {
        return m_dynsec.GetRelaRel(elem_size);
    }

    virtual bool IsRela() const
    {
        return true;
    }

public:
    CRelaDyn(const CDynamicSection& dynsec, elfptr_t elf_base_addr, const Capability &fixup_cap) :
        CRelocationTable(dynsec, elf_base_addr, ".rela.dyn", fixup_cap) {}
};

// .rel.dyn
class CRelDyn : public CRelocationTable
{
    virtual Range GetRelTableRange(size_t& elem_size) const
    {
        return m_dynsec.GetRelRel(elem_size);
    }

    virtual bool IsRela() const
    {
        return false;
    }

public:
    CRelDyn(const CDynamicSection& dynsec, elfptr_t elf_base_addr, const Capability& fixup_cap) :
        CRelocationTable(dynsec, elf_base_addr, ".rel.dyn", fixup_cap) {}

};

//.plt.rel(a)
class CPltRel : public CRelocationTable
{
    bool m_is_rela;
    size_t m_elem_size;
    Range m_plt_range;

    virtual Range GetRelTableRange(size_t& elem_size) const
    {
        elem_size = m_elem_size;
        return m_plt_range;
    }

    virtual bool IsRela() const
    {
        return m_is_rela;
    }

public:
    CPltRel(const CDynamicSection& dynsec, elfptr_t elf_base_addr, const Capability& fixup_cap) :
        CRelocationTable(dynsec, elf_base_addr, ".rel(a).plt", fixup_cap)
    {
        // In the constructor we get the table so we can read the rela flag
        m_plt_range = m_dynsec.GetPltRel(m_is_rela, m_elem_size);
    }
};

#endif /* __CRELOCATIONTABLE_H_ */

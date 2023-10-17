// Implements CRelocationTable

#include <cheriintrin.h>
#include <sstream>
#include <string>

#include "Range.h"
#include "CCapability.h"
#include "CRelocationTable.h"
#include "CCapMgrException.h"

const std::map< Elf64_Xword, std::string> CRelocationTable::m_reloc_id_map = {
    {R_MORELLO_CAPINIT, "R_MORELLO_CAPINIT"},
    {R_MORELLO_GLOB_DAT, "R_MORELLO_GLOB_DAT"},
    {R_MORELLO_JUMP_SLOT, "R_MORELLO_JUMP_SLOT"},
    {R_MORELLO_RELATIVE, "R_MORELLO_RELATIVE"}
};

Range CRelocationTable::CheckAndGetRange() const
{
    size_t elem_size;
    Range range{ GetRelTableRange(elem_size) };

    size_t actual_elem_size = IsRela() ? sizeof(Elf64_Rela) : sizeof(Elf64_Rel);

    // Check elem size
    if (elem_size != actual_elem_size)
    {
        throw CCapMgrException("Element size from dynamic section dRanoes not match expected structure size of relocation data!");
    }

    // Check range
    if ((range.Size() % actual_elem_size) != 0)
    {
        throw CCapMgrException("Table is not an exact multiple of whole elements!");
    }

    return range;
}

std::string CRelocationTable::DumpTable() const
{
    std::stringstream strstr;

    // Get table dynamics along with check
    Range range{ CheckAndGetRange() };

    uint8_t* start = reinterpret_cast<uint8_t*>(range.base);
    uint8_t* stop = reinterpret_cast<uint8_t*>(range.top);

    strstr << "[Table: " << m_tabname << std::endl;
    while (start < stop)
    {
        Elf64_Rela* p = reinterpret_cast<Elf64_Rela*>(start);

        std::string reloctype{ RelocTypeNeedFixUp(p->r_info) ? CRelocationTable::m_reloc_id_map.at(ELF64_R_TYPE(p->r_info)) : "<not/care>" };

        strstr << "{offset=0x" << std::hex << p->r_offset << "(address = " << Capability(m_base + p->r_offset)
            << ") info=0x" << p->r_info << "(type=" << reloctype << ")";

        if (IsRela())
        {
            strstr << " addend=0x" << p->r_addend;
            start += sizeof(Elf64_Rela);
        }
        else
        {
            start += sizeof(Elf64_Rel);
        }

        strstr << "}" << std::endl;
    }

    strstr << std::endl << "]";
    return strstr.str();
}

bool CRelocationTable::PatchCaps(const std::vector<Range> &unmodify_ranges, bool makeRestricted) const
{
    /* For each relocation symbol in the table:
        (1) Check relocation type, if not one we care about then move on.
        (2) else resolve the full target address.
        (3) read the value at the target address.
        (4) if it is a valid capability (with tag) clear executive permission and set bounds(todo)
     */
     // Get table dynamics along with check
    Range range{ CheckAndGetRange() };

    uint8_t* start = reinterpret_cast<uint8_t*>(range.base);
    uint8_t* stop = reinterpret_cast<uint8_t*>(range.top);

    size_t increment = IsRela() ? sizeof(Elf64_Rela) : sizeof(Elf64_Rel);

    // Flag to note quick skip of range checks
    bool skip_range_checks = unmodify_ranges.empty() ? true : false;

    while (start < stop)
    {
        Elf64_Rela* p = reinterpret_cast<Elf64_Rela*>(start);

        // Check cap type
        if (RelocTypeNeedFixUp(p->r_info))
        {

            // Resolve target address
            uintptr_t* pAddress = reinterpret_cast<uintptr_t*>(m_base + p->r_offset);

            // Check if it is needed for reloc
            if (!skip_range_checks && !CRelocationTable::IsValid(pAddress, unmodify_ranges))
            {
                std::cout << "[Fixup cap: offset=0x" << std::hex << p->r_offset << " type="
                    << CRelocationTable::m_reloc_id_map.at(ELF64_R_TYPE(p->r_info)) << " target addr="
                    << Capability(pAddress) << " - SKIPPED NOT IN RANGE]" << std::endl;
            }
            else
            {
                uintptr_t val_to_fixup = *pAddress;

                if (!cheri_tag_get(val_to_fixup))
                {
                    std::cout << "[Fixup cap: offset=0x" << std::hex << p->r_offset << " type="
                        << CRelocationTable::m_reloc_id_map.at(ELF64_R_TYPE(p->r_info)) << " target addr="
                        << Capability(pAddress) << " - SKIPPED NO VALID TAG]" << std::endl;
                }
                else
                {
                    std::cout << "[Fixup cap: offset=0x" << std::hex << p->r_offset << " type="
                        << CRelocationTable::m_reloc_id_map.at(ELF64_R_TYPE(p->r_info)) << " target addr="
                        << Capability(pAddress);

                    // Only proceed if valid tag found
                    std::cout << " curr_val=" << Capability(reinterpret_cast<void*>(val_to_fixup));

                    // We will derive a capability from the base.  Set address, bounds and perms to what is already there except
                    // optionally set executive perm too.

                    val_to_fixup = DeriveFixupValue(val_to_fixup, makeRestricted);

                    *pAddress = val_to_fixup;
                    std::cout << " new_val=" << Capability(reinterpret_cast<void*>(*pAddress)) << "]" << std::endl;
                }
            }
        }

        start += increment;
    }

    return true;
}

// Check if address is in one of the given ranges - if so, it isn't valid for reloc
bool CRelocationTable::IsValid(uintptr_t *pAddress, const std::vector<Range>& unmodify_ranges)
{
    Range address_as_range(reinterpret_cast<uintptr_t>(pAddress), sizeof(uintptr_t*));
    for (const auto& range : unmodify_ranges)
    {
        if (range.Intersects(address_as_range))
        {
            return false;
        }
    }
    return true;
}

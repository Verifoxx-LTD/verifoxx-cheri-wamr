// Implements CDynamicSection

#include <cheriintrin.h>

#include "CDynamicSection.h"
#include "CCapMgrException.h"

CDynamicSection::CDynamicSection(elfptr_t base_addr, Elf64_Addr vaddr,
    Elf64_Xword mem_size, bool dyn_readonly) : m_base(reinterpret_cast<uint8_t*>(base_addr)), m_readonly(dyn_readonly)
{
    // Get a pointer to the dynamic area
    auto section_base = reinterpret_cast<uint8_t*>(base_addr);
    auto dyn_addr_start = reinterpret_cast<Elf64_Dyn*>(&section_base[vaddr]);
    auto dyn_addr_end = reinterpret_cast<Elf64_Dyn*>(&section_base[vaddr + mem_size]);

    // Traverse the elements
    while (dyn_addr_start < dyn_addr_end)
    {
        m_secmap[dyn_addr_start->d_tag] = dyn_addr_start->d_un.d_ptr;
        dyn_addr_start++;
    }
}

Range CDynamicSection::GetPltRel(bool& isRela, size_t& elem_size) const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_JMPREL));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_PLTRELSZ));

    Elf64_Addr pltrel_type = GetEntry(DT_PLTREL);

    isRela = (pltrel_type == DT_RELA) ? true : false;

    if (isRela)
    {
        elem_size = reinterpret_cast<size_t>(GetEntry(DT_RELAENT));
    }
    else
    {
        elem_size = reinterpret_cast<size_t>(GetEntry(DT_RELENT));
    }

    return Range(addr, sz);

}

Range CDynamicSection::GetRelRel(size_t& elem_size) const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_REL));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_RELSZ));
    elem_size = reinterpret_cast<size_t>(GetEntry(DT_RELENT));

    return Range(addr, sz);
}

Range CDynamicSection::GetRelaRel(size_t& elem_size) const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_RELA));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_RELASZ));
    elem_size = reinterpret_cast<size_t>(GetEntry(DT_RELAENT));

    return Range(addr, sz);
}

Range CDynamicSection::GetStrTab() const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_STRTAB));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_STRSZ));
    return Range(addr, sz);
}

Range CDynamicSection::GetSymTab() const
{
    throw CCapMgrException("GetSymTab(): not implemented yet!");
}

std::string CDynamicSection::GetSoName() const
{
    auto strtab_info = GetStrTab();
    char* addr = reinterpret_cast<char*>(strtab_info.base);
    return std::string(&addr[GetEntry(DT_SONAME)]);
}

uintptr_t CDynamicSection::GetHashAddr() const
{
    return reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_HASH));
}

Range CDynamicSection::GetInitFn() const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_INIT));
    size_t sz = sizeof(void*);
    return Range(addr, sz);
}

Range CDynamicSection::GetFiniFn() const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_FINI));
    size_t sz = sizeof(void*);
    return Range(addr, sz);
}

Range CDynamicSection::GetInitArray() const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_INIT_ARRAY));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_INIT_ARRAYSZ));
    return Range(addr, sz);
}

Range CDynamicSection::GetFiniArray() const
{
    uintptr_t addr = reinterpret_cast<uintptr_t>(m_base + GetEntry(DT_FINI_ARRAY));
    size_t sz = reinterpret_cast<size_t>(GetEntry(DT_FINI_ARRAYSZ));
    return Range(addr, sz);
}


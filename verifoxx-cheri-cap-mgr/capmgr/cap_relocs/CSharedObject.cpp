// Implements CSharedObject

#include <cheriintrin.h>
#include <vector>
#include <sstream>

#include "CCapMgrLogger.h"

#include "CSharedObject.h"
#include "CCapMgrException.h"
#include "CRelocationTable.h"

using namespace CapMgr;

void CSharedObject::Load(const Elf64_Phdr* phdrs, Elf64_Half num_hdrs, const Capability& fixup_cap)
{
    if (m_loaded)
    {
        return;    // Already loaded
    }

    // Iterate all phdrs and add to vector
    for (uint32_t i = 0; i < num_hdrs; ++i)
    {
        m_phdrs.insert(std::make_pair(phdrs[i].p_type, phdrs[i]));
    }

    m_loaded = true;

    if (m_phdrs.empty())
    {
        return; // Nothing to do
    }

    // Set up sections
    m_dynsec = parseDynamicSection();

    // Build list of relocation tables now we have our section
    m_reloctables = {
        std::make_shared<CPltRel>(m_dynsec, GetBase(), fixup_cap),
        std::make_shared<CRelDyn>(m_dynsec, GetBase(), fixup_cap),
        std::make_shared<CRelaDyn>(m_dynsec, GetBase(), fixup_cap)
    };
}

// Generate a dynamic section from the loaded data
CDynamicSection CSharedObject::parseDynamicSection() const
{
    if (!m_loaded)
    {
        throw CCapMgrException("Call Load() before parseDynamicSection()");
    }

    if (m_phdrs.count(PT_DYNAMIC) != 1)
    {
        throw CCapMgrException("Zero, or duplicate, PT_DYNAMIC headers");
    }

    auto& phdr_ref = m_phdrs.find(PT_DYNAMIC)->second;

    bool dyn_readonly = true;

#ifndef DL_RO_DYN_SECTION
    dyn_readonly = ((phdr_ref.p_flags & PF_W) == 0);
#endif

    L_(DEBUG) << "parseDynamicSection: readonly flag=" << dyn_readonly;

    return CDynamicSection(m_base, phdr_ref.p_vaddr, phdr_ref.p_memsz, dyn_readonly);
}

bool CSharedObject::ProtectAllBlocks(Elf64_Word type, bool restore_original, int64_t prot_required) const
{
    // Find matches
    auto itrs = m_phdrs.equal_range(type);
    bool result = true;

    for (auto itr = itrs.first; itr != itrs.second; ++itr)
    {
        // Keep going on error
        result &= ProtectBlock(itr->second, restore_original, prot_required);
    }
    return result;
}

bool CSharedObject::ProtectBlock(const Elf64_Phdr& phdr, bool restore_original, int64_t prot_required) const
{
    // Get the address of the start of the block and the size
    void* base = m_base;
    uint8_t* block_start = &(reinterpret_cast<uint8_t*>(base))[phdr.p_vaddr];
    uint8_t* block_aligned = cheri_align_down(block_start, m_page_size);

    size_t sz = phdr.p_memsz + reinterpret_cast<ptrdiff_t>((block_start - block_aligned));

    L_(VERBOSE) << "ProtectBlock: type=" << phdr.p_type << " vaddr_offset=0x" << std::hex << phdr.p_vaddr
        << " size=0x" << phdr.p_memsz << " flags=0x" << phdr.p_flags;

    // Figure out the perms we need
    if (restore_original)
    {
        prot_required = 0;
        if (phdr.p_flags & PF_X)
            prot_required |= PROT_EXEC;

        if (phdr.p_flags & PF_W)
            prot_required |= PROT_WRITE;

        if (phdr.p_flags & PF_R)
            prot_required |= PROT_READ;
    }

    L_(VERBOSE) << "call mprotect(" << Capability(block_aligned) << ", 0x" << sz << ", 0x" << prot_required << ")";
    if (0 != mprotect(block_aligned, sz, prot_required))
    {
        L_(ERROR) << "Block mprotect failed with error: " << strerror(errno);
        return false;
    }
    return true;
}

std::string CSharedObject::DumpRelocTables() const
{
    std::stringstream strstr;

    if (!m_loaded)
    {
        throw CCapMgrException("Shared object is not loaded!");
    }

    strstr << "Relocation Tables for " << m_name_full << ":" << std::endl;
    for (const auto& p_reloc_table : m_reloctables)
    {
        try
        {
            strstr << p_reloc_table->DumpTable();
        }
        catch (std::out_of_range&)
        {
        }
    }

    return strstr.str();

}

// Do all the reloc fixups
bool CSharedObject::DoLibCapFixups(bool makeRestricted) const
{
    if (!m_loaded)
    {
        throw CCapMgrException("Shared object is not loaded!");
    }

    // Build an array of ranges, whereby if the target is within any range then
    // it's capability should not be modified

    // The getters throw on no entry for these in dynamic section
    std::vector<Range> unmodify_ranges;

    try
    {
        unmodify_ranges.push_back(m_dynsec.GetInitFn());
    }
    catch (std::out_of_range&) {}

    try
    {
        unmodify_ranges.push_back(m_dynsec.GetFiniFn());
    }
    catch (std::out_of_range&) {}

    try
    {
        unmodify_ranges.push_back(m_dynsec.GetInitArray());
    }
    catch (std::out_of_range&) {}

    try
    {
        unmodify_ranges.push_back(m_dynsec.GetFiniArray());
    }
    catch (std::out_of_range&) {}

    L_(VERBOSE) << "Make LOAD blocks writable";
    if (!ProtectAllBlocks(PT_LOAD, false, PROT_READ | PROT_WRITE))
    {
        L_(ERROR) << "Failed to mprotect blocks";
        return false;
    }

    for (const auto& p_reloc_table : m_reloctables)
    {
        try
        {
            if (!p_reloc_table->PatchCaps(unmodify_ranges, makeRestricted))
            {
                L_(ERROR) << "Process table FAILED: " << *p_reloc_table;
                return false;
            }
        }
        catch (std::out_of_range&)
        {
        }
    }

    L_(VERBOSE) << "Make LOAD blocks restored to original access settings";
    if (!ProtectAllBlocks(PT_LOAD))
    {
        L_(ERROR) << "Failed to mprotect blocks";
        return false;
    }

    return true;
}

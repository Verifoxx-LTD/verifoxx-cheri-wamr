// Implement CCompartmentLibs
#include <sstream>

#include "CCompartmentLibs.h"
#include "CCapMgrException.h"

#include "CCapMgrLogger.h"
using namespace CapMgr;

#ifndef DT_THISPROCNUM
#define DT_THISPROCNUM DT_AARCH64_NUM
#endif

#include "link_map_internal/link-internal.h"

CCompartmentLibs::CCompartmentLibs(const std::string& so_name, const Capability &base_cap,
    const Capability &fixup_cap, bool load_new_linkmap, bool include_loader) : m_include_loader{include_loader}
{
    std::ostringstream strstr;

    if (load_new_linkmap)
    {
        // Create using new link map if specified
        if (!(m_dll_handle = dlmopen(LM_ID_NEWLM, so_name.c_str(), RTLD_NOW | RTLD_LOCAL)))
        {
            strstr << "Failed dlmopen() " << so_name << " : " << dlerror();
            throw CCapMgrException(strstr.str());
        }

    }
    else
    {
        // Use existing link map
        if (!(m_dll_handle = dlopen(so_name.c_str(), RTLD_NOW | RTLD_LOCAL)))
        {
            strstr << "Failed dlopen() " << so_name << " : " << dlerror();
            throw CCapMgrException(strstr.str());
        }

    }

    // parse link map for all dependent libraries - can throw
    // Returns number loaded.  We expect at least one (the DLL we opened).

    auto numloaded = ParseLinkMap(so_name, base_cap, fixup_cap);
    
    if (numloaded < 1)
    {
        throw CCapMgrException("Did not load any shared libs from linkmap!");
    }

    L_(DEBUG) << "Loaded " << numloaded << " shared objects";
}


int CCompartmentLibs::ParseLinkMap(const std::string &so_name, const Capability &base_cap, const Capability &fixup_cap)
{
    struct link_map* link_map = nullptr;
    std::ostringstream strstr;
    int map_count = 0;

    if (0 != dlinfo(m_dll_handle, RTLD_DI_LINKMAP, &link_map))
    {
        strstr << "Failed get linkmap(): " << dlerror();
        throw CCapMgrException(strstr.str());
    }

    // Although current link map location should be for the lib we loaded, don't assume this
   
    // Iterate the link map - get to start and ignore blank name as this is current exe (if applicable)
    while (link_map && link_map->l_prev)
    {
        link_map = link_map->l_prev;
    }

    // Parse link map from start
    while (link_map)
    {
        Elf64_Addr laddr = link_map->l_addr;
        std::string full_name{ link_map->l_name };

        if (full_name.empty())
        {
            L_(DEBUG) << "Parsing link map skipping application entry";
            
        }
        else
        {
            // Use the internal API of link_map to grab the phdrs
            auto internal_link_map = reinterpret_cast<struct internal_link_map*>(link_map);

            // If l_real is not equal link_map then reject if flagged, as would be the loader
            if ((cheri_address_get(internal_link_map) != cheri_address_get(internal_link_map->l_real)) && !m_include_loader)
            {
                L_(DEBUG) << "Rejecting lib=" << full_name << " as found ld.so";
            }
            else
            {
                // Update pointers in the case we have the loader
                internal_link_map = internal_link_map->l_real;

                auto phdr_ptr = internal_link_map->l_phdr;
                auto phdr_num = internal_link_map->l_phnum;

                // Reject if no headers
                if ( phdr_num == 0 || phdr_ptr == nullptr)
                {
                    L_(DEBUG) << "Rejecting lib=" << full_name << " as no valid phdrs";
                }
                else
                {
                    map_count++;
                    L_(VERBOSE) << "Parsing lib=" << full_name << "...";
                    // Construct the .so and add it to our list
                    // Build the capability from the base address of the DLL
                    // Note: problem is the base won't give us write perms, so source from the parsed in cap

                    Capability cap{ base_cap };

                    if (internal_link_map->l_addr == cheri_address_get(internal_link_map->l_map_start))
                    {
                        cap.SetBoundsAndAddress(Capability(internal_link_map->l_map_start));
                    }
                    else
                    {
                        cap.SetAddress(reinterpret_cast<void*>(laddr));
                    }

                    auto& elem = m_so_map[full_name] = CSharedObject{ full_name,  cap };

                    elem.Load(phdr_ptr, phdr_num, fixup_cap);

                    // Check for match with loaded lib name & save as needed
                    if (m_so_full_name.empty() && CCompartmentLibs::NameMatch(so_name, full_name))
                    {
                        m_so_full_name = full_name;
                    }
                }
            }

        }
        link_map = link_map->l_next;
    }

    return map_count;
}


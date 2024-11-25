// CCompartmentLibs: Operations for handling the fix up of shared objects loaded for the compartment.

#ifndef __CCOMPARTMENTLIBS_H_
#define __CCOMPARTMENTLIBS_H_

#include <iostream>
#include <string>
#include <map>

#include "shared_object_common.h"
#include "comp_common_defs.h"
#include "CSharedObject.h"
#include "CCapability.h"

class CCompartmentLibs
{
private:

    std::map<std::string, CSharedObject> m_so_map;      // All loaded sos for the link map, keyed by full pathname
    void* m_dll_handle = nullptr;                           // Handle of requested DLL
    std::string m_so_full_name;                               // Name of the requested so (resolved)
    bool m_include_loader;

    // Parse the link map and return number of sos loaded
    int ParseLinkMap(const std::string &so_name, const Capability& base_cap, const Capability& fixup_cap);

    static bool NameMatch(const std::string& test_name, const std::string& full_name)
    {
        // Simple check for match
        return (test_name.size() <= full_name.size() &&
            0 == full_name.compare(full_name.size() - test_name.size(), test_name.size(), test_name));
    }

public:
    // Constructor loads all libraries for given so, throws if not found
    // So name is name to load via dlopen()
    // base_cap is used to derive cap for the so (must have write privileges)
    // fixup_cap used to derive cap for all fixup patches (must have range to cover all sos loaded)
    // load_new_linkmap is whether to dlmopen() which will use a new linkmap
    // include_loader is whether to also patch up the ld.so shared object
    CCompartmentLibs(const std::string& so_name, const Capability &base_cap, const Capability &fixup_cap,
        bool load_new_linkmap=true, bool include_loader=false);

    ~CCompartmentLibs()
    {
        if (m_dll_handle)
        {
            dlclose(m_dll_handle); 
            m_dll_handle = nullptr;
        } 
    }

    // Dump reloc tables for any shared object
    std::string DumpRelocTables(const std::string& so) const
    {
        return m_so_map.at(so).DumpRelocTables();
    }

    // Dump reloc tables for all shared object
    std::string DumpRelocTables() const
    {
        std::string dump;
        for (const auto& so : m_so_map)
        {
            dump += so.second.DumpRelocTables();
        }
        return dump;
    }

    // Get DLL symbol by name for the primary loaded shared object 
    void* GetDllSymbolByName(const std::string& name) const
    {
        return dlsym(m_dll_handle, name.c_str());
    }

    void* ResolveSymbolAddr(const std::string& name, const Capability &basecap) const
    {
        // Resolve symbol addr using base cap - symbol in compartment
        void *symb = GetDllSymbolByName(name);
        if (symb)
        {
            auto cap{ basecap };
            cap.SetAddress(symb).SetPerms(CHERI_PERM_LOAD | CHERI_PERM_LOAD_CAP | ARM_CAP_PERMISSION_MUTABLE_LOAD |
                CHERI_PERM_EXECUTE | CHERI_PERM_GLOBAL);
            symb = cap;
            return symb;
        }

        return nullptr;
    }

    // Fixup all capabilities
    // Can set for compartment or capability manager (restricted or executive)
    bool DoAllLibCapFixups(bool makeRestricted=true) const
    {
        for (const auto& so : m_so_map)
        {
            L_(VERBOSE) << "Process LibCapFixups for " << so.first << ":" << std::endl;
            if (!so.second.DoLibCapFixups(makeRestricted))
            {
                return false;
            }
        }
        return true;
    }

    friend std::ostream& operator<<(std::ostream& o, const CCompartmentLibs& obj)
    {
        o << "{main so=" << obj.m_so_full_name << "sos:" << std::endl;
        for (const auto& so : obj.m_so_map)
        {
            o << "{" << so.second << "}" << std::endl;
        }
        o << "}";
        return o;
    }
};

#endif /*__C_COMPARTMENTLIBS_H_ */

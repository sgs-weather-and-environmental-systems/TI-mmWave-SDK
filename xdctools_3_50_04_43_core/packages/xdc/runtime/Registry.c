/*
 *  ======== Registry.c ========
 */
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Text.h>
#include <string.h>

#include "package/internal/Registry.xdc.h"

/* Min and max registry module ids, inclusive. */
#define MAXMID  Text_registryModsLastId
#define MINMID  (Text_unnamedModsLastId + 1)

/*
 *  ======== Registry_addModule ========
 */
Registry_Result Registry_addModule(Registry_Desc *desc, CString modName)
{   
    /* First, verify the module has not already been added to the module. */
    if (Registry_findByName(modName) != NULL) {
        return (Registry_ALREADY_ADDED);
    }
    
    /* First verify there are more module ids available. */
    if (Registry_module->curId == MINMID) {
        return (Registry_ALL_IDS_USED);
    }
    
    /* Create a new "registry" module */
    
    /* Fill out the descriptor. */
    desc->id = Registry_module->curId--;
    desc->modName = modName;
    
    /* 
     * Initialize the new module's mask with the runtime values of the
     * Registry mask. This will enable any bits which are RUNTIME_ON.
     */
    desc->mask = Registry_Module_getMask();
    
    /* Add the descriptor to the current list. */
    desc->next = Registry_module->listHead;
    Registry_module->listHead = desc;
        
    return (Registry_SUCCESS);
}

/*
 *  ======== Registry_findByName ========
 */
Registry_Desc *Registry_findByName(CString name)
{
    return (Registry_findByNameInList(name, Registry_module->listHead));
}

/*
 *  ======== Registry_findByNameInList ========
 */
Registry_Desc *Registry_findByNameInList(CString name,
    Registry_Desc *listHead)
{
    Registry_Desc *dp;

    for (dp = listHead; dp != NULL; dp = dp->next) {
        if (strcmp(dp->modName, name) == 0) {
            return (dp);
        }
    }

    return (NULL);
}

/*
 *  ======== Registry_findByNamePattern ========
 */
Registry_Desc *Registry_findByNamePattern(CString namePat, Int len,
    Registry_Desc *prev)
{
    Registry_Desc *dp;
    
    /* 
     * Determine where to start in the list. 
     * If this is the first call, start at the head.
     */
    if (prev == NULL) {
        dp = Registry_module->listHead;
    }
    /* Otherwise, start where we left off. */
    else {
        dp = prev->next;
    }
    
    /* Loop through the modules. */
    for (; dp != NULL; dp = dp->next) {
        /* If the module's name matches the pattern, return the descriptor. */
        if (Registry_matchPattern(namePat, len, dp->modName)) {
            return (dp);
        }
    }

    return (NULL);
}

/*
 *  ======== matchPattern ========
 *  Determines whether a given module name matches a given pattern.
 */
Bool Registry_matchPattern(CString pattern, Int len, CString modName)
{
    /* 
     * Move through both strings one character at a time. 
     * Break when:
     *  1. The characters don't match, but the pattern character is the
     *     wildcard, so the strings match.
     *  2. The characters don't match, and the pattern character is not
     *     the wildcard, so the strings don't match.
     *  3. We've reached the end of the pattern.
     */
    while (len--) {
        if (*pattern != *modName) {
            /* 
             * If the next character in 'pattern' is the wildcard, then the 
             * module name matches. 
             */
            return (*pattern == '%');
        }
        
        /* Move to the next character in the strings */
        pattern++;
        modName++;
    }

    /* 
     * We've reached the end of the pattern. If we've also reached the end
     * of the module name, then we have a match.
     */
    return (*modName == '\0');
}

/*
 *  ======== Registry_findById ========
 */
Registry_Desc *Registry_findById(Types_ModuleId mid)
{
    Registry_Desc *dp;

    for (dp = Registry_module->listHead; dp != NULL; dp = dp->next) {
        if (dp->id == mid) {
            return (dp);
        }
    }

    return (NULL);
}

/*
 *  ======== Registry_getMask ========
 */
Bool Registry_getMask(CString name, Types_DiagsMask *mask)
{
    Registry_Desc *dp = Registry_findByName(name);

    if (dp != NULL) {
        *mask = dp->mask;
        return (TRUE);
    }

    return (FALSE);
}

/*
 *  ======== Registry_isMember ========
 */
Bool Registry_isMember(Types_ModuleId mid)
{
    return (mid <= MAXMID && mid >= MINMID);
}

/*
 *  ======== Registry_getNextModule ========
 */
Registry_Desc *Registry_getNextModule(Registry_Desc *desc)
{
    if (desc == NULL) {
        return (Registry_module->listHead);
    }
    else {
        return (desc->next);
    }
}

/*
 *  ======== getModuleName ========
 */
CString Registry_getModuleName(Registry_Desc *desc)
{
    return (desc->modName);
}

/*
 *  ======== getModuleId ========
 */
Types_ModuleId Registry_getModuleId(Registry_Desc *desc)
{
    return (desc->id);
}
    
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


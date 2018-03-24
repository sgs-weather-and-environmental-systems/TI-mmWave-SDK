/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

/*
 *  ======== Utils.addPeripheralsMap ========
 */
function addPeripheralsMap(cds)
{
    var IPeripheral = xdc.module('xdc.platform.IPeripheral');
    
    var device = cds.$orig;
    for (var prop in device) {
       if (device[prop] instanceof $$Instance
           && device[prop].$module instanceof IPeripheral.Module) {
           device.peripherals[device[prop].name] = device[prop];
       }
    }
}

/*
 *  ======== Utils.assemblePeripheralsMap ========
 */
function assemblePeripheralsMap(cds, inst, names)
{
    var IPeripheral = xdc.module('xdc.platform.IPeripheral');
    
    var plat = inst.$orig;
    
    for (var per in cds.peripherals) {
       plat.peripherals[per] = cds.peripherals[per];
    }
    
    /* We don't want to initialize all peripherals first and then go through
    * names to eliminate them because the ones not available on the program's
    * cpu should not be initialized. If a peripheral is not initialized then
    * its name is undefined.
    */
    for (var prop in plat) {
       outer_loop:
       if (plat[prop] instanceof $$Instance
           && plat[prop].$module instanceof IPeripheral.Module) {
           for (var i = 0; i < names.length; i++) {
               if (names[i] == prop) {
                   break outer_loop; // exit to the outside loop
               }
           }
           plat.peripherals[plat[prop].name] = plat[prop];
       }
    }
}

/*
 *  ======== Utils.assembleMemoryMap ========
 */
function assembleMemoryMap(cpu, plat, noCheck)
{
    if (arguments.length < 3) {
        noCheck = false;	
    }

    if (environment["xdc.platform.custom.check"] != undefined) {
        noCheck = (environment["xdc.platform.custom.check"] == "false");
    }

    var map = new xdc.om['xdc.platform.IPlatform'].MemoryMap();

    /* Many platforms still allow passing instance creation arguments in the
     * second, deprecated parameter of the create() call, instead of leaving
     * it empty and using the structure 'params', which is the third parameter
     * of the create call. For such platform, we pass the content of the
     * deprecated parameter to the catalog modules.
     * If there are arguments that are not config parameters, we check for
     * them and remove them in the generated config script. However, that
     * works only for arguments coming from config.bld. If create() happens
     * inside a schema, for example in Platform Wizard created platforms,
     * that check is bypassed. We should move check here.
     */
    map.$self = cpu.attrs.getMemoryMap(plat);
    if (plat.$private != undefined && plat.$private.args != undefined) {
        plat.$module.$logWarning("The platform '" + plat.$module.$name
            + "' is using a deprecated property 'this.$private.args. All " 
            + "references to that property should be removed.", plat);
    }

    var extMap = plat.externalMemoryMap;
    
    if (extMap != undefined && extMap != null) {
        for (var i = 0; i < extMap.length; i++) {
            /* don't override the data sheet */
            var seg = extMap[i];
            var segFound = false;
            for (var j = 0; j < map.length; j++) {
                if (map[j].name == seg.name) {
                    segFound = true;
                    plat.$module.$logError("Memory name " + seg.name + 
                        " is already used for an existing memory object", plat,
                        plat.externalMemoryMap);
                    break;
                }
            }
            if (!segFound) {
                map[seg.name] = seg;
            }
        }
    }

    /* Go through the rename map */
    if (plat.renameMap != undefined && plat.renameMap != null) {
        for (var p in plat.renameMap) {
            var pFound = false;
            for (var j = 0; j < map.length; j++) {
                if (map[j].name == p) {
                    map[j].name = plat.renameMap[p];
                    pFound = true;
                }
            }
            if (!pFound) {
                plat.$module.$logWarning("Memory name " + p + " from renameMap"
                   + " could not be found in the memory map", plat,
                   plat.renameMap);	
            }
        }
    }

    if (plat.customMemoryMap.length != 0) {
        if (!noCheck) {
            this.checkFit(map, plat.customMemoryMap, plat.$module);
	}
        map = plat.customMemoryMap;
    }

    /* check for various problem with names, for example spaces */
    for (var i = 0; i < map.length; i++) {
        /* if there is a white space in the middle of a name, fail */
        if (map[i].name.match(/\S+\s+\S+/)) {
            plat.$module.$logError("Spaces are not allowed in memory names. "
                + "The name `" + map[i].name + "' is not a valid name.", plat);
            continue;
        }
        var noSpacesName = map[i].name.replace(/\s/g, "");
        if (noSpacesName != map[i].name) {
            /* If removing spaces on both ends does not create a duplicate
             * memory name, we continue silently. Otherwise, it's an error.
             */
            var nameFound = false;
            for (var j = 0; j < map.length; j++) {
                if (i != j && map[j].name == noSpacesName) {
                    nameFound = true;
                    plat.$module.$logError("Memory names `" + map[i].name
                        + "' and '" + map[j].name + "' are identical to some "
                        + "linkers. One of the names must be changed.", plat);
                    break;
                }
            }
            if (!nameFound) {
                map[i].name = noSpacesName;
            }
        }
    }
    
    /* check for spaces in codeMemory, dataMemory and stackMemory, if they
     * are defined.
     */
    for each (var name in ["codeMemory", "dataMemory", "stackMemory"]) {
        /* if there is a white space in the middle of a name, fail */
        if (plat[name] != undefined) {
            /* They might have multiple memory ranges. */
            var names = plat[name].split(/\s*\|\s*/);
            /* If there is a match, only then we can allow some extra spaces at
             * the beginning and the end, which we then trim. If there are no
             * multiple ranges defined, we want to display the error.
             */
            if (names.length > 1) {
                names[0] = names[0].replace(/^\s*(\S*)/, "$1");
                names[names.length - 1] =
                    names[names.length - 1].replace(/(\S*)\s*$/, "$1");
            }

            for (var i = 0; i < names.length; i++) {
                if (names[i].match(/\S+\s+\S+/)) {
                    plat.$module.$logError("Spaces are not allowed in memory "
                        + "names. The parameter '" + name + "' is set to '"
                        + names[i] + "'.", plat);
                    continue;
                }
            }
            plat.$unseal(name);
            plat[name] = plat[name].replace(/\s/g, "");
            plat.$seal(name);
        }
    }

    return (map);
}


/*
 *  ======== Utils.getCpuDataSheet ========
 */
function getCpuDataSheet(cpuDesc)
{
    var rev   = cpuDesc.revision;
    var dname = cpuDesc.deviceName;
    var cname = cpuDesc.catalogName;
    var mname = cname + '.' + dname;
    var err = "can't create an xdc.platform.ICpuDataSheet instance";

    try {
        xdc.loadPackage(cname);
    }
    catch (e) {
	this.$logFatal(err + "; the platform's CPU catalog package '"
            + cname + "' can't be found along the path: " + xdc.curPath(), this,
            null);
    }

    if (!(mname in xdc.om) || !(xdc.om[mname] instanceof $$Module)) {
	this.$logFatal(
	    err + "; the package '" + cname + 
	    "' does not include the module '" + dname + "'", this, null);
    }

    /* mark the device module from the catalog package as "used" */
    var mod = xdc.useModule(mname);

    /* create a "data sheet" instance for the device */
    var inst = mod.create(rev == null ? undefined : rev);

    /* add peripherals to the map */
    this.addPeripheralsMap(inst);

    return (inst);
}

/*
 *  ======== checkDefaults ========
 */
function checkDefaults(inst, memMap)
{
    var result = true;

    var dataNames = inst.dataMemory.split(/\s*\|\s*/);
    dataNames[0] = dataNames[0].replace(/^\s*(\S*)/, "$1");
    dataNames[dataNames.length - 1] =
        dataNames[dataNames.length - 1].replace(/(\S*)\s*$/, "$1");

    for (var j = 0; j < dataNames.length; j++) {
        var dm = null;
        for (var i = 0; i < memMap.length; i++) {
            if (memMap[i].name == dataNames[j]) {
                dm = memMap[i];
                break;
            }
        }
        if (dm == null) {
            inst.$module.$logError("Parameter 'dataMemory' is set to a "
                + "nonexistent memory segment " + dataNames[j] + ".", inst, 
                dataNames[j]);
            result = false;
        }
        else if (dm.space != undefined) {
            if (dm.space.indexOf("data") == -1) {
                inst.$module.$logError("Parameter 'dataMemory' is set to the "
                    + "memory segment " + dataNames[j] + " that does not store "
                    + "data.", inst, dataNames[j]);
                result = false;
            }
        }
    }
    
    var codeNames = inst.codeMemory.split(/\s*\|\s*/);
    /* We also need to remove spaces surrounding the whole string. */
    codeNames[0] = codeNames[0].replace(/^\s*(\S*)/, "$1");
    codeNames[codeNames.length - 1] =
        codeNames[codeNames.length - 1].replace(/(\S*)\s*$/, "$1");

    for (var j = 0; j < codeNames.length; j++) {
        var cm = null;
        for (var i = 0; i < memMap.length; i++) {
            if (memMap[i].name == codeNames[j]) {
                cm = memMap[i];
                break;
            }
        }
        if (cm == null) {
            inst.$module.$logError("Parameter 'codeMemory' is set to a "
                + "nonexistent memory segment " + codeNames[j] + ".", inst,
                codeNames[j]);	
            result = false;
        }
        else if (cm.space != undefined) {
            if (cm.space.indexOf("code") == -1) {
                inst.$module.$logError("Parameter 'codeMemory' is set to the "
                    + "memory segment " + codeNames[j] + " that does not store "
                    + "code.", inst, codeNames[j]);
                result = false;
            }
        }
    }

    var stackNames = inst.stackMemory.split(/\s*\|\s*/);
    /* We also need to remove spaces surrounding the whole string. */
    stackNames[0] = stackNames[0].replace(/^\s*(\S*)/, "$1");
    stackNames[stackNames.length - 1] =
        stackNames[stackNames.length - 1].replace(/(\S*)\s*$/, "$1");

    for (var j = 0; j < stackNames.length; j++) {
        var sm = null;
        for (var i = 0; i < memMap.length; i++) {
            if (memMap[i].name == stackNames[j]) {
                sm = memMap[i];
                break;
            }
        }
        if (sm == null) {
            inst.$module.$logError("Parameter 'stackMemory' is set to a "
                + "nonexistent memory segment " + stackNames[j] + ".", inst,
                stackNames[j]);
            result = false;
        }
        else if (sm.space != undefined) {
            if (sm.space.indexOf("data") == -1) {
                inst.$module.$logError("Parameter 'stackMemory' is set to the "
                    + "memory segment " + stackNames[j] + " that does not store"
                    + " data.", inst, stackNames[j]);
                result = false;
            }
        }
    }

    return (result);

}

/*
 *  ======== checkFit ========
 */
function checkFit(realMemMap, customMemMap, mod)
{
    /* check that each entry in customMemMap fits somewhere in realMemMap */
    for (var j = 0; j < customMemMap.length; j++) {
	var base = customMemMap[j].base;
	var end = customMemMap[j].base + customMemMap[j].len;
	var page = customMemMap[j].page;

        while (base < end) {
	    var selected = null;
	    for (var k = 0; k < realMemMap.length; k++) {
                var rBase = realMemMap[k].base;
                var rEnd = rBase + realMemMap[k].len;
                var rPage = realMemMap[k].page;

	        if (rBase <= base && rEnd > base) {
	    	    selected = realMemMap[k];
	    	    break;
	    	}
	    }
	    if (selected == null) {
                if (mod != undefined) {
                    mod.$logError("Memory object " + customMemMap[j].name
                        + " does not fit into any physical memory bank.",
                        customMemMap[j]);
                }
	        return (false);	
	    }
            else if (page != undefined && selected.page != undefined
                && page != selected.page) {
                if (mod != undefined) {
                    mod.$logError("Memory object " + customMemMap[j].name
                        + " has an invalid 'page' attribute.",
                        customMemMap[j]);
                }
                return (false);
            } 
	    else {
	    	base = selected.base + selected.len;
	    }
	}
    } /* while (base < end) */
    return (true);
}

/*
 *  ======== checkOverlap ========
 */
function checkOverlap(memMap)
{
    for (var i = 0; i < memMap.length; i++) {
    	var im = memMap[i];
    	for (var j = i + 1; j < memMap.length; j++) {
    	    var jm = memMap[j];
    	    var overlap = false;
            if (('page' in im) && (im.page != null) && ('page' in jm) &&
                (jm.page != null) && (jm.page != im.page)) {
                continue;    
            }
            if ((im.base <= jm.base && (im.base + im.len) > jm.base) ||
                (im.base >= jm.base && (jm.base + jm.len) > im.base)) {
                overlap = true;
                return (im.name + " and " + jm.name);
            }
    	}
    }
    return (null);
}

/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


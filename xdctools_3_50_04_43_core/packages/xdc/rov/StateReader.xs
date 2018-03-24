/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== StateReader ========
 *  These APIs are all designed so that they will not re-read data that has
 *  already been read in.
 */

var symTable;
var strDec;

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(inSymTable, inStrDec)
{
    symTable = inSymTable;
    strDec = inStrDec;
}

/*
 *  ======== fetchModuleState ========
 *  Scans the given module's module state structure. If the structure has
 *  already been scanned, this function returns immediately.
 */
function fetchModuleState(mod)
{
    /* Return if the object has already been scanned. */
    if (mod.state) {
        return;
    }

    /* If the module does not have module state, return null. */
    if (!('Module_State' in mod.useMod)) {
        mod.state = null;
        mod.addr = "N/A";
        return;
    }

    /* Look up the Module state structure and fetch it. */
    mod.addr = $addr(symTable.getSymbolValue(mod.name.replace(/\./g, '_') +
                                             '_Module__state__V'));
    /* It's not clear yet what are the conditions under which 'Module_State'
     * is found in mod.useMod, but getSymbolValue returns '-1', which means
     * that the symbol wasn't found. This happens on Arm for IAR, for the
     * module Text.
     */
    if (mod.addr == -1 || mod.addr == 0) {
        mod.state = null;
        mod.addr = "N/A";
        return;
    }

    var modState = strDec.fetchStruct(mod.useMod.Module_State,
                                      Number(mod.addr), true);

    /* Bind the state structure to the module as the state field */
    mod.state = modState;
}

/*
 *  ======== fetchAllInstStates ========
 *  This function makes sure that all of the instance state structures for
 *  this module have been scanned in. It does not call any view$init functions.
 */
function fetchAllInstStates(mod)
{
    /* Retrieves the addresses of all of the instance state structures. */
    fetchAllInstAddrs(mod);

    /* Fetch all of the static instance states. */
    for (var i = 0; i < mod.staticInstAddrs.length; i++) {
        fetchInstState(mod, mod.staticInstAddrs[i], i);
    }

    /* Fetch all of the dynamic instance states. */
    for (var i = 0; i < mod.dynInstAddrs.length; i++) {
        fetchInstState(mod, mod.dynInstAddrs[i], -1);
    }
}

/*
 *  ======== fetchAllInstAddrs ========
 *  Retrieves the addresses of all of the statically and dynamically created
 *  instances. These will be placed in mod.staticInstAddrs and
 *  mod.dynInstAddrs.
 *
 *  TODO - fetchInstState had a check for null address for when there are no
 *         instances.
 *         Make sure this never adds "null" as an address.
 */
function fetchAllInstAddrs(mod)
{
    /* TODO - staticInstAddrs should be constant? But clear cache deletes
     *  mod, so this won't preserve them.
     */
    /* Check if they have already been retrieved. */
    if (mod.readAllAddrs) {
        return;
    }

    var Types = xdc.module('xdc.runtime.Types');

    /* Create an array of the addresses of all of the static instances. */
    mod.staticInstAddrs = new Array();

    /* Determine the number of instance objects from the config. */
    var numInsts = mod.cfg.$instances.length;

    /* If there are static instances, compute their addresses. */
    if (numInsts != 0) {
        /* Retrieve the static instance addresses, which are in an array. */
        var instArrSym = mod.name.replace(/\./g, '_') + '_Object__table__V';
        var instArrAddr = symTable.getSymbolValue(instArrSym);

        if (instArrAddr == -1) {
            // TODO - What should they do if they encounter this?
            throw (new Error("There are " + mod.name + " static instances in"
                + " the app configuration, but ROV could not find them in the"
                + " app executable (required symbol '" + instArrSym
                + "' is missing). The instances might have been removed by the"
                + " linker because they weren't referenced."));
        }

        /* Determine number and size of the instance objects from the config */
        var instSize = mod.useMod.Instance_State.$sizeof();

        /* Add the address of each of the static instances. */
        for (var i = 0; i < numInsts; i++) {
            mod.staticInstAddrs.$add(instArrAddr + (i * instSize));
        }
    }

    /* Create an array of the addresses of all of the dynamic instances.
     * A JavaScript array is used initially, so we can sort instances by
     * address.
     */
    var tempArray = [];
    /* Add all of the dynamically constructed instances. */
    if ('$constructInst' in Program) {
        var modStructType = mod.name.replace(/\./g,'_') + "_Struct";
        for each (var constructInst in Program.$constructInst) {
            if (modStructType == constructInst.type) {
                var symbolname = constructInst.name;
                if (symbolname.indexOf('.') != -1) {
                    symbolname = symbolname.substring(0,
                        symbolname.indexOf('.'));
                }
                if ("addr" in constructInst && constructInst.addr != null) {
                    tempArray.push(parseInt(constructInst.addr));
                }
                else {
                    var constructInstAddr = symTable.getSymbolValue(symbolname);
                    if (constructInstAddr != -1) {
                        if ("offset" in constructInst) {
                            constructInstAddr += constructInst.offset;
                        }
                        tempArray.push(constructInstAddr);
                    }
                }
            }
        }
        tempArray.sort();
        mod.dynInstAddrs = tempArray;
    }

    /* Check the module's memory policy. */
    if (String(mod.cfg.common$.memoryPolicy) == String(Types.STATIC_POLICY)) {
        mod.readAllAddrs = true;
        return;
    }

    /* Retrieve the module's linked list of dynamic instances. */
    var modLinkSym = mod.name.replace(/\./g, '_') + '_Module__root__V';
    var modLinkAddr = symTable.getSymbolValue(modLinkSym);

    /* Check if the symbol was found */
    if (modLinkAddr != -1 && modLinkAddr != 0) {
        try {
            var modLink = strDec.fetchStruct(Types.Link, Number(modLinkAddr),
                                             true);

            /*
             * Create a temporary map of the addresses discovered to use for
             * detecting loops in the linked list.
             */
            var addrs = {};

            /*
             * The module header is also part of a linked list of all of the
             * dynamically created instances.
             */
            var instHdrAddr = modLink.next;

            /* Loop over the list. */
            while (instHdrAddr != modLinkAddr) {

                /* Add the header address to the temporary map. */
                addrs[instHdrAddr] = true;

                /* The instance address is offset from the header. */
                var instAddr = Number(instHdrAddr) + Types.InstHdr.$sizeof();

                /* Add the instance's address. */
                mod.dynInstAddrs.$add(instAddr);

                /*
                 * Get the actual header struct and find the address of the
                 * next header struct.
                 */
                var instHdr = strDec.fetchStruct(Types.InstHdr,
                                                 Number(instHdrAddr), true);

                /* Get the address of the next instance header. */
                instHdrAddr = instHdr.link.next;

                // If we've detected a loop in the instance queue throw an error
                if (instHdrAddr in addrs) {
                    throw (new Error(
                        "Detected loop in instance queue at address "
                        + instHdrAddr));
                }
            }
        }
        catch (e) {
            Program.debugPrint("xdc.rov.decoder: Cannot read the list of "
                + "dynamic instances.");
        }
    }

    mod.readAllAddrs = true;
}

/*
 *  ======== getKey ========
 *  Makes a key out of the instance's address for the module's
 *  instMap.
 */
function getKey(addr)
{
    return ('0x' + Number(addr).toString(16));
}

/*
 *  ======== fetchInstState ========
 *  This function scans in a single instance's state, and associates various
 *  metadata (used by the view$init functions) with the instance object.
 *  Returns the inst object for Program.scanHandle.
 *  This API is responsible for caching the retrieved instance states. If the
 *  instance state at the given address has already been read in, it will not
 *  be read again.
 */
function fetchInstState(mod, instAddr, staticIndex)
{
    /*
     * Check to see if this instance has already been scanned.
     * Instances may be discovered through Program.scanInstanceView, or a call
     * to Program.scanHandle from a different module's view init code; so it's
     * possible that the instance has already been scanned.
     */
    var key = getKey(instAddr);
    if ((mod.instMap) && (key in mod.instMap)) {
        return (mod.instMap[key]);
    }

    /*
     * If this module's instance state structure has a size field, fetch the
     * instance state structure.
     */
    var obj;
    if ('$sizeof' in mod.useMod.Instance_State) {
        obj = strDec.fetchStruct(mod.useMod.Instance_State,
                                 Number(instAddr), true);
    }
    /* Otherwise, this module has no real instance state (such as GateHwi). */
    else {
        /* TODO - Is this all right? Maybe call fetchStruct anyway? */
        Program.debugPrint("xdc.rov.decoder:"
            + " Module does not have instance state.");
        var temp = new mod.useMod.Instance_State;
        obj = {};

        obj.$addr = $addr(instAddr);
        obj.$type = temp.$type;
    }

    /* Create an instance descriptor for the instance. */
    var inst = getInstDesc(mod, obj, staticIndex);

    /* Return the inst for scanHandle */
    return (inst);
}

/*
 *  ======== getInstDesc ========
 *  Takes a decoded state structure and creates an ROVInstanceDesc for it.
 *  Also retrieves the label for the instance.
 */
function getInstDesc(mod, obj, staticIndex)
{
    /*
     * The instMap will map instance addresses to instance objects.
     * It may already be present from a call to Program.scanHandle in a
     * different module's view init code.
     */
    if (!mod.instMap) {
        mod.instMap = new Object();
    }

    /* Return immediately if this object has already been scanned. */
    var key = getKey(obj.$addr);
    if (key in mod.instMap) {
        return (mod.instMap[key]);
    }

    /* Create a new instance descriptor to represent the instance */
    var inst = new Program.ROVInstanceDesc;

    /* Store the state structure and its address. */
    inst.state = obj;
    inst.addr = obj.$addr;

    /* Get the instance's label */
    obj.$label = getLabel(mod, obj, staticIndex);

    /* Add the instance to the module's list. */
    mod.instances.$add(inst);

    /*
     * Add the instance to the map, so we can quickly check if it's
     * already been scanned.
     */
    mod.instMap[key] = inst;

    return (inst);
}

/*
 * ======== getLabel ========
 * Helper function called from getInstLabel to retrieve the label for the
 * given instance.
 */
function getLabel(mod, obj, staticIndex)
{
    /* Create the label for the instance. */
    var label = mod.name + "@" + Number(obj.$addr).toString(16);

    /* If this is a static instance, get the instance name from the capsule. */
    if (staticIndex != -1) {
        var givenName =
            Program.$modules[mod.name].$instances[staticIndex].instance.name;
        if (givenName != null) {
            label += (":" + givenName);
            return (label);
        }
    }
    /* Otherwise, if this is a dynamically created instance,
     * check if it has a name. */
    else if ('__name' in obj) {
        /* If the __name field is null, no name was given. */
        if (Number(obj.__name) != 0) {
            try {
                var givenName =
                    xdc.module('xdc.runtime.Text').fetchAddr(Number(obj.__name));
            }
            catch (e) {
                if (e.message == "abort") {
                    throw (e);
                }
                /*
                 * Need a way to report error to user. Just display
                 * error instead of name.
                 */
                var givenName = "Error retrieving given name at 0x" +
                            Number(obj.__name).toString(16) + ": " +
                            e.toString();
            }
            label += ":" + givenName;
            return (label);
        }
    }

    return (label);
}

/*
 *  ======== fetchHandleState ========
 *  The fetchInstState API needs to know whether the given instance
 *  is static or dynamic. If we just have a handle to an instance, we first
 *  need to determine whether it is static or dynamic.
 */
function fetchHandleState(mod, instAddr)
{
    /*
     * Check if this is a static instance. If it is, we need to find its index
     * in the module header instance array so the decoder can retrieve the
     * instance name from the recap file.
     */
    fetchAllInstAddrs(mod);

    var staticIndex = -1;
    for (var i = 0; i < mod.staticInstAddrs.length; i++) {
        if (Number(instAddr) == Number(mod.staticInstAddrs[i])) {
            staticIndex = i;
            break;
        }
    }

    /* Fetch this individual instance's state, adding it to the module. */
    var inst = fetchInstState(mod, instAddr, staticIndex);

    return (inst);
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


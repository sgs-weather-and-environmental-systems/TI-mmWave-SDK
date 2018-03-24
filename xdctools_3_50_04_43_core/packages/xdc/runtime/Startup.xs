/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule("xdc.runtime.Reset");
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    obj.stateTab = null;
    obj.execFlag = false;
    obj.rtsDoneFlag = false;

    for each (var mod in Program.targetModules()) {
        if (mod.MODULE_STARTUP$) {
            this.sfxnTab.$add('&' + mod.$name.replace(/\./g, '_') + 
                '_Module_startup__E');
            var rtsFxn = false;
            if (mod.$package.$name == 'xdc.runtime') {
                rtsFxn = true;
            }
            else {
                /* $$inherits is an array of package names from which 'mod'
                 * inherits.
                 */
                if ("$$inherits" in mod) {
                    var iL = mod.$$inherits;
                    rtsFxn = iL.length > 1
                             && iL[iL.length - 2] == 'xdc.runtime';
                }
                /* else clause can be removed after we increment the schema
                 * number from 170. Before then, we will still have schemas
                 * that will not be rebuilt, but they will not have $$inherits.
                 */
                else {
                    var iL = mod.$spec.getInherits().toArray();
                    rtsFxn = iL.length > 1 && 
                        iL[iL.length - 2].getPkgName() == 'xdc.runtime';
                }
            }
            this.sfxnRts.$add(rtsFxn);
        }
    }
}

/*
 *  ======== viewInitModule ========
 *  ROV module-level view.
 */
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Indicate whether the runtime modules have completed startup. */
    view.rtsStartupDone = mod.rtsDoneFlag;
    
    /* 
     * Indicate whether processing of the module startup functions has
     * begun.
     */
    view.startupBegun = mod.execFlag;
    
    /* 
     * Retrieve the Startup module's configuration to get at the rest and
     * first and last functions.
     */
    var modCfg = Program.getModuleConfig('xdc.runtime.Startup');
    
    /* Display the reset function. */
    view.resetFxn = modCfg.resetFxn;
    
    /* Display the functions which run before module startup. */
    view.firstFxns = modCfg.firstFxns;
    
    /* Display the functions which run after module startup. */
    view.lastFxns = modCfg.lastFxns;    
}

/*
 *  ======== viewInitStartupState ========
 *  ROV view displaying the startup state (done / not done) of each module.
 */
function viewInitStartupState(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Model = xdc.useModule('xdc.rov.Model');
    
    /* Access the Startup module's configuration. */
    var modCfg = Program.getModuleConfig('xdc.runtime.Startup');
    
    /* 
     * Get an array of the names of all of the startup modules based
     * on the internal 'sfxnTab' config, which is an array of all of the
     * Module_startup__E functions.
     */
    var startupMods = getStartupMods(modCfg.sfxnTab);
    
    /* Get the startup state to display for each module. */
    var states = getStartupStates(startupMods);
    
    /* 
     * Display the modules in the order they're called, which is rts 
     * modules first.
     */
    var elements = new Array();
    
    /* Go through the modules and add the rts modules to the view first. */
    for (var i = 0; i < startupMods.length; i++) {
        /* Only add rts modules this time. */
        if (modCfg.sfxnRts[i]) {
            /* Add the module to the view. */
            elements[elements.length] =
                getStartupStateView(elements.length + 1,
                                    startupMods[i],
                                    states[i]);
        }
    }
    
    /* Go through the modules again, this time adding the non-rts modules. */
    for (var i = 0; i < startupMods.length; i++) {
        /* Only add non-rts modules this time. */
        if (!modCfg.sfxnRts[i]) {            
            /* Add the module to the view. */
            elements[elements.length] = 
                getStartupStateView(elements.length + 1,
                                    startupMods[i], 
                                    states[i]);
        }
    }
        
    view.elements = elements;
}

/*
 *  ======== getStartupMods ========
 */
function getStartupMods(sfxnTab)
{
    var startupMods = new Array();
    
    var tailLen = String("_Module_startup__E").length;
    
    for (var i = 0; i < sfxnTab.length; i++) {
        var sym = sfxnTab[i];
        
        /* Remove the '&' and the _Module_startup__E from the symbol. */
        var modName = sym.substring(1, sym.length - tailLen);
        
        /* Replace '_' with '.' */
        modName = modName.replace(/_/g, '.');
        
        /* Add the module to the list. */
        startupMods[startupMods.length] = modName;
    }
    
    return (startupMods);
}

/*
 *  ======== getStartupStates ========
 *  Returns a string array of the current state ("DONE" or "NOT DONE") of all
 *  of the module startups.
 */
function getStartupStates(startupMods)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');    
    
    /* Scan the raw view to retrieve the module state. */
    var rawView = Program.scanRawView('xdc.runtime.Startup');
    var modState = rawView.modState;
    
    var states = new Array();
    
    /* 
     * If the stateTab field is set to null, either startup hasn't started
     * or it's completely done.
     */
    if (modState.stateTab == 0) {
        /* If the execFlag is set, then startup processing is done. */
        if (modState.execFlag) {
            /* Set all states to "DONE" */
            for (var i = 0; i < startupMods.length; i++) {
                states[i] = "DONE";
            }
        }
        /* Otherwise, startup hasn't started yet. */
        else {
            /* Set all states to "NOT DONE" */
            for (var i = 0; i < startupMods.length; i++) {
                states[i] = "NOT DONE";
            }
        }
    }
    /* If stateTab is non-null, retrieve the values. */
    else {
        /* Retrieve the startup state table. */
        var stateVals = Program.fetchArray(ScalarStructs.S_Int$fetchDesc,
                                           modState.stateTab,
                                           startupMods.length);
        
        /* Convert the values into "DONE" and "NOT DONE" */
        for (var i = 0; i < startupMods.length; i++) {
            if (stateVals[i].elem == -1) {
                states[i] = "DONE";
            }
            else if (stateVals[i].elem == 0) {
                states[i] ="NOT DONE";
            }
            else {
                states[i] = "Bad value: " + stateVals[i].elem;
            }
        }
    }
    
    return (states);
}

/*
 *  ======== getStartupStateView ========
 */ 
function getStartupStateView(order, modName, state)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Create a new view element. */
    var elem = Program.newViewStruct('xdc.runtime.Startup', 'Startup State');
    
    /* Display the order of the modules, starting at 1. */
    elem.order = order;
    
    /* Display the module. */
    elem.moduleName = modName;

    /* Display the module's startup state. */
    elem.done = state;
    
    return (elem);
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


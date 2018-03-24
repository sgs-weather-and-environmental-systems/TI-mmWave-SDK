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
 * 'CATEGORIES' is an array of the string names of all of the diags bits.
 * This array is initialized by the initCategories function, which should
 * be called before referencing this global variable.
 * 'init' is used to track whether CATEGORIES has been initialized already.
 */
var CATEGORIES;
var init;

/*
 *  ======== needsDiagsMask ========
 *  Returns non-zero if module needs a runtime mask
 */
function needsDiagsMask(mod)
{
    /* The XOR clause only verifies if there are bits that could be ON at the
     * runtime (diagsIncluded), but are not ALWAYS_ON (diagsEnabled), which
     * means they are RUNTIME_ON or RUNTIME_OFF (the 1^0 case).
     * The 0^1 case, in which a bit can't be ON, but is ALWAYS_ON 
     * is not possible. The cases 0^0 and 1^1 don't require a mask
     * at the runtime.
     */
    return (mod.Module__diagsIncluded ^ mod.Module__diagsEnabled);
}

/*
 *  ======== initCategories ========
 */
function initCategories()
{
    if (init == null) {
        init = true;
        CATEGORIES = [];
        var Types = xdc.module("xdc.runtime.Types");
        for (var name in Types.common$) {
            if (name.substring(0, 6) == "diags_") {
                CATEGORIES.push(name.substring(6));
            }
        }
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    /* We decide if we should load Registry based on the runtime support 
     * package. If that package is built with the newer version of
     * 'xdc.runtime', Registry code is available in the runtime support package
     * and we load Registry.
     */
    var rts = Program.build.target.rts;
    if ("rtsName" in Program.build) {
        rts = Program.build.rtsName;
    }
    if (rts) {
        var rtsPkg = xdc.loadPackage(rts, true);
        var xml = null;
        var xmlFile = xdc.findFile(rts.replace(".", "/")
                                   + "/package/package.rel.xml");
        if (xmlFile) {
            xml = xdc.loadXML(xmlFile);
        }
        else {
            xmlFile = xdc.findFile(rts.replace(".", "/") + "/package/rel/"
                + rts.replace(".", "_") + "/" + rts.replace(".", "/")
                + "/package/package.rel.xml");
            if (xmlFile) {
                xml = xdc.loadXML(xmlFile);
            }
        } 
        if (xml == null) {
            xdc.useModule('xdc.runtime.Registry');
            return;
        }
        for (var i in xml.references["package"]) {
            if (xml.references["package"][i].@name == "xdc.runtime") {
                var vers = xml.references["package"][i].@version;
                if (vers >= "2, 1, 0") {
                    xdc.useModule('xdc.runtime.Registry');
                }
            }
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    initCategories();

    for each (var mod in Program.targetModules()) {

        if (mod.PROXY$) {
            continue;
        }

        var dincl = 0; /* bits that could be ON at runtime */
        var denab = 0; /* bits initially ON, and can't be turned off */
        var dmask = 0; /* bits that are ON initially */

        for each (var dc in CATEGORIES) {
            
            /* 
             * Deprecate USER7 and USER8 and warn the user appropriately. 
             * This API will ensure that INFO == USER7 and ANALYSIS ==
             * USER8 so that we don't have conflicting values.
             */
            deprecateUser7And8(this, mod, dc);
        
            switch (mod.common$['diags_' + dc]) {
                case this.ALWAYS_OFF:
                    break;
                case this.ALWAYS_ON:
                    dincl |= this[dc];
                    denab |= this[dc];
                    break;
                case this.RUNTIME_OFF:
                    dincl |= this[dc];
                    this.setMaskEnabled = true;
                    break;
                case this.RUNTIME_ON:
                    dincl |= this[dc];
                    dmask |= this[dc];
                    this.setMaskEnabled = true;
                    break;
            }
            mod.common$.$seal('diags_' + dc);
        }

        mod.$unseal('Module__diagsEnabled');
        mod.$unseal('Module__diagsIncluded');
        mod.$unseal('Module__diagsMask');
        mod.Module__diagsEnabled = denab;
        mod.Module__diagsIncluded = dincl;

        mod.$$bind('$$diagsMask', dmask);
        mod.Module__diagsMask = needsDiagsMask(mod)
            ? $externPtr(mod.$name.replace(/\./g, '_')
                         + '_Module__root__V.mask')
            : null;

        mod.$seal('Module__diagsEnabled');
        mod.$seal('Module__diagsIncluded');
        mod.$seal('Module__diagsMask');
    }

    /* if the Diags_setmask() function is enabled, reference a table of
     * name:value pairs generated by Dict.xdt that allows Diags_setMask()
     * to look up module masks by the module's name.
     */
    if (this.setMaskEnabled) {
        if (this.$package.Text.isLoaded) {
            this.dictBase = '&xdc_runtime_Diags_dictElems[0]';
        }
        else {
            /* The part of setMask() that deals with RTSC modules needs the
             * strings on the target.
             */
            this.setMaskEnabled = false;
        }
    }
}

/*
 *  ======== deprecateUser7And8 ========
 *  This function is used to deprecate the use of the USER7 and USER8 bits.
 *  It warns the user if they modify USER7 or USER8 from their default value
 *  of ALWAYS_OFF. If USER7 or USER8 have been modified, any value in INFO or
 *  ANALYSIS is given priority unless those bits have not been modified.
 *
 *  In all cases, this function will ultimately make sure that USER7 and INFO
 *  have the same value and that USER8 and ANALYSIS have the same value. If it
 *  makes any changes which the user might not be expecting, a warning is
 *  issued.
 *
 *  When to remove: This code can be removed once 7 and 8 have been deprecated
 *  long enough and we decide to simply remove Diags.USER7 and Diags.USER8
 *  completely and essentially break compatibility with configurations that
 *  modify those bits.
 */
function deprecateUser7And8(diagsMod, mod, dc)
{
    if (dc == 'USER7' && mod.common$.diags_USER7 != mod.common$.diags_INFO) {
        /* If the user has modified USER7 independently of INFO */
        if (mod.common$.diags_USER7 != diagsMod.ALWAYS_OFF) {
            var msg = mod.$name + ".common$.diags_USER7 has been modified "
                      + "from its default. Diags.USER7 has been deprecated "
                      + "and is now equivalent to Diags.INFO.";
            
            /* If INFO has been modified, give its value priority. */
            if (mod.common$.diags_INFO != diagsMod.ALWAYS_OFF) {
                var msg2 = msg + " diags_INFO has also been changed from its "
                           + "default, so the value "
                           + String(mod.common$.diags_INFO) + " from INFO "
                           + "will be used.";
            
                diagsMod.$logWarning(msg2, mod, "diags_USER7");
              
                /* Make USER7 equivalent to INFO */
                mod.common$.diags_USER7 = mod.common$.diags_INFO;
            }
            /* Otherwise, use the value in USER7 */
            else {
                var msg2 = msg + " diags_INFO has not been changed from its "
                           + "default, so the value "
                           + String(mod.common$.diags_USER7) + " from USER7 "
                           + "will be used.";
                
                diagsMod.$logWarning(msg2, mod, "diags_USER7"); 
                
                /* Make INFO equivalent to USER7 */
                mod.common$.diags_INFO = mod.common$.diags_USER7;
            }
        }
        /* Otherwise, just quietly set USER7 equal to INFO */
        else {
             mod.common$.diags_USER7 = mod.common$.diags_INFO;
        }
    }
    else if (dc == 'USER8'
        && mod.common$.diags_USER8 != mod.common$.diags_ANALYSIS) {
        /* If the user has modified USER8 independently of ANALYSIS */
        if (mod.common$.diags_USER8 != diagsMod.ALWAYS_OFF) {
            
            var msg = mod.$name + ".common$.diags_USER8 has been modified "
                      + "from its default. Diags.USER8 has been deprecated "
                      + "and is now equivalent to Diags.ANALYSIS.";
            
            /* If ANALYSIS has also been modified, give its value priority. */
            if (mod.common$.diags_ANALYSIS != diagsMod.ALWAYS_OFF) {
                var msg2 = msg + " diags_ANALYSIS has also been changed from "
                           + "its default, so the value "
                           + String(mod.common$.diags_ANALYSIS)
                           + " from ANALYSIS will be used.";
                
                diagsMod.$logWarning(msg2, mod, "diags_USER8");
              
                /* Make USER8 equivalent to ANALYSIS */
                mod.common$.diags_USER8 = mod.common$.diags_ANALYSIS;
            }
            /* Otherwise, user the value in USER8 */
            else {
                var msg2 = msg + " diags_ANALYSIS has not been changed from "
                           + "its default, so the value "
                           + String(mod.common$.diags_USER8) + " from USER8 "
                           + "will be used.";
                
                diagsMod.$logWarning(msg2, mod, "diags_USER8"); 
                
                /* Make ANALYSIS equivalent to USER8 */
                mod.common$.diags_ANALYSIS = mod.common$.diags_USER8;
            }
        }
        /* Otherwise, just quietly set USER8 equal to ANALYSIS */
        else {
             mod.common$.diags_USER8 = mod.common$.diags_ANALYSIS;
        }
    }
}

/*
 *  ======== setMaskMeta ========
 */
function setMaskMeta(pat, mask, mode)
{
    if (typeof pat == 'string') {
        pat = '^' + pat.replace(/\./g, '\\.').replace(/%$/, '.*') + '$';
    }

    var re = RegExp(pat);

    initCategories();

    /* For all modules... */
    for each (var mod in xdc.om.$modules) {
        if (mod.$hostonly || !mod.$used || mod.PROXY$) {
            continue;
        }
        /* If the module name matches the pattern... */
        if (mod.$name.match(re)) {
            /* 
             * Set module's common$.diags_* properties based on the bits set
             * in 'mask'.
             */
            for each (var dc in CATEGORIES) {
                if (mask & this[dc]) {
                    mod.common$['diags_' + dc] = mode;
                }
            }
        }
    }
}

/*
 *  ======== viewInitDiagsMasks ========
 *  ROV view to display the state of the diags masks for all modules in the
 *  system.
 *
 *  This view uses the generic TREE_TABLE view type. It displays the module and
 *  package heirarchy on the left, and displays the diags mask state for the
 *  selected module (or the modules in the selected package) on the right in a
 *  table. 
 */
function viewInitDiagsMasks()
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Model = xdc.useModule('xdc.rov.Model');
    
    /* Initialize the CATEGORIES array defined at the top of this file. */
    initCategoriesRov();
    
    /* Retrieve the package heirarchy. */
    var modList = Model.getModuleList();

    /* 
     * This will return a root TreeNode whose name is "Module List" and
     * whose children are the top level packages e.g. 'xdc'.
     */
    var masksView = getPackageMasksView(modList);
    
    return (masksView.children);
}

/*
 *  ======== initCategoriesRov ========
 *  Types.common$ does not exist at ROV time, so we just have to hard code 
 *  the categories list.
 */
function initCategoriesRov()
{
    if (init == null) {
        init = true;
        CATEGORIES = [
            "ASSERT",   
            "ENTRY",    
            "EXIT",     
            "INTERNAL", 
            "LIFECYCLE",
            "STATUS",
            "USER1",
            "USER2",
            "USER3",
            "USER4",
            "USER5",
            "USER6",
            "USER7",
            "INFO", 
            "USER8",
            "ANALYSIS"
        ];
    }
}
 
/*
 *  ======== getPackageMasksView ========
 *  This recursive function returns an xdc.rov.Program.TreeNode representing
 *  the given package. 
 *
 *  The 'pkg' object is a package from the module list returned by 
 *  Model.getModuleList().
 */
function getPackageMasksView(pkg)
{
    var Diags = xdc.useModule('xdc.runtime.Diags');
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Create a TreeNode to add to the view to represent this package. */
    var pkgNode = new Program.TreeNode();
    
    /* Set the display name of the package node. */
    pkgNode.label = pkg.name;
    
    /* 
     * First, make recursive calls to get the TreeNode for each of the 
     * sub packages. 
     */
    pkgNode.children = new Array();
    for each (var subPkg in pkg.subPkgs) {
        /* Make a recursive call to get the TreeNode for the sub package. */
        var subPkgView = getPackageMasksView(subPkg);
        
        /* Add the sub package to this package's view. */
        pkgNode.children[pkgNode.children.length++] = subPkgView;
    }
    
    /* Get the diags mask for each of the modules. */
    pkgNode.properties = new Array();
    for each (var mod in pkg.modules) {
        
        /* Create a view structure for the module. */
        var maskView = Program.newViewStruct('xdc.runtime.Diags', 'DiagsMasks');
    
        /* Set the module's name. */
        maskView.Module = mod.name;
        
        /* Get the module's configuration. */
        var modCfg = Program.getModuleConfig(mod.fullName);
        
        /* Set the module's logger. */
        if (modCfg.common$.logger == null) {
            maskView.logger = "null";
        }
        else if (modCfg.common$.logger.instance.name) {
            maskView.logger = modCfg.common$.logger.instance.name;
        }
        else {
            maskView.logger = String(modCfg.common$.logger.$name);
        }
        
        /* The diags mask is located at the following symbol. */
        var diagsSym = mod.fullName.replace(/\./g, '_') 
			   + '_Module__diagsMask__C';
        
        /* Get the address of the diags mask. */
        var diagsSymAddr = Program.getSymbolValue(diagsSym);
        
        /* If the symbol does not exist... */
        if (diagsSymAddr == -1) {
            /* 
             * There's no runtime mask, so just display the bits from the
             * configuration.
             */
            addConfigMaskView(pkgNode, maskView, mod);
            
            /* Continue to the next module. */
            continue;
        }
       
        var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

        /* 
         * The diagsMask__C symbol holds the address of a pointer to the
         * actual diagsMask. Retrieving the diagsMask requires a double 
	 * de-reference.
         */
        var maskAddr;
        try {
            maskAddr = Program.fetchStruct(ScalarStructs.S_Ptr$fetchDesc, diagsSymAddr).elem;
        }
        catch (e) {
            /* Display the error. */
            Program.displayError(maskView, 'Module', 
                                 "Caught an exception while fetching the "
                                 + "address of the diags mask: " + e);
            /* Add the view without the mask filled in */
            pkgNode.properties[pkgNode.properties.length++] = maskView;
        }
        
        /* If the value at diagsMask__C is zero.. */
        if (maskAddr == 0) {
            /* 
             * There's no runtime mask, so just display the bits from the
             * configuration.
             */
            addConfigMaskView(pkgNode, maskView, mod);
            
            /* Continue to the next module. */
            continue;
        }
        
        /* 
         * Dereference the pointer at diagsMask__C to retrieve the actual 
         * diags mask. 
         */
        var mask;
        try {
            mask = 
                Program.fetchStruct(ScalarStructs.S_Bits16$fetchDesc, 
                                    maskAddr).elem;
        }
        catch (e) {
            /* Display the error. */
            Program.displayError(maskView, 'Module', 
                                 "Caught an exception while fetching the "
                                 + "diags mask: " + e);
            /* Add the view without the mask filled in */
            pkgNode.properties[pkgNode.properties.length++] = maskView;
        }
        
        /* Display the bit settings based on the runtime values in the mask. */
        addRuntimeMaskView(pkgNode, maskView, mod, mask);            
    }
   
    return (pkgNode);
}

/*
 *  ======== addConfigMaskView ========
 *  Get a module's diags mask setting from the configuration.
 *  This API is called when the module does not have a runtime mask, which
 *  happens when there is no logger configured or when all of the mask bits
 *  are set to ALWAYS_OFF or ALWAYS_ON.
 */
function addConfigMaskView(pkgNode, maskView, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Get the module's configuration. */
    var modCfg = Program.getModuleConfig(mod.fullName);
        
    /* Display the mask values from the configuration. */
    for each (var cat in CATEGORIES) {
        var state = modCfg.common$["diags_" + cat];
        
        // TODO - If we're displaying the mask only based on the configuration,
        // yet one of the bits is runtime on/off, that should be an error?
        
        /* Remove the 'xdc.runtime.Diags' from the beginning of the string. */
        if (cat in maskView) {
            maskView[cat] = state.substring(18, state.length);
        }
    }
    
    /* Add the view structure to the overall view. */
    pkgNode.properties[pkgNode.properties.length++] = maskView;
}

/*
 *  ======== addRuntimeMaskView ========
 *  Get a module's diags mask settings from the runtime mask.
 *  The diags mask only tells us on/off; it does not tell us whether the
 *  bit is ALWAYS or RUNTIME. For this info, we have to first retrieve the
 *  module's initial diags settings from the configuration.
 */
function addRuntimeMaskView(pkgNode, maskView, mod, mask)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Diags = xdc.useModule('xdc.runtime.Diags');
    
    /* Get the module's configuration. */
    var modCfg = Program.getModuleConfig(mod.fullName);
        
    for each (var cat in CATEGORIES) {
        /* Skip over USER7 and USER8. */
        if (!(cat in maskView)) {
            continue;
        }
        
        /* Get the configured value of the bit. */
        var cfgVal = modCfg.common$["diags_" + cat];
        
        /* 
         * Get the runtime status of the bit. This evaluates to true (ON)
         * or false (OFF) 
         */
        var rtVal = (mask & Diags[cat]) != 0;
        
        /* If the bit was configured to ALWAYS_ON... */
        if (cfgVal == "xdc.runtime.Diags.ALWAYS_ON") {
            /* 
             * The runtime mask value doesn't matter, and is not even 
             * guaranteed to be on. 
             */
            maskView[cat] = "ALWAYS_ON";
        }
        /* If the bit was configured to ALWAYS_OFF... */
        else if (cfgVal == "xdc.runtime.Diags.ALWAYS_OFF") {
            /* The runtime mask value doesn't matter. */
            maskView[cat] = "ALWAYS_OFF";
        }
        /* Otherwise, it's a runtime bit, display it's runtime state. */
        else if (rtVal == true) {
            maskView[cat] = "RUNTIME_ON";
        }
        else {
            maskView[cat] = "RUNTIME_OFF";
        }
    }
    
    /* Add the view structure to the overall view. */
    pkgNode.properties[pkgNode.properties.length++] = maskView;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


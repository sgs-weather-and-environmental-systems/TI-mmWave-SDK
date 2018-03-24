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
 *  ======== System.xs ========
 */

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* process only in cfg flow */
    if (xdc.om.$name != 'cfg') {
        return;
    }

    this.SupportProxy = xdc.module('xdc.runtime.SysMin');
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    /* If Program.system is set, it has to be a module that inherits from
     * ISystemSupport.
     */
    if (Program.system &&
        this.$package.ISystemSupport.Module(Program.system) == null) {
        Program.$logError(
            "Module assigned to Program.system must inherit from "
            + "xdc.runtime.ISystemSupport.", Program, "system");
    }

    /* DEPRECATED FEATURE */
    if (Program.system) {
        this.SupportProxy = Program.system;
    }

    /* necessary when useModule not called on System */
    if (this.SupportProxy) {
        xdc.useModule(this.SupportProxy.delegate$.$name);
    }

    xdc.useModule('xdc.runtime.Assert');
    xdc.useModule('xdc.runtime.Core');
    xdc.useModule('xdc.runtime.Defaults');
    xdc.useModule('xdc.runtime.Diags');
    xdc.useModule('xdc.runtime.Error');
    xdc.useModule('xdc.runtime.Gate');
    xdc.useModule('xdc.runtime.Log');
    xdc.useModule('xdc.runtime.Main');
    xdc.useModule('xdc.runtime.Startup');
    xdc.useModule('xdc.runtime.Text');
    
    Program.exportModule('xdc.runtime.Startup');

    Program.symbol["xdc_runtime_Startup__EXECFXN__C"] = 1;
    Program.symbol["xdc_runtime_Startup__RESETFXN__C"] = 1;
    
    this.$package.Types.$used = false;

    this.$$bind('$$scope', 1);
 
    /* if it is a native target add the lastFxn */
    if (!(Program.build.target.os === undefined)) {
        /* 
         * Don't call atexit() until all modules have been initialized.
         * atexit() needs malloc(), and malloc() needs heaps, which aren't
         * necessarily initialized until all module startups are done. 
         */
        var Startup = xdc.useModule('xdc.runtime.Startup');
        Startup.lastFxns.$add(this.lastFxn);
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.numAtexitHandlers = this.exitFxns.length;
    
    /* Create only if there will be handlers */
    if (params.maxAtexitHandlers != 0) {
        mod.atexitHandlers.length = params.maxAtexitHandlers;
        xdc.module('xdc.runtime.Memory').staticPlace(mod.atexitHandlers,
            0, null);
    }
    
    for (var i = 0; i < this.exitFxns.length; i++) {
        mod.atexitHandlers[i] = this.exitFxns[i];
    }
    
    /* Need to null out the rest */
    for (var i = this.exitFxns.length; i < mod.atexitHandlers.length; i++) {
        mod.atexitHandlers[i] = null;
    }
}

/*
 *  ======== atexitMeta ========
 */
function atexitMeta(func)
{
    this.exitFxns.$add(func);
}

/*
 *  ======== mprintf ========
 */
function mprintf(fmt, args)
{
    var Text = xdc.module('xdc.runtime.Text');

    var res = "";
    var mat;

    while (fmt && (mat = fmt.match(/%(([cdopsxf])|\$([ALMR]))(.*)/))) {
        res += fmt.slice(0, mat.index);
        var code = mat[1] ? mat[1] : mat[2];
        switch(code) {
            case 'c':
                res += String.fromCharCode(args.shift());
                break;
            case 'd':
                res += formatNum(args.shift(), 10);
                break;
            case 'o':
                res += formatNum(args.shift(), 8);
                break;
            case 'p':
                res += '@' + formatNum(args.shift(), 16);
                break;
            case 's':
                var a = args.shift();
                res += typeof(a) == 'string' ? a : Text.fetchAddr(a);
                break;
            case 'x':
                res += formatNum(args.shift(), 16);
                break;
            case '$R':
                res += Text.fetchAddr(args.shift());
                break;
            case 'f':
                var bits = args.shift();
                var s = ((bits >> 31) == 0) ? 1 : -1;
                var e = ((bits >> 23) & 0xff);
                var m = (e == 0) ? (bits & 0x7fffff) << 1 :
                                   (bits & 0x7fffff) | 0x800000;
                var f = s * m * Math.pow(2, (e-150));
                f = f.toFixed(4);
                res += formatNum(f, 10);

                break;
            }

        fmt = mat[4];
    }

    res += fmt;
    return res;
}

/*
 *  ======== formatNum ========
 */
function formatNum(num, base)
{
    return Number(num).toString(base);
}

/*
 *  ======== module$view$init ========
 */
function module$view$init(view, mod)
{
    var Model = xdc.useModule("xdc.rov.Model");
    
    /* TODO: fetch atexithandlers and get symbols for them */
    view.numAtexitHandlers = mod.numAtexitHandlers;
}

/*
 *  ======== viewInitXdcRoot ========
 *  ROV view to display the value of XDCROOT used in running ROV.
 */
function viewInitXdcRoot(view)
{
    var Program = xdc.useModule('xdc.rov.Program');

    var elements = new Array();
    
    /* 
     * Create a view element to hold a note about the purpose of this view.
     * It deserves clarification that this is the path used to run ROV, not 
     * necessarily what was used to build the application.
     */
    var elem = Program.newViewStruct('xdc.runtime.System', 'XDCROOT');
    elem.entry = "The path to the version of XDCtools which is currently " +
                 "being used to run ROV.";
    elements[elements.length] = elem;    
    
    /* Add a blank line to create separation from the note. */
    elem = Program.newViewStruct('xdc.runtime.System', 'XDCROOT');
    elem.entry = "";
    elements[elements.length] = elem;
    
    /* Create a view element to hold the path. */
    elem = Program.newViewStruct('xdc.runtime.System', 'XDCROOT');

    /* 
     * Retrieve the xdc root path from the 'xdc.root' property set when the 
     * ROV server was created.
     */
    elem.entry = xdc.jre.java.lang.System.getProperty("xdc.root");
    
    /* Add the view element to the display. */
    elements[elements.length] = elem;
    view.elements = elements;
}

/*
 *  ======== viewInitXdcPath ========
 *  ROV view to display all of the XDCPATH entries that are being used to
 *  run ROV.
 */
function viewInitXdcPath(view)
{
    var Program = xdc.useModule('xdc.rov.Program');

    var elements = new Array();

    /* 
     * Create a view element to hold a note about the purpose of this view. 
     * It's important to clarify that these paths are used to run ROV, and not
     * necessarily used to build the application.
     */
    var elem = Program.newViewStruct('xdc.runtime.System', 'XDCPATH');
    elem.entry = "The paths to the repositories which are currently being " +
                 "used to run ROV.";
    elements[elements.length] = elem; 
    
    /* Add a blank line to create separation from the note. */
    elem = Program.newViewStruct('xdc.runtime.System', 'XDCPATH');
    elem.entry = "";
    elements[elements.length] = elem;
    
    /* 
     * Retrieve the entire XDC path from the 'xdc.path' property set when
     * the ROV server was created.
     */
    var xdcPath = String(xdc.jre.java.lang.System.getProperty("xdc.path")); 
    
    /* Split the xdc path into an array of path entries, delimited by ';'. */
    var entries = xdcPath.split(';');
    
    /* Add each path to the view. */
    for each (var entry in entries) {
        
        /* Skip over blank entries. */
        if (entry == "") {
            continue;
        }
        
        /* Create a view element to hold the path entry. */
        elem = Program.newViewStruct('xdc.runtime.System', 'XDCPATH');
        
        /* Add the path entry to the view. */
        elem.entry = entry;
        elements[elements.length] = elem;    
    }   
    
    view.elements = elements;
}

/*
 *  ======== validate ========
 */
function validate()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg" || !this.$used) {
        return;
    }

    /* Check if the System's gate is not blocking and cannot be
     * preempted.
     */
    var IGateProvider = xdc.module('xdc.runtime.IGateProvider');
    var Del = this.Module_GateProxy.delegate$;
    if (Del.queryMeta(IGateProvider.Q_BLOCKING) == true
        || Del.queryMeta(IGateProvider.Q_PREEMPTING) == true) {
        this.$logWarning(
            "System's gate may block the caller: "
                + "ensure that all threads that can call an xdc.runtime "
                + "method are capable of being blocked",
            this, null);
    }

    /* exitFxn should not be null */
    if (this.exitFxn == null) {
        this.$logError("The configuration parameter exitFxn cannot be null.",
                       this, "exitFxn");
    }

    /* abortFxn should not be null */
    if (this.abortFxn == null) {
        this.$logError("The configuration parameter abortFxn cannot be null.",
                       this, "abortFxn");
    }
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


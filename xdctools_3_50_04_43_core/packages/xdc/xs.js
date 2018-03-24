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
 
Packages.org.mozilla.javascript.Context.getCurrentContext().setLanguageVersion(
    Packages.org.mozilla.javascript.Context.VERSION_1_7);
var prompts = ["xs> ", "... "];

/* _setup functions are intentionally declared as undeclared assignments (no
 * 'var' so we can remove them from the namespace when not needed anymore.
 * Also, any variable from the function scope is not visible in the global
 * scope.
 */
_setupCurrentPackage = function() {
    var file = new java.io.File('./package.xdc');
    if (file.exists()) {
        var scan = new Packages.xdc.services.intern.cmd.Scan(xdc.$$private.Env);
        var _pkgname = "" + scan.readName("package.xdc");
        xdc.$$private.Env.setCurPkgBase('.', _pkgname);
    }
    else {
        xdc.$$private.Env.setCurPkgRoot('');
    }
};

_setupTrace = function() {
    var Trace = xdc.module('xdc.services.global.Trace');
    if (environment['xdc.traceLevel']) {
        Trace.setLevel(parseInt(environment['xdc.traceLevel'].toString()));
    }
    if (environment['xdc.traceCapsules']) {
        Trace.capsuleEnable(environment['xdc.traceCapsules'].split(";"));	
    }
    if (environment['xdc.tracePackages']) {
        Trace.packageEnable(environment['xdc.tracePackages'].split(";"));	
    }
    var previousGroups = [];
    if (environment['xdc.traceGroups']) {
        previousGroups = environment['xdc.traceGroups'].split(";");
        Trace.groupEnable(previousGroups);	
    }
    if (environment['xdc.traceEnable']) {
        var simpleInput = environment['xdc.traceEnable'];
        if (simpleInput == "all") {
            Trace.setLevel(utils.trace.$maxLevel);
            previousGroups.push("all");
            Trace.groupEnable(previousGroups);
        }
        else if (simpleInput == "load") {
            Trace.setLevel(utils.trace.$maxLevel);
            previousGroups.push("packageLoad");
            Trace.groupEnable(previousGroups);
        }
        else {
            Trace.setLevel(utils.trace.$maxLevel);
            Trace.capsuleEnable(environment['xdc.traceEnable'].split(";"));
        }
    }
    try {
        /* this try-catch is necessary for situations where a version of xdctools
	 * that does not have xdc.Warnings is placed on the package path ahead
	 * of this version; xs.js loads the old xdc package that does not have the
	 * Warnings module.
	 */
	var Warnings = xdc.module('xdc.Warnings');
	if (environment['xdc.warningsSuppress']) {
            Warnings.disable(environment['xdc.warningsSuppress'].split(";"));
	}
    }
    catch (e) {
	print("xs.js: xdc.Warnings failure: package path: " + environment["xdc.path"]);
    }
};

/* necessary to bootstrap!!! */
addJars(environment['xdc.root'] + '/packages/xdc/services/intern/cmd/java');
addJars(environment['xdc.root'] + '/packages/xdc/services/intern/gen/java');
addJars(environment['xdc.root'] + '/packages/xdc/services/spec/java');  
                
/* Set up the xdc root object using default xdc.path. Inside xdc/xdc.tci
 * there are calls to xdc.services.global.Env class, where the package path is
 * being set.
 */
utils.loadCapsule('xdc/xdc.tci');
                
/* if we're in a package, define this as the current package */
_setupCurrentPackage();

environment["xdc.rootDir"] = environment["config.rootDir"];

/* om2.xs capsule accesses xdc.global assuming it's the top-level scope,
 * while xdc.tci sets xdc.global to the local scope of the capsule.
 */
xdc.global = this;
                
xdc.loadCapsule('xdc/om2.xs');

_setupTrace();
utils._tracePrint("xs.js begin", "xdc/xs.js", "xdc", ["bench"], 1);
               
/* interpret the arguments */
if (arguments[0] == "-m") {
    arguments.shift();
    mod = arguments.shift();
    /* 'mod' is the name of the module to be found on XDCPATH */
    if (mod == null) {
        throw xdc.$$XDCException("xdc.TOOL_USAGE_ERROR",
            "xs: option -m must be followed by a module name");
    }
                    
    environment["xdc.scriptName"] = mod;

    Cap = xdc.module(mod.replace(/\//g, '\.'));
    if ("main" in Cap) {
        var save = utils.csd;
        utils.csd = Cap.$package.packageBase;
        Cap.main(arguments);
        utils.csd = save;
    }
    else {
        throw xdc.$$XDCException("xdc.MODULE_UNDEFINED_MAIN_FUNCTION",
            "the module '" + mod + "' does not define a main() function");
    }
    delete Cap;
    delete mod;
}
                
else if (arguments[0] == "-f" || arguments[0] == "-c") {
    flag = arguments.shift();
    spath = './' + ';' + xdc.curPath();
    fname = arguments.shift();
    if (fname == null) {
        throw xdc.$$XDCException("xdc.TOOL_USAGE_ERROR", "xs: option " + flag
            + " must be followed by a file name");  
    }
    environment["xdc.scriptName"] = fname;

    cname = utils.findFile(fname, spath, ';');
    if (cname == null) {
        throw xdc.$$XDCException("xdc.FILE_NOT_FOUND", "xs: can't find '"
            + fname + "' along the path '" + spath + "'"
            + "; Ensure that environment variable XDCPATH is set correctly."
            + "  For further details refer XDC Getting Started Guide in"
            + " <xdc_install_dir>/docs");
    }
                
    if (flag == "-c") {
        Cap = xdc.loadCapsule(cname);
        if (typeof Cap.main != "function") {
            throw xdc.$$XDCException("xdc.UNDEFINED_MAIN_FUNCTION",
                "the capsule '" + cname + "' does not define a main() function");
        }
        Cap.main(arguments);
        delete Cap;
    }
    else {
        utils.load(cname);
    }
    delete cname;
    delete flag;
    delete spath;
    delete fname;
}

/* If '-f', '-m' or '-c' are not specified, the first argument is the name of a
 * package. The module Main in that package is loaded, and its function main()
 * is invoked.
 */
else if (arguments[0] != undefined) {
    pkgName = arguments.shift();
    if (pkgName == "xdc.cfg") {
        xdc.$$make_om('cfg');
    }
    pkg = xdc.loadPackage(pkgName);
    environment["xdc.scriptName"] = pkgName + ".Main";
    if ("Main" in pkg) {
        if ("main" in pkg.Main) {
            save = utils.csd;
            utils.csd = pkg.packageBase;
            pkg.Main.main(arguments);
            utils.csd = save;
            delete save;
        }
        else {
            throw xdc.$$XDCException("xdc.UNDEFINED_MAIN_FUNCTION",
                "the module '" + pkg.Main.$name +"' does not define a main() "
                + "function");
        }
    }
    else {
        throw xdc.$$XDCException("xdc.UNDEFINED_MAIN_FUNCTION", "the package '"
            + pkgName + "' does not have a module 'Main'");
    }
    delete pkgName;
    delete pkg;
}

delete _setupCurrentPackage;
delete _setupTrace;
utils._tracePrint("xs.js end", "xdc/xs.js", "xdc", ["bench"], 1);
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:08; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


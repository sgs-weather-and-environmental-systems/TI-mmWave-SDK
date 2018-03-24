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
var bldPkg = xdc.om["xdc.bld"];

var _Clock = xdc.module("xdc.services.global.Clock");

/*
 *  ======== initializeModel ========
 */
function initializeModel(args)
{
    xdc.$$make_om('bld');       /* create and name this object model */

    /* load build model's modules and interfaces */
    xdc.loadPackage('xdc.bld');

    /* init global objects */
    xdc.global.Pkg = xdc.om['xdc.bld.PackageContents'];
    xdc.global.Build = xdc.om['xdc.bld.BuildEnvironment'];

    /* bind the root object for this model in the generic "OM" */
    xdc.om.$$bind('$root', Pkg);

    /* scan the package's modules and interfaces */
    Build.$private.scanPkg(Pkg);

    /* run the config.bld script */
    var $save = xdc.global.arguments;
    xdc.global.arguments = args;
    Build.$private.sourceCfg(args[0]);
    xdc.global.arguments = $save;
}

/*
 *  ======== BuildEnvironment.onInit ========
 *  Called when the singleton Build Module Value is first
 *  created.
 *
 *  Context:
 *      this    the Build Module Value
 *  Params:
 *  Returns:
 *      void
 */
function onInit() {

    /*
     *  ======== scanPkg ========
     *  Read package.xdc and populate the pkg object with the
     *  information declared there:
     *      pkg.name        string name of package
     *      pkg.modules     array of modules in this package
     *      pkg.interfaces  array of interface in this package
     *
     *  Params:
     *     pkg      xdc.bld.PackageContents module
     *
     *  Returns
     *      void
     *
     *  Throws
     *      exceptions thrown are for fatal errors
     */
    function scanPkg(pkg)
    {
        var file = new java.io.File("package.xdc");
        if (file.exists()) {
            var scan = new Packages.xdc.services.intern.cmd.Scan(
                xdc.$$private.Env
            );

            pkg.name = "" + scan.read("package.xdc", false);
            pkg.$seal("name");

            pkg.version = "" + scan.getKey();
            pkg.$seal("version");

            var a = scan.getModules();
            for (var i = 0; i < a.length; i++) {
                pkg.modules[pkg.modules.length++] = "" + a[i];
            }
            pkg.modules.$seal();

            var a = scan.getInterfaces();
            for (var i = 0; i < a.length; i++) {
                pkg.interfaces[pkg.interfaces.length++] = "" + a[i];
            }
            pkg.interfaces.$seal();

            var a = scan.getImports();
            for (var i = 0; i < a.length; i++) {
                pkg.imports[pkg.imports.length++] = "" + a[i];
            }
            pkg.imports.$seal();
        }
    }

    /*
     *  ======== sourceCfg ========
     *  Source global build configuration file and do light semantic
     *  processing prior to running package specific build script.
     *  This script typically loads packages of targets and configures
     *  the targets for the build environment.
     *
     *  The sourced file may set useTargets and excludeTargets and
     *  configure various targets.  sourceCfg checks that all targets
     *  included have their rootDir set and propagates the rootDir
     *  setting to any target that declares another as its base (see
     *  ITarget).
     *
     *  Params:
     *      file        string naming the file to load and execute.
     *                  This file is searched for along the import path
     *                  (which includes the package path)
     *  Returns
     *      void
     *  Throws
     *      exceptions thrown are for fatal errors
     */
    function sourceCfg(cfgFile)
    {
        /* import the user's "global" configuration of the target tools */

        /*  we expand to an absolute file name to ensure that importFile()
         *  doesn't find the file in the current script directory (which in
         *  this case is the bld package directory); e.g., "./config.bld"
         *  should be found along the import path rather than in bld/.
         */
        cfgFile = (new java.io.File(cfgFile)).getAbsolutePath() + "";
        xdc.$$trace("xdc.bld loading " + cfgFile, 1, ["xdccore"]);
        utils.importFile(cfgFile);

        /* This case, where config.bld caused an error but there is no
         * exception can't be reproduced. This is most likely a leftover from
         * an older error handling architecture.
         */
        if (utils.hasReportedError()) {
            throw xdc.$$XDCException("xdc.bld.TARGET_CONFIG_ERROR",
                "Error in configuration. Check '" + cfgFile + "'");
        }

        _Clock.print("bld: config.bld loaded.");

        /* initialize build model's native target (if necessary) */
        var nativeName;
        if (this.bld.nativeTarget == null) {
            if (this.bld.hostOSName == "Windows") {
                nativeName = "microsoft.targets.Win32";
            }
            else if (this.bld.hostOSName == "Linux") {
                nativeName = "gnu.targets.Linux86_64";
            }
            else if (this.bld.hostOSName == "MacOS") {
                nativeName = "gnu.targets.Mac86_64";
            }
            if (nativeName != null && (nativeName in xdc.om)) {
                this.bld.nativeTarget = xdc.om[nativeName];
            }
        }

        /* initialize build model's targets array (if necessary) */
        if (this.bld.targets.length == 0) {
            var inc, xcl;
            if ((inc = this.bld.useTargets) === undefined) {
                if ((inc = environment["xdc.bld.targets"]) == null) {
                    inc = "";
                }
            }
            if (inc == "") {
                inc = "native";
            }
            if (inc != null) {
                if (this.bld.excludeTargets != null) {
                    xcl = this.bld.excludeTargets;
                }
                _exportTargets(this.bld.targets, inc, xcl, true);
            }
        }

        _Clock.print("bld: exported targets.");

        /* initialize all targets */
        for (var i = 0; i < this.bld.targets.length; i++) {
            var targ = this.bld.targets[i];
            if (targ == undefined) {
                throw xdc.$$XDCException("xdc.bld.TARGET_CONFIG_ERROR",
                "Undefined target found in Build.targets (at index = "
                    + i + "). "
                    + this.bld.printBuildTargets());
            }

            if (targ instanceof this.bld.$package.ITarget.Module) {
                var index = this.targsTab[targ.suffix];
                /* check for duplicate suffixes in the target array */
                if (index != null) {
                    var otarg = this.bld.targets[index];
                    var msg;
                    if (otarg.$name != targ.$name) {
                        msg = "The target '" + targ.$name 
                            + "' has the same suffix as the target '" 
                            + otarg.$name + "'";
                    }
                    else {
                        msg = "The target '" + targ.$name 
                            + "' appears more than once in the Build.targets array";
                    }
                    throw xdc.$$XDCException("xdc.bld.DUPLICATE_TARGET_ERROR",
                                             msg);
                }

                this.targsTab[targ.suffix] = i;  /* fill in targsTab hash */

                /* white space support for Windows (CQ18010) */
                if (targ.rootDir != null && targ.rootDir.match(/\s+/) &&
                    this.bld.hostOSName == "Windows") {
                    var file = xdc.module('xdc.services.io.File');
                    targ.rootDir = file.getDOSPath(targ.rootDir);
                }

                /* patch targets that fail to initialize t_Size */
                var t = targ.stdTypes["t_Size"];
                if (t == null || t.align == null || t.size == null) {
    //              print("patching target " + targ.name + "'s t_Size ...");
                    targ.stdTypes.$unseal();
                    targ.stdTypes["t_Size"] = targ.stdTypes["t_Int"];
                    targ.stdTypes.$seal();
                }

                /* propagate rootDir to targets that don't have it defined */
                if (targ.rootDir == null && targ.base != null) {
                    targ.rootDir = targ.base.rootDir;
                }
                if (targ.rootDir == null) {
                    throw xdc.$$XDCException("xdc.bld.ROOTDIR_NOT_SET",
                        "'rootDir' has not been set for the target "
                        + targ.$name + "; define 'rootDir' in "
                        + java.lang.System.getenv("XDCBUILDCFG"));
                }

                /* initialize target's and platforms array and default plat */
                if (targ.platforms == null) {
                    targ.platforms = [];
                }
                if (targ.platform == null) {
                    if (targ.platforms.length > 0) {
                        targ.platform = targ.platforms[0];
                    }
                }
                if (targ.platforms.length == 0) {
                    if (targ.platform != null) {
                        targ.platforms.length = 1;
                        targ.platforms[0] = targ.platform;
                    }
                }
            }
        }
        _Clock.print("bld: initialized targets defaults.");

        /* seal target to prevent user from changing in package.bld */
        for (var i = 0; i < this.bld.targets.length; i++) {
            var targ = this.bld.targets[i];
            targ.$seal();   /* must do this in a separate loop from above
                             * because seal follows references.  A seal of
                             * targ will also seal targ.base; e.g., sealing
                             * C64 will seal the C62 before the C62 is
                             * initialized!
                             */
        }

        _Clock.print("bld: targets sealed.");
        /* BUG?: should we fail if bld.targets is empty? */

        /* seal (make readonly) the fields that should not be modified
         * by package.bld scripts
         */
        this.bld.targets.$seal();
        this.bld.$seal("useTargets");
        this.bld.$seal("platformTable");
        this.bld.$seal("excludeTargets");
        this.bld.$seal("nativeTarget");
    }

    /* initialize private state */
    var priv = this.$private;   /* private Build Module state */

    /* private methods/data that we don't want scripts to see */
    priv.scanPkg   = scanPkg;
    priv.sourceCfg = sourceCfg;
    priv.bld       = this;
    priv.targsTab  = {};
}

/*
 *  ======== BuildEnvironment.usePlatform ========
 */
function usePlatform(platformName)
{
    if (!(typeof platformName == "string")) {
        throw xdc.$$XDCException("xdc.bld.PARAMETER_MISMATCH",
            "Parameter must be a string: was passed " + platformName);
    }

    var plat = this.platforms[platformName];

    if (plat == null) {
        var pa = platformName.split(':');

        /* load platform package */
        var pkg = xdc.loadPackage(pa[0]);

        /* create platform instance */
	var args = this.platformTable[platformName];
        plat = pkg.Platform.create(
            platformName.substring(pa[0].length + 1),
            args == null ? {} : args);

        this.platforms[platformName] = plat;
    }

    return (plat);
}

/*
 *  ======== BuildEnvironment.printBuildTargets ========
 */
function printBuildTargets()
{
    if (this.targets.length == 0) {
        return ("No target modules were loaded.\n");
    }
    var str = "Valid Build Targets:\n";
    for (var i = 0; i < this.targets.length; i++) {
        if (this.targets[i] != undefined) {
             str = str + this.targets[i].$name + "\n";
        }
    }

    return str;
}


/*
 *  ======== BuildEnvironment.isInTargetsArray ========
 */
function isInTargetsArray(targ)
{
    return (this.$private.targsTab[targ.suffix] == null ? false : true);
}

/*
 *  ======== BuildEnvironment.getReleaseDescs ========
 */
function getReleaseDescs(pname)
{
    var result = [];

    /* locate the package.bld.xml file (which describes a package's releases */
    var xname = xdc.getPackageBase(pname) + "/package/package.bld.xml";
    var xfile = new java.io.File(xname);
    if (!xfile.exists()) {
        throw xdc.$$XDCException("xdc.bld.PACKAGE_NOT_BUILT", "The package '"
            + pname + "' has not been built. Try re-building the package.");
    }

    /* parse the XML file */
    var doc = Packages.xdc.services.global.XML.parse(xname);
    if (doc == null) {
        throw xdc.$$XDCException("xdc.bld.INVALID_PACKAGE", "The package '"
            + pname + "' has an invalid package.bld.xml file (" + xname
            + "). Try re-building the package.");
    }

    /* extract from this file the release information */
    var rels = Packages.xdc.services.global.XML.getHMaps(doc, "releases",
        ["name", "label", "pname"]); /* pname stands for "physical name" */

    /* create the release description objects */
    for (var i = 0; i < rels.length; i++) {
        var obj = rels[i];
        var desc = new xdc.om['xdc.bld.Release'].Desc({
            name:  obj.get("name"),
            aname: obj.get("pname"),
            label: obj.get("label")
        });
        result.push(desc);
    }

    return (result);
}

/*
 *  ======== _exportTargets ========
 *  Given the names (or patterns) of modules that implement ITarget, add
 *  each to the array of targets in build.
 */
function _exportTargets(targArray, list, exclude, warnings)
{
    var ta = list.split(/[,;:\s]+/);
    var ma = xdc.om.$modules;
    var targets = [];
    var ep = exclude == null ? null : new RegExp(exclude);

    /* put all matching targets into local targets array */
    for (var j = 0; j < ta.length; j++) {

        /* check for "native" target */
        if (ta[j] == "native" && bldPkg.BuildEnvironment.nativeTarget != null) {
            targArray[targArray.length++] = bldPkg.BuildEnvironment.nativeTarget;
            continue;
        }

        /* match name against target module names */
        var pattern = new RegExp(ta[j]);
        var found = false;
        var tmp;
        for (var i = 0; i < ma.length; i++) {
            var sname = ma[i].$name;
            if ((tmp = sname.match(pattern)) != null && tmp[0] == sname) {
                if (ep != null
                    && (tmp = sname.match(ep)) != null && tmp[0] == sname) {
                    continue;
                }
                if (ma[i] instanceof bldPkg.ITarget.Module) {
                    targArray[targArray.length++] = ma[i];
                    found = true;
                }
            }
        }

        /* try appending the TI package prefix to the target specification */
        if (found == false) {
            for (var i = 0; i < ma.length; i++) {
                var sname = ma[i].$name;
                if (("ti.targets." + ta[j]) == sname
                    && ma[i] instanceof bldPkg.ITarget.Module) {
                    if (ep != null
                        && (tmp = sname.match(ep)) != null && tmp[0] == sname){
                        continue;
                    }
                    targArray[targArray.length++] = ma[i];
                    found = true;
                    break;
                }
            }
        }

        /* if no match is found for a pattern, print a warning */
        if (found == false && warnings == true) {
            print("Warning: Target specification '" + ta[j] +
                "' does not match any loaded target module.\n" +
                xdc.module('xdc.bld.BuildEnvironment').printBuildTargets());
        }
    }
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:15; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


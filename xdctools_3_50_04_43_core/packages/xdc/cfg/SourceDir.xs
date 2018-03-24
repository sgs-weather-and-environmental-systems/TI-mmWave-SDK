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
 *  ======== SourceDir.xs ========
 */

var srcDirs = {};   /* all "registered" output source directories */

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    var v = environment["xdc.cfg.SourceDir.verbose"];
    if (v != null) {
        if (!isNaN(Number(v))) {
            this.verbose = Number(v);
        }
        else if (v == "true") {
            this.verbose = 3;
        }
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    if (this.outputDir == null) {
        /* set the default generation output directory */
        var outputDir = environment["xdc.cfg.SourceDir.outputDir"];

        /* if not set in the environment, default to known layouts */
        if (outputDir == null) {
            if (xdc.om.$name == "cfg") {
                /* default to CCS physical design */
                if (Program.build.cfgScript != null) {
                    outputDir = java.io.File(Program.build.cfgScript).parent;
                    this.toBuildDir = "..";
                }
            }
            if (outputDir == null) {
                /* if not in the cfg model or no script is provided
                 * assume xdc physical design 
                 */
                outputDir = ".";
                this.toBuildDir = ".";
            }
            outputDir = outputDir + "/src";
        }
        else {
            outputDir = unescape(outputDir);
        }

        this.outputDir = String(outputDir);
    }
    if (this.toBuildDir == null) {
        /* if we get here, this.outputDir has been set by user */
        this.toBuildDir = ".";
    }

    /* if necessary, remove white space in directory name */
    if (this.outputDir.match(/\s/)) {
        var File = xdc.module("xdc.services.io.File");
        this.outputDir = File.getDOSPath(this.outputDir);
    }
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(name)
{
    if (name == null) {
        this.$module.$logFatal("The source name must not be null.", 
            this, "name");
    }

    /* remove trailing '/'s to allow name to be a prefix and a directory name */
    name = name.replace(/\/+$/, "");

    if (srcDirs[name]) {
        this.$module.$logError("The source output directory '"
            + name + "' already exists.", this, "name");
    }
    srcDirs[name] = true;

    this.$private.name = name;

    if (this.sourceDir == null) {
        this.sourceDir = name;
    }
    if (this.libraryName == null) {
        this.libraryName = this.sourceDir + '/'
            + (name == "" ? "a" : name) + ".lib";
    }
}

/*
 *  ======== build ========
 */
function build()
{
    var result = 0;
    var verbose = this.verbose;
    
    var goals = "";
    var buildAll = true;
    for (var i = 0; i < this.$instances.length; i++) {
        var lib = this.$instances[i];
        if (lib.buildLibs) {
            goals += " " + lib.$private.name;
        }
        else {
            buildAll = false;
        }
    }

    /* if no one "registered" for a build, return */
    if (goals == "") {
        return (result); /* nothing to do */
    }

    /* if everyone registered for a build, use the default all goal */
    if (buildAll) {
        goals = "";
    }

    /* try to use $XDCROOT/gmake, otherwise hope it's along user's path */
    var gmake = environment["xdc.root"] + "/gmake";
    if (!java.io.File(gmake).exists()) {
        gmake = gmake + ".exe";
    }
    if (!java.io.File(gmake).exists()) {
        gmake = java.lang.System.getenv("XDCTOOLS_GMAKE");
        if (gmake == null) {
            gmake = "gmake";
            this.$logWarning("can't find gmake in $XDCROOT (" 
                + environment["xdc.root"]
                + "), trying " + gmake 
                + " along your path instead.\n    info: To eliminate this warning, set the environment variable 'XDCTOOLS_GMAKE' to the name of a GNU make 3.81 compatible command along your path.", this);
        }
    }

    /* do the build ... */
    var genDir = String(java.io.File(this.outputDir).getAbsolutePath());
    /* if necessary, remove white space in directory name */
    if (genDir.match(/\s/)) {
        var File = xdc.module("xdc.services.io.File");
        genDir = File.getDOSPath(genDir);
    }
    genDir = genDir.replace(/\\/g, "/");
    var buildCmd = gmake + ' -f ' + genDir + '/' + this.makefileName
                         + ' GEN_SRC_DIR=' + genDir
                         + goals;
    if (verbose) {
        print('Starting build of library sources ...');
        if (verbose > 2) {
            print('    cd ' + genDir);
            print('    ' + buildCmd);
        }
    }
    var status = {};

    /* get MAKEFLAGS passed from make to underlying recursive make */
    var makeflags = String(java.lang.System.getenv("MAKEFLAGS"));

    /* ensure directory changes are printed (to enable Eclipse error parser 
     * to track location of source files that trigger errors/warnings)
     */
    makeflags = makeflags.replace(/--no-print-directory/g, "");

    /* remove -s option to enable verbose output from underlying make */
    makeflags = makeflags.replace(/-sRr/g, "-Rr");

    /* remove jobserver options added by make when --jobs is used (to prevent
     *     "jobserver unavailable: using -j1. ..." warnings from make)
     */
    makeflags = makeflags.replace(/--jobserver-fds=\d+,\d+ -j /, "");

    result = xdc.exec(buildCmd, {
            /* re-define MAKEFLAGS/MAKELEVEL to enable make's directory output
             * to assist error parsers locate the files named in compiler
             * error messages
             */
            envs: ["MAKEFLAGS=" + makeflags, "MAKELEVEL=0"],
            useEnv: true,
            merge: false,
            outStream: (verbose > 1) ? java.lang.System.out : null,
            errStream: (verbose > 1) ? java.lang.System.err : null,
            cwd   : genDir}, status);

    if (verbose) {
        print("Build of libraries " + (result ? "failed." : "done."));
    }

    if (result) {
        this.$logError(
            "Build of generated source libraries failed: exit status = "
            + status.exitStatus
            + ((status.errors != null) ? (":\n" + status.errors) : ""), this);
        result = status.exitStatus;
    }

    return (result);
}

/*
 *  ======== getName ========
 */
function getName()
{
    return (this.$private.name);
}

/*
 *  ======== getGenSourceDir ========
 */
function getGenSourceDir()
{
    return (this.$module.outputDir + '/' + this.sourceDir);
}

/*
 *  ======== getGenLibraryName ========
 */
function getGenLibraryName()
{
    return (this.$module.outputDir + '/' + this.libraryName);
}

/*
 *  ======== getRelativePath ========
 */
function getRelativePath(fm, to)
{
    var cFm = String(java.io.File(fm).getCanonicalPath()).replace(/\\/g, '/');
    var cTo = String(java.io.File(to).getCanonicalPath()).replace(/\\/g, '/');
    
    if (cFm == cTo) {
        return ('.');
    }

    /* find longest common prefix */
    var len = cFm.length;
    for (var i = 0; i < cFm.length; i++) {
        if (cFm[i] != cTo[i]) {
            /* cFm and cTo differ at j, backup to find closest '/' */
            for (var j = i - 1; j >= 0; j--) {
                if (cFm[j] == '/') {
                    len = j;
                    break;
                }
            }
            break;
        }
    }

    /* get cTo suffix */
    var toSuffix = cTo.substr(len + 1);

    /* convert cFm to the right number of ../'s */
    var up = cFm.substr(len).replace(/\/[^\/]+/g, '../');

    return (up + toSuffix);
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


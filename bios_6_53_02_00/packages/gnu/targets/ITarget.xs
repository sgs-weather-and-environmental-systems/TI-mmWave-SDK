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
var debug;
if (debug == null) {
    debug = function (msg) {};
}

var _bldUtils = xdc.useModule('xdc.bld.Utils');
var _utils = xdc.loadCapsule("gnu/targets/_utils.xs");

/*
 *  ======== _targetEnvs ========
 *  Environment variable settings required for the compile/link/archive
 *  commands.
 */
var _targetEnvs = "LD_LIBRARY_PATH=";

/*
 *  ======== ITarget.archive ========
 */
function archive(goal)
{
    var target = this;
    var result = null;
    var tool2cmd = _utils._mkCmds(target);

    if (tool2cmd != null) {
        result = new xdc.om['xdc.bld'].ITarget.CommandSet;
        result.msg = "archiving " + goal.files + " into $@ ...";
        result.envs = _targetEnvs.split("\n");
        result.cmds = _bldUtils.expandString(tool2cmd["ar"], {
            AROPTS_P:   target.arOpts.prefix,
            AROPTS_S:   target.arOpts.suffix,
            GCCVERS:    target.GCCVERS,
            GCCTARG:    target.GCCTARG,
            LONGNAME:   target.LONGNAME,
            aropts:     goal.opts,
            files:      goal.files
        });
    }

    return (result);
}

/*
 *  ======== ITarget.asmName ========
 */
function asmName(cname)
{
    return (cname);
}

/*
 *  ======== ITarget.compile ========
 */
function compile(goal) {
    return (_compile(this, goal, false));
}

/*
 *  ======== ITarget.link ========
 */
function link(goal)
{
    var target = this;
    var result = null;
    var tool2cmd = _utils._mkCmds(target);
    var fileList = goal.files;

    if ((target.$name != "gnu.targets.Mingw" && target.BINVERS >= "2.19")
        || target.noStdLinkScript) {
        fileList = goal.files.replace(/(^|\s+)(\S+\.xdl)($|\s+)/,
            " -Wl,-T,$2 ");
    }
    else if (target.BINVERS == "") {
      /* support for LLVM linker used by MacOS */
        fileList = goal.files.replace(/(^|\s+)(\S+\.xdl)($|\s+)/,
            " @$2 ");
    }

    var lib = "";
    /*
     * bspLib is a config param that can be added to the target. If it is
     * present, it is expected to contain the name of the BSP library.
     * The specified library is included on the link line.
     *
     * Acceptable values for this field are "nosys" and "rdimon".
     */
    if (("bspLib" in target) && target.bspLib != null) {
        lib = " --specs=" + target.bspLib + ".specs";
    }

    if (tool2cmd != null) {
        result = new xdc.om['xdc.bld'].ITarget.CommandSet;
        result.msg = "lnk" + target.suffix + " $@ ...";
        result.envs = _targetEnvs.split("\n");
        result.cmds = _bldUtils.expandString(tool2cmd["link"], {
            LOPTS_P:    target.lnkOpts == null ? "" : target.lnkOpts.prefix,
            LOPTS_S:    target.lnkOpts == null ? "" : (target.lnkOpts.suffix + lib),
            GCCVERS:    target.GCCVERS,
            GCCTARG:    target.GCCTARG,
            LONGNAME:   target.LONGNAME,
            lopts:      goal.opts,
            files:      fileList
        });
    }

    return (result);
}

/*
 *  ======== ITarget.genVisibleData ========
 *
 *  This function is invoked at the config time, therefore we can check the
 *  build profile.
 */
function genVisibleData(quals, types, names)
{
    if (xdc.om.$name != 'cfg') {
        return (null);
    }

    var sb = new java.lang.StringBuilder();
    for (var i = 0; i < names.length; i++) {
        sb.append(quals[i] + " " + types[i] + " " + names[i]
            + " __attribute__ ((externally_visible));\n");
    }
    return (sb.toString() + "");
}

/*
 *  ======== genVisibleFxns ========
 */
function genVisibleFxns(types, names, args)
{
    if (xdc.om.$name != 'cfg') {
        return (null);
    }

    var sb = new java.lang.StringBuilder();
    for (var i = 0; i < names.length; i++) {
        sb.append(types[i] + " " + names[i] + "(" + args[i] + ")"
            + " __attribute__ ((externally_visible));\n");
    }
    return (sb.toString() + "");
}

/*
 *  ======== ITarget.getVersion ========
 */
function getVersion()
{
    var target = this;

    _utils._mkCmds(target);

    var result = target.$name + "{";
    var key;

    if ((key = target.versionMap["gcc" + target.GCCVERS]) == null) {
        /* map 2.3.4 to "1,0,2.3,4", 2.3 to "1,0,2.3", and 2 to "1,0,2" */
        key = "1,0";
        var va = target.GCCVERS.split('.');
        for (var i = 0; i < va.length; i++) {
            key += (i == 1 ? '.' : ',') + va[i];
        }
    }
    result += key;

    return (result);
}

/*
 *  ======== ITarget.getRawVersion ========
 */
function getRawVersion()
{
    var target = this;
    _utils._mkCmds(target);;
    return (target.GCCVERS);
}


/*
 *  ======== ITarget.scompile ========
 */
function scompile(goal) {
    return (_compile(this, goal, true));
}

/*
 *  ======== _compile ========
 */
function _compile(target, goal, asm)
{
    var result = null;
    var tool2cmd = _utils._mkCmds(target);    /* get tool to template map */

    if (tool2cmd != null) {
        var ext = target.extensions[goal.srcSuffix];
        if (ext != null) {
            if (asm == true && ext.typ == "asm") {
                return (null);
            }

            result = new xdc.om['xdc.bld'].ITarget.CommandSet;
            result.msg = (ext.typ == "c" ? "cl" : ext.typ)
                            + target.suffix
                            + (asm == true ? " -S $< ..." : " $< ...");

            var dstDir = goal.dstPrefix + goal.base;
            dstDir = dstDir.replace(/[^\/\\]*$/, "");

            var ccoptsPre = target.ccOpts.prefix;
            var ccoptsSuf = target.ccOpts.suffix;
            /* If the target defines ccConfigOpts, they should be used
             * instead of ccOpts. The string expansion has to be done here,
             * in the case ccConfigOpts contains COPTS. If the expansion was
             * left for the end of the function, there would be an infinite
             * recursion.
             */
            if ("ccConfigOpts" in target && goal.configOpts == true) {
                ccoptsPre = _bldUtils.expandString(target.ccConfigOpts.prefix,
                    {"ccOpts.prefix": target.ccOpts.prefix});
                ccoptsSuf = _bldUtils.expandString(target.ccConfigOpts.suffix,
                    {"ccOpts.suffix": target.ccOpts.suffix});
            }

            result.envs = _targetEnvs.split("\n");

            result.cmds = _bldUtils.expandString(tool2cmd[ext.typ], {
                COPTS_P:    ccoptsPre,
                COPTS_S:    ccoptsSuf,
                AOPTS_P:    target.asmOpts.prefix,
                AOPTS_S:    target.asmOpts.suffix,
                GCCVERS:    target.GCCVERS,
                GCCTARG:    target.GCCTARG,
                LONGNAME:   target.LONGNAME,
                ASMONLY:    asm ? "-S" : "",
                dstDir:     dstDir,
                srcExt:     goal.srcSuffix,
                copts:      goal.configOpts ? goal.opts.cfgcopts :
                                              goal.opts.copts,
                aopts:      goal.opts.aopts,
                defs:       goal.opts.defs,
                incs:       goal.opts.incs
            });
        }
    }

    return (result);
}

/*
 *  ======== _init ========
 *  Initialize this capsule at package init time.
 */
function _init(pkg)
{
    _thisPkg = pkg;
}

/*
 *  ======== initVers ========
 *  Initialize target.GCCVERS, target.GCCTARG and target.BINVERS, if they are
 *  not already initialized by a previous call to initVers() or by the user
 *  via the config.bld script.
 */
function initVers()
{
    var target = this;
    if (target.$private.vers == true || target.rootDir == null) {
        return;
    }

    var prefix = "";
    if (target.remoteHost != null) {
        prefix = target.$package.packageBase
            + "/runh -h " + target.remoteHost + " ";
    }
    else if ("cmdPrefix" in target.$orig
             && target.$orig.cmdPrefix != undefined) {
        prefix = target.$orig.cmdPrefix;
    }

    function askLd(target)
    {
        var ldCmd = target.rootDir + "/bin/ld";
        var queryLd = target.rootDir + "/bin/gcc -print-prog-name=ld";
        var status = {};
        if (xdc.exec(queryLd, null, status) >= 0) {
            ldCmd = status.output.match(/(.*)\s*/)[1];
            /* if full path, use that path for finding BINVERS and for 'ar',
             * else look for 'ld' and 'ar' on PATH.
             */
            target.ar.$unseal("cmd");
            if (!((new java.io.File(status.output)).isAbsolute())) {
                /* binutils are found on the path, we need to fix up 'ar' */
                var status2 = {};
                if (xdc.exec("which ar", null, status2) >= 0) {
                    target.ar.cmd = status2.output.match(/(.*)\s*/)[1];
                }
                else {
                    throw new Error("Cannot determine 'ar' executable: "
                        + status.output);
                }
            }
            else {
                target.ar.cmd 
                    = new java.io.File(ldCmd.match(/(.*)ld\s*$/)[1] + "ar").
                    getCanonicalPath();
            }
            target.ar.$seal("cmd");
        }
        else {
            throw new Error("Cannot determine 'ld' executable: "
                + status.output + ". Ensure that rootDir for the '"
                + target.name + "' target is set correctly in "
                + java.lang.System.getenv("XDCBUILDCFG"));
        }

        var cmd = prefix + ldCmd + " -v";
        status = {};
        if (xdc.exec(cmd, null, status) >= 0) {
            /* codesourcery loaders since 2010-q3 print an internal version
             * number inside parenthesis. We don't want to pick up that one.
             */
            var va = status.output.match(/(?:\(.*\))?\s(\d\.\d+)/);
            if (va != null) {
                return (va[1]);
            }
            else {
                print(target.$name + ": warning: failed to parse '-v' output "
                    + "(= '" + status.output + "'); check compiler options");
            }
        }
        else {
            print(target.$name + ": warning: exec of '" + cmd + "' failed:"
                + status.output + "; check tools installation");
        }

        return ("");
    }

    function askGcc(target, opt, filter)
    {
        var gccCmd = target.rootDir + "/bin/gcc";

        /* If the gcc executable cannot be found, and the prefix is not used,
         * it's probably a misspelled directory path.
         */
        if (prefix == "") {
            var file = new java.io.File(gccCmd);
            if (!file.exists()
                && !(new java.io.File(gccCmd + ".exe").exists())) {
                throw new Error(gccCmd + " cannot be found. Ensure that "
                    + "rootDir for the " + target.name + " target is set "
                    + "correctly in " + java.lang.System.getenv("XDCBUILDCFG"));
            }
        }

        var cmd = prefix + gccCmd + " " + opt;
        var status = {};

        var attrs = null;

        /* If remote execution is run through a script, that script may need
         * PATH or other environment variables.
         */
        if  ("cmdPrefix" in target.$orig
            && target.$orig.cmdPrefix != undefined) {
            attrs = {useEnv: true};
        }

        if (xdc.exec(cmd, attrs, status) >= 0) {
            var va = status.output.match(filter);
            if (va != null) {
                return (va[0]);
            }
            else {
                print(target.$name + ": warning: failed to parse '"
                    + opt + "' output (= '" + status.output + "')"+
           "; check compiler options");
            }
        }
        else {
            print(target.$name + ": warning: exec of '" + cmd + "' failed:"
                + status.output + "; check tools installation");
        }

        return ("");
    }

//      print("setting " + target.$name + ".GCCVERS and .GCCTARG to ''");

    /* BUG: we should compare against target's tool-chain os */
    if (target.GCCTARG != null && target.GCCVERS != null
        && target.BINVERS != null) {
        return;
    }

    target.$unseal("GCCVERS");
    target.$unseal("GCCTARG");
    target.$unseal("BINVERS");

    /* call compiler to get its version number and set GCCVERS */
    var result;
    if (target.GCCVERS == null) {
        if ((result = askGcc(target, "-dumpversion", /^[\d\.]+/)) == "") {
            print(target.$name + ": warning: can't determine gcc version; ");
            print("Check if " + target.rootDir + "/bin/gcc can run on ");
            if (target.remoteHost != null) {
                print(target.remoteHost + ". ");
            }
            else {
                print(xdc.om['xdc.bld'].BuildEnvironment.hostOSName + ". ");
            }
            print("Also, try explicitly setting the GCCVERS configuration "
                + "parameter.");
        }
//      print("setting " + target.$name + ".GCCVERS to " + result);
        target.GCCVERS = result;
    }

    /* call compiler to get its target machine and set GCCTARG */
    if (target.GCCTARG == null) {
        if ((result = askGcc(target, "-dumpmachine", /^[\w-\.]+/)) == "") {
            print(target.$name + ": warning: can't determine gcc target; ");
            print("Check if " + target.rootDir + "/bin/gcc can run on ");
            if (target.remoteHost != null) {
                print(target.remoteHost + ". ");
            }
            else {
                print(xdc.om['xdc.bld'].BuildEnvironment.hostOSName + ". ");
            }
            print("Also, try explicitly setting the GCCTARG configuration "
                + "parameter.");
        }
//      print("setting " + target.$name + ".GCCTARG to " + result);
        target.GCCTARG = result;
    }

    if (target.$name != "gnu.targets.Mingw" && target.BINVERS != "") {
        /* We'll call askLd even if BINVERS is set because we need to find the
         * right path to 'ar'.
         */
        result = askLd(target);
        if (target.BINVERS == null) {
            if (result == "") {
                print(target.$name
                    + ": warning: can't determine binutils version; ");
                print("Check if " + target.rootDir + "/bin/ld can run on ");
                if (target.remoteHost != null) {
                    print(target.remoteHost + ". ");
                }
                else {
                    print(xdc.om['xdc.bld'].BuildEnvironment.hostOSName + ". ");
                }
                print("Also, try explicitly setting the BINVERS configuration "
                    + "parameter.");
            }
            else {
                target.BINVERS = result;
            }
        }
    }

    target.$seal("GCCVERS");
    target.$seal("GCCTARG");
    target.$seal("BINVERS");

    target.$private.vers = true;
}
/*
 *  @(#) gnu.targets; 1, 0, 1,0; 11-8-2017 17:20:10; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */


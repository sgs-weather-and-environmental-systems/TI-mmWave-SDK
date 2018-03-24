/* 
 *Copyright (c) 2008 Texas Instruments and others.
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
 *  ======== Check.xs ========
 *
 */

var trace = this.$trace;    /* create local alias for $trace */

/*
 *  ======== scanBuiltWith ========
 *  Validate that the "built-with" versions of imported packages are
 *  compatible with their actual versions.
 *
 *  Returns an object with the properties wCount, eCount, and msgs, where
 *  wCount and eCount are numbers and msgs is a hash table of errors and
 *  warnings related to a specific package (the index of the hash table).
 *  The eCount and wCount  numerical values indicate the total number of
 *  errors and warnings detected.
 *
 *  If there is no incompatibility wCount == eCount == 0 and msgs is an
 *  empty hash; otherwise msgs contains meaningful error and warning messages
 *  for all incompatibilities found.
 *
 *  PkgArray must be an array of objects that have two properties:
 *      name: the name of the package
 *      base: the base directory for the package
 */
function scanBuiltWith(pkgArray, targetVersion, exclude)
{
    var result = {eCount: 0, wCount: 0, msgs: [], targets: {}};
    var msgs = {};

    /* optionally subset the list of imported packages to check */
    var pkgList = [];
    if (exclude != null) {
        for (var i = 0; i < pkgArray.length; i++) {
            var pkg = pkgArray[i];
            var tmp = pkg.name.match(exclude);
            if (tmp == null || tmp[0] != pkg.name) {
                trace("including package " + pkg.name);
                pkgList.push(pkgArray[i]);
            }
            else {
                trace("excluding package " + pkg.name);
            }
        }
    }
    else {
        pkgList = pkgArray;
    }

    /* get the targets used in all the packages named in pkgList */
    var targets = scanTargets(pkgList, exclude);
    result.targets = targets;

    /* validate the targets against the specified target (or all targets) */
    if (targetVersion != null) {
        var tva = targetVersion.split(/[:{;]/);
        validateTargets(targets, tva[0], tva[1], msgs);
    }
    else {
        /* validate all targets used in all packages */
        for (var tname in targets) {
            validateTargets(targets, tname, null, msgs);
        }
    }

    /*  For every package pkg, check that the packages used to build pkg
     *  are compatible with all of the other packages
     */
    for (var i = 0; i < pkgList.length; i++) {
        var pkg = pkgList[i];

        /* get packages referenced by pkg during its build */
        trace("    imported package " + pkg.name);
        var refs = Packages.xdc.services.global.Vers.getReferences(
                        pkg.base + "/package/package.rel.xml");

        /* for each referenced package, check consistency with imported set */
        for (var j = 0; j < refs.length; j++) {
            var pa = ("" + refs[j]).split("{");
            trace("        built with: " + refs[j]);

            for (var k = 0; k < pkgList.length; k++) {
                var tmp = pkgList[k];

                /* if ref[j] is in the imported set ... */
                if (pa[0] == tmp.name) {
                    /* build tmp's version string from vers number array */

                    var emsg = isCompatible(tmp.name, tmp.vers,
                        pa[1], pkg.name);
                    if (emsg != null) {
                        if (msgs[tmp.name] == null) {
                            msgs[tmp.name] = {
                                errors: [],
                                warnings: [],
                                text: "incompatible use of package '"
                                    + tmp.name + "': imported " + tmp.name
                                    + " [" + tmp.vers + "]"
                            };
                        }
                        var list = emsg.eCount > 0 ?
                            msgs[tmp.name].errors : msgs[tmp.name].warnings;
                        list.push(pkg.name + " was built with " 
                            + tmp.name + " [" + pa[1] + "]");
                    }
                }
            }
        }
    }

    result.msgs = msgs;
    for each (var m in msgs) {
        result.eCount += m.errors.length;
        result.wCount += m.warnings.length;
    }

    return (result);
}

/*
 *  ======== scanTargets ========
 *  Return a hash of all targets used
 *
 *  scanTargets returns a hash indexed by target name (ti.targets.C64).  The
*   value of a target key is an object of the following form:
 *      name: the target's name (i.e., the key)
 *      keys: a hash indexed by package name whose value is the compatibility 
 *            key of the target used to build the package.
 */
function scanTargets(pkgList, exclude)
{
    targets = {};
    
    for (var i = 0; i < pkgList.length; i++) {
        var pkg = pkgList[i];
    
        /* get target version info from pkg */
        var trgs = Packages.xdc.services.global.Vers.getTargetReferences(
                        pkg.base + "/package/package.bld.xml");
    
//      print("package " + pkg.name + " used " + trgs.length + " targets");
        /* add to the targets hash */
        for (var j = 0; j < trgs.length; j++) {
            var ta = ("" + trgs[j]).split("{");
            var tname = ta[0];
            if (exclude == null || tname.match(exclude) == null) {
                var targ = targets[tname];
                var pname = pkg.name + '[' + pkg.vers + ']';
                if (targ == null) {
                    targ = {name: tname, keys: {}};
                    targets[tname] = targ;
                }
                targ.keys[pname] = ta[1];
            }
            else {
                trace("excluding target " + tname);
            }
        }
    }

    return (targets);
}

/*
 *  ======== validateTargets ========
 */
function validateTargets(trgList, targName, targKey, msgs)
{
    var trg = trgList[targName];
    if (trg == null) {
        return;
    }
    
    if (targKey == null) {
        /* compute latest target key */
        for each (var k in trg.keys) {
            targKey = maxKey(targKey, k);
        }
    }

    /* verify compatibility with target version */
    for (var pname in trg.keys) {
        var tmp = trg.keys[pname];
//        print("checking target " + targName +"[" + targKey + "] >= "
//            + tmp + " used by package " + pname);
        var emsg = isCompatible(targName, targKey, tmp, pname);
        if (emsg != null) {
            if (msgs[targName] == null) {
                msgs[targName] = {
                    errors: [],
                    warnings: [],
                    text: "incompatible use of the target '"
                            + targName + "': imported " + targName
                            + " [" + targKey + "]"
                };
            }
            var list = emsg.eCount > 0 ?
                msgs[targName].errors : msgs[targName].warnings;
            list.push(pname + " was built using "
                + targName + " [" + tmp + "]");
        }
    }
}

/*
 *  ======== compareKey ========
 *  returns 1, 0, or -1 according to whether key1 is greater then, 
 *  equal to, or less than key2.
 */
function compareKey(key1, key2)
{
    if (key1 == null && key2 != null) {
        return (-1);
    }
    if (key1 != null && key2 == null) {
        return (1);
    }
    if (key1 == key2) {
        return (0);
    }

    /* versions differ, check version numbers */
    var ava = key1.split(',');
    var bva = key2.split(',');

    /* if one is a version number and the other isn't, fail */
    if (ava == null || bva == null) {
        return (-2);
    }

    /* ensure the len is minumum of length of b and length of a */
    var len = bva.length > ava.length ? ava.length : bva.length;
    
    /* otherwise, we need to interpret the version number to decide */
    for (var i = 0; i < len; i++) {
        /* convert string digits to numbers */
        var a = ava[i] - 0;
        var b = bva[i] - 0;
        if (a > b) {
            return (1);
        }
        else if (b > a) {
            return (-1);
        }
    }

    return (ava.length > bva.length ? 1 : -1);
}

/*
 *  ======== maxKey ========
 */
function maxKey(key1, key2)
{
    return (compareKey(key1, key2) > 0 ? key1 : key2);
}

/*
 *  ======== minKey ========
 */
function minKey(key1, key2)
{
    return (compareKey(key1, key2) < 0 ? key1 : key2);
}

/*
 *  ======== isCompatible ========
 *  Check compatibility when package rname uses version bvers of package
 *  pname during rname's build but version avers is being used in the
 *  current configuration.
 *
 *  Params:
 *      pname - package name
 *      avers - imported (actual) version of package pname
 *      bvers - version referenced during rname's build
 *      rname - name of package referencing package pname
 *
 *  Returns:
 *      null if versions avers and bvers are compatible; otherwise it returns
 *      a string starting with "Error" or "Warning" that indicates the
 *      failure.
 */
function isCompatible(pname, avers, bvers, rname)
{
    trace("checking compatibility between " + pname
        + " (vers = " + avers + ") and vers = " + bvers + " used by " + rname);

    if (avers == bvers) {
        return (null);
    }

    var result = {wCount: 0, eCount: 0, text: ""};
    
    /* versions differ, check version numbers */
    var ava = avers.split(',');
    var bva = bvers.split(',');

    /* if one is a version number and the other isn't, assume incompatible */
    if (ava == null || bva == null) {
        result.wCount = 1;
        result.text = "Warning: can't determine version of " + pname
            + " or the version of " + pname + " used to build " + rname;
        return (result);
    }

    /* otherwise, we need to interpret the version number to decide */
    for (var i = 0; i < bva.length; i++) {
        /* convert string digits to numbers */
        var a = ava[i] - 0;
        var b = bva[i] - 0;

        /* if digits differ (or as non-numeric strings they don't match) */
        if (a != b || (isNaN(a - b) && ava[i] != bva[i])) {
            switch (i) {
                case 0: {   /* incompatible releases */
                    result.eCount = 1;
                    result.text = "Error: re-write of "+ rname +" is required";
                    return (result);
                }

                case 1: {   /* source compatible release */
                    result.eCount = 1;
                    result.text = "Error: re-build of "+ rname +" is required";
                    return (result);
                }

                case 2: {   /* API radius */
                    if (a < b) {
                        result.wCount = 1;
                        result.text = "Warning: the version of " + pname
                            + " included in this configuration is older than the version of "
                            + pname + " used to build " + rname;
                        return (result);
                    }
                    break;
                }

                case 3: {   /* binary 100% compatible release */
                    break;
                }
            }
            return (null);
        }
    }

    /* if we get here, the required version is prefix of the avail version */
    return (null);
}
/*
 *  @(#) xdc.tools.check; 1, 0, 0,0; 1-9-2017 12:51:20; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */


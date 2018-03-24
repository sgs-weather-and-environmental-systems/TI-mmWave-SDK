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

var DOES_NOT_EXIST = 'does not exist.';
var NO_FILES = 'does not contain any files.';
var NO_PACKAGES = 'does not contain any packages.';
var INNACCESSIBLE_PACKAGES = 'contains only packages that are not accessible.';
var DID_YOU_MEAN = '  Did you intend to use: ';
var IS_RELATIVE = 'is specified as a relative path.';

/*
 * ======== CheckPath.xs ========
 */
var pathCheck = {
    hasZeroes   : false,      /* any 0 length strings? */
    duplicates  : [],         /* array of duplicate directories */
};

var repoCheck = {
    path             : '',     /* full repository path */
    warning          : false,
    exists           : false,  /* does it exist? */
    isEmpty          : false,  /* is it empty? */
    hasPackages      : false,  /* does it have any packages? */
    inaccessiblePkgs : false,  /* contains packages not rooted in repository */
    isRelative       : false,  /* is a relitive path */
    mismatches       : [],     /* array of possible mismatch suggestions */
};

/*
 * ======== checkPackagePathRepositories ========
 *
 * check array of repositories for certain characteristics
 *
 */
function checkPackagePathRepositories(pathArr)
{
    var checkResults = [];
    for each (var repo in pathArr) {
        if (repo.length) {
            checkResults.push(checkRepository(repo));
        }
    }
    return (checkResults);
}

/*
 * ======== checkPackages ========
 */
function checkPackages(repo)
{
    // built/not built?
    // released
    // rooted?
}

/*
 * ======== checkRepository ========
 */
function checkRepository(repo)
{
    var repoCheck = {};
    var file = java.io.File(repo);
    repoCheck.isRelative = file.isAbsolute() ? false : true;
    repoCheck.path = (repoCheck.isRelative) ? repo : String(file.getCanonicalPath());
    repoCheck.path = repoCheck.path.replace(/\\/g, '/');
    repoCheck.warning = false;
    repoCheck.exists = false;
    repoCheck.isEmpty = true;
    repoCheck.hasPackages = false;
    repoCheck.inaccessiblePkgs = false;
    repoCheck.mismatches = [];
    if (file.exists()) {
        repoCheck.exists = true;
        if (file.isDirectory()) {
            repoCheck.isEmpty = file.list().length == 0;
            if (!repoCheck.isEmpty) {
                repoCheck.hasPackages = hasPackage(repo);
                if (repoCheck.hasPackages) {
                    var frepo = java.io.File(repo);
                    if (!hasAccessiblePkg(frepo, frepo)) {
                        repoCheck.inaccessiblePkgs = true;
                    }
                }
            }
        }
        else {
            repoCheck.isEmpty = true;
        }
    }
    if (!repoCheck.exists || repoCheck.isEmpty || !repoCheck.hasPackages) {
        repoCheck.warning = true;
        if (!repoCheck.isRelative) {
            repoCheck.mismatches = mislabelled(repo);
        }
    }
    else if (repoCheck.inaccessiblePkgs || repoCheck.isRelative) {
        repoCheck.warning = true;
    }
    return (repoCheck);
}

/*
 * ======== checkZeroes ========
 */
function checkZeroes(dirArr)
{
    var zcount = 0;
    for each (var d in dirArr) {
        if (d.length == 0) {
            ++zcount;
        }
    }
    return (zcount);
}

/*
 * ======== getWarningString ========
 */
function getWarningString(repoCheck, verbose, singleLine)
{
    var str = '';
    if (repoCheck) {
        if (verbose) {
            str = repoCheck.path + ' ';
        }
        else {
            str = 'This repository ';
        }
        if (!repoCheck.exists) {
            str += DOES_NOT_EXIST;
            if (repoCheck.isRelative) {
                str += ' It ' + IS_RELATIVE;
            }
        }
        else if (repoCheck.isEmpty) {
            str += NO_FILES;
            if (repoCheck.isRelative) {
                str += ' It ' + IS_RELATIVE;
            }
        }
        else if (!repoCheck.hasPackages) {
            str += NO_PACKAGES;
            if (repoCheck.isRelative) {
                str += ' It ' + IS_RELATIVE;
            }
        }
        else if (repoCheck.isRelative) {
            str += IS_RELATIVE;
        }
        if (repoCheck.inaccessiblePkgs) {
            str += INNACCESSIBLE_PACKAGES;
        }
        if (repoCheck.mismatches.length > 0) {
            str += DID_YOU_MEAN;
            if (!singleLine) {
                str += '\n';
            }
            for (var i = 0; i < repoCheck.mismatches.length; i++) {
                if (i > 0) {
                    if (singleLine) {
                        str += ', or';
                    }
                    else {
                        str += '\n';
                    }
                }
                str += repoCheck.mismatches[i];
            } 
        }
    }
    return (str);
}

/*
 *  ======== hasAccessiblePkg ========
 */
function hasAccessiblePkg(root, dir)
{
    var found = false;
    for each (var f in dir.listFiles()) {
        if (f.isFile()) {
            continue;
        }
        if (f.getName() != 'package') {
            found = hasAccessiblePkg(root, f);
            if (found) {
                break;
            }
        }
        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            var m = fn.match(/^(.+)\.sch$/);
            if (m) {
                var pn = m[1];
                var ppath = String(dir.getCanonicalPath());
                return (isPackageRepo(String(root.getCanonicalPath()), ppath,
                                      pn));
            }
        }
    }
    return (found);
}

/*
 * ======== hasFiles ========
 */
function hasFiles(repo)
{
    return (java.io.File(repo).list().length > 0);
}

/*
 * ======== hasPackage ========
 */
function hasPackage(dir)
{
    var found = false;
    var fdir = java.io.File(dir);
    for each (var f in fdir.listFiles()) {

        if (f.isFile()) {
            continue;
        }
        if (String(f.getName()) != 'package') {
            found = hasPackage(f.getCanonicalPath());
            if (found) {
                break;
            }
        }
        else {
            var path = String(f.getCanonicalPath()).replace(/\\/g, '/');
            path = path.replace(/package$/, '');
            return(java.io.File(path + 'package.xdc').exists());
        }
    }
    return (found);
}

/*
 *  ======== isPackageRepo ========
 */
function isPackageRepo(repo, pkgdir, pname)
{
    /* add package name onto repo & see if its the */
    /* same as the package directory               */
    var trepo = repo + '/' + pname.replace(/\./g, '/');
    return (java.io.File(trepo).equals(java.io.File(pkgdir)));
}

/*
 * ======== mislabelled ========
 *
 *  This is called when a repository has an issue: it doesn't
 *  exist or doesn't contain any packages
 *
 *  Returns list of possible correct labels
 *
 */
function mislabelled(repo)
{
    var retArr = [];

    var file = java.io.File(repo);
    var name = String(file.getName());

    /* check 'package' vs. 'packages' */
    if (name == 'package') {
        repo += 's';
        file = java.io.File(repo);
        if (file.exists() && file.isDirectory() && hasPackage(repo)) {
            retArr.push(repo);
        }
    }
    return (retArr);
}



/*
 *  @(#) xdc.tools.repoman; 1, 0, 0,0; 1-9-2017 12:51:52; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */


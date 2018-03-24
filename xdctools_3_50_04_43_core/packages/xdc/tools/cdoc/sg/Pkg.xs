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
 *  ======== search ========
 */
function search(dirs, statusFxn)
{
    var res = [];

    for each (var d in dirs) {
	var dir = java.io.File(d);
	var cpath = String(dir.getCanonicalPath());
        if (statusFxn) {
            statusFxn('searching ' + cpath + ' ');
        }
        _findPkgs(cpath, dir, res);
    }

    return res.sort();
}

/*
 *  ======== _findPkgs ========
 */
function _findPkgs(root, dir, res)
{
    for each (var f in dir.listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            _findPkgs(root, f, res);
            continue;
        }

        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            var m = fn.match(/^(.+)\.sch$/);
            if (m) {
                var pn = m[1];
                if (!(pn in res)) {
                    var ppath = String(dir.getPath());
                    var pr = _getPackageRoot(ppath, pn);
                    if (pr && pr == root) {
                        res.push(pn);
                        res[pn] = String(dir.getCanonicalPath());
                    }
                }
                break;
            }
        }
    }
}

/*
 *  ======== _getPackageRoot ========
 */
function _getPackageRoot(pkgDir, pname)
{
    if (pname) {
        var proot = pkgDir + '/..';
        for (var i = 0; (i = pname.indexOf('.', i) + 1) > 0; ) {
            proot += '/..';
        }
        return (String(java.io.File(proot).getCanonicalPath()));
    }
    return (null);
}

/*
 *  ======== getPkg ========
 */
function getPkg(pkgDir, dirs)
{
    var pkgPath = Packages.xdc.services.global.Path.getPath();
    var newPath = [];
    for (var i = 0; i < dirs.length; i++) {
        newPath.push(java.io.File(dirs[i]).getAbsolutePath());
    }
    for (var i = 0; i < pkgPath.length; i++) {
        newPath.push(pkgPath[i]);
    }

    /* create a BrowserSession with a private package path */
    var env = new Packages.xdc.services.global.Env();
    var browserSession =
        new Packages.xdc.services.spec.BrowserSession(newPath, env);

    var qn = browserSession.isPkgDir(pkgDir);
    if (qn != null) {

        try {
            var spkg = browserSession.loadPkg(pkgDir, qn);
            var pkg = {};
            pkg.name = String(spkg.getName());
            pkg.summary = String(spkg.getSummary());
            pkg.nodoc = spkg.isNodoc() == true;
            if (!pkg.nodoc) {
                var units = _getUnits(spkg, pkg.name);
                pkg.units = units;
            }
            else {
                pkg.units = null;
            }
            return (pkg);
        }
        catch (e) {
            java.lang.System.err.println('Error reading info for ' + qn +
                                         ': ' + e.message);
        }
    }
    return (null);
}

/*
 *  ======== _getUnits ========
 */
function _getUnits(spkg, pname)
{
    var unitArr = [];

    var pre = pname.replace(/\./g, '/') + '/';
    var uA = spkg.getUnits().toArray();
    for each (var u in uA) {
        if ((u.isInter() == true || u.isMod() == true) && u.isProxy() == false) {

            if (u.isNodoc()) {
                continue;
            }
            var unit = {};
            unit.name = String(u.getName());
            unit.summary = String(u.getSummary());
            unit.href = pre + unit.name + '.html';
            unit.kind = String(u.getXmlTag());
            unit.meta = (u.isMeta() == true);
            unitArr.push(unit);
        }
    }
    unitArr.sort(_objNameCompare);
    return (unitArr);
}

/*
 *  ======== _mkTitle ========
 */
function _mkTitle(node, scope)
{
    var title = '';
    if (node.@metaonly == '1') {
        title += 'metaonly ';
    }
    if (node.@kind != 'fxn') {
        title += node.@kind + ' ';
    }
    title += scope.@name + '.' + node.@name;
    if (node.@kind == 'fxn') {
        title += '( )';
    }
    return title;
}

/*
 *  ======== _objNameCompare ========
 *
 *  Compare function for sorting names of units and decls
 *
 */
function _objNameCompare(obj1, obj2)
{
    var name1 = obj1.name.toUpperCase();
    var name2 = obj2.name.toUpperCase();
    if (name1 < name2) {
        return (-1);
    }
    if (name1 > name2) {
        return (1);
    }
    else {
        /* if equal, put upper case first */
        var ch1 = obj1.name.substr(0, 1);
        var ch2 = obj2.name.substr(0, 1);
        if (ch1.toUpperCase() == ch2) {
            return (1);
        }
        if (ch2.toUpperCase() == ch1) {
            return (-1);
        }
    }
    return (0);
}


/*
 *  @(#) xdc.tools.cdoc.sg; 1,0,0,0; 11-8-2017 17:13:42; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


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
 *  ======== Toc.xs ========
 */

var Gbl = xdc.loadCapsule('Gbl.xs');
var Out = xdc.loadCapsule('Out.xs');
var Pag = xdc.loadCapsule('Pag.xs');

var tocPkgs = [];
var tocPkgNames = [];

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== genToc ========
 */
function genToc(outdir)
{
    print('Generating table of contents ...');

    var pkgdirs = [];
    Gbl.findDocXmlDirs(java.io.File(outdir), pkgdirs);

    _getTocPkgs(pkgdirs);

    /* our xml toc */
    Gbl.outstr(new Out.Stream(outdir + '/toc.xml'));
    _genPageTop();
    var gtree = _bldGroups();
    _genAllPkgs();
    _genAllModules();
    _genGroups(gtree, "");
    _genPageSuf();
    Gbl.outstr().close();

    /* our html toc */
    _htmlToc(outdir);

    /* eclipse toc */
    Gbl.outstr(new Out.Stream(outdir + '/eclipse_toc.xml'));
    _genPageTop();
    for each (var pName in tocPkgNames) {
        _genPkgTopic(pName, pName);
        _genPkg(pName);
        PL('</topic>');
    }
    _genPageSuf();
    Gbl.outstr().close();

    /* all-packages */
    _genAllPkgsPage(outdir);

    /* release memory */
    tocPkgs = null;
    tocPkgNames = null;
}

/*
 *  ======== _htmlToc ========
 */
function _htmlToc(outdir)
{
    var gtree = _bldGroups();
    Gbl.outstr(new Out.Stream(outdir + '/toc.html'));

    /* page top */
    PL('<html>');
    PL('<head><meta content="text/html; charset=UTF-8" http-equiv="Content-Type">');
    PL('<title>XDC Packages</title>');
    PL('<link href="toc.css" type="text/css" rel="stylesheet">');
    PL('<script src="toc.js" type="text/javascript" language="javascript"></script>');
    PL('</head>');
    PL('<body onmousedown="return false;">');
    PL('<ul class="open">');

    _htmlAllPackages();
    _htmlAllModules();
    _htmlGenGroups(gtree, "");

    /* suffix */
    PL('</ul></body></html>');
    Gbl.outstr().close();
}

/*
 *  ======== _htmlAllModules ========
 */
function _htmlAllModules()
{
    /* Get all units and sort by name */
    var units = [];
    for each (var pName in tocPkgNames) {
        var pkg = tocPkgs[pName];
        for (var i = 0; i < pkg.units.length; i++) {
            pkg.units[i].qual = pName;
            units.push(pkg.units[i]);
        }
    }
    units.sort(_objNameCompare);

    /* output the units one by one */
    PL('<li onclick="toggle(this)" class="closed"><span onclick="cancel(event)" class="noclick">all modules</span><ul onclick="cancel(event)">');

    var srcImg;
    var i = 0;
    while (i < units.length - 1) {

        if (units[i + 1].name == units[i].name) {
            var j = i + 1;
            var uSame = [units[i], units[j]];
            while (j < units.length - 1) {
                if (units[j + 1].name == units[j].name) {
                    uSame.push(units[++j]);
                }
                else {
                    ++j;
                    break;
                }
            }

            /* find shortest pkg name */
            var minIndex = 0;
            for (var k = 1; k < uSame.length; k++) {
                if (uSame[k].qual.length < uSame[k - 1].qual.length) {
                    minIndex = k;
                }
            }
            uSame.sort(_objQualCompare);

            PL('<li onclick="toggle(this)" class="closed"><img class="toc-img" src="modules.gif"><span onclick="cancel(event)" class="noclick">' + units[i].name +
               '</span><ul onclick="cancel(event)">');
            for (k = 0; k < uSame.length; k++) {
                srcImg = _srcImg(uSame[k].title);
                PL('<li class="leaf"><img class="toc-img" src="' + srcImg + '"><a title="' + uSame[k].title +
                   '" target="body" href="' + uSame[k].href + '" onclick="cancel(event)"><span class="toc-id">' + uSame[k].qual + '</span></a></li>');
            }
            PL('</ul></li>');
            i = j;
            continue;
        }
        else {
            srcImg = _srcImg(units[i].title);
            PL('<li class="leaf"><img class="toc-img" src="' + srcImg + '"><a title="' + units[i].title +
               '" target="body" href="' + units[i].href + '" onclick="cancel(event)"><span class="toc-id">' + units[i].name + '</span></a></li>');
        }
        ++i;
    }
    if (i == units.length - 1) {
        srcImg = _srcImg(units[i].title);
        PL('<li class="leaf"><img class="toc-img" src="' + srcImg + '"><a title="' + units[i].title +
           '" target="body" href="' + units[i].href + '" onclick="cancel(event)"><span class="toc-id">' + units[i].name + '</span></a></li>');
    }
    PL('</ul></li>');
}

/*
 *  ======== _htmlAllPackages ========
 */
function _htmlAllPackages()
{
    PL('<li onclick="toggle(this)" class="closed"><a title="" target="body" href="all-packages.html" onclick="cancel(event)"><span class="toc-pkgs">all packages</span></a>');
    PL('<ul onclick="cancel(event)">');

    for each (var pName in tocPkgNames) {
        var pre = pName.replace(/\./g, '/') + '/';
        var href = pre + 'package.html';
        var title = 'package ' + pName;

        if (tocPkgs[pName].units.length > 0) {
            PL('<li onclick="toggle(this)" class="closed"><img class="toc-img" src="package.gif"><a title="' + title +
               '" target="body" href="' + href + '" onclick="cancel(event)"><span class="toc-id">' + pName + '</span></a><ul onclick="cancel(event)">');
            _htmlGenUnits(tocPkgs[pName]);
            PL('</ul></li>');
        }
        else {
            PL('<li class="leaf"><img class="toc-img" src="package.gif"><a title="' + title +
               '" target="body" href="' + href + '" onclick="cancel(event)"><span class="toc-id">' + pName + '</span></a></li>');
       }
    }
    PL('</ul></li>');
}

/*
 *  ======== _htmlGenGroups ========
 */
function _htmlGenGroups(gtree, pre)
{
    if (gtree.length) {
        gtree.sort();
        for (var i = 0; i < gtree.length; i++) {
            var elem = gtree[i];
            if (elem in gtree) {
                var qelem = pre ? (pre + '.' + elem) : elem;
                var isPkg = tocPkgs[qelem] ? true : false;
                var closeTags = true;
                if (isPkg) {
                    var pkgPre = qelem.replace(/\./g, '/') + '/';
                    var title = 'package ' + qelem;
                    var href = pkgPre + 'package.html';
                    if (tocPkgs[qelem].units.length > 0 || _hasSubPkgs(qelem)) {
                        PL('<li onclick="toggle(this)" class="closed"><img class="toc-img" src="package.gif"><a title="' + title +
                           '" target="body" href="' + href + '" onclick="cancel(event)"><span class="toc-id">' + elem + '</span></a><ul onclick="cancel(event)">');
                    }
                    else {
                        PL('<li class="leaf"><img class="toc-img" src="package.gif"><a title="' + title +
                           '" target="body" href="' + href + '" onclick="cancel(event)"><span class="toc-id">' + elem + '</span></a></li>');
                        closeTags = false;
                    }
                }
                else {
                    PL('<li onclick="toggle(this)" class="closed"><img class="toc-img" src="packages.gif"><span onclick="cancel(event)" class="noclick">' +
                       elem + '</span><ul onclick="cancel(event)">');
                }
                _htmlGenGroups(gtree[elem], qelem);
                if (isPkg) {
                    _htmlGenPkg(qelem);
                }
                if (closeTags) {
                    PL('</ul></li>');
                }
            }
        }
    }
}

/*
 *  ======== _htmlGenPkg ========
 */
function _htmlGenPkg(pname)
{
    var pkg = tocPkgs[pname];
    if (pkg.units.length) {
        _htmlGenUnits(pkg);
    }
}

/*
 *  ======== _htmlGenUnits ========
 */
function _htmlGenUnits(pkg)
{
    for (var i = 0; i < pkg.units.length; i++) {
        var unit = pkg.units[i];
        var srcImg = _srcImg(unit.title);
        PL('<li class="leaf"><img class="toc-img" src="' + srcImg + '"><a title="' + unit.title +
           '" target="body" href="' + unit.href + '" onclick="cancel(event)"><span class="toc-id">' + unit.name + '</span></a></li>');
    }
}

/*
 *  ======== _hasSubPkgs ========
 */
function _hasSubPkgs(pname)
{
    var found = false;
    for (var i = 0; i < tocPkgNames.length; i++) {
        if (tocPkgNames[i].indexOf(pname + '.') == 0) {
            found = true;
            break;
        }
    }
    return (found);
}

/*
 *  ======== _srcImg ========
 */
function _srcImg(title)
{
    var srcImg = '';
    if (title.search('metaonly module') != -1) {
        srcImg = 'mod-red.gif';
    }
    else if (title.search('module') != -1) {
        srcImg = 'mod-blue.gif';
    }
    else if (title.search('metaonly interface') != -1) {
        srcImg = 'int-red.gif';
    }
    else if (title.search('interface') != -1) {
        srcImg = 'int-blue.gif';
    }
    return (srcImg);
}

/*
 *  ======== _bldGroups ========
 */
function _bldGroups()
{
    var grpTree = [];

    for each (var pkg in tocPkgs) {
        var pnarr = pkg.name.split('.');
        var gtree = grpTree;
        for (var j = 0; j < pnarr.length; j++) {
            var elem = pnarr[j];
            if (elem in gtree) {
                gtree = gtree[elem];
            }
            else {
                gtree.push(elem);
                gtree = gtree[elem] = [];
            }
        }
    }
    return grpTree;
}

/*
 *  ======== _genAllPkgs ========
 */
function _genAllPkgs()
{
    PL('<topic class="toc-pkgs" label="all packages" href="all-packages.html">');
    for each (var pName in tocPkgNames) {
        _genPkgTopic(pName, pName);
        _genUnits(tocPkgs[pName]);
        PL('</topic>');
    }
    PL('</topic>');
}

/*
 *  ======== _genAllModules ========
 */
function _genAllModules()
{
    /* Get all units and sort by name */
    var units = [];
    for each (var pName in tocPkgNames) {
        var pkg = tocPkgs[pName];
        for (var i = 0; i < pkg.units.length; i++) {
            pkg.units[i].qual = pName;
            units.push(pkg.units[i]);
        }
    }
    units.sort(_objNameCompare);

    /* output the units one by one */
    PL('<topic class="toc-allmodules" label="all modules">');
    var i = 0;
    while (i < units.length - 1) {

        if (units[i + 1].name == units[i].name) {
            var j = i + 1;
            var uSame = [units[i], units[j]];
            while (j < units.length - 1) {
                if (units[j + 1].name == units[j].name) {
                    uSame.push(units[++j]);
                }
                else {
                    ++j;
                    break;
                }
            }

            /* find shortest pkg name */
            var minIndex = 0;
            for (var k = 1; k < uSame.length; k++) {
                if (uSame[k].qual.length < uSame[k - 1].qual.length) {
                    minIndex = k;
                }
            }
            uSame.sort(_objQualCompare);

            PL('<topic class="toc-modules" label="' + units[i].name + '">');
            for (k = 0; k < uSame.length; k++) {
                PL('<topic class="toc-id" label="' + uSame[k].qual + '" href="' + uSame[k].href + '" title="' + uSame[k].title + '">');
                PL('</topic>');
            }
            PL('</topic>');
            i = j;
            continue;
        }
        else {
            PL('<topic class="toc-id" label="' + units[i].name + '" href="' + units[i].href + '" title="' + units[i].title + '">');
            PL('</topic>');
        }
        ++i;
    }
    if (i == units.length - 1) {
        PL('<topic class="toc-id" label="' + units[i].name + '" href="' + units[i].href + '" title="' + units[i].title + '">');
        PL('</topic>');
    }
    PL('</topic>');
}

/*
 *  ======== _qualCompare ========
 */
function _qualCompare(unitArr, qual)
{
    var str = '^' + qual.replace(/\./g, '\.') + '\.';
    var r = RegExp(str);
    var allMatch = true;
    for (var i = 0; i < unitArr.length; i++) {
        if (!unitArr[i].qual.match(r)) {
            allMatch = false;
            break;
        }
    }
    return (allMatch);
}

/*
 *  ======== _genAllPkgsPage ========
 */
function _genAllPkgsPage(outdir)
{
    Gbl.outstr(new Out.Stream(outdir + '/all-packages.html'));
    Gbl.root('./');
    Gbl.pkgNode(null);
    Pag.genPrefix("All Packages");
    Pag.genHdr(new XML('<group name="all packages"/>'), null, null, null, null);
    Pag.genSynTabBeg('xdocSynX');

    for (var i = 0; i < tocPkgNames.length; i++) {
        var pName = tocPkgNames[i];
        var link = Gbl.sprintf("<a class='xdocSynGo' href='$1/package.html' title='$2'>$3;</a>",
            pName.replace(/\./g, '/'),
            pName,
            Gbl.span('xdoc-id', pName)
        );
        Gbl.genRowC(Gbl.sprintf('$1 $2', Gbl.span('xdoc-kw1', 'package'), link));
        PL(Gbl.sprintf("<div class='xdocSynSum'>//&nbsp;$1</div>", Gbl.decode(tocPkgs[pName].summary)));
    }

    Pag.genSynTabEnd();
    Pag.genSuffix();
    Gbl.outstr().close();
}

/*
 *  ======== _genDecls ========
 */
function _genDecls(unit)
{
    for (var i = 0; i < unit.decls.length; i++) {

        var decl = unit.decls[i];
        PL('<topic class="toc-id" label="' + decl.name + '" href="' + decl.href + '" title="' + decl.title + '"/>');
    }
}

/*
 *  ======== _genGroups ========
 */
function _genGroups(gtree, pre)
{
    if (gtree.length) {
        gtree.sort();
        for (var i = 0; i < gtree.length; i++) {
            var elem = gtree[i];
            if (elem in gtree) {
                var qelem = pre ? (pre + '.' + elem) : elem;
                var isPkg = tocPkgs[qelem] ? true : false;
                if (isPkg) {
                    _genPkgTopic(qelem, elem);
                }
                else {
                    PL('<topic class="toc-id" label="' + elem + '">');
                }
                _genGroups(gtree[elem], qelem);
                if (isPkg) {
                    _genPkg(qelem);
                }
                PL('</topic>');
            }
        }
    }
}

/*
 *  ======== _genPageSuf ========
 */
function _genPageSuf()
{
    PL('</toc>');
}

/*
 *  ======== _genPageTop ========
 */
function _genPageTop()
{

    PL('<?xml version="1.0"?>');
    PL('<?xml-stylesheet type="text/xsl" href="toc.xsl"?>');
    PL('<toc label="XDC Packages" topic="packages.html">');
}

/*
 *  ======== _genPkg ========
 */
function _genPkg(pname)
{
    var pkg = tocPkgs[pname];
    if (pkg.units.length) {
        _genUnits(pkg);
    }
}

/*
 *  ======== _genPkgTopic ========
 */
function _genPkgTopic(pname, label)
{
    var pre = pname.replace(/\./g, '/') + '/';
    PL('<topic class="toc-id" label="' + label + '" href="' + pre + 'package.html" title="package ' + pname + '">');
}

/*
 *  ======== _genUnits ========
 */
function _genUnits(pkg)
{
    for (var i = 0; i < pkg.units.length; i++) {

        var unit = pkg.units[i];

        PL('<topic class="toc-id" label="' + unit.name + '" href="' + unit.href + '" title="' + unit.title + '">');
/*
        if (unit.decls.length) {
            _genDecls(unit);
        }
*/
        PL('</topic>');
    }
}

/*
 *  ======== _getTocPkgs ========
 *
 *  Return a package name-keyed hash of packages in pkgdirs
 *
 */
function _getTocPkgs(pkgdirs)
{
    tocPkgs = [];
    tocPkgNames = [];
    var pkgNode;
    for each (var d in pkgdirs) {
        pkgNode = xdc.loadXML(d + '/package/package.doc.xml');
        if (pkgNode.@nodoc == '1') {
            pkgNode = null;
            continue;
        }
        var units = _getTocUnits(pkgNode);
        var pkg = {};
        pkg.name = '' + pkgNode.@name;
        pkg.summary = '' + pkgNode.@summary;
        pkg.units = units;
        tocPkgNames.push(pkg.name);
        tocPkgs[pkg.name] = pkg;
        pkgNode = null;
    }
    tocPkgNames.sort();
}

/*
 *  ======== _getTocUnits ========
 */
function _getTocUnits(pNode)
{
    var unitArr = [];

    var name = '' + pNode.@name;
    var pre = name.replace(/\./g, '/') + '/';
    for each (var uNode in pNode.unit) {
        if (uNode.@nodoc == '1') {
            continue;
        }
        var unit = {};
        unit.name = '' + uNode.@name;
        unit.href = pre + unit.name + '.html';
        unit.title = _mkTitle(uNode, pNode);
/*
        unit.decls = [];
        for each (var gNode in uNode.group) {
            for each(var dNode in gNode.decl) {
                if (dNode.@external == '0' || dNode.@spacer == '1' || dNode.@nodoc == '1') {
                    continue;
                }
                var decl = {};
                decl.name = '' + dNode.@name;
                decl.href = pre + uNode.@name + '.html#' +
                            dNode.@anchor;
                decl.title = _mkTitle(dNode, uNode);
                unit.decls.push(decl);
            }
        }
        unit.decls.sort(_objNameCompare);
*/
        unitArr.push(unit);
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
 *  ======== _objCompare ========
 *  Compare objects with specified field name
 */
function _objCompare(field, obj1, obj2)
{
    var name1 = obj1[field].toUpperCase();
    var name2 = obj2[field].toUpperCase();
    if (name1 < name2) {
        return (-1);
    }
    if (name1 > name2) {
        return (1);
    }

    /* if equal, put upper case first */
    var ch1 = obj1[field].substr(0, 1);
    var ch2 = obj2[field].substr(0, 1);
    if (ch1 != ch2) {
        if (ch2.toUpperCase() == ch2) {
            return (1);
        }
        if (ch1.toUpperCase() == ch1) {
            return (-1);
        }
    }

    return (0);
}

/*
 *  ======== _objNameCompare ========
 *  Compare function for sorting names of units and decls
 */
function _objNameCompare(obj1, obj2)
{
    return (_objCompare("name", obj1, obj2));
}

/*
 *  ======== _objQualCompare ========
 */
function _objQualCompare(obj1, obj2)
{
    return (_objCompare("qual", obj1, obj2));
}

/*
 *  ======== inToc ========
 */
function inToc(pname)
{
    return (pname in tocPkgs);
}

/*
 *  ======== getFirstPkg ========
 */
function getFirstPkg()
{
    if (tocPkgNames.length) {
        return (tocPkgNames[0]);
    }
    else {
        return ('');
    }
}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


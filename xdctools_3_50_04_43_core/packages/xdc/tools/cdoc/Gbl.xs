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
 *  ======== Gbl.xs ========
 */

var DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
var FSDTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN"  "http://www.w3.org/TR/html4/frameset.dtd">';

var FILEDIR = 'xdc/tools/cdoc/files/';
var SP = '&nbsp;';
var TABWIDTH = 4;

var SPEC_SYN = 'synopSpec';
var META_SYN = 'synopMeta';
var TARG_SYN = 'synopTarg';

function DEBUG( expr ) { out.println('top.debug(' + expr + ')'); }

var _opts;
var _outdir;
var _outstr;
var _path;
var _pkgNode;
var _root;
var _unitNode;
var _doxybase;
var _doxytags;
var _style;

/*
 *  ======== copyFile ========
 */
function copyFile(srcPath, destDir)
{
    var srcFile = java.io.File(srcPath);
    var destFile = java.io.File(destDir + '/' + srcFile.getName());

    Packages.xdc.services.global.Host.copyFile(srcFile, destFile);
}

/*
 *  ======== decode =========
 *
 */
function decode(s)
{
    s = '' + java.net.URLDecoder.decode(s, 'UTF-8');

    if (_doxytags && _pkgNode) {
        var len = String(_pkgNode.@name).split('.').length;
        var relPre = '';
        for (var i = 0; i < len; i++) {
            relPre += '../';
        }
        while (s.indexOf('xdoc-linkDoxygen') != -1) {
            var start = s.indexOf('xdoc-linkDoxygen" href="') + 24;
            var end = s.indexOf('"', start);
            var tagName = s.substr(start, end - start);
            var tag = findDoxyTag(tagName);
            var alt = s.match(/xdoc-linkDoxygen\" href=\"[^"]+\">([^<]+)<\/a>/)[1];
            var text = (alt != tagName) ? alt : tag.text;
            if (tag.anchorfile) {
                if (tag.anchor) {
                    s = s.replace(/xdoc-linkDoxygen\" href=\"[^"]+\">[^<]+<\/a>/,
                                 'xdoc-linkDoxy" href="' + relPre + _doxybase +
                                 '/' + tag.anchorfile + '#' + tag.anchor + '">' +
                                 text + '</a>');
                }
                else {
                    s = s.replace(/xdoc-linkDoxygen\" href=\"[^"]+\">[^<]+<\/a>/,
                                  'xdoc-linkDoxy" href="' + relPre + _doxybase +
                                  '/' + tag.anchorfile + '">' +
                                  text + '</a>');
                }
            }
            else {
                /* can't find function, link will be dead */
                s = s.replace(/<a class="xdoc-linkDoxygen[^<]+<\/a>/,
                              text);
            }
        }
    }
    s = s.replace(/\( /, '(');
    s = s.replace(/ \)/, ')');
    return (s);
}

/*
 *  ======== findDoxyTag ========
 */
function findDoxyTag(tagName)
{
    /* determine tag type */
    var isFunc = false;
    var isDefineOrVar = false;
    var isFile = false;
    var isTypedef = false;
    var isUnknown = false;

    if (tagName.indexOf('.') != -1 && 
        (tagName.indexOf('.') == tagName.lastIndexOf('.')) &&
        !tagName.match(/^.+\.$/)) {

        isFile = true;
    }
    else if (tagName.match(/^.+\(\)$/)) {
        tagName = tagName.substr(0, tagName.length - 2);
        isFunc = true;
    }
    else if (tagName.match(/^#.+/)) {
        tagName = tagName.substr(1);
        isDefineOrVar = true;
    }
    else if (tagName.indexOf('::') == 0) {
        tagName = tagName.substr(2);
        isTypedef = true;
    }
    else {
        isUnknown = true;
    }

    var tag = {};
    tag.text = tagName;
    if (isFile) {

        /* test just the name also ? */

        var flist = _doxytags..compound.(@kind == "file");
        for (var i = 0; i < flist.length(); i++) {
            if (String(flist[i].name) == tagName) {
                tag.anchorfile = flist[i].filename + '.html';
                break;
            }
        }
    }
    else if (isFunc) {
        var flist = _doxytags..compound.(@kind == "file").member.(@kind == "function");
        for (var i = 0; i < flist.length(); i++) {
            if (String(flist[i].name) == tagName) {
                tag.anchorfile = String(flist[i].anchorfile);
                tag.anchor = String(flist[i].anchor);
                break;
            }
        }
    }
    else if (isDefineOrVar) {
        var foundVar = false;
        var vlist = _doxytags..compound.(@kind == "file").member.(@kind == "variable");
        for (var i = 0; i < vlist.length(); i++) {
            if (String(vlist[i].name) == tagName) {
                tag.anchorfile = String(vlist[i].anchorfile);
                tag.anchor = String(vlist[i].anchor);
                foundVar = true;
                break;
            }
        }

        var foundDef = false;
        var dlist = _doxytags..compound.(@kind == "file").member.(@kind == "define");
        for (var i = 0; i < dlist.length(); i++) {
            if (String(dlist[i].name) == tagName) {
                tag.anchorfile = String(dlist[i].anchorfile);
                tag.anchor = String(dlist[i].anchor);
                foundDef = true;
                break;
            }
        }
        if (foundVar && foundDef) {
            print('warning: ambigous doxygen link: ' + tagName +
                  '. Linking to #define');
        }
    }
    else if (isTypedef) {
        var tlist = _doxytags..compound.(@kind == "file").member.(@kind == "typedef");
        for (var i = 0; i < tlist.length(); i++) {
            if (String(tlist[i].name) == tagName) {
                tag.anchorfile = String(tlist[i].anchorfile);
                tag.anchor = String(tlist[i].anchor);
                break;
            }
        }
    }
    else if (isUnknown) {
        var name = null;
        var mem = null;
        var found = false;

        var colIndex = tagName.indexOf('::');
        if (colIndex == -1) {
            name = tagName;
        }
        else {
            name = tagName.substr(0, colIndex);
            mem = tagName.substr(colIndex + 2);
        }

        if (!mem) {  /* look for pages and groups (modules) */
            var plist = _doxytags..compound.(@kind == "page");
            for (var i = 0; i < plist.length(); i++) {
                if (String(plist[i].name) == tagName) {
                    tag.anchorfile = plist[i].filename + '.html';
                    found = true;
                    break;
                }
            }
            if (!found) {
                var glist = _doxytags..compound.(@kind == "group");
                for (i = 0; i < glist.length(); i++) {
                    if (String(glist[i].name) == tagName) {
                        tag.anchorfile = glist[i].filename;
                        found = true;
                        break;
                    }
                }
            }
        }
        if (!found) {
            /* all enums and their values */
            var foundEnum = false;
            var elist = _doxytags..compound.(@kind == "group").member.(@kind == "enumeration");
            for (var i = 0; i < elist.length(); i++) {
                if (name) {
                    if (String(elist[i].name) == name) {
                        tag.anchorfile = String(elist[i].parent().filename);
                        tag.anchor = String(elist[i].anchor);
                        foundEnum = true;
                    }
                    if (foundEnum) {
                        if (mem) {
                            var foundmem = false;
                            var chIndex = elist[i].childIndex();
                            var sibList = elist[i].parent().children();
                            for (var j = chIndex + 1; j < sibList.length(); j++) {
                                if (String(sibList[j].@kind) == 'enumvalue') {
                                    if (String(sibList[j].name) == mem) {
                                        tag.anchorfile =
                                            String(elist[i].parent().filename);
                                        tag.anchor = String(sibList[j].anchor);
                                        foundmem = true;
                                        break;
                                    }
                                }
                                else {
                                    break;
                                }
                            }
                            if (!foundmem) {
                                tag.anchorfile = null;
                                tag.anchor = null;
                                foundEnum = false;
                            }
                        }
                    }
                }
                if (foundEnum) {
                    break;
                }
            }

            /* all structs and their fields */
            var foundStruct = false;
            var slist = _doxytags..compound.(@kind == "struct");
            for (var i = 0; i < slist.length(); i++) {
                if (name) {
                    if (String(slist[i].name) == name) {
                        tag.anchorfile = String(slist[i].filename);
                        foundStruct = true;
                    }
                    if (foundStruct) {
                        if (mem) {
                            var foundmem = false;
                            var mlist = slist[i]..member;
                            for (var j = 0; j < mlist.length(); j++) {
                                if (String(mlist[j].name) == mem) {
                                    tag.anchorfile = String(mlist[j].anchorfile);
                                    tag.anchor = String(mlist[j].anchor);
                                    foundmem = true;
                                    break;
                                }
                            }
                            if (!foundmem) {
                                tag.anchorfile = null;
                                tag.anchor = null;
                                foundStruct = false;
                            }
                        }
                    }
                }
                if (foundStruct) {
                    break;
                }
            }
            if (foundEnum && foundStruct) {
                print('warning: ambigous doxygen link: ' + tagName +
                      '. Linking to structure declaration');
            }
        }
    }
    return (tag);
}

/*
 *  ======== deepCopyFiles ========
 */
function deepCopyFiles(indir, outdir)
{
    Packages.xdc.services.global.Host.deepCopyFiles(java.io.File(indir), java.io.File(outdir));
}

/*
 *  ======== doxybase ========
 */
function doxybase(db)
{
    if (db !== undefined) {
        _doxybase = db;
    }
    return (_doxybase);
}

/*
 *  ======== doxytags ========
 */
function doxytags(dt)
{
    if (dt !== undefined) {
        _doxytags = dt;
    }
    return (_doxytags);
}

/*
 *  ======== findDocXmlDirs ========
 */
function findDocXmlDirs(dir, res)
{
    for each (var f in dir.listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            findDocXmlDirs(f, res);
            continue;
        }

        for each (var f2 in f.listFiles()) {
            if (f2.getName() == 'package.doc.xml') {
                res.push(String(dir.getCanonicalPath()));
                break;
            }
        }
    }
}

/*
 *  ======== findPackageDirs ========
 */
function findPackageDirs(dir, res)
{
    for each (var f in dir.listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            findPackageDirs(f, res);
            continue;
        }

        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            if (fn.match(/^(.+)\.sch$/)) {
                res.push(String(dir.getCanonicalPath()));
                break;
            }
        }
    }
}

/*
 *  ======== findRootedPackageDirs ========
 */
function findRootedPackageDirs(root, dir, res)
{
    for each (var f in dir.listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            findRootedPackageDirs(root, f, res);
            continue;
        }

        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            var m = fn.match(/^(.+)\.sch$/);
            if (m) {
                var pn = m[1];
                var ppath = String(dir.getPath());
                var pr = getPackageRoot(ppath, pn);
                if (pr && pr == root) {
                    res.push(String(dir.getCanonicalPath()));
                }
                break;
            }
        }
    }
}

/*
 *  ======== genRowB ========
 */
function genRowB()
{
    _outstr.println('<div class="xdocSynSpacer">&nbsp;</div>');
}

/*
 *  ======== genRowC ========
 */
function genRowC( code )
{
    _outstr.println('<div class="xdocSynCode">');
    _outstr.println(decode(code));
    _outstr.println('</div>');
}

/*
 *  ======== getPackageRoot ========
 */
function getPackageRoot(pkgDir, pname)
{
    var pn = pname;
    if (!pn) {
        pn = getPackageName(pkgDir);
    }
    if (pn) {
        var proot = pkgDir + '/..';
        for (var i = 0; (i = pn.indexOf('.', i) + 1) > 0; ) {
            proot += '/..';
        }
        return (String(java.io.File(proot).getCanonicalPath()));
    }
    return (null);
}

/*
 *  ======== getPackageName ========
 */
function getPackageName(pkgDir)
{
    for each (var f in java.io.File(pkgDir).listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            continue;
        }

        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            if (fn.match(/^(.+)\.sch$/)) {
                return (fn.substr(0, fn.lastIndexOf('.')));
            }
        }
    }
    return (null);
}

/*
 *  ======== hasDoc ========
 */
function hasDoc( node )
{
    return (node.docSect.(@name != 'details').length() ||
            node.docSect.(@name == 'details').docPara.length() > 1);
}

/*
 *  ======== hasMetaSyn ========
 */
function hasMetaSyn( node )
{
    return node.synopMeta.length() > 0;
}

/*
 *  ======== hasSpecSyn ========
 */
function hasSpecSyn( node )
{
    return node.synopSpec.length() > 0;
}

/*
 *  ======== hasTargSyn ========
 */
function hasTargSyn( node )
{
    return node.synopTarg.length() > 0;
}

/*
 *  ======== indent ========
 */
function indent( tabs )
{
    return '<tt>' + spaces(tabs * TABWIDTH) + '</tt>';
}

/*
 *  ======== isPackageDir ========
 */
function isPackageDir(dir)
{
    for each (var f in java.io.File(dir).listFiles()) {

        if (f.isFile()) continue;

        if (f.getName() != 'package') {
            continue;
        }

        for each (var f2 in f.listFiles()) {
            var fn = String(f2.getName());
            if (fn.match(/^(.+)\.sch$/)) {
                return (fn.substring(0, fn.lastIndexOf('.')));
            }
        }
    }
    return (null);
}

/*
 *  ======== mkCode ========
 */
function mkCode( lNode )
{
    return indent(lNode.@tab) + decode(lNode.@content);
}

/*
 *  ======== opts ========
 */
function opts( o )
{
    if (o !== undefined) _opts = o;
    return _opts;
}

/*
 *  ======== outdir ========
 */
function outdir( od )
{
    if (od !== undefined) _outdir = od;
    return _outdir;
}

/*
 *  ======== outstr ========
 */
function outstr( os )
{
    if (os !== undefined) _outstr = os;
    return _outstr;
}

/*
 *  ======== path ========
 */
function path( p )
{
    if (p !== undefined) _path = p;
    return _path;
}

/*
 *  ======== pkgNode ========
 */
function pkgNode( p )
{
    if (p !== undefined) _pkgNode = p;
    return _pkgNode;
}

/*
 *  ======== root ========
 */
function root( r )
{
    if (r !== undefined) _root = r;
    return _root;
}

/*
 *  ======== spaces ========
 */
function spaces( n )
{
    res = '';
    for (var i = 0; i < n; i++) res += SP;

    return res;
}

/*
 *  ======== span ========
 */
function span( cls, data )
{
    return '<span class="' + cls + '">' + String(data) + '</span>';
}

/*
 *  ======== sprintf ========
 */
function sprintf( fmt )
{
    res = fmt;
    
    for (var i = 1; i < arguments.length; i++) {
        var a = arguments[i].replace(/\$/g, '$$');
        var r = RegExp('\\$' + i, 'g');
        res = res.replace(r, a);
    }

    return res.replace(/\$\$/g, '$');
}

/*
 *  ======== unitNode ========
 *
 *  Called by Uni.genAll to set _unitNode, and invoked by other capsules to
 *  read various XML elements from it. 
 */
function unitNode( u )
{
    if (u !== undefined) _unitNode = u;
    return _unitNode;
}

/*
 *  ======== style ========
 */
function style(style)
{
    if (style !== undefined) _style = style;
    return _style;
}



/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


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
 *  ======== Big.xs ========
 */

var Gbl = xdc.loadCapsule('Gbl.xs');
var Out = xdc.loadCapsule('Out.xs');
var Index = xdc.loadCapsule('Index.xs');

var _pkgDir;
var _pkgNode;
var _root;

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== gen ========
 */
function gen( title, outdir, opts )
{
    Gbl.outdir(outdir);
    Gbl.opts(opts);

    Gbl.outstr(new Out.Stream(outdir + '/body-big.html'));
    _genPagePre(title);
    _findPkgs(new java.io.File(outdir));
    _genPageSuf();
    Gbl.outstr().close();

    Gbl.outstr(new Out.Stream(outdir + '/toc-big.html'));
    _genToc();
    Gbl.outstr().close();

    Index.gen(title, '', outdir, true);
}

/*
 *  ======== _fileText ========
 */
function _fileText( fname )
{
    if (!java.io.File(fname).exists()) return null;

    var fin = new java.io.RandomAccessFile(fname, 'r');
    var barr = new java.lang.reflect.Array.newInstance(java.lang.Byte.TYPE, fin.length());

    fin.read(barr);
    fin.close();

    return String(new java.lang.String(barr));
}

/*
 *  ======== _findPkgs ========
 */
function _findPkgs( dir )
{
    for each (var f in dir.listFiles()) {
        if (f.isFile()) continue;
        if (java.io.File(f, 'package.doc.xml').exists()) {
            _genDir(dir.getPath());
        }
        _findPkgs(f);
    }
}

/*
 *  ======== _genDir ========
 */
function _genDir( pkgDir )
{
    var docXmlFile = pkgDir + '/package/package.doc.xml';
    if (!java.io.File(docXmlFile).exists()) {
        java.lang.System.err.println(docXmlFile + ' not found');
        return;
    }

    _pkgNode = xdc.loadXML(docXmlFile);

    var name = '' + _pkgNode.@name;
    _root = name.replace(/\./g, '/');
    _root = _root.replace(/(\w+)/g, '..') + '/';
    _pkgDir = Gbl.outdir() + '/' + name.replace(/\./g, '/');

    if (Gbl.opts().msgFlg) {
        print(Gbl.sprintf('Merging package $1 in $2 ...', String(_pkgNode.@name), String(pkgDir)));
    }

    _genPkg(_pkgNode);
    for each (var uNode in _pkgNode.unit) {
        _genUnit(uNode);
    }
    _pkgNode = null;  /* release */
}

/*
 *  ======== _genPagePre ========
 */
function _genPagePre( title )
{
    if (title == null) {
        title = "big cdoc";
    }
    PL('<html>');
    PL('<head>');
    PL('<title>' + title + '</title>');
    PL('<link rel="stylesheet" type="text/css" href="' + Gbl.style() + '" />');
    PL('</head>');
    PL('<body><div id="xdocWrapper"><div id="xdocContent">');
}

/*
 *  ======== _genPageSuf ========
 */
function _genPageSuf()
{
    var d = new Date;

    PL('<div id="xdocDate">generated on ' + d.toUTCString() + '</div>');
    PL('</div></div></body>');
    PL('</html>');
}

/*
 *  ======== _genPkg ========
 */
function _genPkg( pNode )
{
    var page = _fileText(_pkgDir + '/package.html');

    if (!page) return;

    var k1 = page.indexOf('<div id="xdocContent">');
    var k2 = page.indexOf('>', k1) + 1;
    var k3 = page.lastIndexOf('<div id="xdocDate"');

    page = page.substring(k2, k3);
    page = _repImgSrc(page);
    page = _repLink(page);

    PL(Gbl.sprintf('<a id="$1"></a>', String(pNode.@name)));
    PL(page);
}

/*
 *  ======== _genToc ========
 */
function _genToc()
{
    _root = '';

    var fxn = function( m0 ) {
        m0 = m0.replace(/href="(.*?)"/, _repRef);
        m0 = m0.replace('href="', 'href="body-big.html');
        return m0;
    };

    var page = _fileText(Gbl.outdir() + '/toc.html');
    page = page.replace(/<li .*?\.html" onclick=/g, fxn);

    PL(page);
}

/*
 *  ======== _genUnit ========
 */
function _genUnit( uNode )
{
    var page = _fileText(_pkgDir + '/' + uNode.@name + '.html');

    if (!page) return;

    var k1 = page.indexOf('<div id="xdocContent">');
    var k2 = page.indexOf('>', k1) + 1;
    var k3 = page.lastIndexOf('<div id="xdocDate"');

    page = page.substring(k2, k3);
    page = _repImgSrc(page);
    page = _repLink(page);

    var qn = String(_pkgNode.@name) + '.' + String(uNode.@name);
    page = _repAnchor(page, qn);

    PL(Gbl.sprintf('<a id="$1"></a>', qn));
    PL(page);
}

/*
 *  ======== _repAnchor ========
 */
function _repAnchor( page, qn )
{
    return page.replace(/<a class="xdocAnchor" id="(.*?)">/g, '<a class="xdocAnchor" id="' + qn + '.$1">');
}

/*
 *  ======== _repImgSrc ========
 */
function _repImgSrc( page )
{
    var fxn = function( m ) {
        return m.replace(_root, '');
    };

    return page.replace(/<img .*?\/>/g, fxn);
}

/*
 *  ======== _repLink ========
 */
function _repLink( page )
{
    var fxn = function( m0, m1 ) {
        if (m1 == 'xdocAnchor' || m1 == 'xdoc-linkExt' || m1 == 'xdoc-linkFile') {
            return m0;
        }
        else {
            return m0.replace(/href="(.*?)"/, _repRef);
        }
    };

    return page.replace(/<a class="(xdoc.*?)".*?>/g, fxn);
}

/*
 *  ======== _repRef ========
 */
function _repRef( m0, m1 )
{
    if (m1.indexOf('-src.html') != -1) {
        return m0.replace(_root, '');
    }

    m1 = m1.replace(_root, '');
    m1 = m1.replace('/package', '');
    m1 = m1.replace('.html', '');

    m1 = m1.replace(/\//g, '.');
    m1 = m1.replace('#', '.');

    return Gbl.sprintf('href="#$1"', m1);
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


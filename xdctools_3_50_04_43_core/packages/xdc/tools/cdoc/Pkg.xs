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
 *  ======== Pkg.xs ========
 */

var Doc = xdc.loadCapsule('Doc.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');
var Out = xdc.loadCapsule('Out.xs');
var Pag = xdc.loadCapsule('Pag.xs');
var Src = xdc.loadCapsule('Src.xs');
var Uni = xdc.loadCapsule('Uni.xs');
var Xml = xdc.loadCapsule('Xml.xs');

var _out;
var _pkgDir;
var _unitNode;
var _unitNodeList;

var VERS = 100;

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== gen ========
 */
function gen( pkgDir, outdir, allDirs, opts )
{
    var pkgName = Gbl.isPackageDir(pkgDir);
    Gbl.outdir(outdir);

    Gbl.opts(opts);

    var cacheElem = new Packages.xdc.services.global.CacheElem(pkgName, pkgDir, 'cdoc-html', VERS);
    var tmpElemDir = null;

    if (cacheElem.isTemp()) {
        cacheElem = null;
        _pkgDir = Gbl.outdir() + '/' + pkgName.replace(/\./g, '/');
    }
    else if ((tmpElemDir = cacheElem.create()) != null) {
        _pkgDir = tmpElemDir.getAbsolutePath() + '/' + pkgName.replace(/\./g, '/');
    }

    if (_pkgDir) {

        var xmlErr = false;
        try {
            var xmlDir = Xml.gen(pkgDir, outdir, allDirs);
            if (!xmlDir) {
                xmlErr = true;
            }
        }
        catch (e) {
            xmlErr = true;
            print('warning: error generating package.doc.xml from ' + pkgDir);
        }
    
        if (!xmlErr) {
            var docXmlFile = xmlDir + '/package.doc.xml';
        }
        else {
            var docXmlFile = pkgDir + '/package/package.doc.xml';
        }
        if (!java.io.File(docXmlFile).exists()) {
            throw new Error(docXmlFile + ' not found');
        }
    
        Gbl.pkgNode(xdc.loadXML(java.io.File(docXmlFile).getAbsolutePath()));
    

        if (Gbl.opts().msgFlg && !Gbl.opts().nodFlg && Gbl.pkgNode().@nodoc == '1') {
            print(Gbl.sprintf('Skipping package $1 in $2 ...', pkgName, pkgDir));
            return ('');
        }
    
        Gbl.root(pkgName.replace(/\./g, '/').replace(/(\w+)/g, '..') + '/');
        Gbl.path(Gbl.root() + pkgName.replace(/\./g, '/') + '/');

        java.io.File(_pkgDir).mkdirs();
    
        if (Gbl.opts().msgFlg) {
            print(Gbl.sprintf('Processing package $1 in $2 ...', pkgName, pkgDir));
        }
    
        if (Gbl.opts().srcFlg) {
            Src.gen(pkgDir, Gbl.pkgNode(), _pkgDir);
        }
    
        _unitNodeList = [];
        for each (var uNode in Gbl.pkgNode().unit) {
            if (!Gbl.opts().nodFlg && uNode.@nodoc == '1') continue;
            if (Gbl.opts().srcFlg) {
                Src.gen(pkgDir, uNode, _pkgDir);
            }
            _unitNodeList.push(uNode);
        }
        Uni.genAll(_unitNodeList, _pkgDir);
    
        _genBody(Gbl.pkgNode());
    
        if (java.io.File(pkgDir + '/doc-files').exists()) {
            Gbl.deepCopyFiles(pkgDir + '/doc-files', _pkgDir + '/doc-files');
        }
    }

    if (cacheElem) {
        if (tmpElemDir) {
            cacheElem.commit();
        }
        var curElemDir = cacheElem.access();
        Gbl.deepCopyFiles(curElemDir.getAbsolutePath(),  Gbl.outdir());
    }

    /* release memory */
    Gbl.pkgNode(null);
    _unitNodeList = undefined;

    return (pkgName);
}

/*
 *  ======== _genBody ========
 */
function _genBody( pNode )
{
    Gbl.outstr(new Out.Stream(_pkgDir + '/package.html'));
    Pag.genPrefix('package ' + pNode.@name, Gbl.decode(pNode.@summary));

    var left = null;
    var right = _unitNodeList[0];

    Pag.genHdr(pNode, left, null, right, null);

    Pag.genToc(pNode);
    Doc.genBrief(pNode);

    Pag.genSpecFile(pNode, 'declarations');
    Pag.genSynTabBeg('xdocSynX');

        var last = pNode.line.length() - 1;
        for (var i = 0; i < last; i++) {
            if (pNode.line[i].@blank == '1') {
                Gbl.genRowB();
            }
            else {
                Gbl.genRowC(Gbl.mkCode(pNode.line[i]).replace(/<go>/g, '').replace(/<\/go>/g, ''));
            }
        }
    
        Gbl.genRowB();
        var pre = Gbl.indent(1);

        for each (var uNode in pNode.unit) {
            if (!Gbl.opts().nodFlg && uNode.@nodoc == '1') {
                continue;
            }
            var link = Gbl.sprintf("<a class='xdocSynGo' href='$1$2.html' title='$3.$2'>$4;</a>",
                Gbl.path(),
                String(uNode.@name),
                String(pNode.@name),
                Gbl.span('xdoc-id', uNode.@name)                
            );
            Gbl.genRowC(Gbl.sprintf('$3$1 $2', Gbl.span('xdoc-kw1', uNode.@kind), link, pre));
            var sum = Gbl.decode(uNode.@summary);
            if (sum.length) {
                PL(Gbl.sprintf("<div class='xdocSynSum'>$1//&nbsp;$2</div>", pre, sum));
            }

        }
        Gbl.genRowC(Gbl.mkCode(pNode.line[last]));

    Pag.genSynTabEnd();
    
    if (Gbl.hasDoc(pNode)) {
        Doc.genAll(pNode);
    }

    Pag.genSuffix();
    Gbl.outstr().close();
}





/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


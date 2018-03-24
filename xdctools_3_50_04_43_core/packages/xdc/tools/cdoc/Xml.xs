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
var Gbl = xdc.loadCapsule('Gbl.xs');

/*
 *  ======== gen ========
 */
function gen(pkgDir, outDir, allDirs)
{
    /* create a BrowserSession to check package */
    var browserSession =
        new Packages.xdc.services.spec.BrowserSession();

    var qn = browserSession.isPkgDir(pkgDir);
    if (qn == null) {
        return (qn);
    }

    var pkgPath = Packages.xdc.services.global.Path.getPath();
    var newPath = [];

    for (var i = 0; i < allDirs.length; i++) {
        newPath.push(java.io.File(allDirs[i]).getAbsolutePath());
    }

    for (var i = 0; i < pkgPath.length; i++) {
        newPath.push(pkgPath[i]);
    }

    var proot = Gbl.getPackageRoot(pkgDir);
    if (proot != null) {
        newPath.push(proot);
    }

    var xmlOutDir = outDir + ('' + qn).replace(/\./g, '/') + '/package';
    java.io.File(xmlOutDir).mkdirs();
    
    var outFile = java.io.File(xmlOutDir + '/package.doc.xml');
    if (outFile.exists()) {
        outFile['delete']();
    }

    var vers = Packages.xdc.services.intern.cmd.Builder.CYAN_VERS;

    if (java.io.File(pkgDir + '/package/.vers_c' + vers).exists()) {
        Gbl.copyFile(pkgDir + '/package/package.doc.xml', xmlOutDir);
        return (xmlOutDir);
    }

    var cacheElem = new Packages.xdc.services.global.CacheElem(qn, pkgDir, 'cdoc', vers);

    if (cacheElem.isTemp()) {
        _regen(newPath, pkgDir, outFile);
    }
    else {
        var tmpElemDir = cacheElem.create();
        if (tmpElemDir) {
            _regen(newPath, pkgDir, java.io.File(tmpElemDir, 'package.doc.xml'));
            cacheElem.commit();
        }
        var curElemDir = cacheElem.access();
        Gbl.copyFile(curElemDir.getAbsolutePath() + '/package.doc.xml', xmlOutDir);
    }        

    return (xmlOutDir);
}


function _regen( newPath, pkgDir, outFile )
{
    var env = new Packages.xdc.services.global.Env();
    env.setPath(newPath);

    var parserSession =  new Packages.xdc.services.spec.ParserSession(env);
    parserSession.setVerbose(false);

    var spkg = parserSession.compile(pkgDir + '/package.xdc');

    var outstr = new Packages.xdc.services.global.Out(new java.io.FileOutputStream(outFile));
    new Packages.xdc.services.intern.gen.Doc().gen(spkg, outstr);
    outstr.close();
}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


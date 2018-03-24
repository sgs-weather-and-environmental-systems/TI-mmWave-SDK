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
 *  ======== Main.xs ========
 */

var Big = xdc.loadCapsule('Big.xs');
var Pkg = xdc.loadCapsule('Pkg.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');
var Toc = xdc.loadCapsule('Toc.xs');
var Index = xdc.loadCapsule('Index.xs');

var _popt = false;
var _ropt = false;
var _aopt = false;
var _sopt = false;
var _bopt = false;
var _hopt = false;
var _nopt = false;
var _iopt = false;
var _qopt = false;

var XDCPATH = environment['xdc.path'];

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    var title = null;

    _popt = this.popt;
    _ropt = this.ropt;
    _aopt = this.aopt;
    _sopt = this.sopt;
    _bopt = this.bopt;
    _hopt = this.hopt;
    _nopt = this.nopt;
    _iopt = this.iopt;
    _qopt = this.qopt;

    if (_ropt) {
        _popt = true;
    }

    if (this.title) {
        title = this.title;
    }
    var start = this.start;

    var outdir;
    if (this.outdir) {
        outdir = this.outdir + java.io.File.separator;
    }
    else {
        outdir = (_popt ? 'cdoc' : 'package/cdoc') + java.io.File.separator;
    }

    if (this.doxytags || this.doxybase) {
        var msg = null;
        if ((this.doxytags && !this.doxybase) ||
            (!this.doxytags && this.doxybase)) {

            msg = 'Both --doxytags and --doxybase args must be specified';
        }
        else {
            var f = java.io.File(this.doxytags);
            if (f.exists()) {
                var tagFile = String(f.getCanonicalPath());
                try {
                    var dt = xdc.loadXML(tagFile);
                }
                catch (e) {
                    msg = 'error loading ' + tagFile + ' : ' + e.message;
                }
            }
            else {
                msg = 'Cannot find file ' + this.doxybase;
            }
        }
        if (!msg) {
            var f = java.io.File(this.doxybase);
            if (f.exists()) {
                var relbase = _toRelative(this.outdir, this.doxybase);
                if (relbase) {
                    Gbl.doxybase(relbase);
                    Gbl.doxytags(dt);
                }
                else {
                    msg = 'Cannot resolve ' + this.doxybase +
                          ' relative to ' + this.outdir;
                }
            }
            else {
                msg = 'Cannot find directory ' + this.doxybase;
            }
        }
        if (msg) {
            cmdr.error(msg);
        }
    }

    if (this.style) {
        var msg = null;
        var f = java.io.File(this.style);
        if (f.exists()) {
            var styleFile = String(f.getCanonicalPath());
            try {
                Gbl.copyFile(f.getCanonicalPath(), outdir);
                Gbl.style(String(f.getName()));
            }
            catch (e) {
                msg = 'error copying ' + styleFile + ' : ' + e.message;
            }
        }
        else {
            msg = 'Cannot find file ' + this.style;
        }
        if (msg) {
            cmdr.error(msg);
        }
    }
    else {
        Gbl.style('xdoc.css');
    }

    java.io.File(outdir).mkdirs();

    if (_iopt) {
        try {
            Toc.genToc(outdir);
            Index.gen(title, start, outdir, false);
            return;
        }
        catch (e) {
            cmdr.error(e.message);
        }
    }

    /* -A option documents the entire XDCPATH */
    if (_aopt) {
        _popt = _ropt = true;
        
        /* check off all the directories that were listed explicitly */
        var dupes={};
        for (var i = 0; i < args.length; i++) {
            dupes[String(java.io.File(args[i]).getCanonicalPath())] = true;
        }

        /* add all the repositories in the package path */
        var paths = XDCPATH.split(';');
        for (var i in paths) {
            /* or at least, if they aren't there already */
            if (paths[i]) {
                var cpath = String(java.io.File(paths[i]).getCanonicalPath());
                if (!(cpath in dupes)) {
                    args.$add(cpath);
                }
            }
        }
    }

    var dirs = [];
    if (!_popt) {
        dirs.push('.');
    }
    else {
        for (var i = 0; i < args.length; i++) {
            dirs.push(args[i]);
        }
    }

    var status = '';
    for each (var d in dirs) {
        if (!java.io.File(d).exists()) {
            if (status.length) {
                status += '\n';
            }
            status += "can't find directory " + d;
        }
    }
    if (status.length) {
        cmdr.error(status);
    }

    /* find package dirctories */
    var pkgdirs = [];
    for each (var d in dirs) {
        if (_ropt) {
            Gbl.findRootedPackageDirs(String(java.io.File(d).getCanonicalPath()),
                                      java.io.File(d), pkgdirs);
        }
        else {
            if (Gbl.isPackageDir(d)) {
                pkgdirs.push(d);
            }
        }
    }

    if (pkgdirs.length == 0) {
        cmdr.warning('*** no packages found ***');
        return;
    }

    _copyAppFiles(outdir);

    try {
        /* generate package.doc.xml for all packages */
        for each (var d in pkgdirs) {
            Pkg.gen(d, outdir, dirs, {srcFlg: _sopt, msgFlg: !_qopt,
                    nodFlg:_nopt});
        }
        if (!_hopt) {
            Toc.genToc(outdir);
            Index.gen(title, start, outdir, false);
        }

        if (_bopt) {
            Big.gen(title, outdir, {msgFlg: true});
        }
    }
    catch (e) {
        cmdr.error(e.message);
    }
}


/*
 *  ======== _copyAppFiles ========
 */
function _copyAppFiles(outdir)
{
    java.io.File(outdir).mkdirs();
    var FILEDIR = xdc.findFile(Gbl.FILEDIR);
    var fList = java.io.File(FILEDIR).list();
    for each (var f in fList) {
        if (!(java.io.File(FILEDIR + '/' + f).isDirectory())) {
            Gbl.copyFile(FILEDIR + '/' + f, outdir);
        }
    }
}

/*
 *  ======== _toRelative ========
 */
function _toRelative(basePath, targetPath)
{
    basePath = String(java.io.File(basePath).getCanonicalPath());
    basePath = basePath.replace(/\\/g, '/');

    targetPath = String(java.io.File(targetPath).getCanonicalPath());
    targetPath = targetPath.replace(/\\/g, '/');

    var base = basePath.split('/');
    var target = targetPath.split('/');

    /*  Get all the common elements. Store them as a string, */
    /*  and also count how many of them there are.           */
    var common = '';
    var commonLength = 0;
    for (var i = 0; i < target.length && i < base.length; i++) {
         if (target[i] == base[i]) {
             common += target[i] + '/';
             commonLength++;
         }
         else {
            break;
        }
    }
    if (commonLength == 0) {
        return (null);
    }

    var relative = '';
    if (base.length == commonLength) {
        relative = './';
    }
    else {
        var numDirsUp = base.length - commonLength;
        for (var i = 1; i <= numDirsUp; i++) {
            relative += '../';
        }
    }
    if (targetPath.length > common.length) {
        relative += targetPath.substr(common.length);
    }
    return (relative);
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


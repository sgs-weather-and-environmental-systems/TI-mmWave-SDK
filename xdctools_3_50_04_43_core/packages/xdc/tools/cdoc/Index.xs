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

var Gbl     = xdc.loadCapsule('Gbl.xs');
var Out     = xdc.loadCapsule('Out.xs');

var _out;
function PL( s ) { _out.println(s); }

/*
 *  ======== gen ========
 */
function gen(title, pname, outdir, big)
{
    var bodyPage = '';
    if (big) {
        bodyPage = 'body-big.html';
    }
    else if (pname != null) {
        bodyPage = pname.replace(/\./g, '/') + '/package.html';
    }
    else {
        bodyPage = 'all-packages.html';
    }

    if (big) {
        var index = '/index-big.html';
    }
    else {
        var index = '/index.html';
    }

    _out = new Out.Stream(outdir + index);

    if (title == null) {
        if (big) {
            title = 'RTSC Package Documentation (Consolidated)';
        }
        else {
            title = 'RTSC Package Documentation';
        }
    }

    PL(Gbl.FSDTYPE + '<HTML>');
    PL('<HEAD>');
    PL('<TITLE>' + title + '</TITLE>');
    PL('<META name="googlebot" content="noindex,nofollow">');
    PL('<SCRIPT language="javascript" type="text/javascript" src="index.js"></SCRIPT>');
    PL('</HEAD>');

    PL('<FRAMESET cols=20%,*>');
    if (big) {
        PL('<FRAME name="tree" scrolling="yes" src="toc-big.html">');
    }
    else {
        PL('<FRAME name="tree" scrolling="yes" src="toc.html">');
    }
    PL('<FRAMESET name="main" border="0" rows="*">');
    PL('<FRAME name="body" scrolling="yes" src="' + bodyPage + '">');
    PL('</FRAMESET>');
    PL('</FRAMESET>');

    PL('</HTML>');

    _out.close();
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


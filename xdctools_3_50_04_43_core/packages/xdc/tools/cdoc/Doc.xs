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
 *  ======== Doc.xs ========
 */

var Gbl = xdc.loadCapsule('Gbl.xs');

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== genAll ========
 */
function genAll( node )
{
    if (node.name() == 'unit' || node.name() == 'package') {
        PL('<span id="xdoc-desc"></span>');
    }

    var k = 1;
    for each (var ds in node.docSect) {
        PL('<span id="xdoc-sect-' + (k++) + '"></span>');
        PL('<div class="xdocSect">' + String(ds.@name).toUpperCase() + '</div>');
        for each (var dc in ds.docChild) {
            PL('<div class="xdocChild">' + Gbl.span('xdocChildId', dc.@name));
            if (dc.@summary != '') {
                PL(Gbl.span('xdocChildSum', '&#151;&nbsp;' + Gbl.decode(dc.@summary)));
            }
            PL('</div>');
            for each (var dp in dc.docPara) {
                PL('<div class="xdocChildText">' + Gbl.decode(dp.@content) + '</div>');
            }
        }
        for each (var dp in ds.docPara) {
            PL('<div class="xdocText">' + Gbl.decode(dp.@content) + '</div>');
        }
    }
}

/*
 *  ======== genBrief ========
 */
function genBrief( node )
{
    var ds = node.docSect.(@name == 'details');
    if (ds.length()) {
        PL('<div class="xdocBrief">');
        PL(Gbl.decode(ds.docPara[0].@content));
        if (Gbl.hasDoc(node)) {
            PL('[&nbsp;<a class="xdocBrief" href="#xdoc-desc">more</a>&nbsp;...&nbsp;]');
        }
        PL('</div>');
    }
}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


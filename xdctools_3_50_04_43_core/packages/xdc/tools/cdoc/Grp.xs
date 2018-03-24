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
 *  ======== Grp.xs ========
 */

var Doc = xdc.loadCapsule('Doc.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');
var Pag = xdc.loadCapsule('Pag.xs');
var Syn = xdc.loadCapsule('Syn.xs');

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== genElem ========
 */
function genElem(gNode, uNode, type)
{
    if (String(gNode.@name).indexOf('$') == 0) {
        return;
    }

    var iflg = (uNode.@kind == 'interface') && Gbl.hasSpecSyn(gNode);
    var tflg = Gbl.hasTargSyn(gNode) && type == Gbl.TARG_SYN;
    var mflg = Gbl.hasMetaSyn(gNode) && type == Gbl.META_SYN;

    if (iflg || tflg || mflg) {
        Pag.genHdr(gNode, null, uNode, null, type);
        if (iflg) {
            _genElemSynop(gNode, Gbl.SPEC_SYN);
        }
        else if (tflg) {
            _genElemSynop(gNode, Gbl.TARG_SYN);
        }
        else {
            _genElemSynop(gNode, Gbl.META_SYN);
        }
    }

    Doc.genAll(gNode);   // **jgc the user added doc- details, etc. Is embedded HTML
}

/*
 *  ======== genUnitSynop ========
 */
function genUnitSynop(gNode, sName)
{
    if (String(gNode.@name).indexOf('$') == 0) {
        Gbl.genRowB();
        Gbl.genRowB();
        Syn.genLines(gNode[sName], 0, gNode, false, sName);
        return;
    }
    PL(Gbl.sprintf("<div class='xdocSynHdr'>$1</div>\n", String(gNode.@name)));
    if (gNode[sName].length()) {
        Syn.genLines(gNode[sName], 1, gNode, false, sName);
        return;
    }

    var oflg = false;
    var sflg = false;

    for each (var dNode in gNode.decl) {
        if (dNode.@spacer == '1') {
            sflg = true;
            continue;
        }

        if (dNode.@external == '0') continue;
        if (!Gbl.opts().nodFlg && dNode.@nodoc == '1') continue;
        if (dNode[sName].length() == 0) continue;

        if (oflg && sflg) {
            Gbl.genRowB();
        }

        Syn.genLines(dNode[sName], 1, dNode, false, sName);

        oflg = true;
        sflg = false;
    }
}

/*
 *  ======== hasUnitSynop ========
 */
function hasUnitSynop(gNode, sName)
{
    if (gNode[sName].length()) return true;

    for each (var dNode in gNode.decl) {
        if (dNode.@external == '0') continue;
        if (!Gbl.opts().nodFlg && dNode.@nodoc == '1') continue;
        if (dNode[sName].length()) {
            return true;
            break;
        }
    }

    return false;
}

/*
    if (gNode.children().length() == 0) return false;
    if (gNode.decl.length() == 0 && gNode[sName].length() == 0) return false;

    if (gNode.decl.length() > 0) {
        var found = false;
        for each (var dNode in gNode.decl) {
            if (dNode.@external == '0') continue;
            if (!Gbl.opts().nodFlg && dNode.@nodoc == '1') continue;
            if (dNode[sName].length()) {
                found = true;
                break;
            }
        }
        return found;
    }

    return true;
*/    

/*
 *  ======== _genElemSynop ========
 */
function _genElemSynop( gNode, sName )
{
    Syn.genPrefix(gNode, sName);
    Syn.genLines(gNode[sName], 0, gNode, true, sName);
    Syn.genSuffix();
}


/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


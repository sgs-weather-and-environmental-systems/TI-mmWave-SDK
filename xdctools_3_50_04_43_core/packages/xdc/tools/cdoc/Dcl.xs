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
 *  ======== Dcl.xs ========
 */

var Doc = xdc.loadCapsule('Doc.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');
var Pag = xdc.loadCapsule('Pag.xs');
var Syn = xdc.loadCapsule('Syn.xs');

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== gen ========
 */
function gen(dNode, uNode, type)
{
    if (dNode.@external == '0') return;
    if (!Gbl.opts().nodFlg && dNode.@nodoc == '1') return;

    Gbl.genRowB();
    Pag.genHdr(dNode, null, uNode, null, type);

    if (type == Gbl.SPEC_SYN) {
        if (Gbl.hasSpecSyn(dNode)) {
            _genSynop(dNode, Gbl.SPEC_SYN);
        }
    }
    else if (type == Gbl.META_SYN) {
        if (Gbl.hasMetaSyn(dNode)) {
            _genSynop(dNode, Gbl.META_SYN);
        }
    }
    else if (type == Gbl.TARG_SYN) {
        if (Gbl.hasTargSyn(dNode)) {
            _genSynop(dNode, Gbl.TARG_SYN);
        }
    }
    Gbl.genRowB();
    Doc.genAll(dNode);

    /* add a "C SYNOPSIS" link for non-metaonly decls */
    if (type == Gbl.META_SYN && Gbl.hasTargSyn(dNode)) {
        var anc = String(dNode.@anchor);
        var dContent = Gbl.decode(dNode[Gbl.TARG_SYN].line[0].@content);
        var name = Syn.getDeclName(dContent);
        if (name == null) {
            /* handle Mod.Params decls */
            var mArr = dContent.match(/#per-instance_config_parameters" title=.*>(.*?)<\/a>/);
            if (mArr) {
                name = mArr[1] + '.' + anc.replace(/\.([A-Z])/g, "$1");
            }
        }
        if (name == null) {
            print("ERROR: broken C SYNOPSYS for " + dNode.@name + " (anc: " + anc+"), content = " + dContent);
        }

        PL('<div class="xdocSect">C SYNOPSIS</div>');
        PL('<div class="xdocText"><a class="xdoc-link" href="#' + anc + '" title="' + name + '">' +
            name + '</a></div>');
    }
}

/*
 *  ======== _genSynop ========
 */
function _genSynop( dNode, sName )
{
    Syn.genPrefix(dNode, sName);
    Syn.genLines(dNode[sName], 0, dNode, true, sName);
    Syn.genSuffix();
}


/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


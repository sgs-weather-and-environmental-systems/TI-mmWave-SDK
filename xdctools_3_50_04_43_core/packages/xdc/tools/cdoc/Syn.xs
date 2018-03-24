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
 *  ======== Syn.xs ========
 */

var Gbl = xdc.loadCapsule('Gbl.xs');
var Pag = xdc.loadCapsule('Pag.xs');

function PL( s ) { Gbl.outstr().println(s); }

var _curId = 1;

/*
 *  ======== genLines ========
 *  Generate synopsis content
 *  
 *  @param sNode   synopsis node (the synopsis content)
 *  @param tab     number of tabs worth of space to indent summary text
 *  @param node    element node (decl or group)
 *  @param elemFlg if true, this a single element; even if node is a 'group',
 *                 elemFlg is true for the instance Params object.
 *  @param sName   synopsis node name (synopTarg or synopMeta)
 */
function genLines(sNode, tab, node, elemFlg, sName)
{
    if (sNode.length() == 0) return;

    var pre = Gbl.indent(tab);
    var sumText = null;
    var sumLine = null;
    var eSkip = false;
    var defAnc = null;
    var defAlt = null;

    /* no need to add 'meta' to a metaonly unit's anchors */
    var addMeta = Gbl.unitNode().@metaonly == '1' ? false : true;

    if (node.name() == 'decl') {
        defAnc = String(node.@anchor);
        defAlt = String(node.@altext);
        sumText = "//&nbsp;" + node.@summary;
        sumLine = "<div class='xdocSynSum'>" + pre + Gbl.decode(sumText) + "</div>";
        if (addMeta && !Gbl.hasTargSyn(node)) {
            addMeta = false;
        }
    }
    else if (node.name() == 'group') {
        if (!elemFlg) {
            defAnc = String(node.@name).replace(/ /g, '_');
            defAlt = String(node.@name);
            if (addMeta && !Gbl.hasTargSyn(node)) {
                addMeta = false;
            }
        }
    }

    sumLine = null;

    for each (var ln in sNode.line) {
        if (ln.@elem.length()) {
            eSkip = ln.@elem == '1';
            continue; /* skip to next line; 'elem=' annotates following lines*/
        }
        if (!elemFlg && eSkip) {
            continue; /* skip 'elem=1' annotated lines when elemFlg is false */
        }

        /* generate blank line as necessary */
        if (ln.@blank == '1' && (elemFlg || ln.@always == '1')) {
            Gbl.genRowB();
            continue;
        }

        /* skip nodoc lines (unless command line options say we should) */
        if (!Gbl.opts().nodFlg && ln.@nodoc.length()) {
            continue;
        }

        /* anchor and hover text comes from node unless line says otherwise */
        var anc = defAnc;
        var alt = defAlt;
        if (ln.@anchor.length()) {
            anc = String(ln.@anchor);
            alt = String(ln.@altext);
        }

        /* add 'meta' prefix to anchors as needed */
        if (anc && sName == Gbl.META_SYN && addMeta) {
            if (ln.@metaonly != '1') {
                /* metaonly='1' => no 'meta' anchor prefix is needed */
                anc = 'meta' + anc;
            }
        }

        if (!elemFlg && ln.@comment.length()) {
            sumText = "//&nbsp;" + ln.@comment;
        }
        if (ln.@content.length()) {
            var cs = Gbl.mkCode(ln);
            if (sName == Gbl.META_SYN) {
                cs = _repSpecial(cs);
            }
            cs = elemFlg ? _remGo(cs) : _repGo(cs, anc, alt, sumText);
            Gbl.genRowC(pre + cs);
            sumText = null;
        }
        if (elemFlg && ln.@comment.length()) {
            PL("<div class='xdocSynSum'>" + pre + Gbl.indent(ln.@tab) + "//&nbsp;" + Gbl.decode(ln.@comment) + "</div>");
            sumLine = null;
        }

        if (sumLine) {
            PL(sumLine);
            sumLine = null;
        }
    }

    if (node.name() == 'group' || node.name() == 'decl' && node.@name == 'create' && sNode.name() == 'synopTarg') {
        return;
    }

    if (sumLine) {
        PL(sumLine);
    }

// FIX Gbl.sprintf !!!!
//    Gbl.TRACE = true;
//    PL(Gbl.sprintf("<div class='xdocSynSum'>$1//&nbsp;$2$3</div>", pre, Gbl.decode(node.@summary), link));
//    Gbl.TRACE = false;

}

/*
 *  ======== genPrefix ========
 */
function genPrefix(node, sName)
{
    var left, right;
    var cls;
    var id;
    var isDecl = node.name() == 'decl' || node.name() == 'group';
    var isUnit = node.name() == 'unit';

    if (sName == Gbl.META_SYN) {
        if (isDecl) {
            cls = 'xdocSynMdcl';
            id = 'xdoc-id-meta2dcl';
        }
        else {
            cls = 'xdocSynM';
            id = 'xdoc-id-meta2';
        }
        left = Gbl.sprintf("<tt>$1</tt>Configuration settings", Gbl.span(id, ''));
        right = '';
        id = 'meta-synop';
    }
    else if (sName == Gbl.TARG_SYN) {
        if (isDecl) {
            cls = 'xdocSynTdcl';
            id = 'xdoc-id-targ2dcl';
        }
        else {
            cls = 'xdocSynT';
            id = 'xdoc-id-targ2';
        }
        left = Gbl.sprintf("<tt>$1</tt> synopsis", Gbl.span(id, 'C'));
        right = 'target-domain';
        id = 'targ-synop';
    }
    else {
        cls = isDecl ? 'xdocSynXdcl' : 'xdocSynX';
        id = 'spec-synop';
    }

    PL(Gbl.sprintf("<span id='$1'></span>", id));

    if (sName == Gbl.SPEC_SYN) {
        Pag.genSpecFile(Gbl.unitNode(), 'declarations',
                        isDecl ? 'xdoc-iddcl' : null);
    }
    else {
        if (isUnit) {
            Pag.genUnitSpecFile(node, left, right);
        }
        else {
            Pag.genLabel(left, right);
        }
    }
    Pag.genSynTabBeg(cls);
}

/*
 *  ======== genSuffix ========
 */
function genSuffix()
{
    Pag.genSynTabEnd();
}

/*
 *  ======== getDeclKind ========
 */
function getDeclKind(content)
{
    var kind = null;

    if (content.match(/>typedef</)) {
        kind = 'typedef';
    }
    else if (content.match(/>#define</)) {
        kind = 'const';
    }
    else if (content.match(/\(/)) {
        kind = 'fxn';
    }
    else if (content.match(/>struct</)) {
        kind = 'struct';
    }
    else if (content.match(/>enum</)) {
        kind = 'enum';
    }
    return (kind);
}

/*
 *  ======== getDeclName ========
 */
function getDeclName(content)
{
    var name = null;

    var mArr = content.match(/<go><span class="xdoc-id">(.*?)<\/span>.*/);
    if (mArr) {
        name = mArr[1];
    }
    return (name);
}

/*
 *  ======== getDeclTableHtml ========
 */
function getDeclTableHtml(content, anc, alt, sumText)
{
    var pre = Gbl.indent(0);
    var decl;
    var rep;

    if (sumText) {
        sumText = sumText.replace(/%3Ca/g, '%3Cspan').replace(/%3C%2Fa%3E/g, '%3C%2Fspan%3E');
        rep ='<a class="xdocSynGo" href="#' + anc + '">$1<span class="xdocSynHoverShadow"><span class="xdocSynHover">' + sumText + '</span></span></a>';
        rep = Gbl.decode(rep);
    }
    else {
        rep = '<a class="xdocSynGo" href="#' + anc + '" title="' + alt + '">$1</a>'; 
    }

    decl = Gbl.decode(pre + content);
    var idx = decl.indexOf('<go><span class="xdoc-id">');
    pre = decl.substr(0, idx);
    var suf = decl.substr(idx);
    if (pre.match(/\(\*/)) {
        pre = pre.replace(/\(\*/, '');
        suf = '(*' + suf;
    }
    decl = '<td class="xdocSynDecl" nowrap><div class="xdocSynTblType">' + pre +
           '</div></td><td class="xdocSynDecl"><div class="xdocSynTblDecl">' +
           suf + '</div></td>';
    decl = '<tr valign="top">' + decl.replace(/<go>(.*?)<\/go>/, rep) + '</tr>';
    decl = decl.replace(/<go>/g, '').replace(/<\/go>/g, '');
    return (decl);
}

/*
 *  ======== _mkLink ========
 */
function _mkLink( anc, alt )
{
    return Gbl.sprintf("<a class='xdocSynGo' href='$1$2.html#$3' title='$4.$2.$5'>&nbsp;</a>",
        Gbl.path(),
        String(Gbl.unitNode().@name),
        anc,
        String(Gbl.pkgNode().@name),
        alt
    );
}

/*
 *  ======== _remGo ========
 *  Remove <go> and </go> tags from line
 */
function _remGo( s )
{
    return(s.replace(/<go>/g, '').replace(/<\/go>/g, ''));
}

/*
 *  ======== _repGo ========
 *  Replace content between <go> and </go> tags in a line with appropriate
 *  link and hover text
 * 
 *  @param s   line to filter
 *  @param anc anchor to link/go to
 *  @param alt default link hover text
 *  @param sum user supplied hover text summary
 */
function _repGo( s, anc, alt, sum )
{
    var rep;
    var popup = '';

    if (sum) {
        sum = sum.replace(/%3Ca/g, '%3Cspan').replace(/%3C%2Fa%3E/g, '%3C%2Fspan%3E');
        rep ='<a class="xdocSynGo" href="#' + anc + '">$1<span class="xdocSynHoverShadow"><span class="xdocSynHover">' + sum + '</span></span></a>';
    }
    else {
        /* title is used by CSS as the text to display when hover is enabled */
        rep = '<a class="xdocSynGo" href="#' + anc + '" title="' + alt + '">$1</a>'; 
    }

    return _remGo(s.replace(/<go>(.*?)<\/go>/, rep));
}

/*
 *  ======== _repSpecial ========
 *  Replace links to special sections with appropriate 'meta'-prefixed link
 *  These special links are generated by mkSpecialLink() of
 *  xdc.services.intern.gen.Doc.java.
 *
 *  Note: we only need to filter section references that have duals in the
 *        meta world; most special sections are only for the target side.
 */
function _repSpecial( s )
{
    var ms;

    /* handle Params */
    ms = s.replace('#per-instance_config_parameters"',
                   '#metaper-instance_config_parameters"');

    /* handle create */
    ms = ms.replace('#per-instance_creation"',
                    '#metaper-instance_creation"');

    return (ms);
}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


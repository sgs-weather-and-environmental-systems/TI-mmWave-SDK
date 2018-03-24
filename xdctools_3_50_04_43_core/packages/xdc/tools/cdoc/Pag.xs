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
 *  ======== Page.xs ========
 */

var Doc = xdc.loadCapsule('Doc.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== genHdr ========
 */
function genHdr(node, left, up, right, sName)
{
    if (node.name() == 'decl') {
        var anc = node.@anchor;
        if (sName == Gbl.META_SYN && Gbl.hasTargSyn(node)) {
            anc = 'meta' + anc;
        }

        PL('<a class="xdocAnchor" id="' + anc + '"></a>');
        if (node.@kind == 'enum') {
            for each (var en in node.decl) {
                PL('<a class="xdocAnchor" id="' + en.@anchor + '"></a>');
            }
        }
    }
    else if (node.name() == 'group') {
        var anc = String(node.@name).replace(/ /g, '_');
        if (sName == Gbl.META_SYN && Gbl.hasTargSyn(node)) {
            anc = 'meta' + anc;
        }
        PL('<a class="xdocAnchor" id="' + anc + '"></a>');
    }

    PL('<table class="xdocHdr"><tr>');
    PL('<td class="xdocHdrTitle">' + _mkSlug(node, up, sName) + '</td>');

    sp = '';
    if (left) {
        PL('<td class="xdocHdrArrow">' + sp);
        PL(Gbl.sprintf('<a class="xdocHdrLink" href="$3$1.html" title="$2 $1"><img class="xdocHdrArrow" src="' + Gbl.root() + 'Arrow_left.png"/></a></td>',
            String(left.@name), String(left.@kind), Gbl.path()));
    }
    if (up) {
        PL('<td class="xdocHdrArrow">' + sp);
        PL(Gbl.sprintf('<a class="xdocHdrLink" href="$4$1.html" title="$2 $3"><img class="xdocHdrArrow" src="' + Gbl.root() + 'Arrow_up.png"/></a></td>',
            up.@kind == 'package' ? 'package' : String(up.@name), String(up.@kind), String(up.@name), Gbl.path()));
    }
    if (right) {
        PL('<td class="xdocHdrArrow">' + sp);
        PL(Gbl.sprintf('<a class="xdocHdrLink" href="$3$1.html" title="$2 $1"><img class="xdocHdrArrow" src="' + Gbl.root() + 'Arrow_right.png"/></a></td>',
            String(right.@name), String(right.@kind), Gbl.path()));
    }
    if (!left && !up && !right) {
        PL('<td class="xdocHdrArrow">&nbsp;&nbsp;&nbsp;</td>');
    }
    PL('</table>');

    if (Gbl.pkgNode()) {
        PL('<div class=xdocHdrIndex><a class=xdocHdrIndex title="right-click to capture" href="' + Gbl.root() + 'index.html#' + _mkIndex(node) + '">index URL</a></div>');
    }

    if (node.@summary != '') {
        if (node.name() == 'decl') {
            PL('<p class="xdocHdrSummaryDcl">' + Gbl.decode(node.@summary) + '</p>');
        }
        else {
            PL('<p class="xdocHdrSummary">' + Gbl.decode(node.@summary) + '</p>');
        }
    }
}

/*
 *  ======== genLabel ========
 */
function genLabel(left, right, center)
{
    PL('<table class="xdocLabel"><tr>');
    PL('<td class="xdocLabelLeft">' + left + '</td>');
    if (center) {
        PL('<td class="xdocLabelCenter">' + center + '</td>');
    }
    PL('<td class="xdocLabelRight">' + right + '</td>');
    PL('</tr></table>');
}

/*
 *  ======== genPrefix ========
 */
function genPrefix(title, summary)
{
    PL('<html>');
    PL('<head>');
    PL('<title>' + title + '</title>');
    if (summary) {
        var sum = summary.replace(/<\S[^>]*>/g, ''); /* remove any html */
        sum = sum.replace(/\n/g, '');                /* newlines */
        sum = sum.replace(/  +/g, ' ');              /* multiple spaces */
        PL('<meta name="description" content="' + sum + '">');
    }
    PL('<link rel="stylesheet" type="text/css" href="' + Gbl.root() + Gbl.style() + '" />');
    PL('</head>');
    PL('<body><div id="xdocWrapper"><div id="xdocContent">');
}

/*
 *  ======== genSuffix ========
 */
function genSuffix()
{
    var d = new Date;
    
    PL('<div id="xdocDate">generated on ' + d.toUTCString() + '</div>');
    PL('</div></div></body>');
    PL('</html>');
}

/*
 *  ======== genSpecFile ========
 */
function genSpecFile(node, slug, id)
{
    genLabel('<tt>' + Gbl.span(id ? id : 'xdoc-id', 'XDCspec') + '</tt> ' + slug, 'sourced in ' +  _mkSpecFile(node));
}

/*
 *  ======== genSynTabBeg ========
 */
function genSynTabBeg(cls)
{
    PL(Gbl.sprintf('<div class="$1">', cls));
}

/*
 *  ======== genSynTabEnd ========
 */
function genSynTabEnd()
{
    PL('</div>');
}

/*
 *  ======== genToc ========
 */
function genToc(node)
{
    PL('<ul class="xdocToc">');

/*
    if (node.@kind != 'module') {
        PL('<li class="xdocToc"><a class="xdocToc" href="#spec-synop">XDCspec declarations</a></li>');
    }
*/

    if (Gbl.hasTargSyn(node)) {
        if (node.@kind == 'interface') {
            PL('<li class="xdocToc"><a class="xdocToc" href="#spec-synop">Specification synopsis</a></li>');
        }
        else {
            PL('<li class="xdocToc"><a class="xdocToc" href="#targ-synop">C synopsis</a></li>');
        }
        if (node.name() == 'unit') {
            PL('<li class="xdocToc2"><a class="xdocToc" href="#xdocElems">Individual elements</a></li>');
        }
    }

/*
    if (node.@kind == 'module') {
        PL('<li class="xdocToc"><a class="xdocToc" href="#spec-synop">XDCspec declarations</a></li>');
    }
*/

    if (Gbl.hasDoc(node)) {
        if (node.docSect.length() > 1) {
            var k = 1;
            for each (var ds in node.docSect) {
                PL('<li class="xdocToc"><a class="xdocToc" href="#xdoc-sect-' + (k++) + '">' + String(ds.@name).toUpperCase() + '</a></li>');
            }
        }
    }

    if (Gbl.hasMetaSyn(node)) {
        PL('<li class="xdocToc"><a class="xdocToc" href="#meta-synop">Configuration settings</a></li>');
        if (node.name() == 'unit') {
            PL('<li class="xdocToc2"><a class="xdocToc" href="#xdocMetaElems">Individual elements</a></li>');
        }
    }

    PL('</ul>');
}

/*
 *  ======== genUnitSpecFile ========
 */
function genUnitSpecFile(node, left, right)
{
    genLabel(left, 'sourced in ' +  _mkSpecFile(node), right);
}

/*
 *  ======== _mkIndex ========
 */
function _mkIndex(node)
{
    var pn = String(Gbl.pkgNode().@name).replace(/\./g, '/') + '/';

    if (node.name() == 'package') {
        return pn + 'package.html';
    }
    else if (node.name() == 'unit') {
        return pn + String(node.@name) + '.html';
    }

    var anc = node.name() == 'decl' ? String(node.@anchor) : String(node.@name).replace(/ /g, '_'); 
    return pn + String(Gbl.unitNode().@name) + '.html#' + anc;
}


/*
 *  ======== _mkSpecFile ========
 */
function _mkSpecFile(node)
{
    var pre = String(Gbl.pkgNode().@name).replace(/\./g, '/');
    var fn = node.@kind == 'package' ? 'package' : String(node.@name);
    
    var result = Gbl.span('xdocLabelFile', pre + '/' + fn + '.xdc');

    if (Gbl.opts().srcFlg) {
        var href = '<a class="xdocLink" href="' + Gbl.path() + fn + '-src.html">';
        result = href + result + '</a>';
    }

    return result;
}

/*
 *  ======== _mkSlug ========
 */
function _mkSlug(node, scope, sName)
{
    if (node.name() == 'group') {
        var prefix = "";
        var name  = String(node.@name);
        if (name && name.match(/per-instance/)) {
            name = name.replace(/per-instance/, 'Instance');
            if (name.indexOf("creation") != -1) {
                prefix = sName == Gbl.TARG_SYN ? "Runtime " : "Static ";
            }
        }
        name = name.replace(/\b./g, function(m) {return m[0].toUpperCase();});

        return Gbl.span('xdocSynSum', prefix + name);
    }

    var res = '';

//    res += node['@final'] == '1' ? Gbl.span('xdoc-kw1', 'final ') : '';
//    res += node.@overrides == '1' ? Gbl.span('xdoc-kw1', 'override ') : '';
    res += node.@metaonly == '1' ? Gbl.span('xdoc-kw1', 'metaonly ') : '';
//    res += node.@readonly == '1' ? Gbl.span('xdoc-kw1', 'readonly ') : '';
    res += node.@kind != 'fxn' ? Gbl.span('xdoc-kw1', node.@kind) + ' ' : '';
    if (scope) {
        var s = (sName == Gbl.TARG_SYN) ? '_' : '.';
        if (node.@kind == 'config' && node.@instance == '1') {
            s += "Params.";
        }
        res += Gbl.span('xdoc-id', scope.@name + s);
    }
    res += node.@name == 'create' ? Gbl.span('xdoc-kw1', 'create') : Gbl.span('xdoc-id', node.@name);
    res += node.@kind == 'fxn' ? '()' : '';

    if (scope && (node.@kind == 'fxn' || node.@kind == 'config')) {
        res += Gbl.sprintf('$1<small><span class="xdocSynSum">//&nbsp;$2</span></small>', Gbl.spaces(2), node.@instance == '1' ? 'instance' : 'module-wide');
    }

    return res;
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


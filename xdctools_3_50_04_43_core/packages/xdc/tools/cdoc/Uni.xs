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
 *  ======== Uni.xs ========
 */

var Dcl = xdc.loadCapsule('Dcl.xs');
var Doc = xdc.loadCapsule('Doc.xs');
var Gbl = xdc.loadCapsule('Gbl.xs');
var Grp = xdc.loadCapsule('Grp.xs');
var Out = xdc.loadCapsule('Out.xs');
var Pag = xdc.loadCapsule('Pag.xs');
var Src = xdc.loadCapsule('Src.xs');
var Syn = xdc.loadCapsule('Syn.xs');
var Txt = xdc.loadCapsule('Txt.xs');
var Xml = xdc.loadCapsule('Xml.xs');

var _pkgDir;
var _unitNodeList;

function PL( s ) { Gbl.outstr().println(s); }

/*
 *  ======== genAll ========
 */
function genAll( uNodeList, pDir )
{
    _pkgDir = pDir;
    _unitNodeList = uNodeList;

    var pos = 0;

    for each (var uNode in uNodeList) {
        Gbl.unitNode(uNode);
        _genBody(uNode, pos++);
    }

    /* release memory */
    Gbl.unitNode(null);
    _unitNodeList = undefined;
}

/*
 *  ======== _genBody ========
 */
function _genBody( uNode, pos )
{
    Gbl.outstr(new Out.Stream(_pkgDir + '/' + uNode.@name + '.html'));

    var left = pos && _unitNodeList[pos - 1] ? _unitNodeList[pos - 1] : null;
    var right = _unitNodeList[pos + 1] ? _unitNodeList[pos + 1] : null;
    
    Pag.genPrefix(String(uNode.@kind) + ' ' + Gbl.pkgNode().@name +
                  '.' + uNode.@name, Gbl.decode(uNode.@summary));
    Pag.genHdr(uNode, left, Gbl.pkgNode(), right, null);

    Pag.genToc(uNode);

    Doc.genBrief(uNode); /* This is the prefix of DETAILS with [more...] */

    if (uNode.@kind == 'interface') {
        _genInfo(uNode);
        _genSynop(uNode, Gbl.SPEC_SYN);
        if (Gbl.hasDoc(uNode)) {
            Doc.genAll(uNode);
        }
        _genElems(uNode, Gbl.SPEC_SYN);
    }
    else {
        var hasTargSyn = Gbl.hasTargSyn(uNode);
        if (hasTargSyn) {
            _genSynopTable(uNode, Gbl.TARG_SYN); /* this is the big blue box */

            if (Gbl.hasDoc(uNode)) {             /* user supplied cdoc */
                Doc.genAll(uNode);
            }

            _genElems(uNode, Gbl.TARG_SYN);
        }

        if (Gbl.hasMetaSyn(uNode)) {
            if (hasTargSyn) {
                Gbl.genRowB();
            }
            _genSynop(uNode, Gbl.META_SYN);      /* this is the big red box */

            if (!hasTargSyn && Gbl.hasDoc(uNode)) {
                Doc.genAll(uNode);
            }

            _genElems(uNode, Gbl.META_SYN);
        }
    }

    Pag.genSuffix();
    Gbl.outstr().close();
}

/*
 *  ======== _genElems ========
 *  These are the individual groups: 'Module-wide configs', etc
 */
function _genElems(uNode, type)
{
    PL('<div id="xdocSep">');
    PL('</div>');
    if (type == Gbl.META_SYN) {
        PL('<div id="xdocMetaElems">');
    }
    else {
        PL('<div id="xdocElems">');
    }
    for each (var gNode in uNode.group) {
        if (type == Gbl.TARG_SYN) {
            if (gNode..synopTarg.length() <= 0) {
                continue;
            }
        }
        if (type == Gbl.META_SYN) {
            if (gNode..synopMeta.length() <= 0) {
                continue;
            }
        }
        if (type == Gbl.SPEC_SYN) {
            if (gNode..synopSpec.length() <= 0) {
                continue;
            }
        }

        /* the group synop & any user added doc */
        Grp.genElem(gNode, uNode, type);  

        for each (var dNode in gNode.decl) {
            if (dNode.@spacer == '1') {
                continue;
            }
            if (type == Gbl.TARG_SYN && !Gbl.hasTargSyn(dNode)) {
                continue;
            }
            if (type == Gbl.META_SYN && !Gbl.hasMetaSyn(dNode)) {
                continue;
            }
            if (type == Gbl.SPEC_SYN && !Gbl.hasSpecSyn(dNode)) {
                continue;
            }
            Dcl.gen(dNode, uNode, type);
        }
    }
    PL('</div>');
}

/*
 *  ======== _genInfo ========
 */
function _genInfo(uNode)
{
    Pag.genSpecFile(Gbl.unitNode(), 'summary');
    Pag.genSynTabBeg('xdocSynX');

    for each (var ln in uNode.specInfo.line) {
        if (ln.@blank == '1') {
            Gbl.genRowB();
        }
        else if (ln.@comment.length()) {
            PL("<div class='xdocSynSum'>" + Gbl.indent(ln.@tab) +
               "//&nbsp;" + Gbl.decode(ln.@comment) + "</div>");
        }
        else {
            Gbl.genRowC(Gbl.mkCode(ln).replace(/<go>/g, '').replace(/<\/go>/g, ''));
        }
    }
    Pag.genSynTabEnd();
}

/*
 *  ======== _genSynop ========
 */
function _genSynop( uNode, sName )
{
    Syn.genPrefix(uNode, sName);

    var sNode = uNode[sName];
    var last = sNode.line.length() - 1;
    
    if (last) {
        for (i = 0; i < last; i++) {
            if (sNode.line[i].@blank == '1') {
                Gbl.genRowB();
            }
            else {
               Gbl.genRowC(Gbl.mkCode(sNode.line[i]).replace(/<go>/g, '').replace(/<\/go>/g, ''));
            }
        }
    }
    else {
        Gbl.genRowC(Gbl.mkCode(sNode.line[0]));
    }

    for each (var gNode in uNode.group) {
        if (Grp.hasUnitSynop(gNode, sName)) {
            Grp.genUnitSynop(gNode, sName);
        }    
    }

    if (last) {
        Gbl.genRowC(Gbl.mkCode(sNode.line[last]));
    }
    else {
        Gbl.genRowB();
    }

    Syn.genSuffix();
}

/*
 *  ======== _genSynopTable ========
 */
function _genSynopTable(uNode, sName)
{
    Syn.genPrefix(uNode, sName);

    var sNode = uNode[sName];
    var last = sNode.line.length() - 1;

    if (last) {
        for (i = 0; i < last; i++) {
            if (sNode.line[i].@blank == '1') {
                Gbl.genRowB();
            }
            else {
                Gbl.genRowC(Gbl.mkCode(sNode.line[i]));
            }
        }
    }
    else {
        Gbl.genRowC(Gbl.mkCode(sNode.line[0]));
    }

    var constArr = [];
    var configArr = [];
    var typedefArr = [];
    var defineArr = [];
    var dataArr = [];

    var instConfigs = [];
    var instObjTypes = [];
    var instConvertors = [];

    var thisModFxns = [];
    var fxns = [];
    var instFxns = [];
    var moduleWideBuiltInFxns = [];

    /* this module's data: constants, and extern mutable data */
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/module-wide constants/)) {
            constArr = _getDecls(gNode, sName, constArr);
            break;
        }
    }
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/module-wide config parameters/)) {
            configArr = _getDecls(gNode, sName, configArr);
            break;
        }
    }
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/module-wide data/)) {
            dataArr = _getDecls(gNode, sName, dataArr);
            break;
        }
    }

    /* this module's functions */
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/module-wide functions/)) {
            fxns = _getDecls(gNode, sName, fxns);
            break;
        }
    }

    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance creation/)) {
            fxns = _getSynopDecls(gNode, sName, fxns);
            break;
        }
    }

    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance functions/)) {
            fxns = _getDecls(gNode, sName, fxns);
            break;
        }
    }

    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance deletion/)) {
            fxns = _getSynopDecls(gNode, sName, fxns);
            break;
        }
    }
    /* from IInstance */
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance built-ins/)) {
            instFxns = _getSynopDecls(gNode, sName, instFxns);
            break;
        }
    }

    /* from IModule */
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/module-wide built-ins/)) {
            moduleWideBuiltInFxns = _getSynopDecls(gNode, sName, moduleWideBuiltInFxns);
            break;
        }
    }

    /* mixed decls from IInstance */
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance config parameters/)) {
            instConfigs = _getSynopDecls(gNode, sName, instConfigs);
            break;
        }
    }
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance object types/)) {
            instObjTypes = _getSynopDecls(gNode, sName, instObjTypes);
            break;
        }
    }
    for each (var gNode in uNode.group) {
        if (String(gNode.@name).match(/per-instance convertors/)) {
            instConvertors = _getSynopDecls(gNode, sName, instConvertors);
            break;
        }
    }

    /* parse mixed from IInstance decls */
    for each (var itm in instConfigs) {
        if (itm.kind == 'const') {
            defineArr.push(itm);
        }
        else if (itm.kind == 'typedef') {
            typedefArr.push(itm);
        }
        else if (itm.kind == 'fxn') {
            fxns.push(itm);
        }
    }
    for each (var itm in instObjTypes) {
        if (itm.kind == 'const') {
            defineArr.push(itm);
        }
        else if (itm.kind == 'typedef') {
            typedefArr.push(itm);
        }
        else if (itm.kind == 'fxn') {
            instFxns.push(itm);
        }
    }
    for each (var itm in instConvertors) {
        if (itm.kind == 'const') {
            defineArr.push(itm);
        }
        else if (itm.kind == 'typedef') {
            typedefArr.push(itm);
        }
        else if (itm.kind == 'fxn') {
            instFxns.push(itm);
        }
    }

    /* separate defines and typedefs */
    for each (var itm in constArr) {
        if (itm.kind == 'const') {
            defineArr.push(itm);
        }
        else {
            typedefArr.push(itm);
        }
    }

    typedefArr.sort(_objNameCompare);
    defineArr.sort(_objNameCompare);
    configArr.sort(_objNameCompare);
    dataArr.sort(_objNameCompare);

    instFxns.sort(_objNameCompare);
    moduleWideBuiltInFxns.sort(_objNameCompare);

    /* distribute the fxns over the interfaces */
    var inMap = {};
    for (var i = 0; i < fxns.length; i++) {
        if (!fxns[i].origin) {
            thisModFxns.push(fxns[i]);
        }
        else {
            if (!inMap[fxns[i].origin]) {
                inMap[fxns[i].origin] = [];
            }
            inMap[fxns[i].origin].push(fxns[i]);
        }
    }

    thisModFxns.sort(_objNameCompare);
    for (inface in inMap) {
        inMap[inface].sort(_objNameCompare);
    }

    PL('<table cellspacing="0" cellpadding="0" border="0">');

    if (thisModFxns.length) {
        _genTableGroupHeader('Functions');
        for (var i = 0; i < thisModFxns.length; i++) {
            PL(thisModFxns[i].html);
        }
    }

    for (inface in inMap) {
        _genFxnGroupHeader('Functions common to all ' + inface + ' modules');
        for (var i = 0; i < inMap[inface].length; i++) {
            PL(inMap[inface][i].html);
        }
    }

    if (instFxns.length) {
        _genFxnCatGroupHeader('Functions common to all target instances');
        _genRowOfFunctions(instFxns);
    }

    if (moduleWideBuiltInFxns.length) {
        _genFxnCatGroupHeader('Functions common to all target modules');
        _genRowOfFunctions(moduleWideBuiltInFxns);
    }

    if (defineArr.length) {
        _genTableGroupHeader('Defines');
        for (var i = 0; i < defineArr.length; i++) {
            PL(defineArr[i].html);
        }
    }
    if (typedefArr.length) {
        _genTableGroupHeader('Typedefs');
        for (var i = 0; i < typedefArr.length; i++) {
            PL(typedefArr[i].html);
        }
    }

    if (configArr.length) {
        _genTableGroupHeader('Constants');
        for (var i = 0; i < configArr.length; i++) {
            PL(configArr[i].html);
        }
    }
    if (dataArr.length) {
        _genTableGroupHeader('Variables');
        for (var i = 0; i < dataArr.length; i++) {
            PL(dataArr[i].html);
        }
    }

    PL('</table>');

    if (last) {
        Gbl.genRowC(Gbl.mkCode(sNode.line[last]));
    }
    else {
        Gbl.genRowB();
    }

    Syn.genSuffix();
}

/*
 *  ======== _genRowOfFunctions ========
 */
function _genRowOfFunctions(fxnArr)
{
    PL('<tr>');
    PL('<td></td>');
    PL('<td>');
    PL('<div class="xdocSynTblPack">');
    for (var i = 0; i < fxnArr.length; i++) {
        var i1 = fxnArr[i].html.indexOf('<a class="xdocSynGo"');
        var i2 = fxnArr[i].html.indexOf('</a>', i1);
        var str = fxnArr[i].html.substr(i1, i2 - i1 + 4);
        if (i < fxnArr.length - 1) {
            str += ',';
        }
        PL(str);
    }
    PL('</div>');
    PL('</td>');
    PL('</tr>');
}

/*
 *  ======== _genFxnGroupHeader ========
 */
function _genFxnGroupHeader(title)
{
    PL(Gbl.sprintf('<tr><td colspan="2"><div class="xdocSynFxnCat">$1</div></td></tr>\n', title));
}
/*
 *  ======== _genFxnCatGroupHeader ========
 */
function _genFxnCatGroupHeader(title)
{
    PL(Gbl.sprintf('<tr><td class="xdocSynFxnCat" colspan="2"><div class="xdocSynFxnCat">$1</div></td></tr>\n', title));
}

/*
 *  ======== _genTableGroupHeader ========
 */
function _genTableGroupHeader(title)
{
    PL(Gbl.sprintf("<tr><td colspan='2'><div class='xdocSynTblHdr'>$1</div></td></tr>\n", title));
}

/*
 *  ======== _getDecls ========
 */
function _getDecls(gNode, sName, arr)
{
    for each (var dNode in gNode.decl) {
        if (dNode.@external == '0') continue;
        if (!Gbl.opts().nodFlg && dNode.@nodoc == '1') continue;
        if (dNode[sName].length() == 0) {
            continue;
        }
        var decl = {};
        var dContent = Gbl.decode(dNode[sName].line[0].@content);
        decl.name = Syn.getDeclName(dContent);
        if (decl.name == null) {
            decl.name = String(dNode.@name);
        }
        decl.kind = String(dNode.@kind);

        if (decl.kind == 'fxn' && dNode.@origin.length()) {
            decl.origin = String(java.net.URLDecoder.
                          decode(dNode.@origin, 'UTF-8')).
                          match(/.+>(.+)<\/a>/)[1];
        }
        var anc = String(dNode.@anchor);
        var alt = String(dNode.@altext);
        var sumText = dNode.@summary.length() ?
                      "//&nbsp;" + dNode.@summary : null;
        if (dContent.match(/\{/)) {
            dContent = dContent.replace(/\{/, '...');
        }
        decl.html = Syn.getDeclTableHtml(dContent, anc, alt, sumText);
        arr.push(decl);
    }
    return(arr);
}


/*
 *  ======== _getSynopDecls ========
 *
 *  assumes Targ
 *
 */
function _getSynopDecls(gNode, sName, arr)
{
    var sumText = null;
    var anc = String(gNode.@name).replace(/ /g, '_');
    var alt = String(gNode.@name);
    var sNode = gNode[sName];

    for each (var i = 0; i < sNode.line.length(); i++) {
        ln = sNode.line[i];
        if (!ln.@content.length()) {
            continue;
        }
        sumText = (ln.@comment.length()) ?
                  "//&nbsp;" + ln.@comment : null;
        var dContent = Gbl.decode(ln.@content);
        var decl = {};
        decl.name = Syn.getDeclName(dContent);
        decl.kind = Syn.getDeclKind(dContent);
        if (dContent.match(/\{/)) {
            var sLine = dContent;
            dContent = dContent.replace(/\{/, '...');
            while (!sLine.match(/\}/)) {
                ln = sNode.line[++i];
                sLine = Gbl.decode(ln.@content);
            }
        }
        decl.html = Syn.getDeclTableHtml(dContent, anc, alt, sumText);
        arr.push(decl);
    }
    return (arr);
}

/*
 *  ======== _objNameCompare ========
 */
function _objNameCompare(obj1, obj2)
{
    var name1 = obj1.name.toUpperCase();
    var name2 = obj2.name.toUpperCase();
    if (name1 < name2) {
        return (-1);
    }
    if (name1 > name2) {
        return (1);
    }
    else {
        /* if equal, put upper case first */
        var ch1 = obj1.name.substr(0, 1);
        var ch2 = obj2.name.substr(0, 1);
        if (ch1.toUpperCase() == ch2) {
            return (1);
        }
        if (ch2.toUpperCase() == ch1) {
            return (-1);
        }
    }
    return (0);
}


/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


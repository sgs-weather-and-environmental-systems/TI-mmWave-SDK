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
 *  ======== Txt.xs ========
 */

var Gbl = xdc.loadCapsule('Gbl.xs');
var Out = xdc.loadCapsule('Out.xs');
var Txt = xdc.loadCapsule('Txt.xs');

var KW_XDC = "config|const|enum|extern|false|final|inherits|instance|interface|internal|length|metaonly|module|null|override|package|readonly|requires|return|sizeof|struct|true|typedef|union|proxy|function|";

var KW_STD = "bool|char|double|float|int|long|short|unsigned|void|";

/*
 *  ======== gen ========
 */
function gen( inDir, node, pkgDir )
{
    var name = '' + node.@name;
    var pflag = (('' + node.@kind) == 'package');

    var srcName = '';
    if (pflag) {
        srcName += 'package';
    }
    else {
        srcName += name.replace(/\./g,'/');
    }

    /* get name of input file */
    var inFile = inDir + '/' + srcName + '.xdc';

    if (!java.io.File(inFile).exists()) {
        print(inFile + ' not found');
        return;
    }

    var title = node.@kind + ' ' + Gbl.pkgNode().@name;
    if (!pflag) {
        title += '.' + name;
    }

    /* generate text */
    Txt.clear();
    _genText(inFile, name, Gbl.root(), title);

    /* create output file name */
    var outFile = pkgDir + '/' + srcName + '-src.html';

    /* save in output file */
    var out = new Out.Stream(outFile);
    out.print(Txt.get());
    out.close();
}

/*
 *  ======== _expand ========
 */
function _expand( s )
{
    var res = "";
    var mat;

    while (mat = s.match(/(\t+)(.*)/)) {
        res += s.slice(0, mat.index);
        var cnt = (mat[1].length * 8) - (mat.index % 8);
        for (var i = 0; i < cnt; i++) {
            res += ' ';
        }
        s = mat[2];
    }

    return res + s;
}

/*
 *  ======== _genText ========
 */
function _genText( xfn, qn, root, title )
{
    var inp = new java.io.BufferedReader(new java.io.FileReader(xfn));
    var cnt = 1;
    var cflg = false;   // in a comment
    var dflg = false;   // in a doc comment
    var strend = null;
    var line;
    var hat = qn.replace(/\./g, '/').replace(/[^\/]+/g, '..');

    var kwtab = (KW_XDC + KW_STD).split('|');

    Txt.PL(Gbl.DOCTYPE);
    Txt.PL('<html><head><title>' + title + '</title>');
    Txt.PL('<meta name="googlebot" content="noindex,nofollow">');
    Txt.PL('<link rel="stylesheet" type="text/css" href="' + root + 'src.css"/>');
    Txt.PL('</head>');
    Txt.PL('<body>');

    Txt.TAG('pre', 'src');

    while (line = inp.readLine()) {

        line = _expand(String(line));
        line = line.replace(/\&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

        if (cflg) {
            Txt.PF('</span>');
        }

        var marg = '     ';
        marg += cnt++;
        Txt.PF(marg.substr(-6) + '    ');

        if (cflg) {
            Txt.PF('<span class="' + (dflg ? 'xdoc' : 'comment') + '">');
        }

        var res = "";

        while (mat = line.match(/(@\w+\([ \t\w]+\)|@\w+|\w+|\/\/\!|\/\/|\/\*\!|\/\*|\*\/|\"|\')(.*)/)) {

            res += line.slice(0, mat.index);

            if (cflg && mat[1] == '*/') {
                cflg = false;
                dflg = false;
                res += mat[1] + '</span>';
            }

            else if (dflg && mat[1][0] == '@') {
                res += mat[1].bold();
            }

            else if (cflg && mat[1] != '*/') {
                res += mat[1];
            }

            else if (mat[1] == '/*') {
                cflg = true;
                res += '<span class="comment">' + mat[1];
            }

            else if (mat[1] == '/*!') {
                cflg = dflg = true;
                res += '<span class="xdoc">' + mat[1];
            }

            else if (mat[1] == '//!') {
                res += ('//!' + mat[2]).replace(/(@\w+\(\w+\)|@\w+)/g, '<b>$1</b>').span('xdoc');
                line = "";
                break;
            }

            else if (mat[1] == '//') {
                res += ('//' + mat[2]).span('comment');
                line = "";
                break;
            }

            else if (strend == null && (mat[1] == '"' || mat[1] == "'")) {
                strend = mat[1];
                res += '<span class="string">' + mat[1];
            }

            else if (strend != null && strend == mat[1]) {
                strend = null;
                res += mat[1] + '</span>';
            }

            else if (strend != null && strend != mat[1]) {
                res += mat[1];
            }

            else {
                var id = mat[1];
                for (var i = 0; i < kwtab.length; i++) {
                    if (id == kwtab[i]) {
                        id = id.span('key');
                        break;
                    }
                }
                res += id;
            }

            line = mat[2];
        }

        res += line;
        Txt.PL(res);
    }

    Txt.TAG();
    Txt.PF('</body></html>\n');
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


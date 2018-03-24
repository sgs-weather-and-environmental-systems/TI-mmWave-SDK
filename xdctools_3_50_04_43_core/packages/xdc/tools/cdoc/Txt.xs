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
var buf = '';
var tagStk = [];

var SP4 = '&nbsp;&nbsp;&nbsp;';

/*
 *  ======== String.link ========
 */
xdc.global.String.prototype.link = function( r )
{
    return ('<a href="' + (r ? r : 'javascript:void') + '">' + this + '</a>');
};

/*
 *  ======== String.span ========
 */
xdc.global.String.prototype.span = function( c )
{
    return ('<span class=' + c + '>' + this + '</span>');
};

/*
 *  ======== clear ========
 */
function clear()
{
    buf = '';
}

/*
 *  ======== get ========
 */
function get()
{
    return buf;
}

/*
 *  ======== BL ========
 */
function BL()
{
    TAG('tr', 'spacer'); TAG('td'); PF('&nbsp;'); TAG(); TAG();
}

/*
 *  ======== PF ========
 */
function PF( fmt )
{
    fmt = fmt.replace(/%t/g, SP4 + SP4);
    fmt = fmt.replace(/%1/g, arguments[1]);
    fmt = fmt.replace(/%2/g, arguments[2]);
    fmt = fmt.replace(/%3/g, arguments[3]);
    fmt = fmt.replace(/%4/g, arguments[4]);

    this.buf += fmt;
}

/*
 *  ======== PL ========
 */
function PL()
{
    if (arguments.length > 0) {
        PF.apply(this, arguments);
    }
    buf += '\n';
}

/*
 *  ======== TAG ========
 */
function TAG( t, c, x )
{
    if (t) {
        tagStk.push(t);
        buf += '<' + t;
        if (c) {
            buf += ' class=' + c;
        }
        if (x) {
            buf += ' ' + x;
        }
        buf += '>\n';
    }
    else {
        t = tagStk.pop();
        buf += '</' + t + '>\n';
    }
}

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


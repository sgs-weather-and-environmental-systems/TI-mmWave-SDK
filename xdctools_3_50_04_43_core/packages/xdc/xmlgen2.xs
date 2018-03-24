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
function xml()
{
    var r = new java.lang.StringBuilder();

    r.append('<' + this.$type + '>');
    xmlS(r, this);
    r.append('</' + this.$type + '>');

    return String(r);
}

function xmlE( r, f, e, k )
{
    if (e && typeof e == 'object' && '$category' in e) {
        switch (e.$category) {
        case 'Struct':
            r.append('<' + f + key(k) + '>');
            xmlS(r, e);
            r.append('</' + f + '>');
            break;
        case 'Vector':
            r.append('<' + f + '-length>' + e.length + '</' + f + '-length>');
            xmlV(r, f, e);
            break;
        case 'Map':
            r.append('<' + f + '-length>' + e.length + '</' + f + '-length>');
            xmlM(r, f, e);
            break;
        case 'Addr':
        case 'EnumVal':
            r.append('<' + f + key(k) + '>' + e.$name + '</' + f + '>');
            break;
        }
    }
    else {
        r.append('<' + f + key(k) + '>' + e + '</' + f + '>');
    }
}

function xmlS( r, s )
{
    for (var f in s ) {
        xmlE(r, f, s[f]);
    }
}

function xmlV( r, f, v )
{
    for (var i = 0; i < v.length; i++) {
        xmlE(r, f, v[i]);
    }
}

function xmlM( r, f, m )
{
    var keys = m.$keys;

    for (var i = 0; i < keys.length; i++) {
        var k = keys[i];
        xmlE(r, f, m[k], k);
    }
}

function key( k )
{
    return k ? (' key="' + k + '"') : '';
}

/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:08; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


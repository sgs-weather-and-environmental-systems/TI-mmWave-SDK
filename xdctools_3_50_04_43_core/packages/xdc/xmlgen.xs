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
    var r = new XML('<' + this.$type + '/>');
    xmlS(r, this);

    return r;
}

/**
 * Copy an XDC Script or JavaScript object into an XML object.
 *
 * @param r the XML object to set the field in.
 * @param f the tag name of the child node in the XML object.
 * @param e the source object, of type Struct, Vector, Map, Addr,
 *          EnumVal, or untyped JavaScript object or scalar.
 * @param i an optional numeric index for the case when the tag
 *          should occur multiple times in the XML object.
 */
function xmlE( r, f, e, i )
{
    if (e && typeof e == 'object' && '$category' in e) {
        switch (e.$category) {
        case 'Struct':
            var r2 = new XML('<' + f + '/>');
            xmlS(r2, e);
            if (i === undefined) {
                r[f] = r2;
            }
            else {
                /* The commented statement does not work because of Rhino bugs
                 * 394215 and 524931. Once they are fixed, we can go back to
                 * the commented statement, but the current alternative of using
                 * 'appendChild' is a fully-supported API for adding members of
                 * XML lists.
                 */
                r.appendChild(r2);
                //r[f][i] = r2;
            }
            break;
        case 'Vector':
            r[f + '-length'] = e.length;
            xmlV(r, f, e);
            break;
        case 'Map':
            r[f + '-length'] = e.length;
            xmlM(r, f, e);
            break;
        case 'Addr':
        case 'EnumVal':
            var x = new XML('<' + f + '>' + e.$name + '</' + f + '>');
            if (i === undefined) {
                r[f] = x;
            }
            else {
                //r[f][i] = x;
                r.appendChild(x);
            }
            break;
        }
    }
    else {
        var x = new XML('<' + f + '>' + e + '</' + f + '>');
        if (i === undefined) {
            r[f] = x;
        }
        else {
            r.appendChild(x);
            //r[f][i] = x;
        }
    }
}

/**
 * Copy the fields of an XDC Script Struct or JavaScript object into an
 * XML object.
 *
 * @param r the XML object to copy the fields into.
 * @param s the Struct or object to copy the fields from.
 */
function xmlS( r, s )
{
    for (var f in s ) {
        xmlE(r, f, s[f]);
    }
}

/**
 * Copy the a JavaScript array or XDC Script Vector into an XML
 * object.
 *
 * The array is copied as an XML "vector", i.e. multiple child
 * nodes having the same tag name.
 *
 * @param r the XML object to store the array into.
 * @param f the XML tag name to give the array entries.
 * @param v the JavaScript array or XDC Script Vector
 */
function xmlV( r, f, v )
{
    for (var i = 0; i < v.length; i++) {
        xmlE(r, f, v[i], i);
    }
}

/**
 * Copy an XDC Script Map into an XML object.
 *
 * The Map is copied as an XML "vector", i.e. multiple child
 * nodes having the same tag name.
 *
 * @param r the XML object to store the Map into.
 * @param f the XML tag name to give the Map entries.
 * @param m the Map.
 */
function xmlM( r, f, m )
{
    var keys = m.$keys;

    for (var i = 0; i < keys.length; i++) {
        var k = keys[i];
        xmlE(r, f, m[k], i);
        r[f][i].@key = k;
    }
}



/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:08; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


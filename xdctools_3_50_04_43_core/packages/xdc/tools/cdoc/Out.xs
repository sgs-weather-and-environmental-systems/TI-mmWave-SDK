/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== Stream ========
 */
function Stream( fname )
{
    var file = new java.io.File(fname);
    if (file.exists()) {
        file['delete']();
    }

    this.outstr = new Packages.xdc.services.global.Out(new java.io.FileOutputStream(file));
}

/*
 *  ======== Stream.close ========
 */
Stream.prototype.close = function()
{
    this.outstr.close();
};

/*
 *  ======== Stream.print ========
 */
Stream.prototype.print = function( o )
{
    this.outstr.print(o);
};

/*
 *  ======== Stream.printf ========
 */
Stream.prototype.printf = function( fmt, o0, o1, o2, o3 )
{
    this.outstr.doPrint(fmt, o0, o1, o2, o3);
};

/*
 *  ======== Stream.println ========
 */
Stream.prototype.println = function( s )
{
    /* The class Out treats '%' as a scpecial character so we have to escape it
     * to print it properly.
     */
    s = s.replace(/%/g, "%%");
    this.outstr.printfln(s);
};

/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== LoggerBuf.xs ========
 */

var Logger;

/*
 *  ======== module$use ========
 */
function module$use()
{
    var Timestamp = xdc.module('xdc.runtime.Timestamp');

    Logger = this;
    
    /* bind LoggerSys.TimestampProxy to whatever Timestamp is using,
     * unless LoggerSys.TimestampProxy was set already.
     */
    if (Logger.TimestampProxy == null) {
        Logger.TimestampProxy = Timestamp.SupportProxy.delegate$;
    }

    /* disable trace on timestamp proxy to prevent recursive callbacks */
    var Diags = xdc.module("xdc.runtime.Diags");
    var modName = Logger.TimestampProxy.delegate$.$name;
    Diags.setMaskMeta(modName, Diags.ALL_LOGGING, Diags.ALWAYS_OFF);
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    obj.enabled = true;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


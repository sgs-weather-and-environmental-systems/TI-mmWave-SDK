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
 *  ======== GateThread.xs ========
 */

var GateThread = null;

/*
 *  ======== module$use ========
 */
function module$use()
{
    GateThread = this;

    if (GateThread.Proxy == undefined || GateThread.Proxy == null) {
        GateThread.$logFatal("GateThread.Proxy is not bound to " +
        "OS specific implementation", this);
    }

    /* push diags and logger settings to delegate */
    for (var dl in GateThread.common$) {
        if (dl.match(/^diags_/) || dl.match(/^logger/)) {
            GateThread.Proxy.delegate$.common$[dl] = GateThread.common$[dl];
        }
    }

    /* 
     * force abstractInstances$  to false for proxy because delegate's
     * fxntab is set to false in package.xs
     */
     GateThread.Proxy.abstractInstances$ = false;
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    if (GateThread.Proxy.abstractInstances$ == true) {
        GateThread.$logFatal("GateThread.Proxy.abstractInstances$ " +
        "cannot be set to true", this);
    }
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    obj.proxyHandle = GateThread.Proxy.create();
}

/*
 *  ======== queryMeta ========
 */
function queryMeta(qual)
{
    return this.Proxy.queryMeta(qual);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


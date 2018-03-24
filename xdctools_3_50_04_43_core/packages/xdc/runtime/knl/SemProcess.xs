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
 *  ======== SemProcess.xs ========
 */

var SemProcess = null;

/*
 *  ======== module$use ========
 */
function module$use()
{
    SemProcess = this;

    if (SemProcess.Proxy == undefined || SemProcess.Proxy == null) {
        SemProcess.$logFatal("SemProcess.Proxy is not bound to " +
        "OS specific implementation", this);
    }

    /* push diags and logger settings to delegate */
    for (var dl in SemProcess.common$) {
        if (dl.match(/^diags_/) || dl.match(/^logger/)) {
            SemProcess.Proxy.delegate$.common$[dl] = SemProcess.common$[dl];
        }
    }

    /* 
     * force abstractInstances$  to false for proxy because delegate's
     * fxntab is set to false in package.xs
     */
    SemProcess.Proxy.abstractInstances$ = false;
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    if (SemProcess.Proxy.abstractInstances$ == true) {
        SemProcess.$logFatal("SemProcess.Proxy.abstractInstances$ " +
        "cannot be set to true", this);
    }
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, count, key, params)
{
    var proxyParams = new SemProcess.Proxy.Params();
    proxyParams.mode = params.mode;
    obj.proxyHandle = SemProcess.Proxy.create(count, key, proxyParams);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


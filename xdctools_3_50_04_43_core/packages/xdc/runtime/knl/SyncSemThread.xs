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
 *  ======== SyncSemThread.xs ========
 */

var SemThread = null;

/*
 *  ======== module$use ========
 *  Use other modules required by this module
 */
function module$use()
{
    SemThread = xdc.useModule('xdc.runtime.knl.SemThread');
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    var semParams = new SemThread.Params();
    semParams.mode = SemThread.Mode_BINARY;

    obj.semThread = SemThread.create(0, semParams);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


/* 
 *  Copyright (c) 2012 Texas Instruments. All rights reserved.
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
 *  ======== LoggerCallback.xs ========
 */
/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, prms)
{
    obj.enabled = true;
    obj.context = 0;
    obj.arg = prms.arg;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule("xdc.runtime.Startup");
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


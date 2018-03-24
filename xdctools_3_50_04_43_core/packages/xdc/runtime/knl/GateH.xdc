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
 *  ======== GateH.xdc ========
 */

import xdc.runtime.IGateProvider;

/*!
 *  ======== GateH ========
 *  Provides APIs to protect critical sections when an IGate.Handle is
 *  available.
 *
 *  An application can isolate itself from IGate implementations by using
 *  this module. The application must first obtain an IGate.Handle.
 *  It can get such a handle by directly calling {@link GateThread#create} or
 *  {@link GateProcess#create}. Then the application can use the generic
 *  APIs provided by this module.
 *
 *  The underlying gates are nesting in nature and users have to leave
 *  the gate as many times as they entered it.
 */
@DirectCall

module GateH
{
    /*!
     *  Proxy used for optimization.
     *
     *  The GateH.Proxy config param may be used to optimize this module. If all
     *  the instances supplied to GateH functions are created using the same
     *  module (e.g. GateMutex), then setting this Proxy to that module and
     *  disabling abstract instances will allow for better run-time
     *  optimization.
     *
     *  Caution: all instances used by GateH in a given executable must be
     *  created by the same module in order to use this optimization technique.
     *
     * Configuration Script
     *
     * @p(code)
     * var GateH = xdc.useModule('xdc.runtime.knl.GateH');
     * GateH.Proxy = xdc.useModule('ti.sysbios.gates.GateMutex');
     * GateH.Proxy.abstractInstances$ = false;
     * @p
     *
     * Target Code
     *
     * @p(code)
     * #include <xdc/runtime/IGateProvider.h>
     * #include <xdc/runtime/knl/GateH.h>
     * #include <ti/sysbios/gates/GateMutex.h>
     *
     * GateMutex_Handle gate;
     * IGateProvider_Handle igate;
     * IArg key;
     *
     * gate = GateMutex_create(NULL, NULL);
     * igate = GateMutex_Handle_upCast(gate);
     *
     * key = GateH_enter(igate);
     * ...
     * GateH_leave(igate, key);
     * @p
     */
    proxy Proxy inherits IGateProvider;

    /*!
     * ======== enter ========
     * Enter a gate
     *
     * @param(hdl)    IGateProvider.Handle
     * @a(returns)    key
     */
    IArg enter(IGateProvider.Handle hdl);

    /*!
     * ======== leave ========
     * Leave a gate
     *
     * @param(hdl)    IGateProvider.Handle
     * @param(key)    key returned by enter();
     */
    Void leave(IGateProvider.Handle hdl, IArg key);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


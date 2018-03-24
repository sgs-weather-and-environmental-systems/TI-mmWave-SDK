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
 *  ======== GateProcess.xdc ========
 */

import xdc.runtime.Assert;
import xdc.runtime.Error;
import xdc.runtime.IGateProvider;
import xdc.runtime.knl.IGateProcessSupport;

/*!
 *  ======== GateProcess ========
 *  Provides protection of critical sections across processes.
 *
 *  This module provides services through its proxy
 *  IGateProcessSupport interface. It has a module wide config parameter
 *  {@link #Proxy} which needs to be bound to an OS specific delegate before
 *  this module can be used.
 *
 *  Here is an example showing how the proxy is bound to an BIOS 6.x specific
 *  delegate.
 *
 *  @p(code)
 *  var GateProcess = xdc.useModule('xdc.runtime.knl.GateProcess');
 *  GateProcess.Proxy =
 *      xdc.useModule('ti.sysbios.xdcruntime.GateProcessSupport');
 *  @p
 *
 *  Typically the package containing the delegates have a Settings module that 
 *  will bind all {@link xdc.runtime.knl} proxies. The following
 *  example sets up all the xdc.runtime.knl proxies.
 *
 *  @p(code)
 *  xdc.useModule("ti.sysbios.xdcruntime.Settings");
 *  @p
 */
@InstanceInitError      /* because initialization can fail */
@InstanceFinalize       /* have to GateProcess_Proxy_delete(gate) on delete */

module GateProcess inherits IGateProvider
{
    /*! Status returned by {@link #getReferenceCount} when there is an error */
    const Int GETREFCOUNT_FAILED = -1;

    /*! Proxy that needs to be bound to an OS specific delegate. */
    proxy Proxy inherits IGateProcessSupport;

    /*! Assert when  an invalid key is passed to create */
    config Assert.Id A_invalidKey = {
        msg: "A_invalidKey: the key must be set to a non-default value"
    };

instance:

    /*! 
     *  globally unique key for SysV-style semaphore 
     *
     *  This is a required parameter.
     */
    config Int key = -1;

   /*!
    *  ======== create ========
    *  Create a GateProcess object.
    *
    *  This function creates a new `GateProcess` object which is initialized to
    *  count.  All gates created with the same key reference the same
    *  underlying synchronization object and work between processes.  For
    *  compatibility with the IGateProvider interface the argument key is
    *  passes in the params struct rather than as a full argument, but it is
    *  required.  Therefore calling this function with a `NULL` params struct
    *  is illegal.
    */
    override create();

    /*!
     *  ======== getReferenceCount ========
     *  Get the number of processes with references to this Gate.
     *
     *  @param(eb)        Pointer to Error.Block
     *  @a(returns)       Returns the number of processes that possess a 
     *                    reference to this gate, or GETREFCOUNT_FAILED if an 
     *            error occured.
     */
    Int getReferenceCount(Error.Block *eb);
    
internal:

    struct Instance_State {
        Proxy.Handle proxyHandle;
    }
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


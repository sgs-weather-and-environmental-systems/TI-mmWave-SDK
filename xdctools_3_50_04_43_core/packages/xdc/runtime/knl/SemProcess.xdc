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
 *  ======== SemProcess.xdc ========
 */

import xdc.runtime.Error;
import xdc.runtime.knl.ISemaphore;
import xdc.runtime.knl.ISemProcessSupport;

/*!
 *  ======== SemProcess ========
 *  SemProcess Manager
 *
 *  This module manages multi-process semaphores through its proxy
 *  ISemProcessSupport interface. It has a module wide config parameter
 *  {@link #Proxy} which needs to be bound to an OS specific delegate before
 *  this module can be used.
 *
 *  Here is an example showing how the proxy is bound to an BIOS 6.x specific
 *  delegate.
 *
 *  @p(code)
 *  var SemProcess = xdc.useModule('xdc.runtime.knl.SemProcess');
 *  SemProcess.Proxy = xdc.useModule('ti.sysbios.xdcruntime.SemProcessSupport');
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
@InstanceFinalize       /* have to Semaphore_Proxy_delete(sem) on delete */

module SemProcess inherits ISemaphore
{

    /*! Proxy that needs to be bound to an OS specific delegate. */
    proxy Proxy inherits ISemProcessSupport;

instance:

   /*!
    *  ======== create ========
    *  Create a SemProcess object
    *
    *  This function creates a new `SemProcess` object which is initialized to
    *  count.  All semaphores created with the same key reference the same
    *  underlying synchronization object and work between processes.
    *
    *  @param(count)    initial semaphore count
    *  @param(key)      globally unique key for SysV-style semaphore
    */
    create(Int count, UInt32 key);

internal:

    struct Instance_State {
        Proxy.Handle proxyHandle;
    }
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


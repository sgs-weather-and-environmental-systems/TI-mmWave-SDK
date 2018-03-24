/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== Semaphore.xdc ========
 */

import xdc.runtime.Assert;
import xdc.runtime.Error;
import xdc.runtime.knl.ISemaphore;

/*!
 *  ======== Semaphore ========
 *  Provides semaphore services when an ISemaphore.Handle is available.
 *
 *  An application can isolate itself from ISemaphore implementations by using
 *  this module. The application must first obtain an ISemaphore.Handle.
 *  It make get such a handle by directly calling {@link SemThread#create} or
 *  {@link SemProcess#create}. Then the application can use the generic
 *  APIs provided by this module.
 */
@DirectCall

module Semaphore
{
    /*!
     *  ======== PendStatus ========
     *  Error codes returned by Semaphore_pend
     */
    enum PendStatus {
        PendStatus_ERROR = -1,
        PendStatus_TIMEOUT = 0,
        PendStatus_SUCCESS = 1
    };

    /*! Used as the timeout value to specify wait forever */
    const UInt FOREVER = ISemaphore.FOREVER;

    /*!
     *  Proxy used for optimization.
     *
     *  If ALL ISemaphore.Handles were created using the same module
     *  (e.g SemProcess) then setting this Proxy to SemProcess and
     *  setting Semaphore.Proxy.abstractInstances$ = false,
     *  Semaphore APIs can have better performance.
     */
    @NoProxyCreate
    proxy Proxy inherits ISemaphore;

    /*!
     *  ======== pend ========
     *  Wait for the semaphore to have a nonzero count, then decrement it.
     *
     *  The function returns one of the following:
     *  @p(blist)
     *  -{@link #PendStatus_ERROR} if an error occured.
     *  -{@link #PendStatus_TIMEOUT} denotes timeout.
     *  -{@link #PendStatus_SUCCESS} semaphore was decremented.
     *
     *  @p
     *
     *  @param(sem)     ISemaphore.Handle to be used
     *  @param(timeout) timeout in microseconds or
     *  {@link #FOREVER Semaphore_FOREVER} to wait forever
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     status returned. (refer to above description)
     */
    Int pend(ISemaphore.Handle sem, UInt timeout, Error.Block *eb);

    /*!
     *  ======== post ========
     *  Increment the semaphore count.
     *
     *  @param(sem)     ISemaphore.Handle to be used
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success, false for error in Error block.
     */
    Bool post(ISemaphore.Handle sem, Error.Block *eb);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


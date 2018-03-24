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
 *  ======== Sync.xdc ========
 */
import xdc.runtime.Error;
import xdc.runtime.Assert;
import xdc.runtime.knl.ISync;

/*!
 *  ======== Sync ========
 *  Provides synchronization APIs when an ISync.Handle is available
 *
 *  The application must first obtain an ISync.Handle. It can get such a handle
 *  by directly calling {@link SyncGeneric#create} or
 *  {@link SyncSemThread#create}. Then the application can use the generic APIs
 *  provided by this module.
 */
@DirectCall

module Sync
{
    /*!
     *  ======== WaitStatus ========
     *  Error codes returned by Sync_wait
     */
    enum WaitStatus {
        WaitStatus_ERROR = -1,
        WaitStatus_TIMEOUT = 0,
        WaitStatus_SUCCESS = 1
    };

    /*!
     *  ======== WAIT_FOREVER ========
     *  Used to wait forever
     */
    const UInt WAIT_FOREVER = ISync.WAIT_FOREVER;

    /*!
     *  ======== NO_WAIT ========
     *  Used to specify no waiting
     */
    const UInt NO_WAIT = ISync.NO_WAIT;

    /*!
     *  ======== Proxy ========
     *  Platform-specific implementation
     *
     *  If ALL `ISync.Handles` were created using the same module
     *  (e.g SyncSemProcess), then setting `Proxy` to `SyncSemProcess` and
     *  `Sync.Proxy.abstractInstances$` to `false` will improve the
     *  performance of the `Sync` APIs.
     */
    proxy Proxy inherits ISync;

    /*!
     *  ======== query ========
     *  Query for a particular quality
     *
     *  FALSE is returned if quality not supported.
     *
     *  @param(sync)    sync handle
     *  @param(qual)    quality
     *
     *  @a(returns)     TRUE or FALSE
     */
    Bool query(ISync.Handle sync, Int qual);

    /*!
     *  ======== signal ========
     *  Called at completion of an activity.
     *
     *  This function is non-blocking. It is also required that the underlying
     *  sync be binary in nature.
     *
     *  @param(sync)    sync handle
     */
    Void signal(ISync.Handle sync);

    /*!
     *  ======== wait ========
     *  Called to wait/poll for completion of an activity.
     *
     *  This function can block and typically waits for a semaphore to become
     *  available.
     *
     *  Non-blocking implementations should return {@link #WaitStatus_TIMEOUT}.
     *
     *  @param(sync)        sync handle
     *  @param(timeout)     timeout in microseconds
     *
     *  @a(returns)
     *  @p(blist)
     *  -{@link #WaitStatus_ERROR} if an error occured.
     *  -{@link #WaitStatus_TIMEOUT} denotes timeout.
     *  -{@link #WaitStatus_SUCCESS} semaphore was decremented.
     *  @p
     */
    Int wait(ISync.Handle sync, UInt timeout, Error.Block *eb);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


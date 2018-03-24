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
 *  ======== ISync.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== ISync ========
 *  OS independent synchronization
 *
 *  This interface allows clients to select method of synchronization in an OS
 *  independent way.
 *
 *  Modules that require the user to pick a synchronization method, will
 *  request a `{@link #Handle}`. Clients of such modules can pick a blocking
 *  `ISync` implementation  or a non-blocking implementation.
 *
 *  This interface specifies two main functions `{@link #signal}` and
 *  `{@link #wait}`. These two functions are always used in pairs in modules 
 *  that use `ISync` instances. The `signal()` function is used to signal
 *  completion of an activity. The `wait()` function will allow the module to
 *  block or poll for completion of the same activity.
 *
 *  `ISync` mandates that the sync mechanism be binary and not support counters.
 *  Although the `wait()` function seems meaningless in the case of
 *  non-blocking sync, it allows modules to be written generically and support
 *  all `ISync` implementations. For non-blocking `ISync` the `wait()` function
 *  will return `WaitStatus_TIMEOUT` to denote timeout.
 */
@DirectCall

interface ISync
{
    /*!
     *  ======== WaitStatus ========
     *  Error codes returned by ISync_wait
     */
    enum WaitStatus {
        WaitStatus_ERROR = -1,
        WaitStatus_TIMEOUT = 0,
        WaitStatus_SUCCESS = 1
    };

    /*!
     *  ======== Q_BLOCKING ========
     *  Blocking quality
     *
     *  Implementations with this "quality" may cause the calling thread to 
     *  block; 
     */
    const Int Q_BLOCKING = 1;
    
    /*! Used to wait forever */
    const UInt WAIT_FOREVER = ~(0);

    /*! Used to specify no waiting */
    const UInt NO_WAIT = 0;

instance: 
    /*! 
     *  ======== create ========
     *  Create an ISync instance.
     */
    create();

    /*!
     *  ======== query ========
     *  Query for a particular quality.
     *
     *  FALSE is returned if quality not supported.
     *
     *  @param(qual)    quality
     *  @b(returns)     TRUE or FALSE.
     */
    Bool query(Int qual);

    /*!
     *  ======== signal ========
     *  Called at completion of an activity.
     *
     *  This function is non-blocking. It is also required that the underlying
     *  sync be binary in nature.
     *
     *  This function does not take an Error.Block intentionally because
     *  it can be called from ISR context.
     */
    Void signal();

    /*!
     *  ======== wait ========
     *  Called to wait/poll for completion of an activity.
     *
     *  This function can block. Non-blocking implementations should return
     *  WaitStatus_TIMEOUT to indicate a timeout.
     *
     *  @p(blist)
     *  -{@link #WaitStatus_ERROR} if an error occured.
     *  -{@link #WaitStatus_TIMEOUT} denotes timeout.
     *  -{@link #WaitStatus_SUCCESS} semaphore was decremented. 
     *  @p
     *
     *  @param(timeout)     Timeout in microseconds
     *  @param(eb)Hist      Pointer to Error.Block
     *  @b(returns)         Refer to description above
     */
    Int wait(UInt timeout, Error.Block *eb);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


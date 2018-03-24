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
 *  ======== ISemaphore.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== ISemaphore ========
 *  Interface implemented by all front-end semaphore providers.
 *
 *  {@link #SemThread} and {@link #SemProcess}. [EXPERIMENTAL]
 *  Semaphores can be used for synchronization and mutual exclusion.
 *
 *  pend() is used to wait for a semaphore. The timeout parameter allows the 
 *  caller to wait until a timeout, wait indefinitely, or not wait at all.
 *  The return value indicates whether or not the wait was successful.
 *
 *  post() is used to signal a semaphore. If no thread is waiting on the
 *  semaphore, then post() increments the semaphore count (for binary
 *  semaphores, the count is always 0 or 1).
 *
 */
@DirectCall
interface ISemaphore {

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
    const UInt FOREVER = ~(0);
    
    /*! Types of semaphores. */
    enum Mode {
        Mode_COUNTING,  /*! Counting semaphore. */
        Mode_BINARY     /*! Binary Semaphore. */
    };
    
instance:

    /*! 
     *  ======== mode ========
     *  Semaphore mode. Default is COUNTING.
     *
     *  When mode is BINARY , the semaphore has only two states, available
     *  and unavailable. When mode is COUNTING, the semaphore keeps track of
     *  number of times a semaphore is posted.
     */
    config Mode mode = Mode_COUNTING;
    
    /*!
     *  ======== pend ========
     *  Wait for the semaphore to become available.
     *
     *  @p(blist)
     *  -{@link #PendStatus_ERROR} if an error occured.
     *  -{@link #PendStatus_TIMEOUT} denotes timeout.
     *  -{@link #PendStatus_SUCCESS} semaphore was decremented. 
     *    details.
     *  @p
     *
     *  @param(timeout) timeout in microseconds
     *  @param(eb)      error block 
     *  @a(returns)     refer to description above
     */
    Int pend(UInt timeout, Error.Block *eb);

    /*!
     *  ======== post ========
     *  Increment the semaphore count.
     *
     *  @param(eb)      error block 
     *  @a(returns)     true for success, false for error in error block
     */
    Bool post(Error.Block *eb);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


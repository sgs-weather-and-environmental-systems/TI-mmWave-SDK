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
 *  ======== IThreadSupport.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== IThreadSupport ========
 *  Interface for OS specific back-end.
 *
 *  The {@link xdc.runtime.knl} package contains modules that provide typical
 *  OS services. These xdc.runtime.knl modules require proxies to be bound to an
 *  OS specific delegate. This specifies the interface to be implemented by the
 *  OS specific delegate for {@link xdc.runtime.knl.Thread} module.
 *
 *  Refer to {@link xdc.runtime.knl.Thread} for more details on the APIs.
 */
@DirectCall
interface IThreadSupport
{
    /*! Thread priorities which are mapped to OS specific value by Proxy */
    enum Priority {
    Priority_INVALID,
        Priority_LOWEST,
        Priority_BELOW_NORMAL,
        Priority_NORMAL,
        Priority_ABOVE_NORMAL,
        Priority_HIGHEST
    };

    /*! Invalid OS priority value */
    const Int INVALID_OS_PRIORITY = 0;

    /*! 
     *  The error status for {@link #getPriority} when an error is captured in 
     *  the  Error.Block.
     */
    const Int GETPRI_FAILED = -2;

    /*! Status returned by {@link #compareOsPriorities} when an error occurs */
    enum CompStatus {
        CompStatus_ERROR = -2,
    CompStatus_LOWER = -1,
    CompStatus_EQUAL = 0,
    CompStatus_HIGHER = 1
    };

    /*! typedef for function that gets called when the Thread runs. */
    typedef Void (*RunFxn)(IArg);

    /*! Struct to hold thread statistics from {@link #stat} */
    struct Stat {
        SizeT stackSize;
        SizeT stackUsed;
    }

    /*!
     *  ======== self ========
     *  Acquire the currently executing thread's handle.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#self} for more details.
     *
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    Handle in case of success; null for error;
     */
    Handle self(Error.Block* eb);

    /*!
     *  ======== start ========
     *  Start threads running.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#start} for more details.
     *
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    true for success; false for failure
     */
    Bool start(Error.Block* eb);

    /*!
     *  ======== yield ========
     *  Yield the currently scheduled thread.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#yield} for more details.
     *
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    true for success; false for failure
     */
    Bool yield(Error.Block* eb);

    /*!
     *  ======== compareOsPriorities ========
     *  Compare two priority values and find out which one represents a
     *  higher priority.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#compareOsPriorities} for more 
     *  details.
     *
     *  @p(blist)
     *  -{@link #CompStatus_ERROR} if an error occured
     *  -{@link #CompStatus_LOWER} if p1 is lower than p2
     *  -{@link #CompStatus_EQUAL} if p1=p2
     *  -{@link #CompStatus_HIGHER} if p1 is higher than p2
     *    details.
     *  @p
     *
     *  @param(p1)      priority one
     *  @param(p2)      priority two
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     Refer to description above
     */
    Int compareOsPriorities(Int p1, Int p2, Error.Block *eb);
    
    /*!
     *  ======== sleep ========
     *  Sleep for certain number of microseconds
     *
     *  Refer to {@link xdc.runtime.knl.Thread#sleep} for more details.
     *
     *  @param(timeout)     timeout in microseconds
     *  @param(eb)          Pointer to Error.Block
     *  @a(returns)         true for success; false for failure
     */
    Bool sleep(UInt timeout, Error.Block *eb);

instance:

    /*! Thread function argument. Default is NULL. */
    config IArg arg = null;

    /*!
     *  ======== priority ========
     *  Thread priority
     *
     *  Thread defines several constants which allows applications to select
     *  a priority in an OS independent way. Priority_LOWEST, 
     *  Priority_BELOW_NORMAL, Priority_NORMAL, Priority_ABOVE_NORMAL and 
     *  Priority_HIGHEST. These values get mapped to OS specific priorities 
     *  by the OS specific delegate.
     */
    config Priority priority = Priority_NORMAL;

    /*!
     *  ======== osPriority ========
     *  OS specific thread priority
     *
     *  Used to specify an OS specific value for priority. If set this value
     *  takes precedence over {@link #priority}.
     */
    config Int osPriority = INVALID_OS_PRIORITY;

    /*! Thread stack size. If left at zero, OS default is used */
    config SizeT stackSize = 0;

    /*! User-specified thread local storage data. */
    config Ptr tls = null;

    /*!
     *  ======== create ========
     *  Create a Thread object.
     *
     *  This function spawns a new thread calling the function fxn.
     *
     *  @param(fxn) function for new thread to begin execution
     */
    create(RunFxn fxn);

    /*!
     *  ======== join ========
     *  Join on a Thread.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#join} for more details.
     *
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    true for success; false for failure
     */
    Bool join(Error.Block* eb);

    /*!
     *  ======== getPriority ========
     *  Obtain a thread's priority.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#getPriority} for more details.
     *
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    thread priority in case of success; Priority_INVALID in
     *                 case of error; 
     */
    Priority getPriority(Error.Block* eb);

    /*!
     *  ======== setPriority ========
     *  Set a thread's priority.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#setPriority} for more details.
     *
     *  @param(newPri)    new thread priority
     *  @param(eb)        Pointer to Error.Block
     *  @a(returns)       true for success; false for failure
     */
    Bool setPriority(Priority newPri, Error.Block* eb);

    /*!
     *  ======== getOsPriority ========
     *  Obtain a thread's os specific priority.
     *
     *  For OSes that support dynamic priority boosting, the value returned 
     *  is the base priority of the thread.
     *
     *  Refer to {@link xdc.runtime.knl.Thread#getOsPriority} for more details.
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     thread priority in case of success; GETPRI_FAILED in
     *                  case of error;
     */
    Int getOsPriority(Error.Block *eb);

    /*!
     *  ======== setOsPriority ========
     *  Set a thread's priority.
     *
     *  This API sets the base priority of the thread on OSes that
     *  support dynamic priority boosting
     *
     *  Refer to {@link xdc.runtime.knl.Thread#setOsPriority} for more details.
     *
     *  @param(newPri)  new thread priority
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for failure
     */
    Bool setOsPriority(Int newPri, Error.Block *eb);

    /*!
     *  ======== getOsHandle ========
     *  Get the OS thread handle
     *
     *   @a(returns)     null in case of error
     */
    Ptr getOsHandle();

    /*!
     *  ======== getTls ========
     *  Obtain a thread's local storage pointer
     *
     *  @a(returns)     null in case of error
     */ 
    Ptr getTls();

    /*!
     *  ======== setTls ========
     *  Set a thread's local storage pointer.
     *
     *  @param(tls)     thread tls 
     */
    Void setTls(Ptr tls);


    /*!
     *  ======== stat ========
     *  Obtain a thread's stats
     *
     *  @param(buf)    Pointer to Stat
     *  @param(eb)     Pointer to Error.Block
     *  @a(returns)    true for success; false for failure
     */
    Bool stat(Stat* buf, Error.Block* eb);

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


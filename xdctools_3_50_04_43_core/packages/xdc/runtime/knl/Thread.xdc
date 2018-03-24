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
 *  ======== Thread.xdc ========
 */

import xdc.runtime.Error;
import xdc.runtime.Assert;
import xdc.runtime.knl.IThreadSupport;

/*!
 *  ======== Thread ========
 *  Thread services.
 *
 *  This module manages threads through a proxy which inherits from
 *  IThreadSupport interface. It has a module wide config parameter
 *  {@link #Proxy} which needs to be bound to an OS specific delegate before
 *  this module can be used.
 *
 *  Here is an example showing how the proxy is bound to a BIOS 6.x specific
 *  delegate.
 *
 *  @p(code)
 *  var Thread = xdc.useModule('xdc.runtime.knl.Thread');
 *  Thread.Proxy = xdc.useModule('ti.sysbios.xdcruntime.ThreadSupport');
 *  @p
 *
 *  Typically a package containing the delegates has a Settings module that 
 *  will bind all {@link xdc.runtime.knl} proxies. The following
 *  example sets up all the xdc.runtime.knl proxies.
 *
 *  @p(code)
 *  xdc.useModule('ti.sysbios.xdcruntime.Settings');
 *  @p
 */
@InstanceInitError      /* because initialization can fail */
@InstanceFinalize       /* have to Thread_Proxy_delete(sem) on delete */
@DirectCall

module Thread
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

    /*! Status returned by {@link #getPri} when an error occurs */
    const Int GETPRI_FAILED = -2;

    /*! Status returned by {@link #compareOsPriorities} when an error occurs */
    enum CompStatus {
        CompStatus_ERROR = -2,
        CompStatus_LOWER = -1,
        CompStatus_EQUAL = 0,
        CompStatus_HIGHER = 1
    };

    /*! Proxy that needs to be bound to an OS specific delegate. */
    proxy Proxy inherits IThreadSupport;

    /*! Typedef for thread function */
    typedef Void (*RunFxn)(IArg);

    /*! Struct to hold thread statistics from {@link #stat} */
    struct Stat {
        SizeT stackSize;
        SizeT stackUsed;
    }

    /*! Assert when  timeout passed to {@link #sleep} is zero */
    config Assert.Id A_zeroTimeout= {
        msg: "A_zeroTimeout: Timeout value annot be zero"
    };

    /*! Default thread stack size. */
    config SizeT defaultStackSize = 0;

    /*!
     *  ======== self ========
     *  Return the currently executing thread's handle
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     Returns a handle to the currently executing thread.
     *                  If the current thread is the main thread, this function
     *                  returns `NULL`. NULL is also returned in case of error.
     */
    Handle self(Error.Block *eb);

    /*!
     *  ======== start ========
     *  Start threads running
     *
     *  This function can be used to start all statically created threads,
     *  and all threads created dynamically before this function is called.
     *  Any thread created after this function is called, starts automatically
     *  (i.e., there is no need to call Thread_start() more than once).
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for error
     */
    Bool start(Error.Block *eb);

    /*!
     *  ======== yield ========
     *  Yield the currently scheduled thread
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for error
     */
    Bool yield(Error.Block *eb);

    /*!
     *  ======== compareOsPriorities ========
     *  Compare two os specific priority values and find out which one
     *  represents a higher priority.
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
     *  @a(returns)     refer to description above
     */
    Int compareOsPriorities(Int p1, Int p2, Error.Block *eb);

    /*!
     *  ======== sleep ========
     *  Sleep for given number of microseconds
     *
     *  This function is gauranteed to sleep for at least as long as the 
     *  timeout value but the actual sleep time may be longer. NOTE:
     *  The timeout value cannot be zero.
     *
     *  @param(timeout)     timeout in microseconds
     *  @param(eb)          Pointer to Error.Block
     *  @a(returns)         true for success; false for error
     */
    Bool sleep(UInt timeout, Error.Block *eb);

instance:

    /*! Thread function argument. Default is 0. */
    config IArg arg = 0;

    /*!
     *  ======== priority ========
     *  Specify the new thread's priority
     *
     *  Thread defines several constants which allows applications to select
     *  a priority in an OS independent way: Priority_LOWEST, 
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

    /*!
     *  ======== stackSize ========
     *  Thread stack size
     *
     *  The default value of 0 means that `{@link #defaultStackSize}` is used.
     */
    config SizeT stackSize = 0;
    
    /*! 
     *  ======== tls ========
     *  Thread local storage.
     *
     *  User data associated with a thread. Must persist for the life of
     *  the thread.
     */
    config Ptr tls = null;

    /*!
     *  ======== create ========
     *  Create a Thread object
     *
     *  This function spawns a new thread calling the function fxn.
     *
     *  @param(fxn)     function for new thread to begin execution
     */
    create(RunFxn fxn);

    /*!
     *  ======== join ========
     *  Block calling thread until given thread terminates.
     *
     *  Use this functions to ensure that a thread has terminated. It is OK to
     *  call this function on a thread that has already terminated.
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for error
     */
    Bool join(Error.Block *eb);

    /*!
     *  ======== getPriority ========
     *  Obtain a thread's priority.
     *
     *  For OSes that support dynamic priority boosting, this function
     *  retrieves the base priority of the thread.
     *
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     thread priority in case of success; PRIORITY_INVALID in
     *                  case of error;
     */
    Priority getPriority(Error.Block *eb);

    /*!
     *  ======== setPriority ========
     *  Set a thread's priority.
     *
     *  For OSes that support dynamic priority boosting, this function
     *  changes the base priority of the thread.
     *
     *  @param(newPri)  new thread priority
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for error
     */
    Bool setPriority(Priority newPri, Error.Block *eb);

    /*!
     *  ======== getOsPriority ========
     *  Obtain a thread's OS specific priority.
     *
     *  For OSes that support dynamic priority boosting, the value returned 
     *  is the base priority of the thread.
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
     *  @param(newPri)  new thread priority
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for error
     */
    Bool setOsPriority(Int newPri, Error.Block *eb);

    /*!
     *  ======== getOsHandle ========
     *  Get the OS thread handle
     *
     *   @a(returns)     OS thread handle
     */
    Ptr getOsHandle();

    /*!
     *  ======== getTls ========
     *  Obtain a thread's local storage.
     *
     *   @a(returns)     null when tls has not been set.
     */
    Ptr getTls();

    /*!
     *  ======== setTls ========
     *  Change a thread's local storage.
     *
     *  @param(tls)     tls
     */
    Void setTls(Ptr tls);

    /*!
     *  ======== stat ========
     *  Get thread statistics
     *
     *  @param(buf)     Pointer to Stat
     *  @param(eb)      Pointer to Error.Block
     *  @a(returns)     true for success; false for failure
     */
    Bool stat(Stat* buf, Error.Block *eb);

internal:

    struct Instance_State {
        Thread.Proxy.Handle proxyHandle; /*! handle for real implementation */
        Ptr                 tls;         /*! store tls parameter */
    }
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


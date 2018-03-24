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
 *  ======== IGateProvider.xdc ========
 */
package xdc.runtime

/*!
 *  ======== IGateProvider ========
 *  Interface implemented by all gate providers
 *
 *  Gates are used within the `xdc.runtime` package to serialize access
 *  to data structures that are used by more than one thread.
 *
 *  Gates are responsible for ensuring that only one out of multiple threads
 *  can access a data structure at a time.  There are important scheduling
 *  latency and performance considerations that affect the "type" of gate used
 *  to protect each data structure.  For example, the best way to protect a
 *  shared counter is to simply disable all interrupts before the update and
 *  restore the interrupt state after the update; disabling all interrupts
 *  prevents all thread switching, so the update is guaranteed to be "atomic".
 *  Although highly efficient, this  method of creating atomic sections causes
 *  serious system latencies when the time required to update the data structure
 *  can't be bounded.
 *
 *  For example, a memory manager's list of free blocks can grow indefinitely
 *  long during periods of high fragmentation.  Searching such a list with
 *  interrupts disabled would cause system latencies to also become unbounded.
 *  In this case, the best solution is to provide a gate that suspends the
 *  execution of  threads that try to enter a gate that has already been
 *  entered; i.e., the gate "blocks" the thread until the thread already in the
 *  gate leaves.  The time required to enter and leave the gate is greater than
 *  simply enabling and restoring interrupts, but since the time spent within
 *  the gate is relatively large, the overhead caused by entering and leaving
 *  gates will not become a significant percentage of overall system time.  More
 *  importantly, threads that do not need to access the shared data structure
 *  are completely unaffected by threads that do access it.
 *
 *  @a(Notes)
 *  Modules inheriting this interface should treat all names beginning with
 *  `Q_` as reserved words, i.e. the names from that namespace should not
 *  be used.  This will allow future version of this interface to define new
 *  constants ("qualities" ) similar to `{@link #Q_BLOCKING}` and
 *  `{@link #Q_PREEMPTING}` without breaking any existing modules.
 */
@DirectCall
interface IGateProvider {

    /*!
     *  ======== Q_BLOCKING ========
     *  Blocking quality
     *
     *  Gates with this "quality" may cause the calling thread to block; 
     *  i.e., suspend execution until another thread leaves the gate.
     */
    const Int Q_BLOCKING = 1;

    /*!
     *  ======== Q_PREEMPTING ========
     *  Preempting quality
     *
     *  Gates with this "quality" allow other threads to preempt the thread
     *  that has already entered the gate.
     */
    const Int Q_PREEMPTING = 2;

    /*!
     *  ======== query ========
     *  Configuration time test for a particular gate quality
     *
     *  @param(qual)    constant describing a quality
     *  @a(returns)     Returns `TRUE` if the gate has the given quality,
     *  and `FALSE` otherwise, which includes the case when the gate does not
     *  recognize the constant describing the quality.
     */
    metaonly Bool queryMeta(Int qual);

    /*!
     *  ======== query ========
     *  Runtime test for a particular gate quality
     *
     *  @param(qual)    constant describing a quality
     *  @a(returns)     Returns `TRUE` if the gate has the given quality,
     *  and `FALSE` otherwise, which includes the case when the gate does not
     *  recognize the constant describing the quality.
     */
    Bool query(Int qual);

instance:

    /*!
     *  ======== create ========
     *  Create a gate instance
     */
    create();

    /*!
     *  ======== enter ========
     *  Enter this gate
     *
     *  Each gate provider can implement mutual exclusion using different
     *  algorithms; e.g., disabling all scheduling, disabling the scheduling
     *  of all threads below a specified "priority level", suspending the
     *  caller when the gate has been entered by another thread and
     *  re-enabling it when the the other thread leaves the gate.  However,
     *  in all cases, after this method returns that caller has exclusive
     *  access to the data protected by this gate.
     *
     *  A thread may reenter a gate without blocking or failing.
     *
     *  @a(returns)
     *  Returns a "key" that is used to `{@link #leave}` this gate; this 
     *  value is used to restore thread preemption to the state that
     *  existed just prior to entering this gate.
     */
    IArg enter();

    /*!
     *  ======== leave ========
     *  Leave this gate
     *
     *  This method is only called by threads that have previously entered 
     *  this gate via `{@link #enter}`.  After this method returns, the
     *  caller must not access the data structure protected by this gate
     *  (unless the caller has entered the gate more than once and other
     *  calls to `leave` remain to balance the number of previous
     *  calls to `enter`).
     *
     *  @param(key) the value returned by a matching call to
     *              `{@link #enter}`
     */
    Void leave(IArg key);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


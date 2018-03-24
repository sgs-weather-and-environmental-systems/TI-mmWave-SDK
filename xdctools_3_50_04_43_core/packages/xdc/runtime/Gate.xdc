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
package xdc.runtime;

/*!
 *  ======== Gate ========
 *  Critical section support
 *
 *  Gates are used by clients to protect concurrent access to critical
 *  data structures.  Critical data structures are those that must be
 *  updated by at most one thread at a time.  All code that needs access
 *  to a critical data structure "enters" a gate (that's associated with the
 *  data structure) prior to accessing the data, modifies the data structure,
 *  then "leaves" the gate.
 *
 *  A gate is responsible for ensuring that at most one thread at a time
 *  can enter and execute "inside" the gate.  There are several
 *  implementations of gates, with different system executation times and
 *  latency tradoffs.  In addition, some gates must not be entered by certain
 *  thread types; e.g., a gate that is implemented via a "blocking" semaphore
 *  must not be called by an interrupt service routine (ISR).
 *
 *  A module can be declared "gated" by adding the `@Gated` attribute to the
 *  module's XDC spec file.  A "gated" module is assigned a module-level gate
 *  at the configuration time, and that gate is then used to protect critical
 *  sections in the module's target code. A module-level gate is an instance of
 *  a module implementing `{@link IGateProvider}` interface. However, gated
 *  modules do not access their module-level gates directly. They use this
 *  module to access transparently their module-level gate. 
 *
 *  Application code that is not a part of any module also has a
 *  module-level gate, configured through the module `{@link Main}`.
 *
 *  Each gated module can optionally create gates on an adhoc basis at
 *  runtime using the same gate module that was used to create the module
 *  level gate.
 *
 *  Gates that work by disabling all preemption while inside a gate can be
 *  used to protect data structures accessed by ISRs and other
 *  threads.  But, if the time required to update the data structure is not
 *  a small constant, this type of gate may violate a system's real-time
 *  requirements.
 *
 *  Gates have two orthogonal attributes: "blocking" and "preemptible".
 *  In general, gates that are "blocking" can not be use by code that is
 *  called by ISRs and gates that are not "preemptible" should only be used to
 *  to protect data manipulated by code that has small constant execution
 *  time.
 *
 */
@CustomHeader
@DirectCall
module Gate {

    /*!
     *  ======== Ref ========
     *  Opaque reference to an allocated gate instance
     */
    @Encoded typedef xdc.runtime.IGateProvider.Handle Ref;

    /*!
     *  ======== allocInstance ========
     *  Allocate a gate instance from the current module's gate
     *
     *  This method is used by modules to create gates at runtime using
     *  the same `IGateProvider` that was used to create the module
     *  level gate.  The parameters passed to the `IGateProvider` are
     *  specified at configuration time via the
     * `{@link Types#Common$ Types.Common$.gateParams}`
     *  configuration parameter.
     *
     *  @param(eb)  `Error` block pointer
     *
     *      If `NULL`, any error in creating the instance will terminate
     *      the application.
     *
     *  @a(returns)
     *  Non-`NULL` instance handle is returned if no error occurs; otherwise
     *  an error is raised in `eb` and `NULL` is returned.
     *
     *  @see IGateProvider
     *  @see Error
     */
    @Macro Ref allocInstance(Error.Block *eb);

    /*!
     *  ======== freeInstance ========
     *  Free a gate instance to the current module's gatekeeper
     *
     *  @param(gate) non-`NULL` return value from a prior call to
     *               `{@link #allocInstance}`.
     *
     *  @see #allocInstance
     */
    @Macro Void freeInstance(Ref gate);

    /*!
     *  ======== enterInstance ========
     *  Enter a critical section protected by this gate instance
     *
     *  @param(gate) non-`NULL` return value from a prior call to
     *               `{@link #allocInstance}`.
     *
     *  @a(returns)
     *  Returns a "key" value that must be used to leave `gate`
     *  via `{@link #leaveInstance()}`.
     *
     */
    @Macro IArg enterInstance(Ref gate);

    /*!
     *  ======== enterModule ========
     *  Enter a critical section protected by the current module's gate
     *
     *  @a(returns)
     *  Returns a "key" value that must be used to leave the current module
     *  gate via `{@link #leaveModule()}`.
     *
     *  @see #leaveModule
     */
    @Macro IArg enterModule();

    /*!
     *  ======== enterSystem ========
     *  Enter a critical section protected by the global System gate
     *
     *  @a(returns)
     *  Returns a "key" value that must be used to leave the `{@link System}`
     *  gate via `{@link #leaveSystem()}`.
     *
     *  @see #leaveSystem
     */
    IArg enterSystem();

    /*!
     *  ======== leaveInstance ========
     *  Leave a critical section protected by a gate
     *
     *  @param(gate) non-`NULL` return value from a prior call to
     *               `{@link #allocInstance}`.
     *  @param(key) the return value of a prior call to
     *              `{@link #enterInstance}`
     *
     *  @see #enterInstance
     *  @see #allocInstance
     */
    @Macro Void leaveInstance(Ref gate, IArg key);

    /*!
     *  ======== leaveModule ========
     *  Leave a critical section protected by the current module's gate
     *
     *  @param(key) the return value of a prior call to `{@link #enterModule}`
     *
     *  @see #enterModule
     */
    @Macro Void leaveModule(IArg key);

    /*!
     *  ======== leaveSystem ========
     *  Leave a critical section protected by the global System gate
     *
     *  @param(key) the return value of a prior call to `{@link #enterSystem}`
     *
     *  @see #enterSystem
     */
    Void leaveSystem(IArg key);

    /*!
     *  ======== canBlock ========
     *  Check if the module level gate can block threads
     *
     *  This type of gate should never be called by clients that must never
     *  call a "blocking" RTOS operation; e.g., interrupt service
     *  routines
     *
     *  @a(returns) Returns `TRUE` if the underlying gatekeeper's gate can
     *              block
     */
    @Macro Bool canBlock();

    /*!
     *  ======== canBePreempted ========
     *  Check if the module level gate allows thread preemption
     *
     *  This type of gate should always be used by clients that protect
     *  a data structure whose updates require more than a small
     *  constant amount of time; e.g., update of a memory allocator's free
     *  list.
     *
     *  @a(returns) Returns `TRUE` if the underlying gate does not disable
     *              thread preemption.
     */
    @Macro Bool canBePreempted();
    
    /*!
     *  ======== staticAlloc ========
     *  Assign a statically-allocated gate instance to a state-object field 
     *
     *  This method is used to create a gate for static instance objects
     *  that require a gate.
     *
     *  @param(stateObj)    the state object for the instance being created
     *  @param(fldName)     a name of a field within the state object
     *
     *      This parameter names a field that will point to the created gate
     *      instance to be created. It is a caller's responsibility
     *      to ensure that the type of `fldName` is a handle to an 
     *      `IGateProvider` instance.
     */
    metaonly Void staticAlloc(Any stateObj, String fldName);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/*!
 *  ======== CallStack ========
 *  Provide call stack support to module ROV views
 *
 *  This module provides methods that enable module ROV views
 *  to specify current CPU registers and get the corresponding
 *  stack traceback for the current executable.
 *
 *  While the methods of this module are currently
 *  similar to the `ICallStack` interface, it is important to
 *  note that this module does not have instance methods; the
 *  `ICallStack` interface defines an interface for instance
 *  objects that enable the implementation of this module.
 *
 *  This module uses the `{@link xdc.rov.ICallStack}` instance
 *  provided by `{@link xdc.rov.Model}`.
 */
metaonly module CallStack
{
    /*!
     *  ======== clearRegisters ========
     *  Clear all register settings
     */
    Void clearRegisters();

    /*!
     *  ======== fetchRegisters ========
     *  Set a device register necessary for stack trace back analysis
     */
    Void fetchRegisters(String names[]);

    /*!
     *  ======== getRegister ========
     *  Set a device register necessary for stack trace back analysis
     */
    Long getRegister(String name);

    /*!
     *  ======== setRegister ========
     *  Set a device register necessary for stack trace back analysis
     */
    Void setRegister(String name, Long value);

    /*!
     *  ======== toText ========
     *  Create a string represenation of the call stack
     */
    String toText();
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


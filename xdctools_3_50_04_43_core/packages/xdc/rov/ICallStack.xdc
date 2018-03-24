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
package xdc.rov

/*!
 *  ======== ICallStack ========
 *  A call stack interface (optionally) implementated by ROV servers
 *
 *  Instances of this interface maintain a "local" set of processor
 *  registers sufficient to enable call stack parsing - walking up the C
 *  callstack and determining all nested calls up to the current program
 *  counter (specified by the local registers).  This "local" set of
 *  registers is, of course, processor specific and must include both
 *  the program counter ("PC") and a frame pointer (processor-specific
 *  register name).
 */
metaonly interface ICallStack {

instance:
    /*
     *  ======== clearRegisters ========
     *  Clear all local register values
     */
    Void clearRegisters();

    /*
     *  ======== fetchRegisters ========
     *  Fetch the current values of the specified registers
     *
     *  This method reads the current value of the registers from the device
     *  (or core dump file or ...) and sets the local register set
     *  accordingly.  For example, if the frame pointer register is named
     *  "FP" the following sequence should produce a stack trace:
     *  @p(code)
     *      callstack.fetch(["PC", "FP"]);
     *      print(callstack.toText());
     *  @p
     */
    Void fetchRegisters(String names[]);

    /*
     *  ======== getRegister ========
     *  Get the local value of the named register
     */
    Long getRegister(String name);

    /*
     *  ======== setRegister ========
     *  Set the local value of the named register
     */
    Void setRegister(String name, Long value);

    /*
     *  ======== toText ========
     *  Return entire call stack as a string
     *  
     *  Create a string representation of the current call stack based
     *  on the currently set register values.
     */
    String toText();
}

/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


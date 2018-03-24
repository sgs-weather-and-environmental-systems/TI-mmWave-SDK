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
 *  ======== ISystemSupport.xdc ========
 */
package xdc.runtime;

/*!
 *  ======== ISystemSupport ========
 *  Interface to core system functions.
 *
 *  Each embedded system requires implementations of these functions but
 *  the behavior of these functions varies depending on the context of the
 *  embedded system.  For example, some systems will implement `exit()` as
 *  an infinite loop because the executable is designed to *never* exit.
 */
@DirectCall
interface ISystemSupport {

    /*!
     *  ======== abort ========
     *  Backend for `{@link System#abort()}`
     *
     *  This function is called by `{@link System#abort()}` prior to calling
     *  the ANSI C Standard library function `abort()`.  So, to ensure the
     *  abort processing of the system's ANSI C Standard library completes,
     *  this function should return to its caller.
     *
     *  @param(str)  message to output just prior to aborting
     *
     *      If non-`NULL`, this string should be output just prior to
     *      terminating.
     */
    Void abort(CString str);

    /*!
     *  ======== exit ========
     *  Backend for `{@link System#exit()}`
     *
     *  This function is called as part the normal "atexit" processing
     *  performed by the ANSI C Standard Library's `exit()` function;
     *  `{@link System#exit()}` directly calls ANSI `exit()`.
     *
     *  This function is called after all "atexit" handlers bound via
     *  `{@link System#atexit()}` are run and it
     *  is always called while "inside" the the `System` gate.
     *
     *  To ensure that all exit processing of the system's ANSI C
     *  Standard Library completes, this function should return to its caller.
     *  Exit handlers bound using the ANSI C Standard Library `atexit()`
     *  function may run before or after this function.
     *
     *  @param(stat)    status value passed to all "atexit" handlers
     *
     *      This value is passed to all "atexit" handles bound via
     *      `{@link System#atexit()}`. 
     *
     *  @see System#atexit
     */
    Void exit(Int stat);

    /*!
     *  ======== flush ========
     *  Backend for `{@link System#flush()}`
     *
     *  This function is simply called by `{@link System#flush System_flush}`
     *  to output any characters buffered by the underlying `SystemSupport`
     *  module to an output device.
     */
    Void flush();
    
    /*!
     *  ======== putch ========
     *  Backend for `{@link System#printf()}` and `{@link System#putch()}`
     *
     *  Output a single character.  This function is called by
     *  `{@link System#printf System_printf()}` to write each character
     *  of formated output specified by its arguments.

     *
     *  @param(ch)  character to output
     */
    Void putch(Char ch);

    /*!
     *  ======== ready ========
     *  Test if character output can proceed
     *
     *  This function is called by `{@link System}` prior to performing
     *  any character output.  If this function returns `FALSE`, the `System`
     *  functions that would normally call `putch()` simply return
     *  (with an appropriate error status) without ever calling
     *  `{@link #putch}`.
     */
    Bool ready();
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


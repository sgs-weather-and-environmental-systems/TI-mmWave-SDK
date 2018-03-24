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
 *  ======== SysStd.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== SysStd ========
 *  Implementation of `{@link ISystemSupport}` using ANSI C Standard Library
 *
 *  This implementation provides a fully functional implementation of
 *  all methods specified by `ISystemSupport`. As with all
 *  `ISystemSupport` modules, this module is the back-end for the
 *  `{@link System}` module.
 *
 *  This implementation relies on the target's runtime support libraries
 *  (i.e. `fflush()` and `putchar()`). Therefore the  functions are re-entrant
 *  (thread-safe) if the underlying rts library is re-entrant.
 */
module SysStd inherits xdc.runtime.ISystemSupport {
    /*!
     *  ======== abort ========
     *  Backend for `{@link System#abort()}`
     *
     *  This abort function writes the string via `putchar()`
     *  and flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#abort
     */
    override Void abort(CString str);

    /*!
     *  ======== exit ========
     *  Backend for `{@link System#exit()}`
     *
     *  This exit function flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#exit
     */
    override Void exit(Int stat);

    /*!
     *  ======== flush ========
     *  Backend for `{@link System#flush()}`
     *
     *  This flush function flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#flush
     */
    override Void flush();

    /*!
     *  ======== putch ========
     *  Backend for `{@link System#printf()}` and `{@link System#putch()}`
     *
     *  This function outputs the character via `putchar()`.
     *
     *  @see ISystemSupport#putch
     */
    override Void putch(Char ch);

    /*!
     *  ======== ready ========
     *  Test if character output can proceed
     *
     *  This always returns TRUE.
     *
     *  @see ISystemSupport#ready
     */
    override Bool ready();
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


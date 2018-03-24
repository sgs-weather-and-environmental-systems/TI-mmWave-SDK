/* 
 *  Copyright (c) 2012 Texas Instruments. All rights reserved.
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
 *  ======== SysCallback.xdc ========
 */
package xdc.runtime;

/*!
 *  ======== SysCallback ========
 *  ISystemSupport implementation for user callback functions
 *
 *  This module provides a implementation of the `{@link ISystemSupport}`
 *  interface that simply calls back the user defined functions to enable the
 *  System module's functionality.
 *
 *  Configuration is as shown below.
 *  @p(code)
 *
 *  var SysCallback = xdc.useModule('xdc.runtime.SysCallback');
 *  SysCallback.abortFxn = "&userAbort";
 *  SysCallback.exitFxn  = "&userExit";
 *  SysCallback.flushFxn = "&userFlush";
 *  SysCallback.putchFxn = "&userPutch";
 *  SysCallback.readyFxn = "&userReady";
 *
 *  @p
 *
 */
module SysCallback inherits xdc.runtime.ISystemSupport
{
    /*!
     *  ======== AbortFxn ========
     *  Abort function signature
     */
    typedef Void (*AbortFxn)(CString);

    /*!
     *  ======== defaultAbort ========
     *  Default abort function that does nothing
     *
     *  This default abort function spins forever and never returns.
     */
    extern Void defaultAbort(CString) = xdc_runtime_SysCallback_defaultAbort;

    /*!
     *  ======== ExitFxn ========
     *  Exit function signature
     */
    typedef Void (*ExitFxn)(Int);

    /*!
     *  ======== defaultExit ========
     *  Default exit function that does nothing
     *
     *  The default exit function does nothing and returns.
     */
    extern Void defaultExit(Int) = xdc_runtime_SysCallback_defaultExit;

    /*!
     *  ======== FlushFxn ========
     *  Flush function signature
     */
    typedef Void (*FlushFxn)();

    /*!
     *  ======== defaultFlush ========
     *  Default flush function that does nothing
     *
     *  The default flush function does nothing and returns.
     */
    extern Void defaultFlush() = xdc_runtime_SysCallback_defaultFlush;

    /*!
     *  ======== PutchFxn ========
     *  Putch function signature
     */
    typedef Void (*PutchFxn)(Char);

    /*!
     *  ======== defaultPutch ========
     *  Default putch function that does nothing
     *
     *  The default putch function drops the characters.
     */
    extern Void defaultPutch(Char) = xdc_runtime_SysCallback_defaultPutch;

    /*!
     *  ======== ReadyFxn ========
     *  Ready function signature
     */
    typedef Bool (*ReadyFxn)();

    /*!
     *  ======== defaultReady ========
     *  Default ready function that does nothing
     *
     *  The default ready function returns `TRUE` always.
     */
    extern Bool defaultReady() = xdc_runtime_SysCallback_defaultReady;

    /*!
     *  ======== abortFxn =========
     *  User supplied abort function
     *
     *  This function is called when the application calls
     *  `{@link System#abort()}` function. If the user supplied funtion
     *  returns, the abort function of the ANSI C Standard library is called.
     *  For more information see the `{@link System#abort()}` documentation.
     *
     *  By default, this function is configured with a default abort function.
     *  This default abort function spins forever and never returns.
     */
    config AbortFxn abortFxn = "&xdc_runtime_SysCallback_defaultAbort";

    /*!
     *  ======== exitFxn =========
     *  User supplied exit function
     *
     *  This function is called when the application calls
     *  `{@link System#exit()}` function. If the user supplied function
     *  returns, the ANSI C Standard Library atexit processing will be
     *  completed. For more information see the `{@link System#exit()}`
     *  documentation.
     *
     *  By default, this function is configured with a default exit function.
     *  The default exit function does nothing and returns.
     */
    config ExitFxn exitFxn = "&xdc_runtime_SysCallback_defaultExit";

    /*!
     *  ======== flushFxn =========
     *  User supplied flush function
     *
     *  This function is called when the application calls
     *  `{@link System#flush()}` function. 
     *
     *  By default, this function is configured with a default flush function.
     *  The default flush function does nothing and returns.
     */
    config FlushFxn flushFxn = "&xdc_runtime_SysCallback_defaultFlush";

    /*!
     *  ======== putchFxn =========
     *  User supplied character output function
     *
     *  This function is called whenever the `System` module needs to output 
     *  a character; e.g., during `{@link System#printf()}` or 
     *  `{@link System#putch()}`.
     *
     *  By default, this function is configured with a default putch function.
     *  The default putch function drops the characters.
     */
    config PutchFxn putchFxn = "&xdc_runtime_SysCallback_defaultPutch";

    /*!
     *  ======== readyFxn =========
     *  User supplied ready function
     *
     *  This function is called by the `System` module prior to performing any
     *  character output to check if the `SystemSupport` module is ready to 
     *  accept the character. For more information see the 
     * `{@link ISystemSupport#ready()}` documentation.
     *
     *  By default, this function is configured with a default ready function. 
     *  The default ready function returns `TRUE` always.
     */
    config ReadyFxn readyFxn = "&xdc_runtime_SysCallback_defaultReady";
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


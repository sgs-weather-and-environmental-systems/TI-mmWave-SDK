/* 
 *  Copyright (c) 2016 Texas Instruments. All rights reserved.
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
 *  ======== Reset.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Reset ========
 *  Startup reset function manager
 *
 *  This module defines an initial reset function and can be used without
 *  requiring any other `xdc.runtime` module.  The reset function is called
 *  as early as possible in the application startup and is intended for
 *  platform-specific hardware initialization.
 *
 *  The reset function sequentially calls each of the functions added to the
 *  `{@link #fxns}` array starting from index 0.  If
 *  `{@link Startup#resetFxn Startup.resetFxn}` is defined, it is called
 *  before any of the functions defined by the `fxns` array.
 *
 *  By providing an array of startup functions, rather than a single function
 *  as `{@link Startup}` does, modules that need very early initialization
 *  can simply add their initialization to the list of functions to be called
 *  without having to implement a "chaining" mechanism or requiring the user
 *  to implement and maintain an application reset function.
 *
 *  @a(Warning)
 *  The reset function is _not_ supported on all platforms and, as a result,
 *  you should never place any "portable" code that is required for your
 *  application in this function.  Use the `{@link Startup}` module to
 *  define required application startup functions.
 *
 *  @see Startup
 */
@Template("xdc/runtime/Reset.xdt")
metaonly module Reset
{
    /*!
     *  ======== fxns ========
     *  List of functions to call at reset
     *
     *  This array defines the functions that will be executed by the reset
     *  initialization function (`xdc_runtime_Startup_reset__I`) _in addition
     *  to_ the function specified by `{@link Startup#resetFxn}`.
     *
     *  The following code fragment shows how to add the externally defined
     *  function `myReset()` to this array.
     *  @p(code)
     *      var Reset = xdc.useModule("xdc.runtime.Reset");
     *      Reset.fxns[Reset.fxns.length++] = "&myReset";
     *  @p
     *
     *  @a(Warning)
     *  Although the functions specified in `fxns[]` are ordinary C functions,
     *  they are often called _before_ the C runtime is fully initialized;
     *  e.g., they may be called _before_ static variables are initialized.
     *  Reset functions should only assume that a minimal execution stack has
     *  initialized.
     *
     *  @see Startup#resetFxn
     */
    metaonly config xdc.runtime.Startup.InitFxn fxns[] = [];
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


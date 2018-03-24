/* 
 *  Copyright (c) 2012-2017 Texas Instruments Incorporated
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
 *  ======== LoggerCallback.xdc ========
 */
package xdc.runtime;
/*!
 *  ======== LoggerCallback ========
 *  A logger that passes events to a user supplied callback function
 *
 *  @a(Examples)
 *  Configuration example: The following XDC configuration statements
 *  create a logger instance, plug in the user defined functions, assign it as
 *  the default logger for all modules, and enable `USER1` logging in all
 *  modules of the package `my.pkg`. See the
 *  `{@link Diags#setMaskMeta Diags.setMaskMeta()}` function for details on
 *  specifying the module names.
 *
 *  @p(code)
 *  var Defaults = xdc.useModule('xdc.runtime.Defaults');
 *  var Diags = xdc.useModule('xdc.runtime.Diags');
 *  var LoggerCallback = xdc.useModule('xdc.runtime.LoggerCallback');
 *  LoggerCallback.outputFxn = "&userOutputFunc";
 *  LoggerCallback.createInstFxn = "&userCreateInstFunc";
 *
 *  var loggerParams = new Logger.Params();
 *  loggerParams.arg = 1;
 *  Defaults.common$.logger = LoggerCallback.create(loggerParams);
 *  Diags.setMaskMeta("my.pkg.%", Diags.USER1, Diags.RUNTIME_ON);
 *  @p
 */
@ModuleStartup
module LoggerCallback inherits ILogger {

    /*!
     *  ======== OutputFxn ========
     *  Character output callback function signature
     *
     *  The first argument is the parameter returned by the call to
     *  `createInstFxn`.
     *  The second argument is a pointer to `{@link Log#EventRec}` record.
     *  The third argument is the number of arguments in`{@link Log#EventRec}`
     *
     *  Note: Only evt and arg fields in `Log_EventRec` record are filled and
     *        passed to the user supplied function.
     */
    typedef Void (*OutputFxn)(UArg, Log.EventRec *, Int);

    /*!
     *  ======== defaultOutput ========
     *  Default output function (always does nothing)
     */
    extern Void defaultOutput(UArg, Log.EventRec *, Int)
        = xdc_runtime_LoggerCallback_defaultOutput;

    /*!
     *  ======== CreateInstFxn ========
     *  Logger instance create callback function signature
     *
     *  `{@link LoggerCallback#arg}` is passed as an argument to this function.
     *  The return value from this function will be passed as an argument
     *  to the `outputFxn`. In case of multiple LoggerCallback instances, the
     *  return value can be used in `outputFxn` to differentiate among the
     *  instances.
     */
    typedef UArg (*CreateInstFxn)(UArg);

    /*!
     *  ======== defaultCreate ========
     *  Default create function (always returns 0)
     */
    extern UArg defaultCreate(UArg) = xdc_runtime_LoggerCallback_defaultCreate;

    /*!
     *  ======== outputFxn ========
     *  User supplied character callback function
     *
     *  This function is called when the `Log` module needs to output an event.
     *  e.g. `{@link Log#write4()}` or `{@link Log#print2()}`
     *
     *  By default, this function is configured with a default output function.
     *  The default function does nothing and returns.
     */
    config OutputFxn outputFxn = "&xdc_runtime_LoggerCallback_defaultOutput";

    /*!
     *  ======== createInstFxn ========
     *  User supplied logger instance create function
     *
     *  This function is called when the `{@link LoggerCallback#create}` is
     *  called.
     *
     *  By default, this function is configured with a default create function.
     *  The default create function always returns `0`.
     */
    config CreateInstFxn createInstFxn = "&xdc_runtime_LoggerCallback_defaultCreate";

instance:

    /*!
     *  ======== create ========
     *  Create a `LoggerCallback` logger instance
     */
    create();

    /*!
     *  ======== arg ========
     *  User supplied argument for the user supplied create function.
     *
     *  This user supplied argument will be passed back as an argument to the
     *  `createInstFxn` function. It can be used by the
     *  `{@link LoggerCallback#createInstFxn}` function at runtime to
     *  differentiate between the multiple logger instances configured in the
     *  user config script.
     *
     *  The user can skip configuring this argument. In such a case, the
     *  default value `0` will be passed back as an argument to the
     *  `createInstFxn` function. 
     */
    config UArg arg = 0;

internal:

    struct Instance_State {
        Bool enabled;  /* Logger state */
        UArg context;  /* Logger instance */
        UArg arg;      /* Logger instance create argument */
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


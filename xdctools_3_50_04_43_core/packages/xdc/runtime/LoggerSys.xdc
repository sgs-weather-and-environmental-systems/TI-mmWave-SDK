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
 *  ======== LoggerSys.xdc ========
 */

/*!
 *  ======== LoggerSys ========
 *  A logger which routes events to the `System_printf` function.
 *
 *  This logger processes log events as they are generated and routes
 *  them through the `{@link System#printf System_printf()}` function.
 *  The final disposition of the log event is dependent on which system
 *  provider has been assigned to the
 *  `{@link System#SupportProxy System.SupportProxy}` configuration parameter.
 *
 *  Note that the log events are processed within the runtime context
 *  of the `{@link Log Log_write()}` or `{@link Log Log_print()}` function
 *  that generated the event. It is important to account for the processing
 *  overhead and stack usage imposed on the runtime context. The cost of
 *  this processing is defined by the implementation of the system provider.
 *
 *  @a(Examples)
 *  Configuration example: The following XDC configuration statements
 *  create a logger instance, assign it as the default logger for all
 *  modules, and enable `USER1` logging in all modules of the package
 *  `my.pkg`. See the `{@link Diags#setMaskMeta Diags.setMaskMeta()}` function
 *  for details on specifying the module names.
 *
 *  @p(code)
 *  var Defaults = xdc.useModule('xdc.runtime.Defaults');
 *  var Diags = xdc.useModule('xdc.runtime.Diags');
 *  var LoggerSys = xdc.useModule('xdc.runtime.LoggerSys');
 *
 *  var LoggerSysParams = new LoggerSys.Params();
 *  Defaults.common$.logger = LoggerSys.create(LoggerSysParams);
 *  Diags.setMaskMeta("my.pkg.%", Diags.USER1, Diags.RUNTIME_ON);
 *  @p
 */

module LoggerSys inherits ILogger {

    /*!
     *  ======== ITimestampProxy ========
     *  User supplied time-stamp proxy
     *
     *  This proxy allows `LoggerSys` to use a timestamp server different
     *  from the server used by `{@link xdc.runtime.Timestamp}`. However, if
     *  not supplied by a user, this proxy defaults to whichever timestamp
     *  server is used by `Timestamp`.
     */
    proxy TimestampProxy inherits ITimestampClient;

instance:

    /*!
     *  ======== create ========
     *  Create a `LoggerSys` logger
     *
     *  The logger instance will route all log events it receives to
     *  the {@link System#printf} function.
     */
    create();

internal:

    struct Instance_State {
        Bool enabled;
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


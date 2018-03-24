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
 *  ======== Defaults.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Defaults ========
 *  Default attributes inherited by all target modules
 *
 *  This module defines default values for `common$` structure. If other 
 *  modules do not set `common$` properties explicitly, these values will be
 *  used.
 */
module Defaults {

    /*!
     *  ======== common$ ========
     *  Defaults inherited by all target modules
     *
     *  This structure defines the default values for the configuration
     *  parameters shared by all modules in a system.  Unless otherwise
     *  noted, setting one of the fields defined below will set the
     *  corresponding value for all modules in the system which have not
     *  been explicitly set; i.e., it will establish a default value for
     *  the parameter.
     *
     *  However, the modules from this package (`xdc.runtime`) are an
     *  exception. The values from `Default.common$` are not copied to
     *  `logger` and `diags_` properties of `common$` in `xdc.runtime`
     *  modules. The property `diags_ASSERT` is an exception to that exception.
     *  Its value from `Default.common$` is copied to all modules for which
     *  `diags_ASSERT` has not been explicitly set.
     *
     *  @a(diags_ASSERT)
     *  Enables asserts at runtime. Default is `ALWAYS_ON`
     *
     *  @a(diags_ENTRY)
     *  Enables entry trace for all functions. Default is `ALWAYS_OFF`
     *
     *  @a(diags_EXIT)
     *  Enables exit trace for all functions. Default is `ALWAYS_OFF`
     *
     *  @a(diags_INTERNAL)
     *  Enables internal asserts. Default is `ALWAYS_OFF`. When set to
     *  `ALWAYS_ON`, requires `diags_ASSERT` to be `ALWAYS_ON`.
     *
     *  @a(diags_LIFECYCLE)
     *  Enables logging of lifecycle events. These events are logged during 
     *  creates and deletes. Default is `ALWAYS_OFF`. 
     *
     *  @a(diags_STATUS)
     *  Enables logging of status events, such as error and warning events. 
     *  Default is `ALWAYS_ON`. Note that this does not mean that logging will
     *  occur by default--a logger instance must also be configured for the 
     *  module in order for events to be logged.
     *
     *  @a(diags_INFO)
     *  Enables logging of generic informational events. Default is 
     *  `ALWAYS_OFF`.
     *
     *  @a(diags_ANALYSIS)
     *  Enables logging of analysis events, such as benchmarking events. 
     *  Default is `ALWAYS_OFF`.
     *
     *  @a(diags_USER)
     *  Each `diags_USER` field controls a separate user-defined
     *  logging level. Default is `ALWAYS_OFF` for all `diags_USER` fileds.
     *
     *  @a(gate)
     *  Default gate used by all modules which are declared as being `@Gated`.
     *  By default, this parameter points to an instance of `{@link GateNull}`,
     *  which means there is no protection.
     *
     *  @a(gateParams)
     *  The default parameters used to create gates at runtime. See
     *  `{@link Types#Common$.gateParams}`.  Default is `null`.
     *
     *  @a(instanceHeap)
     *  Specify heap to be used for module instances. Default is `null`.
     *  If `instanceHeap` is `null`, instances will be allocated from
     *  the heap specified by `{@link Memory#defaultHeapInstance}`.
     *
     *  @a(instanceSection)
     *  Specify section to be used to place module instances. Default is
     *  `null`.
     *
     *  @a(logger)
     *  Default logger used by modules to write logs. By default there is 
     *  no logger.
     *
     *  @a(memoryPolicy)
     *  Used to specify type of application. `Types.STATIC_POLICY` is used when
     *  all objects are created statically. `Types.CREATE_POLICY` is used when 
     *  the application creates objects at runtime. `Types.DELETE_POLICY` is
     *  used when the application creates and deletes objects at runtime. This
     *  helps eliminate unwanted create and delete code.
     *
     *  @a(namedInstance)
     *  This parameter should be set to `true` if space needs to be allocated in
     *  instance objects for instance names. Allocating space for a name
     *  allows object view tools to display the names. The runtime functions
     *  `Mod_Handle_name()` and `Mod_Handle_label()` defined for each module
     *  `Mod` can be used to retrieve the name at runtime.
     *
     *  @a(namedModule)
     *  This field allows the name of the module to be retained on the target.
     *  Setting this to `false` will save space but will also prevent
     *  the target from being able to display the module names appearing
     *  in `Log` events and `Error`s.
     *
     *  Setting `namedModule` to `false` causes all modules, except for
     *  `{@link Memory}` and `{@link Main}` to be unnamed by default.  To
     *  eliminate the string names for these modules you must explicitly
     *  set their `common$.namedModule` parameters to `false`; without these
     *  two names, target-side display of error messages is somewhat cryptic.
     *
     *  @a(romPatchTable)
     *  Specify whether modules that are allocated to ROM are patchable.
     */
    override metaonly config Types.Common$ common$ = {
        diags_ASSERT:       Diags.ALWAYS_ON,
        diags_ENTRY:        Diags.ALWAYS_OFF,
        diags_EXIT:         Diags.ALWAYS_OFF,
        diags_INTERNAL:     Diags.ALWAYS_OFF,
        diags_LIFECYCLE:    Diags.ALWAYS_OFF,
        diags_STATUS:       Diags.ALWAYS_ON,
        diags_USER1:        Diags.ALWAYS_OFF,
        diags_USER2:        Diags.ALWAYS_OFF,
        diags_USER3:        Diags.ALWAYS_OFF,
        diags_USER4:        Diags.ALWAYS_OFF,
        diags_USER5:        Diags.ALWAYS_OFF,
        diags_USER6:        Diags.ALWAYS_OFF,
        diags_USER7:        Diags.ALWAYS_OFF,
        diags_INFO:         Diags.ALWAYS_OFF,
        diags_USER8:        Diags.ALWAYS_OFF,
        diags_ANALYSIS:     Diags.ALWAYS_OFF,
        fxntab:             true,
        gate:               null,
        gateParams:         null,
        instanceHeap:       null,
        instanceSection:    null,
        logger:             null,
        outPolicy:          Types.COMMON_FILE,
        memoryPolicy:       Types.DELETE_POLICY,
        namedInstance:      false,
        namedModule:        true,
        romPatchTable:      false,
    };

    /*! 
     *  ======== noRuntimeCommon$ ========
     *  Defaults inherited by the target modules that do not need the runtime
     *  support.
     *
     *  Modules for which the attribute `@NoRuntime` is set cannot use any
     *  functionality controlled by the parameters in their `common$`
     *  structures. For such modules, these parameters are set to the
     *  following values, and cannot be changed.  This ensures that
     *  `@NoRuntime` modules not used in situations where the normal
     *  module runtime features are required.
     */
    metaonly readonly config Types.Common$ noRuntimeCommon$ = {
        diags_ASSERT:       Diags.ALWAYS_OFF,
        diags_ENTRY:        Diags.ALWAYS_OFF,
        diags_EXIT:         Diags.ALWAYS_OFF,
        diags_INTERNAL:     Diags.ALWAYS_OFF,
        diags_LIFECYCLE:    Diags.ALWAYS_OFF,
        diags_STATUS:       Diags.ALWAYS_OFF,
        diags_USER1:        Diags.ALWAYS_OFF,
        diags_USER2:        Diags.ALWAYS_OFF,
        diags_USER3:        Diags.ALWAYS_OFF,
        diags_USER4:        Diags.ALWAYS_OFF,
        diags_USER5:        Diags.ALWAYS_OFF,
        diags_USER6:        Diags.ALWAYS_OFF,
        diags_USER7:        Diags.ALWAYS_OFF,
        diags_INFO:         Diags.ALWAYS_OFF,
        diags_USER8:        Diags.ALWAYS_OFF,
        diags_ANALYSIS:     Diags.ALWAYS_OFF,
        fxntab:             false,
        gate:               null,
        gateParams:         null,
        instanceHeap:       null,
        instanceSection:    null,
        logger:             null,
        outPolicy:          Types.COMMON_FILE,
        memoryPolicy:       Types.STATIC_POLICY,
        namedInstance:      false,
        namedModule:        false,
        romPatchTable:      false,
    };

    /*!
     *  ======== getCommon ========
     *  Get a specified common parameter from a module
     *
     *  Get the value of a member of the structure `common$` based on
     *  defaults and the current value of the parameter. If the current value
     *  of `param` is `undefined`, the function returns the default value
     *  for that parameter from `Default.common$`.
     *
     *  @param(eb)  module whose parameter is queried
     *
     *  @param(param)   string naming the queried parameter
     *
     *  @a(returns)
     *  Returns the value of the parameter named `param` from the module
     *  `mod`.
     */
    metaonly Any getCommon(IModule.Module mod, String param);
};
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


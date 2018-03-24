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
/*!
 *  ======== IInstance ========
 *  Common instance params
 *
 *  Every module's instance parameter structure contains a pointer to an
 *  `IInstance.Params` structure named `instance`.  So, every instance
 *  parameter defined in this interface may optionally be set when
 *  creating (or constructing) any module's instances.
 */
@DirectCall

interface IInstance {

instance:

    /*!
     *  ======== name ========
     *  Name of the instance
     *
     *  It is possible to "bind" a name to each instance of any module
     *  at the time the instance is created (or constructed).
     *  @p(code)
     *      ModA_Params params;
     *      ModA_Params_init(&params);
     *      params.instance->name = "myInstance";
     *      ModA_create(&params, NULL);
     *  @p
     *
     *  The name field must be assigned a pointer to a buffer that persists
     *  as long as the instance that it names exists.  Only a reference to
     *  the name is retained in the instance, the name is not copied to a
     *  secondary buffer.
     *
     *  The configuration parameters that controls if instance names are
     *  supported is `common$.namedInstance`. The parameter is a member of the
     *  structure `{@link xdc.runtime.Types#Common$ common$}`, available in 
     *  each module. By default, this parameter is set to `false`, which 
     *  disables support for instance names.
     *  Therefore, to enable instance names for a given module `Mod`, configure
     *  the module as follows in your configuration script:
     *  @p(code)
     *      var Mod = xdc.useModule('pkg.Mod');
     *      ModA.common$.namedInstance = true;
     *  @p
     *
     *  Here is how the static instances are given names at the configuration
     *  time:
     *  @p(code)
     *      var inst = Mod.create();
     *      inst.instance.name = "myInstance";
     *  @p
     *
     *  If instance names are enabled and used for statically created
     *  instances, the config parameter
     *  `{@link xdc.runtime.Text#isLoaded Text.isLoaded}` must be set to
     *  `true` to have these names available at runtime.
     *
     *  At runtime, assign your instance a name:
     *  @p(code)
     *      #include <package/name/Mod.h>
     *      Mod_Params params;
     *      Mod_Params_init(&params);
     *      params.instance->name = "myInstance";
     *      Mod_create(&params, NULL);
     *  @p
     *
     *  If instances have been configured to not support names, it is still
     *  possible to assign to the `instance.name` field of the parameter
     *  structure (as shown above).  However, the pointer is not retained
     *  and methods that normally return an instance's name will return
     *  `NULL` instead.
     */
    config CString name = null;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


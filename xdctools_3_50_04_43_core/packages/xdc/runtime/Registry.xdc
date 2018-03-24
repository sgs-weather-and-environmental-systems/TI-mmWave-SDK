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
 *  ======== Registry.xdc ========
 */

/*!
 *  ======== Registry ========
 *  Register modules that are not statically configured
 *
 *  This module provides a mechanism by which legacy C code can have its own
 *  module logging support, including having a name and its own diags mask.
 *
 *  Without the `Registry`, all logging done by legacy C code is handled by the
 *  `xdc.runtime.Main` module. This means that all `{@link Log}` events will
 *  be marked as coming from "`xdc.runtime.Main`", and there is only a single
 *  diagnostics mask for the runtime control of logging across all legacy C
 *  code. The `Registry` module allows legacy C code to have the same granular
 *  control over logging as statically defined RTSC modules.
 *
 *  To use the `Registry` module, legacy code must define the symbol
 *  `Registry_CURDESC` to be the name of an externally declared
 *  `Registery_Desc` structure.  This symbol must be defined before the
 *  inclusion of any `xdc/runtime` header files. If any `xdc/runtime` header
 *  files are included before the definition of this symbol, the `Registry`
 *  module may not function properly.
 *
 *  Note: by defining this symbol on the compile line, rather than in the
 *  file, one can easily compile code to be used in one of two environments:
 *  @p(nlist)
 *    - a fixed configuration environment where modules are registered
 *      via `{@link #addModule Registry_addModule()}`, or
 *
 *    - a "normal" configurable environment in which this code is
 *      assumed to be part of the `{@link Main}` module.
 *  @p
 *  The `Registry_Desc` structure must then be registered by calling
 *  `{@link #addModule Registry_addModule()}`. The structure is typically
 *  registered and initialized within `main()`.
 *
 *  For example:
 *
 *  @p(code)
 *  //Define the required symbol, Registry_CURDESC, to this file's 
 *  //Registry_Desc object
 *  #define Registry_CURDESC    mainDesc
 *  #include <xdc/runtime/Registry.h>
 *
 *  //Declare the Registry_Desc object, the name is unimportant
 *  Registry_Desc mainDesc;
 *
 *  Int main(Int argc, String argv[]) {  
 *
 *  //Register this file as a module "main"
 *  Registry_addModule(&mainDesc, "main");
 *  @p
 *
 *  Once registered, the legacy code may call `{@link Log}` APIs without any
 *  other change and the formatted `Log` events will show as coming from the
 *  registered modules. Also, the logging by the legacy code is now filtered
 *  by its own diagnostic mask. The bits of this mask can be set using
 *  `{@link Diags#setMask Diags_setMask}`.
 *
 *  Continuing the previous example:
 *  @p(code)
 *  //Initialize the legacy code's diags mask to enable USER1.
 *  Diags_setMask("main=1");
 *  @p
 *
 *  All events logged by registered modules will be sent to the logger
 *  configured for the `Registry` module. For example, to configure the
 *  logger for use by all modules managed by `Registry`:
 *  @p(code)
 *  Registry.common$.logger = LoggerBuf.create();
 *  @p
 *
 *  Since the registered modules are not known until runtime, it is not
 *  possible to statically configure the diagnostics masks for individual
 *  registered modules. However, it is possible to configure diagnostics
 *  categories to be permanently off or on for ALL registered modules. This
 *  is done by configuring the diagnostic mask for the `Registry` module.
 *  Diagnostic categories set to `{@link Diags#ALWAYS_OFF Diags.ALWAYS_OFF}`
 *  will be permanently off for all `Registry` modules. Categories set to
 *  `{@link Diags#ALWAYS_ON Diags.ALWAYS_ON}` will be permanently on for all
 *  modules managed by `Registry`.
 *
 *  In order to enable runtime configuration of individual `Registry` module
 *  masks, all relevant diagnostic categories must be set to
 *  `{@link Diags#RUNTIME_OFF Diags.RUNTIME_OFF}` or
 *  `{@link Diags#RUNTIME_ON Diags.RUNTIME_ON}` in the `Registry` module's
 *  mask.
 */
@CustomHeader
@DirectCall
module Registry
{
    /*!
     *  ======== RegisteredModuleView ========
     *  @_nodoc
     *  View element for the 'Registered Modules' ROV view.
     */
    metaonly struct RegisteredModuleView {
        String modName;
        Int id;
        String mask;
        Ptr descAddr;
    }

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config xdc.rov.ViewInfo.Instance rovViewInfo = 
        xdc.rov.ViewInfo.create({
            viewMap: [
                ['Registered Modules',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitRegisteredModules',
                        structName: 'RegisteredModuleView'
                    }
                ]
            ]
        });

    /*!
     *  ======== Result ========
     *  Status codes
     */
    enum Result {
        SUCCESS,        /*! The module was added successfully */
        ALLOC_FAILED,   /*! reserved */
        ALREADY_ADDED,  /*! The module has already been added or another
                         *  module with the same name is present
                         */
        ALL_IDS_USED    /*! No more module ids available for new modules */
    };

    /*!
     *  ======== RegDesc ========
     *  Registry module descriptor
     */
    typedef Types.RegDesc Desc;

    /*!
     *  ======== addModule ========
     *  Add a runtime module to the registry with the specified name
     *
     *  The `desc` parameter and the `modName` string provided must both be 
     *  permanent since the `Registry` will maintain references to both of
     *  these.
     *
     *  @param(desc)    non-`NULL` pointer to a `{#Desc Registry_Desc}`
     *                  structure.
     *  @param(modName) non-`NULL` string name of the module being registered.
     *
     *  @a(returns)
     *  `Registry_addModule` returns one of the following
     *  `{@link #Result Result}` status values indicating success or the
     *  cause of failure:
     *  @p(blist)
     *  - `{@link #SUCCESS SUCCESS}`
     *  - `{@link #ALREADY_ADDED ALREADY_ADDED}`
     *  - `{@link #ALL_IDS_USED ALL_IDS_USED}`  There are a total of 16,384 - 1
     *    module ids available for use by `Registry`.
     *  @p
     */
    Result addModule(Desc *desc, CString modName);

    /*!
     *  ======== findByName ========
     *  Find the registered module with the given name
     *
     *  @param(modName) non-`NULL` string name of a registered module
     *
     *  @a(returns)
     *  If the name `modName` is registered via
     *  `{@link #addModule Registry_addModule()}`, this function
     *  returns the pointer to the registered `Registry_Desc` structure;
     *  otherwise it returns `NULL`.
     */
    Desc *findByName(CString modName);

    /*!
     *  ======== findByNamePattern ========
     *  @_nodoc
     *  Find all registered modules matching the specified pattern.
     *
     *  This API is intended for use by Diags_setMask.
     *
     *  The name pattern can be an exact module name or it can contain '%'
     *  as a wildcard. The `len` parameter is the string length of the pattern.
     *
     *  This function returns one module at a time, but can be called
     *  repeatedly to find all modules matching the pattern. On the first
     *  call, pass `NULL` as the `prev` parameter. In all following calls,
     *  pass the last returned descriptor. This function returns `NULL` when
     *  it can't find any more modules matching the name pattern.
     */
    Desc *findByNamePattern(CString namePat, Int len, Desc *prev);

    /*!
     *  ======== findById ========
     *  Find registered module's descriptor from its module ID
     *
     *  @param(mid) any module id
     *
     *  @a(returns)
     *  If the ID `mid` is registered via
     *  `{@link #addModule Registry_addModule()}`, this function
     *  returns the pointer to the registered `Registry_Desc` structure;
     *  otherwise it returns `NULL`.
     */
    Desc *findById(Types.ModuleId mid);

    /*!
     *  ======== getMask ========
     *  Get the specified module's diagnostic mask
     *
     *  @param(modName) non-`NULL` string name of a registered module
     *  @param(mask)    non-`NULL` pointer to a mask to be initialized
     *                  to the the current state of the diagnostics mask
     *                  associated with `modName`
     *
     *  @a(returns)
     *  The function returns `TRUE` if `name` identifies a registered module;
     *  otherwise, it return `FALSE`.
     */
    Bool getMask(CString name, Types.DiagsMask *mask);

    /*!
     *  ======== isMember ========
     *  Determines if the specified module ID belongs to a registered module
     *
     *  @param(mid) any module id
     *
     *  @a(returns)
     *  This function returns `TRUE` if and only if the specified module id
     *  is a valid `Registry` module id. It does not search registered
     *  module ids, but simply checks if the id is within the range of valid
     *  `Registry` module ids.
     */
    Bool isMember(Types.ModuleId mid);
    
    /*!
     *  ======== getNextModule ========
     *  Scan the current list of registered modules
     *
     *  This function used to scan the list of all `Registry_Desc` structures
     *  currently being managed by the `Registry` module.
     *
     *  @param(desc)    optionally `NULL` pointer to a `Registry_Desc`
     *                  structure.  If `desc` is `NULL`, a pointer to the
     *                  first structure is returned.  If `desc` is non-`NULL`
     *                  and equal to a previous return value of this function,
     *                  a pointer to the "next" `Registry_Desc` structure
     *                  is returned.
     *
     *  @a(returns)
     *  This function returns a non-`NULL` pointer to one of the
     *  `Registry_Desc` structures added via `Registry_Desc` structures or
     *  `NULL` in the case that
     *  @p(blist)
     *      - there are no more module's in the list after `desc`, or
     *      - there are no modules registered
     *  @p
     */
    Desc *getNextModule(Desc *desc);
    
    /*!
     *  ======== getModuleName ========
     *  Get the module name associated with a specified module descriptor
     *
     *  @param(desc)    non-`NULL` pointer to a `{#Desc Registry_Desc}`
     *                  structure.
     *
     *  @a(returns)
     *  If the specified module descriptor has been initialized via a
     *  successful call to `{@link #addModule Registry_addModule()}`, this
     *  function returns the module name passed `Registry_addModule()`;
     *  otherwise, its return value is indeterminate.
     */
    CString getModuleName(Desc *desc);
    
    /*!
     *  ======== getModuleId ========
     *  Get the module id associated with a specified module descriptor
     *
     *  @param(desc)    non-`NULL` pointer to a `{#Desc Registry_Desc}`
     *                  structure.
     *
     *  @a(returns)
     *  If the specified module descriptor has been initialized via a
     *  successful call to `{@link #addModule Registry_addModule()}`, this
     *  function returns the module id assigned by `Registry_addModule()`;
     *  otherwise, its return value is indeterminate.
     */
    Types.ModuleId getModuleId(Desc *desc);
    
internal:
    
    Desc *findByNameInList(CString name, Desc *listHead);
    Void newModule(Desc *desc, CString modName);
    Bool matchPattern(CString pattern, Int len, CString modName);
    
    /* Functions for accessing the Registry at ROV-time. */
    function isMemberRov(modId);
    function lookupModIdRov(modId);
    
    /*
     *  ======== Module_State ========
     */
    struct Module_State {
        Desc            *listHead;
        Types.ModuleId  curId;
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


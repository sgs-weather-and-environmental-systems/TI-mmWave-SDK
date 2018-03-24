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
 *  ======== IModule.xdc ========
 */

/*!
 *  ======== IModule ========
 *  Base interface for all modules 
 *
 *  All modules share a common set of configuration parameters and methods.
 *
 *  @a(internal)
 *  This section provides a terse summary of the methods provided by every
 *  module for use within the module's implementation.  Each method's
 *  prototype is shown along with a brief summary of its behavior.
 *  These methods are declared in the module's internal header which should
 *  always be included in any file referencing these functions.  For a
 *  module named `Mod` the following statement includes this header.
 *  @p(code)
 *      #include "package/internal/Mod.xdc.h"
 *  @p
 *
 *  In the prototypes below, `Mod` refers to the module being implemented,
 *  `embeddedObj` is the name of field in the module's state structure that
 *  is either an embedded object field or an array of such objects, and
 *  `fld` is the name of a field declared in the module's state structure.
 *
 *  @p(code)
 *  // enter the module's gate
 *  IArg Mod_Module_enter(Gate_Handle gate);
 *
 *  // leave the module's gate
 *  Mod_Module_leave(Gate_Handle, IArg);
 *
 *  // return a pointer to the embeddedObj field
 *  Ptr Mod_Module_State_embeddedObj();
 *
 *  // the value of the fld field of the module's state structure
 *  Mod_module->fld;    // fld is declared in module's .xdc file
 *  @p
 *
 *  @a(external)
 *  This section provides a terse summary of the methods provided by every
 *  module for use by an application or other modules.  Each method's
 *  prototype is shown along with a brief summary of its behavior.
 *  These methods are declared in the module's header which should always
 *  be included in any file referencing these functions.  For a module named
 *  `Mod` in the package named `a.b.c`, the following statement includes this
 *  header.
 *  @p(code)
 *      #include <a/b/c/Mod.h>
 *  @p
 *
 *  In the prototypes below, `IMod` referes to some interface, `Mod` refers to
 *  a module that (optionally) inherits from `IMod`, and `pkgName` is the
 *  name of the package containing the interface `IMod`.
 *  @p(code)
 *
 *  // methods to operate on modules
 *
 *      // return heap associated with this module
 *      IHeap_Handle Mod_Module_heap();
 *
 *      // get Mod's module ID
 *      Types_ModuleId Mod_Module_id();
 *
 *      // return TRUE if Mod's startup is complete
 *      Bool Mod_Module_startupDone();
 *
 *      // type-safe conversion from an interface to an inheriting module
 *      // Returns NULL if the conversion is not valid
 *      Mod_Handle Mod_Handle_downCast(IMod_Handle handle);
 *
 *      // type-safe conversion from a module to an interface it inherits from
 *      // Returns NULL if the conversion is not valid
 *      IMod_Handle Mod_Handle_upCast(Mod_Module_Handle handle);
 *
 *  // methods to access the instances managed by Mod
 *
 *      // return heap used to create instances
 *      IHeap_Handle Mod_Object_heap();
 *
 *      // return count of static instances
 *      Int Mod_Object_count();
 *
 *      // get the i'th instance object of an array of instance objects
 *      //
 *      // If the array reference is NULL, get the i'th statically created
 *      // instance object.
 *      Mod_Object *Mod_Object_get(Mod_Object *array, Int i);
 *
 *      // get the first "live" runtime instance
 *      Mod_Object *Mod_Object_first();
 *
 *      // get the next "live" runtime instance
 *      Mod_Object *Mod_Object_next(Mod_Object *obj);
 *
 *  // methods that operate on instance handles
 *
 *      // fill in buf structure with instance's label info, returns buf
 *      Types_Label *Mod_Handle_label(Mod_Handle inst, Types_Label *buf);
 *
 *      // returns name of the instance inst, if it has one (otherwise NULL)
 *      String Mod_Handle_name(Mod_Handle inst);
 *
 *      // type-safe conversion of module handle to interface handle
 *      // Returns NULL if the conversion is not valid
 *      IMod_Handle Mod_Handle_to_pkgName_IMod(Mod_Handle inst);
 *
 *      // type-safe conversion of interface handle to module handle
 *      // Returns NULL if the conversion is not valid
 *      Mod_Handle Mod_Handle_from_pkgName_IMod(IMod_Handle inst);
 *
 *      // get the module that created the handle
 *      Mod_Module Mod_Handle_to_Module(Mod_Handle inst);
 *  @p
 */
interface IModule {

    /*!
     *  ======== common$ ========
     *  Common module configuration parameters
     *
     *  All modules have this configuration parameter.  Its name
     *  contains the '$' character to ensure it does not conflict with
     *  configuration parameters declared by the module.  This allows
     *  new configuration parameters to be added in the future without
     *  any chance of breaking existing modules.
     */
    metaonly config Types.Common$ common$;

    /*!
     *  ======== viewNameMap$ ========
     *  Specifies the ROV views for the module.
     *  @_nodoc
     *
     *  Maps the view name to the RovView descriptor.
     */
    metaonly config Types.ViewInfo viewNameMap$[string];

    /*!
     *  ======== rovShowRawTab$ ========
     *  @_nodoc
     */
    metaonly config Bool rovShowRawTab$ = true;

    /*!
     *  ======== configNameMap$ ========
     *  @_nodoc
     */
    metaonly readonly config Types.ViewInfo configNameMap$[string] = [
        ["xdc.runtime/Memory", {viewType: "module", fields: [
            "common$.instanceHeap", "common$.instanceSection",
            "common$.memoryPolicy",
            "common$.namedModule", "common$.namedInstance",
            "common$.fxntab", "common$.romPatchTable"
        ]}],
        ["xdc.runtime/Diagnostics", {viewType: "module", fields: [
            "common$.logger",
            "common$.diags_ASSERT", "common$.diags_ENTRY",
            "common$.diags_EXIT", "common$.diags_INTERNAL",
            "common$.diags_LIFECYCLE", 
            "common$.diags_STATUS",
            "common$.diags_USER1",
            "common$.diags_USER2", "common$.diags_USER3",
            "common$.diags_USER4", "common$.diags_USER5",
            "common$.diags_USER6", "common$.diags_INFO",
            "common$.diags_ANALYSIS"
        ]}],
        ["xdc.runtime/Concurrency", {viewType: "module", fields: [
            "common$.gate", "common$.gateParams"
        ]}],
        ["xdc.runtime/Log Events", {viewType: "module", fields: [
            "Log.Event"]}],
        ["xdc.runtime/Log Events", {viewType: "instance", fields: [
            "Log.Event"]}],
        ["xdc.runtime/Asserts", {viewType: "module", fields: [
            "Assert.Id"]}],
        ["xdc.runtime/Asserts", {viewType: "instance", fields: [
            "Assert.Id"]}],
        ["xdc.runtime/Errors", {viewType: "module", fields: [
            "Error.Id"]}],
        ["xdc.runtime/Errors", {viewType: "instance", fields: [
            "Error.Id"]}],
    ];

    /*! @_nodoc */
    @System config Bits32 Module__diagsEnabled = 0;
    /*! @_nodoc */
    @System config Bits32 Module__diagsIncluded = 0;
    /*! @_nodoc */
    @System config Bits16* Module__diagsMask = null;

    /*! @_nodoc */
    @System config Ptr Module__gateObj = null;
    /*! @_nodoc */
    @System config Ptr Module__gatePrms = null;

    /*! @_nodoc */
    @System config Types.ModuleId Module__id = 0;

    /*! @_nodoc */
    @System config Bool Module__loggerDefined = false;
    /*! @_nodoc */
    @System config Ptr Module__loggerObj = null;
    /*! @_nodoc */
    @System config Types.LoggerFxn0 Module__loggerFxn0 = null;
    /*! @_nodoc */
    @System config Types.LoggerFxn1 Module__loggerFxn1 = null;
    /*! @_nodoc */
    @System config Types.LoggerFxn2 Module__loggerFxn2 = null;
    /*! @_nodoc */
    @System config Types.LoggerFxn4 Module__loggerFxn4 = null;
    /*! @_nodoc */
    @System config Types.LoggerFxn8 Module__loggerFxn8 = null;

    /*! @_nodoc */
    @System config Int Object__count = 0;
    /*! @_nodoc */
    @System config IHeap.Handle Object__heap = null;
    /*! @_nodoc */
    @System config SizeT Object__sizeof = 0;
    /*! @_nodoc */
    @System config Ptr Object__table = null;

    /*!
     *  ======== Handle__label ========
     *  Initialize a `Types.Label` from an instance handle
     *  @_nodoc
     *
     *  @param(obj) input instance handle
     *  @param(lab) pointer to `Label` struct to initialize from `obj`
     */
    @System Types.Label *Handle__label(Ptr obj, Types.Label *lab);

    /*! @_nodoc */
    @System Bool Module__startupDone();

    /*! @_nodoc
     *      __aa  - address of "required" create args structure
     *      __pa  - address of instance parameter structure
     *      __psz - sizeof of parameter structure
     *      __eb  - error block pointer
     *
     *  Currently, we keep Object__create and Object__delete because these are
     *  the functions used in virtual tables. All Object__create functions have
     *  the same signature so we can use SysFxns2 to define a type for virtual
     *  tables instead of using a different type for each module. we could
     *  delete these two functions.
     */
    //490928 @System Ptr Object__create(CPtr __aa,
    @System Ptr Object__create(CPtr __aa, const UChar *__pa, SizeT __psz,
                               Error.Block *__eb);

    /*! @_nodoc */
    @System Void Object__delete(Ptr instp);

    /*! @_nodoc */
    @System Ptr Object__get(Ptr oarr, Int i);

    /*!
     *  ======== Object__first ========
     *  Return the first member of a list of dynamically created instances
     *  @_nodoc
     *
     *  @a(warning) The methods `first()` and `next()` are not thread-safe.
     *              The caller must ensure that no instances are removed or
     *              added while the list is being traversed.
     *
     *  @a(returns)
     *  Returns a handle to a first instance or `NULL` if there are no
     *  instances in the list.
     */
    @System Ptr Object__first();

    /*!
     *  ======== Object__next ========
     *  Return the next instance from the list of dynamically created instances
     *  @_nodoc
     *
     *  @param(obj) handle to a dynamically created instance
     *
     *  @a(returns)
     *  Returns a handle to a first instance or `NULL` if there are no
     *  instances in the list
     */
    @System Ptr Object__next(Ptr obj);

    /*! @_nodoc */
    @System Void Params__init(Ptr dst, const void *src, SizeT psz, SizeT isz);

    /*! @_nodoc */
    @System Bool Proxy__abstract();

    /*! @_nodoc */
    //490928 @System CPtr Proxy__delegate();
    @System CPtr Proxy__delegate();
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


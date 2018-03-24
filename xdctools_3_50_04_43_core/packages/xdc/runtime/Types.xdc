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
 *  ======== Types.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Types ========
 *  Basic constants and types
 *
 *  This module defines basic constants and types used throughout the
 *  `xdc.runtime` package and, in some cases, in every module.
 *
 *  The `{@link #Common$ Common$}` structure defined by the `Types` module
 *  is available for (or common to) all modules. Every field of the
 *  `Common$` structure is a configuration parameter that may be set within
 *  a configuration script for any module (not just the
 *  `xdc.runtime` modules). The fields of this structure are typically read
 *  by the modules in the `xdc.runtime` package at configuration time to
 *  control the generation of data structures that are embedded in the
 *  application and referenced by these modules at runtime.
 *
 *  Every module has a configuration parameter named
 *  `{@link #common$ common$}` that is of type `Common$`. This allows the user
 *  of any module to control the module's diagnostics, where its instances
 *  are allocated, how they are allocated, and (for gated modules) what
 *  gate it should use to protect critical sections.
 *
 *  @a(Examples)
 *  Configuration example: The following configuration script specifies
 *  that the instance objects managed by the `Memory` module in the
 *  `xdc.runtime` package should be placed in the ".fast" memory section
 *  and that `ENTRY` diagnostics should be available at runtime.
 *
 *  @p(code)
 *      var Memory = xdc.useModule('xdc.runtime.Memory");
 *      Memory.common$.instanceSection = ".fast";
 *      Memory.common$.diags_ENTRY = Diags.RUNTIME_OFF
 *  @p
 *
 *  Note that by setting `Memory.common$.diags_ENTRY` to `Diags.RUNTIME_OFF`
 *  we are both enabling `ENTRY` events and specifying that they are initially
 *  disabled; they must be explicitly enabled at runtime. See the
 *  `{@link Diags}` modules for additional information.
 */

@CustomHeader

module Types {

    /*!
     *  ======== ModuleId ========
     *  Unique module identifier
     *
     *  Module IDs are assigned at configuration time based in the set
     *  of modules that are "used" in the application.  So, although each
     *  module has a unique 16-bit ID at runtime this ID may vary between
     *  configurations of the application.
     *
     *  To save precious data space, module names are managed by the
     *  `{@link Text}` module and it is this table that is used to assign
     *  module IDs.  If the table is maintained on the target, the module ID
     *  is an "index" into this table; otherwise, the module ID is simply
     *  a unique integer less than the total number of modules in the
     *  application.
     *
     *  Although module IDs are not independent of an application's
     *  configuration, a module's ID may be compared to a runtime value
     *  symbolically.  Every module has a (generated) method that returns
     *  the module's ID; e.g., a module named `Task` has a method named
     *  `Task_Module_id()` which returns `Task`'s module ID.
     *
     *  @p(code)
     *      #include <xdc/runtime/Types.h>
     *      #include <ti/sysbios/knl/Task.h>
     *         :
     *      void checkId(Types_ModuleId modId) {
     *          if (Task_Module_id() == modId) {
     *              System_printf("Task module");
     *          }
     *      }
     *  @p
     */
    typedef Bits16 ModuleId;

    typedef Bits16 DiagsMask;

    /*!
     *  ======== Event ========
     *  `{@link ILogger}` event encoding
     *
     *  Whereas a `{@link Log#Event}` encodes an event ID and a mask, a
     *  `Types_Event` encodes the same event ID and the module ID of the
     *  module containing the call site that generated the `Types_Event`.
     */
    typedef Bits32 Event;

    /*!
     *  ======== getEventId ========
     *  Get event ID of the specified event
     *
     *  This method is used to get an ID that can be compared to other
     *  "known" IDs.  For example, after a `{@link #Event Types_Event}` is
     *  generated, the following code determines if the event
     *  corresponds to a `{@link Log#L_create}` event:
     *  @p(code)
     *      Bool isCreateEvent(Types_Event evt) {
     *          return (Log_getEventId(Log_L_create) == Types_getEventId(evt));
     *      }
     *  @p
     *
     *  @param(evt) an event created via `{@link #makeEvent}`
     *
     *  @a(returns) This function returns the event ID of a specified event.
     */
    @Macro RopeId getEventId(Event evt);

    /*!
     *  ======== getModuleId ========
     *  Get the module ID for the specified event
     *
     *  @param(evt) an event created via `{@link #makeEvent}`
     *
     *  @a(returns) This function returns the module ID of a specified event.
     */
    @Macro ModuleId getModuleId(Event evt);

    /*!
     *  ======== makeEvent ========
     *  Make an Event from an Event ID and a module ID
     *
     *  @param(id)          ID of the event itself
     *  @param(callSite)    the module from which this event originated
     *
     *  @a(returns) This function returns an event.
     */
    @Macro Event makeEvent(RopeId id, ModuleId callSite);

    /*!
     *  ======== EventId ========
     *  @_nodoc
     *
     *  Deprecated name for `Types.Event`; ids are often encoded as a field
     *  in the event itself.
     */
    typedef Event EventId;

    /*! @_nodoc */
    struct CordAddr__;

    /*! @_nodoc */
    typedef CordAddr__ *CordAddr;

    /*! @_nodoc */
    struct GateRef__;

    /*! @_nodoc */
    typedef GateRef__ *GateRef;

    /*! @_nodoc */
    typedef Bits16 RopeId;

    /*!
     *  ======== CreatePolicy ========
     *  Instance creation policy
     */
    enum CreatePolicy {
        STATIC_POLICY,  /*! static creation only; no runtime create/delete */
        CREATE_POLICY,  /*! dynamic creation, but no deletion */
        DELETE_POLICY   /*! dynamic creation and deletion */
    };

    /*!
     *  ======== OutputPolicy ========
     *  Destination file for module's functions
     */
    enum OutputPolicy {
        COMMON_FILE,    /*! functions are in the common C file */
        SEPARATE_FILE,  /*! module has its own separate file */
        NO_FILE         /*! functions are not generated */
    };

    /*!
     *  ======== Label ========
     *  Instance label struct
     *
     *  Label structures are used to provide human readable names for
     *  instance handles.
     *
     *  It is possible to initialize a `Label` from any instance handle.  All
     *  modules that support instances provide a method named
     *  `Mod_Handle_label()` which, given an instance handle and a pointer to
     *  a `Label` structure, initializes the structure with all available
     *  information.  For example, the following code fragment initializes a
     *  `Label` from an instance of the `HeapMin` module.
     *  @p(code)
     *      HeapMin_Handle heap;
     *      Types_Label label;
     *      HeapMin_Handle_label(heap, &label);
     *  @p
     *
     *  Unless you explicitly disable it, `{@link System#printf System_printf}`
     *  can be used to convert a pointer to a `Label` into an human readable
     *  "instance name".  Continuing with the example above, the following
     *  line can be used to print an instance's label.
     *  @p(code)
     *      System_printf("heap instance name: %$L\n", &label);
     *  @p
     *
     *  @see System#printf, System#extendedFormats
     *  @see Text#putLabel
     */
    struct Label {
        Ptr handle;         /*! instance object address */
        ModuleId modId;     /*! corresponding module id */
        String iname;       /*! name supplied during instance creation */
        Bool named;         /*! true, if `iname` is available */
    };

    /*!
     *  ======== Site ========
     *  Error site description struct
     *
     *  This structure describes the location of the line that raised
     *  an error.
     *
     *  @field(mod) the module id of the module containing the call site
     *  @field(file) the name of the file containing the call site or `NULL`;
     *               some call sites omit the file name to save data space.
     *  @field(line) the line number within the file named
     */
    struct Site {
        ModuleId mod;   /*! module id of this site */
        CString file;   /*! filename of this site */
        Int line;       /*! line number of this site */
    };

    /*!
     *  ======== Timestamp64 ========
     *  64-bit timestamp struct
     *
     *  Some platforms only support 32-bit timestamps.  In this case,
     *  the most significant 32-bits are always set to 0.
     */
    struct Timestamp64 {
        Bits32 hi;      /*! most significant 32-bits of timestamp */
        Bits32 lo;      /*! least significant 32-bits of timestamp */
    };

    /*! 
     *  ======== FreqHz ========
     *  Frequency-in-hertz struct
     */
    struct FreqHz {
        Bits32 hi;      /*! most significant 32-bits of frequency */
        Bits32 lo;      /*! least significant 32-bits of frequency */
    };

    /*!
     *  ======== RegDesc ========
     *  Registry module descriptor
     */
    struct RegDesc {
        RegDesc         *next;
        CString         modName;
        Types.ModuleId  id;
        DiagsMask       mask;
    };

    /*!
     *  ======== Common$ ========
     *  Common module config struct
     *
     *  Every module contains this structure during the configuration
     *  phase. The fields of this structure are set in configuration scripts
     *  and referenced by the modules in the `xdc.runtime` package. For default
     *  values of these fields, see `{@link Defaults}`.
     *
     *  @field(diags_ASSERT) The `{@link Diags#ASSERT}` bit of a module's
     *  diagnostics mask.
     *
     *  @field(diags_ENTRY) The `{@link Diags#ENTRY}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_EXIT) The `{@link Diags#EXIT}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_INTERNAL) The `{@link Diags#INTERNAL}` bit of a module's
     *  diagnostics mask.
     *
     *  @field(diags_LIFECYCLE) The `{@link Diags#LIFECYCLE}` category of a
     *  module's diagnostics mask.
     *
     *  @field(diags_STATUS) The `{@link Diags#STATUS}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER1) The `{@link Diags#USER1}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER2) The `{@link Diags#USER2}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER3) The `{@link Diags#USER3}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER4) The `{@link Diags#USER4}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER5) The `{@link Diags#USER5}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER6) The `{@link Diags#USER6}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER7) The `{@link Diags#USER7}` category of a module's
     *  diagnostics mask. The bit for this category has been repurposed for the
     *  `{@link Diags#INFO}` category, so the use of USER7 has been deprecated.
     *
     *  @field(diags_INFO) The `{@link Diags#INFO}` category of a module's
     *  diagnostics mask.
     *
     *  @field(diags_USER8) The `{@link Diags#USER8}` category of a module's
     *  diagnostics mask. The bit for this category has been repurposed for the
     *  `{@link Diags#ANALYSIS}` category, so the use of USER8 has been
     *  deprecated.
     *
     *  @field(diags_ANALYSIS) The `{@link Diags#ANALYSIS}` category of a
     *  module's diagnostics mask.
     *
     *  @field(fxntab)
     *  This configuration parameter is only applicable to modules that
     *  inherit an interface and have instance objects.  Setting `fxntab`
     *  to `false` can save some data space but also prevents the
     *  application from using instance objects through abstract interfaces.
     *
     *  Function tables are used whenever it's necessary to call a module's
     *  methods via an abstract interface; e.g., the `{@link Memory}` module
     *  calls methods defined by the `{@link IHeap}` interface but there may
     *  be several distinct modules that implement this interface.  In order
     *  for this type of call to be possible, instance objects contain a
     *  reference to a function table containing the instance module's
     *  functions; the caller gets the module's function from the instance
     *  object and calls through a function pointer.  Every module that
     *  inherits an interface has such a table and modules that do not
     *  inherit an interface do not have a function table.
     *
     *  If this configuration parameter is set to `false`, the module's
     *  instance objects will NOT be initialized with a reference to their
     *  module's function table and, since the function table will not
     *  be referenced by the application, the resulting executable will be
     *  smaller.  However, if this parameter is `false` you must never
     *  attempt to use this module's instance objects via reference this
     *  module through an abstract interface.  Since this is often hard to
     *  determine, especially as an application evolves over time, you should
     *  only set this parameter to `false` when you are absolutely sure that
     *  the module's functions are always only being directly called and you
     *  need to absolutely minimize the data footprint of your application.
     *
     *  The default for this parameter is `true`.
     *
     *  @field(gate) A handle to the module-level `{@link IGateProvider}`
     *  instance to be used when this module calls functions from
     *  `{@link Gate}`
     *
     *  @field(gateParams) `Gate` parameters used by this module to create
     *  the gates used when this module calls 
     *  `{@link Gate#allocInstance() Gate_allocInstance}`
     *
     *  @field(instanceHeap) Identifies the heap from which this module
     *  should allocate memory.
     *
     *  @field(instanceSection) Identifies the section in which instances
     *  created by this module should be placed.
     *
     *  @field(logger) The handle of the logger instance used by the module.
     *  All log events generated by the module are routed to this logger
     *  instance. See `{@link ILogger}` for details on the logger interface.
     *  See `{@link LoggerBuf}` and `{@link LoggerSys}` for two examples of 
     *  logger modules provided by the `{@link xdc.runtime}` package.
     *
     *  @field(memoryPolicy) Specifies whether this module should allow
     *  static object creation only (`{@link #CreatePolicy STATIC_POLICY}`),
     *  dynamic object creation but not deletion
     *  (`{@link #CreatePolicy CREATE_POLICY}`), or both dynamic object
     *  creation and deletion (`{@link #CreatePolicy DELETE_POLICY}`).
     *
     *  @field(namedInstance) If set to `true`, each instance object is
     *  given an additional field to hold a string name that is used
     *  when displaying information about an instance. Setting this to
     *  `true` increases the size of the module's instance objects by a
     *  single word but improves the usability of tools that display
     *  instance objects.  If set to `false`, assignments of instance
     *  names are silently ignored.  This allows one to remove instance
     *  name support to save space without having to change any source code.
     *  See `{@link xdc.runtime.IInstance#name IInstance.name}` for details.
     *
     *  @field(namedModule) If set to `true`, this module's string name
     *  is retained on the target so that it can be displayed as part
     *  of `{@link Log}` and `{@link Error}` events. Setting this to `false`
     *  saves data space in the application at the expense of readability
     *  of log and error messages associated with this module.
     *
     *  Note: setting this to `false` also prevents one from controlling the
     *  module's diagnostics at runtime via `{@link Diags#setMask()}`.
     *  This method uses the module's name to lookup the module's
     *  diagnostics mask.  It is still possible to control the module's
     *  diagnostics at design-time from a configuration script.
     *
     *  @see Diags, Defaults
     */
    metaonly struct Common$ {
        Diags.Mode diags_ASSERT;    /*! module's Diags assert mode */
        Diags.Mode diags_ENTRY;     /*! module's function entry Diags mode */
        Diags.Mode diags_EXIT;      /*! module's function exit Diags mode */
        Diags.Mode diags_INTERNAL;  /*! module's internal assert mode */
        Diags.Mode diags_LIFECYCLE; /*! module's instance lifecycle mode */
        Diags.Mode diags_STATUS;    /*! module's errors and warnings */
        Diags.Mode diags_USER1;     /*! module's user1 Diags mode */
        Diags.Mode diags_USER2;     /*! module's user2 Diags mode */
        Diags.Mode diags_USER3;     /*! module's user3 Diags mode */
        Diags.Mode diags_USER4;     /*! module's user4 Diags mode */
        Diags.Mode diags_USER5;     /*! module's user5 Diags mode */
        Diags.Mode diags_USER6;     /*! module's user6 Diags mode */
        Diags.Mode diags_USER7;     /*! module's user7 Diags mode */
        Diags.Mode diags_INFO;      /*! module's informational event mode */
        Diags.Mode diags_USER8;     /*! module's user8 Diags mode */
        Diags.Mode diags_ANALYSIS;  /*! module's Diags analysis mode */
        Bool fxntab;                /*! @_nodoc enable function tables */
        IGateProvider.Handle gate;  /*! module's gate */
        Ptr gateParams;             /*! gate params for module created gates */
        IHeap.Handle instanceHeap;  /*! module's instance heap */
        String instanceSection;     /*! memory section for module's instances*/
        ILogger.Handle logger;      /*! module's logger */
        OutputPolicy outPolicy;     /*! destination file for module's code */
        CreatePolicy memoryPolicy;  /*! module's memory policy */
        Bool namedInstance;         /*! true => instances have string names */
        Bool namedModule;           /*! true => module's name is on target */
        Bool romPatchTable;         /*! @_nodoc */
    }

    /*!
     *  ======== RtaDecoderData ========
     *  @_nodoc
     *
     *  loggers
     *    name - Used to identify the logger in GUI
     *    bufferSym - For stop-mode; symbol at which the logger's entry
     *                buffer can be found
     *    bufferLen - For stop-mode; length of the logger's entry buffer in
     *                MAUs
     */
    @XmlDtd metaonly struct RtaDecoderData {
        String targetName;
        String binaryParser;
        String endian;
        Int bitsPerChar;
        Int argSize;
        Int eventSize;
        String dataTransportClassName;
        String controlTransportClassName;
        struct {
            String name;
            String type;
            Any metaArgs;
        } loggers[ ];
        struct {
            Int id;
            String logger;
            String diagsMask;
        } modMap[string];
        struct {
            Int id;
            String msg;
        } evtMap[string];
    };

    /*!
     *  ======== ViewInfo ========
     *  @_nodoc
     *  XGconf view descriptor.
     */
    metaonly struct ViewInfo {
        String viewType;
        String viewFxn;
        String fields[];
    }

internal:

    typedef Bits32 LogEvent;

    typedef Void (*LoggerFxn0)(Ptr, LogEvent, ModuleId);
    typedef Void (*LoggerFxn1)(Ptr, LogEvent, ModuleId, IArg);
    typedef Void (*LoggerFxn2)(Ptr, LogEvent, ModuleId, IArg, IArg);
    typedef Void (*LoggerFxn4)(Ptr, LogEvent, ModuleId, IArg, IArg, IArg, IArg);
    typedef Void (*LoggerFxn8)(Ptr, LogEvent, ModuleId, IArg, IArg, IArg, IArg,
                               IArg, IArg, IArg, IArg);

    struct Vec {
        Int len;
        Ptr arr;
    };

    /*
     *  ======== Link ========
     *  Link used to maintain atomic linked lists
     */
    struct Link {
        Link *next;
        Link *prev;
    };

    /*
     *  ======== InstHdr ========
     *  Header for all runtime created instance objects
     */
    struct InstHdr {
        Link link;
    }

    /*
     *  ======== PrmsHdr ========
     *  Header for all _Params structures
     */
    struct PrmsHdr {
        SizeT size;     /* size of the entire parameter structure */
        Ptr self;       /* pointer to self; used to check params are init'd */
        Ptr modFxns;
        Ptr instPrms;
    }

    /*
     *  ======== Base ========
     *  Header for all module vtables
     */
    struct Base {
        const Base *base;     /* points to inherited interface base */
    }

    /*
     *  ======== SysFxns2 ========
     *  System data embedded in module's vtable
     */
    struct SysFxns2 {

        /*
         *  ======== __create ========
         *  Signature of configuration generated module instance constructor
         *
         *  This function calls Core_createObject().
         *
         *  Params:
         *      CPtr          - pointer to struct of required create args
         *      const UChar * - pointer to struct of default create parameters
         *      SizeT         - size of default params structure
         *      Error_Block * - caller's error block pointer
         */
        Ptr (*__create)(CPtr, const UChar *, SizeT, Error.Block *);
        // 490928 Ptr (*__create)(CPtr, const UChar *, SizeT, Error.Block *);

        Void (*__delete)(Ptr);
        Label *(*__label)(Ptr, Label *);
        ModuleId __mid;
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


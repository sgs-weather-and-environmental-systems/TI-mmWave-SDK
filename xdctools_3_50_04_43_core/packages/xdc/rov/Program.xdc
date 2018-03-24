/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/*!
 *  ======== Program ========
 *  Root object for the ROV model
 *
 *  This module is the main access point for all ROV operations.
 *  The Program APIs are used to retrieve the views for the
 *  requested modules.
 */
metaonly module Program {

    /*!
     *  ======== FetchDesc ========
     *  Description of data to fetch
     *
     *  A FetchDesc object is required as the first argument of the
     *  `{@link #fetchStruct}` and `{@link #fetchArray}` methods.
     *  The FetchDesc tells ROV the type of the data to be
     *  fetched so it knows how much data to read and how to decode it.
     *
     *  Every reference-type field in a state structure has a FetchDesc
     *  generated for it, with the name `<field name>$fetchDesc`.
     *
     *  For example, the instance structure
     *  @p(code)
     *      struct Instance_State {
     *          Char stack[];
     *      ];
     *  @p
     *  will have defined `obj.stack$fetchDesc`, which can be used to fetch
     *  the array:
     *  @p(code)
     *      var data = Program.fetchArray(obj.stack$fetchDesc, obj.stack, len);
     *  @p
     *
     *  @field(type)     the fully qualified name of a specified type; i.e.,
     *                   a type declared in some .xdc file.  For example,
     *                   "xdc.runtime.Types.Timestamp64".
     *  @field(isScalar) if fetching an array, are the elements of the array
     *                   really just one of the "scalar structs" defined by
     *                   xdc.rov.support.ScalarStructs.
     *  
     *  @see #fetchStruct
     *  @see #fetchArray
     */
    metaonly struct FetchDesc {
        String type;
        Bool   isScalar;
    }
    
    /*!
     *  ======== InstDataView ========
     *  Instance view data returned from a scan
     *
     *  @see #scanInstanceDataView
     */
    metaonly struct InstDataView {
        String label;
        Any    elements[];
    }
    
    /*!
     *  ======== InstDataViewArr ========
     *  Array of all instance view data objects
     *
     *  @see #scanInstanceDataView
     */
    typedef InstDataView InstDataViewArr[];

    /*!
     *  ======== ModDataView ========
     *  Module view data returned from a scan
     *
     *  @see #scanModuleDataView
     */
    metaonly struct ModDataView {
        Any elements[];
    }

    /*!
     *  ======== TreeNode ========
     *  Node for a generic "tree table" view
     *
     *  @see #scanTreeTableView
     *  @see ViewInfo#TREE_TABLE
     */
    metaonly struct TreeNode {
        String   label;
        TreeNode children[];
        Any      properties[];
    }
    
    /*!
     *  ======== TreeNodeArr ========
     *  Array of tree table nodes
     *  
     *  @see #scanTreeTableView
     *  @see ViewInfo#TREE_TABLE
     */
    typedef TreeNode TreeNodeArr[];
    
    /*!
     *  ========= RawView ========
     *  Raw module view
     *
     *  This is the structure returned by the `{@link scanRawView}` method.
     *  It contains the module's state, the instance states, and the module
     *  configuration fields and values.
     */
    metaonly struct RawView {
        Any modState;
        Any instStates[];
        Any modCfg;
    }
    
    /* -------- Scan Functions -------- */
    
    /*! 
     *  ======== scanInstanceView ========
     *  Retrieve the instance-type views for a module
     *
     *  Returns an array of Instance_View structures, each structure 
     *  representing an instance of the module.
     *
     *  @param(modName)  Full module name to return the views for.
     *  @param(tabName)  Name of the tab to retrieve the views for.
     *
     *  @a(Returns)  Array of Instance_View structures, one for each isntance.
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the specified instance view fails, the specified `tabName`
     *              isn't recognized, the specified `modName` doesn't support
     *              instances, or the module `modName` is not configured into
     *              the current program.
     */
    Any scanInstanceView(String modName, String tabName);
    
    /*!
     *  ======== scanModuleView ========
     *  Retrieve module-type view for a module.
     *
     *  @param(modName)  Full module name to return the view for.
     *  @param(tabName)  Name of the tab to retreive the view for.
     *
     *  @(Returns)  Module_View structure.
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the specified module view fails, the specified `tabName`
     *              isn't recognized, or the module `modName` is not
     *              configured into the current program.
     */
    Any scanModuleView(String modName, String tabName);
    
    /*!
     *  ======== scanInstanceDataView ========
     *  Retrieve a module's specified INSTANCE_DATA type view 
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the module's Raw view or any instance fails, the specified
     *              `tabName` isn't recognized, the specified `modName`
     *              doesn't support instances, or the module `modName` is not
     *              configured into the current program.
     */
    InstDataViewArr scanInstanceDataView(String modName, String tabName);

    /*!
     *  ======== scanModuleDataView ========
     *  Retrieve a module's specified MODULE_DATA type view 
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the specified module view fails, the specified `tabName`
     *              isn't recognized, or the module `modName` is not
     *              configured into the current program.
     */    
    ModDataView scanModuleDataView(String modName, String tabName);
    
    /*!
     *  ======== scanRawView ========
     *  Retrieve the raw view for a module.
     *
     *  @param(modName)  Full module name to return the raw view for.
     *
     *  @(Returns) A RawView structure which contains the raw data.
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the specified instance view fails, the specified `tabName`
     *              isn't recognized, the specified `modName` doesn't support
     *              instances, or the module `modName` is not configured into
     *              the current program.
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the module's Raw view fails, or the module `modName` is
     *              not configured into the current program.
     */
    RawView scanRawView(String modName);
    
    /*!
     *  ======== scanTreeTableView ========
     */
    TreeNodeArr scanTreeTableView(String modName, String tabName);
    
    /*!
     *  ======== scanTreeView ========
     */
    Any scanTreeView(String modName, String tabName);
    
    /*!
     *  ======== scanHandle ========
     *  Scan single instance of a module
     *
     *  Used from a view$init function to scan a single instance of a 
     *  different module given that instance's address.
     *
     *  @param(modName)  Full module name to return the raw view for.
     *  @param(instAddr) Address of instance to scan.
     *  @param(tabName)  Name of the tab to retrieve the view for.
     *  
     *  @a(Returns) An Instance_View object for the requested view.
     *
     *  @a(Throws)  Throws an exception in the event that a memory read of
     *              the specified instance view fails, the specified `tabName`
     *              isn't recognized, the specified `modName` doesn't support
     *              instances, or the module `modName` is not configured into
     *              the current program.
     */
    Any scanHandleView(String modName, Ptr instAddr, String tabName);
    
    /*! 
     *  ======== scanObjectView ========
     *  Scan view for an embedded object
     *
     *  Called from a view$init function to retrieve the specified view for
     *  an embedded object.
     *
     *  Since XDC has no way of knowing what embedded objects are present in
     *  a system, embedded objects do not appear in the list of a module's 
     *  instances until they have been scanned in this way. 
     *
     *  Calling Program.scanObjectView will not read any additional data from
     *  the target, since the state structure was already read as part of 
     *  reading it's parent structure.
     *
     *  @param(modName) Full module name to return the view for.
     *  @param(obj)     Actual object to retrieve the view for.
     *  @param(tabName) Name of the tab to retrieve the view for.
     *
     *  @a(Returns) An Instance_View object for the requested view.
     *
     *  @a(Throws)  Throws an exception in the event that the specified
     *              `tabName` isn't recognized, the specified `modName`
     *              doesn't support instances, or the module `modName` is not
     *              configured into the current program.
     */
    Any scanObjectView(String modName, Any obj, String tabName);
    

    /* -------- Fetch Functions -------- */
    
    /*!
     *  ======== fetchStruct ========
     *  Retrieve the specified structure from the target
     *
     *  @param(desc) Fetch descriptor for the structure, indicating the type
     *               of the structure.
     *  @param(addr) Address of the structure to fetch.
     *  @param(addrCheck)  Optional, defaults to true. Indicates whether the
     *                     memory image should validate the read by comparing
     *                     the address to section information.
     *
     *  @a(Returns)  Returns the requested structure as a javascript object.
     *
     *  @a(Throws)  Throws an exception in the event that `addr` is not in
     *              the program's memory map or some error occurs that
     *              prevents memory from being read.
     */
    Any fetchStruct(FetchDesc desc, Ptr addr, Bool addrCheck = true);
    
    /*!
     *  ======== fetchArray ========
     *  Retrieve the specified array from the target
     *
     *  @param(desc) Fetch descriptor for the array, indicating the type of
     *               data in the array.
     *  @param(addr) Address of the array to fetch.
     *  @param(len)  The number of arrray elements to fetch.
     *  @param(addrCheck)  Optional, defaults to true. Indicates whether the
     *                     memory image should validate the read by comparing
     *                     the address to section information.
     *
     *  @a(Returns)  Returns a JavaScript array with the data in it.
     *
     *  @a(Throws)   Throws an exception in the event that `addr` is not in
     *               the program's memory map, some error occurs that
     *               prevents memory from being read, or if `len` = 0.
     */
    Any fetchArray(FetchDesc desc, Ptr addr, Int len, Bool addrCheck = true);
    
    /*!
     *  ======== fetchString ========
     *  Retrieve a string from the target
     *
     *  @param(addr) Address of the string.
     *  @param(addrCheck)  Optional, defaults to true. Indicates whether the
     *                     memory image should validate the read by comparing
     *                     the address to section information.
     *
     *  @a(Returns)  Requested string.
     *
     *  @a(Throws)   Throws an exception in the event that `addr` is not in
     *               the program's memory map or some error occurs that
     *               prevents memory from being read.
     */
    String fetchString(Ptr addr, Bool addrCheck = true);
    
    /*!
     *  ======== fetchStaticString ========
     *  Retrieves a static string from the executable.
     *
     *  This API makes use of an object file reader to improve the string
     *  reading performance--it reads the string from the file rather than
     *  performing a target memory read. For this reason, it should only be
     *  used on static strings and not dynamic ones.
     *
     *  @param(addr)  Address of the string
     *
     *  @a(Returns)  Requested string or `null` if it can't be found.
     */
    String fetchStaticString(Ptr addr);
    
    /*!
     *  ======== getModuleConfig ========
     *  Get a module's configuration state
     *
     *  Returns an object with all of the module configuration values used
     *  in configuring the application.
     *
     *  This object includes the common$ config params.
     *
     *  @param(modName) Full module name to get the configs for.
     *  
     *  @a(Returns)     Object containing all of the module configs and
     *                  their values.
     */
    Any getModuleConfig(String modName);
    
    /*!
     *  ======== getPrivateData ========
     *  Retrieves module's private ROV data.
     *  
     *  This API returns an object which can be used to store private data
     *  across different ROV API calls. The object is reset at every
     *  breakpoint.
     *
     *  This object is also passed as the context to all view init functions,
     *  so it can also be accessed using 'this'. However, the context changes
     *  when you call other APIs in your module; that is when you will need
     *  this API. It can also be used to support metaonly APIs which are called
     *  by other modules.
     */
    Any getPrivateData(String modName);
    
    /*!
     *  ======== lookupDataSymbol ========
     *  Lookup symbolic names for an address
     *
     *  Uses the ISymbolTable to look up the symbols at the given address.
     *
     *  This API is separate from lookupFuncName to address paging concerns.
     *  Use lookupFuncName to get function names (or any symbols in PROGRAM
     *  memory) and use lookupDataSymbol to get data symbols (for symbols in
     *  DATA memory).
     *
     *  @param(addr) Address of symbols
     *
     *  @a(Returns)  Array of symbols at the requested address.
     */
    Any lookupDataSymbol(Int addr);

    /*!
     *  ======== lookupFuncName ========
     *  Lookup function names for an address.
     *
     *  Uses the ISymbolTable to look up the symbols at the given address.
     *
     *  This API is separate from lookupDataSymbol to address paging concerns.
     *  Use lookupFuncName to get function names (or any symbols in PROGRAM
     *  memory) and use lookupDataSymbol to get data symbols (for symbols in
     *  DATA memory).
     *
     *  @param(addr) Address of symbols
     *
     *  @a(Returns)  Array of symbols at the requested address.
     */
    Any lookupFuncName(Int addr);
    
    /*!
     *  ======== getSymbolValue ========
     *  Returns the value for the given symbol.
     *
     *  Returns -1 if the symbol does not exist.
     *
     *  @param(symName) Name of symbol
     * 
     *  @a(Returns) Address or value of symbol, or -1 if symbol does not exist
     */
    Int getSymbolValue(String symName);
    
    /*!
     *  ======== displayError ========
     *
     */
    Void displayError(Any view, String fieldName, String errorMsg); 
    
    /*!
     *  ======== ptrToHex ========
     *  Convert pointer representation to hex string
     *
     *  Convenience function for converting the 'at' symbol representation
     *  of a pointer to the form 0x80005846.
     */
    String ptrToHex(Any ptr);
    
    /*!
     *  ======== getShortName ========
     *  Convert canonical instance names to a short name
     *
     *  Parses the full canonical instance name for the shorter name given 
     *  by the user. If there is no shorter name, then it returns an empty
     *  string "".
     *
     *  @param(name)  Full canonical instance name.
     *
     *  @a(Returns)  The short name, if the user specified one. Empty string
     *               otherwise.
     */
    String getShortName(String name);

    /*!
     *  ======== debugPrint ========
     *  Print API which will only print the message if debug printing is
     *  enabled.
     */
    Void debugPrint(String msg);
    
    /*!
     *  ======== timestamp ========
     *  API for printing timestamp messages for performance analysis.
     */
    Void timestamp(String msg);
       
    /*!
     *  ======== setTimestampFunc ========
     *  Sets API to be used for printing timestamp.
     */
    Void setTimestampFunc(Any func);
    
    /*!
     *  ======== newViewStruct ========
     *  Creates a new instance of the view structure for the specified view.
     *
     *  This API is called for views where the view structure is not already 
     *  passed in as an argument to the view init function.
     *
     *  It is necessary to instantiate a view structure in this way so that ROV
     *  is given an opportunity to initialize the status-reporting mechanisms
     *  of the view structure (to support, e.g., Program.displayError).
     */
    Any newViewStruct(String modName, String tabName);
    
    /*!
     *  ======== StatusEntry ========
     *  Single entry in the ROV status table.
     *
     *  ROV maintains a table of all errors, warnings, etc. encountered while
     *  processing views. This table is cleared on each call to clear cache
     *  (e.g., at each breakpoint).
     */
    metaonly struct StatusEntry {
        String mod;
        String tab;
        String inst;
        String field;
        String message;
    }
    
    /*!
     *  ======== getStatusTable ========
     *  Returns the current table of all encountered status messages.
     *
     *  This table is reset with every call to 'resetMods'. (e.g., at every
     *  breakpoint).
     */
    Any getStatusTable();
    
    /* -------- Used By ROV -------- */
       
    /*!
     *  @_nodoc  
     *  ======== moduleNames ========
     *  Array of all the module names in the application.
     */
    readonly config String moduleNames[length];
    
    /*!
     *  @_nodoc  
     *  ======== getModuleDesc ========
     *  Used to retrieve the module descriptor object for the requested module.
     */
    ROVModuleDesc *getModuleDesc(String modName);
    
    /*!
     *  @_nodoc  
     *  ======== getViewType ========
     *  This is a helper method which returns whether a given tabName is a
     *  module-level view, instance-level view, or raw view.
     */
    String getViewType(String modName, String tabName);

    /*!
     *  @_nodoc
     *  ======== Tab ========
     *  The type is an enum, but we can't use an enum from another module,
     *  so just use the String value of the type.
     */
    metaonly struct Tab {
        String name;
        String type;
    }
    
    /*!
     *  @_nodoc
     *  ======== Tabs ========
     */
    typedef Tab Tabs[];
    
    /*!
     *  @_nodoc  
     *  ======== getSupportedTabs ========
     *  Returns a string array of the tab names supported by the module.
     */
    Tabs getSupportedTabs(String modName);

    /*!
     *  @_nodoc
     *  ======== getAbortFlag ========
     *  In CCS, indicates whether the abort flag has been set.
     */
    Bool getAbortFlag();
    
    /*!
     *  @_nodoc  
     *  ======== resetMods ========
     *  Used to clear the cache of all scanned data and views. Should be called
     *  whenever the target data has changed.
     */
    Void resetMods();
    
    /*!
     *  @_nodoc  
     *  ======== setThrowViewErrors ========
     *  Used to enable/disable exceptions when views detect errors
     */
    Void setThrowViewErrors(Bool flag);

    /*!
     *  @_nodoc
     *  ======== moduleIdToName ========
     *  Used by xdc.runtime.Log.decode
     */
    String moduleIdToName(Int mid);
    
    /*!
     *  ======== exToString ========
     *  Helper function for formatting exceptions into strings with filename 
     *  and line number.
     */
    String exToString(Any e);
    
    /*!
     *  @_nodoc  
     *  ========= ROVModuleDesc ========
     *  Structure containing all ROV-related data about an individual module.
     *
     *  An instance of this structure is created for each module in the system.
     *  As various Program.scan APIs are called, this structure is gradually
     *  filled in with data.
     *
     *  The structure's fields:
     *    name         The module's name
     *    addr         Address of the state object. Redundant with state.$addr,
     *                 but available so that address is present even if fetch 
     *                 of state fails.
     *    loadFailed   Indicates that the 'useModule' call on this module threw
     *                 an exception.
     *    loadFailedMsg The exception message from the 'useModule' call
     *    cfg          Object containing all of the mod's configuration values
     *    state        Raw module state object
     *    instances    Array of ROVInstanceDesc objects representing the mod's
     *                 instances.
     *    objects      Array of ROVInstanceDesc objects representing instances 
     *                 of the module which are embedded in other objects.
     *    viewMap      Contains the module-level views. The key to the map is 
     *                 the string tab name for the view, and the value is the 
     *                 an instance of Module_View.
     *    errorMap     For each view, contains any error that was encountered
     *                 in processing the view outside of what was reported by
     *                 the module. For example, an unhandled exception from the
     *                 view code would be stored here.
     */
    metaonly struct ROVModuleDesc {
        String name;
        Any addr;
        Bool loadFailed;
        String loadFailedMsg;
        Any cfg;
        Any useMod;
        Any viewInfo;
        Any state;
        
        Any staticInstAddrs[];
        Any dynInstAddrs[];
        Bool readAllAddrs;
        
        ROVInstanceDesc *instances[];
        Any viewMap[string];
        String errorMap[string];
        
        String error; // Deprecated, replaced by errorMap
        
        Any instMap;
        
        Any userPrivate;
    };
    
    /*!
     *  @_nodoc  
     *  ========= ROVInstanceDesc ========
     *  Structure containing all ROV-related data about an individual instance.
     *
     *  The ROVInstanceDesc objects are stored in the 'instances' array of the
     *  respective module's ROVModuleDesc structure.
     *
     *  The structure's fields:
     *    state     Raw instance state object
     *    addr      Address of the state object. Redundant with state.$addr,
     *              but available so that address is present even if fetch of
     *              statefails.
     *    viewMap   Contains the instance-level views. The key to the map is
     *              the string tab name for the view, and the value is the 
     *              an instance of Instance_View.
     *    errorMap  For each view, contains any error that was encountered
     *              in processing the view outside of what was reported by
     *              the module. For example, an unhandled exception from the
     *              view code would be stored here.
     */
    metaonly struct ROVInstanceDesc {
        Any    state;
        Any    addr;
        Any    viewMap[string];
        String errorMap[string];
        
        String error; // Deprecated, replaced by errorMap
    };

}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


/*
 *  ======== StateReader.xdc ========
 */

package xdc.rov;

import xdc.rov.Program;

/*!
 *  ======== StateReader ========
 *  These APIs are all designed so that they will not re-read data that has already been read in.
 *
 *  The StateReader has three similar APIs for reading instance state:
 *    fetchInstState 
 *    fetchHandleState
 *    getInstDesc
 *
 *  fetchInstState takes an instance address and its index into the array of
 *  static instances (or -1 if dynamic). This is called by fetchAllInstStates,
 *  knows the index because it's iterating over the list.
 *
 *  fetchHandleState just takes an instance address. It looks through the list
 *  of instances to determine the index, then calls down to fetchInstState.
 *  This API is called by Program.scanHandle.
 *
 *  getInstDesc takes a decoded instance state structure and the index. Both
 *  fetch functions ultimately call down to this API. It is also called
 *  directly by Program.scanObject for scanning embedded objects.
 */
metaonly module StateReader
{

instance:

    /*!
     *  ======== create ========
     */
    create(ISymbolTable.Instance symTable, StructureDecoder.Instance strDec);
     
    /*! 
     *  ======== fetchModuleState ========
     *  Scans the given module's module state structure. If the structure has 
     *  already been scanned, this function returns immediately.
     */
    Void fetchModuleState(Program.ROVModuleDesc *mod);

    /*! 
     *  ======== fetchAllInstStates ========
     *  This function makes sure that all of the instance state structures for
     *  this module have been scanned in. It does not call any view$init
     *  functions.
     */
    Void fetchAllInstStates(Program.ROVModuleDesc *mod);

    /*! 
     *  ======== fetchInstState ========
     *  This function scans in a single instance's state, and associates
     *  various metadata (used by the view$init functions) with the instance
     *  object.
     *  Returns the inst object for Program.scanHandle.
     */
    Program.ROVInstanceDesc *fetchInstState(Program.ROVModuleDesc *mod,
        Long instAddr, Int staticIndex);

    /*!
     *  ======== fetchHandleState ========
     *  The fetchInstState API needs to know whether the given instance
     *  is static or dynamic. If we just have a handle to an instance, we first
     *  need to determine whether it is static or dynamic.
     */
    Program.ROVInstanceDesc *fetchHandleState(Program.ROVModuleDesc *mod,
        Long instAddr);
    
    /*!
     *  ======== getInstDesc ========
     *  Takes a decoded state structure and creates an Program.ROVInstanceDesc
     *  for it. Also retrieves the label for the instance.
     */
    Program.ROVInstanceDesc *getInstDesc(Program.ROVModuleDesc *mod, Any obj,
        Int staticIndex);

}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


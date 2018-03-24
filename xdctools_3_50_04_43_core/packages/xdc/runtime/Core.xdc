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
 *  ======== Core.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Core ========
 *  Core instance lifecycle support
 *
 *  The methods defined in this module are called by code that is
 *  generated at configuration time by the `xdc.services.internal.gen`
 *  package.
 *
 *  For every module that supports instance objects, the generated .c
 *  file contains the body of the constructors and destructors for all
 *  instance objects, the generated .h file contains static inline
 *  functions that call these bodies with a few extra parameters (e.g.,
 *  the size of parameter structs).
 *
 *  @_nodoc
 */
@DirectCall

module Core {

    /*!
     *  ======== A_initializedParams ========
     *  Uninitialied parameters structure
     *
     *  This `Assert.Id` is thrown when the generated instance constructor
     *  detects that the instance parameters have not been properly
     *  initialized (by calling the module's `<Mod>_Params_init()` method).
     */
    config Assert.Id A_initializedParams = {
        msg: "A_initializedParams: uninitialized Params struct"
    };

internal:

    /*
     *  ======== ObjDesc ========
     *  Instance object descriptor
     *
     *  This structure is generated for every module that supports instances.
     *  It is used by both create()/delete() and construct()/destruct()
     *  methods together with common code provided by this module to
     *  create/construct or delete/destruct instances.
     */
    struct ObjDesc {
        CPtr            fxnTab;     /* pointer to module fxns */
        Types.Link      *modLink;   /* link to runtime instances */
        SizeT           objAlign;   /* alignment of instance object */
        IHeap.Handle    objHeap;    /* heap where object is allocated from */
        SizeT           objName;    /* offset into obj for pointer to name */
        SizeT           objSize;    /* sizeof obj size (including header) */
        CPtr            prmsInit;   /* pointer to default init parameters */
        SizeT           prmsSize;   /* size of these default parameters */
    };

    /*
     *  ======== allocObject ========
     *
     */
    Ptr allocObject(const ObjDesc *od, Error.Block *eb);

    /*
     *  ======== assignLabel ========
     *  Fill-in a Text Label based on iname and whether instances have names
     *
     *  If names are disabled, iname == 0, and named == FALSE
     */
    Void assignLabel(Types.Label *lab, Text.CordAddr iname, Bool named);

    /*
     *  ======== assignParams ========
     *  Common code for all Mod_Params_init()
     *
     *  @param(dstPrms) non-NULL pointer to module's Mod_Params
     *  @param(srcPrms) non-NULL pointer to parameter structure
     *  @param(mpsz)    sizeof module's "_Params" structure
     *  @param(ipsz)    sizeof module's base interface "_IInstance_Params"
     *                  struct
     */
    Void assignParams(Ptr dstPrms, CPtr srcPrms, SizeT mpsz, SizeT ipsz);

    /*
     *  ======== createObject ========
     *  Code invoked from Mod_create__S() and Proxy_create() functions
     */
    Ptr createObject(const ObjDesc *od, Ptr curObj, Ptr resPrms, CPtr argPrms,
                     SizeT argPrmsSize, Error.Block *eb);

    /*
     *  ======== constructObject ========
     *  Code for static-only Mod_construct()
     */
    Ptr constructObject(const ObjDesc *od, Ptr curObj, Ptr resPrms,
                        CPtr argPrms, SizeT argPrmsSize, Error.Block *eb);

    /*
     *  ======== deleteObject ========
     *  Common code for all Mod_delete() and Mod_destruct()
     */
    Void deleteObject(const ObjDesc *od, Ptr curObj, Fxn finalFxn,
        Int istat, Bool consFlg);

    /*
     *  ======== delistObject ========
     *  Called from Mod_create() to delist already destructed instances
     */
    Void delistObject(const ObjDesc *od, Ptr curObj);

    /*
     *  ======== destructObject ========
     *  Code for static-only Mod_destruct()
     */
    Void destructObject(const ObjDesc *od, Ptr curObj, Fxn finalFxn,
        Int istat, Bool consFlg);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


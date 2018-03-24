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
 *  ======== Core-smem.c ========
 */

#include <string.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/IInstance.h>
#include <xdc/runtime/Types.h>

#include "package/internal/Core.xdc.h"

/*
 *  ======== Core_constructObject ========
 *  Initialize instance object and instance creation parameter structure
 *
 *  This function is only called for constructed instance
 *  objects and is responsible for:
 *      1. initializing the instance object fields (name and functions) and
 *         all other fields to 0
 *      2. initializing instance creation parameters based on user supplied
 *         params
 *  Module-specific initializion occurs _after_ this function completes.
 *
 *  All constructed instance objects are of the form:
 *      inst -> [Ptr           fxns]
 *               :                      // module-specific fields
 *
 *  [Ptr fxns] is only present in modules that inherit from an
 *  interface.
 *
 *  Input parameters:
 *    od          - pointer to a config generated object "descriptor"
 *                  structure (in cfg/.c)
 *    curObj      - pointer to object to initialize (must be non-NULL
 *                  for construct: &pkg_Mod_Struct)
 *    argPrms     - pointer to a client initialized pkg_Mod_Params structure
 *
 *  Output parameters:
 *    resPrms     - pointer to an uninitialized pkg_Mod_Params structure to
 *                  be initialized based on argPrms
 *
 *  argPrmsSize is not used but we can't remove it until ROM images that have
 *  Core_constructObject embedded are not supported anymore.
 */
Ptr Core_constructObject(const Core_ObjDesc *od, Ptr curObj, Ptr resPrms,
                         CPtr argPrms, SizeT argPrmsSize, Error_Block *eb)
{
    Types_PrmsHdr *prmsHdr;
    IInstance_Params *instPrms;
    SizeT osz;
    Ptr resObj = curObj;

    /* initialize resPrms with the values from Mod_Object__PARAMS__C */
    memcpy(resPrms, od->prmsInit, od->prmsSize);
    prmsHdr = (Types_PrmsHdr *)resPrms;
    prmsHdr->self = prmsHdr;    /* mark resParms as initialized */

    /* use params passed from client, if any */
    if (argPrms) {
        Assert_isTrue(((const Types_PrmsHdr *)argPrms)->self == argPrms,
            Core_A_initializedParams);

        Core_assignParams(resPrms, argPrms, od->prmsSize,
            sizeof(IInstance_Params));
    }

    instPrms = prmsHdr->instPrms;

    /* We need to ensure that the constructed object is zeroed to be
     * consistent with created objects for which we call calloc.
     */
    osz = od->objSize - sizeof(Types_InstHdr);
    memset(resObj, 0, osz);

    /* initialize fxns (if the field is present) */
    if (od->fxnTab != (Ptr)-1) {
        *((CPtr *)resObj) = od->fxnTab;
    }

    /* initialize instance name (if this module supports named instances) */
    if (od->objName) {
        *((CPtr *)((Char *)resObj + od->objName)) = instPrms->name;
    }

    return (resObj);
}

/*
 *  ======== Core_destructObject ========
 */
Void Core_destructObject(const Core_ObjDesc *od, Ptr curObj, Fxn finalFxn,
    Int istat, Bool consFlg)
{
    typedef Void (*FinalFxn1)(Ptr);
    typedef Void (*FinalFxn2)(Ptr, Int);

    if (curObj == NULL) {
        return;     /* silently ignore NULL object references */
    }

    if (finalFxn != NULL) {
        if (istat == -1) {
            ((FinalFxn1)finalFxn)(curObj);
        }
        else {
            ((FinalFxn2)finalFxn)(curObj, istat);
        }
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


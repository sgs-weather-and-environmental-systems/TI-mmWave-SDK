/* 
 * Copyright (c) 2012, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * */
/*
 *  ======== DEV.c ========
 *  Implementation of functions specified in DEV.xdc.
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/hal/Hwi.h>

#include <ti/sysbios/io/IOM.h>

#include <string.h>

#include "package/internal/DEV.xdc.h"

/*
 *  ======== DEV_postInit ========
 *  returns 0 and clean 'eb' on success 
 */ 
Int DEV_postInit(DEV_Object *obj, Error_Block *eb)
{
    UInt        i;
    UInt        key;
    Int         status;
    DEV_Handle  *table;
    IOM_Fxns    *iomFxns;

    table = DEV_module->table;
    iomFxns = (IOM_Fxns *)obj->fxns;

    key = Hwi_disable();

    /* atomically grab slot in the table */
    for (i = 0; i < DEV_tableSize; i++) {
        if (table[i] == NULL) {
            table[i] = obj;
            break;
        }
    }

    Hwi_restore(key);

    if (i == DEV_tableSize) {
        Error_raise(eb, Error_E_generic, "device table full, size = %d", 
            DEV_tableSize);
        return (1);
    }

    if (obj->initFxn != NULL) {
        key = Hwi_disable();
        (*obj->initFxn)();
        Hwi_restore(key);
    }

    key = Hwi_disable();
    status = iomFxns->mdBindDev(&(obj->devp), obj->devid, obj->deviceParams);
    Hwi_restore(key);

    if (status != IOM_COMPLETED) {
        Error_raise(eb, Error_E_generic, "mdBindDev failed", 0);
        return (2);
    }

    return (0);    /* SUCCESS */
}

/*
 *  ======== DEV_Instance_init ========
 */
Int DEV_Instance_init(DEV_Object *obj, String name, Ptr fxns, 
        const DEV_Params *params, Error_Block *eb)
{
    obj->name = name;
    obj->fxns = fxns;
    obj->initFxn = params->initFxn;
    obj->devid = params->devid;
    obj->deviceParams = params->deviceParams;

    return (DEV_postInit(obj, eb));
}

/*
 *  ======== DEV_Instance_finalize ========
 */
Void DEV_Instance_finalize(DEV_Object *obj, Int status)
{
    UInt        slot;
    UInt        key;
    DEV_Handle  *table;
    IOM_Fxns    *iomFxns;

    table = DEV_module->table;
    iomFxns = (IOM_Fxns *)obj->fxns; 

    for (slot = 0; slot < DEV_tableSize; slot++) {
        if (table[slot] == obj) {
            table[slot] = NULL;
            break; 
        }
    }

    /* only call mdUnBindDev() if Instance_init() succeeded */
    if (status == 0) {
        key = Hwi_disable();
        status = iomFxns->mdUnBindDev(obj->devp);
        Hwi_restore(key);
    }
}

/*
 *  ======== DEV_Module_startup ========
 */
Int DEV_Module_startup(Int phase)
{
    Int i;

    /* do post init for all statically created devices */
    for (i = 0; i < DEV_Object_count(); i++) {
        DEV_postInit(DEV_Object_get(NULL, i), NULL);
    }

    return (Startup_DONE);
}

/*
 *  ======== DEV_match ========
 */
String DEV_match(String name, DEV_Handle *device)
{
    UInt         i;
    Int         len;
    DEV_Handle  *table;
    DEV_Handle  entry;

    table = DEV_module->table;

    for (i=0; i < DEV_tableSize; i++) {
        entry = table[i];
        if (entry != NULL && entry->name != NULL) { 
            len = strlen(entry->name);

            if (strncmp(name, entry->name, len) == 0) {
                *device = entry;
                return (name + len);
            }
        }
    }

    *device = NULL;

    return (name);
}

/*
 *  ======== DEV_getName ========
 */
String DEV_getName(DEV_Object *obj) 
{
    return (obj->name);
}

/*
 *  ======== DEV_getFxns ========
 */
Ptr DEV_getFxns(DEV_Object *obj)
{
    return (obj->fxns);
}

/*
 *  ======== DEV_getInitFxn ========
 */
DEV_InitFxn DEV_getInitFxn(DEV_Object *obj)
{
    return (obj->initFxn);
}

/*
 *  ======== DEV_getDevid ========
 */
Int DEV_getDevid(DEV_Object *obj)
{
    return (obj->devid);
}

/*
 *  ======== DEV_getDeviceParams ========
 */
Ptr DEV_getDeviceParams(DEV_Object *obj)
{
    return (obj->deviceParams);
}

/*
 *  ======== DEV_getDevp ========
 */
Ptr DEV_getDevp(DEV_Object *obj)
{
    return (obj->devp);
}

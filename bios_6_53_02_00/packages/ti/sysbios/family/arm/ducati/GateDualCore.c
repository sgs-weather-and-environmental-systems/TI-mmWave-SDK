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
 */
/*
 *  ======== GateDualCore.c ========
 *  Implementation of functions specified in GateDualCore.xdc.
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/family/arm/m3/Hwi.h>
#include <ti/sysbios/family/arm/ducati/Core.h>

#include "package/internal/GateDualCore.xdc.h"

/*
 *  ======== GateDualCore_Module_startup ========
 */
Int GateDualCore_Module_startup(Int phase)
{
    UInt i;

    if (GateDualCore_initGates == TRUE) {
        /* clean the array of gates */
        for (i = 0; i < GateDualCore_numGates; i++ ) {
            GateDualCore_gateArray[i] = 0;
        }
    }

    /* do post init on all statically created gates */
    for (i = 0; i < GateDualCore_Object_count(); i++) {
        GateDualCore_postInit(GateDualCore_Object_get(NULL, i));
    }

    return Startup_DONE;
}

/*
 *  ======== GateDualCore_Instance_init ========
 */
Int GateDualCore_Instance_init(GateDualCore_Object *obj,
                               const GateDualCore_Params *params,
                               Error_Block *eb)
{
    UInt index = params->index;

    if (index > GateDualCore_numGates - 1) {
        Error_raise(eb, GateDualCore_E_invalidIndex, index, 0);
        return 1;
    }
    else if (GateDualCore_module->usedGates[index] != 0) {
        Error_raise(eb, GateDualCore_E_gateInUse, index, 0);
        return 1;
    }
    else {
        GateDualCore_module->usedGates[index] = 1;
        obj->index = index;
        obj->stalls = 0;
        obj->noStalls = 0;
        obj->totalStalls = 0;
        obj->maxStall = 0;
        GateDualCore_postInit(obj);
    }

    return 0;
}

/*
 *  ======== GateDualCore_postInit ========
 */
Void GateDualCore_postInit(GateDualCore_Object *obj)
{
    obj->gatePtr = &GateDualCore_gateArray[obj->index];

    if (Core_id == 0) {
        obj->gateBytePtr = (UInt8 *)(obj->gatePtr);
    }
    else {
        obj->gateBytePtr = (UInt8 *)(obj->gatePtr) + 1;
    }

    /* start fresh */
    *obj->gateBytePtr = 0;
}


/*
 *  ======== GateDualCore_enter ========
 * 32 bit Gate values
 *
 * Gate operation depends on little endian orientation
 *
 * 00 00 00 00 = Gate unowned
 * 00 00 00 01 = Core 0 has entered the gate
 * 00 00 01 00 = Core 1 has entered the gate
 * 00 00 01 01 = value when gate state is being 
 *               evaluated by either core when the
 *               other core has already entered
 *               the gate, or during simultaneous
 *               contention.
 */
IArg GateDualCore_enter(GateDualCore_Object *obj)
{
    UInt key;
    UInt stalls = 0;
    UInt backoff = 1;

    /* No nesting!!! */
    Assert_isTrue ((*obj->gateBytePtr != 1),
        GateDualCore_A_nestedEnter);

    while (TRUE) {
        key = Hwi_disable();

        *obj->gateBytePtr = 1;

        if (*obj->gatePtr > 0x100) {
            *obj->gateBytePtr = 0;
            Hwi_restore(key);

            /* make core 1's loop a little slower to avoid a stalemate */
            if (Core_id == 1) {
                UInt loop = (backoff++ & 0x7);
                while (loop--) {
                    *obj->gateBytePtr = 0;
                    *obj->gateBytePtr;
                }
            }
            if (GateDualCore_enableStats == TRUE) {
                stalls += 1;
            }
        }
        else {
            if (GateDualCore_enableStats == TRUE) {
                if (stalls) {
                    obj->stalls += 1;
                    obj->totalStalls += stalls;
                    if (stalls > obj->maxStall) {
                        obj->maxStall = stalls;
                    }
                }
                else {
                    obj->noStalls += 1;
                }
            }
            return (key);
        }
    }
}

/*
 *  ======== GateDualCore_leave ========
 */
Void GateDualCore_leave(GateDualCore_Object *obj, IArg key)
{
    *obj->gateBytePtr = 0;
    Hwi_restore(key);
}

/*
 *  ======== GateDualCore_sync ========
 *  32 bit Gate values
 *
 *  Gate operation depends on little endian orientation
 *
 *  00 00 00 00 = Gate reset
 *  00 00 00 01 = Core 0 is waiting for Core 1
 *  00 00 01 00 = Core 1 is waiting for Core 0
 *  00 00 01 01 = Both cores are "in sync"
 *  00 00 00 00 = Gate reset
 */
Void GateDualCore_sync(GateDualCore_Object *obj)
{
    UInt stalls = 0;

    /* No nesting!!! */
    Assert_isTrue ((*obj->gateBytePtr != 1),
        GateDualCore_A_nestedEnter);

    *obj->gateBytePtr = 1;

    /* 
     * wait here until the other core gets to the same point
     * or blows through it
     */

    while ((*obj->gatePtr == 0x0001) || (*obj->gatePtr == 0x0100)) {
        stalls += 1;
    }

    *obj->gatePtr = 0;  /* signal the end of sync */

    if (GateDualCore_enableStats == TRUE) {
        if (stalls) {
            obj->stalls += 1;
            obj->totalStalls += stalls;
            if (stalls > obj->maxStall) {
                obj->maxStall = stalls;
            }
        }
        else {
            obj->noStalls += 1;
        }
    }
}

/*
 *  ======== query ========
 *  
 */
Bool GateDualCore_query(Int qual)
{
    return (FALSE);
}

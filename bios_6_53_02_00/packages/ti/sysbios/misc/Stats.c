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
 *  ======== Stats.c ========
 *  Implementation of functions specified in Stats.xdc.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/hal/Hwi.h>

#include "package/internal/Stats.xdc.h"

/*
 *  ======== Instance_init ========
 */
Void Stats_Instance_init(Stats_Object *obj, const Stats_Params *p)
{
    obj->prev = p->previousVal;
    obj->count = 0;
    obj->total = 0;
    obj->max = 0x80000000;
}

/*
 *  ======== Stats_add ========
 */
Void Stats_add(Stats_Object *obj, Int32 value)
{
    UInt key;

    key = Hwi_disable();

    obj->count++;
    obj->total += value;
    if ( value > obj->max ) {
        obj->max = value;
    }

    Hwi_restore(key);    
}

/*
 *  ======== Stats_delta ========
 */
Void Stats_delta(Stats_Object *obj, Int32 value)
{
    UInt key;

    key = Hwi_disable();

    Stats_add(obj, (value - obj->prev));
    obj->prev = value;

    Hwi_restore(key);    
}

/*
 *  ======== Stats_set ========
 */
Void Stats_set(Stats_Object *obj, Int32 value)
{
    obj->prev = value;
}

/*
 *  ======== Stats_reset ========
 */
Void Stats_reset(Stats_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    obj->count = 0;
    obj->total = 0;
    obj->max = 0x80000000;

    Hwi_restore(key);    
}

/*
 *  ======== Stats_getPrev ========
 */
Int32 Stats_getPrev(Stats_Object *obj)
{
    return obj->prev;
}

/*
 *  ======== Stats_getCount ========
 */
Int32 Stats_getCount(Stats_Object *obj)
{
    return obj->count;
}

/*
 *  ======== Stats_getTotal ========
 */
Int32 Stats_getTotal(Stats_Object *obj)
{
    return obj->total;
}

/*
 *  ======== Stats_getMax ========
 */
Int32 Stats_getMax(Stats_Object *obj)
{
    return obj->max;
}

/*
 *  ======== Stats_print ========
 */
Void Stats_print(Stats_Object *obj)
{
    System_printf("prev = %ld\n", (ULong)obj->prev);
    System_printf("count = %ld\n", (ULong)obj->count);
    System_printf("total = %ld\n", (ULong)obj->total);
    System_printf("max = %ld\n", (ULong)obj->max);
}

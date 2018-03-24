/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 *  ======== Wugen.c ========
 *  Contains functions specific to Ducati WUGEN module.
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/family/arm/m3/Hwi.h>

#include "package/internal/Wugen.xdc.h"

#define WAKEUP_MASK0    0x4000100C      /* Wake-up masks for ints 00-31 */
#define WAKEUP_MASK1    0x40001010      /* Wake-up masks for ints 32-63 */

/*
 *  ======== Wugen_Module_startup ========
 */
Int Wugen_Module_startup(Int status)
{
    return (Startup_DONE);
}

/*
 *  ======== Wugen_disableInterrupt ========
 */
Void Wugen_disableInterrupt(UInt intNum)
{
    UInt hwiKey;
    volatile UInt32 *wkup0 = (volatile UInt32 *)WAKEUP_MASK0;
    volatile UInt32 *wkup1 = (volatile UInt32 *)WAKEUP_MASK1;

    hwiKey = Hwi_disable();

    if (intNum >= 48) {
        *wkup1 &= ~(1 << (intNum - 48));
    }
    else if (intNum >= 16) {
        *wkup0 &= ~(1 << (intNum - 16));
    }

    Hwi_restore(hwiKey);
}

/*
 *  ======== Wugen_enableInterrupt ========
 */
Void Wugen_enableInterrupt(UInt intNum)
{
    UInt hwiKey;
    volatile UInt32 *wkup0 = (volatile UInt32 *)WAKEUP_MASK0;
    volatile UInt32 *wkup1 = (volatile UInt32 *)WAKEUP_MASK1;

    hwiKey = Hwi_disable();

    if (intNum >= 48) {
        *wkup1 |= (1 << (intNum - 48));
    }
    else if (intNum >= 16) {
        *wkup0 |= (1 << (intNum - 16));
    }

    Hwi_restore(hwiKey);
}



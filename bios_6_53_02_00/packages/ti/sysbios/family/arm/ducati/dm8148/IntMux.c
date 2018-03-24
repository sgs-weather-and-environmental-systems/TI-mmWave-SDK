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
 *  ======== IntMux.c ========
 *  Contains functions specific to OMAP4 Tesla WUGEN module.
 */

#include <xdc/std.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/interfaces/IHwi.h>

#include <ti/sysbios/family/arm/m3/Hwi.h>

#include "package/internal/IntMux.xdc.h"


/*!
 *  ======== IntMux_initIntMux ========
 */
Void IntMux_initIntMux()
{
    UInt8 *eventMux = (UInt8 *)(IntMux_intMuxBaseAddr);
    UInt intNum;

    for (intNum = 0; intNum <=56; intNum++) {
        eventMux[intNum] = IntMux_intMux[intNum];
    }
}

/*!
 *  ======== IntMux_setEvent ========
 */
Void IntMux_setEvent(UInt intMuxNum, UInt eventNum)
{
    UInt8 *eventMux = (UInt8 *)(IntMux_intMuxBaseAddr);

    Assert_isTrue((intMuxNum <= 56), IntMux_A_badIntNum);
    Assert_isTrue((eventNum <= 47), IntMux_A_badEventNum);

    eventMux[intMuxNum] = eventNum;    
}



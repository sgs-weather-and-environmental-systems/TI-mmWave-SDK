/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== IntXbar.c ========
 *  Contains functions specific to Vayu SoC.
 */

#include <xdc/std.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/interfaces/IHwi.h>

#ifdef xdc_target__isaCompatible_arp32

#include <arp32.h>
#include <ti/sysbios/family/arp32/Hwi.h>

#elif defined xdc_target__isaCompatible_66

#include <ti/sysbios/family/c64p/Hwi.h>

#elif (defined xdc_target__isaCompatible_v7M4)

#include <ti/sysbios/family/arm/m3/Hwi.h>
#include <ti/sysbios/family/arm/ducati/Core.h>

#elif defined xdc_target__isaCompatible_v7A15

#include <ti/sysbios/family/arm/gic/Hwi.h>

#endif

#include "package/internal/IntXbar.xdc.h"

/*!
 *  ======== IntXbar_initIntXbar ========
 */
Void IntXbar_initIntXbar()
{
    UInt intNum;
    UInt32 regOffset;
    UInt32 oldLockReg;
    UInt16 intXbarLength;
    volatile UInt32 *mmrLockReg;
    volatile UInt32 *intXbarReg;

    mmrLockReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                            IntXbar_MMR_OFFSET_LOCK2);

    IntXbar_initXbarRegs(&intXbarReg, &intXbarLength);

    /* Unlock MMR before writing to Xbar Register */
    oldLockReg = *mmrLockReg;
    if (oldLockReg != IntXbar_MMR_LOCK2_UNLOCK) {
        *mmrLockReg = IntXbar_MMR_LOCK2_UNLOCK;
    }

    for (intNum = 0; intNum < intXbarLength; intNum++) {
        if (IntXbar_module->intXbar[intNum]) {
            regOffset = intNum / 2;
            if (intNum % 2) {
                    intXbarReg[regOffset] = (intXbarReg[regOffset] & 0x0000FFFF) |
                                        (IntXbar_module->intXbar[intNum] << 16);
            }
            else {
                    intXbarReg[regOffset] = (intXbarReg[regOffset] & 0xFFFF0000) |
                                        (IntXbar_module->intXbar[intNum]);
            }
        }
    }

    /* Lock MMR before returning */
    *mmrLockReg = oldLockReg;
}

/*!
 *  ======== IntXbar_connect ========
 */
Void IntXbar_connect(UInt xbarInstance, UInt intSource)
{
    UInt32 regOffset;
    UInt32 oldLockReg;
    UInt16 intXbarLength;
    volatile UInt32 *mmrLockReg;
    volatile UInt32 *intXbarReg;

    mmrLockReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                            IntXbar_MMR_OFFSET_LOCK2);

    IntXbar_initXbarRegs(&intXbarReg, &intXbarLength);

#ifdef xdc_target__isaCompatible_arp32
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badEveXbarInstanceNum);

#elif defined xdc_target__isaCompatible_66
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badDspXbarInstanceNum);

#elif (defined xdc_target__isaCompatible_v7M4)
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badBenelliXbarInstanceNum);

#elif defined xdc_target__isaCompatible_v7A15
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badA15XbarInstanceNum);

#endif

    Assert_isTrue((intSource <= IntXbar_numIrqXbarInputs),
    IntXbar_A_badIntSourceIdx);

    regOffset = (xbarInstance - 1) / 2;

    /* Unlock MMR before writing to Xbar Register */
    oldLockReg = *mmrLockReg;
    if (oldLockReg != IntXbar_MMR_LOCK2_UNLOCK) {
        *mmrLockReg = IntXbar_MMR_LOCK2_UNLOCK;
    }

    if ((xbarInstance - 1) % 2) {
        intXbarReg[regOffset] = (intXbarReg[regOffset] & 0x0000FFFF) |
                                (intSource << 16);
    }
    else {
        intXbarReg[regOffset] = (intXbarReg[regOffset] & 0xFFFF0000) |
                                (intSource);
    }

    /* Lock MMR before returning */
    *mmrLockReg = oldLockReg;

    IntXbar_module->intXbar[xbarInstance - 1] = intSource;
}

/*!
 *  ======== IntXbar_connectIRQ ========
 */
Void IntXbar_connectIRQ(UInt cpuIRQNum, UInt intSource)
{
#ifdef xdc_target__isaCompatible_arp32
    Assert_isTrue((cpuIRQNum <= 7),
            IntXbar_A_badEveIRQNum);
    IntXbar_connect(cpuIRQNum + 1, intSource);

#elif defined xdc_target__isaCompatible_66
    Assert_isTrue((cpuIRQNum >= 32) && (cpuIRQNum <= 95),
            IntXbar_A_badDspIRQNum);
    IntXbar_connect(cpuIRQNum - 31, intSource);

#elif (defined xdc_target__isaCompatible_v7M4)
    Assert_isTrue((cpuIRQNum >= 23) && (cpuIRQNum <= 79),
            IntXbar_A_badBenelliIRQNum);
    IntXbar_connect(cpuIRQNum - 22, intSource);

#elif defined xdc_target__isaCompatible_v7A15
    Assert_isTrue((cpuIRQNum == 4) ||
            ((cpuIRQNum >= 7) && (cpuIRQNum <= 130)) ||
            ((cpuIRQNum >= 133) && (cpuIRQNum <= 138)) ||
            ((cpuIRQNum >= 141) && (cpuIRQNum <= 159)),
            IntXbar_A_badA15IRQNum);

    if (cpuIRQNum == 4) {
        IntXbar_connect(cpuIRQNum - 3, intSource);
    }
    else if ((cpuIRQNum >= 7) && (cpuIRQNum <= 130)) {
        IntXbar_connect(cpuIRQNum - 5, intSource);
    }
    else if ((cpuIRQNum >= 133) && (cpuIRQNum <= 138)) {
        IntXbar_connect(cpuIRQNum - 7, intSource);
    }
    else if ((cpuIRQNum >= 141) && (cpuIRQNum <= 159)) {
        IntXbar_connect(cpuIRQNum - 7, intSource);
    }

#endif
}

/*!
 *  ======== IntXbar_disconnect ========
 */
Void IntXbar_disconnect(UInt xbarInstance)
{
    UInt32 regOffset;
    UInt32 oldLockReg;
    UInt16 intXbarLength;
    volatile UInt32 *mmrLockReg;
    volatile UInt32 *intXbarReg;

    mmrLockReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                            IntXbar_MMR_OFFSET_LOCK2);

    IntXbar_initXbarRegs(&intXbarReg, &intXbarLength);

#ifdef xdc_target__isaCompatible_arp32
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badEveXbarInstanceNum);

#elif defined xdc_target__isaCompatible_66
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badDspXbarInstanceNum);

#elif (defined xdc_target__isaCompatible_v7M4)
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badBenelliXbarInstanceNum);

#elif defined xdc_target__isaCompatible_v7A15
    Assert_isTrue((xbarInstance <= intXbarLength) && (xbarInstance >= 1),
            IntXbar_A_badA15XbarInstanceNum);

#endif

    regOffset = (xbarInstance - 1) / 2;

    /* Unlock MMR before writing to Xbar Register */
    oldLockReg = *mmrLockReg;
    if (oldLockReg != IntXbar_MMR_LOCK2_UNLOCK) {
        *mmrLockReg = IntXbar_MMR_LOCK2_UNLOCK;
    }

    if ((xbarInstance - 1) % 2) {
        intXbarReg[regOffset] = (intXbarReg[regOffset] & 0x0000FFFF);
    }
    else {
        intXbarReg[regOffset] = (intXbarReg[regOffset] & 0xFFFF0000);
    }

    /* Lock MMR before returning */
    *mmrLockReg = oldLockReg;

    IntXbar_module->intXbar[xbarInstance - 1] = 0;
}

/*!
 *  ======== IntXbar_disconnectIRQ ========
 */
Void IntXbar_disconnectIRQ(UInt cpuIRQNum)
{
#ifdef xdc_target__isaCompatible_arp32
    Assert_isTrue((cpuIRQNum <= 7),
            IntXbar_A_badEveIRQNum);
    IntXbar_disconnect(cpuIRQNum + 1);

#elif defined xdc_target__isaCompatible_66
    Assert_isTrue((cpuIRQNum >= 32) && (cpuIRQNum <= 95),
            IntXbar_A_badDspIRQNum);
    IntXbar_disconnect(cpuIRQNum - 31);

#elif (defined xdc_target__isaCompatible_v7M4)
    Assert_isTrue((cpuIRQNum >= 23) && (cpuIRQNum <= 79),
            IntXbar_A_badBenelliIRQNum);
    IntXbar_disconnect(cpuIRQNum - 22);

#elif defined xdc_target__isaCompatible_v7A15
    Assert_isTrue((cpuIRQNum == 4) ||
            ((cpuIRQNum >= 7) && (cpuIRQNum <= 130)) ||
            ((cpuIRQNum >= 133) && (cpuIRQNum <= 138)) ||
            ((cpuIRQNum >= 141) && (cpuIRQNum <= 159)),
            IntXbar_A_badA15IRQNum);

    if (cpuIRQNum == 4) {
        IntXbar_disconnect(cpuIRQNum - 3);
    }
    else if ((cpuIRQNum >= 7) && (cpuIRQNum <= 130)) {
        IntXbar_disconnect(cpuIRQNum - 5);
    }
    else if ((cpuIRQNum >= 133) && (cpuIRQNum <= 138)) {
        IntXbar_disconnect(cpuIRQNum - 7);
    }
    else if ((cpuIRQNum >= 141) && (cpuIRQNum <= 159)) {
        IntXbar_disconnect(cpuIRQNum - 7);
    }

#endif
}

/*!
 *  ======== IntXbar_initXbarRegs ========
 */
Void IntXbar_initXbarRegs(volatile UInt32 **intXbarReg, UInt16 *intXbarLength)
{
#ifdef xdc_target__isaCompatible_arp32
    UInt32 cpuId = _get_cpunum();
#elif defined xdc_target__isaCompatible_66
    extern cregister volatile UInt DNUM;
#endif

#ifdef xdc_target__isaCompatible_arp32
    Assert_isTrue((cpuId <= 3), IntXbar_A_badEveCpuId);

    if (cpuId == 0) {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_EVE0);
    }
    else if (cpuId == 1) {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_EVE1);
    }
    else if (cpuId == 2) {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_EVE2);
    }
    else {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_EVE3);
    }

    *intXbarLength = IntXbar_NUM_EVE_XBAR_INST;

#elif defined xdc_target__isaCompatible_66
    Assert_isTrue((DNUM == 0) || (DNUM == 1),
            IntXbar_A_badDspCpuId);

    if (DNUM) {  /* DSP1 */
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_DSP1);
    }
    else {       /* DSP0 */
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_DSP0);
    }

    *intXbarLength = IntXbar_NUM_DSP_XBAR_INST;

#elif (defined xdc_target__isaCompatible_v7M4)
    Assert_isTrue((Core_getIpuId() == 1) || (Core_getIpuId() == 2),
            IntXbar_A_badBenelliIpuId);

    if (Core_getIpuId() == 1) {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_BENELLI_IPU1);
    }
    else {
        *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                                IntXbar_MMR_OFFSET_BENELLI_IPU2);
    }

    *intXbarLength = IntXbar_NUM_BENELLI_XBAR_INST;

#elif defined xdc_target__isaCompatible_v7A15

    *intXbarReg = (UInt32 *)(IntXbar_mmrBaseAddr +
                            IntXbar_MMR_OFFSET_A15);

    *intXbarLength = IntXbar_NUM_A15_XBAR_INST;

#endif

}

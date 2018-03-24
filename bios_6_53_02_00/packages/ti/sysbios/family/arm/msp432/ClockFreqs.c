/*
 * Copyright (c) 2014-2015, Texas Instruments Incorporated
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
 *  ======== ClockFreqs.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>

#include "package/internal/ClockFreqs.xdc.h"

/*
 *  ======== ClockFreqs_getFrequency ========
 */
UInt32 ClockFreqs_getFrequency(ClockFreqs_Clock clock)
{
    UInt32 freq = 0;

    switch (clock) {

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_ACLK:
            freq = ClockFreqs_module->ACLK;
            break;

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_SMCLK:
            freq = ClockFreqs_module->SMCLK;
            break;

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_HSMCLK:
            freq = ClockFreqs_module->HSMCLK;
            break;
    }

    return (freq);
}

/*
 *  ======== ClockFreqs_setFrequency ========
 */
Void ClockFreqs_setFrequency(ClockFreqs_Clock clock, UInt32 frequency)
{
    switch (clock) {

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_ACLK:
            ClockFreqs_module->ACLK = frequency;
            break;

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_SMCLK:
            ClockFreqs_module->SMCLK = frequency;
            break;

        case ti_sysbios_family_arm_msp432_ClockFreqs_Clock_HSMCLK:
            ClockFreqs_module->HSMCLK = frequency;
            break;
    }
}

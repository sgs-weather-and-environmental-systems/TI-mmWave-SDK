/*
 * Copyright (c) 2012-2013, Texas Instruments Incorporated
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
 *  ======== Power.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Power.xdc.h"

#if defined(__ICC430__)
#include <intrinsics.h>
#endif

/*
 *  ======== Power_changeIdleMode ========
 */
Void Power_changeIdleMode(Power_IdleMode mode)
{
    if (!ti_sysbios_family_msp430_Power_allowDynamicMode) {
        Error_raise(NULL, Power_E_dynamicModeNotAllowed, "Power_changeIdleMode", 0);
    }

    Power_module->idleMode = mode;
    Power_module->newMode = TRUE;
}

/*
 *  ======== Power_getModeChangeFlag ========
 */
UInt Power_getModeChangeFlag()
{
    return (Power_module->newMode);
}

/*
 *  ======== Power_sleepCPU ========
 */
Void Power_sleepCPU(Power_SleepMode sleepMode)
{
    if (sleepMode == Power_Sleep_LPM4_5) {

        /* call to configured function to prepare device I/Os for shutdown */
        Power_sleepPrepFunction();

        /* do the transition to LPM4.5 ... */
        asm(" MOV.W #0xA510, &0x120");        /* PMMPW | PMMREGOFF -> PMMCTL0 */
        __bis_SR_register(0xF0);   /* CPUOFF | OSCOFF | SCG0 | SCG1 -> SR */
    }
}

/*
 *  ======== Power_wakeCPU ========
 */
Void Power_wakeCPU()
{
    if (!ti_sysbios_family_msp430_Power_allowDynamicMode) {
        Error_raise(NULL, Power_E_dynamicModeNotAllowed, "Power_wakeCPU", 0);
    }

    Power_module->newMode = TRUE;
}

/*
 *  ======== Power_defaultSleepPrepFunction ========
 */
Void Power_defaultSleepPrepFunction()
{
}

/*
 *  ======== Power_blockedTaskFunction ========
 *  TODO: Put this in .xdt with call to Load idle function
 *  id Load is used?
 */
Void Power_blockedTaskFunction()
{
    Hwi_enable();
    Power_idleCPU();
    Hwi_disable();
}


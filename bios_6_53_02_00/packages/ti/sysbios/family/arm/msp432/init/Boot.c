/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
 *  ======== Boot.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <stdbool.h>
#include "package/internal/Boot.xdc.h"

#include <ti/devices/DeviceFamily.h>
#include DeviceFamily_constructPath(driverlib/pcm.h)

#define REG32(x)  (*(volatile UInt32 *)(x))

/* CS defines */
#define CSKEY         (REG32(0x40010400))
#define CSCTL0        (REG32(0x40010404))
#define CSCTL1        (REG32(0x40010408))
#define CSCTL2        (REG32(0x4001040C))
#define LFXT_EN       (0x00000100)
#define CSIFG         (REG32(0x40010448))
#define LFXTIFG       (0x00000001)
#define CSCLRIFG      (REG32(0x40010450))
#define CLR_LFXTIFG   (0x00000001)
#define LFXTBYPASS    (0x00000200)
#define HFXT_EN       (0x01000000)
#define HFXTIFG       (0x00000002)
#define HFXTBYPASS    (0x02000000)
#define CLR_HFXTIFG   (0x00000002)
#define HFXTFREQDRIVE (0x00410000)  /* HFXTFREQ and HFXTDRIVE for 48MHz */

/* FLCTL defines */
#define FLCTL_RDCTL_BNK0_REG  0x40011010
#define FLCTL_RDCTL_BNK1_REG  0x40011014
#define WAIT_MASK             0x0000F000
#define WAIT_0_BITS           0x00000000  /* 0 wait states */
#define WAIT_1_BITS           0x00001000  /* 1 wait states */
#define WAIT_2_BITS           0x00002000  /* 2 wait states */
#define WAIT_3_BITS           0x00003000  /* 3 wait states */

#define Boot_configureClocksLow ti_sysbios_family_arm_msp432_init_Boot_configureClocksLow
#define Boot_configureClocksMed ti_sysbios_family_arm_msp432_init_Boot_configureClocksMed
#define Boot_configureClocksHigh ti_sysbios_family_arm_msp432_init_Boot_configureClocksHigh
#define Boot_disableWatchdog ti_sysbios_family_arm_msp432_init_Boot_disableWatchdog
#define Boot_setupCS ti_sysbios_family_arm_msp432_init_Boot_setupCS

/*
 *  ======== Boot_setupCS ========
 */
Void ti_sysbios_family_arm_msp432_init_Boot_setupCS(UInt32 regCSTCL0,
    UInt32 regCSTCL1)
{
    /* unlock Clock System (CS) registers */
    CSKEY = 0x695A;

    /* if LFXT is to be enabled ... */
    if (Boot_enableLFXT) {

        /* configure pins for LFXT function */
        PJ->SEL0 |= BIT0;
        PJ->SEL1 &= ~BIT0;

        /* if not bypassing LFXT, start and wait for LF osc stabilization */
        if (!Boot_bypassLFXT) {
            CSCTL2 |= LFXT_EN;
            while (CSIFG & LFXTIFG) {
                CSCLRIFG |= CLR_LFXTIFG;
            }
        }
        /* else, enable bypass */
        else {
            CSCTL2 |= LFXTBYPASS;
        }
    }

    /* if HFXT is to be enabled ... */
    if (Boot_enableHFXT) {

        /* configure pins for HFXT function */
        PJ->SEL0 |= BIT3;
        PJ->SEL1 &= ~BIT3;

        /* if not bypassing HFXT, start and wait for HF osc stabilization */
        if (!Boot_bypassHFXT) {
            CSCTL2 |= HFXTFREQDRIVE;
            CSCTL2 |= HFXT_EN;
            while (CSIFG & HFXTIFG) {
               CSCLRIFG |= CLR_HFXTIFG;
            }
         }
        /* else, enable bypass */
        else {
            CSCTL2 |= HFXTBYPASS;
        }
    }

    /* setup the clock selectors and dividers */
    CSCTL1 = regCSTCL1;

    /* set DCO center frequency */
    CSCTL0 = regCSTCL0;

    /* re-lock CS register access */
    CSKEY = 0;
}

/*
 *  ======== Boot_configureClocksLow ========
 */
Void ti_sysbios_family_arm_msp432_init_Boot_configureClocksLow(UInt32 CTL0,
    UInt32 CTL1)
{
    UInt32 waitbits = WAIT_0_BITS;
    UInt32 temp;

    /* setup Flash wait states (MCLK = 12MHz requires no wait states) */
    temp = REG32(FLCTL_RDCTL_BNK0_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK0_REG) = temp | waitbits;
    temp = REG32(FLCTL_RDCTL_BNK1_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK1_REG) = temp | waitbits;

    /* setup Clock System registers */
    Boot_setupCS(CTL0, CTL1);
}

/*
 *  ======== Boot_configureClocksMed ========
 */
Void ti_sysbios_family_arm_msp432_init_Boot_configureClocksMed(UInt32 CTL0,
    UInt32 CTL1)
{
    UInt32 temp;

    /* switch to AM_LDO_VCORE1 (MCLK = 24MHz requires VCORE = 1) */
    PCM_setPowerState(PCM_AM_LDO_VCORE1);

    /* setup Flash wait states (1 wait state for all devices when VCORE=1) */
    temp = REG32(FLCTL_RDCTL_BNK0_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK0_REG) = temp | WAIT_1_BITS;
    temp = REG32(FLCTL_RDCTL_BNK1_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK1_REG) = temp | WAIT_1_BITS;

    /* setup Clock System registers */
    Boot_setupCS(CTL0, CTL1);
}

/*
 *  ======== Boot_configureClocksHigh ========
 */
Void ti_sysbios_family_arm_msp432_init_Boot_configureClocksHigh(UInt32 CTL0,
    UInt32 CTL1)
{
    UInt32 waitbits = WAIT_1_BITS;
    UInt32 temp;

    /* switch to AM_LDO_VCORE1 (MCLK = 48MHz requires VCORE = 1) */
    PCM_setPowerState(PCM_AM_LDO_VCORE1);

    /* setup Flash wait states (MCLK = 48MHz requires 2 wait states */
    temp = REG32(FLCTL_RDCTL_BNK0_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK0_REG) = temp | waitbits;
    temp = REG32(FLCTL_RDCTL_BNK1_REG) & ~WAIT_MASK;
    REG32(FLCTL_RDCTL_BNK1_REG) = temp | waitbits;

    /* setup Clock System registers */
    Boot_setupCS(CTL0, CTL1);
}

/*
 *  ======== Boot_disableWatchdog ========
 */
Void ti_sysbios_family_arm_msp432_init_Boot_disableWatchdog()
{
    WDT_A->CTL = WDT_A_CTL_PW + WDT_A_CTL_HOLD;
}

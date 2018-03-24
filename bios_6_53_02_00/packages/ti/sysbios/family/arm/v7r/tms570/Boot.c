/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
 *  ======== Boot.c ========
 *
 *  Optionally configure the system PLL and clock dividers prior to C runtime
 *  initialization.
 */
#include <xdc/std.h>

#include "package/internal/Boot.xdc.h"

#define Boot_configurePllDivs   \
                ti_sysbios_family_arm_v7r_tms570_Boot_configurePllDivs
#define Boot_initFlash ti_sysbios_family_arm_v7r_tms570_Boot_initFlash

#if defined(__ti__)
#pragma CODE_SECTION(Boot_configurePllDivs, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_initFlash, ".text:.bootCodeSection")
#endif

#define REG(x)  (*(volatile UInt32 *)(x))

/* Peripheral central resource control register base addresses */
#define PCRREG1          0xFFFF1000
#define PCRREG2          0xFCFF1000
#define PCRREG3          0xFFF78000

/* Peripheral central resource control registers */
#define PSPWRDWNCLR0     0x000000A0
#define PSPWRDWNCLR1     0x000000A4
#define PSPWRDWNCLR2     0x000000A8
#define PSPWRDWNCLR3     0x000000AC

/* Primary system control registers */
#define CSDISCLR         0xFFFFFF38
#define GHVSRC           0xFFFFFF48
#define RCLKSRC          0xFFFFFF50
#define CSVSTAT          0xFFFFFF54
#define CLKCNTL          0xFFFFFFD0

/* Secondary system control registers */
#define CLK2CNTRL        0xFFFFE13C

/* PLL module registers */
#define PLLCTL1          0xFFFFFF70
#define PLLCTL2          0xFFFFFF74

/* Flash control registers */
#define FRDCNTL          0xFFF87000

/* Clock sources */
#define CLK_SRC_PLL1     0x1
#define CLK_SRC_PLL2     0x6
#define CLK_SRC_VCLK     0x9

/*
 *  ======== Boot_configurePllDivs ========
 *
 */
Void Boot_configurePllDivs(UInt pllMul, UInt pllDiv, UInt refClkDiv, UInt odPll,
    UInt spreadingRate, UInt mulMod, UInt sprAmount,
    Bool frequencyModulationEnable)
{
    /* Setup PLL control register 1 */
    REG(PLLCTL1) = (pllDiv << 24) | (refClkDiv << 16) | (pllMul << 8);

    /* Setup PLL control register 2 */
    REG(PLLCTL2) = ((!!frequencyModulationEnable) << 31) |
        (spreadingRate << 22) | (mulMod << 12) | (odPll << 9) | sprAmount;

    /* Enable PLL clock source */
    REG(CSDISCLR) = 0x2;

    /* Wait for PLL to lock */
    while ((REG(CSVSTAT) & 0x2) == 0);

    /* Select PLL as clock source for GCLK, HCLK and VCLK */
    REG(GHVSRC) = (CLK_SRC_PLL1 << 24) | (CLK_SRC_PLL1 << 16) | CLK_SRC_PLL1;

    /* Power-up all peripherals */
    REG(PCRREG1 + PSPWRDWNCLR0) = 0xFFFFFFFF;
    REG(PCRREG1 + PSPWRDWNCLR1) = 0xFFFFFFFF;
    REG(PCRREG1 + PSPWRDWNCLR2) = 0xFFFFFFFF;
    REG(PCRREG1 + PSPWRDWNCLR3) = 0xFFFFFFFF;
    REG(PCRREG2 + PSPWRDWNCLR0) = 0xFFFFFFFF;
    REG(PCRREG2 + PSPWRDWNCLR1) = 0xFFFFFFFF;
    REG(PCRREG2 + PSPWRDWNCLR2) = 0xFFFFFFFF;
    REG(PCRREG2 + PSPWRDWNCLR3) = 0xFFFFFFFF;
    REG(PCRREG3 + PSPWRDWNCLR0) = 0xFFFFFFFF;
    REG(PCRREG3 + PSPWRDWNCLR1) = 0xFFFFFFFF;
    REG(PCRREG3 + PSPWRDWNCLR2) = 0xFFFFFFFF;
    REG(PCRREG3 + PSPWRDWNCLR3) = 0xFFFFFFFF;

    /* Disable all peripherals */
    REG(CLKCNTL) &= 0xFFFFFEFF;

    /* Setup clock dividers */
    REG(CLKCNTL) = 0x01010000;

    /* Setup Clock 2 control register */
    REG(CLK2CNTRL) = 0x00000101;

    /* Select RTI Clock source */
    REG(RCLKSRC) = (1 << 24) | (CLK_SRC_VCLK << 16) | (1 << 8) | CLK_SRC_VCLK;

    /* Enable all peripherals */
    REG(CLKCNTL) |= 0x00000100;
}

/*
 *  ======== Boot_initFlash ========
 */
Void Boot_initFlash(Bool configureFlashWaitStates, UInt flashWaitStates,
    Bool flashPortAPrefetchEnable, Bool flashPortBPrefetchEnable)
{
    /* Program flash read wait states and prefetch enable settings */
    if (!configureFlashWaitStates) {
        REG(FRDCNTL) &= 0xFFFFFFFC;
        REG(FRDCNTL) |= (flashPortBPrefetchEnable << 1) |
            flashPortAPrefetchEnable;
    }
    else {
        REG(FRDCNTL) = (flashWaitStates << 8) |
            (flashPortBPrefetchEnable << 1) | flashPortAPrefetchEnable;
    }
}

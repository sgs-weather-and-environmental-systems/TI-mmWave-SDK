/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *
 */
#include <xdc/std.h>

#define Boot_disableWatchdog ti_catalog_c2800_initF2837x_Boot_disableWatchdog
#define Boot_initSharedRAMs ti_catalog_c2800_initF2837x_Boot_initSharedRAMs
#define Boot_configurePllDivs ti_catalog_c2800_initF2837x_Boot_configurePllDivs
#define Boot_bootCPU2 ti_catalog_c2800_initF2837x_Boot_bootCPU2
#define Boot_initFlash ti_catalog_c2800_initF2837x_Boot_initFlash
#define Boot_limpAbort         ti_catalog_c2800_initF2837x_Boot_limpAbort
#define Boot_defaultLimpAbortFunction  ti_catalog_c2800_initF2837x_Boot_defaultLimpAbortFunction

#if defined(__ti__)
#pragma CODE_SECTION(Boot_disableWatchdog, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_initSharedRAMs, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_bootCPU2, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePllDivs, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_initFlash, ".text:ti_catalog_c2800_initF2837x_flashfuncs")
#endif

extern Fxn Boot_limpAbort();

#define EALLOW           asm(" EALLOW")
#define EDIS             asm(" EDIS")
#define ESTOP0           asm(" ESTOP0")
#define NOP              asm(" NOP");

#define REG(x)  (*(volatile UInt32 *)(x))

#define NOPS             8

/* clock control registers */
#define CLKSRCCTL1_REG   0x05D208
#define SYSPLLCTL1_REG   0x05D20E
#define SYSPLLMULT_REG   0x05D214
#define SYSPLLSTS_REG    0x05D216
#define SYSCLKDIVSEL_REG 0x05D222
#define MCDCR_REG        0x05D22E

/* bit masks */
#define CLKSRCCTL1_OSCCLKSRCSEL_M    0x3
#define SYSPLLCTL1_PLLEN_M           0x1
#define SYSPLLCTL1_PLLCLKEN_M        0x2
#define SYSPLLMULT_IMULT_M           0x7F
#define SYSPLLMULT_FMULT_M           0x300
#define SYSPLLSTS_LOCKS_M            0x1
#define SYSCLKDIVSEL_PLLSYSCLKDIV_M  0x3F
#define MCDCR_MCLKSTS_M              0x0001

/* IPC registers */
#define C1TOC2IPCSET_REG        0x050004
#define C1TOC2IPCFLG_REG        0x050008
#define C1TOC2IPCCOM_REG        0x050010
#define C1TOC2IPCBOOTMODE_REG   0x050022
#define C2TOC1IPCBOOTSTS_REG    0x050020

/* IPC command and interrupt values */
#define C1TOC2_BOOTMODE_BOOT_FROM_FLASH 0xB
#define C1TOC2_EXECUTE_BOOTMODE_CMD     0x13
#define INTR_SET1                       0x80000000
#define INTR_SET2                       0x00000001
#define C2TOC1_BOOT_SYSTEM_READY        0x2

/* Flash controller defines */
#define FRDCNTL_REG             0x05F800
#define FBFALLBACK_REG          0x05F820
#define FPAC1_REG               0x05F824
#define FRDINTFCTRL_REG         0x05F980
#define FECC_REG                0x05FB00

#define FPAC1_PMPPWR_M              0x1
#define FBFALLBACK_BNKPWR0_M        0x3
#define FRDINTFCTRL_PREFETCHEN_M    0x1
#define FRDINTFCTRL_DATACACHEEN_M   0x2
#define FRDCNTL_RWAIT_M             0xf00
#define FRDCNTL_RWAIT_SHIFT         8

/* Flash controller defines */
#define WDCR_REG             0x07029
#define WDCR_WDDIS_M         0x40
#define WDCR_WDCHK_M         0x28

/* Flash controller defines */
#define TIOTP_REG            0x07026D
#define TIOTP_CPUID_M        0x00FF

/* Global Shared RAM Master Select Register */
#define GSxMSEL_REG          0x05F444

/*
 *  ======== Boot_disableWatchdog ========
 */
Void Boot_disableWatchdog(Void)
{
    EALLOW;

    REG(WDCR_REG) = WDCR_WDDIS_M | WDCR_WDCHK_M; /* disable it */

    EDIS;
}

/*
 *  ======== Boot_initSharedRams ========
 */
Void Boot_initSharedRAMs(UInt16 sharedRamMask)
{
    EALLOW;

    REG(GSxMSEL_REG) = sharedRamMask;

    EDIS;
}

/*
 *  ======== Boot_bootCPU2 ========
 *
 */
Void Boot_bootCPU2(Void)
{
    /* wait for C28 boot ROM to indicate ready ... */
    while ((REG(C2TOC1IPCBOOTSTS_REG) & 0xF) != C2TOC1_BOOT_SYSTEM_READY) {
    }

    while ((REG(C1TOC2IPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
    }

    /* specify the boot mode */
    REG(C1TOC2IPCBOOTMODE_REG) = C1TOC2_BOOTMODE_BOOT_FROM_FLASH;

    /* write IPC command code to execute boot mode */
    REG(C1TOC2IPCCOM_REG) = C1TOC2_EXECUTE_BOOTMODE_CMD;

    /* generate interrupt to C28 */
    REG(C1TOC2IPCSET_REG) |= (INTR_SET1 | INTR_SET2);
}

/*
 *  ======== Boot_configurePllDivs ========
 *
 */
Void Boot_configurePllDivs(UInt16 pllIMULT, UInt16 pllFMULT, UInt16 sysClkDiv,
    UInt16 oscClkSrcVal)
{
    /* check if running in Limp mode; if yes, call abort function */
    if (REG(MCDCR_REG) & MCDCR_MCLKSTS_M) {
        Boot_limpAbort();
    }

    EALLOW;

    /* set the OSCCLK source select bit */
    REG(CLKSRCCTL1_REG) = (REG(CLKSRCCTL1_REG) & ~CLKSRCCTL1_OSCCLKSRCSEL_M) |
                           oscClkSrcVal;

    /* disable and bypass the PLL */
    REG(SYSPLLCTL1_REG) &= ~(SYSPLLCTL1_PLLEN_M | SYSPLLCTL1_PLLCLKEN_M);

    /* set integer multiplier */
    REG(SYSPLLMULT_REG) = (REG(SYSPLLMULT_REG) & ~SYSPLLMULT_IMULT_M) |
                          pllIMULT;

    /* set fractional multipler */
    REG(SYSPLLMULT_REG) = (REG(SYSPLLMULT_REG) & ~SYSPLLMULT_FMULT_M) |
                          pllFMULT;

    /* enable PLL to start lock */
    REG(SYSPLLCTL1_REG) |= SYSPLLCTL1_PLLEN_M;

    /* wait for PLL lock */
    while ((REG(SYSPLLSTS_REG) & SYSPLLSTS_LOCKS_M == 0)) {
    };

    /* enable PLL to clock CPUs */
    REG(SYSPLLCTL1_REG) |= SYSPLLCTL1_PLLCLKEN_M;

    /* set SYSCLKDIVSEL divider */
    REG(SYSCLKDIVSEL_REG) = (REG(SYSCLKDIVSEL_REG) &
                            ~SYSCLKDIVSEL_PLLSYSCLKDIV_M) | sysClkDiv;

    EDIS;
}


/*
 *  ======== Boot_defaultLimpAbortFunction ========
 */
void Boot_defaultLimpAbortFunction(void)
{
    while(1) {
    }
}


/*
 *  ======== Boot_initFlash ========
 */
void Boot_initFlash(Bool configWaitStates, UInt waitStates,
    Bool enableProgramCache, Bool enableDataCache)
{
    Int i;
    UInt cacheEnable = 0;

    EALLOW;

    /* power up flash bank and pump */
    REG(FPAC1_REG) |= FPAC1_PMPPWR_M;

    /* set fallback mode to active */
    REG(FBFALLBACK_REG) |= FBFALLBACK_BNKPWR0_M;

    /* disable program and data cache */
    REG(FRDINTFCTRL_REG) = 0;

    /* set wait states */
    if (configWaitStates) {
        REG(FRDCNTL_REG) = waitStates << FRDCNTL_RWAIT_SHIFT;
    }

    if (enableProgramCache) {
        cacheEnable |= FRDINTFCTRL_PREFETCHEN_M;
    }

    if (enableDataCache) {
        cacheEnable |= FRDINTFCTRL_DATACACHEEN_M;
    }

    /* conditionally enable prefetch and data cache */
    REG(FRDINTFCTRL_REG) = cacheEnable;

    EDIS;

    /* flush pipeline */
    for (i = 0; i < (NOPS - 1); i++) {
        NOP;
    }
}

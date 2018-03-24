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

#define Boot_stepDelay ti_catalog_arm_cortexm3_concertoInit_Boot_stepDelay
#define Boot_configurePllDivs ti_catalog_arm_cortexm3_concertoInit_Boot_configurePllDivs
#define Boot_bootC28 ti_catalog_arm_cortexm3_concertoInit_Boot_bootC28
#define Boot_initC28RAMs ti_catalog_arm_cortexm3_concertoInit_Boot_initC28RAMs
#define Boot_limpAbort ti_catalog_arm_cortexm3_concertoInit_Boot_limpAbort
#define Boot_defaultLimpAbortFunction ti_catalog_arm_cortexm3_concertoInit_Boot_defaultLimpAbortFunction
#define Boot_initFlash ti_catalog_arm_cortexm3_concertoInit_Boot_initFlash

#if defined(__ti__)
#pragma CODE_SECTION(Boot_stepDelay, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_bootC28, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_initC28RAMs, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePllDivs, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_defaultLimpAbortFunction, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_initFlash, ".ti_catalog_arm_cortexm3_concertoInit_flashfuncs")
#endif

extern Void Boot_stepDelay(UInt count);
extern Fxn Boot_limpAbort();

#define REG(x)  (*(volatile UInt *)(x))

/* M3 protect register and value */
#define SYSCTL_MWRALLOW 0x400FB980
#define SYSCTL_UNLOCK   0xA5A5A5A5

/* clock control registers */
#define SYSPLLCTL_REG   0x400FB800
#define SYSPLLMULT_REG  0x400FB804
#define SYSPLLSTS_REG   0x400FB808
#define SYSDIVSEL_REG   0x400FB80C
#define M3SSDIVSEL_REG  0x400FB810
#define MCLKSTS_REG     0x400FB830
#define MCLKEN_REG      0x400FB83C

/* bit masks */
#define SPLLEN_M        0x1
#define SPLLCLKEN_M     0x2
#define SPLLIMULT_M     0x7F
#define SPLLFMULT_M     0x300
#define SYSDIVSEL_M     0x3
#define SYSPLLLOCKS_M   0x1
#define M3SSDIVSEL_M    0x3
#define MCLKFLG_M       0x10000
#define MCLKDETEN_M     0x1

/* divider values */
#define SYSDIVSEL_DIV8  0x3
#define SYSDIVSEL_DIV4  0x2
#define SYSDIVSEL_DIV2  0x1
#define SYSDIVSEL_DIV1  0x0
#define M3SSDIVSEL_DIV4 0x2
#define M3SSDIVSEL_DIV2 0x1
#define M3SSDIVSEL_DIV1 0x0

/* IPC registers */
#define MTOCIPCSET_REG          0x400FB708
#define MTOCIPCFLG_REG          0x400FB710
#define MTOCIPCCOM_REG          0x400FB730
#define MTOCIPCADDR_REG         0x400FB734
#define MTOCIPCDATAW_REG        0x400FB738
#define MTOCIPCDATAR_REG        0x400FB73C
#define MTOCIPCBOOTMODE_REG     0x400FB744
#define CTOMIPCBOOTSTS_REG      0x400FB740

/* IPC command and interrupt values */
#define MTOC_BOOTMODE_BOOT_FROM_FLASH   0x2
#define MTOC_EXECUTE_BOOTMODE_CMD       0x13
#define MTOC_DATA_READ_32               0x8
#define MTOC_SET_BITS_PROTECTED_32      0xA
#define INTR_SET1                       0x80000000
#define INTR_SET2                       0x00000001
#define CTOM_CONTROL_SYSTEM_READY       0x2

/* Flash controller defines */
#define FRDCNTL_REG             0x400FA000
#define FRD_INTF_CTRL_REG       0x400FA300
#define PCACHE_ENABLE           0x1
#define DCACHE_ENABLE           0x2
#define RWAIT_SHIFT             8
#define NOPS                    8

/* C28 RAM controller register defines */
#define C28RTESTINIT_REG        0x4920
#define C28RINITDONE_REG        0x4930
#define CLxRTESTINIT1_REG       0x4922
#define CLxRINITDONE1_REG       0x4932

/* C28 RAM region bit ID masks */
#define CtoMM1                  0x14
#define L3L2L1L0                0x55

/*
 *  ======== Boot_bootC28 ========
 *
 */
Void Boot_bootC28(Void)
{
    /* wait for C28 boot ROM to indicate ready ... */
    while ((REG(CTOMIPCBOOTSTS_REG) & 0xFFFF) != CTOM_CONTROL_SYSTEM_READY) {
    }

    /* wait for any previous IPC command to complete */
    while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
    }

    /* write IPC command code to execute boot mode */
    REG(MTOCIPCCOM_REG) = MTOC_EXECUTE_BOOTMODE_CMD;

    /* specify the boot mode */
    REG(MTOCIPCBOOTMODE_REG) = MTOC_BOOTMODE_BOOT_FROM_FLASH;

    /* generate interrupt to C28 */
    REG(MTOCIPCSET_REG) |= (INTR_SET1 | INTR_SET2);

}


/*
 *  ======== Boot_initC28RAMs ========
 *
 */
Void Boot_initC28RAMs(Void)
{
    Bool initDone = FALSE;
    UInt32 dataRead;

    /* wait for C28 boot ROM to indicate ready ... */
    while ((REG(CTOMIPCBOOTSTS_REG) & 0xFFFF) != CTOM_CONTROL_SYSTEM_READY) {
    }

    /* wait for any previous IPC command to complete */
    while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
    }

    /* setup write to C28RTESTINIT to initiate init of CtoM and M1 */
    REG(MTOCIPCCOM_REG) = MTOC_SET_BITS_PROTECTED_32;
    REG(MTOCIPCADDR_REG) = C28RTESTINIT_REG;
    REG(MTOCIPCDATAW_REG) = CtoMM1;

    /* generate interrupt to C28 to execute command, wait to complete */
    REG(MTOCIPCSET_REG) |= (INTR_SET1 | INTR_SET2);
    while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
    }

    /* wait until memories have been initialized */
    while (initDone == FALSE) {

        /* setup command to read C28RINITDONE */
        REG(MTOCIPCCOM_REG) = MTOC_DATA_READ_32;
        REG(MTOCIPCADDR_REG) = C28RINITDONE_REG;

        /* generate interrupt to C28 to execute command, wait to complete */
        REG(MTOCIPCSET_REG) |= (INTR_SET1 | INTR_SET2);
        while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
        }

        dataRead = REG(MTOCIPCDATAR_REG);

        /* check if done */
        if ((dataRead & CtoMM1) == CtoMM1) {
            initDone = TRUE;
        }
    }

    /* setup write to CLxRTESTINIT1 to initiate init of L0-L3 */
    REG(MTOCIPCCOM_REG) = MTOC_SET_BITS_PROTECTED_32;
    REG(MTOCIPCADDR_REG) = CLxRTESTINIT1_REG;
    REG(MTOCIPCDATAW_REG) = L3L2L1L0;

    /* generate interrupt to C28 to execute command, wait to complete */
    REG(MTOCIPCSET_REG) |= (INTR_SET1 | INTR_SET2);
    while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
    }

    /* wait until memories have been initialized */
    initDone = FALSE;
    while (initDone == FALSE) {

        /* setup command to read CLxRINITDONE1 */
        REG(MTOCIPCCOM_REG) = MTOC_DATA_READ_32;
        REG(MTOCIPCADDR_REG) = CLxRINITDONE1_REG;

        /* generate interrupt to C28 to execute command, wait to complete */
        REG(MTOCIPCSET_REG) |= (INTR_SET1 | INTR_SET2);
        while ((REG(MTOCIPCFLG_REG) & (INTR_SET1 | INTR_SET2)) != 0) {
        }

        dataRead = REG(MTOCIPCDATAR_REG);

        /* check if done */
        if ((dataRead & L3L2L1L0) == L3L2L1L0) {
            initDone = TRUE;
        }
    }
}


/*
 *  ======== Boot_configurePllDivs ========
 *
 */
Void Boot_configurePllDivs(UInt SPLLIMULT, UInt SPLLFMULT, UInt SYSDIVSEL,
    UInt M3SSDIVSEL)
{
#if 0
    UInt missDetect;
#endif
    UInt sysdiv;
    UInt m3div;
    UInt allow;


    /* check if running in Limp mode; if yes, call abort function */
    if (REG(MCLKSTS_REG) & MCLKFLG_M) {
        Boot_limpAbort();
    }

    /* enable M3 access to protected registers */
    allow = REG(SYSCTL_MWRALLOW);
    REG(SYSCTL_MWRALLOW) = SYSCTL_UNLOCK;

#if 0
    /* test teams see instabilities w/disabling MCLK, leave enabled for now */
    /* get missing clock detect enable status */
    missDetect = REG(MCLKEN_REG);

    /* temporarily disable the MCLK detection logic */
    REG(MCLKEN_REG) &= ~MCLKDETEN_M;
#endif

    /* set SYS and M3 dividers to maximum */
    REG(SYSDIVSEL_REG) = (REG(SYSDIVSEL_REG) & ~SYSDIVSEL_M) | SYSDIVSEL_DIV8;
    REG(M3SSDIVSEL_REG) = (REG(M3SSDIVSEL_REG) & ~M3SSDIVSEL_M)
        | M3SSDIVSEL_DIV4;
    sysdiv = SYSDIVSEL_DIV8;
    m3div = M3SSDIVSEL_DIV4;

    /* disable and bypass the PLL */
    REG(SYSPLLCTL_REG) &= ~(SPLLCLKEN_M | SPLLEN_M);

    /* set integer multiplier */
    REG(SYSPLLMULT_REG) = (REG(SYSPLLMULT_REG) & ~SPLLIMULT_M) | SPLLIMULT;

    /* set fractional multipler */
    REG(SYSPLLMULT_REG) = (REG(SYSPLLMULT_REG) & ~SPLLFMULT_M) | SPLLFMULT;

    /* enable PLL to start lock */
    REG(SYSPLLCTL_REG) |= SPLLEN_M;

    /* wait for PLL lock */
    while ((REG(SYSPLLSTS_REG) & SYSPLLLOCKS_M == 0)) {
    };

    /* enable PLL to clock CPUs */
    REG(SYSPLLCTL_REG) |= SPLLCLKEN_M;

    /* step M3SS divider downwards from max to target value */
    while(m3div != M3SSDIVSEL) {
        if (m3div == M3SSDIVSEL_DIV4 ) {        /* if DIV4, step to DIV2 */
            REG(M3SSDIVSEL_REG) = (REG(M3SSDIVSEL_REG) & ~M3SSDIVSEL_M)
                | M3SSDIVSEL_DIV2;
            m3div = M3SSDIVSEL_DIV2;
            Boot_stepDelay(15);
        }
        else {                                  /* for DIV2, step to DIV1 */
            REG(M3SSDIVSEL_REG) = (REG(M3SSDIVSEL_REG) & ~M3SSDIVSEL_M)
                | M3SSDIVSEL_DIV1;
            m3div = M3SSDIVSEL_DIV1;
            Boot_stepDelay(15);
        }
    }

    /* step SYSDIV divider downwards from max to target value */
    while(sysdiv != SYSDIVSEL) {
        if (sysdiv == SYSDIVSEL_DIV8 ) {        /* if DIV8, step to DIV4 */
            REG(SYSDIVSEL_REG) = (REG(SYSDIVSEL_REG) & ~SYSDIVSEL_M)
                | SYSDIVSEL_DIV4;
            sysdiv = SYSDIVSEL_DIV4;
            Boot_stepDelay(15);
        }
        else if (sysdiv == SYSDIVSEL_DIV4 ) {   /* if DIV4, step to DIV2 */
            REG(SYSDIVSEL_REG) = (REG(SYSDIVSEL_REG) & ~SYSDIVSEL_M)
                | SYSDIVSEL_DIV2;
            sysdiv = SYSDIVSEL_DIV2;
            Boot_stepDelay(15);
        }
        else {                                  /* for DIV2, step to DIV1 */
            REG(SYSDIVSEL_REG) = (REG(SYSDIVSEL_REG) & ~SYSDIVSEL_M)
                | SYSDIVSEL_DIV1;
            sysdiv = SYSDIVSEL_DIV1;
            Boot_stepDelay(15);
        }
    }

#if 0
    /* restore missing clock detect enable state on entry */
    REG(MCLKEN_REG) |= (missDetect & MCLKDETEN_M);
#endif

    /* restore M3 access protect setting */
    REG(SYSCTL_MWRALLOW) = allow;
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
    UInt cacheEnable = 0;
    UInt allow;
    UInt i;

    /* enable M3 access to protected registers */
    allow = REG(SYSCTL_MWRALLOW);
    REG(SYSCTL_MWRALLOW) = SYSCTL_UNLOCK;

    /* disable program and data cache */
    REG(FRD_INTF_CTRL_REG) = 0;

    /* set wait states */
    if (configWaitStates) {
        REG(FRDCNTL_REG) = waitStates << RWAIT_SHIFT;
    }

    if (enableProgramCache) {
        cacheEnable |= PCACHE_ENABLE;
    }
    if (enableDataCache) {
        cacheEnable |= DCACHE_ENABLE;
    }

    /* conditionally enable prefetch and data cache */
    REG(FRD_INTF_CTRL_REG) = cacheEnable;

    /* restore M3 access protect setting */
    REG(SYSCTL_MWRALLOW) = allow;

    /* flush pipeline */
    for(i = 0; i < (NOPS - 1); i++) {
        asm(" NOP");
    }
}


/*
 *  ======== Boot_stepDelay ========
 *
 *  Provides a small delay.
 *
 *  The count argument is the number of delay loop iterations to perform.
 *  Each loop takes 3 cycles/loop.
 *
 */
asm("                                           \n\
_ti_catalog_arm_cortexm3_concertoInit_Boot_stepDelay:   \n\
ti_catalog_arm_cortexm3_concertoInit_Boot_stepDelay:    \n\
         subs    r0, #1                         \n\
         bne.n   _ti_catalog_arm_cortexm3_concertoInit_Boot_stepDelay \n\
         bx      lr                             \n\
");

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
 *  ======== Power.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/family/c66/Cache.h>
#include "package/internal/Power.xdc.h"

#define _VERBOSE_ 0

#define REG(x) (*((volatile UInt32 *)(x)))

#define L1PSRAMBASE     0x00E00000
#define L1DSRAMBASE     0x00F00000
#define L2SRAMBASE      0x00800000

/* INTC register addresses */
#define EVTMASK0_REG    0x01800080
#define EVTMASK1_REG    0x01800084
#define EVTMASK2_REG    0x01800088
#define EVTMASK3_REG    0x0180008C
#define EXPMASK0_REG    0x018000C0
#define EXPMASK1_REG    0x018000C4
#define EXPMASK2_REG    0x018000C8
#define EXPMASK3_REG    0x018000CC
#define INTMUX1_REG     0x01800104
#define INTMUX2_REG     0x01800108
#define INTMUX3_REG     0x0180010C
#define AEGMUX0_REG     0x01800140
#define AEGMUX1_REG     0x01800144
#define INTDMASK_REG    0x01800188
#define PAMAP0_REG      0x01820500  /* save PAMAP 0-15 */
#define L2CFG_REG       0x01840000
#define L1PCFG_REG      0x01840020
#define L1PCC_REG       0x01840004
#define L1DCFG_REG      0x01840040
#define L1DCC_REG       0x01840044
#define MAR12_REG       0x01848030  /* save MAR 12-255 */
#define L2MPPA0_REG     0x0184A200  /* save L2MPPA 0-31 */
#define L1PMPPA16_REG   0x0184A640  /* save L1PMPPA 16-31 */
#define L1DMPPA16_REG   0x0184AE40  /* save L1DMPPA 16-31 */

/* power down controller address and state options */
#define PDCCMD_REG      0x01810000
#define PDCCMD_IDLE     0x00005555
#define PDCCMD_STANDBY  0x0001FFFF

/* register offsets from DSP_SYSTEM base */
#define DSP_SYS_SYSCONFIG_OFFSET            0x08
#define BUSCONFIG_REG_OFFSET                0x14
#define IRQWAKEEN0_REG_OFFSET               0x20
#define IRQWAKEEN1_REG_OFFSET               0x24
#define DMAWAKEEN0_REG_OFFSET               0x30
#define DMAWAKEEN1_REG_OFFSET               0x34
#define EVTOUTSET_REG_OFFSET                0x40
#define ERRINTIRQENABLESET_REG_OFFSET       0x58
#define EDMAWAKE0IRQENABLESET_REG_OFFSET    0x68
#define EDMAWAKE1IRQENABLESET_REG_OFFSET    0x78

/* register offsets from EDMA (TPCC) base */
#define CLKGDIS_REG_OFFSET      0xFC
#define DCHMAP0_REG_OFFSET      0x100
#define QCHMAP0_REG_OFFSET      0x200
#define DMAQNUM0_REG_OFFSET     0x240
#define QDMAQNUM_REG_OFFSET     0x260
#define QUETCMAP_REG_OFFSET     0x280
#define QUEPRI_REG_OFFSET       0x284
#define DRAEM0_REG_OFFSET       0x340
#define QWMTHRA_REG_OFFSET      0x620
#define AETCTL_REG_OFFSET       0x700
#define IER_REG_OFFSET          0x1050
#define IERH_REG_OFFSET         0x1054
#define IESR_REG_OFFSET         0x1060
#define IESRH_REG_OFFSET        0x1064
#define QEER_REG_OFFSET         0x1084
#define QEESR_REG_OFFSET        0x108C
#define OPT0_REG_OFFSET         0x4000

/* Cache mask */
#define CACHE_MODE_MASK         0x00000007      /* L1/L2 Mode mask */

/* C register declarations for control registers */
extern cregister volatile unsigned int TSCL;
extern cregister volatile unsigned int AMR;
extern cregister volatile unsigned int CSR;
extern cregister volatile unsigned int IER;
extern cregister volatile unsigned int ISTP;
extern cregister volatile unsigned int IRP;
extern cregister volatile unsigned int ILC;
extern cregister volatile unsigned int RILC;
extern cregister volatile unsigned int REP;
extern cregister volatile unsigned int FADCR;
extern cregister volatile unsigned int FAUCR;
extern cregister volatile unsigned int FMCR;
extern cregister volatile unsigned int SSR;
extern cregister volatile unsigned int GPLYA;
extern cregister volatile unsigned int GPLYB;
extern cregister volatile unsigned int GFPGFR;
extern cregister volatile unsigned int TSR;
extern cregister volatile unsigned int ITSR;
extern cregister volatile unsigned int IERR;

/* put subsystem context into Power-specific section */
#pragma DATA_SECTION(ssContext, ".data:ti_sysbios_family_c66_vayu_Power_data");
Power_SubsystemContext ssContext;

/* declarations for globals in the Power-specific section */
extern far UInt32 ti_sysbios_family_c66_vayu_Power_doResume;
extern far UInt32 ti_sysbios_family_c66_vayu_Power_readyIdle;
extern far UInt32 ti_sysbios_family_c66_vayu_Power_cpuRegs;

/*
 *  ======== Power_suspend ========
 */
UInt Power_suspend(Power_Suspend level)
{
    Cache_Size cacheSize;
    UInt32 *wordPtr;
    UInt32 reset;
    UInt32 tmp1;
    UInt32 tmp2;
    UInt32 i;

    /* disable interrupts */
    ssContext.hwiKey = Hwi_disable();

    /* disable scheduling */
    ssContext.taskKey = Task_disable();
    ssContext.swiKey = Swi_disable();

    /* save System context */
    ssContext.configSystem.DSP_SYS_SYSCONFIG =
        REG((UInt32)Power_systemRegs + DSP_SYS_SYSCONFIG_OFFSET);
    ssContext.configSystem.BUSCONFIG =
        REG((UInt32)Power_systemRegs + BUSCONFIG_REG_OFFSET);
    ssContext.configSystem.IRQWAKEEN0 =
        REG((UInt32)Power_systemRegs + IRQWAKEEN0_REG_OFFSET);
    ssContext.configSystem.IRQWAKEEN1 =
        REG((UInt32)Power_systemRegs + IRQWAKEEN1_REG_OFFSET);
    ssContext.configSystem.DMAWAKEEN0 =
        REG((UInt32)Power_systemRegs + DMAWAKEEN0_REG_OFFSET);
    ssContext.configSystem.DMAWAKEEN1 =
        REG((UInt32)Power_systemRegs + DMAWAKEEN1_REG_OFFSET);
    ssContext.configSystem.EVTOUTSET =
        REG((UInt32)Power_systemRegs + EVTOUTSET_REG_OFFSET);
    ssContext.configSystem.ERRINTIRQENABLESET =
        REG((UInt32)Power_systemRegs + ERRINTIRQENABLESET_REG_OFFSET);
    ssContext.configSystem.EDMAWAKE0IRQENABLESET =
        REG((UInt32)Power_systemRegs + EDMAWAKE0IRQENABLESET_REG_OFFSET);
    ssContext.configSystem.EDMAWAKE1IRQENABLESET =
        REG((UInt32)Power_systemRegs + EDMAWAKE1IRQENABLESET_REG_OFFSET);

    /* = = = = = = = = */

    /* save INTC context */
    ssContext.configINTC.EVTMASK0 = REG(EVTMASK0_REG);
    ssContext.configINTC.EVTMASK1 = REG(EVTMASK1_REG);
    ssContext.configINTC.EVTMASK2 = REG(EVTMASK2_REG);
    ssContext.configINTC.EVTMASK3 = REG(EVTMASK3_REG);
    ssContext.configINTC.EXPMASK0 = REG(EXPMASK0_REG);
    ssContext.configINTC.EXPMASK1 = REG(EXPMASK1_REG);
    ssContext.configINTC.EXPMASK2 = REG(EXPMASK2_REG);
    ssContext.configINTC.EXPMASK3 = REG(EXPMASK3_REG);
    ssContext.configINTC.INTMUX1 = REG(INTMUX1_REG);
    ssContext.configINTC.INTMUX2 = REG(INTMUX2_REG);
    ssContext.configINTC.INTMUX3 = REG(INTMUX3_REG);
    ssContext.configINTC.AEGMUX0 = REG(AEGMUX0_REG);
    ssContext.configINTC.AEGMUX1 = REG(AEGMUX1_REG);
    ssContext.configINTC.INTDMASK = REG(INTDMASK_REG);
    ssContext.configINTC.PDCCMD = REG(PDCCMD_REG);
    ssContext.configINTC.L2CFG = REG(L2CFG_REG);
    ssContext.configINTC.L1PCFG = REG(L1PCFG_REG);
    ssContext.configINTC.L1PCC = REG(L1PCC_REG);
    ssContext.configINTC.L1DCFG = REG(L1DCFG_REG);
    ssContext.configINTC.L1DCC = REG(L1DCC_REG);

    /* save PAMAP registers starting at PAMAP0 */
    wordPtr = (UInt32 *)(PAMAP0_REG);
    for (i = 0; i < sizeof(ssContext.configINTC.PAMAP) / 4; i++) {
        ssContext.configINTC.PAMAP[i] = *wordPtr++;
    }

    /* save MAR registers starting at MAR12 */
    wordPtr = (UInt32 *)(MAR12_REG);
    for (i = 0; i < sizeof(ssContext.configINTC.MAR) / 4; i++) {
        ssContext.configINTC.MAR[i] = *wordPtr++;
    }

    /* save L2MPPA registers starting at L2MPPA0 */
    wordPtr = (UInt32 *)(L2MPPA0_REG);
    for (i = 0; i < sizeof(ssContext.configINTC.L2MPPA) / 4; i++) {
        ssContext.configINTC.L2MPPA[i] = *wordPtr++;
    }

    /* save L1PMPPA registers starting at L1PMPPA16 */
    wordPtr = (UInt32 *)(L1PMPPA16_REG);
    for (i = 0; i < sizeof(ssContext.configINTC.L1PMPPA) / 4; i++) {
        ssContext.configINTC.L1PMPPA[i] = *wordPtr++;
    }

    /* save L1DMPPA registers starting at L1DMPPA16 */
    wordPtr = (UInt32 *)(L1DMPPA16_REG);
    for (i = 0; i < sizeof(ssContext.configINTC.L1DMPPA) / 4; i++) {
        ssContext.configINTC.L1DMPPA[i] = *wordPtr++;
    }

    /* = = = = = = = = */

    /* save EDMA context */
    ssContext.configEDMA.CLKGDIS =
        REG((UInt32)Power_tpccRegs + CLKGDIS_REG_OFFSET);

    /* save DMA chan to PARAM mapping registers */
    wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DCHMAP0_REG_OFFSET);
    for (i = 0; i < 64; i++) {
        ssContext.configEDMA.DCHMAP[i] = *wordPtr++;
    }

    /* save QDMA chan to PARAM mapping registers */
    wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + QCHMAP0_REG_OFFSET);
    for (i = 0; i < 8; i++) {
        ssContext.configEDMA.QCHMAP[i] = *wordPtr++;
    }

    /* save DMA queue mapping registers */
    wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DMAQNUM0_REG_OFFSET);
    for (i = 0; i < 8; i++) {
        ssContext.configEDMA.DMAQNUM[i] = *wordPtr++;
    }

    ssContext.configEDMA.QDMAQNUM =
        REG((UInt32)Power_tpccRegs + QDMAQNUM_REG_OFFSET);
    ssContext.configEDMA.QUETCMAP =
        REG((UInt32)Power_tpccRegs + QUETCMAP_REG_OFFSET);
    ssContext.configEDMA.QUEPRI =
        REG((UInt32)Power_tpccRegs + QUEPRI_REG_OFFSET);

    /* save DMA and QDMA region access enable bits */
    wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DRAEM0_REG_OFFSET);
    for (i = 0; i < (8 * 3); i++) {
        ssContext.configEDMA.regionAccessBits[i] = *wordPtr++;
    }

    ssContext.configEDMA.QWMTHRA =
        REG((UInt32)Power_tpccRegs + QWMTHRA_REG_OFFSET);
    ssContext.configEDMA.AETCTL =
        REG((UInt32)Power_tpccRegs + AETCTL_REG_OFFSET);
    ssContext.configEDMA.IER =
        REG((UInt32)Power_tpccRegs + IER_REG_OFFSET);
    ssContext.configEDMA.IERH =
        REG((UInt32)Power_tpccRegs + IERH_REG_OFFSET);
    ssContext.configEDMA.QEER =
        REG((UInt32)Power_tpccRegs + QEER_REG_OFFSET);

    /* bulk save of all PaRAMs (8 regs * 128 PaRAMs */
    wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + OPT0_REG_OFFSET);
    for (i = 0; i < (8 * 128); i++) {
        ssContext.configEDMA.PaRAMs[i] = *wordPtr++;
    }

    /* = = = = = = = = */

    /* save CPU control registers */
    ssContext.cpuSysRegs.AMR = AMR;
    ssContext.cpuSysRegs.CSR = CSR;
    ssContext.cpuSysRegs.IER = IER;
    ssContext.cpuSysRegs.ISTP = ISTP;
    ssContext.cpuSysRegs.IRP = IRP;
    ssContext.cpuSysRegs.IRP = ILC;
    ssContext.cpuSysRegs.IRP = RILC;
    ssContext.cpuSysRegs.IRP = REP;
    ssContext.cpuSysRegs.IRP = FADCR;
    ssContext.cpuSysRegs.IRP = FAUCR;
    ssContext.cpuSysRegs.IRP = FMCR;
    ssContext.cpuSysRegs.SSR = SSR;
    ssContext.cpuSysRegs.GPLYB = GPLYA;
    ssContext.cpuSysRegs.GPLYB = GPLYB;
    ssContext.cpuSysRegs.GFPGFR = GFPGFR;
    ssContext.cpuSysRegs.TSR = TSR;
    ssContext.cpuSysRegs.ITSR = ITSR;
    ssContext.cpuSysRegs.IERR = IERR;

    /* = = = = = = = = */

    /* sample and set the 'TSC is running' state flag */
    tmp1 = TSCL;
    tmp2 = TSCL;
    if (tmp1 == tmp2) {
        ssContext.tscRunning = 0;
    }
    else {
        ssContext.tscRunning = 1;
    }

    /* determine L1P Ram Size and save its content away */
    switch (ssContext.configINTC.L1PCFG) {
        case Cache_L1Size_0K:
            ssContext.sizeOfL1PSram = 0x8000;
	    break;
        case Cache_L1Size_4K:
            ssContext.sizeOfL1PSram = 0x7000;
	    break;
        case Cache_L1Size_8K:
            ssContext.sizeOfL1PSram = 0x6000;
	    break;
        case Cache_L1Size_16K:
            ssContext.sizeOfL1PSram = 0x4000;
	    break;
        default:
            ssContext.sizeOfL1PSram = 0x0;
    }

    /* determine L1D Ram Size and save its content away */
    switch (ssContext.configINTC.L1DCFG) {
        case Cache_L1Size_0K:
            ssContext.sizeOfL1DSram = 0x8000;
	    break;
        case Cache_L1Size_4K:
            ssContext.sizeOfL1DSram = 0x7000;
	    break;
        case Cache_L1Size_8K:
            ssContext.sizeOfL1DSram = 0x6000;
	    break;
        case Cache_L1Size_16K:
            ssContext.sizeOfL1DSram = 0x4000;
	    break;
        default:
            ssContext.sizeOfL1DSram = 0x0;
    }

    /* determine L2 Ram Size and save its content away */
    switch (ssContext.configINTC.L2CFG) {
        case Cache_L2Size_0K:
            ssContext.sizeOfL2Sram = 0x48000;
	    break;
        case Cache_L2Size_32K:
            ssContext.sizeOfL2Sram = 0x40000;
	    break;
        case Cache_L2Size_64K:
            ssContext.sizeOfL2Sram = 0x38000;
	    break;
        case Cache_L2Size_128K:
            ssContext.sizeOfL2Sram = 0x28000;
	    break;
        default:
            ssContext.sizeOfL2Sram = 0x8000;
    }

    /* write back any dirty lines in the cache */
    Cache_wbAll();

    /* Note: This won't work as you can't write to L1P
    wordPtr = (UInt32 *)((UInt32)L1PSramBase);
    for (i = 0; i < ssContext.sizeOfL1PSram; i++) {
        ssContext.cpuRam.L1PSram[i] = *wordPtr++;
    }
    */

    wordPtr = (UInt32 *)((UInt32)L1DSRAMBASE);
    for (i = 0; i < ssContext.sizeOfL1DSram / 4; i++) {
        ssContext.cpuRam.L1DSram[i] = *wordPtr++;
    }

    wordPtr = (UInt32 *)((UInt32)L2SRAMBASE);
    for (i = 0; i < ssContext.sizeOfL2Sram / 4; i++) {
        ssContext.cpuRam.L2Sram[i] = *wordPtr++;
    }

    /* now disable the data caches... */
    cacheSize.l1pSize = (Cache_L1Size)
                        (ssContext.configINTC.L1PCFG & CACHE_MODE_MASK);
    cacheSize.l1dSize = Cache_L1Size_0K;
    cacheSize.l2Size = Cache_L2Size_0K;
    Cache_setSize(&cacheSize);

    /* L1D and L2 cache are disabled at this point */
    /* set reset-function-sampled 'doing a resume' flag */
    ti_sysbios_family_c66_vayu_Power_doResume = 1;

    /* set the ready-to-standby flag (an FYI for the MPU) */
    ti_sysbios_family_c66_vayu_Power_readyIdle = 1;

    /* setup PDC to put GEM into standby when execute IDLE */
    REG(PDCCMD_REG) = PDCCMD_STANDBY;
    REG(PDCCMD_REG);

    if (Power_useStandbyTestFxn) {
        /* make function call to standby test function ... */
        reset = ti_sysbios_family_c66_vayu_Power_standbyTest(
            &ti_sysbios_family_c66_vayu_Power_cpuRegs);
    }
    else {
        /* make function call to do standby ... */
        reset = ti_sysbios_family_c66_vayu_Power_standby(
            &ti_sysbios_family_c66_vayu_Power_cpuRegs);
    }

    /* = = = = = = = = */

    /* NOTE: return here both when woke from IDLE, or resumed after reset */

    /* = = = = = = = = */

    if (reset != 0) {
        /* restore CPU control registers */
        AMR = ssContext.cpuSysRegs.AMR;
        CSR = ssContext.cpuSysRegs.CSR;
        IER = ssContext.cpuSysRegs.IER;
        ISTP = ssContext.cpuSysRegs.ISTP;
        IRP = ssContext.cpuSysRegs.IRP;
        ILC = ssContext.cpuSysRegs.IRP;
        RILC = ssContext.cpuSysRegs.IRP;
        REP = ssContext.cpuSysRegs.IRP;
        FADCR = ssContext.cpuSysRegs.IRP;
        FAUCR = ssContext.cpuSysRegs.IRP;
        FMCR = ssContext.cpuSysRegs.IRP;
        SSR = ssContext.cpuSysRegs.SSR;
        GPLYA = ssContext.cpuSysRegs.GPLYB;
        GPLYB = ssContext.cpuSysRegs.GPLYB;
        GFPGFR = ssContext.cpuSysRegs.GFPGFR;
        TSR = ssContext.cpuSysRegs.TSR;
        ITSR = ssContext.cpuSysRegs.ITSR;
        IERR = ssContext.cpuSysRegs.IERR;

        /* = = = = = = = = */

        /* restore the cache registers first */
        REG(L2CFG_REG) = ssContext.configINTC.L2CFG;
        REG(L1PCFG_REG) = ssContext.configINTC.L1PCFG;
        REG(L1PCC_REG) = ssContext.configINTC.L1PCC;
        REG(L1DCFG_REG) = ssContext.configINTC.L1DCFG;
        REG(L1DCC_REG) = ssContext.configINTC.L1DCC;

        /* restore MAR registers starting at MAR12 */
        wordPtr = (UInt32 *)(MAR12_REG);
        for (i = 0; i < sizeof(ssContext.configINTC.MAR) / 4; i++) {
            *wordPtr++ = ssContext.configINTC.MAR[i];
        }

        /*
         *  restore contents of L1/L2 RAM
         *  todo:  Need to use DMA for L1PRAM
         */
        wordPtr = (UInt32 *)((UInt32)L1DSRAMBASE);
        for (i = 0; i < ssContext.sizeOfL1DSram / 4; i++) {
            *wordPtr++ = ssContext.cpuRam.L1DSram[i];
        }

        wordPtr = (UInt32 *)((UInt32)L2SRAMBASE);
        for (i = 0; i < ssContext.sizeOfL2Sram / 4; i++) {
            *wordPtr++ = ssContext.cpuRam.L2Sram[i];
        }

        /* continue with INTC context registers */
        REG(EVTMASK0_REG) = ssContext.configINTC.EVTMASK0;
        REG(EVTMASK1_REG) = ssContext.configINTC.EVTMASK1;
        REG(EVTMASK2_REG) = ssContext.configINTC.EVTMASK2;
        REG(EVTMASK3_REG) = ssContext.configINTC.EVTMASK3;
        REG(EXPMASK0_REG) = ssContext.configINTC.EXPMASK0;
        REG(EXPMASK1_REG) = ssContext.configINTC.EXPMASK1;
        REG(EXPMASK2_REG) = ssContext.configINTC.EXPMASK2;
        REG(EXPMASK3_REG) = ssContext.configINTC.EXPMASK3;
        REG(INTMUX1_REG) = ssContext.configINTC.INTMUX1;
        REG(INTMUX2_REG) = ssContext.configINTC.INTMUX2;
        REG(INTMUX3_REG) = ssContext.configINTC.INTMUX3;
        REG(AEGMUX0_REG) = ssContext.configINTC.AEGMUX0;
        REG(AEGMUX1_REG) = ssContext.configINTC.AEGMUX1;
        REG(INTDMASK_REG) = ssContext.configINTC.INTDMASK;
        REG(PDCCMD_REG) = ssContext.configINTC.PDCCMD;

        /* restore PAMAP registers starting at PAMAP0 */
        wordPtr = (UInt32 *)(PAMAP0_REG);
        for (i = 0; i < sizeof(ssContext.configINTC.PAMAP) / 4; i++) {
            *wordPtr++ = ssContext.configINTC.PAMAP[i];
        }

        /* restore L2MPPA registers starting at L2MPPA0 */
        wordPtr = (UInt32 *)(L2MPPA0_REG);
        for (i = 0; i < sizeof(ssContext.configINTC.L2MPPA) / 4; i++) {
            *wordPtr++ = ssContext.configINTC.L2MPPA[i];
        }

        /* restore L1PMPPA registers starting at L1PMPPA16 */
        wordPtr = (UInt32 *)(L1PMPPA16_REG);
        for (i = 0; i < sizeof(ssContext.configINTC.L1PMPPA) / 4; i++) {
            *wordPtr++ = ssContext.configINTC.L1PMPPA[i];
        }

        /* restore L1DMPPA registers starting at L1DMPPA16 */
        wordPtr = (UInt32 *)(L1DMPPA16_REG);
        for (i = 0; i < sizeof(ssContext.configINTC.L1DMPPA) / 4; i++) {
            *wordPtr++ = ssContext.configINTC.L1DMPPA[i];
        }

        /* = = = = = = = = */

        /* restore System context */
        REG((UInt32)Power_systemRegs + DSP_SYS_SYSCONFIG_OFFSET) =
            ssContext.configSystem.DSP_SYS_SYSCONFIG;
        REG((UInt32)Power_systemRegs + BUSCONFIG_REG_OFFSET) =
            ssContext.configSystem.BUSCONFIG;
        REG((UInt32)Power_systemRegs + IRQWAKEEN0_REG_OFFSET) =
            ssContext.configSystem.IRQWAKEEN0;
        REG((UInt32)Power_systemRegs + IRQWAKEEN1_REG_OFFSET) =
            ssContext.configSystem.IRQWAKEEN1;
        REG((UInt32)Power_systemRegs + DMAWAKEEN0_REG_OFFSET) =
            ssContext.configSystem.DMAWAKEEN0;
        REG((UInt32)Power_systemRegs + DMAWAKEEN1_REG_OFFSET) =
            ssContext.configSystem.DMAWAKEEN1;
        REG((UInt32)Power_systemRegs + EVTOUTSET_REG_OFFSET) =
            ssContext.configSystem.EVTOUTSET;
        REG((UInt32)Power_systemRegs + ERRINTIRQENABLESET_REG_OFFSET) =
            ssContext.configSystem.ERRINTIRQENABLESET;
        REG((UInt32)Power_systemRegs + EDMAWAKE0IRQENABLESET_REG_OFFSET) =
            ssContext.configSystem.EDMAWAKE0IRQENABLESET;
        REG((UInt32)Power_systemRegs + EDMAWAKE1IRQENABLESET_REG_OFFSET) =
            ssContext.configSystem.EDMAWAKE1IRQENABLESET;

        /* = = = = = = = = */

        /* restore EDMA context */
        REG((UInt32)Power_tpccRegs + CLKGDIS_REG_OFFSET) =
            ssContext.configEDMA.CLKGDIS;

        /* restore DMA chan to PARAM mapping registers */
        wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DCHMAP0_REG_OFFSET);
        for (i = 0; i < 64; i++) {
            *wordPtr++ = ssContext.configEDMA.DCHMAP[i];
        }

        /* restore QDMA chan to PARAM mapping registers */
        wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + QCHMAP0_REG_OFFSET);
        for (i = 0; i < 8; i++) {
            *wordPtr++ = ssContext.configEDMA.QCHMAP[i];
        }

        /* restore DMA queue mapping registers */
        wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DMAQNUM0_REG_OFFSET);
        for (i = 0; i < 8; i++) {
            *wordPtr++ = ssContext.configEDMA.DMAQNUM[i];
        }

        REG((UInt32)Power_tpccRegs + QDMAQNUM_REG_OFFSET) =
            ssContext.configEDMA.QDMAQNUM;
        REG((UInt32)Power_tpccRegs + QUETCMAP_REG_OFFSET) =
            ssContext.configEDMA.QUETCMAP;
        REG((UInt32)Power_tpccRegs + QUEPRI_REG_OFFSET) =
            ssContext.configEDMA.QUEPRI;

        /* restore DMA and QDMA region access enable bits */
        wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + DRAEM0_REG_OFFSET);
        for (i = 0; i < (8 * 3); i++) {
            *wordPtr++ = ssContext.configEDMA.regionAccessBits[i];
        }

        REG((UInt32)Power_tpccRegs + QWMTHRA_REG_OFFSET) =
            ssContext.configEDMA.QWMTHRA;
        REG((UInt32)Power_tpccRegs + AETCTL_REG_OFFSET) =
            ssContext.configEDMA.AETCTL;

        /* restore interrupt enable registers (using IESR and IESRH) */
        REG((UInt32)Power_tpccRegs + IESR_REG_OFFSET) =
            ssContext.configEDMA.IER;
        REG((UInt32)Power_tpccRegs + IESRH_REG_OFFSET) =
            ssContext.configEDMA.IERH;

        /* restore QDMA event enable register (using QEESR) */
        REG((UInt32)Power_tpccRegs + QEESR_REG_OFFSET) =
            ssContext.configEDMA.QEER;

        /* restore all PaRAMs (8 regs * 128 PaRAMs */
        wordPtr = (UInt32 *)((UInt32)Power_tpccRegs + OPT0_REG_OFFSET);
        for (i = 0; i < (8 * 128); i++) {
            *wordPtr++ = ssContext.configEDMA.PaRAMs[i];
        }
    }
    else {
	/* restore PDCCMD to pre-standy state */
        REG(PDCCMD_REG) = ssContext.configINTC.PDCCMD;

        /* restore caches to their pre-standby enable state */
        REG(L2CFG_REG) = ssContext.configINTC.L2CFG;
        REG(L1PCFG_REG) = ssContext.configINTC.L1PCFG;
        REG(L1PCC_REG) = ssContext.configINTC.L1PCC;
        REG(L1DCFG_REG) = ssContext.configINTC.L1DCFG;
        REG(L1DCC_REG) = ssContext.configINTC.L1DCC;
    }

    /* if TSC was enabled on entry: start it again */
    if (ssContext.tscRunning == 1) {
        TSCL = 1;       /* write any value to TSC to kick start it */
    }

    /* clear the ready-to-standby flag */
    ti_sysbios_family_c66_vayu_Power_readyIdle = 0;

    /* clear the reset-sampled 'do resume' flag */
    ti_sysbios_family_c66_vayu_Power_doResume = 0;

    /* re-enable scheduling */
    Task_restore(ssContext.taskKey);
    Swi_restore(ssContext.swiKey);

    /* re-enable interrupts */
    Hwi_restore(ssContext.hwiKey);

    return (reset);
}

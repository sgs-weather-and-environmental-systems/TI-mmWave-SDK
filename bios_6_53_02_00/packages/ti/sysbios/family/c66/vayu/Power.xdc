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
 *  ======== Power.xdc ========
 *
 *
 */

package ti.sysbios.family.c66.vayu;

/*!
 *  ======== Power ========
 *  Power Module
 *
 *  This module is used to reduce power consumption of the DSP subsystem.
 *
 *  Suspend/Resume with Hibernation: The DSP subsystem context is saved to
 *  external RAM, and GEM is put into standby.  Upon the standby transition,
 *  PRCM will transition the power domain to off.  Upon release from reset, the
 *  CPU will start executing from reset; a reset hook function will hijack the
 *  boot process, restore CPU state, return back into the Power_suspend() API,
 *  which will restore the remaining DSP subsystem context, and then return
 *  to its caller, to resume the application.
 *
 *  The application must explicitly call to Power_suspend() for Suspend/Resume
 *  functionality.
 *
 *  Suspend/Resume can be invoked from Task, Swi, or Idle loop context.
 *  It cannot be invoked from Hwi context.
 */
@DirectCall

module Power
{
    /*! Suspend Level. */
    enum  Suspend {
        Suspend_HIBERNATE       /*! Suspend to HIBERNATE state */
    };

    /*! Base address of EDMA TPCC registers */
    config Ptr tpccRegs = 0x03300000;

    /*! Base address of SYSC registers */
    config Ptr systemRegs = 0x01D00000;

    /*! Name of segment to load Power's reset code and saved context */
    metaonly config String loadSegment = "EXT_RAM";

    /*!
     *  ======== suspend ========
     *  Function used for suspend/resume of the DSP subsystem.
     *
     *  This function will save DSP subsystem context and then put GEM into
     *  standby, as the final steps for a transition to
     *  hibernate (also referred to as off-mode).
     *
     *  Prior to invoking this function the application software must prepare
     *  for suspend, which includes: configuring PRCM for the appropriate
     *  transition once GEM goes to standby; disabling unintended wakeup
     *  interrupts, and configuring intended wakeups; taking care of any
     *  required notifications to software components; and 'quieting' of the
     *  DSP application (e.g., ensuring that all in-progress EDMA activity
     *  completes).
     */
    UInt suspend(Suspend level);

internal:

    config Bool useStandbyTestFxn = false;

    struct CpuSysRegs {
        UInt32  AMR;
        UInt32  CSR;
        UInt32  IER;
        UInt32  ISTP;
        UInt32  IRP;
        UInt32  ILC;
        UInt32  RILC;
        UInt32  REP;
        UInt32  FADCR;
        UInt32  FAUCR;
        UInt32  FMCR;
        UInt32  SSR;
        UInt32  GPLYA;
        UInt32  GPLYB;
        UInt32  GFPGFR;
        UInt32  TSR;
        UInt32  ITSR;
        UInt32  IERR;
    }

    struct IntcConfig {
        UInt32 EVTMASK0;
        UInt32 EVTMASK1;
        UInt32 EVTMASK2;
        UInt32 EVTMASK3;
        UInt32 EXPMASK0;
        UInt32 EXPMASK1;
        UInt32 EXPMASK2;
        UInt32 EXPMASK3;
        UInt32 INTMUX1;
        UInt32 INTMUX2;
        UInt32 INTMUX3;
        UInt32 AEGMUX0;
        UInt32 AEGMUX1;
        UInt32 INTDMASK;
        UInt32 PDCCMD;
        UInt32 PAMAP[16];
        UInt32 L2CFG;
        UInt32 L1PCFG;
        UInt32 L1PCC;
        UInt32 L1DCFG;
        UInt32 L1DCC;
        UInt32 MAR[244];
        UInt32 L2MPPA[32];
        UInt32 L1PMPPA[16];
        UInt32 L1DMPPA[16];
    };

    struct SystemConfig {
        UInt32 DSP_SYS_SYSCONFIG;
        UInt32 BUSCONFIG;
        UInt32 IRQWAKEEN0;
        UInt32 IRQWAKEEN1;
        UInt32 DMAWAKEEN0;
        UInt32 DMAWAKEEN1;
        UInt32 EVTOUTSET;
        UInt32 ERRINTIRQENABLESET;
        UInt32 EDMAWAKE0IRQENABLESET;
        UInt32 EDMAWAKE1IRQENABLESET;
    };

    struct EdmaConfig {
        UInt32 CLKGDIS;
        UInt32 DCHMAP[64];
        UInt32 QCHMAP[8];
        UInt32 DMAQNUM[8];
        UInt32 QDMAQNUM;
        UInt32 QUETCMAP;
        UInt32 QUEPRI;
        UInt32 regionAccessBits[24];
        UInt32 QWMTHRA;
        UInt32 AETCTL;
        UInt32 IER;
        UInt32 IERH;
        UInt32 QEER;
        UInt32 PaRAMs[1024];
    };

    struct CpuRam {
        UInt32 L1PSram[8192];   /* space for 32KB of L1P SRAM */
        UInt32 L1DSram[8192];   /* space for 32KB of L1D SRAM */
        UInt32 L2Sram[73728];   /* space for 288KB of L2 SRAM */
    }

    struct SubsystemContext {
        CpuSysRegs      cpuSysRegs;
        IntcConfig      configINTC;
        SystemConfig    configSystem;
        EdmaConfig      configEDMA;
        CpuRam          cpuRam;
        UInt32          taskKey;
        UInt32          swiKey;
        UInt32          hwiKey;
        UInt32          sizeOfL1PSram;
        UInt32          sizeOfL1DSram;
        UInt32          sizeOfL2Sram;
        Bool            tscRunning;
    };

    /*!
     *  ======== resetFxn ========
     *  Startup reset function that checks if coming out of a processor reset
     *  due to Power_suspend().  If no, it will simply return.  If yes, it
     *  will restore CPU context, and return using a saved return pointer,
     *  warping back into the Power_suspend API.
     */
    Void resetFxn();

    /*!
     *  ======== standby ========
     *  Function used for final CPU register save and transition to standby.
     */
    UInt standby(UInt32 *cpuRegs);

    /*!
     *  ======== standbyTest ========
     *  Function only for testing save/restore
     */
    UInt standbyTest(UInt32 *cpuRegs);
}

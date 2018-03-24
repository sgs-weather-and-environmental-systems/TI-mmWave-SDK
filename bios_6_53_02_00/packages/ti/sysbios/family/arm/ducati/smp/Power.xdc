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
 *  ======== Power.xdc ========
 *
 *
 */

package ti.sysbios.family.arm.ducati.smp;

import ti.sysbios.knl.Task;
import ti.sysbios.knl.Semaphore;
import ti.sysbios.family.arm.ducati.GateSmp;

/*!
 *  ======== Power ========
 *  Power support for Ducati on OMAP4430.
 */
@DirectCall
module Power
{
    /*! Suspend function hook. */
    typedef Void (*SuspendFuncHookPtr)();

    /*! Suspend arguments structure. */
    struct SuspendArgs {
        Bool pmMasterCore;     /*! Master core for suspend/resume? */
        Bool rendezvousResume; /*! Rendezvous before resume? */
        Int dmaChannel;        /*! SDMA channel for L2 RAM save; -1=CPU copy */
        UInt intMask31_0;     /*! Mask of interrupts (31-0) able to wake WFI */
        UInt intMask63_32;    /*! Mask of interrupts (63-32) able to wake WFI */
        UInt intMask79_64;    /*! Mask of interrupts (79-64) able to wake WFI */
    };

    /*! Physical address of L2 RAM */
    const Ptr L2RAM = 0x55020000;

    /*! Base address of SDMA registers */
    config Ptr sdmaRegs = 0x4A056000;

    /*! Idle the CPUs when threads blocked waiting for interrupts? */
    config Bool idle = false;

    /*! Segment to load Power's shared reset code and data */
    metaonly config String loadSegment = "EXT_RAM";

    /*! 
     *  Pre-suspend function hooks.  Called on Core 0 (only), before beginning 
     *  context save.
     *
     *  To configure a function to run as Pre suspend hook, add a statement
     *  like the following to the application configuration script:
     * 
     *  @p(code)
     *  Power.preSuspendHooks.$add("&myHook");
     *  @p
     *
     *  Multiple hook functions can be added following this same pattern.
     */
    config SuspendFuncHookPtr preSuspendHooks[length] = [];

    /*! 
     *  Post-suspend function hooks.  Called on Core 0 (only), after context
     *  restore, immediately before returning from suspend.
     *
     *  To configure a function to run as Post suspend hook, add a statement
     *  like the following to the application configuration script:
     * 
     *  @p(code)
     *  Power.postSuspendHooks.$add("&myHook");
     *  @p
     *
     *  Multiple hook functions can be added following this same pattern.
     */
    config SuspendFuncHookPtr postSuspendHooks[length] = [];

    /*!
     *  ======== idleCPU ========
     *  Function used to automatically idle the CPU in the Idle loop.
     *
     *  When the 'idle' configuration parameter is set, this function will
     *  be added to the list of Idle loop functions.  When called from the
     *  Idle loop, it will invoke the wait for interrupt (WFI) instruction,
     *  to idle the CPU until the next interrupt occurs.
     */
    Void idleCPU();

    /*!
     *  ======== suspend ========
     *  Function used for suspend/resume of the M3 cores.
     *
     *  Precondition and usage constraints: 
     *   
     *  1) Before this function is called the application must disable all 
     *     interrupts that are not desired to wake the CPU from WFI while 
     *     waiting for the core domain to go off.  
     *
     *  2) For those interrupts that are desired to wake the CPU from WFI (for
     *     example, the mailbox interrupt), these interrupts cannot be generated
     *     until the Power_suspend API has reached the point of executing WFI.
     *     If the interrupts happen early, while this API is saving context,
     *     the resulting context may be stale, and the application may not 
     *     resume correctly.  Two global flags (one for each M3 core) are 
     *     assert immediately before invoking WFI; the wakeup interrupts 
     *     should not be asserted until these flags are asserted (non-zero):
     *          ti_sysbios_family_arm_ducati_smp_readyIdleCore0
     *          ti_sysbios_family_arm_ducati_smp_readyIdleCore1
     */
    UInt suspend(SuspendArgs * args);

internal:

    struct Struct8 {
        UInt32 a0;
        UInt32 a1;
        UInt32 a2;
        UInt32 a3;
        UInt32 a4;
        UInt32 a5;
        UInt32 a6;
        UInt32 a7;
    }

    struct Struct10 {
        UInt32 a0;
        UInt32 a1;
        UInt32 a2;
        UInt32 a3;
        UInt32 a4;
        UInt32 a5;
        UInt32 a6;
        UInt32 a7;
        UInt32 a8;
        UInt32 a9;
    }

    struct TablePIDS {
        UInt32 PID1;
        UInt32 PID2;
    }

    struct IPRxRegs {
        UInt32 IPR0;
        UInt32 IPR1;
        UInt32 IPR2;
        UInt32 IPR3;
        UInt32 IPR4;
        UInt32 IPR5;
        UInt32 IPR6;
        UInt32 IPR7;
        UInt32 IPR8;
        UInt32 IPR9;
        UInt32 IPR10;
        UInt32 IPR11;
        UInt32 IPR12;
        UInt32 IPR13;
        UInt32 IPR14;
        UInt32 IPR15;
    }

    struct CfgRegs {
        UInt32 VTOR;
        UInt32 AIRCR;
        UInt32 SCR;
        UInt32 CCR;
        UInt32 SHPR0;
        UInt32 SHPR4;
        UInt32 SHPR8;
        UInt32 SHCSR;
    }

    struct NVICContext {
        UInt32 AUXCTRL;
        UInt32 STCSR;
        UInt32 STRVR;
        UInt32 ISER0;
        UInt32 ISER1;
        UInt32 SCR;
        IPRxRegs iprRegs;
        CfgRegs cfgRegs;
    }

    struct ContextAMMU {
        UInt32 largeAddr[4];
        UInt32 largeXlteAddr[4];
        UInt32 largePolicy[4];
        UInt32 medAddr[2];
        UInt32 medXlteAddr[2];
        UInt32 medPolicy[2];
        Struct10 smallAddr;
        Struct10 smallXlteAddr;
        Struct10 smallPolicy;
        UInt32 mmuConfig;
    }

    struct ContextCTM {
        UInt32 CNTL;
        UInt32 STMCNTL;
        UInt32 STMMSTID;
        UInt32 STMINTVL;
        UInt32 STMSEL0;
        UInt32 TINTVLR0;
        UInt32 TINTVLR1;
        UInt32 GNBL0;
        Struct8 control;
    }

    struct CpuRegs {
        UInt32 R4;
        UInt32 R5;
        UInt32 R6;
        UInt32 R7;
        UInt32 R8;
        UInt32 R9;
        UInt32 R10;
        UInt32 R11;
        UInt32 LR;
        UInt32 CONTROL;
        UInt32 BASEPRI;
        UInt32 MSP;
        UInt32 pSP;
    }

    struct PrivateContext {
        CpuRegs privateCPU;
        NVICContext privateNVIC;
        TablePIDS privatePIDS;
    } 

    struct UnicacheConfig {
        UInt32 L1_CONFIG;
        UInt32 L1_OCP;
    }

    struct SubsystemContext {
        UInt32 WUGEN_MEVT0;
        UInt32 WUGEN_MEVT1;
        UnicacheConfig cacheConfig;
        ContextAMMU ammuConfig;
        ContextCTM ctmConfig;
    }

    struct DucatiContext {
        PrivateContext masterContext;
        PrivateContext slaveContext;
        SubsystemContext ssContext;
    }

    struct SdmaRegs {
        volatile UInt32 CCR;
        UInt32 CLNK;
        UInt32 CICR;
        UInt32 CSR;
        UInt32 CSDP;
        UInt32 CEN;
        UInt32 CFN;
        UInt32 CSSA;
        UInt32 CDSA;
        UInt32 CSEI;
        UInt32 CSFI;
        UInt32 CDEI;
        UInt32 CDFI;
    }

    config Bool enable = true;

    config GateSmp.Handle gate;

    config Task.Handle taskCore0;
    
    config Task.Handle taskCore1;

    config Semaphore.Handle semCore0;

    config Semaphore.Handle semCore1;

    /*!
     *  ======== taskFxnCore0 ========
     *  Task function that will invoke Power_doSuspend() on Core 0.
     */
    @DirectCall
    Void taskFxnCore0(UArg arg1, UArg arg2);

    /*!
     *  ======== taskFxnCore1 ========
     *  Task function that will invoke Power_doSuspend() on Core 1.
     */
    @DirectCall
    Void taskFxnCore1(UArg arg1, UArg arg2);

    /*!
     *  ======== doSuspend ========
     *  Function to "do" the actual suspend/resume.
     */
    @DirectCall
    UInt doSuspend(SuspendArgs * args);

    /*!
     *  ======== saveCpuRegs ========
     *  Function used to save parent-preserved CPU register context, assert
     *  ready to idle flag, and invoke WFI.
     */
    UInt32 saveCpuRegs(Ptr saveAddress, Ptr readyFlag);

    /*
     *  ======== Module_State ========
     */
    struct Module_State {
        UInt dmaChan0;
        UInt resetFlag0;
        UInt resetFlag1;
        UInt intMask31_0;
        UInt intMask63_32;
        UInt intMask79_64;
    }
}


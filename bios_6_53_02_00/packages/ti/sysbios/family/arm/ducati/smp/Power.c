/*
 * Copyright (c) 2012-2015, Texas Instruments Incorporated
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

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/hal/Core.h>
#include <ti/sysbios/hal/unicache/Cache.h>
#include <ti/sysbios/hal/ammu/AMMU.h>

#include <ti/sysbios/family/arm/m3/Hwi.h>

#include <ti/sysbios/family/arm/ducati/CTM.h>

#include <ti/sysbios/family/arm/ducati/GateSmp.h>

#include "package/internal/Power.xdc.h"

#define _VERBOSE_ 0

#define REG(x) (*((volatile UInt32 *)(x)))

#define RW_TABLE_REGS   0xE00FE000
#define INTERCOREBIT    0x80000     /* M3->M3 interrupt number */

#define SLEEPDEEP       0x00000004  /* SLEEPDEEP bit */

#define WUGEN_MEVT0_REG 0x4000100C
#define WUGEN_MEVT1_REG 0x40001010

extern UInt32 ti_sysbios_family_arm_ducati_smp_doResumeCore0;
extern UInt32 ti_sysbios_family_arm_ducati_smp_doResumeCore1;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readyIdleCore0;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readyIdleCore1;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readyGoCore0;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readyGoCore1;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readySyncCore0;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_readySyncCore1;
extern UInt32 ti_sysbios_family_arm_ducati_smp_waitResumeCore0;
extern UInt32 ti_sysbios_family_arm_ducati_smp_waitResumeCore1;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_doneCore0;
extern volatile UInt32 ti_sysbios_family_arm_ducati_smp_doneCore1;
extern UInt32 ti_sysbios_family_arm_ducati_smp_doRestoreL2Core0;
extern UInt32 ti_sysbios_family_arm_ducati_smp_doRestoreL2Core1;
extern UInt32 ti_sysbios_family_arm_ducati_smp_startL2RAM;
extern UInt32 ti_sysbios_family_arm_ducati_smp_contextL2RAM;

#ifdef __ti__
#pragma DATA_SECTION(ti_sysbios_family_arm_ducati_smp_Power_savedContext, ".ti_sysbios_family_arm_ducati_smp_Power");
Power_DucatiContext ti_sysbios_family_arm_ducati_smp_Power_savedContext;
#else
Power_DucatiContext ti_sysbios_family_arm_ducati_smp_Power_savedContext __attribute__ ((section (".ti_sysbios_family_arm_ducati_smp_Power")));
#endif

#ifdef __ti__
#pragma DATA_SECTION(ti_sysbios_family_arm_ducati_smp_Power_savedRAM, ".ti_sysbios_family_arm_ducati_smp_Power");
UInt32 ti_sysbios_family_arm_ducati_smp_Power_savedRAM[16384];
#else
UInt32 ti_sysbios_family_arm_ducati_smp_Power_savedRAM[16384] __attribute__ ((section (".ti_sysbios_family_arm_ducati_smp_Power")));
#endif


/*
 *  ======== Power_idleCPU ========
 */
Void Power_idleCPU()
{
    asm(" wfi");
}


/*
 *  ======== Power_taskFxnCore0 ========
 */
Void Power_taskFxnCore0(UArg arg1, UArg arg2)
{
    Power_SuspendArgs args;

    args.pmMasterCore = 1;
    args.rendezvousResume = 1;

    while (TRUE) {
        Semaphore_pend(Power_semCore0, BIOS_WAIT_FOREVER);

        args.dmaChannel = Power_module->dmaChan0;
        args.intMask31_0 = Power_module->intMask31_0;
        args.intMask63_32 = Power_module->intMask63_32;
        args.intMask79_64 = Power_module->intMask79_64;

        GateSmp_sync(Power_gate);

        Power_module->resetFlag0 = Power_doSuspend(&args);
    }
}


/*
 *  ======== Power_taskFxnCore1 ========
 */
Void Power_taskFxnCore1(UArg arg1, UArg arg2)
{
    Power_SuspendArgs args;

    args.pmMasterCore = 0;
    args.rendezvousResume = 1;
    args.dmaChannel = -1;

    while (TRUE) {
        Semaphore_pend(Power_semCore1, BIOS_WAIT_FOREVER);

        args.intMask31_0 = INTERCOREBIT;
        args.intMask63_32 = 0;
        args.intMask79_64 = 0;

        GateSmp_sync(Power_gate);

        Power_module->resetFlag1 = Power_doSuspend(&args);
    }
}


/*
 *  ======== Power_suspend ========
 */
UInt Power_suspend(Power_SuspendArgs * args)
{
    if (Power_enable) {

        UInt32 taskKey;

        /* pull args and stash into module state */
        Power_module->intMask31_0 = args->intMask31_0;
        Power_module->intMask63_32 = args->intMask63_32;
        Power_module->intMask79_64 = args->intMask79_64;

        /* post semaphores to activate Power tasks on each core */
        taskKey = Task_disable();
        Semaphore_post(Power_semCore1);
        Semaphore_post(Power_semCore0);
  
        /* launch Power tasks simultaneously */
        Task_restore(taskKey);

        return(Power_module->resetFlag0);
    }
    else {
        return(0);
    }
}


/*
 *  ======== Power_doSuspend ========
 */
UInt Power_doSuspend(Power_SuspendArgs * args)
{
    Power_PrivateContext *ptrPrivCtx;
    Power_SdmaRegs *ptrSdmaRegs;
    Power_DucatiContext *ptrCtx;
    Power_IPRxRegs *ptrIPRxRegs;
    Power_CfgRegs *ptrCfgRegs;
    Power_CpuRegs *ptrCpuRegs;
    UInt32 *ptrReadyFlag;
    UInt32 *ptrRAMCtxBuf;
    Power_Struct10 *ptrStruct10;
    Power_Struct8 *ptrStruct8;
    UInt32 m3IrqMask0; 
    UInt32 m3IrqMask1;
    Bool cacheEnabled;
    UInt32 *ptrRAM;
    UInt32 coreID;
    UInt32 reset;
    UInt32 i;

    /* get core ID */
    coreID = Core_getId();

    /* call any configured pre suspend hook functions */
    if (coreID == 0) {
        for (i = 0; i < Power_preSuspendHooks.length; i++) {
            Power_preSuspendHooks.elem[i]();
        }
    }

    /* form IRQ masks */
    m3IrqMask0 = ( ((args->intMask31_0  >> 16) & 0x0000ffff) | 
                   ((args->intMask63_32 << 16) & 0xffff0000) );
    m3IrqMask1 = ( ((args->intMask63_32  >> 16) & 0x0000ffff) | 
                   ((args->intMask79_64 << 16) & 0xffff0000) );

    /* setup context pointers */
    ptrCtx = &ti_sysbios_family_arm_ducati_smp_Power_savedContext;
    ptrRAM = (UInt32 *) Power_L2RAM;
    ptrRAMCtxBuf = ti_sysbios_family_arm_ducati_smp_Power_savedRAM;

    if (args->pmMasterCore != 0) {              /* PM master */
        ptrPrivCtx = &ti_sysbios_family_arm_ducati_smp_Power_savedContext.masterContext;
        ptrCpuRegs = &ti_sysbios_family_arm_ducati_smp_Power_savedContext.masterContext.privateCPU;
    }
    else {                                      /* PM slave */
        ptrPrivCtx = &ti_sysbios_family_arm_ducati_smp_Power_savedContext.slaveContext;
        ptrCpuRegs = &ti_sysbios_family_arm_ducati_smp_Power_savedContext.slaveContext.privateCPU;
    }
    ptrIPRxRegs = (Power_IPRxRegs *)(&Hwi_nvic.IPR[0]);
    ptrCfgRegs = (Power_CfgRegs *)(&Hwi_nvic.VTOR);

    /* setup SDMA channel pointer */
    if (args->dmaChannel != -1) {
        ptrSdmaRegs = (Power_SdmaRegs *)((UInt32)Power_sdmaRegs + 
            (0x80 + args->dmaChannel * 0x60));
    }

    /* check if unicache is enabled */
    cacheEnabled = Cache_cache.L1_CONFIG & 0x2;

#if _VERBOSE_
    if (args->dmaChannel == -1) {
        ptrSdmaRegs = 0;
    }
    System_printf("Power_doSuspend\n");
    System_printf("    pmMasterCore = 0x%x\n", args->pmMasterCore);
    System_printf("    rendezvousResume = 0x%x\n", args->rendezvousResume);
    System_printf("    dmaChannel = 0x%x\n", args->dmaChannel);
    System_printf("    core ID = %d\n", coreID);
    System_printf("    unicache regs addr = 0x%x\n", &Cache_cache.L1_INFO);
    System_printf("    CTM regs addr = 0x%x\n", &CTM_ctm.CTCNTL);
    System_printf("    AMMU regs addr = 0x%x\n", &AMMU_mmu.LARGE_ADDR[0]);
    System_printf("    SDMA regs addr = 0x%x\n", Power_sdmaRegs);
    System_printf("    SDMA channel addr = 0x%x\n", ptrSdmaRegs);
    System_printf("    L2 base addr = 0x%x\n", ptrRAM);
    System_printf("    NVIC IPR regs addr = 0x%x\n", ptrIPRxRegs);
    System_printf("    NVIC CFG regs addr = 0x%x\n", ptrCfgRegs);
    System_printf("    ptrPrivCtx  = 0x%x\n", ptrPrivCtx);
    System_printf("    ptrCpuRegs  = 0x%x\n", ptrCpuRegs);
#endif

    /* = = = = = = = = */

    /* if PM master core, and rendezvous, wait till slave core signals ready */
    if ((args->pmMasterCore != 0) && (args->rendezvousResume)) {
        if (coreID == 0) {
            while(ti_sysbios_family_arm_ducati_smp_readyGoCore1 == 0) {};
        }
        else {
            while(ti_sysbios_family_arm_ducati_smp_readyGoCore0 == 0) {};
        }
    }

    /* = = = = = = = = */

    /* save private RW table registers */
    ptrPrivCtx->privatePIDS.PID1 = REG(RW_TABLE_REGS);
    ptrPrivCtx->privatePIDS.PID2 = REG(RW_TABLE_REGS + 0x4);

    /* = = = = = = = = */

    /* save private NVIC state */
    ptrPrivCtx->privateNVIC.AUXCTRL = Hwi_nvic.RES_08;
    ptrPrivCtx->privateNVIC.STCSR = Hwi_nvic.STCSR;
    ptrPrivCtx->privateNVIC.STRVR = Hwi_nvic.STRVR;
    ptrPrivCtx->privateNVIC.ISER0 = Hwi_nvic.ISER[0];
    ptrPrivCtx->privateNVIC.ISER1 = Hwi_nvic.ISER[1];
    ptrPrivCtx->privateNVIC.SCR = Hwi_nvic.SCR;
    ptrPrivCtx->privateNVIC.iprRegs = *ptrIPRxRegs;
    ptrPrivCtx->privateNVIC.cfgRegs = *ptrCfgRegs;

    /* = = = = = = = = */

    /* disable all interrupts not allowed to wake WFI */
    Hwi_nvic.ICER[0] = 0xffffffff;
    Hwi_nvic.ICER[1] = 0xffffffff;
    Hwi_nvic.ISER[0] = m3IrqMask0;
    Hwi_nvic.ISER[1] = m3IrqMask1;

    /* = = = = = = = = */

    /* if PM master core: save rest of Ducati S/S state */
    if (args->pmMasterCore != 0) {

        /* save unicache L1 config */
        ptrCtx->ssContext.cacheConfig.L1_CONFIG = Cache_cache.L1_CONFIG;
        ptrCtx->ssContext.cacheConfig.L1_OCP = Cache_cache.L1_OCP;

        /* = = = = = = = = */

        /* save WUGEN_MEVTx registers */
        ptrCtx->ssContext.WUGEN_MEVT0 = REG(WUGEN_MEVT0_REG);
        ptrCtx->ssContext.WUGEN_MEVT1 = REG(WUGEN_MEVT1_REG);

        /* set WUGEN_MEVTx registers for suspend */
        REG(WUGEN_MEVT0_REG) = m3IrqMask0;
        REG(WUGEN_MEVT1_REG) = m3IrqMask1;

        /* save AMMU config */
        /* save large page address registers */
        ptrCtx->ssContext.ammuConfig.largeAddr[0] = 
            (UInt32) AMMU_mmu.LARGE_ADDR[0];
        ptrCtx->ssContext.ammuConfig.largeAddr[1] = 
            (UInt32) AMMU_mmu.LARGE_ADDR[1];
        ptrCtx->ssContext.ammuConfig.largeAddr[2] = 
            (UInt32) AMMU_mmu.LARGE_ADDR[2];
        ptrCtx->ssContext.ammuConfig.largeAddr[3] = 
            (UInt32) AMMU_mmu.LARGE_ADDR[3];

        /* save large page translated address registers */
        ptrCtx->ssContext.ammuConfig.largeXlteAddr[0] = 
            (UInt32) AMMU_mmu.LARGE_XLTE[0];
        ptrCtx->ssContext.ammuConfig.largeXlteAddr[1] = 
            (UInt32) AMMU_mmu.LARGE_XLTE[1];
        ptrCtx->ssContext.ammuConfig.largeXlteAddr[2] = 
            (UInt32) AMMU_mmu.LARGE_XLTE[2];
        ptrCtx->ssContext.ammuConfig.largeXlteAddr[3] = 
            (UInt32) AMMU_mmu.LARGE_XLTE[3];

        /* save large page policy registers */
        ptrCtx->ssContext.ammuConfig.largePolicy[0] = AMMU_mmu.LARGE_POLICY[0];
        ptrCtx->ssContext.ammuConfig.largePolicy[1] = AMMU_mmu.LARGE_POLICY[1];
        ptrCtx->ssContext.ammuConfig.largePolicy[2] = AMMU_mmu.LARGE_POLICY[2];
        ptrCtx->ssContext.ammuConfig.largePolicy[3] = AMMU_mmu.LARGE_POLICY[3];

        /* save medium page address registers */
        ptrCtx->ssContext.ammuConfig.medAddr[0] = 
            (UInt32) AMMU_mmu.MEDIUM_ADDR[0];
        ptrCtx->ssContext.ammuConfig.medAddr[1] = 
            (UInt32) AMMU_mmu.MEDIUM_ADDR[1];

        /* save medium page translated address registers */
        ptrCtx->ssContext.ammuConfig.medXlteAddr[0] = 
            (UInt32) AMMU_mmu.MEDIUM_XLTE[0];
        ptrCtx->ssContext.ammuConfig.medXlteAddr[1] = 
            (UInt32) AMMU_mmu.MEDIUM_XLTE[1];

        /* save medium page policy registers */
        ptrCtx->ssContext.ammuConfig.medPolicy[0] = AMMU_mmu.MEDIUM_POLICY[0];
        ptrCtx->ssContext.ammuConfig.medPolicy[1] = AMMU_mmu.MEDIUM_POLICY[1];

        /* save small page address registers */
        ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_ADDR[0]);
        ptrCtx->ssContext.ammuConfig.smallAddr = *ptrStruct10;

        /* save small page translated address registers */
        ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_XLTE[0]);
        ptrCtx->ssContext.ammuConfig.smallXlteAddr = *ptrStruct10;

        /* save small page policy registers */
        ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_POLICY[0]);
        ptrCtx->ssContext.ammuConfig.smallPolicy = *ptrStruct10;

        ptrCtx->ssContext.ammuConfig.mmuConfig = REG(&AMMU_mmu.MSTAT + 1);

        /* = = = = = = = = */

        /* save CTM state */
        ptrCtx->ssContext.ctmConfig.CNTL = CTM_ctm.CTCNTL;

        /* save timer interval registers */
        ptrCtx->ssContext.ctmConfig.TINTVLR0 = CTM_ctm.TINTVLR[0];
        ptrCtx->ssContext.ctmConfig.TINTVLR1 = CTM_ctm.TINTVLR[1];

        /* save counter control registers */
        ptrStruct8 = (Power_Struct8 *)(&CTM_ctm.CTCR[0]);
        ptrCtx->ssContext.ctmConfig.control = *ptrStruct8;

        /* save global enable bits */
        ptrCtx->ssContext.ctmConfig.GNBL0 = CTM_ctm.CTGNBL[0];

        /* = = = = = = = = */

        /* if unicache enabled: flush and bypass L1 */
        if (cacheEnabled) {
            Cache_wbAll();
            Cache_invAll();   /* added to avoid TLB misses */
            Cache_disable(Cache_Type_L1);
        }

        /* = = = = = = = = */

        /* write out L2 RAM to external memory */

        if (args->dmaChannel != -1) {   /* use SDMA? */
            ptrSdmaRegs->CSDP = 0x00140002;             /* 32-bit size */
            ptrSdmaRegs->CEN  = 0x4000;                 /* 16K elements */
            ptrSdmaRegs->CFN  = 0x1;                    /* 1 frame */
            ptrSdmaRegs->CSSA = (UInt32) ptrRAM;        /* source addr */
            ptrSdmaRegs->CDSA = (UInt32) ptrRAMCtxBuf;  /* dest addr */
            ptrSdmaRegs->CSEI = 0;
            ptrSdmaRegs->CSFI = 0;
            ptrSdmaRegs->CDEI = 0;
            ptrSdmaRegs->CDFI = 0;
            ptrSdmaRegs->CCR  = 0x5000;                 /* post increment */
            ptrSdmaRegs->CCR |= 0x80;                   /* enable channel */
            while (ptrSdmaRegs->CCR & 0x80 ) {  /* wait channel auto-disable */
            };
        }
        else {                          /* else, use CPU copy */
            for (i = 0; i < 16384; i++) {
                ptrRAMCtxBuf[i] = ptrRAM[i];
            }
        }
    }

    /* = = = = = = = = */

    /* set the SLEEPDEEP bit */
    Hwi_nvic.SCR |= SLEEPDEEP;

    /* set the resume context pointer and the ready-to-idle flags */
    if (coreID == 0) {
        ti_sysbios_family_arm_ducati_smp_doResumeCore0 = 
            (UInt32) ptrCpuRegs;
        ptrReadyFlag = 
            (UInt32 *) &ti_sysbios_family_arm_ducati_smp_readyIdleCore0;
    }
    else {
        ti_sysbios_family_arm_ducati_smp_doResumeCore1 = 
            (UInt32) ptrCpuRegs;
        ptrReadyFlag = 
            (UInt32 *) &ti_sysbios_family_arm_ducati_smp_readyIdleCore1;
    }

    /* if PM master setup L2 restore flags */
    if (args->pmMasterCore != 0) {
        if (coreID == 0) {
            ti_sysbios_family_arm_ducati_smp_doRestoreL2Core0 = 1;
        }
        else {
            ti_sysbios_family_arm_ducati_smp_doRestoreL2Core1 = 1;
        }

        ti_sysbios_family_arm_ducati_smp_startL2RAM = (UInt32) ptrRAM;
        ti_sysbios_family_arm_ducati_smp_contextL2RAM = 
            (UInt32) ptrRAMCtxBuf;
    }

    /* if PM slave and going to rendezvous, assert the 'wait to resume' flag */
    if ((args->pmMasterCore == 0) && (args->rendezvousResume)) {
        if (coreID == 0) {
            ti_sysbios_family_arm_ducati_smp_waitResumeCore0 = 1;
        }
        else {
            ti_sysbios_family_arm_ducati_smp_waitResumeCore1 = 1;
        }
    }

    /* if going to rendezvous clear the ready to go (resume) flags */
    if ((args->pmMasterCore != 0) && (args->rendezvousResume)) {
        ti_sysbios_family_arm_ducati_smp_readySyncCore0 = 0;
        ti_sysbios_family_arm_ducati_smp_readySyncCore1 = 0;
        ti_sysbios_family_arm_ducati_smp_doneCore0 = 0;
        ti_sysbios_family_arm_ducati_smp_doneCore1 = 0;
    }

    /* check if should and wait for other core before go to WFI ... */
    if (args->rendezvousResume) {
        if (coreID == 0) {
            ti_sysbios_family_arm_ducati_smp_readyGoCore0 = 1;
            while (ti_sysbios_family_arm_ducati_smp_readyGoCore1 
                == 0) {};
        }
        else {
            ti_sysbios_family_arm_ducati_smp_readyGoCore1 = 1;
            while (ti_sysbios_family_arm_ducati_smp_readyGoCore0 
                == 0) { asm(" nop"); };
        }
    }

    /* NOW save CPU registers, set ready flag, and invoke WFI to suspend */
    reset = ti_sysbios_family_arm_ducati_smp_Power_saveCpuRegs(ptrCpuRegs,
        ptrReadyFlag);

    /* = = = = = = = = */

    /* NOTE: return here both when woke from WFI, or resumed after power down */

    /* = = = = = = = = */

#if defined (__ti__)
    asm(" .global ti_sysbios_family_arm_ducati_smp_Power_suspend_RESUME");
    asm("ti_sysbios_family_arm_ducati_smp_Power_suspend_RESUME:");
#endif

    /* if returned here after reset: must restore state ... */
    if (reset) {

        /* restore private RW table registers */
        REG(RW_TABLE_REGS) = ptrPrivCtx->privatePIDS.PID1;
        REG(RW_TABLE_REGS + 0x4) = ptrPrivCtx->privatePIDS.PID2;

        /* = = = = = = = = */

        /* if PM master core: restore rest of Ducati S/S state */
        if (args->pmMasterCore != 0) {

            /* restore AMMU state */
            /* restore large page address registers */
            AMMU_mmu.LARGE_ADDR[0] = 
                (Char *) ptrCtx->ssContext.ammuConfig.largeAddr[0];
            AMMU_mmu.LARGE_ADDR[1] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeAddr[1];
            AMMU_mmu.LARGE_ADDR[2] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeAddr[2];
            AMMU_mmu.LARGE_ADDR[3] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeAddr[3];

            /* restore large page translated address registers */
            AMMU_mmu.LARGE_XLTE[0] = 
                (Char *) ptrCtx->ssContext.ammuConfig.largeXlteAddr[0];
            AMMU_mmu.LARGE_XLTE[1] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeXlteAddr[1];
            AMMU_mmu.LARGE_XLTE[2] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeXlteAddr[2];
            AMMU_mmu.LARGE_XLTE[3] =
                (Char *) ptrCtx->ssContext.ammuConfig.largeXlteAddr[3];

            /* restore large page policy registers */
            AMMU_mmu.LARGE_POLICY[0] = 
                ptrCtx->ssContext.ammuConfig.largePolicy[0];
            AMMU_mmu.LARGE_POLICY[1] = 
                ptrCtx->ssContext.ammuConfig.largePolicy[1];
            AMMU_mmu.LARGE_POLICY[2] = 
                ptrCtx->ssContext.ammuConfig.largePolicy[2];
            AMMU_mmu.LARGE_POLICY[3] = 
                ptrCtx->ssContext.ammuConfig.largePolicy[3];

            /* restore medium page address registers */
            AMMU_mmu.MEDIUM_ADDR[0] = 
                (Char *) ptrCtx->ssContext.ammuConfig.medAddr[0];
            AMMU_mmu.MEDIUM_ADDR[1] = 
                (Char *) ptrCtx->ssContext.ammuConfig.medAddr[1];

            /* restore medium page translated address registers */
            AMMU_mmu.MEDIUM_XLTE[0] = 
                (Char *) ptrCtx->ssContext.ammuConfig.medXlteAddr[0];
            AMMU_mmu.MEDIUM_XLTE[1] = 
                (Char *) ptrCtx->ssContext.ammuConfig.medXlteAddr[1];

            /* restore medium page policy registers */
            AMMU_mmu.MEDIUM_POLICY[0] = 
                ptrCtx->ssContext.ammuConfig.medPolicy[0];
            AMMU_mmu.MEDIUM_POLICY[1] = 
                ptrCtx->ssContext.ammuConfig.medPolicy[1];

            /* restore small page address registers */
            ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_ADDR[0]);
            *ptrStruct10 = ptrCtx->ssContext.ammuConfig.smallAddr;

            /* restore small page translated address registers */
            ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_XLTE[0]);
            *ptrStruct10 = ptrCtx->ssContext.ammuConfig.smallXlteAddr;

            /* restore small page policy registers */
            ptrStruct10 = (Power_Struct10 *)(&AMMU_mmu.SMALL_POLICY[0]);
            *ptrStruct10 = ptrCtx->ssContext.ammuConfig.smallPolicy;

            /* restore MMU config */
            REG(&AMMU_mmu.MSTAT + 1) = ptrCtx->ssContext.ammuConfig.mmuConfig;

            /* = = = = = = = = */

            /* restore WUGEN_MEVTx registers */
            REG(WUGEN_MEVT0_REG) = ptrCtx->ssContext.WUGEN_MEVT0;
            REG(WUGEN_MEVT1_REG) = ptrCtx->ssContext.WUGEN_MEVT1;

            /* = = = = = = = = */

            /* restore unicache state (OCP, plus config w/enable) */
            Cache_cache.L1_OCP = ptrCtx->ssContext.cacheConfig.L1_OCP;
            Cache_cache.L1_CONFIG = ptrCtx->ssContext.cacheConfig.L1_CONFIG;

            /* = = = = = = = = */

            /* restore CTM state */
            CTM_ctm.CTCNTL = ptrCtx->ssContext.ctmConfig.CNTL;

            /* restore timer interval registers */
            CTM_ctm.TINTVLR[0] =  ptrCtx->ssContext.ctmConfig.TINTVLR0;
            CTM_ctm.TINTVLR[1] =  ptrCtx->ssContext.ctmConfig.TINTVLR1;

            /* restore individual counter control registers */
            ptrStruct8 = (Power_Struct8 *)(&CTM_ctm.CTCR[0]);
            *ptrStruct8 = ptrCtx->ssContext.ctmConfig.control;

            /* restore sync start flags */
            CTM_ctm.CTGNBL[0] = ptrCtx->ssContext.ctmConfig.GNBL0;

        } /* end of master's rest of Ducati S/S restore */

        /* = = = = = = = = */
  
        /* if PM master and doing rendezvous: now release the slave to resume */
        if ((args->pmMasterCore != 0) && (args->rendezvousResume)) {
            if (coreID == 0) {
                ti_sysbios_family_arm_ducati_smp_waitResumeCore1 = 0;
            }
            else {
                ti_sysbios_family_arm_ducati_smp_waitResumeCore0 = 0;
            }
        }
    }

    /* = = = = = = = = */

    /* if core 0 awoke from INTERRUPT send an interrupt to wake core 1... */
    if ((!reset) && (coreID == 0)) {
        Core_interruptCore(1);
    }

    /* = = = = = = = = */

    /* clear the resume context pointer, ready-to-idle, and L2 restore flags */
    if (coreID == 0) {
        ti_sysbios_family_arm_ducati_smp_readyGoCore0 = 0;
        ti_sysbios_family_arm_ducati_smp_doResumeCore0 = 0;
        ti_sysbios_family_arm_ducati_smp_readyIdleCore0 = 0;
        ti_sysbios_family_arm_ducati_smp_doRestoreL2Core0 = 0;
    }
    else {
        ti_sysbios_family_arm_ducati_smp_readyGoCore1 = 0;
        ti_sysbios_family_arm_ducati_smp_doResumeCore1 = 0;
        ti_sysbios_family_arm_ducati_smp_readyIdleCore1 = 0;
        ti_sysbios_family_arm_ducati_smp_doRestoreL2Core1 = 0;
    }

    /* if reset occurred: check/do rendezvous, restore NVIC ... */
    if (reset) {

        /* check if should and wait for rendezvous before continue further */
        if (args->rendezvousResume) {
            if (coreID == 0) {
                ti_sysbios_family_arm_ducati_smp_readySyncCore0 = 1;
                while (ti_sysbios_family_arm_ducati_smp_readySyncCore1 
                    == 0) {};
            }
            else {
                ti_sysbios_family_arm_ducati_smp_readySyncCore1 = 1;
                while (ti_sysbios_family_arm_ducati_smp_readySyncCore0 
                    == 0) { asm(" nop"); };
            }
        }

        /* = = = = = = = = */

        /* restore private NVIC state */
        *ptrIPRxRegs = ptrPrivCtx->privateNVIC.iprRegs;   /* priority regs */

        Hwi_nvic.RES_08 = ptrPrivCtx->privateNVIC.AUXCTRL; /* aux ctrl */

        /* set VECTKEY in saved AIRCR so can write config bits */
        ptrPrivCtx->privateNVIC.cfgRegs.AIRCR = 
            (ptrPrivCtx->privateNVIC.cfgRegs.AIRCR & 0x0000FFFF) | 0x5FA0000;

        *ptrCfgRegs = ptrPrivCtx->privateNVIC.cfgRegs;    /* misc cfg regs */

        Hwi_nvic.ISER[0] = ptrPrivCtx->privateNVIC.ISER0; /* enable */
        Hwi_nvic.ISER[1] = ptrPrivCtx->privateNVIC.ISER1; /* enable */
        Hwi_nvic.SCR = ptrPrivCtx->privateNVIC.SCR;     

        /* = = = = = = = = */

        /* restore SYSTICK state */
        Hwi_nvic.STCVR = 0;  /* clear count (unpredictable on reset) */
        Hwi_nvic.STRVR = ptrPrivCtx->privateNVIC.STRVR; /* reload val */
        Hwi_nvic.STCSR = ptrPrivCtx->privateNVIC.STCSR; /* control */
    }

    /* else, no reset, reverse masking of interrupts not allowed to wake WFI */
    else {
        Hwi_nvic.ICER[0] = 0xffffffff;
        Hwi_nvic.ICER[1] = 0xffffffff;
        Hwi_nvic.ISER[0] = ptrPrivCtx->privateNVIC.ISER0;
        Hwi_nvic.ISER[1] = ptrPrivCtx->privateNVIC.ISER1;
        Hwi_nvic.SCR = ptrPrivCtx->privateNVIC.SCR;     

        /* restore WUGEN_MEVTx registers */
        if (args->pmMasterCore) {
            REG(WUGEN_MEVT0_REG) = ptrCtx->ssContext.WUGEN_MEVT0;
            REG(WUGEN_MEVT1_REG) = ptrCtx->ssContext.WUGEN_MEVT1;
        }
    }

    /* if no reset, and master, and disabled the cache: re-enable it */
    if ((!reset) && (args->pmMasterCore) && (cacheEnabled)) {
        Cache_enable(Cache_Type_L1);
    }

    /* call the post suspend hook function */
    if (coreID == 0) {
        for (i = 0; i < Power_postSuspendHooks.length; i++) {
            Power_postSuspendHooks.elem[i]();
        }
    }

    /* check/do final rendezvous before returning */
    if (args->rendezvousResume) {
        if (coreID == 0) {
            ti_sysbios_family_arm_ducati_smp_doneCore0 = 1;
            while (ti_sysbios_family_arm_ducati_smp_doneCore1
                == 0) { asm(" nop"); };
        }
        else {
            ti_sysbios_family_arm_ducati_smp_doneCore1 = 1;
            while (ti_sysbios_family_arm_ducati_smp_doneCore0
                == 0) { asm(" nop"); };
        }
    }

    return (reset);
}

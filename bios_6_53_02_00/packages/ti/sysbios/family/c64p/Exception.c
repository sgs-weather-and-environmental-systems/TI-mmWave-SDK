/*
 * Copyright (c) 2014 Texas Instruments Incorporated
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
 *  ======== Exception.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/family/c64p/Hwi.h>

#include "package/internal/Exception.xdc.h"
#pragma FUNC_EXT_CALLED(Exception_handler);

#define UMC_MPFAR (UInt32 *)0x0184A000
#define UMC_MPFSR (UInt32 *)0x0184A004
#define UMC_MPFCR (UInt32 *)0x0184A008
#define PMC_MPFAR (UInt32 *)0x0184A400
#define PMC_MPFSR (UInt32 *)0x0184A404
#define PMC_MPFCR (UInt32 *)0x0184A408
#define DMC_MPFAR (UInt32 *)0x0184AC00
#define DMC_MPFSR (UInt32 *)0x0184AC04
#define DMC_MPFCR (UInt32 *)0x0184AC08

#define MPPA_UX         0x00000001      // User eXecute
#define MPPA_UW         0x00000002      // User Write
#define MPPA_UR         0x00000004      // User Read
#define MPPA_SX         0x00000008      // Supervisor eXecute
#define MPPA_SW         0x00000010      // Supervisor Write
#define MPPA_SR         0x00000020      // Supervisor Read
#define MPPA_LOCAL      0x00000100      // LOCAL CPU access
#define MPFSR_UXE       MPPA_UX
#define MPFSR_UWE       MPPA_UW
#define MPFSR_URE       MPPA_UR
#define MPFSR_SXE       MPPA_SX
#define MPFSR_SWE       MPPA_SW
#define MPFSR_SRE       MPPA_SR
#define MPFSR_LOCAL     MPPA_LOCAL
#define MPFSR_SECE      0x00000080
#define MPFSR_FIDMASK   0x0000FE00
#define MPFSR_FIDSHIFT  9

#define evtToRegNum(event) ((event) >> 5)
#define evtToBitNum(event) ((event) & 0x1f)

#define EVTEVTCLR0          0x01800040
#define EVTEXPMASK0         0x018000c0
#define EVTMEXPFLAG0        0x018000e0

#define evtExpMaskAddr(event) \
    (((volatile UInt *)EVTEXPMASK0) + evtToRegNum(event))

#define evtEvtClrAddr(event) \
    (((volatile UInt *)EVTEVTCLR0) + evtToRegNum(event))


/*
 *  ======== Exception_Module_startup ========
 *  Exception_Module_startup must be called to enable events to cause
 *  an exception.
 */
Int Exception_Module_startup(Int phase)
{
    extern volatile cregister unsigned TSR;
    volatile UInt32 *mpfcr;

    /*
     *  Exception uses Hwi, needs to wait for its startup.
     */
    if (!Hwi_Module_startupDone()) {
        return (Startup_NOTDONE);
    }

    if (Exception_enableExternalMPC) {
        /* write 1 to MPFCR to clear MPFSR & MPFAR registers */
        mpfcr = PMC_MPFCR;
        *mpfcr = 1;

        /* write 1 to MPFCR to clear MPFSR & MPFAR registers */
        mpfcr = DMC_MPFCR;
        *mpfcr = 1;

        /* write 1 to MPFCR to clear MPFSR & MPFAR registers */
        mpfcr = UMC_MPFCR;
        *mpfcr = 1;

        /* clear MPC masked exceptions */
        Exception_evtEvtClear(Exception_EVTPMCCMPA);
        Exception_evtEvtClear(Exception_EVTDMCCMPA);
        Exception_evtEvtClear(Exception_EVTUMCCMPA);

        /* enable MPC masked exceptions */
        Exception_evtExpMaskEnable(Exception_EVTPMCCMPA);
        Exception_evtExpMaskEnable(Exception_EVTDMCCMPA);
        Exception_evtExpMaskEnable(Exception_EVTUMCCMPA);
    }

    /* enable EXCEP input to generate an NMI interrupt */
    TSR |= (Exception_TSRXEN | Exception_TSRGEE);

    /* clear EXC bit in TSR from previous exception processing */
    TSR &= ~(Exception_TSREXC);

    if (Exception_useInternalBuffer) {
        Exception_module->excPtr = (Char *)
            (((UInt32)Exception_module->contextBuf +
	        Exception_sizeContextBuf - 8) & ~0x7);
    }
    else {
        Exception_module->excPtr = ti_sysbios_family_c64p_Hwi_getIsrStackAddress();
    }

    return Startup_DONE;
}

/*
 *  ======== Exception_handler ========
 *  This handler is called by the dispatch function.  It calls the various
 *  exception hook functions.
 */
Void Exception_handler(Bool abortFlag)
{
    extern volatile cregister unsigned EFR;
    extern volatile cregister unsigned ECR;
    extern volatile cregister unsigned NRP;
    extern volatile cregister unsigned NTSR;
    Exception_Context *excp;
    unsigned efr;

    efr = EFR;
    Exception_module->efr = efr;        /* record EFR in Exception_Status */
    Exception_module->nrp = NRP;        /* record NRP in Exception_Status */
    Exception_module->ntsr = NTSR;      /* record NTSR in Exception_Status */

    /* set exception context */
    excp = Exception_module->excContext;

    if (Exception_enablePrint) {
        /* Force MAIN threadtype So we can safely call System_printf */
        BIOS_setThreadType(BIOS_ThreadType_Main);

        System_printf("A0=0x%x A1=0x%x\n", excp->A0, excp->A1);
        System_printf("A2=0x%x A3=0x%x\n", excp->A2, excp->A3);
        System_printf("A4=0x%x A5=0x%x\n", excp->A4, excp->A5);
        System_printf("A6=0x%x A7=0x%x\n", excp->A6, excp->A7);
        System_printf("A8=0x%x A9=0x%x\n", excp->A8, excp->A9);
        System_printf("A10=0x%x A11=0x%x\n", excp->A10, excp->A11);
        System_printf("A12=0x%x A13=0x%x\n", excp->A12, excp->A13);
        System_printf("A14=0x%x A15=0x%x\n", excp->A14, excp->A15);
        System_printf("A16=0x%x A17=0x%x\n", excp->A16, excp->A17);
        System_printf("A18=0x%x A19=0x%x\n", excp->A18, excp->A19);
        System_printf("A20=0x%x A21=0x%x\n", excp->A20, excp->A21);
        System_printf("A22=0x%x A23=0x%x\n", excp->A22, excp->A23);
        System_printf("A24=0x%x A25=0x%x\n", excp->A24, excp->A25);
        System_printf("A26=0x%x A27=0x%x\n", excp->A26, excp->A27);
        System_printf("A28=0x%x A29=0x%x\n", excp->A28, excp->A29);
        System_printf("A30=0x%x A31=0x%x\n", excp->A30, excp->A31);
        System_printf("B0=0x%x B1=0x%x\n", excp->B0, excp->B1);
        System_printf("B2=0x%x B3=0x%x\n", excp->B2, excp->B3);
        System_printf("B4=0x%x B5=0x%x\n", excp->B4, excp->B5);
        System_printf("B6=0x%x B7=0x%x\n", excp->B6, excp->B7);
        System_printf("B8=0x%x B9=0x%x\n", excp->B8, excp->B9);
        System_printf("B10=0x%x B11=0x%x\n", excp->B10, excp->B11);
        System_printf("B12=0x%x B13=0x%x\n", excp->B12, excp->B13);
        System_printf("B14=0x%x B15=0x%x\n", excp->B14, excp->B15);
        System_printf("B16=0x%x B17=0x%x\n", excp->B16, excp->B17);
        System_printf("B18=0x%x B19=0x%x\n", excp->B18, excp->B19);
        System_printf("B20=0x%x B21=0x%x\n", excp->B20, excp->B21);
        System_printf("B22=0x%x B23=0x%x\n", excp->B22, excp->B23);
        System_printf("B24=0x%x B25=0x%x\n", excp->B24, excp->B25);
        System_printf("B26=0x%x B27=0x%x\n", excp->B26, excp->B27);
        System_printf("B28=0x%x B29=0x%x\n", excp->B28, excp->B29);
        System_printf("B30=0x%x B31=0x%x\n", excp->B30, excp->B31);
        System_printf("NTSR=0x%x\n", excp->NTSR);
        System_printf("ITSR=0x%x\n", excp->ITSR);
        System_printf("IRP=0x%x\n", excp->IRP);
        System_printf("SSR=0x%x\n", excp->SSR);
        System_printf("AMR=0x%x\n", excp->AMR);
        System_printf("RILC=0x%x\n", excp->RILC);
        System_printf("ILC=0x%x\n", excp->ILC);
    }

    /* print general exception info */
    if (Exception_enablePrint) {
        System_printf("Exception at 0x%x\n",
            (IArg)Exception_module->nrp);

        System_printf("EFR=0x%x NRP=0x%x\n",
            (IArg)Exception_module->efr,
            (IArg)Exception_module->nrp);
    }

    if (*Exception_exceptionHook != NULL) {
        (*Exception_exceptionHook)();
    }

    /* clear flags in EFR */
    ECR = efr;

    /* process all possible causes of exception */
    if (efr & Exception_EFRIXF) {
        /* internal exception */
        efr ^= Exception_EFRIXF;
        Exception_internalHandler();
    }

    if (efr & Exception_EFREXF) {
        /* external exception */
        efr ^= Exception_EFREXF;
        Exception_externalHandler();
    }

    if (efr & Exception_EFRNXF) {
        /* legacy NMI exception */
        efr ^= Exception_EFRNXF;
        Exception_nmiHandler();
    }

    if (abortFlag) {
        if (Exception_enablePrint) {
            Error_raise(0, Exception_E_exceptionMax, excp->NRP, excp->B15);
        }
        else {
            Error_raise(0, Exception_E_exceptionMin, excp->NRP, excp->B15);
        }
    }
}

/*
 *  ======== Exception_internalHandler ========
 *  This function is called only if an internal exception has occurred.
 *  It checks the EFR register to determine what type of exceptions occurred.
 */
Void Exception_internalHandler(Void)
{
    extern volatile cregister unsigned IERR;
    UInt32 ierr;

    ierr = IERR;

    /* record IERR in Exc_module field */
    Exception_module->ierr = ierr;

    if (Exception_enablePrint) {
        System_printf("Internal exception: IERR=0x%x\n", Exception_module->ierr);

        if (ierr & Exception_IERRIFX) {
            System_printf("Instruction fetch exception\n");
        }
        if (ierr & Exception_IERRFPX) {
            System_printf("Fetch packet exception\n");
        }
        if (ierr & Exception_IERREPX) {
            System_printf("Execute packet exception\n");
        }
        if (ierr & Exception_IERROPX) {
            System_printf("Opcode exception\n");
        }
        if (ierr & Exception_IERRRCX) {
            System_printf("Resource conflict exception\n");
        }
        if (ierr & Exception_IERRRAX) {
            System_printf("Resource access exception\n");
        }
        if (ierr & Exception_IERRPRX) {
            System_printf("Privilege exception\n");
        }
        if (ierr & Exception_IERRLBX) {
            System_printf("Loop buffer exception\n");
        }
        if (ierr & Exception_IERRMSX) {
            System_printf("Missed stall exception\n");
        }
    }

    if (*Exception_internalHook != NULL) {
        (*Exception_internalHook)();
    }

    /* clear internal exceptions to allow them to be recognized again */
    IERR = 0;
}

/*
 *  ======== Exception_decodeMpfsr ========
 */
Void Exception_decodeMpfsr(UInt mpfsr)
{
    if (mpfsr & MPFSR_LOCAL) {
        System_printf("Security violation, Local L1/L2 cache memory Fault\n");
    }
    if (mpfsr & MPFSR_SECE) {
        System_printf("Security violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_UXE) {
        System_printf("User Execute violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_UWE) {
        System_printf("User Write violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_URE) {
        System_printf("User Read violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_SXE) {
        System_printf("Supervisor Excecute violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_SWE) {
        System_printf("Supervisor Write violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
    if (mpfsr & MPFSR_SRE) {
        System_printf("Supervisor Read violation, Fault ID=0x%x\n",
            (mpfsr & MPFSR_FIDMASK) >> MPFSR_FIDSHIFT);
    }
}

/*
 *  ======== Exception_externalHandler ========
 *  This function is called only if an external exception has occurred.
 *  It checks the EFR register to determine what type of exceptions occurred.
 */
Void Exception_externalHandler(Void)
{
    UInt mpfsr;

    if (Exception_enableExternalMPC) {
        mpfsr = *PMC_MPFSR;
        if (mpfsr != 0) {
            if (Exception_enablePrint) {
                System_printf("PMC Exception MPFAR=0x%x MPFSR=0x%x\n",
                    *PMC_MPFAR, mpfsr);
                Exception_decodeMpfsr(mpfsr);
            }
            *PMC_MPFCR = 1;
        }
        mpfsr = *DMC_MPFSR;
        if (mpfsr != 0) {
            if (Exception_enablePrint) {
                System_printf("DMC Exception MPFAR=0x%x MPFSR=0x%x\n",
                    *DMC_MPFAR, mpfsr);
                Exception_decodeMpfsr(mpfsr);
            }
            *DMC_MPFCR = 1;
        }
        mpfsr = *UMC_MPFSR;
        if (mpfsr != 0) {
            if (Exception_enablePrint) {
                System_printf("UMC Exception MPFAR=0x%x MPFSR=0x%x\n",
                    *UMC_MPFAR, mpfsr);
                Exception_decodeMpfsr(mpfsr);
            }
            *UMC_MPFCR = 1;
        }
    }

    if (*Exception_externalHook != NULL) {
        (*Exception_externalHook)();
    }
}

/*
 *  ======== Exception_nmiHandler ========
 *  This function is called only if a legacy NMI exception has occurred.
 *  It checks the EFR register to determine what type of exceptions occurred.
 */
Void Exception_nmiHandler(Void)
{
    if (Exception_enablePrint) {
        System_printf("Legacy NMI Exception\n");
    }

    if (*Exception_nmiHook != NULL) {
        (*Exception_nmiHook)();
    }
}

/*
 *  ======== Exception_getLastStatus ========
 *  This function returns the last exception status through the status ptr.
 */
Void Exception_getLastStatus(Exception_Status *status)
{
    status->efr = Exception_module->efr;
    status->nrp = Exception_module->nrp;
    status->ntsr = Exception_module->ntsr;
    status->ierr = Exception_module->ierr;
    status->excContext = Exception_module->excContext;
}

/*
 *  ======== Exception_clearLastStatus ========
 *  This function clears the last exception status.
 */
Void Exception_clearLastStatus(Void)
{
    Exception_module->efr = 0;
    Exception_module->nrp = 0;
    Exception_module->ntsr = 0;
    Exception_module->ierr = 0;
    Exception_module->excContext = 0;
}

/*
 *  ======== Exception_setReturnPtr ========
 *  This function sets the new return pointer and returns the old pointer.
 */
Exception_FuncPtr Exception_setReturnPtr(Exception_FuncPtr ptr)
{
    Exception_FuncPtr curPtr;

    curPtr = Exception_module->returnHook;
    Exception_module->returnHook = ptr;

    return curPtr;
}

/*
 *  ======== Exception_evtExpMaskEnable ========
 */
Void Exception_evtExpMaskEnable(UInt event)
{
    *evtExpMaskAddr(event) = *evtExpMaskAddr(event) & ~(1 << evtToBitNum(event));
}

/*
 *  ======== Exception_evtEvtClear ========
 */
Void Exception_evtEvtClear(UInt event)
{
    *evtEvtClrAddr(event) = 1 << evtToBitNum(event);
}


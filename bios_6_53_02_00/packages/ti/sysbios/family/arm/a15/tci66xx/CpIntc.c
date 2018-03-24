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
 * ======== CpIntc.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Intrinsics.h>

#include "package/internal/CpIntc.xdc.h"

/*
 *  ======== CpIntc_Module_startup ========
 *  Cannot assume what other A15 cores and EDMA controller have done.
 *  Can only clear and enable system interrupts that have been specified
 *  here.
 */
Int CpIntc_Module_startup(Int phase)
{
    UInt32 i, j;
    UInt32 bitpos;
    UInt32 offset;

    /* Clear then enable any statically enabled interrupts */
    for (i = 0; i < CpIntc_numStatusRegs; i++) {
        offset = i << 5;
        for (j = 0; j < 32; j++) {
            bitpos = 1 << j;
            if (CpIntc_module->initSIER[i] & bitpos) {
                CpIntc_clearSysInt(offset + j);
                CpIntc_enableSysInt(offset + j);
            }
        }
    }

    /*
     *  Configure the Channel Map Register and enable the Host interrupts.
     *  It is safe to be called by multiple cores because it uses the
     *  Channel Map Register (byte addressable) and
     *  Host Int Enable Indexed Set Register.
     */
    for (i = 0; i < CpIntc_numSysInts; i++) {
        if (CpIntc_sysIntToHostInt[i] != 0xffff) {
            CpIntc_module->controller->CMR[i] = CpIntc_sysIntToHostInt[i];
            CpIntc_enableHostInt(CpIntc_sysIntToHostInt[i]);
        }
    }

    /* Globally enable all host interrupts */
    CpIntc_enableAllHostInts();

    return(Startup_DONE);
}

/*
 *  ======== CpIntc_clearSysInt ========
 *  clears the system interrupt specified.
 */
Void CpIntc_clearSysInt(UInt sysId)
{
    CpIntc_module->controller->SICR = sysId;
}

/*
 *  ======== CpIntc_disableAllHostInts ========
 *  disables all host interrupts.
 */
Void CpIntc_disableAllHostInts()
{
    CpIntc_module->controller->GER = 0;
}

/*
 *  ======== CpIntc_disableHostInt ========
 *  disables the host interrupt specified.
 */
Void CpIntc_disableHostInt(UInt hostInt)
{
    CpIntc_module->controller->HIDISR = hostInt;
}

/*
 *  ======== CpIntc_disableSysInt ========
 *  disables the system interrupt specified.
 */
Void CpIntc_disableSysInt(UInt sysInt)
{
    CpIntc_module->controller->EICR = sysInt;
}

/*
 *  ======== CpIntc_dispatch ========
 */
Void CpIntc_dispatch(UArg idx)
{
    Int32  i;
    UInt32 index;
    UInt32 offset;
    UInt32 srsrVal;
    Int32  sysInt;
    UInt   hostInt;

    hostInt = CpIntc_module->hostIntToSysInt[idx].hostInt;
    sysInt = CpIntc_module->hostIntToSysInt[idx].sysInt;

    /* disable host interrupt */
    CpIntc_disableHostInt(hostInt);

    /*
     *  If only one system interrupt is mapped to a host interrupt
     *  we don't need to read the Sys Status Raw Registers. We
     *  know exactly which system interrupt triggered the interrupt.
     */
    if (sysInt != 0xffff && sysInt != 0xfffe) {
        /* clear system interrupt associated with host interrupt */
        CpIntc_clearSysInt(sysInt);

        /* call function with arg */
        CpIntc_module->dispatchTab[sysInt].fxn(
            CpIntc_module->dispatchTab[sysInt].arg);

    }
    else {
        /*
         *  Loop through System Interrupt Status Enabled/Clear Registers for
         *  pending enabled interrupts. The highest numbered system interrupt
         *  will be processed first from left to right.
         */
        for (i = CpIntc_numStatusRegs - 1; i >= 0; i--) {
            offset = i << 5;

            srsrVal = CpIntc_module->controller->SECR[i];

            /* Find pending interrupts from left to right */
            while (srsrVal) {
                index = Intrinsics_maxbit(srsrVal);
                srsrVal &= ~(1 << index);

                /* Make sure pending interrupt is mapped to host interrupt */
                if (CpIntc_module->controller->CMR[offset + index] == hostInt) {
                    /* clear system interrupt first */
                    CpIntc_clearSysInt(offset + index);

                    /* call function with arg */
                    CpIntc_module->dispatchTab[offset + index].fxn(
                        CpIntc_module->dispatchTab[offset + index].arg);
                }
            }
        }
    }

    /* enable host interrupt */
    CpIntc_enableHostInt(hostInt);
}

/*
 *  ======== CpIntc_dispatchPlug ========
 *  This function will plug the CpIntc dispatch table with the specified fxn
 *  and attrs.
 */
Void CpIntc_dispatchPlug(UInt sysInt, CpIntc_FuncPtr fxn, UArg arg, Bool unmask)
{
    Assert_isTrue((sysInt < CpIntc_numSysInts), CpIntc_A_sysIntOutOfRange);

    CpIntc_module->dispatchTab[sysInt].fxn = fxn;
    CpIntc_module->dispatchTab[sysInt].arg = arg;

    if (unmask) {
        CpIntc_enableSysInt(sysInt);
    }
}

/*
 *  ======== CpIntc_enableAllHostInts ========
 *  enables all host interrupts.
 */
Void CpIntc_enableAllHostInts()
{
    CpIntc_module->controller->GER = 1;
}

/*
 *  ======== CpIntc_enableHostInt ========
 *  enables the host interrupt specified.
 */
Void CpIntc_enableHostInt(UInt hostInt)
{
    CpIntc_module->controller->HIEISR = hostInt;
}

/*
 *  ======== CpIntc_enableSysInt ========
 *  enables the system interrupt specified.
 */
Void CpIntc_enableSysInt(UInt sysInt)
{
    CpIntc_module->controller->EISR = sysInt;
}

/*
 *  ======== CpIntc_getHostIntKey ========
 *  Returns the the host interrupt's index number in
 *  CpIntc_module->hostIntToSysInt[] array.
 */
Int CpIntc_getHostIntKey(UInt hostInt)
{
    UInt i;

    for (i = 0; i < CpIntc_numArmInts; i++) {
        if (hostInt == CpIntc_module->hostIntToSysInt[i].hostInt) {
            return (i);
        }
    }

    return (-1);
}

/*
 *  ======== CpIntc_getIntNum ========
 *  Returns the ARM CorePac interrupt number associated with the host interrupt.
 */
Int CpIntc_getIntNum(UInt hostInt)
{
    UInt i;

    for (i = 0; i < CpIntc_numArmInts; i++) {
        if (hostInt == CpIntc_hostIntToArmIntNum[i]) {
            /*
             * ARM CorePac Interrupt numbers 0 to N in Keystone2 reference
             * manual map to ARM GIC interrupt number 32 to (N + 32).
             */
            return (CpIntc_intNum[i] + 32);
        }
    }

    return (-1);
}

/*
 *  ======== CpIntc_getHostInt ========
 *  Returns the host int associated with the ARM CorePac interrupt.
 */
Int CpIntc_getHostInt(UInt intNum)
{
    UInt i;

    for (i = 0; i < CpIntc_numArmInts; i++) {
        if (intNum == CpIntc_intNum[i]) {
            return (CpIntc_hostIntToArmIntNum[i]);
        }
    }

    return (-1);
}

/*
 *  ======== CpIntc_mapSysIntToHostInt ========
 *  maps the system interrupt to the host interrupt specified
 */
Void CpIntc_mapSysIntToHostInt(UInt sysInt, UInt hostInt)
{
    Int idx;
    CpIntc_module->controller->CMR[sysInt] = hostInt;

    idx = CpIntc_getHostIntKey(hostInt);

    /* update module hostIntToSysInt[] */
    if (CpIntc_module->hostIntToSysInt[idx].sysInt == 0xfffe) {
        /* previously more than one sys int set to it, so do nothing */
    }
    else if (CpIntc_module->hostIntToSysInt[idx].sysInt == 0xffff) {
        /* previously not set, set it to sys int */
        CpIntc_module->hostIntToSysInt[idx].sysInt = sysInt;
    }
    else {
        /* previously set to one sys int, now mark it more than one */
        CpIntc_module->hostIntToSysInt[idx].sysInt = 0xfffe;
    }
}

/*
 *  ======== CpIntc_postSysInt ========
 *  Triggers the system interrupt specified.
 */
Void CpIntc_postSysInt(UInt sysInt)
{
    CpIntc_module->controller->SISR = sysInt;
}

/*
 *  ======== CpIntc_unused ========
 */
Void CpIntc_unused(UArg arg)
{
    /* Change threadType to MAIN so we can safely call Error_raise() */
    BIOS_setThreadType(BIOS_ThreadType_Main);

    Error_raise(NULL, CpIntc_E_unpluggedSysInt, arg, 0);
}

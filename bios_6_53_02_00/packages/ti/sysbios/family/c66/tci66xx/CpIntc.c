/*
 * Copyright (c) 2013-2016, Texas Instruments Incorporated
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
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include "package/internal/CpIntc.xdc.h"

/*
 *  This macro is used to fixed the following problem.
 *  SDOCM00078448 - CpIntc module does not work when built for c66xx big endian
 *  It calculates the correct offset for accessing the Channel Map Register
 *  based upon the system interrupt given.
 *  ie...
 *      sysInt 15 maps to 12
 *      sysInt 12 maps to 15
 *      sysInt 16 maps to 19
 */
#ifdef xdc_target__bigEndian
#define convertToLE(sysInt)     (((sysInt) & 0xfffffffc) | (~(sysInt) & 0x3))
#else
#define convertToLE(sysInt)     (sysInt)
#endif

/*
 *  ======== CpIntc_Module_startup ========
 *  Cannot assume what other cores have done.  Can only clear and
 *  enable system interrupts that have been specified here.
 */
Int CpIntc_Module_startup(Int phase)
{
    UInt32 i, j;
    UInt32 bitpos;
    UInt32 offset;
    UInt32 id = 0;
    extern volatile cregister UInt32 DNUM;

    /* for core# 4-7 use INTC1 otherwise use INTC0 */
    if (DNUM > 3) {
        id = 1;
    }

    /* Clear then enable any statically enabled interrupts */
    for (i = 0; i < (UInt32)CpIntc_numStatusRegs; i++) {
        offset = i << 5;
        for (j = 0; j < 32; j++) {
            bitpos = 1 << j;
            if (CpIntc_module->initSIER[i] & bitpos) {
                CpIntc_clearSysInt(id, offset + j);
                CpIntc_enableSysInt(id, offset + j);
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
            CpIntc_mapSysIntToHostInt(id, i, CpIntc_sysIntToHostInt[i]);
            CpIntc_enableHostInt(id, CpIntc_sysIntToHostInt[i]);
        }
    }

    /* Globally enable all host interrupts */
    CpIntc_enableAllHostInts(id);

    return(Startup_DONE);
}

/*
 *  ======== CpIntc_clearSysInt ========
 *  clears the system interrupt specified.
 */
Void CpIntc_clearSysInt(UInt id, UInt sysId)
{
    CpIntc_module->controller[id]->SICR = sysId;
}

/*
 *  ======== CpIntc_disableAllHostInts ========
 *  disables all host interrupts.
 */
Void CpIntc_disableAllHostInts(UInt id)
{
    CpIntc_module->controller[id]->GER = 0;
}

/*
 *  ======== CpIntc_disableHostInt ========
 *  disables the host interrupt specified.
 */
Void CpIntc_disableHostInt(UInt id, UInt hostInt)
{
    CpIntc_module->controller[id]->HIDISR = hostInt;
}

/*
 *  ======== CpIntc_disableSysInt ========
 *  disables the system interrupt specified.
 */
Void CpIntc_disableSysInt(UInt id, UInt sysInt)
{
    CpIntc_module->controller[id]->EICR = sysInt;
}

/*
 *  ======== CpIntc_dispatch ========
 */
Void CpIntc_dispatch(UInt hostInt)
{
    Int32 i;
    UInt32 index;
    UInt32 offset;
    UInt32 srsrVal;
    Int32  sysInt;
    UInt32 id = 0;
    extern volatile cregister UInt32 DNUM;

    /* for core# 4-7 use INTC1 otherwise use INTC0 */
    if (DNUM > 3) {
        id = 1;
    }

    sysInt = CpIntc_module->hostIntToSysInt[hostInt];

    /* disable host interrupt */
    CpIntc_disableHostInt(id, hostInt);

    /*
     *  If only one system interrupt is mapped to a host interrupt
     *  we don't need to read the Sys Status Raw Registers. We
     *  know exactly which system interrupt triggered the interrupt.
     */
    if (sysInt != 0xffff && sysInt != 0xfffe) {
        /* clear system interrupt associated with host interrupt */
        CpIntc_clearSysInt(id, sysInt);

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

            srsrVal = CpIntc_module->controller[id]->SECR[i];

            /* Find pending interrupts from left to right */
            while (srsrVal) {
                index = 31 - _lmbd(1, srsrVal);
                srsrVal &= ~(1 << index);

                /* Make sure pending interrupt is mapped to host interrupt */
                if (CpIntc_module->controller[id]->CMR[convertToLE(offset
                    + index)] == hostInt) {
                    /* clear system interrupt first */
                    CpIntc_clearSysInt(id, offset + index);

                    /* call function with arg */
                    CpIntc_module->dispatchTab[offset + index].fxn(
                        CpIntc_module->dispatchTab[offset + index].arg);
                }
            }
        }
    }

    /* enable host interrupt */
    CpIntc_enableHostInt(id, hostInt);
}

/*
 *  ======== CpIntc_dispatchPlug ========
 *  This function will plug the CpIntc dispatch table with the specified fxn
 *  and attrs.
 */
Void CpIntc_dispatchPlug(UInt sysInt, CpIntc_FuncPtr fxn, UArg arg, Bool unmask)
{
    UInt32 id = 0;
    extern volatile cregister UInt32 DNUM;

    /* for core# 4-7 use INTC1 otherwise use INTC0 */
    if (DNUM > 3) {
        id = 1;
    }

    CpIntc_module->dispatchTab[sysInt].fxn = fxn;
    CpIntc_module->dispatchTab[sysInt].arg = arg;

    if (unmask) {
        CpIntc_enableSysInt(id, sysInt);
    }
}

/*
 *  ======== CpIntc_enableAllHostInts ========
 *  enables all host interrupts.
 */
Void CpIntc_enableAllHostInts(UInt id)
{
    CpIntc_module->controller[id]->GER = 1;
}

/*
 *  ======== CpIntc_enableHostInt ========
 *  enables the host interrupt specified.
 */
Void CpIntc_enableHostInt(UInt id, UInt hostInt)
{
    CpIntc_module->controller[id]->HIEISR = hostInt;
}

/*
 *  ======== CpIntc_enableSysInt ========
 *  enables the system interrupt specified.
 */
Void CpIntc_enableSysInt(UInt id, UInt sysInt)
{
    CpIntc_module->controller[id]->EISR = sysInt;
}

/*
 *  ======== CpIntc_getEventId ========
 *  Returns the event id associated with the host interrupt.
 */
Int CpIntc_getEventId(UInt hostInt)
{
    extern volatile cregister UInt32 DNUM;
    UInt i;

    for (i = 0; i < CpIntc_numEvents; i++) {
        if (hostInt == CpIntc_hostIntToEventId[DNUM][i]) {
            return (CpIntc_eventId[i]);
        }
    }

    return (-1);
}

/*
 *  ======== CpIntc_getHostInt ========
 *  Returns the host int associated with the event id.
 */
Int CpIntc_getHostInt(UInt eventId)
{
    extern volatile cregister UInt32 DNUM;
    UInt i;

    for (i = 0; i < CpIntc_numEvents; i++) {
        if (eventId == CpIntc_eventId[i]) {
            return (CpIntc_hostIntToEventId[DNUM][i]);
        }
    }

    return (-1);
}

/*
 *  ======== CpIntc_mapSysIntToHostInt ========
 *  maps the system interrupt to the host interrupt specified
 */
Void CpIntc_mapSysIntToHostInt(UInt id, UInt sysInt, UInt hostInt)
{
    extern volatile cregister UInt32 DNUM;

    CpIntc_module->controller[id]->CMR[convertToLE(sysInt)] = hostInt;

    /* update module hostIntToSysInt[] */
    if (id == 0 || ((id == 1) && (DNUM > 3))) {
        if (CpIntc_module->hostIntToSysInt[hostInt] == 0xfffe) {
            /* previously more than one sys int set to it, so do nothing */
        }
        else if (CpIntc_module->hostIntToSysInt[hostInt] == 0xffff) {
            /* previously not set, set it to sys int */
            CpIntc_module->hostIntToSysInt[hostInt] = sysInt;
        }
        else {
            /* previously set to one sys int, now mark it more than one */
            CpIntc_module->hostIntToSysInt[hostInt] = 0xfffe;
        }
    }
}


/*
 *  ======== CpIntc_postSysInt ========
 *  Triggers the system interrupt specified.
 */
Void CpIntc_postSysInt(UInt id, UInt sysInt)
{
    CpIntc_module->controller[id]->SISR = sysInt;
}

/*
 *  ======== CpIntc_unused ========
 */
Void CpIntc_unused(UArg arg)
{
    Error_raise(NULL, CpIntc_E_unpluggedSysInt, arg, 0);
}



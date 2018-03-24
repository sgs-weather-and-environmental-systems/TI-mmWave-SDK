/*
 * Copyright (c) 2013-2017, Texas Instruments Incorporated
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
 *  ======== Hwi.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Log.h>

#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/interfaces/IHwi.h>
#include <ti/sysbios/BIOS.h>

#include "package/internal/Hwi.xdc.h"

#define PIECTRL_ADDR            0x000CE0
#define PIEACK_ADDR             0x000CE1
#define PIEIER1_ADDR            0x000CE2
#define PIEIFR1_ADDR            0x000CE3
#define PIECTRL_ENPIE           0x0001
#define PIEACK_CLEAR            0xFFFF
#define VECTOR_PIE_BASE         0x000D00

extern Void ti_sysbios_family_c28_Hwi_dispatchTable(Void);
extern Void ti_sysbios_family_c28_Hwi_dispatchZeroTable(Void);
extern Void ti_sysbios_family_c28_Hwi_dispatchPie(Void);
extern Void ti_sysbios_family_c28_Hwi_dispatchZero(Void);
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());

#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc
#define Hwi_dispatchTable ti_sysbios_family_c28_Hwi_dispatchTable
#define Hwi_dispatchZeroTable ti_sysbios_family_c28_Hwi_dispatchZeroTable
#define Hwi_dispatchPie ti_sysbios_family_c28_Hwi_dispatchPie
#define Hwi_dispatchZero ti_sysbios_family_c28_Hwi_dispatchZero

extern cregister volatile unsigned int IER;
extern cregister volatile unsigned int IFR;

#ifdef ti_sysbios_family_c28_Hwi_dispatcherTaskSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_c28_Hwi_dispatcherSwiSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define SWI_DISABLE Swi_disable
#define SWI_RESTORE Swi_restoreHwi
#else
#define SWI_DISABLE Hwi_swiDisable
#define SWI_RESTORE Hwi_swiRestoreHwi
#endif

/*
 *  ======== Hwi_Module_startup ========
 */
Int Hwi_Module_startup (Int phase)
{
    volatile UInt16 *regAddr;
    Int i;
    Hwi_Object *hwi;
    extern UInt32 ti_sysbios_family_c28_Hwi_vectors[];

    /* Swi and Task APIs used but not called until BIOS_start() */
    /* okay to proceed with initialization */
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].registerFxn != NULL) {
            Hwi_hooks.elem[i].registerFxn(i);
        }
    }
#endif

    /*
     * Intialize the interrupt vectors.  These are initially placed in .econst
     * section (typically in FLASH) and later copied to their home in RAM.
     */
    asm(" EALLOW");
    memcpy((Void *)0xd00, ti_sysbios_family_c28_Hwi_vectors,
        Hwi_NUM_INTERRUPTS_ALL * sizeof(UInt32));
    asm(" EDIS");

    /*
     * Initialize ISR stack pointer.
     */
    Hwi_module->isrStack = (Char *)(Hwi_module->isrStackBase);

    /* Signal that we're executing on the ISR stack */
    Hwi_module->taskSP = (Char *)-1;

    regAddr = (UInt16 *)PIEIFR1_ADDR;

    /* Clear All PIEIFRs. The address offset is 2 */
    for (i = 0; i < 12; i++) {
        *regAddr = 0;
        regAddr += 2;
    }

    /* Clear all PIEACK bits so no interrupt is blocked */
    regAddr = (UInt16 *)PIEACK_ADDR;
    *regAddr = PIEACK_CLEAR;

    /* Enable PIE */
    regAddr = (UInt16 *)PIECTRL_ADDR;
    *regAddr |= PIECTRL_ENPIE;

    /* Enable interrupts for statically created Hwi's */
    for (i = 0; i < Hwi_Object_count(); i++) {
        hwi = Hwi_Object_get(NULL, i);
        if (hwi->enableInt) {
            /*
             * Only set PIEIER. IER will be enabled using Hwi_module->ierMask
             */
            Hwi_enableInterrupt(hwi->intNum);
        }
    }

    /* Enable IER that has been set statically */
    Hwi_enableIER(Hwi_module->ierMask);

    /* For every Hwi in the dispatchTable, postInit */
    for (i = 0; i < Hwi_NUM_INTERRUPTS_ALL; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi !=  NULL) {
            Hwi_postInit(hwi, NULL);
        }
    }

    return (Startup_DONE);
}

/*
 *  ======== Hwi_Instance_init ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum, Hwi_FuncPtr fxn,
                      const Hwi_Params *params, Error_Block *eb)
{
    Int status;
    Hwi_PlugFuncPtr pfxn;

    Assert_isTrue((intNum >= 1 && intNum <= 15) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL),
                   Hwi_A_badIntNum);

    /*
     * Ensure that there is no conflict between non-zero/zero latency
     * IER bits
     */
    Assert_isTrue((Hwi_zeroLatencyIERMask & Hwi_getIERBit(intNum)) == 0,
                  Hwi_A_zeroLatencyConflict);

    /*
     * If the dispatchTable entry is non-NULL, then it has already been defined
     */
    if (Hwi_module->dispatchTable[intNum] != NULL) {
        Error_raise(eb, Hwi_E_alreadyDefined, intNum, 0);
        return (1);
    }

    hwi->intNum = intNum;
    hwi->enableInt = params->enableInt;
    hwi->enableAck = params->enableAck;

    /* If the interrupt is one of the standard 32 interrupts... */
    if ((intNum > 0) && (intNum < Hwi_NUM_INTERRUPTS)) {
        /* Each entry in the dispatch table is 3 words. */
        if (Hwi_zeroLatencyIERMask != 0) {
            pfxn =
                (Hwi_PlugFuncPtr)((UInt32) &Hwi_dispatchZeroTable +
                              ((intNum - 1) * 3));
        }
        else {
            pfxn =
                (Hwi_PlugFuncPtr)((UInt32) &Hwi_dispatchTable +
                              ((intNum - 1) * 3));
        }

        /* intNum from 1-16, IER from 0-15 */
        hwi->ierBitMask = 1 << (intNum - 1);
    }
    /* Otherwise, if the interrupt is a PIE interrupt... */
    else if (intNum >= Hwi_NUM_INTERRUPTS) {
        if (Hwi_zeroLatencyIERMask != 0) {
            /* This is Zero Latency PIE interrupt */
            pfxn = Hwi_dispatchZero;
        }
        else {
            /* This is PIE interrupt */
            pfxn = Hwi_dispatchPie;
        }

        if (intNum < 128) {
            /* intNum from 32-127, IER from 0-11 */
            /* interrupt group 1 to 12 = (PIE int - 32) / 8; */
            hwi->ierBitMask = 1 << ((intNum - Hwi_NUM_INTERRUPTS) >> 3);
        }
        else {
            /* intNum from 128-223, IER from 0-11 */
            /* interrupt group 1 to 12 = (PIE int - 128) / 8; */
            hwi->ierBitMask = 1 << ((intNum - 128) >> 3);
        }
    }

    Hwi_module->dispatchTable[intNum] = hwi;
    Hwi_plug(intNum, pfxn);
    Hwi_reconfig(hwi, fxn, params);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        /* Allocate environment space for each hook instance. */
        hwi->hookEnv = Memory_calloc(Hwi_Object_heap(),
                Hwi_hooks.length * sizeof(Ptr), 0, eb);

        if (hwi->hookEnv == NULL) {
            return (2);
        }
    }
#endif

    hwi->irp = 0;

    status = Hwi_postInit(hwi, eb);

    if (status) {
        return (2 + status);
    }

    return (0);
}



/*
 *  ======== Hwi_postInit ========
 *  Function to be called during module startup to complete the
 *  initialization of any statically created or constructed Hwi.
 *  returns (0) and clean 'eb' on success
 *  returns 'eb' *and* 'n' for number of successful createFxn() calls iff
 *      one of the createFxn() calls fails
 */
Int Hwi_postInit(Hwi_Object *hwi, Error_Block *eb)
{
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i;
    Error_Block localEB;
    Error_Block *leb;

    if (eb != Error_IGNORE) {
        leb = eb;
    }
    else {
        Error_init(&localEB);
        leb = &localEB;
    }

    for (i = 0; i < Hwi_hooks.length; i++) {
        hwi->hookEnv[i] = (Ptr)0;
        if (Hwi_hooks.elem[i].createFxn != NULL) {
            Hwi_hooks.elem[i].createFxn((IHwi_Handle)hwi, leb);

            if (Error_check(leb)) {
                return (i + 1);
            }
        }
    }
#endif

    return (0);
}

/*
 *  ======== Hwi_Instance_finalize ========
 *  Here on Hwi_delete() or failed Hwi_create().
 *  finalize does *NOT* restore/alter any IER or PIEIER bits
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
    Int i, cnt;
    UInt intNum;

    if (status == 1) {  /* failed early in Hwi_Instance_init()  */
        return;
    }

    intNum = hwi->intNum;

    Hwi_disableInterrupt(intNum);
    Hwi_module->dispatchTable[intNum] = NULL;
    Hwi_plug(intNum, Hwi_unPluggedInterrupt);

    if (status == 2) {  /* failed midway into Hwi_Instance_init()  */
        return;
    }

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        if (status == 0) {
            cnt = Hwi_hooks.length;
        }
        else {
            cnt = status - 3;
        }

        for (i = 0; i < cnt; i++) {
            if (Hwi_hooks.elem[i].deleteFxn != NULL) {
                Hwi_hooks.elem[i].deleteFxn((IHwi_Handle)hwi);
            }
        }

        Memory_free(Hwi_Object_heap(), hwi->hookEnv,
                Hwi_hooks.length * sizeof(Ptr));
    }
#endif
}

/*
 *  ======== Hwi_enablePIEIER ========
 *  (Referenced from sprufb0b)
 *  Step a. Disable global interrupts (INTM = 1).
 *  Step b. Set the PIEIERx.y bits
 *  Step c. Wait 5 cycles (see explanation in code)
 *  Step d. Clear the CPU IFRx bits for the peripheral group
 *  Step e. Clear the PIEACKx bit for the peripheral group.
 *  Step f. Enable global interrupts (INTM = 0).
 */
Bits16 Hwi_enablePIEIER(UInt groupNum, Bits16 pieMask)
{
    Bits16 ierBitMask;
    Bits16 oldPIEIER;
    UInt key;

    /* There are 12 PIE groups. Assert that groupNum is correct */
    Assert_isTrue(groupNum >= 1 && groupNum <= 12, Hwi_A_invalidArg);

    /* Step a. */
    key = __disable_interrupts();

    /* Step b. */
    oldPIEIER = *((UInt16 *)PIECTRL_ADDR + (groupNum * 2));
    *((UInt16 *)PIECTRL_ADDR + (groupNum * 2)) |= pieMask;

    /*
     * Step c.
     * Delay required to be sure that any interrupt that was incoming to
     * the CPU has been flagged within the CPU IFR register
     */
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");

    /* Step d. */
    Hwi_clearInterrupt(groupNum);

    /*
     * Step e.
     * groupNum is 1-12; ierBitMask is 0x0001 << to 0x0800
     */
    ierBitMask = 1 << (groupNum - 1);
    *(UInt16 *)PIEACK_ADDR |= ierBitMask;

    /* Step f. */
    __restore_interrupts(key);

    return (oldPIEIER);
}

/*
 *  ======== Hwi_disablePIEIER ========
 *  (Referenced from sprufb0b)
 *  Step a. Disable global interrupts (INTM = 1).
 *  Step b. Clear the PIEIERx.y bits
 *  Step c. Wait 5 cycles (see explanation in code)
 *  Step d. Clear the CPU IFRx bit for the peripheral group
 *  Step e. Clear the PIEACKx bit for the peripheral group.
 *  Step f. Enable global interrupts (INTM = 0).
 */
Bits16 Hwi_disablePIEIER(UInt groupNum, Bits16 pieMask)
{
    Bits16 ierBitMask;
    Bits16 oldPIEIER;
    UInt key;

    /* There are 12 PIE groups. Assert that groupNum is correct */
    Assert_isTrue(groupNum >= 1 && groupNum <= 12, Hwi_A_invalidArg);

    /* Step a. */
    key = __disable_interrupts();

    /* Step b. */
    oldPIEIER = *((UInt16 *)PIECTRL_ADDR + (groupNum * 2));
    *((UInt16 *)PIECTRL_ADDR + (groupNum * 2)) &= (~pieMask);

    /*
     * Step c.
     * Delay required to be sure that any interrupt that was incoming to
     * the CPU has been flagged within the CPU IFR register
     */
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");

    /* Step d. */
    Hwi_clearInterrupt(groupNum);

    /*
     * Step e.
     * groupNum is 1-12; ierBitMask is 0x0001 << to 0x0800
     */
    ierBitMask = 1 << (groupNum - 1);
    *(UInt16 *)PIEACK_ADDR &= ierBitMask;

    /* Step f. */
    __restore_interrupts(key);

    return (oldPIEIER);
}

/*
 *  ======== Hwi_restorePIEIER ========
 *  (Referenced from sprufb0b)
 *  Step a. Disable global interrupts (INTM = 1).
 *  Step b. Restore the PIEIERx.y bits
 *  Step c. Wait 5 cycles (see explanation in code)
 *  Step d. Clear the CPU IFRx bits for the peripheral group
 *  Step e. Clear the PIEACKx bit for the peripheral group.
 *  Step f. Enable global interrupts (INTM = 0).
 */
Bits16 Hwi_restorePIEIER(UInt groupNum, Bits16 pieMask)
{
    Bits16 ierBitMask;
    Bits16 oldPIEIER;
    UInt key;

    /* There are 12 PIE groups. Assert that groupNum is correct */
    Assert_isTrue(groupNum >= 1 && groupNum <= 12, Hwi_A_invalidArg);

    /* Step a. */
    key = __disable_interrupts();

    /* Step b. */
    oldPIEIER = *((UInt16 *)PIECTRL_ADDR + (groupNum * 2));
    *((UInt16 *)PIECTRL_ADDR + (groupNum * 2)) = pieMask;

    /*
     * Step c.
     * Delay required to be sure that any interrupt that was incoming to
     * the CPU has been flagged within the CPU IFR register
     */
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");
    asm("   nop");

    /* Step d. */
    Hwi_clearInterrupt(groupNum);

    /*
     * Step e.
     * groupNum is 1-12; ierBitMask is 0x0001 << to 0x0800
     */
    ierBitMask = 1 << (groupNum - 1);
    *(UInt16 *)PIEACK_ADDR |= ierBitMask;

    /* Step f. */
    __restore_interrupts(key);

    return (oldPIEIER);
}

/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    UInt groupNum;
    Bits16 disableMask;
    UInt key;

    Assert_isTrue((intNum >= 1 && intNum <= 14) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL), Hwi_A_badIntNum);

    if (intNum >= Hwi_NUM_INTERRUPTS) {
        if (intNum < 128) {
            /* Disable single PIE interrupt */
            groupNum = ((intNum - Hwi_NUM_INTERRUPTS) >> 3) + 1;

            /* disable the bit in the PIEIER reg */
            disableMask = 1 << (intNum & 0x7);
        }
        else {
            /* Disable single PIE interrupt */
            groupNum = ((intNum - 128) >> 3) + 1;

            /* disable the bit in the PIEIER reg */
            disableMask = 0x100 << (intNum & 0x7);
        }

        /* key is a bitmask for the old PIEIER bit corresponding to intNum */
        key = Hwi_disablePIEIER(groupNum, disableMask) & disableMask;
    }
    else {
        /*
         *  Disable entire PIE group.
         *  groupNum is 1-15; IER mask is 0x0001 << to 0x0800
         */
        disableMask = 1 << (intNum - 1);
        key = Hwi_disableIER(disableMask) & disableMask;
    }

    return (key);
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    UInt groupNum;
    Bits16 enableMask;
    UInt key;

    Assert_isTrue((intNum >= 1 && intNum <= 14) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL), Hwi_A_badIntNum);

    if (intNum < Hwi_NUM_INTERRUPTS) {
        /* Simply enable the IER bits */
        enableMask = 1 << (intNum - 1);
        key = Hwi_enableIER(enableMask) & enableMask;
    }
    else {
        if (intNum < 128) {
            /* Enable both the IER and PIEIER bits */
            groupNum = ((intNum - Hwi_NUM_INTERRUPTS) >> 3) + 1;
         }
        else {
            /* Enable both the IER and PIEIER bits */
            groupNum = ((intNum - 128) >> 3) + 1;
        }

        /* Set IER */
        enableMask = 1 << (groupNum - 1);
        Hwi_enableIER(enableMask) & enableMask;

        if (intNum < 128) {
            /* Set PIEIER. enableMask = 1 << (intNum % 8) */
            enableMask = 1 << (intNum & 0x7);
        }
        else {
            /* Set PIEIER. enableMask = 1 << (intNum % 8) */
            enableMask = 0x100 << (intNum & 0x7);
        }

        key = Hwi_enablePIEIER(groupNum, enableMask) & enableMask;
    }

    return (key);
}

/*
 *  ======== Hwi_restoreInterrupt ========
 *  If intNum >= 32, then key is 8 bits
 *  Else, key is 16 bits
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    Assert_isTrue((intNum >= 1 && intNum <= 14) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL), Hwi_A_badIntNum);

    if (key) {
        /* Nonzero key indicates that IER/PIEIER was previously enabled */
        Hwi_enableInterrupt(intNum);
    }
    else {
        /* Zero key indicates that IER/PIEIER was previously enabled */
        Hwi_disableInterrupt(intNum);
    }
}

/*
 *  ======== Hwi_clearInterrupt ========
 *  Clear either PIEIER or IER
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    UInt groupNum, pieIntNum;
    UInt32 *vectAdd;
    UInt32 origVector;
    Bits16 ierKey, pieIERMask;
    UInt globalKey;


    Assert_isTrue((intNum >= 1 && intNum <= 14) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL), Hwi_A_badIntNum);

    /*
     * The numbering convention for c28 interrupts is that Int 1-31 are the
     * normal interrupts and 32-127 are the PIE interrupts. (96 PIE interrupts
     * in groups of 8 map to 12 normal interrupts).
     */
    if (intNum < Hwi_NUM_INTERRUPTS) {
        /*
         * Have to use a switch statement because can only write constant values
         * to IFR cregister. In other words, can't use "IFR &= ~(1 << ifrNum)".
         */
        switch (intNum) {
            case 1:
                asm("       AND IFR, #0xfffe");
                break;
            case 2:
                asm("       AND IFR, #0xfffd");
                break;
            case 3:
                asm("       AND IFR, #0xfffb");
                break;
            case 4:
                asm("       AND IFR, #0xfff7");
                break;
            case 5:
                asm("       AND IFR, #0xffef");
                break;
            case 6:
                asm("       AND IFR, #0xffdf");
                break;
            case 7:
                asm("       AND IFR, #0xffbf");
                break;
            case 8:
                asm("       AND IFR, #0xff7f");
                break;
            case 9:
                asm("       AND IFR, #0xfeff");
                break;
            case 10:
                asm("       AND IFR, #0xfdff");
                break;
            case 11:
                asm("       AND IFR, #0xfbff");
                break;
            case 12:
                asm("       AND IFR, #0xf7ff");
                break;
            case 13:
                asm("       AND IFR, #0xefff");
                break;
            case 14:
                asm("       AND IFR, #0xdfff");
                break;
            default:
                break;
        } /* switch */
    }
    else { /* intNum >= 32; need to clear PIEIFR */
        if (intNum < 128) {
            pieIntNum = intNum - Hwi_NUM_INTERRUPTS;
            pieIERMask = 1 << (intNum & 0x7);
        }
        else {
            pieIntNum = intNum - 128;
            pieIERMask = 0x100 << (intNum & 0x7);
        }

        /*
         * Clear PIEIFR bit.
         * The 32-bit vectors take 2 words of space each, so add intNum * 2
         */
        vectAdd = (UInt32 *)(VECTOR_PIE_BASE + intNum * 2);

        /* Save original PIE vector */
        origVector = (UInt32)*vectAdd;

        groupNum = (pieIntNum >> 3) + 1;
        globalKey = __enable_interrupts();
        ierKey = Hwi_enableIER(1 << (pieIntNum >> 3));

        /* Step 1 Enable access to protected space */
        asm("   EALLOW");

        /* Step 2. Set vector to Hwi_interruptReturn */
        *vectAdd = (UInt32)Hwi_interruptReturn;

        /* Steps 3-4. Should jump to Hwi_interruptReturn and back here again */
        Hwi_enablePIEIER(groupNum, pieIERMask);

        /* Step 5. Restore original vector and PIEIER settings. */
        Hwi_disablePIEIER(groupNum, pieIERMask);
        *vectAdd = (UInt32)origVector;

        /* Step 6. Disable access to protected space */
        asm("   EDIS");
        Hwi_restoreIER(ierKey);
        __restore_interrupts(globalKey);
    }
}

/*
 *  ======== Hwi_getInterruptFlag ========
 */
Bits16 Hwi_getInterruptFlag(UInt intNum) {
    Bits16 intFlag;
    Bits16 PIEIFR;
    UInt groupNum;

        /*
         *  No need to assert that intNum is OK because
         *  only Timer should call this
         */

    if (intNum < Hwi_NUM_INTERRUPTS) { /* Need to return IFR value */
        intFlag = Hwi_getIFR() & (1 << (intNum - 1));
    }
    else { /* Need to return PIEIFR value */
        if (intNum < 128) {
            groupNum = ((intNum - Hwi_NUM_INTERRUPTS) >> 3) + 1;
            PIEIFR = *((UInt16 *)PIECTRL_ADDR + ((groupNum * 2) + 1));
            intFlag = PIEIFR & (1 << (intNum & 0x7));
        }
        else {
            groupNum = ((intNum - 128) >> 3) + 1;
            PIEIFR = *((UInt16 *)PIECTRL_ADDR + ((groupNum * 2) + 1));
            intFlag = PIEIFR & (0x100 << (intNum & 0x7));
        }
    }

    return (intFlag);
}


/*
 *  ======== Hwi_getHandle ========
 *  Returns pointer to Hwi instance object.
 */
Hwi_Handle Hwi_getHandle(UInt intNum)
{
    return (Hwi_module->dispatchTable[intNum]);
}


/*
 *  ======== Hwi_getFunc ========
 */
Hwi_FuncPtr Hwi_getFunc(Hwi_Object *hwi, UArg *arg)
{
    if (arg != NULL) {
        *arg = hwi->arg;
    }

    return (hwi->fxn);
}

/*
 *  ======== setFunc ========
 */
Void Hwi_setFunc(Hwi_Object *hwi, Void (*fxn)(), UArg arg)
{
    hwi->fxn = fxn;
    hwi->arg = arg;
}

/*
 *  ======== Hwi_getIrp ========
 */
Hwi_Irp Hwi_getIrp(Hwi_Object *hwi)
{
    return (hwi->irp);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    UInt16 *PIEIFRPtr;

    Assert_isTrue((intNum >= 1 && intNum <= 14) ||
                  (intNum >= Hwi_NUM_INTERRUPTS &&
                   intNum < Hwi_NUM_INTERRUPTS_ALL), Hwi_A_badIntNum);

    if (intNum < Hwi_NUM_INTERRUPTS) {
        /* Flag IFR */
        switch (intNum) {
            case 1:
                asm("       OR IFR, #0x0001");
                break;
            case 2:
                asm("       OR IFR, #0x0002");
                break;
            case 3:
                asm("       OR IFR, #0x0004");
                break;
            case 4:
                asm("       OR IFR, #0x0008");
                break;
            case 5:
                asm("       OR IFR, #0x0010");
                break;
            case 6:
                asm("       OR IFR, #0x0020");
                break;
            case 7:
                asm("       OR IFR, #0x0040");
                break;
            case 8:
                asm("       OR IFR, #0x0080");
                break;
            case 9:
                asm("       OR IFR, #0x0100");
                break;
            case 10:
                asm("       OR IFR, #0x0200");
                break;
            case 11:
                asm("       OR IFR, #0x0400");
                break;
            case 12:
                asm("       OR IFR, #0x0800");
                break;
            case 13:
                asm("       OR IFR, #0x1000");
                break;
            case 14:
                asm("       OR IFR, #0x2000");
                break;
        }
    }
    else {
        if (intNum < 128) {
            /* Flag PIE IFR */
            PIEIFRPtr = (UInt16 *)PIEIER1_ADDR +
                (((intNum - Hwi_NUM_INTERRUPTS) >> 3) * 2) + 1;
            *PIEIFRPtr |= (1 << (intNum & 0x7));
        }
        else {
            /* Flag PIE IFR for upper bits */
            PIEIFRPtr = (UInt16 *)PIEIER1_ADDR +
                (((intNum - 128) >> 3) * 2) + 1;
            *PIEIFRPtr |= (0x100 << (intNum & 0x7));
        }
    }
}

/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (Hwi_module->taskSP);
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum;

    intNum = hwi->intNum;

    Hwi_disableInterrupt(intNum);

    hwi->fxn = fxn;
    hwi->arg = params->arg;

    switch (params->maskSetting) {
        case Hwi_MaskingOption_NONE:
            hwi->disableMask = 0;
            hwi->restoreMask = 0;
            break;
        case Hwi_MaskingOption_ALL:
            hwi->disableMask = 0xffff;
            hwi->restoreMask = 0xffff;
            break;
        case Hwi_MaskingOption_LOWER:
        case Hwi_MaskingOption_SELF:
            hwi->disableMask = hwi->ierBitMask;
            hwi->restoreMask = hwi->ierBitMask;
            break;
        case Hwi_MaskingOption_BITMASK:
            hwi->disableMask = params->disableMask;
            hwi->restoreMask = params->restoreMask;
            break;
        default:
            /* Bad maskSetting*/
            Assert_isTrue(FALSE, NULL);
    }

    if (params->enableInt) {
        Hwi_enableInterrupt(intNum);
    }
}

/*
 *  ======== switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void Hwi_switchFromBootStack()
{
    Hwi_module->taskSP = 0;
}

/*
 *  ======== Hwi_getStackInfo ========
 *  Used to get Hwi stack usage info.
 */
Bool Hwi_getStackInfo(Hwi_StackInfo *stkInfo, Bool computeStackDepth)
{
    Char *isrSP;
    Bool stackOverflow;

    /* Copy the stack base address and size */
    stkInfo->hwiStackSize = (SizeT)(Hwi_module->isrStackSize);
    stkInfo->hwiStackBase = (Ptr)(Hwi_module->isrStackBase);

    isrSP = (Char *)(stkInfo->hwiStackBase) + (UInt32)(stkInfo->hwiStackSize) - 1;

    /* Check for stack overflow */
    stackOverflow = (*isrSP != (Char)0xbebe ? TRUE : FALSE);

    if (computeStackDepth && !stackOverflow) {
        /* Compute stack depth */
        do {
        } while(*isrSP-- == (Char)0xbebe);
        stkInfo->hwiStackPeak = (SizeT)(++isrSP - (Char *)(stkInfo->hwiStackBase)) + 1;
    }
    else {
        stkInfo->hwiStackPeak = 0;
    }

    return stackOverflow;
}

/* 
 *  ======== Hwi_getCoreStackInfo ========
 *  Used to get Hwi stack usage info.
 */
Bool Hwi_getCoreStackInfo(Hwi_StackInfo *stkInfo, Bool computeStackDepth, UInt coreId)
{
    return (Hwi_getStackInfo(stkInfo, computeStackDepth));
}

/*
 *  ======== Hwi_plug ========
 */
Void Hwi_plug(UInt intNum, Hwi_PlugFuncPtr fxn)
{
    UInt32 *vectAdd;

    Assert_isTrue(intNum >= 1 && intNum < Hwi_NUM_INTERRUPTS_ALL, Hwi_A_badIntNum);

    /* The 32-bit vectors take 2 words of space each, so intNum * 2 */
    vectAdd = (UInt32 *)(VECTOR_PIE_BASE + intNum * 2);
    asm("   EALLOW");    /* Enable access to protected space */
    *vectAdd = (UInt32)fxn;
    asm("   EDIS");
}

/*
 *  ======== Hwi_ack ========
 */
Void Hwi_ack(Hwi_Object *hwi)
{
    volatile UInt16 *regAddr;

    /* for PIE interrupt */
    if (hwi->intNum >= Hwi_NUM_INTERRUPTS) {
        /* Clear the PIEACK bit so the interrupt is enabled */
        regAddr = (UInt16 *)PIEACK_ADDR;
        *regAddr |= hwi->ierBitMask;
    }
}

/*
 *  ======== Hwi_unPluggedInterrupt ========
 */
interrupt Void Hwi_unPluggedInterrupt()
{
    volatile UInt16 *pieCtrlAddr = (UInt16 *)PIECTRL_ADDR;
    UInt intNum;

    intNum = (*pieCtrlAddr & 0xfe) >> 1;

    Error_raise(NULL, Hwi_E_unpluggedInterrupt, intNum, NULL);
}

/*
 *  ======== Hwi_getHookContext ========
 */
Ptr Hwi_getHookContext(Hwi_Object *hwi, Int id)
{
    return (hwi->hookEnv[id]);
}

/*
 *  ======== Hwi_setHookContext ========
 */
Void Hwi_setHookContext(Hwi_Object *hwi, Int id, Ptr hookContext)
{
    hwi->hookEnv[id] = hookContext;
}

/*
 *  ======== Hwi_getIERBit ========
 */
Bits16 Hwi_getIERBit(UInt intNum)
{
    Bits16 mask;
    UInt groupNum;

    if (intNum >= Hwi_NUM_INTERRUPTS) {
        if (intNum < 128) {
            /* Disable single PIE interrupt */
            groupNum = ((intNum - Hwi_NUM_INTERRUPTS) >> 3);
        }
        else {
            /* Disable single PIE interrupt */
            groupNum = ((intNum - 128) >> 3);
        }

        /* disableMask = 1 << (intNum % 8) */
        mask = 1 << (groupNum);
    }
    else {
        mask = 1 << (intNum - 1);
    }

    return (mask);
}

/*
 *  ======== Hwi_dispatchC ========
 *  Configurable dispatcher.
 */
Void Hwi_dispatchC(Int intNum)
{
    Int tskKey;

    if (Hwi_dispatcherTaskSupport) {
        tskKey = TASK_DISABLE();
    }

    Hwi_switchAndDispatch(intNum);

    if (Hwi_dispatcherTaskSupport) {
        TASK_RESTORE(tskKey);   /* returns with ints disabled */
    }
}

/*
 *  ======== Hwi_dispatchCore ========
 *  Configurable dispatcher.
 */
Void Hwi_dispatchCore(Int intNum)
{
    Hwi_Object      *hwi;
    BIOS_ThreadType prevThreadType;
    UInt16          oldIER;
    Int             swiKey;
    Int             i;

    /*
     * All references to local variables beyond this point
     * will be on the isr stack
     */
    hwi = Hwi_module->dispatchTable[intNum];

    /* ack the PIE interrupt */
    if (hwi->enableAck) {
        Hwi_ack(hwi);
    }

    hwi->irp = Hwi_module->irp;

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    /* call the begin hooks */
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].beginFxn != NULL) {
            Hwi_hooks.elem[i].beginFxn((IHwi_Handle)hwi);
        }
    }
#endif

    Log_write5(Hwi_LM_begin, (IArg)hwi, (IArg)hwi->fxn,
               (IArg)prevThreadType, (IArg)intNum, (IArg)hwi->irp);

    /* call the user's isr */
    if (Hwi_dispatcherAutoNestingSupport) {
        if (Hwi_zeroLatencyIERMask == 0) {
            /* Propagate self bit which is auto cleared by hardware */
            IER |= hwi->ierBitMask;

            oldIER = IER;
            IER &= ~hwi->disableMask;

            __enable_interrupts();
            (hwi->fxn)(hwi->arg);
            __disable_interrupts();

            IER |= (hwi->restoreMask & oldIER);
        }
        else {
            oldIER = Hwi_module->shadowIER;

            /* zero latency version of Hwi_disableIER() */
            Hwi_module->shadowIER &= ~hwi->disableMask;

            /* zero latency version of Hwi_enable() */
            Hwi_module->globalEnable = TRUE;
            IER |= Hwi_module->shadowIER;

            /* Call user function */
            (hwi->fxn)(hwi->arg);

            /* zero latency version of Hwi_disable() */
            IER &= Hwi_zeroLatencyIERMask;
            Hwi_module->globalEnable = FALSE;

            /* zero latency version of Hwi_enableIER() */
            Hwi_module->shadowIER |= (hwi->restoreMask & oldIER);
        }
    }
    else {
        /* Execute the Hwi function */
        (hwi->fxn)(hwi->arg);

        /* Propagate self bit which is auto cleared by hardware */
        IER |= hwi->ierBitMask;
    }

    Log_write1(Hwi_LD_end, (IArg)hwi);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    /* call the end hooks */
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].endFxn != NULL) {
            Hwi_hooks.elem[i].endFxn((IHwi_Handle)hwi);
        }
    }
#endif

    /* Run Swi scheduler */
    if (Hwi_dispatcherSwiSupport) {
        SWI_RESTORE(swiKey);
    }

    /* restore thread type */
    BIOS_setThreadType(prevThreadType);
}

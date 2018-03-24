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
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Startup.h>
#include <ti/sysbios/interfaces/IHwi.h>
#include "package/internal/Hwi.xdc.h"

#if defined(__ICC430__)
#include <intrinsics.h>
#endif

#define Hwi_switchToIsrStack ti_sysbios_family_xxx_Hwi_switchToIsrStack
#define Hwi_switchToTaskStack ti_sysbios_family_xxx_Hwi_switchToTaskStack
#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc

#define GIE_BIT  0x8    /* GIE bit position in Status Register (SR) */ 

/*
 *  ======== Hwi_Module_startup ========
 */
Int Hwi_Module_startup(Int phase)
{
    int i;

#if defined(__ICC430__)
    __extern __FAR__ UInt8 _STACK_SIZE;
#else
    __extern __FAR__ UInt8 __TI_STACK_BASE;
    __extern __FAR__ UInt8 __STACK_SIZE;
#endif

    /* 
     *  perform the BIOS specific interrupt disable operation so
     *  main is entered with interrupts disabled.
     */
    Hwi_disable();

    /* call Register Hook functions */
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].registerFxn != NULL) {
            Hwi_hooks.elem[i].registerFxn(i);
        }
    }

    /* 
     * Initialize the pointer to the isrStack.
     * Leave room for up to 8 32 bit local variables.
     */

#if defined(__ICC430__)
#pragma segment = "CSTACK"
    Hwi_module->isrStack = __segment_begin("CSTACK");
    Hwi_module->isrStack += (UInt32)&_STACK_SIZE;
#else
    Hwi_module->isrStack = (Char *)&__TI_STACK_BASE;
    Hwi_module->isrStack += (UInt32)&__STACK_SIZE;
#endif
    Hwi_module->isrStack -= 0x2;

    Hwi_module->taskSP = (Char *)-1;    /* signal that we're executing */
                                        /* on the ISR stack */

    /* call Create Hook functions */
    for (i = 0; i < Hwi_Object_count(); i++) {
        Hwi_postInit(Hwi_Object_get(NULL, i), NULL);
    }

    return (Startup_DONE);
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    Hwi_enable();
}

/*
 * The following 3 function definitions are provided for backward 
 * library compatability.
 * The operational implementations of these functions are macros 
 * defined in Hwi__epilogue.h
 */

/*
 *  ======== Hwi_disable ========
 */
UInt ti_sysbios_family_msp430_Hwi_disable__E()
{
    UInt state;

    state = __get_SR_register();
    __disable_interrupt();

    return (state & GIE_BIT);
}

/*
 *  ======== Hwi_enable ========
 */
UInt ti_sysbios_family_msp430_Hwi_enable__E()
{
    UInt state;

    state = __get_SR_register();
    __enable_interrupt();

    return (state & GIE_BIT);
}

/*
 *  ======== Hwi_restore ========
 */
Void ti_sysbios_family_msp430_Hwi_restore__E(UInt key)
{
    if (key == GIE_BIT) {
        __enable_interrupt();
    }
    else {
        __disable_interrupt();
    }
}


/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_disableInterrupt", 0);
    return (1);
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_enableInterrupt", 0);
    return (1);
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_restoreInterrupt", 0);
}

/*
 *  ======== Hwi_clearInterrupt ========
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_clearInterrupt", 0);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_post", 0);
}

/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (Hwi_module->taskSP);
}

/*
 *  ======== switchFromBootStack ========
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
#if defined(__ICC430__)
    __extern __FAR__ UInt8 _STACK_SIZE;
#else
    __extern __FAR__ UInt8 __TI_STACK_BASE;
    __extern __FAR__ UInt8 __STACK_SIZE;
#endif

    Char *isrSP;
    Bool stackOverflow;
    UInt32 size;

    /* Copy the stack base address and size */
#if defined(__ICC430__)
#pragma segment = "CSTACK"
    size = (UInt32)(&_STACK_SIZE);
    stkInfo->hwiStackBase = (Ptr)__segment_begin("CSTACK");
#else
    size = (UInt32)(&__STACK_SIZE);
    stkInfo->hwiStackBase = (Ptr)&__TI_STACK_BASE;
#endif

    stkInfo->hwiStackSize = (SizeT)size;

    isrSP = stkInfo->hwiStackBase;

    /* Check for stack overflow */
    stackOverflow = (*isrSP != (Char)0xbe ? TRUE : FALSE);

    if (computeStackDepth && !stackOverflow) {
        /* Compute stack depth */
        do {
        } while(*isrSP++ == (Char)0xbe);
        stkInfo->hwiStackPeak = stkInfo->hwiStackSize - (SizeT)(--isrSP - (Char *)stkInfo->hwiStackBase);
    }
    else {
        stkInfo->hwiStackPeak = 0;
    }

    return stackOverflow;
}

/*
 *  ======== Hwi_Instance_init ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum, Hwi_FuncPtr fxn, const Hwi_Params *params, Error_Block *eb)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_create", 0);

    return (1);
}


/*
 *  ======== Hwi_postInit ========
 *  Function to be called during module startup to complete the
 *  initialization of any statically created or constructed Hwi.
 *  returns (0) and clean 'eb' on success
 *  returns 'eb' *and* 'n' for number of successful createFxn() calls iff
 *      one of the createFxn() calls fails
 */
Int Hwi_postInit (Hwi_Object *hwi, Error_Block *eb)
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
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
}

/*
 *  ======== Hwi_getFunc ========
 */
Hwi_FuncPtr Hwi_getFunc(Hwi_Object *hwi, UArg *arg)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_getFunc", 0);
    return (NULL);
}

/*
 *  ======== Hwi_setFunc ========
 */
Void Hwi_setFunc(Hwi_Object *hwi, Hwi_FuncPtr fxn, UArg arg)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_setFunc", 0);
}

/*
 *  ======== Hwi_getIrp ========
 */
Hwi_Irp Hwi_getIrp(Hwi_Object *hwi)
{
    Error_raise(NULL, Hwi_E_notImplemented, "Hwi_getIrp", 0);
    return (hwi->irp);
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
 *  ======== Hwi_logBegin ========
 */
Void Hwi_logBegin(Log_Event evt, IArg a1, IArg a2, IArg a3, IArg a4, IArg a5)
{
    xdc_runtime_Log_write5(evt, a1, a2, a3, a4, a5);
}

/*
 *  ======== Hwi_logEnd ========
 */
Void Hwi_logEnd(Log_Event evt, IArg a1)
{
    xdc_runtime_Log_write1(evt, a1);
}



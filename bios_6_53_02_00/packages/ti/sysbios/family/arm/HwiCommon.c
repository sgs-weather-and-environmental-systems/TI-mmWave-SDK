/*
 * Copyright (c) 2013-2014, Texas Instruments Incorporated
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
 *  ======== HwiCommon.c ========
 */

#include <xdc/runtime/Startup.h>

#include "package/internal/HwiCommon.xdc.h"

#pragma CODE_STATE(HwiCommon_disable, 32);
#pragma CODE_STATE(HwiCommon_enable, 32);
#pragma CODE_STATE(HwiCommon_restore, 32);
#pragma CODE_STATE(HwiCommon_disableIRQ, 32);
#pragma CODE_STATE(HwiCommon_enableIRQ, 32);
#pragma CODE_STATE(HwiCommon_restoreIRQ, 32);
#pragma CODE_STATE(HwiCommon_disableFIQ, 32);
#pragma CODE_STATE(HwiCommon_enableFIQ, 32);
#pragma CODE_STATE(HwiCommon_restoreFIQ, 32);

/*
 *  ======== HwiCommon_Module_startup ========
 */
Int HwiCommon_Module_startup (Int startupPhase)
{
    /* 
     * Initialize the pointer to the isrStack.
     *
     * The dispatcher's SP must be aligned on a long word boundary
     */
    HwiCommon_module->isrStack =
        (Char *)(((UInt32)(HwiCommon_module->isrStackBase) & 0xfffffff8) +
                (UInt32)HwiCommon_module->isrStackSize - 2 * sizeof(Int));

    HwiCommon_module->taskSP = (Char *)-1;    /* signal that we're executing */

    return Startup_DONE;
}

/*
 *  ======== HwiCommon_disable ========
 *  disables only IRQ interrupts
 */

UInt HwiCommon_disable()
{
#ifdef __32bis__
    return _disable_IRQ();
#else
    return HwiCommon_disableA();
#endif
}

/*
 *  ======== HwiCommon_enable   ========
 *  enables only IRQ interrupts
 */
UInt HwiCommon_enable()
{
#ifdef __32bis__
    return _enable_IRQ();
#else
    return HwiCommon_enableA();
#endif
}

/*
 *  ======== HwiCommon_restore ========
 *  restores only IRQ interrupts
 */
Void HwiCommon_restore( UInt key )
{
#ifdef __32bis__
    _restore_interrupts(key);
#else
    HwiCommon_restoreA(key);
#endif
}

/*
 *  ======== HwiCommon_disableFIQ ========
 *  disables only FIQ interrupts
 */

UInt HwiCommon_disableFIQ()
{
#ifdef __32bis__
    return _disable_FIQ();
#else
    return HwiCommon_disableFIQA();
#endif
}

/*
 *  ======== HwiCommon_enableFIQ ========
 *  enables only FIQ interrupts
 */
UInt HwiCommon_enableFIQ()
{
#ifdef __32bis__
    return _enable_FIQ();
#else
    return HwiCommon_enableFIQA();
#endif
}

/*
 *  ======== HwiCommon_restoreFIQ ========
 *  restores only IRQ interrupts
 */
Void HwiCommon_restoreFIQ( UInt key )
{
#ifdef __32bis__
    _restore_interrupts(key);
#else
    HwiCommon_restoreFIQA(key);
#endif
}

/*
 *  ======== HwiCommon_disableFIQ ========
 *  disables only FIQ interrupts
 */

UInt HwiCommon_disableIRQ()
{
#ifdef __32bis__
    return _disable_IRQ();
#else
    return HwiCommon_disableIRQA();
#endif
}

/*
 *  ======== HwiCommon_enableIRQ ========
 *  enables only IRQ interrupts
 */
UInt HwiCommon_enableIRQ()
{
#ifdef __32bis__
    return _enable_IRQ();
#else
    return HwiCommon_enableIRQA();
#endif
}

/*
 *  ======== HwiCommon_restoreIRQ ========
 *  restores only IRQ interrupts
 */
Void HwiCommon_restoreIRQ( UInt key )
{
#ifdef __32bis__
    _restore_interrupts(key);
#else
    HwiCommon_restoreIRQA(key);
#endif
}

/*
 *  ======== HwiCommon_getTaskSP ========
 */
Char *HwiCommon_getTaskSP()
{
    return (HwiCommon_module->taskSP);
}

#pragma SWI_ALIAS (swi0, 0);

/* function that invokes SWI 0 */
Void swi0();

/*
 *  ======== HwiCommon_switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void HwiCommon_switchFromBootStack()
{
    HwiCommon_module->taskSP = 0;
}

/*!
 *  ======== HwiCommon_switchToSystemMode ========
 */
Void HwiCommon_switchToSystemMode()
{
    /* 
     * The switch is done within Arm SWI #0
     * while in Supervisor mode.
     *
     * Returns with CPU in System mode.
     */
    swi0();
}



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
 *  ======== Core.c ========
 *  ICore implementation for default BIOS CoreDelegate
 */

#include <xdc/std.h>
#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Core.xdc.h"

/*
 *  ======== Core_lock ========
 */
IArg Core_lock()
{
    return (Core_hwiDisable());
}

/*
 *  ======== Core_unlock ========
 */
Void Core_unlock()
{
}

/*
 *  ======== Core_getId ========
 */
UInt Core_getId()
{
    return (0);
}

/*
 *  ======== Core_interruptCore ========
 */
Void Core_interruptCore(UInt coreId)
{
}

/*
 *  ======== Core_hwiDisable ========
 */
UInt Core_hwiDisable()
{
    return Hwi_disable();
}

/*
 *  ======== Core_hwiEnable ========
 */
UInt Core_hwiEnable()
{
    return Hwi_enable();
}

/*
 *  ======== Core_hwiRestore ========
 */
Void Core_hwiRestore(UInt key)
{
    Hwi_restore(key);
}

/*
 *  ======== Core_getRevisionNumber ========
 */
UInt8 __attribute__((naked)) Core_getRevisionNumber()
{
    __asm__ __volatile__ (
        "mrc p15, #0, r0, c0, c0, #0\n\t"
        "mov r1, r0, lsr #16\n\t"
        "and r1, r1, #0xF0\n\t"
        "and r0, r0, #0xF\n\t"
        "orr r0, r1, r0\n\t"
        "bx  lr"
    );
}

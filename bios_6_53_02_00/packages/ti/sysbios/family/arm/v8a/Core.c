/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *
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
 *  ======== Core_getClusterId ========
 */
UInt Core_getClusterId()
{
    UInt clusterId;

    __asm__ __volatile__ (
        "mrs %0, mpidr_el1\n\t"
        "ubfx %0, %0, #8, #8"
        : "=r" (clusterId)
    );

    return (clusterId);
}

/*
 *  ======== Core_getId ========
 */
UInt Core_getId()
{
    UInt coreId;

    __asm__ __volatile__ (
        "mrs %0, mpidr_el1\n\t"
        "and %0, %0, #0xFF\n\t"
        : "=r" (coreId)
    );

    return (coreId);
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
    return (Hwi_disable());
}

/*
 *  ======== Core_hwiEnable ========
 */
UInt Core_hwiEnable()
{
    return (Hwi_enable());
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
UInt8 Core_getRevisionNumber()
{
    UInt8 key;

    __asm__ __volatile__ (
        "mrs %0, midr_el1\n\t"
        "lsr x1, %0, #16\n\t"
        "and x1, x1, #0xF0\n\t"
        "and %0, %0, #0xF\n\t"
        "orr %0, %0, x1"
        : "=r" (key)
        :: "x1"
    );

    return (key);
}

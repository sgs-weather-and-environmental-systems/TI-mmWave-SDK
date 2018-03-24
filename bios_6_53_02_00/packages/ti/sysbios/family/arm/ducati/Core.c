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
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include "package/internal/Core.xdc.h"

#define REG16(A)   (*(volatile UInt16 *) (A))
#define REG32(A)   (*(volatile UInt32 *) (A))

#define PID0_ADDRESS 0xE00FFFE0
#define INTERRUPT_CORE_0        0x40001000
#define INTERRUPT_CORE_1        0x40001002

/*
 *  ======== Timer_Module_startup ========
 */
Int Core_Module_startup(Int status)
{
    if (Core_id != *(UInt *)(PID0_ADDRESS)) {
        Error_raise(NULL, Core_E_mismatchedIds, Core_id, *(UInt *)(PID0_ADDRESS));
    }
    
    return (Startup_DONE);
}

/*
 *  ======== Core_getId ========
 */
UInt Core_getId()
{
    return (REG32(PID0_ADDRESS));
}

/*
 *  ======== Core_getIpuId ========
 */
UInt Core_getIpuId()
{
    return Core_ipuId;
}

/*
 *  ======== Core_InterruptCore ========
 */
Void Core_interruptCore(UInt coreId)
{
    if (coreId == 0) {
        REG16(INTERRUPT_CORE_0) |= 0x1;
        REG16(INTERRUPT_CORE_0) &= ~0x1;
    }
    else {
        REG16(INTERRUPT_CORE_1) |= 0x1;
        REG16(INTERRUPT_CORE_1) &= ~0x1;
    }
}

/*
 *  ======== Core_startCore1 ========
 *  Called by core0 just before main()
 *  It should be safe to start Core 1 then.
 */

extern Bool ti_sysbios_family_arm_ducati_Core_core1WaitFlag;

Void Core_startCore1()
{
    ti_sysbios_family_arm_ducati_Core_core1WaitFlag = 0;
}

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

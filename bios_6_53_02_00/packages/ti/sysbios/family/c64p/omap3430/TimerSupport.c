/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 *  ======== TimerSupport.c ========
 *  Only gptimer5-8 are support for omap2430/3430 DSP. gptimer5 is associated
 *  with timerid 0.
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>
#include <ti/sysbios/family/c64p/omap3430/Wugen.h>

#include "package/internal/TimerSupport.xdc.h"

#define TIMER5_EVENTNUM         51      /* interrupt event number for timer 5 */
#define TIMER5_SUSPEND_BIT      21      /* timer 5 suspend starting bit */

Int TimerSupport_Module_startup(Int status)
{
    if (Wugen_Module_startupDone()) {
        return (Startup_DONE);
    }
        
    return (Startup_NOTDONE);
}

/*
 *  ======== TimerSupport_enable ========
 *  This function power enables the Timer that is being used by the CLK module.
 *  The physical address of the CONTROL_MSUSPENDMUX_1 (part of the
 *  System Control Module) is set in the TimerSupport.xs file.
 */
Void TimerSupport_enable(UInt timerId, Error_Block *eb)
{
    volatile UInt32 *control = TimerSupport_controlMsuspendMux1Addr;

    if (timerId == 3) {
        control[1] |= (TimerSupport_module->suspSrc[timerId]);
    }
    else {
        control[0] |= (TimerSupport_module->suspSrc[timerId] <<
             (TIMER5_SUSPEND_BIT + (3 * timerId)));
    }

    Wugen_enableEvent(TIMER5_EVENTNUM + timerId);
}

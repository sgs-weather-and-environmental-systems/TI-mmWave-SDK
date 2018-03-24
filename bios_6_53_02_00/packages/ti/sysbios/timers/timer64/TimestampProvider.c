/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== TimestampProvider.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Assert.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/hal/Hwi.h>

#include <ti/sysbios/timers/timer64/Timer.h>

#include "package/internal/TimestampProvider.xdc.h"

#define MOD     TimestampProvider_module

/*
 *  ======== TimestampProvider_Module_startup ========
 */
Int TimestampProvider_Module_startup( Int phase )
{
    Clock_TimerProxy_Handle clockTimer;

    if (BIOS_clockEnabled && TimestampProvider_useClockTimer) {
        /* get Clock's timer handle */
        clockTimer = Clock_getTimerHandle();
        Assert_isTrue((clockTimer != NULL), NULL);
        MOD->timer = (Timer_Handle)clockTimer;
    }

    return Startup_DONE;
}

/*
 *  ======== TimestampProvider_startTimer ========
 */
Void TimestampProvider_startTimer()
{
    if (!TimestampProvider_useClockTimer) {
        Timer_start(MOD->timer);
    }
}

/*
 *  ======== TimestampProvider_rolloverFunc ========
 */
Void TimestampProvider_rolloverFunc(UArg unused)
{
    MOD->hi++;
}

/*
 *  ======== TimestampProvider_get64 ========
 *  For target performance, no attempt is made to guarantee hi/lo coherence.
 *  User of get64 is expected to handle this.
 */
Void TimestampProvider_get64(Types_Timestamp64 *result) 
{
    result->hi = MOD->hi;
    result->lo = TimestampProvider_get32();
}

/*
 *  ======== TimestampProvider_get32 ========
 */
Bits32 TimestampProvider_get32() 
{
    if (BIOS_clockEnabled && TimestampProvider_useClockTimer) {
        UInt key;
        UInt32 timestamp;

        key = Hwi_disable();

        timestamp = Clock_getTicks() * Timer_getPeriod(MOD->timer)
                   + Timer_getExpiredCounts(MOD->timer);

        Hwi_restore(key);

        return (timestamp);
    }
    else {
        return (Timer_getCount(MOD->timer));
    }
}

/*
 *  ======== TimestampProvider_getFreq ========
 */
Void TimestampProvider_getFreq(Types_FreqHz *freq) 
{
    Timer_getFreq(MOD->timer, freq);
}



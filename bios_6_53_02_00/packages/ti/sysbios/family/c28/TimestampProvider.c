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

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>

#include <ti/sysbios/knl/Clock.h>

#include <ti/sysbios/family/c28/Timer.h>
#include <ti/sysbios/family/c28/Hwi.h>

#include "package/internal/TimestampProvider.xdc.h"

/* A #define is used here because the long module name is cumbersome. */
#define MOD TimestampProvider_module

/*
 *  ======== TimestampProvider_Module_startup ========
 *  The Timestamp module is part of the xdc.runtime package, so all of its
 *  APIs must be ready after the first startup pass. Clock_getTimerHandle
 *  doesn't have any calling constraints.
 */
Int TimestampProvider_Module_startup(Int phase)
{
    Clock_TimerProxy_Handle clockTimer;

    if (BIOS_clockEnabled && TimestampProvider_useClockTimer) {
        /* get Clock's timer handle */
        clockTimer = Clock_getTimerHandle();
        Assert_isTrue((clockTimer != NULL), NULL);
        MOD->timer = (Timer_Handle)clockTimer;
    }

    return (Startup_DONE);
}

/*
 *  ======== TimestampProvider_startTimer ========
 *  This function is only called if we are using a dedicated timer for 
 *  timestamp. It is called so that the Timestamp count starts before main.
 *
 *  This function is called as part of Startup.lastFxns, which is after module
 *  startup so that the Timer has been initialized, but before main in order to
 *  start the Timestamp count as soon as possible.
 */
Void TimestampProvider_startTimer()
{
    Timer_start(MOD->timer);
}

/*
 *  ======== TimestampProvider_rolloverFunc ========
 *  The counter ISR for the timestamp if we're using a dedicated Timer. This
 *  ISR runs when the timer expires after 2^32 cycles. The value in MOD->hi is
 *  the upper 32 bits of the 64 bit timestamp.
 */
Void TimestampProvider_rolloverFunc(UArg unused)
{
    MOD->hi++;
}

/*
 *  ======== TimestampProvider_get64 ========
 *  This API has different implementations based on whether we're using a
 *  dedicated timer or sharing the Clock timer. 
 *  If we're sharing the Clock timer, we have to multiply the Clock tick count
 *  by the Clock tick period. If we have a dedicate timer, the timer period is
 *  2^32, so we can just use the MOD->hi tick count as the upper 32-bits of the
 *  timestamp.
 */
Void TimestampProvider_get64(Types_Timestamp64 *result) 
{
    UInt key;
    
    /*
     * If we're sharing the Clock timer, get the timestamp by using the Clock
     * tick count.
     */
    if (BIOS_clockEnabled && TimestampProvider_useClockTimer) {
        UInt64 timestamp;
        
        /* 
         * Disable interrupts so that the Clock tick count doesn't change if 
         * the timer expires while we are reading it.
         */
        key = Hwi_disable();

        /* 
         * timestamp = (clock ticks) x (tick period) + (current timer count)
         * The 'getExpiredCounts' API retrieves the current Timer count and
         * also accounts for timer rollover.
         */
        timestamp = (UInt64) Clock_getTicks() * Timer_getPeriod(MOD->timer)
                    + Timer_getExpiredCounts(MOD->timer);

        Hwi_restore(key);

        /* 
         * Copy the value into the result structure.
         *
         * The 28x is little endian, so it stores the 16-bit words
         * in reverse order. For example, the value
         * 0xFEDCBA9876543210
         * Is stored as:
         *   Address   Value
         *   0x0       0x3210
         *   0x1       0x7654
         *   0x2       0xBA98
         *   0x3       0xFEDC
         *
         * To retrieve the lower 32 bits, simply cast the value as a UInt32.
         * To retrieve the upper 32 bits, cast the address of 'timestamp' as a
         * pointer to a UInt32, increment the pointer by 1, then retrieve the
         * value at that address.
         */
        result->lo = (UInt32) timestamp;
        result->hi = *(((UInt32 *) &timestamp) + 1);
    }
    /* If we have a dedicated timer... */
    else {
        /* Disable interrupts while reading the tick count and timer value. */
        key = Hwi_disable();
        
        /* Use the tick counter as the upper 32-bits. */
        result->hi = MOD->hi;
        /* 
         * Get the timer value as the lower 32-bits. This API will also take
         * timer rollover into account and add 1 to result->hi if necessary.
         */
        Timer_getExpiredCounts64(MOD->timer, result);

        Hwi_restore(key);        
    }
}

/*
 *  ======== TimestampProvider_get32 ========
 *  The 32-bit timestamp can be retrieved more efficiently than the 64-bit one,
 *  so it has a different implementation.
 */
Bits32 TimestampProvider_get32() 
{
    /*
     * If we're sharing the Clock timer, get the timestamp by using the Clock
     * tick count.
     */
    if (BIOS_clockEnabled && TimestampProvider_useClockTimer) {
        UInt key;
        UInt32 timestamp;

        /* 
         * Disable interrupts so that the Clock tick count doesn't change if 
         * the timer expires while we are reading it.
         */
        key = Hwi_disable();

        /* 
         * timestamp = (clock ticks) x (tick period) + (current timer count)
         * The 'getExpiredCounts' API retrieves the current Timer count and
         * also accounts for timer rollover.
         */
        timestamp = Clock_getTicks() * Timer_getPeriod(MOD->timer)
                    + Timer_getExpiredCounts(MOD->timer);

        Hwi_restore(key);

        return (timestamp);
    }
    /* If we have a dedicated timer, just read the timer count. */
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



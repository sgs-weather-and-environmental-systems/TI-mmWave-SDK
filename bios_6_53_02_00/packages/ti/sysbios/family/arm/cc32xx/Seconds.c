/*
 * Copyright (c) 2014-2016, Texas Instruments Incorporated
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
 *  ======== Seconds.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Types.h>
#include <ti/sysbios/hal/Hwi.h>

#include "package/internal/Seconds.xdc.h"


/* Definitions from CC3200 SDK */
#define HWREG(x)                (*((volatile unsigned long *)(x)))

#define HIB3P3_BASE                        0x4402F800
#define HIB3P3_O_MEM_HIB_RTC_TIMER_ENABLE  0x00000004
#define HIB3P3_O_MEM_HIB_RTC_TIMER_RESET   0x00000008
#define HIB3P3_O_MEM_HIB_RTC_TIMER_READ    0x0000000C
#define HIB3P3_O_MEM_HIB_RTC_TIMER_LSW     0x00000010
#define HIB3P3_O_MEM_HIB_RTC_TIMER_MSW     0x00000014
#define HIB3P3_O_MEM_INT_OSC_CONF          0x0000002C

#define ARCM_BASE                          0x44025000
#define APPS_RCM_O_APPS_RCM_INTERRUPT_STATUS 0x00000120

/*
 *  Macros for accessing RTC registers in 40MHz domain.
 *
 *  The RTC registers in the 40 MHz domain are auto latched. Hence, there is
 *  no requirement to write to latch the RTC values. However, there is a
 *  caveat: If the value is read at the instant the 40 MHz clock and 32.768 KHz
 *  clock aligned, the value read could be erroneous.  As a workaround, the
 *  recommendation is to read the value thrice and identify the right value
 *  (as 2 out the 3 read values will always be correct and with a max. of
 *  1 LSB change).
 */
#define HIB1P2_BASE                        0x4402F000
#define HIB1P2_O_HIB_RTC_TIMER_LSW_1P2     0x000000CC
#define HIB1P2_O_HIB_RTC_TIMER_MSW_1P2     0x000000D0

#define MAX_ITER_TO_CONFIRM    3

/*
 *  Note: the RET_IF_WITHIN_TRESHOLD macro definded in Timer.c:
 *    RET_IF_WITHIN_TRESHOLD(a, b, th) {if (((a) - (b)) <= (th)) return (a);}
 *  is called with
 *      (count[1], count[0], 1),
 *      (count[2], count[1], 1),
 *      (count[2], count[0], 1).
 *
 *  The first argument is returned if argument 1 - argument 2
 *  is within the threshold.  Assuming that at least one of the
 *  three macro calls will return a good count, and the first
 *  fails, then either the second or the third call will return
 *  count[2].  So if the first call fails to return a count,
 *  we should just return count[2].
 *
 *  Here is a simplified version of the macro that does this.  Call
 *  with (count[0], count[1], count[2], threshold)
 */
#define COUNT_WITHIN_TRESHOLD(a, b, c, th) \
        ((((b) - (a)) <= (th)) ? (b) : (c))

#define PRCMSlowClkCtrGet_HIB1p2(count) \
        count = HWREG(HIB1P2_BASE + HIB1P2_O_HIB_RTC_TIMER_MSW_1P2); \
        count = count << 32;                                         \
        count |= HWREG(HIB1P2_BASE + HIB1P2_O_HIB_RTC_TIMER_LSW_1P2);


/*
 *  ======== Seconds_get ========
 */
UInt32 Seconds_get(Void)
{
    UInt32 curSeconds;
    UInt   key;

    key = Hwi_disable();

    /*
     *  The CC3200 timer has a frequency of 32768 (2 ** 15), so
     *  to get seconds, drop the lower 15 bits.
     */
    curSeconds = (UInt32)(Seconds_getCount() >> 15);

    curSeconds = curSeconds - Seconds_module->refSeconds +
        Seconds_module->setSeconds;

    /* Re-enable scheduling */
    Hwi_restore(key);

    return (curSeconds);
}

/*
 *  ======== Seconds_getTime ========
 */
UInt32 Seconds_getTime(Seconds_Time *ts)
{
    UInt64 curCount;
    UInt   key;

    key = Hwi_disable();

    curCount = Seconds_getCount();

    ts->secs = (UInt32)(curCount >> 15) - Seconds_module->refSeconds +
        Seconds_module->setSeconds;

    ts->nsecs = (UInt32)(1000000000 * (curCount & 0x7FFF) / 32768);

    /* Re-enable scheduling */
    Hwi_restore(key);

    return (0);
}

/*
 *  ======== Seconds_set ========
 */
Void Seconds_set(UInt32 seconds)
{
    UInt64        curCount;
    UInt          key;

    key = Hwi_disable();

    /*
     *  Start the RTC counter the first time Seconds_set() is called, if
     *  it is not already running.
     */
    if (Seconds_module->refSeconds == 0xffffffff) {
        /*
         *  Only start the RTC if it is not already running.
         */
        if (!(HWREG(HIB3P3_BASE + HIB3P3_O_MEM_HIB_RTC_TIMER_ENABLE) & 0x1)) {
            /* Enable the timer */
            HWREG(HIB3P3_BASE + HIB3P3_O_MEM_HIB_RTC_TIMER_ENABLE) = 0x1;
        }
    }

    curCount = Seconds_getCount();

    /*
     *  The CC3200 timer has a frequency of 32768 (2 ** 15), so
     *  to get seconds, drop the lower 15 bits.
     */
    Seconds_module->refSeconds = (UInt32)(curCount >> 15);
    Seconds_module->setSeconds = seconds;

    /* Re-enable scheduling */
    Hwi_restore(key);
}

/*
 *  ======== Seconds_getCount ========
 *  Called with Hwi disabled.
 */
UInt64 Seconds_getCount()
{
    UInt64 count[3];
    UInt64 curCount;
    Int    i;

    for (i = 0; i < 3; i++) {
        PRCMSlowClkCtrGet_HIB1p2(count[i]);
    }

    curCount = COUNT_WITHIN_TRESHOLD(count[0], count[1], count[2], 1);

    return (curCount);
}

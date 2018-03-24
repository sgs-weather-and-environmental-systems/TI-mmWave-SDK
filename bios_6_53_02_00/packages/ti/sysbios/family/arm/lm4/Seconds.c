/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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

/* Definitions from TivaWare SDK */
#define HWREG(x)                (*((volatile unsigned long *)(x)))

#define HIB_RTCC                0x400FC000  /* Hibernation RTC Counter */
#define HIB_RTCSS               0x400FC028  /* Hibernation RTC Sub Seconds */
#define HIB_CTL                 0x400FC010  /* Hibernation Control */
#define HIB_CTL_WRC             0x80000000  /* Write Complete/Capable */
#define HIB_CTL_CLK32EN         0x00000040  /* Clocking Enable */
#define HIB_CTL_RTCEN           0x00000001  /* RTC Timer Enable */

/*
 *  ======== _HibernateWriteComplete ========
 */
static void _HibernateWriteComplete(void)
{
    /* Spin until the write complete bit is set. */
    while(!(HWREG(HIB_CTL) & HIB_CTL_WRC)) {
    }
}

/*
 *  ======== Seconds_get ========
 */
UInt32 Seconds_get(Void)
{
    UInt32            curSeconds;
    UInt32 seconds = 0;

    curSeconds = HWREG(HIB_RTCC);

    seconds = curSeconds - Seconds_module->refSeconds +
        Seconds_module->setSeconds;

    return (seconds);
}

/*
 *  ======== Seconds_getTime ========
 */
UInt32 Seconds_getTime(Seconds_Time *ts)
{
    UInt32 seconds_1, seconds_2;
    UInt32 subSeconds;
    UInt32 nsecs;
    UInt   key;

    key = Hwi_disable();

    do {
        seconds_1 = HWREG(HIB_RTCC);
        subSeconds = HWREG(HIB_RTCSS) & 0x7fff;
        seconds_2 = HWREG(HIB_RTCC);
    } while (seconds_1 != seconds_2);

    Hwi_restore(key);

    nsecs = (1000000000 / 32768) * subSeconds;
    ts->secs = seconds_1 - Seconds_module->refSeconds +
            Seconds_module->setSeconds;
    ts->nsecs = nsecs;

    return (0);
}

/*
 *  ======== Seconds_set ========
 */
Void Seconds_set(UInt32 seconds)
{
    UInt32            curSeconds;

    /* Turn on the clock enable bit. */
    HWREG(HIB_CTL) |= HIB_CTL_CLK32EN;

    /* Wait for write complete following register load (above). */
    _HibernateWriteComplete();

    /* Enable the RTC. */
    HWREG(HIB_CTL) |= HIB_CTL_RTCEN;

    /* Spin until the write complete bit is set. */
    _HibernateWriteComplete();

    curSeconds = HWREG(HIB_RTCC);

    Seconds_module->refSeconds = curSeconds;
    Seconds_module->setSeconds = seconds;
}

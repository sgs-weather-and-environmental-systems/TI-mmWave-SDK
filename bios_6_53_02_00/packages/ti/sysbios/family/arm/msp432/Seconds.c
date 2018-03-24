/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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

#include <time.h>
#include <xdc/std.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Seconds.xdc.h"

#define Seconds_localtime ti_sysbios_family_arm_msp432_Seconds_localtime

#if defined(__ti__) || defined(__IAR_SYSTEMS_ICC__)
#define LOCALTIME(SECONDS, RESULT) Seconds_localtime(SECONDS, RESULT);
#endif

#if defined(__GNUC__) && !defined(__ti__)
#define LOCALTIME(SECONDS, RESULT) localtime_r(SECONDS, RESULT)
#endif

#define SECSPERMINUTE (UInt32)60
#define MINSPERHOUR   (UInt32)60
#define SECSPERHOUR   (SECSPERMINUTE * MINSPERHOUR)
#define HOURSPERDAY   (UInt32)24
#define SECSPERDAY    (SECSPERHOUR * HOURSPERDAY)
#define DAYSPERYEAR   (UInt32)365
#define SECSPERYEAR   (SECSPERDAY * DAYSPERYEAR)
#define MONTHSPERYEAR (UInt32)12

#define LEAPYEAR(y) ((y) % 4   == 0   \
             && ((y) % 100 != 0 || (y) % 400 == 0))

#define SECONDS1900 2208988800  /* Number of seconds from 1900 to 1970. */

/* Definitions from MSPWare SDK */
#define HWREG8_L(x)     (*((volatile UInt8 *)((UInt8 *)&x)))
#define HWREG8_H(x)     (*((volatile UInt8 *)(((UInt8 *)&x)+1)))
#define HWREG16(x)      (*((volatile UInt16 *)(x)))
#define HWREG32(x)      (*((volatile UInt32 *)(x)))

/* Clock System Registers */
#define CSKEY           (HWREG32(0x40010400)) /* Key Register */
#define CSCTL1          (HWREG32(0x40010408)) /* Control 1 Register */
#define CSSTAT          (HWREG32(0x40010434)) /* Status Register */
#define CSCLKEN         (HWREG32(0x40010430)) /* Clock Enable Register */
#define SELB            (0x00001000)          /* Selects the BCLK source */
#define REFO_EN         (0x00000200)          /* REFO Oscillator Enable */
#define BCLK_READY      (0x10000000)          /* BCLK Ready status */
#define CSKEYVAL        (0x0000695A)          /* Key to unlock Clock module */

/* RTC Registers */
#define RTCCTL0         (HWREG16(0x40004400)) /* RTCCTL0 Register */
#define RTCCTL13        (HWREG16(0x40004402)) /* RTCCTL13 Register */
#define RTCCTL1         (HWREG8_L(RTCCTL13))  /* RTCCTL13 Register */

#define RTCCTL0_H       (HWREG8_H(RTCCTL0))   /* RTCCTL0 Register */
#define RTCTIM0         (HWREG16(0x40004410)) /* RTCTIM0 Register  Hex */
#define RTCTIM1         (HWREG16(0x40004412)) /* RTC Hour, Day of Week */
#define RTCDATE         (HWREG16(0x40004414)) /* RTCDATE - Hex format */

#define RTCSEC          (HWREG8_L(RTCTIM0))   /* RTC Seconds */
#define RTCMIN          (HWREG8_H(RTCTIM0))   /* RTC Minutes */
#define RTCHOUR         (HWREG8_L(RTCTIM1))   /* RTC Hour */
#define RTCDAY          (HWREG8_L(RTCDATE))   /* RTC Day of Month */
#define RTCMON          (HWREG8_H(RTCDATE))   /* RTC Month */
#define RTCYEAR         (HWREG16(0x40004416)) /* RTCYEAR - Hex Format */

#define RTCHOLD         (0x0040)              /* RTC hold */
#define RTCKEY_H        (0x00A5)              /* RTC_C Key */
#define RTCRDY          (0x0010)              /* RTC ready */

/*
 *  ======== Seconds_Module_startup ========
 *  Initializes RTC Clock source
 */
Int Seconds_Module_startup(Int status)
{
    volatile UInt32 key;

    /* Save key state */
    key = CSKEY;

    /* Configure BCLK to run at 32.768 kHz REF0 */

    CSKEY = CSKEYVAL;
    CSCTL1 |= SELB;

    /* Spin until cloc is stable */
    while(!(CSSTAT & BCLK_READY)) {
    }

    CSCLKEN |= REFO_EN;
    CSKEY = key;

    return (Startup_DONE);
}

/*
 *  ======== Seconds_get ========
 *
 *  Note: This function is only valid until 2036-02-07 06:28:15 (TI Compiler)
 *      or 2038-01-19 03:14:07(GNU, IAR Compilers). At this time the number
 *      of seconds since 1900/1970 will cause integer overflow on 32-bit
 *      systems.
 */
UInt32 Seconds_get(Void)
{
    UInt key;
    UInt32 seconds;
    struct tm currTime;

    key = Hwi_disable();
    /* Make sure it's safe to read RTC values */
    while (!(RTCCTL1 & RTCRDY)) {
        Hwi_restore(key);
        key = Hwi_disable();
    }

    currTime.tm_sec = RTCSEC;
    currTime.tm_min = RTCMIN;
    currTime.tm_hour = RTCHOUR;
    currTime.tm_mday = RTCDAY;
    currTime.tm_mon = RTCMON;
    currTime.tm_year = RTCYEAR;

    /* Daylight savings time information is not available */
    currTime.tm_isdst = -1;

    Hwi_restore(key);

    /* Adjust RTC Calendar months which are based from 1-12 */
    currTime.tm_mon--;

    /* Adjust year to be 0 based off of 1900 */
    currTime.tm_year -= 1900;

    /* Convert time into seconds */
    seconds = mktime(&currTime);

#if defined (__ti__)
    /* Adjust seconds to be based on 1970 epoch */
    seconds -= SECONDS1900;
#endif

    return (seconds);
}

/*
 *  ======== Seconds_getTime ========
 */
UInt32 Seconds_getTime(Seconds_Time *ts)
{
    /* Clock granularity does not allow for nanosecs */
    ts->secs = Seconds_get();
    ts->nsecs = 0;

    return (0);
}

/*
 *  ======== Seconds_localtime ========
 *  Reentrant form of 'localtime' for TI compiler
 */
struct tm * Seconds_localtime(const UInt32 *time, struct tm *resultp)
{
    const UInt8 *daysPerMonth = Seconds_daysPerMonthNonLeap;

    /* Date variables */
    UInt32 day = 0; /* Day of the month */
    UInt32 mon = 0; /* Month of the year */
    UInt32 tmpDay = 0;
    UInt32 tmpHour = 0;
    UInt32 tmpMin = 0;
    UInt16 year = 1970;

    /* Begin at the end of 1970(12/31/1970 23:59:59) */
    UInt32 seconds = *time;
    UInt32 startDate = SECSPERYEAR - 1;
    UInt32 endDate = seconds;
    UInt32 acc = 0;
    UInt32 numLeapYears = 0;


    /* Calculate year and remove extra years/leap days */
    while (startDate < endDate) {
        year++;

        if (LEAPYEAR(year)) {
            startDate += (SECSPERDAY);
            numLeapYears++;
        }

        startDate += (SECSPERYEAR);
        seconds -= (SECSPERYEAR);
    }

    /* Add leap year back for current year */
    if (LEAPYEAR(year)) {
        /* Update Feburary */
        daysPerMonth = Seconds_daysPerMonthLeap;
        numLeapYears--;
    }
    /* Remove seconds due to leap days */
    seconds -= (numLeapYears * SECSPERDAY);

    tmpHour = (seconds % SECSPERDAY);

    /* Accumulator now holds remaining days in year */
    acc = (seconds / SECSPERDAY);

    /* Calculate months into year */
    while (tmpDay <= acc) {
        tmpDay += daysPerMonth[mon];
        mon++;
    }

    /* Adjust for addition of current month */
    if (mon != 0) {
        tmpDay -= daysPerMonth[mon - 1];
    }

    /* RTC Day is 0 based and month is 1 based, adjust */
    day++;
    mon--;

    /* Calculate days into month */
    if (acc > tmpDay) {
        day += (acc - tmpDay);
    }

    /* Hours */
    resultp->tm_hour = (tmpHour / SECSPERHOUR);

    /* Minutes */
    tmpMin = (tmpHour % SECSPERHOUR);
    resultp->tm_min = (tmpMin / SECSPERMINUTE);

    /* Seconds */
    resultp->tm_sec = (tmpMin % SECSPERMINUTE);

    resultp->tm_mday = day;
    resultp->tm_mon = mon;

    /* Return years since 1970 */
    resultp->tm_year = year - 1900;

    return (resultp);
}

/*
 *  ======== Seconds_set ========
 */
Void Seconds_set(UInt32 seconds)
{
    UInt hwiKey;
    struct tm *currTime;
    struct tm result;
    volatile UInt8 rtcKey;

    currTime = LOCALTIME((const time_t *)&seconds, &result);

    /* localtime returns years from 1970 */
    currTime->tm_year += 1900;
    /* Adjust months to be 1 based for RTC */
    currTime->tm_mon++;

    hwiKey = Hwi_disable();

    /* Save previous register state */
    rtcKey = RTCCTL0_H;

    /* Enable and unlock the RTC module */
    RTCCTL0_H = RTCKEY_H;
    RTCCTL1 = RTCHOLD;

    /* Set RTC Registers */
    RTCSEC = (UInt8)currTime->tm_sec;
    RTCMIN = (UInt8)currTime->tm_min;
    RTCHOUR = (UInt8)currTime->tm_hour;
    RTCDAY = (UInt8)currTime->tm_mday;
    RTCMON = (UInt8)currTime->tm_mon;
    RTCYEAR = (UInt16)currTime->tm_year;

    RTCCTL1 &= ~(RTCHOLD);  /* Start RTC calendar mode */

    RTCCTL0_H = rtcKey;  /* Lock the RTC registers */

    Hwi_restore(hwiKey);
}

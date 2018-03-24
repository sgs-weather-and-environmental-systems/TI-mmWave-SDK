/****************************************************************************/
/*  localtime v16.9.6                                                       */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#define _TIME_IMPLEMENTATION
#include <time.h>
#include <limits.h>
#include <stdint.h>
#include <_tls.h>

#define __TI_EPOCH_WDAY  1     /* Monday Jan 1, 1900 */
#define __TI_EPOCH_YEAR  1900
#define __TI_EPOCH_TZONE 21600 /* CST (seconds WEST of UTC) */

#define __POSIX_EPOCH_WDAY  4    /* Thursday Jan 1, 1970 */
#define __POSIX_EPOCH_YEAR  1970
#define __POSIX_EPOCH_TZONE 0    /* UTC */

#define SECS_IN_MIN 60L
#define MINS_IN_HR  60L
#define HRS_IN_DAY  24L
#define SECS_IN_HR  (SECS_IN_MIN * MINS_IN_HR)
#define SECS_IN_DAY (SECS_IN_HR * HRS_IN_DAY)
 
#define OVERFLOW(x,k) (((k) > 0) ? (x) > (INT_MAX - (k)) || (x) < INT_MIN: \
                                   (x) < (INT_MIN - (k)) || (x) > INT_MAX)

#define LEAPYEAR(y) ((y) % 4 == 0 && ((y) % 100 != 0 || (y) % 400 == 0))

#define DAYS_IN_YR(y) (365 + LEAPYEAR(y))
 
#ifdef _TIME64_IMPLEMENTATION
#define TIMET       __time64_t
#define MKTIME      __mktime64
#define LOCALTIME   __localtime64
#define EPOCH_WDAY  __POSIX_EPOCH_WDAY
#define EPOCH_YEAR  __POSIX_EPOCH_YEAR
#define EPOCH_TZONE __POSIX_EPOCH_TZONE
#else
#define TIMET       __time32_t
#define MKTIME      __mktime32
#define LOCALTIME   __localtime32
#define EPOCH_WDAY  __TI_EPOCH_WDAY
#define EPOCH_YEAR  __TI_EPOCH_YEAR
#define EPOCH_TZONE __TI_EPOCH_TZONE
#endif

/*--------------------------------------------------------------------------*/
/* To protect against multiple threads trying to access the 'local_tm'      */
/* static structure at the same time, we give each thread its own copy of   */
/* the 'local_tm' struct via TLS mechanisms.                                */
/*--------------------------------------------------------------------------*/
__TI_TLS_DATA_DEF(static, struct tm, local_tm, {0});

_CODE_ACCESS struct tm *LOCALTIME(const TIMET *timer)
{
    struct tm *local_tm_ptr = __TI_TLS_DATA_PTR(local_tm);
    TIMET ltime  = timer ? *timer : 0;

    local_tm_ptr->tm_sec  = (EPOCH_TZONE - _tz.timezone) % SECS_IN_MIN;
    local_tm_ptr->tm_min  = (EPOCH_TZONE - _tz.timezone) / SECS_IN_MIN;
    local_tm_ptr->tm_hour = 0;
    local_tm_ptr->tm_mday = 1;
    local_tm_ptr->tm_mon  = 0;
    local_tm_ptr->tm_year = EPOCH_YEAR - 1900;

    if (timer == 0 || ltime == (TIMET)-1) return local_tm_ptr;

    /*-------------------------------------------------------------------*/
    /* Conceptually, we add ltime to tm_sec and call mktime, but tm_sec  */
    /* may not be able to hold the value of ltime.  In this case, break  */
    /* the seconds down into minutes, etc. and add to those fields.      */
    /* For time64_t and 16-bit int, this happens for dates after Jan 1,  */
    /* 1970.  For time64_t and 32-bit int, this happens for dates after  */
    /* Jan 20, 2038.  For time32_t and 16-bit int, this happens for      */
    /* dates after Jan 1, 1900.  For time32_t and 32-bit int, this       */
    /* happens for dates after Jan 20, 1968.                             */
    /*-------------------------------------------------------------------*/
    //    if (OVERFLOW(ltime, local_tm_ptr->tm_sec))
    {
        local_tm_ptr->tm_sec  +=  ltime % SECS_IN_MIN;
        local_tm_ptr->tm_min  += (ltime / SECS_IN_MIN) % MINS_IN_HR;
        local_tm_ptr->tm_hour  = (ltime / SECS_IN_HR)  % HRS_IN_DAY;
 
        ltime /= SECS_IN_DAY;

        /*---------------------------------------------------------------*/
        /* TO DETERMINE THE YEAR, INSTEAD OF DIVIDING BY 365, DO A       */
        /* SUBTRACT LOOP THAT ACCOUNTS FOR LEAP YEARS.                   */
        /*---------------------------------------------------------------*/
        {
            int year = 0;
            while (ltime >= DAYS_IN_YR(year + EPOCH_YEAR))
            {
                ltime -= DAYS_IN_YR(year + EPOCH_YEAR);
                ++year;
            }

            while (ltime <= 0)
            {
                --year;
                ltime += DAYS_IN_YR(year + EPOCH_YEAR);
            }

            local_tm_ptr->tm_year += year;
            local_tm_ptr->tm_mday += ltime;
        }
    }
    // else local_tm_ptr->tm_sec += ltime;

    /*------------------------------------------------------------------*/
    /* MAKE VALUES IN local INTO A VALID TIME.                          */
    /*------------------------------------------------------------------*/
    MKTIME(local_tm_ptr);
    return local_tm_ptr;
}

#if defined(_TIME64_IMPLEMENTATION) && defined(_TARGET_DEFAULTS_TO_TIME64)
struct tm *localtime(const time_t *) __attribute__((__alias__("__localtime64")));
#elif !defined(_TIME64_IMPLEMENTATION) && !defined(_TARGET_DEFAULTS_TO_TIME64)
struct tm *localtime(const time_t *) __attribute__((__alias__("__localtime32")));
#endif

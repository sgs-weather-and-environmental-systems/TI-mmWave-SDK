/****************************************************************************/
/*  gmtime v16.9.6                                                          */
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
#include <stdint.h>

#ifdef _TIME64_IMPLEMENTATION
#define TIMET     __time64_t
#define GMTIME    __gmtime64
#define LOCALTIME __localtime64
#else
#define TIMET     __time32_t
#define GMTIME    __gmtime32
#define LOCALTIME __localtime32
#endif

_CODE_ACCESS struct tm *GMTIME(const TIMET *timer)
{
    /*-----------------------------------------------------------------------*/
    /* If we overflow time_t by adding the timezone, return NULL             */
    /*-----------------------------------------------------------------------*/
#if defined(_TIME64_IMPLEMENTATION)
    if (_tz.timezone > 0)
    {
        if (*timer > INT64_MAX - _tz.timezone) return NULL;
    }
    else
    {
        if (*timer < INT64_MIN - _tz.timezone) return NULL;
    }
#else
    if (_tz.timezone > 0)
    {
        if (*timer > UINT32_MAX - _tz.timezone) return NULL;
    }
    else
    {
        if (*timer <          0 - _tz.timezone) return NULL;
    }
#endif

    TIMET gtime = _tz.timezone; /* _tz.timezone is seconds WEST of UTC */

    if (timer) gtime += *timer;
    return LOCALTIME(&gtime);
}

#if defined(_TIME64_IMPLEMENTATION) && defined(_TARGET_DEFAULTS_TO_TIME64)
struct tm *gmtime(const time_t *) __attribute__((__alias__("__gmtime64")));
#elif !defined(_TIME64_IMPLEMENTATION) && !defined(_TARGET_DEFAULTS_TO_TIME64)
struct tm *gmtime(const time_t *) __attribute__((__alias__("__gmtime32")));
#endif

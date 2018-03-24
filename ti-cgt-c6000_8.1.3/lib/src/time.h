/*****************************************************************************/
/* time.h     v8.1.3                                                         */
/*                                                                           */
/* Copyright (c) 1990-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/

#ifndef _TIME
#define _TIME

#include <linkage.h>



  #define CLOCKS_PER_SEC 200000000 /* 200 MHz */

#ifndef NULL
#define NULL      0
#endif

#ifdef __cplusplus
extern "C" namespace std {
#endif

typedef unsigned int clock_t;
typedef unsigned int __time32_t;

typedef long long __time64_t;


#if defined(_TARGET_DEFAULTS_TO_TIME64) || \
    (defined(__TI_TIME_USES_64) && __TI_TIME_USES_64)
typedef __time64_t time_t;
#else
typedef __time32_t time_t;
#endif

#ifndef _SIZE_T
#define _SIZE_T
typedef __SIZE_T_TYPE__ size_t;
#endif

struct tm 
{
    int tm_sec;      /* seconds after the minute   - [0,59]  */
    int tm_min;      /* minutes after the hour     - [0,59]  */
    int tm_hour;     /* hours after the midnight   - [0,23]  */
    int tm_mday;     /* day of the month           - [1,31]  */
    int tm_mon;      /* months since January       - [0,11]  */
    int tm_year;     /* years since 1900                     */
    int tm_wday;     /* days since Sunday          - [0,6]   */
    int tm_yday;     /* days since Jan 1st         - [0,365] */
    int tm_isdst;    /* Daylight Savings Time flag           */

};

/*************************************************************************/
/* TIME ZONE STRUCTURE DEFINITION                                        */
/*************************************************************************/
typedef struct 
{
    short daylight;
    long  timezone;
    char  tzname[4];
    char  dstname[4];
} TZ;

extern _DATA_ACCESS TZ _tz;

/****************************************************************************/
/* FUNCTION DECLARATIONS.  (NOTE : clock AND time ARE SYSTEM SPECIFIC)      */
/****************************************************************************/
_CODE_ACCESS clock_t    clock(void);             

_CODE_ACCESS __time32_t __time32(__time32_t *_timer);   
_CODE_ACCESS __time32_t __mktime32(struct tm *_tptr);
_CODE_ACCESS double     __difftime32(__time32_t _time1, __time32_t _time0);
      _IDECL char      *__ctime32(const __time32_t *_timer);
_CODE_ACCESS struct tm *__gmtime32(const __time32_t *_timer);
_CODE_ACCESS struct tm *__localtime32(const __time32_t *_timer);

_CODE_ACCESS __time64_t __time64(__time64_t *_timer);   
_CODE_ACCESS __time64_t __mktime64(struct tm *_tptr);
_CODE_ACCESS double     __difftime64(__time64_t _time1, __time64_t _time0);
      _IDECL char      *__ctime64(const __time64_t *_timer);
_CODE_ACCESS struct tm *__gmtime64(const __time64_t *_timer);
_CODE_ACCESS struct tm *__localtime64(const __time64_t *_timer);

_CODE_ACCESS char      *asctime(const struct tm *_timeptr);
_CODE_ACCESS size_t     strftime(char *_out, size_t _maxsize, 
				 const char *_format,
				 const struct tm *_timeptr);

#if defined(_INLINE) || defined(_CTIME32_IMPLEMENTATION)
_IDEFN char *__ctime32(const __time32_t *timer)
{
   return asctime(__localtime32(timer));
}
#endif /* _INLINE || _CTIME32_IMPLEMENTATION */

#if defined(_INLINE) || defined(_CTIME64_IMPLEMENTATION)
_IDEFN char *__ctime64(const __time64_t *timer)
{
   return asctime(__localtime64(timer));
}
#endif /* _INLINE || _CTIME64_IMPLEMENTATION */

/*-----------------------------------------------------------------------*/
/* The user may define __TI_TIME_USES_64=1 to redirects all time        */
/* functions to time64 functions.                                        */
/*-----------------------------------------------------------------------*/
#if defined(_TIME_IMPLEMENTATION) && defined(__TI_TIME_USES_64) && __TI_TIME_USES_64
#error "Do not build the RTS with __TI_TIME_USES_64 set"
#elif defined(__TI_TIME_USES_64) && __TI_TIME_USES_64
static __inline time_t     time(time_t *timer) { return __time64(timer); }
static __inline time_t     mktime(struct tm *tptr) { return __mktime64(tptr); }
static __inline double     difftime(time_t time1, time_t time0) { return __difftime64(time1, time0); }
static __inline char      *ctime(const time_t *timer) { return __ctime64(timer); }
static __inline struct tm *gmtime(const time_t *timer) { return __gmtime64(timer); }
static __inline struct tm *localtime(const time_t *timer) { return __localtime64(timer); }
#else
_CODE_ACCESS time_t     time(time_t *_timer);   
_CODE_ACCESS time_t     mktime(struct tm *_tptr);
_CODE_ACCESS double     difftime(time_t _time1, time_t _time0);
      _IDECL char      *ctime(const time_t *_timer);
_CODE_ACCESS struct tm *gmtime(const time_t *_timer);
_CODE_ACCESS struct tm *localtime(const time_t *_timer);
  #if defined(_INLINE) && !defined(_TIME_IMPLEMENTATION)
  _IDEFN char *ctime(const time_t *timer)
  {
     return asctime(localtime(timer));
  }
  #endif /* _INLINE */
#endif

#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

#endif /* _TIME */

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::size_t;
using std::clock_t;
using std::clock;

using std::tm;
using std::TZ;
using std::_tz;
using std::__time32_t;
using std::__time64_t;
using std::__time32;
using std::__time64;
using std::__ctime32;
using std::__ctime64;
using std::__difftime32;
using std::__difftime64;
using std::__gmtime32;
using std::__gmtime64;
using std::__localtime32;
using std::__localtime64;
using std::__mktime32;
using std::__mktime64;
using std::time_t;
using std::time;
using std::ctime;
using std::difftime;
using std::gmtime;
using std::localtime;
using std::mktime;

using std::asctime;
using std::strftime;
#endif /* ! _CPP_STYLE_HEADER */

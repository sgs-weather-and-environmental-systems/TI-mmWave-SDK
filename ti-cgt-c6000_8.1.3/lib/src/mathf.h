/****************************************************************************/
/*  mathf.h          v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
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

#ifndef __mathf__
#define __mathf__

#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

#ifndef EDOM
   #define EDOM   1
#endif

#ifndef ERANGE
   #define ERANGE 2
#endif

#ifdef __cplusplus
//----------------------------------------------------------------------------
// <cmathf> IS RECOMMENDED OVER <mathf.h>.  <mathf.h> IS PROVIDED FOR 
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std {
#endif /* !__cplusplus */

#include <linkage.h>

_CODE_ACCESS float sqrtf (float x);
_CODE_ACCESS float expf  (float x);
_CODE_ACCESS float logf  (float x);
_CODE_ACCESS float log10f(float x);
_CODE_ACCESS float powf  (float x, float y);
_CODE_ACCESS float sinf  (float x);
_CODE_ACCESS float cosf  (float x);
_CODE_ACCESS float tanf  (float x);
_CODE_ACCESS float asinf (float x);
_CODE_ACCESS float acosf (float x);
_CODE_ACCESS float atanf (float x);
_CODE_ACCESS float atan2f(float y, float x);
_CODE_ACCESS float sinhf (float x);
_CODE_ACCESS float coshf (float x);
_CODE_ACCESS float tanhf (float x);

_IDECL float ceilf (float x);
_IDECL float floorf(float x);

#pragma diag_push
#pragma CHECK_MISRA("-16.4") /* false positives due to builtin declarations */
_CODE_ACCESS float fabsf (float x);
#pragma diag_pop

_CODE_ACCESS float ldexpf(float x, int n);
_CODE_ACCESS float frexpf(float x, int *_exp);
_CODE_ACCESS float modff (float x, float *ip);
_CODE_ACCESS float fmodf (float x, float y);

/* these present in many linked images, so we'll tell you about them. */
_CODE_ACCESS float _roundf(float x); /* round-to-nearest */
_CODE_ACCESS float _truncf(float x); /* truncate towards 0 */

/* ------------------------------------------------- */
/* Routines below are an addition to ANSI math.h     */
/* Some (noted with "9x" in comment) will become ANSI*/
/* once C9x is approved.                             */
/* ------------------------------------------------- */

#define HUGE_VALF (__INFINITY__)

_CODE_ACCESS float rsqrtf(float x); /*   == 1/sqrtf(x) but *MUCH* faster         */
_CODE_ACCESS float exp2f (float x); /*9x mathematically equiv to powf(2.0 ,x)    */
_CODE_ACCESS float exp10f(float x); /*   mathematically equiv to powf(10.0,x)    */
_CODE_ACCESS float log2f (float x); /*9x mathematically equiv to logf(x)/logf(2.)*/

_CODE_ACCESS float powif (float x, int i); /* equiv to powf(x,(float)i) */

_CODE_ACCESS float cotf  (float x);
_CODE_ACCESS float acotf (float x);
_CODE_ACCESS float acot2f(float x, float y);

_CODE_ACCESS float cothf (float x);

_CODE_ACCESS float asinhf(float x); /* 9x */
_CODE_ACCESS float acoshf(float x); /* 9x */
_CODE_ACCESS float atanhf(float x); /* 9x */
_CODE_ACCESS float acothf(float x);

_CODE_ACCESS float log1pf(float x);
_CODE_ACCESS float hypotf(float x, float y);
_CODE_ACCESS float copysignf(float x, float y);

#ifndef __INLINE_ISINF__
#define __INLINE_ISINF__ 0
#endif

#if __INLINE_ISINF__
_IDECL int __isinff(float x);
#else
_CODE_ACCESS int __isinff(float x);
#endif

_IDECL int __isnanf(float x);
_IDECL int __isfinitef(float x);
_IDECL int __isnormalf(float x);
_CODE_ACCESS int __fpclassifyf(float x);

#define isinf(x) (sizeof(x) == sizeof(double) ? __isinf(x) : \
                  sizeof(x) == sizeof(float) ? __isinff(x) : __isinfl(x))

#define isnan(x) (sizeof(x) == sizeof(double) ? __isnan(x) : \
                  sizeof(x) == sizeof(float) ? __isnanf(x) : __isnanl(x))

#define isfinite(x) (sizeof(x) == sizeof(double) ? __isfinite(x) : \
                     sizeof(x) == sizeof(float) ? __isfinitef(x) : \
                     __isfinitel(x))

#define isnormal(x) (sizeof(x) == sizeof(double) ? __isnormal(x) : \
                     sizeof(x) == sizeof(float) ? __isnormalf(x) : \
                     __isnormall(x))

#define fpclassify(x) (sizeof(x) == sizeof(double) ? __fpclassify(x) : \
                       sizeof(x) == sizeof(float) ? __fpclassifyf(x) : \
                       __fpclassifyl(x))


#pragma diag_push

/* keep macros as direct #defines and not function-like macros or function
   names surrounded by parentheses to support all original supported use cases
   including taking their address through the macros and prefixing with
   namespace macros */
#pragma CHECK_MISRA("-19.4")

#define roundf _roundf /* 9x round-to-nearest   */
#define truncf _truncf /* 9x truncate towards 0 */

#pragma diag_pop


#ifdef _INLINE

#pragma diag_push /* functions */

/* MISRA exceptions to avoid changing inline versions of the functions that
   would be linked in instead of included inline at different mf levels */
/* these functions are very well-tested, stable, and efficient; it would
   introduce a high risk to implement new, separate MISRA versions just for the
   inline headers */

#pragma CHECK_MISRA("-5.7") /* keep names intact */
#pragma CHECK_MISRA("-8.5") /* need to define inline functions */
#pragma CHECK_MISRA("-9.1") /* false positives on use after indirect assign */
#pragma CHECK_MISRA("-10.1") /* use implicit casts */
#pragma CHECK_MISRA("-10.2") /* use implicit casts */
#pragma CHECK_MISRA("-12.1") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.2") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.4") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.5") /* avoid changing expressions */
#pragma CHECK_MISRA("-13.3") /* need FP compares */
#pragma CHECK_MISRA("-14.7") /* use multiple return points */
#pragma CHECK_MISRA("-14.9") /* use non-compound statements */

#pragma diag_suppress 551 /* false positives on use after indirect assign */

/****************************************************************************/
/*  Inline versions of floorf, ceilf, fmodf                                 */
/****************************************************************************/
static __inline float floorf(float x) 
{
   float y; 
   return (modff(x, &y) < 0 ? y - 1 : y);
}

static __inline float ceilf(float x)
{
   float y; 
   return (modff(x, &y) > 0 ? y + 1 : y);
}

#if __INLINE_ISINF__
#ifndef REAL_TO_REALNUM
#error isinf can only be inlined in the compilation of the rts
#endif

static __inline int __isinff(float x)
{
  realnum _x;
  REAL_TO_REALNUM(x, _x);
  return _x.exp == (REAL_EMAX + 1) && (_x.mantissa << 1) == 0;
}

#endif /* __INLINE_ISINF__ */

static __inline int __isnanf(volatile float x)
{
  return x != x;
}

static __inline int __isfinitef(float x)
{
  return (!__isinff(x) && !__isnanf(x));
}

static __inline int __isnormalf(float x)
{
  return (__isfinitef(x) && x != 0.0);
}

#pragma diag_pop

#endif /* _INLINE */

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* __mathf__ */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::sqrtf;
using std::expf;
using std::logf;
using std::log10f;
using std::powf;
using std::sinf;
using std::cosf;
using std::tanf;
using std::asinf;
using std::acosf;
using std::atanf;
using std::atan2f;
using std::sinhf;
using std::coshf;
using std::tanhf;

using std::ceilf;
using std::floorf;

using std::fabsf;

using std::ldexpf;
using std::frexpf;
using std::modff;
using std::fmodf;

using std::log1pf;
using std::copysignf;
using std::hypotf;

using std::rsqrtf; /*   == 1/sqrtf(x) but *MUCH* faster         */
using std::exp2f;  /*9x mathematically equiv to powf(2.0 ,x)    */
using std::exp10f; /*   mathematically equiv to powf(10.0,x)    */
using std::log2f;  /*9x mathematically equiv to logf(x)/logf(2.)*/

using std::powif;  /* equiv to powf(x,(float)i) */

using std::cotf; 
using std::acotf;
using std::acot2f;

using std::cothf;

using std::asinhf; /* 9x */
using std::acoshf; /* 9x */
using std::atanhf; /* 9x */
using std::acothf;

#endif /* ! _CPP_STYLE_HEADER */

#if defined(__cplusplus)
using std::__isnanf;
using std::__isinff;
using std::__isfinitef;
using std::__isnormalf;
using std::__fpclassifyf;
using std::_roundf; /* round-to-nearest */
using std::_truncf; /* truncate towards 0 */
#endif /* __cplusplus */

#pragma diag_pop

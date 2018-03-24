/****************************************************************************/
/*  mathl.h          v8.1.3                                                 */
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

#ifndef __mathl__
#define __mathl__

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

#include <linkage.h>

#ifdef __cplusplus
//----------------------------------------------------------------------------
// <cmathl> IS RECOMMENDED OVER <mathl.h>.  <mathl.h> IS PROVIDED FOR 
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std {
#endif /* !__cplusplus */

_CODE_ACCESS long double sqrtl (long double x);
_CODE_ACCESS long double expl  (long double x);
_CODE_ACCESS long double logl  (long double x);
_CODE_ACCESS long double log10l(long double x);
_CODE_ACCESS long double powl  (long double x, long double y);
_CODE_ACCESS long double sinl  (long double x);
_CODE_ACCESS long double cosl  (long double x);
_CODE_ACCESS long double tanl  (long double x);
_CODE_ACCESS long double asinl (long double x);
_CODE_ACCESS long double acosl (long double x);
_CODE_ACCESS long double atanl (long double x);
_CODE_ACCESS long double atan2l(long double y, long double x);
_CODE_ACCESS long double sinhl (long double x);
_CODE_ACCESS long double coshl (long double x);
_CODE_ACCESS long double tanhl (long double x);

_IDECL long double ceill (long double x);
_IDECL long double floorl(long double x);

_CODE_ACCESS long double fabsl (long double x);

_CODE_ACCESS long double ldexpl(long double x, int n);
_CODE_ACCESS long double frexpl(long double x, int *_exp);
_CODE_ACCESS long double modfl (long double x, long double *ip);
_CODE_ACCESS long double fmodl (long double x, long double y);

_CODE_ACCESS long double _roundl(long double x); /* round-to-nearest */
_CODE_ACCESS long double _truncl(long double x); /* truncate towards 0 */

/* ------------------------------------------------- */
/* Routines below are an addition to ANSI math.h     */
/* Some (noted with "9x" in comment) will become ANSI*/
/* once C9x is approved.                             */
/* ------------------------------------------------- */

#define HUGE_VALL ((long double)__INFINITY__)

_CODE_ACCESS long double rsqrtl(long double x); /*   1/sqrtl(x) but *MUCH* faster*/
_CODE_ACCESS long double exp2l (long double x); /*9x math equiv to powl(2.0 ,x)  */
_CODE_ACCESS long double exp10l(long double x); /*   math equiv to powl(10.0,x)  */
_CODE_ACCESS long double log2l (long double x);/*9x math equiv to logl(x)/logl(2)*/

_CODE_ACCESS long double powil (long double x, int i); /* == powl(x,(long double)i)*/

_CODE_ACCESS long double cotl  (long double x);
_CODE_ACCESS long double acotl (long double x);
_CODE_ACCESS long double acot2l(long double x, long double y);

_CODE_ACCESS long double cothl (long double x);

_CODE_ACCESS long double asinhl(long double x); /* 9x */
_CODE_ACCESS long double acoshl(long double x); /* 9x */
_CODE_ACCESS long double atanhl(long double x); /* 9x */
_CODE_ACCESS long double acothl(long double x);

_CODE_ACCESS long double log1pl(long double x);
_CODE_ACCESS long double copysignl(long double x, long double y);
_CODE_ACCESS long double hypotl(long double x, long double y);

#ifndef __INLINE_ISINF__
#define __INLINE_ISINF__ 0
#endif

#if __INLINE_ISINF__
_IDECL int __isinfl(long double x);
#else
_CODE_ACCESS int __isinfl(long double x);
#endif

_IDECL int __isnanl(long double x);
_IDECL int __isfinitel(long double x);
_IDECL int __isnormall(long double x);
_CODE_ACCESS int __fpclassifyl(long double x);

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

#pragma CHECK_MISRA("-19.4") /* macro expands to unparanthesized */
#define roundl _roundl /* 9x round-to-nearest   */
#define truncl _truncl /* 9x truncate towards 0 */


#ifdef _INLINE
#pragma CHECK_MISRA("-5.7") /* identifier name reused */
#pragma CHECK_MISRA("-8.5") /* definition of function in header file */
#pragma CHECK_MISRA("-10.1") /* SDSCM00051481 */
#pragma CHECK_MISRA("-10.2") /* SDSCM00051481 */
#pragma CHECK_MISRA("-12.2") /* doesn't actually have side effects */
#pragma CHECK_MISRA("-12.4") /* doesn't actually have side effects */
#pragma CHECK_MISRA("-12.5") /* operands of && not primary expressions */
#pragma CHECK_MISRA("-13.3") /* float exact equality comparison */
#pragma CHECK_MISRA("-14.7") /* no single point of return */
#pragma CHECK_MISRA("-14.9") /* if not followed by compound statement */
/****************************************************************************/
/*  Inline versions of floorl, ceill, fmodl                                 */
/****************************************************************************/
static __inline long double floorl(long double x) 
{
   long double y = 0; 
   return (modfl(x, &y) < 0 ? y - 1 : y);
}

static __inline long double ceill(long double x)
{
   long double y = 0; 
   return (modfl(x, &y) > 0 ? y + 1 : y);
}

#if __INLINE_ISINF__
#ifndef REAL_TO_REALNUM
#error isinf can only be inlined in the compilation of the rts
#endif

static __inline int __isinfl(long double x)
{
  realnum _x;
  REAL_TO_REALNUM(x, _x);
  return _x.exp == (REAL_EMAX + 1) && (_x.mantissa << 1) == 0;
}

#endif /* __INLINE_ISINF__ */

static __inline int __isnanl(volatile long double x)
{
  return x != x;
}

static __inline int __isfinitel(long double x)
{
  return (!__isinfl(x) && !__isnanl(x));
}

static __inline int __isnormall(long double x)
{
  return (__isfinitel(x) && (x != 0.0));
}

#endif /* defined(_INLINE) */

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* __mathl__ */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::sqrtl;
using std::expl ;
using std::logl ;
using std::log10l;
using std::powl;
using std::sinl;
using std::cosl;
using std::tanl;
using std::asinl;
using std::acosl;
using std::atanl;
using std::atan2l;
using std::sinhl;
using std::coshl;
using std::tanhl;

using std::ceill;
using std::floorl;

using std::fabsl;

using std::ldexpl;
using std::frexpl;
using std::modfl;
using std::fmodl;

using std::log1pl;
using std::copysignl;
using std::hypotl;

using std::rsqrtl; /*   1/sqrtl(x) but *MUCH* faster*/
using std::exp2l;  /*9x math equiv to powl(2.0 ,x)  */
using std::exp10l; /*   math equiv to powl(10.0,x)  */
using std::log2l;  /*9x math equiv to logl(x)/logl(2)*/

using std::powil; /* == powl(x,(long double)i)*/

using std::cotl;
using std::acotl;
using std::acot2l;

using std::cothl;

using std::asinhl; /* 9x */
using std::acoshl; /* 9x */
using std::atanhl; /* 9x */
using std::acothl;

#endif /* ! _CPP_STYLE_HEADER */

#if defined(__cplusplus)
using std::__isnanl;
using std::__isinfl;
using std::__isfinitel;
using std::__isnormall;
using std::__fpclassifyl;
using std::_roundl; /* round-to-nearest */
using std::_truncl; /* truncate towards 0 */
#endif /* __cplusplus */

#pragma diag_pop

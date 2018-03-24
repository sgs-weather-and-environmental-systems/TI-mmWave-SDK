/*****************************************************************************/
/* ti_fmax.c   v16.9.6                                                       */
/*                                                                           */
/* Copyright (c) 2015-2017 Texas Instruments Incorporated                    */
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

#include <math.h>
#include <float.h>
#include <math_private.h>

#if FLT_MANT_DIG != DBL_MANT_DIG
float fmaxf(float x, float y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return +0, so check the
        sign bit */

    if (__FLOAT_SIGN_BIT_ZERO(x) != __FLOAT_SIGN_BIT_ZERO(y))
        if (__FLOAT_SIGN_BIT_ZERO(x)) return x;
        else                          return y;

    return (x > y ? x : y);
}
#else
float fmaxf(float x, float y) __attribute__((__alias__("fmax")));
#endif

double fmax(double x, double y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return +0, so check the
        sign bit */

    if (__DOUBLE_SIGN_BIT_ZERO(x) != __DOUBLE_SIGN_BIT_ZERO(y))
        if (__DOUBLE_SIGN_BIT_ZERO(x)) return x;
        else                           return y;

    return (x > y ? x : y);
}

#if LDBL_MANT_DIG != DBL_MANT_DIG
long double fmaxl(long double x, long double y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return +0, so check the
        sign bit */

    if (__LDOUBLE_SIGN_BIT_ZERO(x) != __LDOUBLE_SIGN_BIT_ZERO(y))
        if (__LDOUBLE_SIGN_BIT_ZERO(x)) return x;
        else                            return y;

    return (x > y ? x : y);
}
#else
long double fmaxl(long double x, long double y) __attribute__((__alias__("fmax")));
#endif

#if FLT_MANT_DIG != DBL_MANT_DIG
float fminf(float x, float y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return -0, so check the
        sign bit */

    if (__FLOAT_SIGN_BIT_ZERO(x) != __FLOAT_SIGN_BIT_ZERO(y))
        if (__FLOAT_SIGN_BIT_ZERO(x)) return y;
        else                          return x;

    return (x < y ? x : y);
}
#else
float fminf(float x, float y) __attribute__((__alias__("fmin")));
#endif

double fmin(double x, double y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return -0, so check the
        sign bit */

    if (__DOUBLE_SIGN_BIT_ZERO(x) != __DOUBLE_SIGN_BIT_ZERO(y))
        if (__DOUBLE_SIGN_BIT_ZERO(x)) return y;
        else                           return x;

    return (x < y ? x : y);
}

#if LDBL_MANT_DIG != DBL_MANT_DIG
long double fminl(long double x, long double y)
{
    if (isnan(x)) return y;
    if (isnan(y)) return x;

    /* -0 and +0 compare equal, but we must return -0, so check the
        sign bit */

    if (__LDOUBLE_SIGN_BIT_ZERO(x) != __LDOUBLE_SIGN_BIT_ZERO(y))
        if (__LDOUBLE_SIGN_BIT_ZERO(x)) return y;
        else                            return x;

    return (x < y ? x : y);
}
#else
long double fminl(long double x, long double y) __attribute__((__alias__("fmin")));
#endif


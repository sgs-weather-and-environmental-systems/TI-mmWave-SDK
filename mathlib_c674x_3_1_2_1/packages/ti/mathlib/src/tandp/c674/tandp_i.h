/* ======================================================================== *
 * MATHLIB -- TI Floating-Point Math Function Library                       *
 *                                                                          *
 *                                                                          *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
 *                                                                          *
 *                                                                          *
 *  Redistribution and use in source and binary forms, with or without      *
 *  modification, are permitted provided that the following conditions      *
 *  are met:                                                                *
 *                                                                          *
 *    Redistributions of source code must retain the above copyright        *
 *    notice, this list of conditions and the following disclaimer.         *
 *                                                                          *
 *    Redistributions in binary form must reproduce the above copyright     *
 *    notice, this list of conditions and the following disclaimer in the   *
 *    documentation and/or other materials provided with the                *
 *    distribution.                                                         *
 *                                                                          *
 *    Neither the name of Texas Instruments Incorporated nor the names of   *
 *    its contributors may be used to endorse or promote products derived   *
 *    from this software without specific prior written permission.         *
 *                                                                          *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
 * ======================================================================== */

/* ======================================================================= */
/* tandp_i.h - double precision floating point tangent                     */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef TANDP_I_
#define TANDP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(recipdp_tandp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the reciprocal of the real floating-point value   */
/* a. The return value is precisely 1/a.                                   */
/* ======================================================================= */

static inline double recipdp_tandp_i (double a)
{
  double  two =  2.0;
  double  x1, x2, y;

  x1 = _rcpdp(a);
  x1 = x1 * (two - a*x1);
  x2 = x1 * (two - a*x1);
  y = x2 * (two - a*x2);

  if (_fabs(a) > FLT_MAX) {
    y = 0.0;
  }

  return (y);

} /* End of recipdp_tandp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_tandp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the arc_sine funtion.                 */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13 +    */
/*          c14 x^15 + c16 x^17 + c18 x^19 + c20 x^21,                      */
/* where x is the input, c2 through c20 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [0, pi/4].                    */
/* ======================================================================== */

static inline double pol_est_tandp_i (double x)
{
  /* coefficients for the polynomial for tan(x)*/
  const double c20  =  0.000165915379569295;
  const double c18  =  0.000216435569955730;
  const double c16  =  0.000590027440945586;
  const double c14  =  0.00145583438705132;
  const double c12  =  0.00359212803657248;
  const double c10  =  0.00886323552990220;
  const double c8   =  0.0218694885361552;
  const double c6   =  0.0539682539682540;
  const double c4   =  0.133333333333333;
  const double c2   =  0.333333333333333;

  double x2, x4, x6, x8, pol;
  double tmp1, tmp2;

  /* calculate the powers of x */
  x2  = x * x;
  x4  = x2 * x2;
  x6  = x2 * x4;
  x8  = x4 * x4;

  /* ====================================================================== */
  /* The polynomial calculation is done in two seperate parts.              */
  /*   tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                            */
  /*   tmp2 =  c10 x^10 + c12 x^12 + c14 x^14 + c16 x^16 +c18 x^18 + c20x^20*/
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /* ====================================================================== */

  tmp1 = ((c8 * x8) + (c6 * x6))+ ((c4 * x4) + (c2 * x2));
  tmp2 = x8 * (((x2 * c10) + (x4 * c12)) + ((x6 * c14) + (x8 * c16)) + x8 * ((x2 * c18) + (x4 * c20)));

  pol = (tmp1 + tmp2) * x + x;

  return pol;
} /* End of pol_est_tandp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tandp_i, ".text:optci");
#endif

/* ====================================================================== */
/* To calculate tan(x), x must be mapped to the range [0,pi/2]            */
/* y = x within range. Then the calculation for tan(y) depends on the     */
/* value of y:                                                            */
/*                                                                        */
/* for y_abs <= pi/4, res = pol_est_tandp_i (input y)                     */
/* for y_abs > pi/4,  res = 1 / pol_est_tandp_i (input a)                 */
/*                         a = pi/2 - y                                   */
/* where y_abs is the absolute value of the y, a is calculated as         */
/* shown above and it's used as an input for the polynomial, and res is   */
/* the value for tan(x).                                                  */
/* ====================================================================== */

static inline double tandp_i (double x)
{
  const double pi4   =  0.785398163397448309;           /* pi/4 */
  const double pi2_h =  1.5707963267948;
  const double pi2_l =  9.66192313216916398e-14;        /* pi2_h + pi2_l = pi/2 */
  const double pi    =  3.141592653589793238;
  const double C1    =  3.1415926535897;
  const double C2    =  9.32587340685131e-014;          /* C1 + C2 = pi */
  const double invPI =  0.318309886183791;              /* 1/pi */
  double sign  =  1.0;

  double res, y, temp;
  int N;

  /* extract multiple of pi */
  temp =  x * invPI;
  N = _dpint(temp);                           /* N = multiple of pi in x  */
  y = (x - (double)N * C1) - (double)N * C2;

  if(y > pi2_h){
    y = y - pi;                               /* x is in the range [-pi/2, pi/2] */
  }

  if(y < 0){
    sign = -sign;                             /* sign variable */
    y = -y;
  }

  /* calculate tan(y) */
  if(y > pi4){                                /* |y| > pi/4 */
    y = (pi2_h - y) + pi2_l;                  /* pi/2 - y */
    temp = pol_est_tandp_i(y);
    res = recipdp_tandp_i(temp);              /* 1/tan(pi/2 - y) */
  }
  else{                                       /* |y| <= pi/4 */
    res = pol_est_tandp_i(y);
  }

  res = res * sign;                           /* sign for Quadrant 2 & 4 */
  return (res);
}

#endif /* TANDP_I_ */

/* ======================================================================== */
/*  End of file: tandp_i.h                                                  */
/* ======================================================================== */


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

/* =========================================================================== */
/* acossp_i.h - Single precision floating point arc_cosine                     */
/*               optimized inlined C implementation (w/ intrinsics)            */
/* =========================================================================== */

#ifndef ACOSSP_I_H_
#define ACOSSP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtsp_acossp_i, ".text:optci");
#endif

/* =========================================================================== */
/* The sqrtsp function returns the square root of a real floating-point value. */
/* =========================================================================== */

static inline float sqrtsp_acossp_i (float x)
{
  const float  half  = 0.5;
  const float  OneP5 = 1.5;
  float  y, y0, y1, y2, x_half;

  x_half =  x * half;
  y0 = _rsqrsp(x);                          /* y0 = 1/sqrt(x) */

  y1 = OneP5 - (y0*y0*x_half);
  y1 = y0*y1;
  y2 = y1*(OneP5 - (y1*y1*x_half));
  y = x*y2;

  if (x <= 0.0f) {
    y = 0.0f;
  }

   return (y);
} /* sqrtsp_acossp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_acossp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the arc_cosine funtion.               */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13 +    */
/*          c14 x^15 + c16 x^17,                                            */
/* where x is the input, c2 through c16 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [0, 1/sqrt(2)].               */
/* ======================================================================== */

static inline float pol_est_acossp_i (float x)
{
  const float c16 =  0.053002771381990f;
  const float c14 = -0.010980624698693f;
  const float c12 =  0.020659425186833f;
  const float c10 =  0.022862784546374f;
  const float c8  =  0.030636056280974f;
  const float c6  =  0.044450959710588f;
  const float c4  =  0.075034659380970f;
  const float c2  =  0.166664771293503f;

  float x2, x4, x6, x8, x10, x12;
  float pol, tmp1, tmp2;
  
  /* calculate powers of x */
  x2  = x * x;
  x4  = x2 * x2;
  x6  = x2 * x4;
  x8  = x4 * x4;
  x10 = x6 * x4;
  x12 = x8 * x4;

  /* ====================================================================== */
  /* The polynomial calculation is done in two seperate parts.              */
  /*   tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                            */
  /*   tmp2 =  c10 x^10 + c12 x^12 + c14 x^14 + c16 x^16                    */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /* ====================================================================== */

  tmp1 = ((c8 * x8) + (c6 * x6)) + ((c4 * x4) + (c2 * x2));
  tmp2 = (((c16 * x4 + c14 * x2) + c12) * x12) + (c10 * x10);

  pol = tmp1  + tmp2;
  pol = pol* x + x;

  return pol;
} /* pol_est_acossp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(acossp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for acos(x) depends on the value of x, and     */
/* it's based on asin(x), acos(x) = pi/2 - asin(x).                       */
/*                                                                        */
/* for x_abs <= 1/sqrt(2), res = pi/2 - pol_est_acossp_i (input x)        */
/* for x_abs > 1/sqrt(2),  res = pi/2 -(pi/2 - pol_est_acossp_i (input a))*/
/*                           a = sqrt(1 - x^2)                            */
/* where x_abs is the absolute value of the input, a is calculated as     */
/* shown above and it's used as an input for the polynomial, and res is   */
/* the value for acos(x).                                                 */
/* ====================================================================== */

static inline float acossp_i (float x)
{
  const float pi2   =  1.570796327f;      /* pi/2 */
  const float rsqr2 =  0.7071067811f;     /* 1/sqrt(2) */
  float       s     =  1.0f;
  float res, x_abs, temp, a;

  x_abs = _fabsf(x);

  if(x_abs > rsqr2){                      /* |x| > 1/sqrt(2) */
    temp = 1.0f - (x_abs*x_abs);
    a = sqrtsp_acossp_i(temp);            /* a = sqrt(1 - x^2) */
    temp = pol_est_acossp_i(a);
    res = pi2 - temp;
  }
  else{                                   /* |x| <= 1/sqrt(2) */
    res = pol_est_acossp_i(x_abs);
  }

  if(x < 0.0f){
    s = -s;                               /* sign var */
  }

  res = pi2 - (res * s);                  /* restore sign for quadrants 2 & 3*/

  if(x_abs > 1.0f){
    res = _itof(0x7FFFFFFF);              /* NaN */
  }

  return (res);
} /* acossp_i */

#endif /* ACOSSP_I_H_ */

/* ======================================================================== */
/*  End of file: acossp_i.h                                                 */
/* ======================================================================== */

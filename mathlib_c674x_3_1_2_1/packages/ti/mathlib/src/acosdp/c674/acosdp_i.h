/* ======================================================================== *
 * MATHLIB -- TI doubleing-Point Math Function Library                       *
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
/* acosdp_i.h - Double precision floating point arc_cosine                     */
/*               optimized inlined C implementation (w/ intrinsics)            */
/* =========================================================================== */

#ifndef ACOSDP_I_H_
#define ACOSDP_I_H_ 1

#include <ti/mathlib/src/common/common.h>


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtdp_acosdp_i, ".text:optci");
#endif

/* =========================================================================== */
/* The sqrtsp function returns the square root of a real floating-point value  */
/* =========================================================================== */

static inline double sqrtdp_acosdp_i (double x)
{
  const double  half  =  0.5;
  const double  OneP5 =  1.5;
  double  y0, y1, y2, y;

  y0 = _rsqrdp (x);                            /* y0 = 1/sqrt(z) */
  y1 = y0 * (OneP5 - (x*y0*y0*half));
  y2 = y1 * (OneP5 - (x*y1*y1*half));
  y = x * y2 * (OneP5 - (x*y2*y2*half));

  if (x <= 0.0) {
    y = 0.0;
  }

  return (y);
} /* sqrtdp_acosdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_acosdp_i, ".text:optci");
#endif

/* =========================================================================== */
/* Polynomial calculation to estimate the arc_cosine funtion.                  */
/* The polynomial used is as follows:                                          */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13 +       */
/*          c14 x^15 + c16 x^17,                                               */
/* where x is the input, c2 through c16 are the corresponding coefficients     */
/* to the polynomial, and pol is the result of the polynomial. This            */
/* polynomial only covers inputs in the range [0, 0.5].                        */
/* =========================================================================== */

static inline double pol_est_acosdp_i (double x)
{
  /* coefficients for the polynomial */
  const double  c16 =  0.0128845102309331;
  const double  c14 =  0.0147126002168748;
  const double  c12 =  0.0176088429536748;
  const double  c10 =  0.0222431541581371;
  const double  c8 =  0.0304014411191328;
  const double  c6 =  0.0446390358862595;
  const double  c4 =  0.0750005487345893;
  const double  c2 =  0.166666642109919;
  
  double x2, x4, x6, x8, x10, x12;
  double pol, tmp1, tmp2;

  /* calculate powers of x */
  x2  = x * x;
  x4  = x2 * x2;
  x6  = x2 * x4;
  x8  = x4 * x4;
  x10 = x6 * x4;
  x12 = x8 * x4;

  /* ========================================================================= */
  /* The polynomial calculation is done in two seperate parts.                 */
  /*   tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                               */
  /*   tmp2 =  c10 x^10 + c12 x^12 + c14 x^14 + c16 x^16                       */
  /* In order to reduce the number of multiplications x is factored out of     */
  /* the polynomial and multiplied by later.                                   */
  /* ========================================================================= */

  tmp1 = ((c8 * x8) + (c6 * x6)) + ((c4 * x4) + (c2 * x2));
  tmp2 = (((c16 * x4 + c14 * x2) + c12) * x12) + (c10 * x10);

  pol = tmp1  + tmp2;
  pol = pol*x + x;

  return pol;
} /* pol_est_acosdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(acosdp_i, ".text:optci");
#endif

/* =========================================================================== */
/* The type of calculation for acos(x) depends on the value of x and it's      */
/* based on asin(x), acos(x) = pi/2 - asin(x).                                 */
/*   x_abs <= 0.5,               res = pol_est_acosdp_i (input x)              */
/*                                                                             */
/*   1 > x_abs > sqrt(3)/2,      res = pi/2 - pol_est_acosdp_i (input a)       */
/*                                 a = sqrt(1 - x^2)                           */
/*                                                                             */
/*   sqrt(3)/2 =>x_abs> 1/sqrt(2), res = pi/4 +(1/2)*pol_est_acosdp_i (input a)*/
/*                                   a = 2x^2 - 1                              */
/*                                                                             */
/*   1/sqrt(2) => x_abs > 0.5,   res = 1/2 (pi/2 - pol_est_acosdp_i (input a)  */
/*                                 a = 1 - 2x^2                                */
/* where x_abs is the absolute value of the input, a is defined for each       */
/* interval as shown above and it's used as an input for the polynomial. Then  */
/* the result is adjusted to obtain acos(x):                                   */
/*   res = pi/2 - res ,                                                        */
/* and res is the value for acos(x).                                           */
/* =========================================================================== */

static inline double acosdp_i (double x)
{
  const double rsqr2    =  0.70710678118654752440;  /* 1/sqrt(2) */
  const double sqr3div2 =  0.86602540378443864876;  /* sqrt(3)/2 */
  const double pi2      =  1.5707963267948966192;   /* pi/2 */
  const double pi4      =  0.78539816339744830962;  /* pi/4 */
  const double half     =  0.5;
  double sign =  1.0;
  double res, x_abs, x2, a, temp;

  x_abs = _fabs(x);
  x2 = x * x;

  if(x_abs > rsqr2){                          /* |x| > 1/sqrt(2) */
    if(x_abs > sqr3div2){
      temp = 1 - x2;
      a = sqrtdp_acosdp_i(temp);              /* a = sqrt(1 - x^2) */
      temp = pol_est_acosdp_i(a);
      res = pi2 - temp;                       /* pi/6 < |res| < pi */
    }
    else{
      a = 2* x2 -1;                           /* a = 2x^2 - 1 */
      temp = pol_est_acosdp_i(a);
      res = pi4 + half* temp;                 /* pi/4 < |res| < pi/6 */
    }
  }
  else{                                       /* |x| <= 1/sqrt(2) */
    if(x_abs > half){
      a = 1 - 2*(x2);                         /* a = 1 - 2x^2 */
      temp = pol_est_acosdp_i(a);
      res = half * (pi2 - temp);              /* pi/3 < |res| < pi/4 */
    }
    else{
      res = pol_est_acosdp_i(x_abs);          /* 0 < |res| < pi/3 */
    }
  }

  if(x < 0){
    sign = -sign;                             /* sign var */
  }
  res = pi2 - (res * sign);                   /* restore sign for quadrant 2 & 3*/

  return (res);
} /* acosdp_i */

#endif /* ACOSDP_I_H_ */

/* ======================================================================== */
/*  End of file: acosdp_i.h                                                 */
/* ======================================================================== */

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
/* asinhsp_i.h - single precision floating point inverse hyperbolic sine   */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef ASINHSP_I_
#define ASINHSP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logsp_asinhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the logarithm value of a real floating-point       */
/* argument x. The return value is the base e logarithmic value of x.       */
/* ======================================================================== */

static inline float logsp_asinhsp_i (float x)
{
  /* coeffincients for the polynomial p(r) */
  const float   c1   = -0.2302894f;
  const float   c2   =  0.1908169f;
  const float   c3   = -0.2505905f;
  const float   c4   =  0.3333164f;
  const float   c5   = -0.5000002f;

  const double  ln2  =  0.693147180559945;
  const float   max  =  88.7228390519551f;
  float   pol, r1, r2, r3, r4, res;
  double  dr, frcpax, rcp, T;
  int     N, T_index;

  /* r = x * frcpa(x) -1 */
  rcp = _rcpdp((double) x);
  frcpax = _itod(_clr(_hi(rcp),0,16), 0);
  dr = frcpax * (double) x  - 1.0;

  /* calculate powers of r */
  r1 = (float) dr;
  r2 = r1*r1;
  r3 = r1*r2;
  r4 = r2*r2; 

  /* Polynomial p(r) that approximates ln(1+r) - r */
  pol = c5*r2 + ((c4*r3) + ((c2*r1 + c3) + c1*r2)*r4);

  /* Reconstruction: result = T + r + p(r) */
  N       = _extu(_hi(frcpax),  1, 21) - 1023;
  T_index = _extu(_hi(frcpax), 12, 29);
  T       = ti_math_logtable[T_index] - ln2 * (double) N;
  res     = (dr + T) + (pol);

  if(x > FLT_MAX){
    res = max;
  }

  return (res);
} /* logsp_asinhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtsp_asinhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the square root of the argument a. This function   */
/* has been modified to return the argument x when a = x*x. The argument a  */
/* is equal to x * x + 1, if a = x* x then +1 is irrelevant or x * x        */
/* overflows and the real sqrt of a is lost.                                */
/* ======================================================================== */

static inline float sqrtsp_asinhsp_i (float a, float x)
{
  const float  half  = 0.5f;
  const float  OneP5 = 1.5f;
  float  x0, x1, x2, res, a_half;


  a_half = a * half;
  x0 = _rsqrdp(a);

  x1 = OneP5 - (a_half*x0*x0);
  x1 = x0*x1;
  x2 = x1*(OneP5 - (x1*x1*a_half));
  res = a*x2;

  if (a == x*x) {
    res = x;
  }

  return res;
} /* End of sqrtsp_asinhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(asinhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* The type of calculation for asinh(x) depends on the value of x:          */
/*   x_abs > 0.5, res =  ln( x + sqrt (x^2 + 1))                            */
/*   This equation is modified as follows to avoid overflow for a large x;  */
/*     ln([x + sqrt(x^2 + 1)]/2] + ln(2)                                    */
/*                                                                          */
/*   x_abs <= 0.5, res = polynomial estimation (input x)                    */
/* where x_abs is the absolute value of the input and res is the calculated */
/* value for asinh(x)                                                       */
/*                                                                          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7                                     */
/* where x is the input, c2 through c6 are the corresponding coefficients   */
/* for the polynomial, and pol is the result of the polynomial.             */
/* ======================================================================== */

static inline float asinhsp_i(float x)
{
  const float ln2         =  0.69314718056f;  /* ln(2) */
  const float pol_bound   =  0.5f;
  const float half        =  0.5f;
  float sign              =  1.0f;

  /* Coefficients for the polynomial */
  const float c2          = -0.166605362341955f;
  const float c4          =  0.0734464812833510f;
  const float c6          = -0.0330279320352987f;

  float res, sqrt, pol;
  float x2, x4, x6, x_abs;
  float temp;

  x_abs = _fabsf(x);                          /* |x| */
  x2 = x * x;                                 /* x^2 */

  if(x < 0.0f){
    sign = -sign;
  }

  /* powers of x */
  x4 = x2 * x2;
  x6 = x4 * x2;

  /* use polynomial estimation for |x| <= 0.5 */
  /* polynomial to estimate asinh(x) for small inputs*/
  pol = (x2 * c2) + (x4 * c4) + (x6 * c6);
  pol = pol * x + x;


  /* assume |x| > 0.5 and calculate asinh(x) */
  sqrt = sqrtsp_asinhsp_i(x2 + 1.0f, x_abs);  /* sqrt(x^2 + 1) */

  /* prevent overflow for large x, log(2x) where x > max/2 */
  temp = sqrt * half + x_abs * half;          /* (x+sqrt(x^2 + 1))/2 */
  res = logsp_asinhsp_i(temp) + ln2;          /* ln((x + sqrt(x^2 + 1))/2) +ln(2) */
  res = res * sign;                           /* restore sign */

  /* set the result to the right value depending on the input value */
  if(x_abs <= pol_bound){
    res = pol;
  }

  return res;
}

#endif  /* _ASINHSP_H_ */

/* ======================================================================== */
/*  End of file: asinhsp_i .h                                               */
/* ======================================================================== */


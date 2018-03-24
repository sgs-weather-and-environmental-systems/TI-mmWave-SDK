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
/* acoshsp_i.h - single precision floating point inverse hyperbolic cosine */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef ACOSHSP_I_
#define ACOSHSP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logsp_acoshsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the logarithm value of a real floating-point       */
/* argument x. The return value is the base e logarithmic value of x.       */
/* ======================================================================== */

static inline float logsp_acoshsp_i (float x)
{
  /* coefficients for the polynomial p(r) */
  const float   c1   = -0.2302894f;
  const float   c2   =  0.1908169f;
  const float   c3   = -0.2505905f;
  const float   c4   =  0.3333164f;
  const float   c5   = -0.5000002f;

  const double  ln2  =  0.693147180559945;
  const double  max  =  88.7228390519551;
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
} /* logsp_acoshsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtsp_acoshsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the square root of the argument a. This function   */
/* has been modified to return the argument x when a = x*x. The argument a  */
/* is equal to x * x + 1, if a = x* x then +1 is irrelevant or x * x        */
/* overflows and the real sqrt of a is lost.                                */
/* ======================================================================== */

static inline float sqrtsp_acoshsp_i (float a, float x)
{
  const float  half  = 0.5;
  const float  OneP5 = 1.5;
  float  x0, x1, x2, x_half, res;


  x_half = a * half;
  x0 = _rsqrdp(a);

  x1 = OneP5 - (x_half*x0*x0);
  x1 = x0*x1;
  x2 = x1*(OneP5 - (x1*x1*x_half));
  res = a*x2;

  if (a == x*x) {
    res = x;
  }

  if(a == 0.0f){
    res = 0.0f;
  }

  return res;
} /* End of sqrtsp_acoshsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(acoshsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the value of acosh(x), which is estimated as       */
/* follows:                                                                 */
/*   res = ln( x + sqrt (x^2 + 1))                                          */
/* where x is the input, sqrt stands for the square root function, and      */
/* res is the calculated value for acosh(x). This equation is modified as   */
/* follows to avoid overflow for a large x;                                 */
/*     ln([x + sqrt(x^2 + 1)]/2] + ln(2)                                    */
/* ======================================================================== */

static inline float acoshsp_i(float x)
{
  const float ln2         =  0.69314718056f;  /* ln(2) */
  const float half        =  0.5;

  float res, sqrt, temp, x2;

  x2 = x * x;                                 /* x^2 */

  sqrt = sqrtsp_acoshsp_i(x2 - 1.0f, x);      /* sqrt(x^2 + 1) */
  temp = sqrt * half + x * half;              /* (x+sqrt(x^2 + 1))/2 */
  res = logsp_acoshsp_i(temp) + ln2;          /* ln((x + sqrt(x^2 + 1))/2) +ln(2) */

  if(x < 1.0f){
    res = _itof(0x7FFFFFFF);                  /* NaN */
  }

  return res;
}

#endif /* ACOSHSP_H_ */

/* ======================================================================== */
/*  End of file: acoshsp_i.h                                                */
/* ======================================================================== */

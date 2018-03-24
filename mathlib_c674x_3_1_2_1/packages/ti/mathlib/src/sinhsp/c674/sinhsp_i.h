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
/* sinhsp_i.h - single precision floating point hyperbolic sine            */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef SINHSP_I_H_
#define SINHSP_I_H_ 1

#include <ti/mathlib/src/common/common.h>
#include <c6x.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(expsp_sinhsp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the exponential value of a real floating-point    */
/* argument. The return value is (e^x)/2.                                  */
/* ======================================================================= */

static inline float expsp_sinhsp_i (float x)
{
  const float log2_base_x16 =   23.0831206542234f;  /*1.442695041 * 16.0*/
  const float Half          =   0.5f;
  const float LnMax         =   88.72283905;
  const float Ln2           =   0.693147180559945f; /* log(2) */
  const double p            =   0.0433216987816623; /* 1/log2_base_x16 */

  /* coefficients to approximate the decimal part of the result */
  const float c0            =   0.166668549286041f;
  const float c1            =   0.500016170012920f;
  const float c2            =   0.999999998618401f;

  float pol, r, r2, r3, res;
  unsigned int Ttemp;
  int          J, K, N;
  double       dT;

  /* Get N such that |N - x*16/ln(2)| is minimized */
  N = (int) (x * log2_base_x16 + Half);
  if ((x * log2_base_x16) < -Half) {
    N--;
  }

  /* Argument reduction, r, and polynomial approximation pol(r) */
  r  = (float) ((double)x - p * (double)N) ;
  r2 = r * r;
  r3 = r * r2;

  pol = (r * c2) + ((r3 * c0) + (r2 * c1));
  /* substract 16 in order to get (e^x)/2 as a result */
  N = N - 16;

  /* Get index for ktable and jtable */
  K  = _extu (N, 28, 30);
  J  = N & 0x3;
  dT = ti_math_kTable[K] * ti_math_jTable[J];

  /* Scale exponent to adjust for 2^M */
  Ttemp = _hi(dT) + (unsigned int) ((N >> 4) << 20);
  dT    = _itod(Ttemp, _lo(dT));

  res = (float) (dT * (1.0f + pol));

  /* > LnMax returns INF */
  /* Ln2 adjusts the new range for exp(x)/2 */
  if (x - Ln2 > LnMax) {
    res = _itof(0x7F800000);
  }

  return(res);
} /* expsp_sinhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(recipsp_sinhsp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the reciprocral of a real floating-point value a. */
/* The return value is 1/a.                                                */
/* ======================================================================= */

static inline float recipsp_sinhsp_i (float a)
{
  const float two  = 2.0f;
  float y;

  y = _rcpsp(a);                            /* 1/b */
  y = y*(two - a*y);
  y = y*(two - a*y);

  if (a == 0.0f) {
    y = 0.0f;
  }

  if (_fabsf(a) > FLT_MAX) {
    y = 0.0f;
  }

  return (y);
} /* divsp_sinhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_sinhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the hyperbolic sine funtion.          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9                            */
/* where x is the input, c2 through c8 are the corresponding coefficients   */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [-1, 1].                      */
/* ======================================================================== */

static inline float pol_est_sinhsp_i (float x)
{
  /* coefficients for the polynomial */
  const float c8 = 2.75573192239859e-6f;
  const float c6 = 0.000198412698412698f;
  const float c4 = 0.00833333333333333f;
  const float c2 = 0.166666666666667f;

  float x2, x4, x6, x8, pol;

  /* calculate the power of x */
  x2 = x  *x;
  x4 = x2 * x2;
  x6 = x2 * x4;
  x8 = x4 * x4;

  /* ====================================================================== */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /*   pol =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                             */
  /* ====================================================================== */

  pol = ((c2 * x2) + (c4 * x4)) + ((c6 * x6) + (c8 * x8));
  pol = pol * x + x;

  return pol;
} /* pol_est_sinhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sinhsp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for sinh(x) depends on the value of x:         */
/*                                                                        */
/* for x_abs <= 1,          res = pol_est_sinhsp_i (input x)              */
/* for x_abs > 16,          res = sign * expsp_sinhsp_i (input x_abs),    */
/*                                e^-|x| is negligible                    */
/* for 1 < x_abs <= 16,     res = (e^x - e^-x)/2,                         */
/*                                e^x = 2 * expsp_sinhsp_i (input x)      */
/* where x_abs is the absolute value of the input, sign has a value of 1  */
/* or -1 depending on the sign of the input, and res is the value         */
/* for sinh(x).                                                           */
/* ====================================================================== */

static inline float sinhsp_i (float x)
{
  const float half   = 0.5f;
  const float bound  = 16.0f;
  const float Max    = 89.41598629f;
  const float pol_bound = 1.0f;                  /* polynomial boundary */
  float sign   = 1.0f;
  float res, temp, exp, x_abs;

  x_abs = _fabsf(x);

  if(x < 0.0f){
      sign = -sign;                           /* sign variable */
  }

  /* e^-|x| is negligible */
  if(x_abs > bound){                          /* |x| > 16 */
    res = expsp_sinhsp_i(x_abs);              /* res = sign * (e^x)/2 */
  }
  else if(x_abs <= pol_bound){                /* |x| <= 1 */
    res = pol_est_sinhsp_i(x_abs);
  }
  else {                                      /* 1 < |x| <= 16 */
    exp = 2.0f * expsp_sinhsp_i(x_abs);       /* e^x */
    temp = recipsp_sinhsp_i(exp);             /* e^-x */
    res = (exp - temp) * half;                /* (e^x - e^-x)/2 */
  }

  if (x_abs > Max) {                          /* reached max */
    res = _itof(0x7F800000);
  }

  return res * sign;
} /* sinhsp_i */

#endif /* SINHSP_I_H_ */

/* ======================================================================== */
/*  End of file: sinhsp_i.h                                                 */
/* ======================================================================== */

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
/* tanhsp_i.h - Single precision floating point hyperbolic tangent         */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef TANHSP_I_H_
#define TANHSP_I_H_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divsp_tanhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function divides a by b. The return value is a/b.                   */
/* ======================================================================== */

static inline double divsp_tanhsp_i (float a, float b)
{
  const float two  = 2.0f;
  float x1, x2, y;

  x1 = _rcpsp(b);
  x1 = x1*(two - b*x1);
  x2 = x1*(two - b*x1);
  y = a*x2;

  if (a == 0.0f) {
    y = 0.0f;
  }

  if (_fabsf(b) > FLT_MAX) {
    y = 0.0f;
  }

  return (y);
} /* End of divsp_tanhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_tanhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the hyperbolic tangent funtion.       */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2x^3 + c4x^5 + c6x^7 + c8x^9 + c10x^11 + c12x^13 +          */
/*          c14x^15 + c16x^17,                                              */
/* where x is the input, c2 through c16 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers a small range of inputs.                          */
/* ======================================================================== */

static inline float pol_est_tanhsp_i (float x)
{
  /* coefficients for the polynomial */
  const float c16  =  0.000244528812992865f;
  const float c14  = -0.00119005741172407f;
  const float c12  =  0.00349212803657248f;
  const float c10  = -0.00886323552990220f;
  const float c8   =  0.0218794885361552f;
  const float c6   = -0.0539682539682540f;
  const float c4   =  0.133333333333333f;
  const float c2   = -0.333333333333333f;

  float x2, x4, x6, x8, x10, x12;
  float pol, tmp1, tmp2;

  /* calculate powers of x */
  x2  = x*x;
  x4  = x2*x2;
  x6  = x2*x4;
  x8  = x4*x4;
  x10 = x6*x4;
  x12 = x8*x4;

  /* ====================================================================== */
  /* The polynomial calculation is done in two seperate parts:              */
  /*   tmp1 =  c2x^2 + c4x^4 + c6x^6 + c8x^8                                */
  /*   tmp2 =  c10x^10 + c12x^12 + c14x^14 + c16x^16                        */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /* ====================================================================== */

  tmp1 = ((c8 * x8) + (c6 * x6)) + ((c4 * x4) + (c2 * x2));
  tmp2 = (((c16 * x4 + c14 * x2) + c12) * x12) + (c10 * x10);

  pol = tmp1  + tmp2;
  pol = pol*x + x;

  return pol;
} /* End of pol_est_tanhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(exp_tanhsp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The exp_tanhsp_i function returns the exponential value of a real      */
/* floating-point argument x. The return value is e^x.                    */
/* ====================================================================== */

static inline float exp_tanhsp_i (float x)
{
  const float log2_base_x16 =   23.0831206542234f;  /* 1.442695041 * 16.0 */
  const float Half          =   0.5f;
  const float c0            =   0.166668549286041f;
  const float c1            =   0.500016170012920f;
  const float c2            =   0.999999998618401f;
  const double p            =   0.0433216987816623;
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
 
  /* Get index for ktable and jtable */
  K  = _extu (N, 28, 30);
  J  = N & 0x3;
  dT = ti_math_kTable[K] * ti_math_jTable[J];

  /* Scale exponent to adjust for 2^M */
  Ttemp = _hi(dT) + (unsigned int) ((N >> 4) << 20);
  dT    = _itod(Ttemp, _lo(dT));

  res = (float) (dT * (1.0f + pol));

  return(res);
} /* End of exp_tanhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tanhsp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for tanh(x) depends on the value of x.         */
/*   x_abs < 1.0, res = pol_est_tanhsp_i(input x)                         */
/*                                                                        */
/*   x_abs >= 1.0, res = -1 + 2 / (1 + e^(-2x))                           */
/*                                                                        */
/*   x_abs > 9.0, res = 1.0 (maximum value for tanh)                      */
/* where x_abs is the absolute value of the input and res is the          */
/* calculated value for tanh(x).                                          */
/* ====================================================================== */

static inline float tanhsp_i (float x)
{
  const float maxTanh     =  1.0f;
  const float limit       =  9.0f;
  const float negTwo      = -2.0f;
  const float pol_bound   =  1.0f;
  float       sign        =  1.0f;
  float res, x_abs, temp;

  x_abs = _fabsf(x);

  res = maxTanh;                            /* assume tanh reaches max value */

  if(x < 0.0f){
    sign = -sign;
  }

  if(x_abs < pol_bound){                    /* |x| < 1.0 */
    res = pol_est_tanhsp_i(x_abs);          /* estimation for very small input */
  }
  else if(x_abs <= limit){                  /* 1.0 < |x|<= 9 */
    temp = exp_tanhsp_i(negTwo * x_abs);    /* e^(-2x) */
    temp++;
    res = divsp_tanhsp_i(2.0f,temp) - 1.0f; /* -1 + 2 / (1 + e^(-2x)) */
  }

  return (res * sign);                      /* restore sign */

} /* End of tanhsp_i */

#endif /* TANHSP_I_H_ */

/* ======================================================================== */
/*  End of file: tanhsp_i.h                                                 */
/* ======================================================================== */


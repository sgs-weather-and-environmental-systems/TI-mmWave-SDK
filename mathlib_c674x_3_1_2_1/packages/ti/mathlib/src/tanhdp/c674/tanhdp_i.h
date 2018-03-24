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
/* tanhdp_i.h - Double precision floating point hyperbolic tangent         */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef TANHDP_I_H_
#define TANHDP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdp_tanhdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function divides a by b. The return value is a/b.                   */
/* ======================================================================== */

static inline double divdp_tanhdp_i (double a, double b)
{
  const double  two   =  2.0;
  double x1, x2, x3, y;

  x1 = _rcpdp(b);
  x1 = x1 * (two - b*x1);
  x2 = x1 * (two - b*x1);
  x3 = x2 * (two - b*x2);
  y = x3 * a;

  if (a == 0.0) {
    y = 0.0;
  }

  return (y);
} /* End of divdp_tanhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_tanhdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the hyperbolic tangent funtion.       */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2x^3 + c4x^5 + c6x^7 + c8x^9 + c10x^11 + c12x^13            */
/* where x is the input, c2 through c16 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers a small range of inputs.                          */
/* ======================================================================== */

static inline double pol_est_tanhdp_i (double x)
{
  /* coefficients for the polynomial */
  const double c12  =  0.00367060036108701;
  const double c10  =  -0.00886839561494848;
  const double c8   =  0.0218760895606192;
  const double c6   =  -0.0539695098409829;
  const double c4   =  0.133333359836019;
  const double c2   =  -0.333333331831234;

  double x2, x4, x6;
  double tmp1, tmp2, pol;


  /* calculate powers of x */
  x2  = x *x;
  x4  = x2*x2;
  x6  = x2*x4;

  /* ====================================================================== */
  /* The polynomial calculation is done in two seperate parts:              */
  /*   tmp1 =  c2x^2 + c4x^4 + c6x^6 + c8x^8                                */
  /*   tmp2 =  c10x^10 + c12x^12                                            */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /* ====================================================================== */

  tmp1 = (x6 * (c6 + (c8 * x2))) + ((c4 * x4) + (c2 * x2));
  tmp2 = x6 * ((c10 * x4) + (c12 * x6));

  pol = tmp1  + tmp2;
  pol = pol*x + x;

  return pol;
} /* End of pol_est_tanhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(exp_tanhdp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The exp_tanhdp_i function returns the exponential function of a real   */
/* floating-point argument x.                                             */
/* ====================================================================== */

static inline double exp_tanhdp_i (double x)
{
  const double Half  =   0.5;
  const double a0    =   0.249999999999999993;
  const double a1    =   0.694360001511792852e-2;
  const double a2    =   0.165203300268279130e-4;
  const double b0    =   0.5;
  const double b1    =   0.555538666969001188e-1;
  const double b2    =   0.495862884905441294e-3;
  const double c1    =   0.693359375;                 /* 355/512 */
  const double c2    =  -2.1219444005469058277e-4;
  const double L2    =   1.4426950408889634074;       /* log (base 2) of e */
  double Y, X, W, R, S, B, C, D;
  int    N, upper;

  Y = x;
  C = Y*L2;                                 /* base e --> base 2 argument */
  N = _dpint (C);                           /* get unbiased exponent as int */

  S = N;                                    /* double(int N) */
  X = (Y - S*c1) - S*c2;                    /*  range reduction  */
  W = X*X;
  B = ( b2*W + b1)*W + b0;                  /* denominator  */
  D = ((a2*W + a1)*W + a0)*X;               /* numerator */
  R = Half + divdp_tanhdp_i (D,(B-D));

  /* ====================================================================== */
  /* upper is used to calculate the exponent part. 1024 produces overflow   */
  /* for large numbers, 1022 corrects overflow and it is adjusted by        */
  /* a factor of 4 at the end (2^2)                                         */
  /* ====================================================================== */

  upper = 1022 + N;
  upper = _extu (upper,20,0);
  S = _itod (upper,0x00000000);
  C = R*S*4;                               /* scale by power of 2 */

  return (C);
} /* End of exp_tanhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tanhdp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for tanh(x) depends on the value of x:         */
/*   x_abs < 0.3, res = pol_est_tanhdp_i ( input x)                       */
/*                                                                        */
/*   x_abs >= 0.3, res = -1 + 2 / (1 + e^(-2x))                           */
/*                                                                        */
/*   x_abs > 19.0, res = 1.0 (maximum value for tanh)                     */
/* where x_abs is the absolute value of the input and res is the          */
/* calculated value for tanh(x).                                          */
/* ====================================================================== */

static inline double tanhdp_i (double x)
{
  const double maxTanh     =  1.0;
  const double limit       =  19.0;
  const double negTwo      = -2.0;
  const double pol_bound   =  0.3;
  double       sign        =  1.0;
  double res, x_abs, temp;

  x_abs = _fabs(x);

  res = maxTanh;                                /* reached maximum value */

  if(x < 0){
    sign = -sign;
  }

  if(x_abs < pol_bound){                        /* |x| < 0.5 */
    res = pol_est_tanhdp_i(x_abs);              /* calculation for very small input */
  }
  else if(x_abs <= limit){                      /* 0.5 < |x|<= 19 */
    temp = exp_tanhdp_i(negTwo * x_abs);        /* e^(-2x) */
    temp++;
    res = divdp_tanhdp_i(2,temp) - 1;           /* -1 + 2 / (1 + e^(-2x)) */
  }

  return (res * sign);                          /* restore sign */
} /* End of tanhdp_i */

#endif /* TANHDP_I_H_ */

/* ======================================================================== */
/*  End of file: tanhdp_i.h                                                 */
/* ======================================================================== */


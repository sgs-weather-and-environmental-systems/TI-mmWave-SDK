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
/* coshdp_i.h - Double precision floating point hyperbolic cosine          */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef COSHDP_I_H_
#define COSHDP_I_H_ 1

#include <ti/mathlib/src/common/common.h>
#include <c6x.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdp_coshdp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the division result of two real floating-point    */
/* values, a and b. The return value is a/b.                               */
/* ======================================================================= */

static inline double divdp_coshdp_i (double a, double b)
{
  double  X;
  const double  TWO   =  2.0;

  X = _rcpdp(b);
  X = X * (TWO - b*X);
  X = X * (TWO - b*X);
  X = X * (TWO - b*X);
  X = X * a;

  if (a == 0.0) {
    X = 0.0;
  }

  return (X);
} /* divdp_coshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(expdp_coshdp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the exponential value of a real floating-point    */
/* argument. The return value is (e^x).                                    */
/* ======================================================================= */

static inline double expdp_coshdp_i (double x)
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
  double Y, Z, W, R, S, B, C, D;
  int    N, upper;

  Y = x;
  C = Y*L2;                                 /* base e --> base 2 argument */
  N = _dpint (C);                           /* get unbiased exponent as int */
  S = N;                                    /* double(int N) */
  Z = (Y - S*c1) - S*c2;                    /*  range reduction  */
  W = Z*Z;
  B = ( b2*W + b1)*W + b0;                  /* denominator  */
  D = ((a2*W + a1)*W + a0)*Z;               /* numerator  */
  R = Half + divdp_coshdp_i (D,(B-D));

  /* ======================================================================= */
  /* upper is used to calculate the exponent. 1024 produces overflow for     */
  /* large numbers, 1022 corrects overflow and it is adjusted by a factor    */
  /* of 4 later (2^2).                                                       */
  /* ======================================================================= */

  upper = 1022 + N;

  upper = _extu (upper,20,0);
  S     = _itod (upper,0x00000000);
  C     = R*S*4;                            /* scale by power of 2  */

  return (C);
} /* expdp_coshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_coshdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the hyperbolic sine funtion.          */
/* The polynomial used is as follows:                                       */
/*   pol = 1 + c2 x^2 + c4 x^4 + c6 x^66 + c8 x^8 + c10 x^10 + c12 x^12      */
/* where x is the input, c2 through c12 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [-1, 1].                      */
/* ======================================================================== */

static inline double pol_est_coshdp_i (double x)
{
  /* coefficients for the polynomial */
  const double c12  = 2.08767569878681e-9;
  const double c10  = 2.75573192239859e-7;
  const double c8  = 2.48015873015873e-5;
  const double c6  = 0.00138888888888889;
  const double c4  = 0.0416666666666667;
  const double c2  = 0.5;

  double x2, x4, x6, x8;
  double tmp1, tmp2, pol;

  /* calculate the powers of x */
  x2 = x * x;
  x4 = x2 * x2;
  x6 = x4 * x2;
  x8 = x4 * x4;

  /* tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8 */
  tmp1 = ((c2 * x2) + (c4 * x4)) + ((c6 * x6) +(c8 * x8));

  /* tmp2 =  c10 x^10 + c12 x^12 */
  tmp2 = ((c10 * x2) + (c12 * x4)) * x8;

  pol = (tmp1 +  tmp2) + 1;
  return pol;
} /* pol_est_coshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(coshdp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for cosh(x) depends on the value of x:         */
/*                                                                        */
/* for x_abs <= 1,          res = pol_est_coshdp_i (input x)              */
/* for x_abs > 25,          res = expsp_coshdp_i (input temp),            */
/*                               temp = x_abs - log_e(2)                  */
/* for 1 < x_abs <= 25,     res = (e^x + e^-x)/2,                         */
/*                                e^x = expsp_coshsp_i (input x)          */
/* where x_abs is the absolute value of the input, temp is defined above, */
/* and res is the value for cosh(x).                                      */
/* ====================================================================== */

static inline double coshdp_i (double x)
{
  const double half   =   0.5;
  const double bound  =   25.0;
  const double ln2    =   0.693147180559945;   /*  log_e(2) */
  const double Max    =   710.475860073944;
  const double pol_bound =   1;                   /* polynomial boundary */
  double res, x_abs, exp, temp;

  x_abs = _fabs(x);

  /* e^-|x| is negligible */
  if(x_abs > bound){                           /* |x| > 25 */
    temp  = x_abs - ln2;
    res = expdp_coshdp_i(temp);                /* res = e^(|x|- log_e(2)) */
  }
  else if(x_abs <= pol_bound){                /* |x| < 1 */
    res = pol_est_coshdp_i(x_abs);
  }
  else{                                        /* 1 < |x| <= 25 */
    exp = expdp_coshdp_i(x_abs);               /* e^|x| */
    temp = divdp_coshdp_i(1,exp);              /* e^-|x| */
    res = (exp + temp) * half;                 /* (e^x + e^-x)/2 */
  }
  /* > Max returns INF */
  if (x_abs > Max) {
    res = _lltod(0x7FF0000000000000);          /* large x, res = INF*/
  }

  return res;
}

#endif /* COSHDP_I_H_ */

/* ======================================================================== */
/*  End of file: coshdp_i.h                                                 */
/* ======================================================================== */


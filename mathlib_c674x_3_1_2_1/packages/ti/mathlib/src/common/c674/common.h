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
/* common.h - Floating point common code and defines                       */
/* ======================================================================= */

#ifndef C674_COMMON_H_
#define C674_COMMON_H_ 1

#include <c6x.h>

/* Inline division (DP) */
#define cmn_DIVDP(a,b) {  \
  double  TWO = 2.0;      \
  double  X;              \
  X = _rcpdp((b));        \
  X = X*(TWO - (b)*X);    \
  X = X*(TWO - (b)*X);    \
  X = X*(TWO - (b)*X);    \
  X = (a)*X;              \
  return (X);             \
}


/* Inline division (SP) */
#define cmn_DIVSP(a,b) {  \
  float  TWO = 2.0;       \
  float  X;               \
  X = _rcpsp((b));        \
  X = X*(TWO - (b)*X);    \
  X = X*(TWO - (b)*X);    \
  X = (a)*X;              \
  return (X);             \
}

/* =========================================================================== */
/* Polynomial calculation to estimate the arc_sine funtion.                    */
/* The polynomial used is as follows:                                          */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13 +       */
/*          c14 x^15 + c16 x^17,                                               */
/* where x is the input, c2 through c16 are the corresponding coefficients     */
/* to the polynomial, and pol is the result of the polynomial. This            */
/* polynomial only covers inputs in the range [0, 0.5].                        */
/* =========================================================================== */
#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_asindp_i, ".text:optci");
#endif
static inline double pol_est_asindp_i (double x)
{
  /* Coefficients for the polynomial */
  const double  c16 =  0.0128845102309331;
  const double  c14 =  0.0147126002168748;
  const double  c12 =  0.0176088429536748;
  const double  c10 =  0.0222431541581371;
  const double  c8  =  0.0304014411191328;
  const double  c6  =  0.0446390358862595;
  const double  c4  =  0.0750005487345893;
  const double  c2  =  0.166666642109919;

  double x2, x4, x6, x8, x10, x12;
  double pol, tmp1, tmp2;

  /* calculate powers of x */
  x2  = x*x;
  x4  = x2*x2;
  x6  = x2*x4;
  x8  = x4*x4;
  x10 = x6*x4;
  x12 = x8*x4;

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
} /* pol_est_asindp_i */

#endif /* C674_COMMON_H_ */

/* ======================================================================== */
/*  End of file: common.h                                                   */
/* ======================================================================== */

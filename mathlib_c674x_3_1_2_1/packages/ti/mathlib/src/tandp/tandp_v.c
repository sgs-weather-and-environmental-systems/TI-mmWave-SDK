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
/* tandp_v.c - double precision floating point tangent                     */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "tandp.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tandp_v, ".text:optvec");
#endif

/* ====================================================================== */
/* To calculate tan(x), x must be mapped to the range [0,pi/2]            */
/* y = x within range. Then the calculation for tan(y) depends on the     */
/* value of y:                                                            */
/*                                                                        */
/* for y_abs <= pi/4, res = pol_est_tansp_i (input y)                     */
/* for y_abs > pi/4,  res = 1 / pol_est_tansp_i (input a)                 */
/*                         a = pi/2 - y                                   */
/* where y_abs is the absolute value of the y, a is calculated as         */
/* shown above and it's used as an input for the polynomial, and res is   */
/* the value for tan(x). Repeat this for every value in the array.        */
/* ====================================================================== */

void tandp_v (const double a[restrict], double output[restrict], int size)
{
  const double pi4   =  0.785398163397448309;
  const double pi2_h =  1.5707963267948;
  const double pi2_l =  9.66192313216916398e-14;
  const double pi    =  3.141592653589793238;
  const double C1    =  3.1415926535897;
  const double C2    =  9.32587340685131e-014;          /* C1 + C2 = PI */
  const double invPI =  0.318309886183791;

  double res, x, y, temp, sign, pol, pol_in;
  int N, i;

  /* Using integers instead of booleans to appease MISRA */
  t_bool cond, not_cond;

  for (i = 0; i < size; i++) {
    x = a[i];
    sign  =  1.0;

    /* extract multiple of PI */
    temp =  x * invPI;
    N = _dpint(temp);                           /* N = multiple of PI in x  */

    /* y is in the range [0, PI) */
    y = (x - ((double)N * C1)) - ((double)N * C2);

    if(y > pi2_h){
      y = y - pi;                               /* x is in the range [-PI/2, PI/2] */
    }

    if(y < 0.0){
      sign = -sign;                             /* sign variable */
    }
    y = _fabs(y);

    pol_in = (pi2_h - y) + pi2_l;

    /* assume the input is falls in the range [0, pi/4] */
    if(y <= pi4){
      pol_in = y;
    }

    pol = pol_est_tandp_i(pol_in);

    /* calculate tan(x) for the range (pi/4, pi/2] */
    temp = recipdp_tandp_i(pol);

    /* set the result to the correct answer for the range [0,pi/4] */
    cond = (y > pi4) ? TRUE : FALSE;
    not_cond = (cond == FALSE) ? TRUE : FALSE;
    
    res = ((double)cond * temp) + ((double)not_cond * pol);

    output[i] = res * sign;                     /* sign for Quadrant 2 & 4 */
  }
}


/* ======================================================================= */
/*  End of file: tandp_v.c                                                 */
/* ======================================================================= */


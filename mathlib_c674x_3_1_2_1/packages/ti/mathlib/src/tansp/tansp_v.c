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
/* tansp_v.c - single precision floating point tangent                     */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "tansp.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tansp_v, ".text:optvec");
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

void tansp_v (const float a[restrict], float output[restrict], int size)
{
  const float pi4   =  0.785398163f;             /* pi/4 */
  const float pi2_h =  1.570796f;
  const float pi2_l =  3.26794896476912e-7f;     /* pi2_h + pi2_l = pi/2 */
  const float pi    =  3.14159265358979f;
  const float C1    =  3.140625f;
  const float C2    =  9.676535e-4f;
  const float C3    =  8.97930618748433e-11f;    /* C1 + C2 + C3 = PI */
  const float invPI =  0.318309886183791f;       /* 1/pi */

  float res, x, y, pol1, pol2, temp, sign;
  int i, N;

  for (i = 0; i < size; i++) {
    x = a[i];
    sign  =  1.0f;

    /* extract multiple of PI */
    temp =  x * invPI;
    N = _spint(temp);                           /* N = multiple of PI in x  */
    y = ((x - ((float)N * C1)) - ((float)N * C2)) - ((float) N * C3);

    if(y > pi2_h){
      y = y - pi;                               /* x is in the range [-PI/2, PI/2] */
    }

    if(y < 0.0f){
      sign = -sign;                             /* sign variable */
      y = -y;
    }

    /* estimate value of tan(x) for the range |y| <= pi/4 */
    pol1 = pol_est_tansp_i(y);

    /* assume and estimate the value of tan(x) for the range |y| > pi/4 */
    temp = (pi2_h - y) + pi2_l;                 /* pi/2 - y */
    pol2 = pol_est_tansp_i(temp);
    res = recipsp_tansp_i(pol2);             /* 1/tan(pi/2 - y) */

    /* set the correct value for tan(x) */
    if(y < pi4){
      res  = pol1;
    }

    output[i] = res * sign;                     /* sign for Quadrant 2 & 4 */
  }
}

/* ======================================================================== */
/*  End of file: tansp_v.c                                                  */
/* ======================================================================== */

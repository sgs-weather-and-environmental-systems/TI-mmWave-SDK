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
/* atanhsp_v.c - single precision floating point inverse hyperbolic        */
/*              tangent optimized inlined C implementation (w/ intrinsics) */
/*              vector version                                             */
/* ======================================================================= */

#include "atanhsp.h"

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atanhsp_v, ".text:optvec");
#endif

/* ======================================================================== */
/* The type of calculation for atanh(x) depends on the value of x:          */
/*   x_abs > 0.1, res =  0.5 * ln((1 + x)/(1 - x))                          */
/*                                                                          */
/*   x_abs <= 0.1, res = polynomial estimation (input x)                    */
/* where x_abs is the absolute value of the input and res is the calculated */
/* value for atanh(x). This is repeated for every value in the array a.     */
/*                                                                          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5                                              */
/* where x is the input, c2 through c4 are the corresponding coefficients   */
/* for the polynomial, and pol is the result of the polynomial. This is     */
/* repeated for every value in the array.                                   */
/* ======================================================================== */

void atanhsp_v (const float a[restrict], float output[], int size)
{
  const float pol_bound  =  0.1f;
  const float half       =  0.5f;
  const float limit      =  1.0f;

  /* Coefficients for the polynomial */
  const float c2         = 0.333327051f;
  const float c4         = 0.202017226f;

  float res, temp1, temp2, x, x_abs;
  float x2, x4, pol, div_, sign;
  int i;  

  /* Vector loop */
  for (i = 0; i < size; i++) {
    x = a[i];
    sign = 1.0f;

    x_abs = _fabsf(x);

    if(x < 0.0f){
      sign = -sign;
    }

    /* assume |x| > 0.1, calculate atanh(x) based on 0.5*ln((1+ x) / (1- x)) */
    temp1 = 1.0f + x_abs;
    temp2 = 1.0f - x_abs;

    div_ = divsp_atanhsp_i(temp1,temp2);         /* (1+ x) / (1- x) */
    res = logsp_atanhsp_i(div_);                 /* ln((1 + x)/(1 - x)) */
    res = res * half;                           /* divide by 2*/

    /* powers of x */
    x2 = x * x;
    x4 = x2 * x2;

    /* for |x| <= 1, use polynomial to estimate atanh(x) */
    pol = (c2 * x2) + (c4 * x4);
    pol = (pol * x_abs) + x_abs;

    /* set the result to the right answer */
    if(x_abs <= pol_bound){
      res = pol;
    }

    if(x_abs == limit){
      res = _itof(0x7F800000u);                  /* INF */
    }

    output[i] = res * sign;                     /* restore sign */
  }
}

/* ======================================================================= */
/*  End of file: atanhsp_v.c                                               */
/* ======================================================================= */

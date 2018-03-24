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
/* tanhsp_v.c - single precision floating point hyperbolic tangent         */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "tanhsp.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tanhsp_v, ".text:optvec");
#endif

/* ====================================================================== */
/* The type of calculation for tanh(x) depends on the value of x.         */
/*   x_abs < 1.0, res = pol_est_tanhsp_i(input x)                         */
/*                                                                        */
/*   x_abs >= 1.0, res = -1 + 2 / (1 + e^(-2x))                           */
/*                                                                        */
/*   x_abs > 9.0, res = 1.0 (maximum value for tanh)                      */
/* where x_abs is the absolute value of the input and res is the          */
/* calculated value for tanh(x). This is repeated for every value in      */
/* the array.                                                             */
/* ====================================================================== */

void tanhsp_v (const float a[restrict], float output[restrict], int size)
{
  const float maxTanh     =  1.0f;
  const float limit       =  9.0f;
  const float negTwo      = -2.0f;
  const float pol_bound   =  1.0f;
  float res, x, x_abs, temp, small_range, sign;
  int i;

  /* Vector loop */
  for (i = 0; i < size; i++) {
    sign = 1.0f;                                /* init the sign var */
    x = a[i];

    x_abs = _fabsf(x);

    if(x < 0.0f){
      sign = -sign;
    }

    /* Calculate two possible answers, then set the right result
     * depending on the value of the input x */

    /* |x| < 0.5, estimation for very small input */
    small_range = pol_est_tanhsp_i(x_abs);

    /* 0.5 < |x|<= 9, assume the input value is in this range */
    temp = exp_tanhsp_i(negTwo * x_abs);        /* e^(-2x) */
    temp++;
    res = divsp_tanhsp_i(2.0f,temp) - 1.0f;     /* -1 + 2 / (1 + e^(-2x)) */

    if(x_abs < pol_bound){                      /* 0.5 < |x|<= 9 */
      res = small_range;
    }

    if(x_abs > limit){                          /* reached maximum value */
      res = maxTanh;
    }

    output[i] = res * sign;                     /* save output value */
  }
} /* End of tanhsp_v */

/* ======================================================================== */
/*  End of file: tanhsp_v.c                                                 */
/* ======================================================================== */

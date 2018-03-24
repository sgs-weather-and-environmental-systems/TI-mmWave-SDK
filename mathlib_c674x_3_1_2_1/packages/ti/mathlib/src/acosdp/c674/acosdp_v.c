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
/* acosdp_v.c - Double precision floating point arc_cosine                 */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "acosdp.h"
#include "acosdp_i.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(acosdp_v, ".text:optvec");
#endif

/* =========================================================================== */
/* The type of calculation for acos(x) depends on the value of x and it's      */
/* based on asin(x), acos(x) = pi/2 - asin(x).                                 */
/*   x_abs <= 0.5,               res = pol_est_acosdp_i (input x)              */
/*                                                                             */
/*   1 > x_abs > sqrt(3)/2,      res = pi/2 - pol_est_acosdp_i (input a)       */
/*                                 a = sqrt(1 - x^2)                           */
/*                                                                             */
/*   sqrt(3)/2 =>x_abs> 1/sqrt(2), res = pi/4 +(1/2)*pol_est_acosdp_i (input a)*/
/*                                   a = 2x^2 - 1                              */
/*                                                                             */
/*   1/sqrt(2) => x_abs > 0.5,   res = 1/2 (pi/2 - pol_est_acosdp_i (input a)  */
/*                                 a = 1 - 2x^2                                */
/* where x_abs is the absolute value of the input, a is defined for each       */
/* interval as shown above and it's used as an input for the polynomial. Then  */
/* the result is adjusted to obtain acos(x):                                   */
/*   res = pi/2 - res ,                                                        */
/* and res is the value for acos(x). This is repeated for every value in the   */
/* array.                                                                      */
/* =========================================================================== */

void acosdp_v (double* restrict a, double* restrict output,
                int size)
{
    int i;

    /* Vector loop */
    for (i = 0; i < size; i++) 
    {
        output[i]=acosdp_i(a[i]);
    }
}

/* ======================================================================== */
/*  End of file: acosdp_v.c                                                 */
/* ======================================================================== */

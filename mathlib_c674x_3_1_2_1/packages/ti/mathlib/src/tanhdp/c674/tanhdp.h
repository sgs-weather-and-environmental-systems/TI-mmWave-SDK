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
/* tanhdp.h - Double Precision Hyperbolic Tangent                          */
/* ======================================================================= */

#ifndef C674_TANHDP_H_
#define C674_TANHDP_H_ 1

/** @defgroup tanhdp */
/** @ingroup  tanhdp */
/* @{ */

/**
 * @par Description:
 *    The tanhdp function returns the hyperbolic tangent function of a real
 *    floating-point argument a. If |a| is larger than 19.0 the hyperbolic
 *    tangent function reaches a maximum of |1.0| for double-precision.
 *    
 *
 * @par 
 * 	  @param[in] a = Input float 
 * @par 
 * 	  @return Resultant float 
 * 
 *
 * @par Special Cases:
 *  - If a > 19.0, then the return value is 1.0 (maximum output for the hyperbolic tangent).
 *  - If a < -19.0, then the return value is 1.0.
 *  - If a is NaN, the return value is NaN.
 *
 * @sa 
 *  - tanhdp_i
 *  - tanhdp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports both big and little endian modes. 
 *  
 */

double tanhdp_c (double a);
double tanhdp (double a);

/** @} */

#endif /* C674_TANHDP_H_ */

/* ======================================================================== */
/*  End of file: tanhdp.h                                                   */
/* ======================================================================== */

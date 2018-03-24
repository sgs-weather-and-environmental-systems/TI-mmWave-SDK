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
/* atan2dp.h - double precision floating point arctangent two arguments    */
/*              optimized hand ASM single sample                           */ 
/*                                                                         */
/* ======================================================================= */

#ifndef C674_ATAN2DP_H_
#define C674_ATAN2DP_H_ 1

/** @defgroup atan2dp */
/** @ingroup  atan2dp */
/* @{ */

/**
 * @par Description:
 *    The atan2dp function returns the arc tangent of a floating-point argument a/b. 
 *    The return value is an angle in the range [-PI/2, PI/2] radians.
 * @par 
 * 	  @param[in] a = Input double 
 * 	  @param[in] b = Input double 
 * @par 
 * 	  @return Resultant double 
 * 
 *
 * @par Special Cases:
 *  - If a or b is NaN (Not a Number), the return value may be random.
 *  - If | a/b | < 1.49e-8, then the return value is a/b for small angles. 
 *
 *
 * @sa 
 *  - atan2dp_i
 *  - atan2dp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports little endian mode. 
 *  
 */

double atan2dp   (double a, double b);
double atan2dp_c (double a, double b);

/** @} */
 
#endif /* C674_ATAN2DP_H_ */

/* ======================================================================== */
/*  End of file: atan2dp.h                                                  */
/* ======================================================================== */

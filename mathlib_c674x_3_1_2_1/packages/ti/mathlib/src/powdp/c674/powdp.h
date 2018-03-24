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
/* powdp.h - double Precision power                                        */
/* ======================================================================= */

#ifndef C674_POWDP_H_
#define C674_POWDP_H_ 1

/** @defgroup powdp */
/** @ingroup  powdp */
/* @{ */

/**
 * @par Description:
 *    The powdp function returns the a power of b function. The return value is 
 *    the number a^b.
 * @par 
 * 	  @param[in] a = Input double Base
 * 	  @param[in] b = Input double Power
 * @par 
 * 	  @return Resultant double 
 * 
 *
 * @par Special Cases:
 *  - If a or b is NaN (Not a Number), the return value may be random.
 *  - If a < 0, and b is not an integer value, then NaN is returned.               
 *  - If a = 0, and b < 0, return value is 0 for Asm, Infinity for C/Inline/Vector.
 *  - If |a| = Inf, b < 0, return value is Inf for Asm, 0 for C/Inline/Vector.
 *
 *
 * @sa 
 *  - powdp_i
 *  - powdp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports little endian mode. 
 *  
 */

double powdp   (double a, double b);
double powdp_c (double a, double b);

/** @} */

#endif /* C674_POWDP_H_ */

/* ======================================================================= */
/*  End of file: powdp.h                                                   */
/* ======================================================================= */

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
/* powsp.h - Single Precision power function                               */
/* ======================================================================= */

#ifndef C674_POWSP_H_
#define C674_POWSP_H_ 1

/** @defgroup powsp */
/** @ingroup  powsp */
/* @{ */

/**
 * @par Description:
 *    The powsp function returns the a power of b function. The return value is 
 *    the number a^b.
 * @par 
 * 	  @param[in] a = Input float Base
 * 	  @param[in] b = Input float Power
 * @par 
 * 	  @return Resultant float 
 * 
 *
 * @par Special Cases:
 *  - If a or b is NaN (Not a Number), the return value may be random.
 *  - If b = 0, return 1.0 (a is ignored).
 *  - If a < 0, and b is not an integer value, then NaN is returned.               
 *  - If a = 0, and b < 0, return value is 0 for Asm, Infinity for C/Inline/Vector.
 *  - If |a| = Inf, b < 0, return value is Inf for Asm, 0 for C/Inline/Vector.
 *  - If a = b = 1.175494351E-38, return value is 0 for Asm, 1 for C/Inline/Vector.
 *
 *
 * @sa 
 *  - powsp_i
 *  - powsp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports little endian mode. 
 *  
 */

float powsp   (float a, float b);
float powsp_c (float a, float b);

/** @} */

#endif /* C674_POWSP_H_ */

/* ======================================================================= */
/*  End of file: powsp.h                                                   */
/* ======================================================================= */

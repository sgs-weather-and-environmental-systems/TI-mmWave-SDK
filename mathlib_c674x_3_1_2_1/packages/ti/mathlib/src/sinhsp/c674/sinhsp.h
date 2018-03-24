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
/* sinhsp.h - Single Precision Hyperbolic Sine                             */
/* ======================================================================= */

#ifndef C674_SINHSP_H_
#define C674_SINHSP_H_ 1

/** @defgroup sinhsp */
/** @ingroup  sinhsp */
/* @{ */

/**
 * @par Description:
 *    The sinhsp function returns the hyperbolic sine of a real floating-point
 *    argument a. If the magnitude of a is too large, infinity is returned.
 *    
 *
 * @par 
 * 	  @param[in] a = Input float 
 * @par 
 * 	  @return Resultant float 
 * 
 *
 * @par Special Cases:
 *  - If a > +89.41598629, then the return value is INF (infinity).
 *  - If a < -89.41598629, then the return value is -INF.
 *  - If a is NaN, the return value is NaN.
 *
 * @sa 
 *  - sinhsp_i
 *  - sinhsp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports both big and little endian modes. 
 *  
 */

float sinhsp_c (float a);
float sinhsp (float a);

/** @} */

#endif /* C674_SINHSP_H_ */

/* ======================================================================== */
/*  End of file: sinhsp.h                                                   */
/* ======================================================================== */

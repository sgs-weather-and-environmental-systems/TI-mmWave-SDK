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
/* acoshsp.h - Single Precision Inverse Hyperbolic Cosine                  */
/* ======================================================================= */

#ifndef C674_ACOSHSP_H_
#define C674_ACOSHSP_H_ 1

/** @defgroup acoshsp */
/** @ingroup  acoshsp */
/* @{ */

/**
 * @par Description:
 *    The acoshsp function returns the inverse hyperbolic cosine function
 *    of a real floating-point argument a. For inputs smaller than 1
 *    the return value is NaN (Not a Number).
 *
 * @par 
 *    @param[in] a = Input float 
 * @par 
 *    @return Resultant float 
 * 
 *
 * @par Special Cases:
 *  - If a is greater than 3.402823e+38, the return value is 89.41599.
 *  - If a is smaller than 1.0, the return value is 0, the real
 *    part of the answer.
 *  - If a is NaN (Not a Number), the return value is NaN.
 *
 * @sa 
 *  - acoshsp_i
 *  - acoshsp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports both big and little endian modes. 
 *  
 */

float acoshsp_c (float a);
float acoshsp (float a);

/** @} */

#endif /* C674_ACOSHSP_H_ */

/* ======================================================================= */
/*  End of file: acoshsp.h                                                 */
/* ======================================================================= */

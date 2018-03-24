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
/* log10sp.h - single Precision log Base 10                                */
/* ======================================================================= */

#ifndef C674_LOG10SP_H_
#define C674_LOG10SP_H_ 1

/** @defgroup log10sp */
/** @ingroup  log10sp */
/* @{ */

/**
 * @par Description:
 *    The log10sp function returns the logarithm function of a real 
 *    floating-point argument a.  The return value is the base 10 logarithmic 
 *    value of a.
 * @par 
 * 	  @param[in] a = Input float 
 * @par 
 * 	  @return Resultant float 
 * 
 *
 * @par Special Cases:
 *  - If a is Inf, the return value is 38.65221 (Asm) or 308.2547 (C/Inline/Vector).
 *
 *
 * @sa 
 *  - log10sp_i
 *  - log10sp_v
 *
 *
 * @par Implementation Notes:
 *  - The code supports little endian mode. 
 *  
 */

float log10sp   (float a);
float log10sp_c (float a);

/** @} */

#endif /* C674_LOG10SP_H_ */

/* ======================================================================== */
/*  End of file: log10sp.h                                                  */
/* ======================================================================== */

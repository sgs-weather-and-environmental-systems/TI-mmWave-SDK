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
/* drvdp.h - double precision floating point test utilities                */
/* ======================================================================= */

#ifndef DRVDP_H_
#define DRVDP_H_ 1

#include <ti/mathlib/src/common/driver.h>

/* Speical Cases */
extern double a_ext[];
extern double b_ext[];
extern double a_sc[];
extern double b_sc[];

/* Global output array pointers */
extern double * restrict output[MTH_NUM_OUTPUT];
extern double * restrict input[MTH_NUM_INPUT];


/* Prototypes */
extern double gimme_random (double range, double offset);
extern int    isequal      (double *arg1, double *arg2, int size, double tol, int flags);

/* Inlines */
static inline void allequal (int size, double tol, int req_flags)
{

  /* Check each function against the RTS results */
  fcn_pass[MTH_FCN_ASM] = isequal (output[MTH_FCN_RTS], output[MTH_FCN_ASM], size, tol, req_flags);
  fcn_pass[MTH_FCN_CI]  = isequal (output[MTH_FCN_RTS], output[MTH_FCN_CI],  size, tol, req_flags);
  fcn_pass[MTH_FCN_INL] = isequal (output[MTH_FCN_RTS], output[MTH_FCN_INL], size, tol, req_flags);
  fcn_pass[MTH_FCN_VEC] = isequal (output[MTH_FCN_RTS], output[MTH_FCN_VEC], size, tol, req_flags);

  /* Check for overall pass */ 
  all_pass = (fcn_pass[MTH_FCN_ASM] && fcn_pass[MTH_FCN_CI] &&
              fcn_pass[MTH_FCN_INL] && fcn_pass[MTH_FCN_VEC]);
}


#endif /* DRVDP_H_ */

/* ======================================================================== */
/*  End of file: drvdp.h                                                   */
/* ======================================================================== */

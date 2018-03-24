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
/* recipsp_d.h - reciprocal driver file                                    */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "recipsp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*100.0)
#define RAND_OFFSET  ( -100.0)

/*  Number of input arguments */
#define NUM_INPUTS      (10)
#define NUM_SC_INPUTS    (6)
#define NUM_EXT_INPUTS (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-6)

/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "recipSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = 
{
/*  0 - 4 */  -63.0603053, -87.6082469, -57.9469051,  53.5011070, -77.4541769, 
/*  5 - 9 */   22.4425800,  55.8633504,  54.7249100, -42.7507792,  62.2860960,
};


/* ======================================================================== */
/*  Main test driver                                                        */
/* ======================================================================== */

void main()
{
  int i;  

  /* ======================================================================== */
  /*  INITIALIZATION                                                          */
  /* ======================================================================== */

  /* Initialize the driver */
  driver_init (KERNEL_NAME);


  /* ======================================================================== */
  /*  PREDEFINED TEST DATA                                                    */
  /* ======================================================================== */

  /* Obtain results using predefined test vectors */
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = (1.0 / a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = recipsp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = recipsp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = recipsp_i (a[i]);
  }
  recipsp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = 0;
  a_sc[1] = _itof(0x80000000);
  a_sc[2] = _itof(0x7F800000);
  a_sc[3] = _itof(0xFF800000);
  a_sc[4] = 1;
  a_sc[5] = -1;
  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = 1.0 / a_sc[i];
    output[MTH_FCN_ASM][i] = recipsp (a_sc[i]);
    output[MTH_FCN_CI] [i] = recipsp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = recipsp_i (a_sc[i]);
  }
  recipsp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = 1.0 / a_ext[i];
    output[MTH_FCN_ASM][i] = recipsp (a_ext[i]);
    output[MTH_FCN_CI] [i] = recipsp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = recipsp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  recipsp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  allequal (NUM_EXT_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_EXTENDED);

  /* ======================================================================== */
  /*  RANDOM TEST DATA & PROFILING                                            */
  /* ======================================================================== */

  // Time the fastRTS inline function
  profile_init (MTH_FCN_INL);
  for (i = 0; i < BUF_SIZE; i++) {
    /* Fill input random data vector */
    input[0][i] = gimme_random (RAND_RANGE, RAND_OFFSET);
    
    /* Run the inline routine */
    profile_start ();
    output[MTH_FCN_INL][i] = recipsp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = (1.0 / input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = recipsp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = recipsp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  recipsp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
  profile_update (MTH_FCN_VEC);
  profile_avg    (MTH_FCN_VEC, BUF_SIZE);

  /* Display Random Test Vector Results */
  allequal (BUF_SIZE, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_RANDOM);
  print_hline ();
  
  /* ======================================================================== */
  /*  CYCLE AND MEMORY REQUIREMENTS                                           */
  /* ======================================================================== */

  /* Display profiling results */
  print_profile_results (KERNEL_NAME);

  /* Display memory requirements */
  print_memory_results (KERNEL_NAME);
}

/* ======================================================================== */
/*  End of file: recipsp_d.c                                                */
/* ======================================================================== */

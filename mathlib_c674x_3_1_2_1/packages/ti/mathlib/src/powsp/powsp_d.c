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
/* powsp_d.c - single precision floating point raise to power driver file  */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "powsp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*10.0)
#define RAND_OFFSET  ( -10.0)

/*  Number of input arguments */
#define NUM_INPUTS      (100)
#define NUM_SC_INPUTS     (6)
#define NUM_EXT_INPUTS  (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL    (1e-4)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "powSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT | MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = {
/*   0 -  09 */ -6.2674615, -8.9541214, 9.0147413,  8.3288975,  1.7458942,  7.2526186, -0.5334484, -1.2066532, -3.3643183, -0.3106860,
/*  10 -  19 */ -8.6991514,  9.2646808, 3.1734357,  7.0393559, -8.8414850, -9.6651444, -9.5849543, -8.1961269, -9.4892508, -3.1185971,
/*  20 -  29 */ -7.9086205,  1.2358813, 5.0358955,  8.1428017,  5.7495188,  6.6389807, -5.2255332,  7.9568324, -6.0753700,  3.9139295,
/*  30 -  39 */  4.2869274,  4.2094146, 3.2018657, -6.5182520,  2.2615400,  9.3076435,  4.4501136, -0.2665339,  1.9059056,  0.1761222,
/*  40 -  49 */ -6.8624408, -8.2630656, 0.7897965, -2.0531010,  9.0933412,  2.7662245,  1.0813660,  8.1138917, -3.6459533, -9.3077361,
/*  50 -  59 */  8.7631509,  0.5344139, 3.5528103, -2.4849990, -5.1148819,  9.5848076,  3.4514799,  9.7528021, -5.8443213, -6.1514362,
/*  60 -  69 */ -6.5903261, -1.7913028, 6.2719355, -3.4173759, -5.0073741, -1.8727676, -4.9415105,  4.9397934, -5.8713388,  9.2716791,
/*  70 -  79 */  8.5473888, -9.0961979, 1.3435668, -4.6225238, -0.4762142, -9.4132132, -8.5528224,  4.8550296,  4.7446843,  4.3852377,
/*  80 -  89 */  3.3786530, -9.4440308, 5.5648588, -2.5506419,  0.8302576,  9.4603231,  7.7793777, -1.0197528, -8.3782565,  3.2237184,
/*  90 -  99 */  1.4679760,  2.5405675, 7.9368739, -2.5263722,  0.9181350,  6.2907450,  6.5559545,  2.5909355,  5.0907913, -7.3235199,
};

float b [NUM_INPUTS] = {
/*   0 -  09 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0, 
/*  10 -  19 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0,
/*  20 -  29 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0, 
/*  30 -  39 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0,
/*  40 -  49 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0, 
/*  50 -  59 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0,
/*  60 -  69 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0, 
/*  70 -  79 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0,
/*  80 -  89 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0, 
/*  90 -  99 */ 25.0, 24.0, 25.0, -25.0, 0.0, 25.0, 25.0, 25.0, 25.0, 25.0,
};


/* ======================================================================== */
/*  Main test driver                                                        */
/* ======================================================================== */

void main()
{
  int i, j, k;  

    
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
    output[MTH_FCN_RTS][i] = powf (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = powsp (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = powsp_c (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = powsp_i (a[i],b[i]);
  }
  powsp_v (a, b, output[MTH_FCN_VEC], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = b_sc[0] = 0;
  a_sc[1] = b_sc[1] = _itof(0x80000000);
  a_sc[2] = b_sc[2] = _itof(0x7F800000);
  a_sc[3] = b_sc[3] = _itof(0xFF800000);
  a_sc[4] = b_sc[4] = 1;
  a_sc[5] = b_sc[5] = -1;
  i = NUM_SC_INPUTS;
  for (j = 1; j < NUM_SC_INPUTS ; j++) {
    for (k = 0; k < NUM_SC_INPUTS ; k++) {
      a_sc[i] = a_sc[k];
      b_sc[i] = b_sc[(j+k)%NUM_SC_INPUTS];
      i++;
    }
  }
  i = 0;
  for (j = 0; j < NUM_SC_INPUTS ; j++) {
    for (k = 0; k < NUM_SC_INPUTS ; k++) {
      output[MTH_FCN_RTS][i] = pow (a_sc[i],b_sc[i]);
      output[MTH_FCN_ASM][i] = (b_sc[i] > 1.175494351E-38) ? powsp(a_sc[i],b_sc[i]) : pow(a_sc[i],b_sc[i]);     // ignore Asm result when b is negative */
      output[MTH_FCN_CI] [i] = powsp_c (a_sc[i],b_sc[i]);
      output[MTH_FCN_INL][i] = powsp_i (a_sc[i],b_sc[i]);
      i++;
    }
  }
  powsp_v (a_sc, b_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS*NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS*NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  b_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = pow (a_ext[i],b_ext[i]);
    output[MTH_FCN_ASM][i] = (b_ext[i] > 1.175494351E-38) ? powsp(a_ext[i],b_ext[i]) : pow(a_ext[i],b_ext[i]);  // ignore Asm result when b is negative */
    output[MTH_FCN_CI] [i] = powsp_c (a_ext[i],b_ext[i]);
    output[MTH_FCN_INL][i] = powsp_i (a_ext[i],b_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
    b_ext[i+1] = b_ext[i] * (-1.5);
  }
  powsp_v (a_ext, b_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  allequal (NUM_EXT_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_EXTENDED);

  /* ======================================================================== */
  /*  RANDOM TEST DATA & PROFILING                                            */
  /* ======================================================================== */

  // Time the fastRTS inline function
  profile_init (MTH_FCN_INL);
  for (i = 0; i < BUF_SIZE; i++) {
    /* Fill input random data vectors */
    input[0][i] = gimme_random (RAND_RANGE, RAND_OFFSET);
    input[1][i] = gimme_random (RAND_RANGE, RAND_OFFSET);
    
    /* Run the inline routine */
    profile_start ();
    output[MTH_FCN_INL][i] = powsp_i (input[0][i],input[1][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = powf (input[0][i],input[1][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = powsp (input[0][i],input[1][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = powsp_c (input[0][i],input[1][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  powsp_v (input[0], input[1], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: powsp_d.c                                                  */
/* ======================================================================== */



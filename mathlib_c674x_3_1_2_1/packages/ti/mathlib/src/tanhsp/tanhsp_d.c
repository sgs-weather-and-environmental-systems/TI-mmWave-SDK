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
/* tanhsp_d.h - tanh driver file                                           */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "tanhsp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*10.0)
#define RAND_OFFSET  ( -10.0)

/*  Number of input arguments */
#define NUM_INPUTS     (201)
#define NUM_SC_INPUTS    (8)
#define NUM_EXT_INPUTS (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-6)

/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "tanhSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = 
{
/*   0 -  09 */ -1.192093e-07, 1.304627e-07,  -1.427783e-07, 1.562566e-07,  -1.710072e-07, 1.871503e-07,  -2.048173e-07, 2.241520e-07,  -2.453120e-07, 2.684694e-07,
/*  10 -  19 */ -2.938129e-07, 3.215489e-07,  -3.519031e-07, 3.851228e-07,  -4.214783e-07, 4.612659e-07,  -5.048094e-07, 5.524634e-07,  -6.046160e-07, 6.616917e-07,
/*  20 -  29 */ -7.241554e-07, 7.925157e-07,  -8.673292e-07, 9.492051e-07,  -1.038810e-06, 1.136874e-06,  -1.244195e-06, 1.361646e-06,  -1.490186e-06, 1.630860e-06,
/*  30 -  39 */ -1.784813e-06, 1.953299e-06,  -2.137690e-06, 2.339488e-06,  -2.560336e-06, 2.802032e-06,  -3.066544e-06, 3.356025e-06,  -3.672834e-06, 4.019550e-06,
/*  40 -  49 */ -4.398995e-06, 4.814260e-06,  -5.268726e-06, 5.766094e-06,  -6.310413e-06, 6.906117e-06,  -7.558054e-06, 8.271534e-06,  -9.052367e-06, 9.906910e-06,
/*  50 -  59 */ -1.084212e-05, 1.186562e-05,  -1.298573e-05, 1.421159e-05,  -1.555316e-05, 1.702138e-05,  -1.862820e-05, 2.038670e-05,  -2.231120e-05, 2.441738e-05,
/*  60 -  69 */ -2.672238e-05, 2.924497e-05,  -3.200570e-05, 3.502704e-05,  -3.833359e-05, 4.195228e-05,  -4.591258e-05, 5.024672e-05,  -5.499001e-05, 6.018107e-05,
/*  70 -  79 */ -6.586216e-05, 7.207955e-05,  -7.888387e-05, 8.633050e-05,  -9.448010e-05, 0.0001033990,  -0.0001131599, 0.0001238422,  -0.0001355329, 0.0001483272,
/*  80 -  89 */ -0.0001623293, 0.0001776532,  -0.0001944236, 0.0002127772,  -0.0002328634, 0.0002548457,  -0.0002789031, 0.0003052316,  -0.0003340454, 0.0003655793,
/*  90 -  99 */ -0.0004000900, 0.0004378585,  -0.0004791923, 0.0005244281,  -0.0005739341, 0.0006281135,  -0.0006874074, 0.0007522986,  -0.0008233156, 0.0009010367,
/* 100 - 109 */ -0.0009860945, 0.001079182,   -0.001181057,  0.001292548,   -0.001414565,  0.001548100,   -0.001694240,  0.001854177,   -0.002029211,  0.002220768,
/* 110 - 119 */ -0.002430409,  0.002659840,   -0.002910929,  0.003185720,   -0.003486452,  0.003815573,   -0.004175764,  0.004569956,   -0.005001359,  0.005473488,
/* 120 - 129 */ -0.005990185,  0.006555658,   -0.007174512,  0.007851786,   -0.008592995,  0.009404174,   -0.01029193,   0.01126349,    -0.01232676,   0.01349040,
/* 130 - 139 */ -0.01476390,   0.01615761,    -0.01768289,   0.01935215,    -0.02117900,   0.02317830,    -0.02536633,   0.02776091,    -0.03038154,   0.03324955,
/* 140 - 149 */ -0.03638831,   0.03982337,    -0.04358270,   0.04769690,    -0.05219949,   0.05712712,    -0.06251992,   0.06842180,    -0.07488082,   0.08194957,
/* 150 - 159 */ -0.08968561,   0.09815193,    -0.1074175,    0.1175577,     -0.1286551,    0.1408002,     -0.1540917,    0.1686380,     -0.1845574,    0.2019796,
/* 160 - 169 */ -0.2210465,    0.2419133,     -0.2647499,    0.2897423,     -0.3170939,    0.3470276,     -0.3797870,    0.4156389,     -0.4548752,    0.4978154,
/* 170 - 179 */ -0.5448092,    0.5962392,     -0.6525242,    0.7141225,     -0.7815356,    0.8553126,     -0.9360541,    1.024418,      -1.121123,     1.226957,
/* 180 - 189 */ -1.342781,     1.469540,      -1.608264,     1.760085,      -1.926237,     2.108073,      -2.307076,     2.524863,      -2.763211,     3.024058,
/* 190 - 199 */ -3.309529,     3.621948,      -3.963860,     4.338048,      -4.747560,     5.195730,      -5.686207,     6.222984,      -6.810434,     7.453339,
/* 200 - 200 */ -8.156935,
};

/* This function saves the given data - vector to the specified file*/
/*
void save_output(float * output, int size)
{
  int i;
  FILE * out = fopen("../tanhsp_output.dat","w");

  for (i = 0; i < size; i++) {
    fprintf(out,"%.7e\n",output[i]);
  }
  fclose(out);
}
*/

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
    output[MTH_FCN_RTS][i] = tanhf (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = tanhsp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = tanhsp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = tanhsp_i (a[i]);
  }
  tanhsp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

//  save_output(output[MTH_FCN_INL], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = 0;
  a_sc[1] = _itof(0x80000000);            /* -0.0 */
  a_sc[2] = _itof(0x7F800000);            /* INF */
  a_sc[3] = _itof(0xFF800000);            /* -INF */
  a_sc[4] = 1;
  a_sc[5] = -1;
  a_sc[6] = _itof(0x7FFFFFFF);            /* NaN */
  a_sc[7] = _itof(0xFFFFFFFF);            /* -NaN */

  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = tanhf (a_sc[i]);
    output[MTH_FCN_ASM][i] = tanhsp (a_sc[i]);
    output[MTH_FCN_CI] [i] = tanhsp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = tanhsp_i (a_sc[i]);
  }
  tanhsp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = tanhf (a_ext[i]);
    output[MTH_FCN_ASM][i] = tanhsp (a_ext[i]);
    output[MTH_FCN_CI] [i] = tanhsp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = tanhsp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  tanhsp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = tanhsp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = tanhf (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = tanhsp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = tanhsp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  tanhsp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: tanhsp_d.h                                                 */
/* ======================================================================== */

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
/* tansp_d.h - Tangent driver file                                         */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "tansp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*MTH_TWO_PI)
#define RAND_OFFSET  ( -MTH_TWO_PI)

/*  Number of input arguments */
#define NUM_INPUTS      (180)
#define NUM_SC_INPUTS     (8)
#define NUM_EXT_INPUTS  (129)

/* Floating Point Tolerances */
#define RET_VAL_TOL    (1e-4)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "tanSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = 
{
/*   0 -  09 */  -0.0002000000,  0.0002235000,  -0.0002497612, 0.0002791082,  -0.0003119034, 0.0003485521,  -0.0003895069, 0.0004352740,  -0.0004864187, 0.0005435729,
/*  10 -  19 */  -0.0006074427,  0.0006788172,  -0.0007585782, 0.0008477112,  -0.0009473172, 0.001058627, -0.001183016,  0.001322020, -0.001477357,  0.001650947,
/*  20 -  29 */  -0.001844933, 0.002061713, -0.002303964,  0.002574680, -0.002877205,  0.003215276, -0.003593071,  0.004015257, -0.004487050,  0.005014278,
/*  30 -  39 */  -0.005603456, 0.006261862, -0.006997630,  0.007819852, -0.008738684,  0.009765481, -0.01091292, 0.01219519,  -0.01362813, 0.01522943,
/*  40 -  49 */  -0.01701889,  0.01901861,  -0.02125330, 0.02375056,  -0.02654125, 0.02965985,  -0.03314488, 0.03703940,  -0.04139153, 0.04625504,
/*  50 -  59 */  -0.05169000,  0.05776358,  -0.06455080, 0.07213552,  -0.08061145, 0.09008329,  -0.1006681,  0.1124966, -0.1257149,  0.1404864,
/*  60 -  69 */  -0.1569936, 0.1754403, -0.1960546,  0.2190910, -0.2448342,  0.2736022, -0.3057504,  0.3416761, -0.3818231,  0.4266873,
/*  70 -  79 */  -0.4768230, 0.5328497, -0.5954596,  0.6654261, -0.7436137,  0.8309882, -0.9286293,  1.037743,  -1.159678, 1.295940,
/*  80 -  89 */  -1.448213,  1.618378,  -1.808538, 2.021041,  -2.258513, 2.523889,  -2.820446, 3.151848,  -3.522190, 3.936048,
/*  90 -  99 */  -4.398533,  4.915360,  -5.492916, 6.138333,  -6.859587, 7.665589,  -8.566296, 9.572835,  -10.69764, 11.95462,
/* 100 - 109 */  -13.35928,  14.92900,  -16.68316, 18.64343,  -20.83403, 23.28203,  -26.01767, 29.07474,  -32.49103, 36.30872,
/* 110 - 119 */  -40.57500,  45.34256,  -50.67031, 56.62407,  -63.27740, 70.71249,  -79.02121, 88.30621,  -98.68218, 110.2773,
/* 120 - 129 */  -123.2349,  137.7150,  -153.8965, 171.9794,  -192.1870, 214.7689,  -240.0043, 268.2048,  -299.7188, 334.9358,
/* 130 - 139 */  -374.2908,  418.2700,  -467.4167, 522.3381,  -583.7128, 652.2991,  -728.9443, 814.5952,  -910.3101, 1017.272,
/* 140 - 149 */  -1136.801,  1270.375,  -1419.644, 1586.452,  -1772.861, 1981.172,  -2213.959, 2474.100,  -2764.806, 3089.671,
/* 150 - 159 */  -3452.707,  3858.400,  -4311.763, 4818.395,  -5384.556, 6017.241,  -6724.267, 7514.369,  -8397.307, 9383.990,
/* 160 - 169 */  -10486.61,  11718.79,  -13095.74, 14634.49,  -16354.05, 18275.65,  -20423.04, 22822.74,  -25504.41, 28501.18,
/* 170 - 179 */  -31850.07,  35592.45,  -39774.57, 44448.08,  -49670.73, 55507.04,  -62029.12, 69317.54,  -77462.35, 86564.17
};

/* This function saves the result obtained from predefined data to the specified file*/
/*
void save_output(float * output, int size)
{
  int i;
  FILE * out = fopen("../tansp_output.dat","w");

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
    output[MTH_FCN_RTS][i] = tanf (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = tansp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = tansp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = tansp_i (a[i]);
  }
  tansp_v(a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = tanf (a_sc[i]);
    output[MTH_FCN_ASM][i] = tansp (a_sc[i]);
    output[MTH_FCN_CI] [i] = tansp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = tansp_i (a_sc[i]);
  }
  tansp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = tanf (a_ext[i]);
    output[MTH_FCN_ASM][i] = tansp (a_ext[i]);
    output[MTH_FCN_CI] [i] = tansp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = tansp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  tansp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = tansp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = tanf (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = tansp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = tansp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  tansp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: tansp_d.c                                                  */
/* ======================================================================== */


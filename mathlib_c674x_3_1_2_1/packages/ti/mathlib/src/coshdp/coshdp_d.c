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
/* coshdp_d.h - Hyperbolic cosine driver file                              */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "coshdp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*710.0)
#define RAND_OFFSET  ( -710.0)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (8)
#define NUM_EXT_INPUTS (965)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-11)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "coshDP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT|MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = 
{
/*   0 -  09 */ -2.220446e-16,  2.744767e-16,  -3.392897e-16, 4.194072e-16,  -5.184431e-16, 6.408647e-16,  -7.921940e-16, 9.792572e-16,  -1.210492e-15, 1.496329e-15,
/*  10 -  19 */ -1.849662e-15,  2.286429e-15,  -2.826330e-15, 3.493720e-15,  -4.318703e-15, 5.338491e-15,  -6.599085e-15, 8.157347e-15,  -1.008357e-14, 1.246463e-14,
/*  20 -  29 */ -1.540794e-14,  1.904627e-14,  -2.354372e-14, 2.910317e-14,  -3.597539e-14, 4.447037e-14,  -5.497129e-14, 6.795183e-14,  -8.399750e-14, 1.038321e-13,
/*  30 -  39 */ -1.283503e-13,  1.586580e-13,  -1.961224e-13, 2.424334e-13,  -2.996800e-13, 3.704443e-13,  -4.579184e-13, 5.660481e-13,  -6.997108e-13, 8.649356e-13,
/*  40 -  49 */ -1.069175e-12,  1.321643e-12,  -1.633727e-12, 2.019504e-12,  -2.496375e-12, 3.085852e-12,  -3.814524e-12, 4.715259e-12,  -5.828687e-12, 7.205033e-12,
/*  50 -  59 */ -8.906379e-12,  1.100947e-11,  -1.360917e-11, 1.682274e-11,  -2.079515e-11, 2.570557e-11,  -3.177551e-11, 3.927876e-11,  -4.855377e-11, 6.001892e-11,
/*  60 -  69 */ -7.419137e-11,  9.171040e-11,  -1.133663e-10, 1.401358e-10,  -1.732265e-10, 2.141310e-10,  -2.646944e-10, 3.271975e-10,  -4.044596e-10, 4.999659e-10,
/*  70 -  79 */ -6.180244e-10,  7.639603e-10,  -9.443566e-10, 1.167350e-09,  -1.443000e-09, 1.783740e-09,  -2.204941e-09, 2.725600e-09,  -3.369204e-09, 4.164785e-09,
/*  80 -  89 */ -5.148228e-09,  6.363895e-09,  -7.866621e-09, 9.724190e-09,  -1.202039e-08, 1.485880e-08,  -1.836746e-08, 2.270462e-08,  -2.806594e-08, 3.469323e-08,
/*  90 -  99 */ -4.288545e-08,  5.301212e-08,  -6.553004e-08, 8.100385e-08,  -1.001315e-07, 1.237759e-07,  -1.530035e-07, 1.891326e-07,  -2.337931e-07, 2.889994e-07,
/* 100 - 109 */ -3.572417e-07,  4.415983e-07,  -5.458742e-07, 6.747732e-07,  -8.341095e-07, 1.031070e-06,  -1.274540e-06, 1.575501e-06,  -1.947529e-06, 2.407405e-06,
/* 110 - 119 */ -2.975873e-06,  3.678575e-06,  -4.547208e-06, 5.620954e-06,  -6.948247e-06, 8.588958e-06,  -1.061709e-05, 1.312414e-05,  -1.622318e-05, 2.005401e-05,
/* 120 - 129 */ -2.478943e-05,  3.064303e-05,  -3.787887e-05, 4.682332e-05,  -5.787985e-05, 7.154720e-05,  -8.844186e-05, 0.0001093259,  -0.0001351414, 0.0001670527,
/* 130 - 139 */ -0.0002064994,  0.0002552607,  -0.0003155362, 0.0003900447,  -0.0004821472, 0.0005959981,  -0.0007367329, 0.0009106999,  -0.001125746,  0.001391572,
/* 140 - 149 */ -0.001720168,   0.002126357,   -0.002628460,  0.003249126,   -0.004016352,  0.004964746,   -0.006137087,  0.007586256,   -0.009377621,  0.01159199,
/* 150 - 159 */ -0.01432924,    0.01771285,    -0.02189543,   0.02706567,    -0.03345677,   0.04135702,    -0.05112278,   0.06319456,    -0.07811688,   0.09656285,
/* 160 - 169 */ -0.1193645,     0.1475504,     -0.1823920,    0.2254608,     -0.2786995,    0.3445097,     -0.4258598,    0.5264194,     -0.6507244,    0.8043819,
/* 170 - 179 */ -0.9943231,     1.229116,      -1.519350,     1.878119,      -2.321605,     2.869813,      -3.547471,     4.385146,      -5.420624,     6.700613,
/* 180 - 189 */ -8.282848,      10.23870,      -12.65640,     15.64499,      -19.33929,     23.90594,      -29.55092,     36.52887,      -45.15454,     55.81702,
/* 190 - 199 */ -68.99727,      85.28981,      -105.4296,     130.3250,      -161.0990,     199.1398,      -246.1633,     304.2905,      -376.1436,     464.9635,
/* 200 - 200 */ -574.7568,
};

/* This function saves the result obtained from predefined data to the specified file*/
/*
void save_output(double * output, int size)
{
  int i;
  FILE * out = fopen("../coshdp_output.dat","w");

  for (i = 0; i < size; i++) {
    fprintf(out,"%.15e\n",output[i]);
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
    output[MTH_FCN_RTS][i] = cosh (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = coshdp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = coshdp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = coshdp_i (a[i]);
  }
  coshdp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

//  save_output(output[MTH_FCN_INL], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = 0;
  a_sc[1] = _lltod(0x8000000000000000);              /* -0.0 */
  a_sc[2] = _lltod(0x7FF0000000000000);              /* INF */
  a_sc[3] = _lltod(0xFFF0000000000000);              /* -INF */
  a_sc[4] = 1;
  a_sc[5] = -1;
  a_sc[6] = _lltod(0x7FFFFFFFFFFFFFFF);              /* NaN */
  a_sc[7] = _lltod(0xFFFFFFFFFFFFFFFF);              /* -NaN */

  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = cosh (a_sc[i]);
    output[MTH_FCN_ASM][i] = coshdp (a_sc[i]);
    output[MTH_FCN_CI] [i] = coshdp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = coshdp_i (a_sc[i]);
  }
  coshdp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = cosh (a_ext[i]);
    output[MTH_FCN_ASM][i] = coshdp (a_ext[i]);
    output[MTH_FCN_CI] [i] = coshdp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = coshdp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  coshdp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = coshdp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = cosh (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = coshdp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = coshdp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  coshdp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: coshdp_d.c                                                 */
/* ======================================================================== */

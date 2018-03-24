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
/* expdp_d.h - exponential driver file                                     */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "expdp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*710.0)
#define RAND_OFFSET  ( -710.0)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (8)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-11)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "expDP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT|MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = 
{
/*   0 -  09 */ -2.220446e-16,  3.522388,  -7.044776,  10.56716,  -14.08955,  17.61194,  -21.13433,  24.65672,  -28.17910,  31.70149,
/*  10 -  19 */ -35.22388,  38.74627,  -42.26866,  45.79105,  -49.31343,  52.83582,  -56.35821,  59.88060,  -63.40298, 66.92538,
/*  20 -  29 */ -70.44776,  73.97015,  -77.49254,  81.01492,  -84.53732,  88.05970,  -91.58209,  95.10448,  -98.62687, 102.1493,
/*  30 -  39 */ -105.6716,  109.1940,  -112.7164,  116.2388,  -119.7612,  123.2836,  -126.8060,  130.3284,  -133.8508, 137.3731,
/*  40 -  49 */ -140.8955,  144.4179,  -147.9403,  151.4627,  -154.9851,  158.5075,  -162.0298,  165.5522,  -169.0746, 172.5970,
/*  50 -  59 */ -176.1194,  179.6418,  -183.1642,  186.6866,  -190.2090,  193.7313,  -197.2537,  200.7761,  -204.2985, 207.8209,
/*  60 -  69 */ -211.3433,  214.8657,  -218.3881,  221.9104,  -225.4328,  228.9552,  -232.4776,  236.0002,  -239.5224, 243.0448,
/*  70 -  79 */ -246.5672,  250.0896,  -253.6119,  257.1343,  -260.6567,  264.1791,  -267.7015,  271.2239,  -274.7463, 278.2686,
/*  80 -  89 */ -281.7910,  285.3134,  -288.8358,  292.3582,  -295.8806,  299.4030,  -302.9254,  306.4478,  -309.9702, 313.4925,
/*  90 -  99 */ -317.0149,  320.5373,  -324.0597,  327.5821,  -331.1045,  334.6269,  -338.1493,  341.6716,  -345.1940, 348.7164,
/* 100 - 109 */ -352.2388,  355.7612,  -359.2836,  362.8060,  -366.3284,  369.8507,  -373.3731,  376.8955,  -380.4179, 383.9403,
/* 110 - 119 */ -387.4627,  390.9851,  -394.5075,  398.0298,  -401.5522,  405.0746,  -408.5970,  412.1194,  -415.6418, 419.1642,
/* 120 - 129 */ -422.6866,  426.2090,  -429.7314,  433.2537,  -436.7761,  440.2985,  -443.8209,  447.3433,  -450.8657, 454.3881,
/* 130 - 139 */ -457.9105,  461.4328,  -464.9552,  468.4776,  -472.2571,  475.5224,  -479.0448,  482.5672,  -486.0895, 489.6119,
/* 140 - 149 */ -493.1343,  496.6567,  -500.1791,  503.7015,  -507.2239,  510.7463,  -514.2687,  517.7910,  -521.3134, 524.8358,
/* 150 - 159 */ -528.3582,  531.8806,  -535.4030,  538.9254,  -542.4478,  545.9702,  -549.4926,  553.0150,  -556.5373, 560.0597,
/* 160 - 169 */ -563.5821,  567.1045,  -570.6269,  574.1492,  -577.6716,  581.1940,  -584.7164,  588.2388,  -591.7612, 595.2836,
/* 170 - 179 */ -598.8060,  602.3284,  -605.8508,  609.3731,  -612.8955,  616.4179,  -619.9403,  623.4627,  -626.9850, 630.5074,
/* 180 - 189 */ -634.0298,  637.5522,  -641.0746,  644.5970,  -648.1194,  651.6418,  -655.1642,  658.6866,  -662.2090, 665.7313,
/* 190 - 199 */ -669.2537,  672.7761,  -676.2985,  679.8209,  -683.3433,  686.8657,  -690.3881,  693.9105,  -697.4329, 700.9552,
/* 200 - 200 */ -704.4776,
};

/* This function saves the result obtained from predefined data to the specified file*/

void save_output(double * output, int size)
{
  int i;
  FILE * out = fopen("../expdp_output.dat","w");

  for (i = 0; i < size; i++) {
    fprintf(out,"%.15e\n",output[i]);
  }
  fclose(out);
}


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
    output[MTH_FCN_RTS][i] = exp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = expdp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = expdp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = expdp_i (a[i]);
  }
  expdp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

  save_output(output[MTH_FCN_INL], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = exp (a_sc[i]);
    output[MTH_FCN_ASM][i] = expdp (a_sc[i]);
    output[MTH_FCN_CI] [i] = expdp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = expdp_i (a_sc[i]);
  }
  expdp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = exp (a_ext[i]);
    output[MTH_FCN_ASM][i] = expdp (a_ext[i]);
    output[MTH_FCN_CI] [i] = expdp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = expdp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  expdp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  allequal (NUM_EXT_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_EXTENDED);

  /* ======================================================================== */
  /*  RANDOM TEST DATA & PROFILING                                            */
  /* ======================================================================== */

  profile_init (MTH_FCN_INL);
  for (i = 0; i < BUF_SIZE; i++) {
    /* Fill input random data vector */
    input[0][i] = gimme_random (RAND_RANGE, RAND_OFFSET);

    /* Run the inline routine */
    profile_start ();
    output[MTH_FCN_INL][i] = expdp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg(MTH_FCN_INL, BUF_SIZE);

  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = exp (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = expdp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = expdp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  expdp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: expdp_d.c                                                  */
/* ======================================================================== */

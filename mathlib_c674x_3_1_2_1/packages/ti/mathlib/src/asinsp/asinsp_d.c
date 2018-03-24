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
/* asinsp_d.h - arc_sine driver file                                       */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "asinsp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (1)
#define RAND_OFFSET  ( -0.5)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (8)
#define NUM_EXT_INPUTS  (215)

/* Floating Point Tolerances */
#define RET_VAL_TOL    (1e-6)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "asinSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = {
/*   0 -  09 */  0.003259781, 0.004975124,  -0.009950249,  0.01492537,  -0.01990050,  0.02487562,  -0.02985075,  0.03482587,  -0.03980099,  0.04477612,
/*  10 -  19 */ -0.04975124,  0.05472637,  -0.05970149, 0.06467662,  -0.06965174,  0.07462686,  -0.07960199,  0.08457711,  -0.08955224,  0.09452736,
/*  20 -  29 */ -0.09950249,  0.1044776,  -0.1094527,  0.1144279,  -0.1194030,  0.1243781,  -0.1293532,  0.1343284,  -0.1393035,  0.1442786,
/*  30 -  39 */ -0.1492537,  0.1542289, -0.1592040,  0.1641791, -0.1691542,  0.1741294, -0.1791045,  0.1840796, -0.1890547,  0.1940299,
/*  40 -  49 */ -0.1990050,  0.2039801, -0.2089552,  0.2139304, -0.2189055,  0.2238806, -0.2288557,  0.2338308, -0.2388060,  0.2437811,
/*  50 -  59 */ -0.2487562,  0.2537313, -0.2587065,  0.2636816, -0.2686567,  0.2736318, -0.2786070,  0.2835821, -0.2885572,  0.2935323,
/*  60 -  69 */ -0.2985075,  0.3034826, -0.3084577,  0.3134328, -0.3184080,  0.3233831, -0.3283582,  0.3333333, -0.3383085,  0.3432836,
/*  70 -  79 */ -0.3482587,  0.3532338, -0.3582090,  0.3631841, -0.3681592,  0.3731343, -0.3781095,  0.3830846, -0.3880597,  0.3930348,
/*  80 -  89 */ -0.3980100,  0.4029851, -0.4079602,  0.4129353, -0.4179105,  0.4228856, -0.4278607,  0.4328358, -0.4378110,  0.4427861,
/*  90 -  99 */ -0.4477612,  0.4527363, -0.4577114,  0.4626866, -0.4676617,  0.4726368, -0.4776119,  0.4825871, -0.4875622,  0.4925373,
/* 100 - 109 */ -0.4975124,  0.5024875, -0.5074627,  0.5124378, -0.5174130,  0.5223880, -0.5273632,  0.5323383, -0.5373135,  0.5422885,
/* 110 - 119 */ -0.5472637,  0.5522388, -0.5572139,  0.5621890, -0.5671642,  0.5721393, -0.5771144,  0.5820895, -0.5870647,  0.5920398,
/* 120 - 129 */ -0.5970149,  0.6019900, -0.6069652,  0.6119403, -0.6169154,  0.6218905, -0.6268657,  0.6318408, -0.6368159,  0.6417910,
/* 130 - 139 */ -0.6467662,  0.6517413, -0.6567164,  0.6616915, -0.6666667,  0.6716418, -0.6766169,  0.6815920, -0.6865672,  0.6915423,
/* 140 - 149 */ -0.6965174,  0.7014925, -0.7064677,  0.7114428, -0.7164179,  0.7213930, -0.7263682,  0.7313433, -0.7363184,  0.7412935,
/* 150 - 159 */ -0.7462686,  0.7512438, -0.7562189,  0.7611941, -0.7661691,  0.7711443, -0.7761194,  0.7810946, -0.7860696,  0.7910448,
/* 160 - 169 */ -0.7960199,  0.8009951, -0.8059701,  0.8109453, -0.8159204,  0.8208955, -0.8258706,  0.8308458, -0.8358209,  0.8407960,
/* 170 - 179 */ -0.8457711,  0.8507463, -0.8557214,  0.8606965, -0.8656716,  0.8706468, -0.8756219,  0.8805970, -0.8855721,  0.8905473,
/* 180 - 189 */ -0.8955224,  0.9004975, -0.9054726,  0.9104478, -0.9154229,  0.9203980, -0.9253731,  0.9303483, -0.9353234,  0.9402985,
/* 190 - 199 */ -0.9452736,  0.9502488, -0.9552239,  0.9601990, -0.9651741,  0.9701493, -0.9751244,  0.9800995, -0.9850746,  0.9900498,
/* 200 - 200 */ -0.9950249,
};

/* This function saves the result obtained from predefined data to the specified file*/
/*
void save_output(float * output, int size)
{
  int i;
  FILE * out = fopen("../asinsp_output.dat","w");

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
    output[MTH_FCN_RTS][i] = asinf (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = asinsp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = asinsp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = asinsp_i (a[i]);
  }
  asinsp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = asinf (a_sc[i]);
    output[MTH_FCN_ASM][i] = asinsp (a_sc[i]);
    output[MTH_FCN_CI] [i] = asinsp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = asinsp_i (a_sc[i]);
  }
  asinsp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = asinf (a_ext[i]);
    output[MTH_FCN_ASM][i] = asinsp (a_ext[i]);
    output[MTH_FCN_CI] [i] = asinsp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = asinsp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-1.5);
  }
  asinsp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  allequal (NUM_EXT_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_EXTENDED);

  /* ======================================================================== */
  /*  RANDOM TEST DATA & PROFILING                                            */
  /* ======================================================================== */


  profile_init(MTH_FCN_INL);
  for (i = 0; i < BUF_SIZE; i++) {
    /* Fill input random data vectors */
    input[0][i] = gimme_random (RAND_RANGE, RAND_OFFSET);

    // Time the fastRTS inline function
    profile_start();
    output[MTH_FCN_INL][i] = asinsp_i (input[0][i]);
    profile_update(MTH_FCN_INL);
  }
  profile_avg(MTH_FCN_INL, BUF_SIZE);

  // Time the RTS function
   profile_init (MTH_FCN_RTS);
   for (i = 0; i < BUF_SIZE; i++) {
     profile_start();
     output[MTH_FCN_RTS][i] = asinf (input[0][i]);
     profile_update (MTH_FCN_RTS);
   }
   profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = asinsp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  asinsp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
  profile_update (MTH_FCN_VEC);
  profile_avg    (MTH_FCN_VEC, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = asinsp (input[0][i]); /* ASM not supported */
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

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
/*  End of file: asinsp_d.c                                                 */
/* ======================================================================== */

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
/* exp2dp_d.h - exp base 2 driver file                                     */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "exp2dp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*100.0)
#define RAND_OFFSET  ( -100.0)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (7)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-10)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "exp2DP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = 
{
/*   0 -  09 */ -10.2244097, -42.1539375,  71.0171908,   9.2099160,  55.8582317, -83.1524307, -80.6279024, -12.3099474,  -7.4002587,  73.0712053,
/*  10 -  19 */ -59.7986326, -52.8700513, -61.1413063,  78.2272169,  45.5485121,   9.6858536, -20.9269145, -71.1637219,  91.4647876,  43.1056347,
/*  20 -  29 */ -56.7365998, -38.4672131,  78.8118408,  59.1540819,   0.7826549,  60.8681988, -50.6536589,  10.4940589,  68.9039044,  52.2950828,
/*  30 -  39 */  -8.0453385,  -3.0788152,   6.5826384, -93.1606848,  37.2116301,  61.4820101,  16.7851184, -61.2253124,  60.4871485, -11.8971631,
/*  40 -  49 */  45.7224573,   4.8172075, -18.8318639, -93.6953754, -15.5990870, -92.7224484,  59.5395027,  91.1756199,  67.8406022,  -9.0852247,
/*  50 -  59 */ -96.1998127, -41.2888087,  72.7531726, -53.9326549,  63.0593861,  70.4770225, -77.8104537,   2.4122812,  31.9965508, -69.5037050,
/*  60 -  69 */  80.8952281, -60.1094655,  45.4018651, -12.3974653, -40.8170616,  77.7724544,  87.5603050,  33.8527922, -90.9492344,  78.5702265,
/*  70 -  79 */  82.0771257,   5.3301967,  28.0701643, -48.0651408,  98.1553515, -19.4277246, -44.5081459,  48.4154231, -52.5628414, -16.3039735,
/*  80 -  89 */  77.7085004,  63.3530815, -12.8466515, -17.9397760, -77.9922686,  35.3399174, -83.7860366,  87.0405764, -40.3089061, -51.4647347,
/*  90 -  99 */ -21.6849650, -47.5389002,   6.8643750, -71.2161850, -38.0339381, -23.0437509,  21.3096339,  45.1568339,  -2.6502964, -98.3851218,
/* 100 - 109 */ -91.2740010, -86.9076945, -40.5592874,  14.6647238, -85.8457600,  90.4949385,  68.0181054, -55.5557928,  28.2115097,  76.9272960,
/* 110 - 119 */  84.5402109,  62.5396533, -13.6929938, -80.1095801, -83.9643752,  89.2326541,  66.3196922,   7.7650678,  11.9965090,  84.1372881,
/* 120 - 129 */  88.5768021,  72.9672546, -34.8400629,  50.8967871,  19.7632149,  -8.0853652, -85.3947393, -60.5002387, -30.1852351, -14.9459595,
/* 130 - 139 */ -59.6808913,  40.8420738,  -9.6717480,  16.8522901,  68.6486990,  -7.8197519,  79.2733437,  -5.7724628,  66.0551051, -28.3464245,
/* 140 - 149 */ -22.9318895, -31.1068845,  46.9194140, -97.0039597, -32.6276850, -63.4115631,  66.5208222,  53.9494300,  79.4221866,  36.2916260,
/* 150 - 159 */ -73.5038405,  35.5033762,  84.1392745, -49.7865245, -32.1822665,   1.0928492,  97.2281014, -94.6370729,  79.3810963,  50.5225996,
/* 160 - 169 */ -22.3528389,  71.2094727,  92.5331472,  25.2675346, -70.0717094, -36.4167117, -18.1313113, -88.3931385,  98.7139877,  38.4221832,
/* 170 - 179 */  65.9903148,  38.2742100, -23.4269782,  98.0399215,   8.3079111,  79.5795809,  -3.0278349,  87.9706697,  13.9015564,  52.2935369,
/* 180 - 189 */ -61.8297174,  95.4370373,  33.4337914, -84.3559087, -78.3319608, -44.4273886, -39.9753926, -21.6550464,  12.9891142,  44.4243117,
/* 190 - 199 */  30.8109783,  85.3173556,  21.6649542,  80.4690190,  27.7310781,  30.1838404, -98.7437931, -70.6469499,  75.9557378, -51.7597809,
/* 200 - 200 */ -52.2282086,
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
    output[MTH_FCN_RTS][i] = exp2 (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = exp2dp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = exp2dp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = exp2dp_i (a[i]);
  }
  exp2dp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = 0;
  a_sc[1] = _lltod(0x8000000000000000);
  a_sc[2] = _lltod(0x7FF0000000000000);
  a_sc[3] = _lltod(0xFFF0000000000000);
  a_sc[4] = 1;
  a_sc[5] = -1;
  a_sc[6] = _lltod(0xFFFFFFFFFFFFFFFF);
  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = exp2 (a_sc[i]);
    output[MTH_FCN_ASM][i] = exp2dp (a_sc[i]);
    output[MTH_FCN_CI] [i] = exp2dp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = exp2dp_i (a_sc[i]);
  }
  exp2dp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = exp2 (a_ext[i]);
    output[MTH_FCN_ASM][i] = exp2dp (a_ext[i]);
    output[MTH_FCN_CI] [i] = exp2dp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = exp2dp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  exp2dp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = exp2dp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = exp2 (input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = exp2dp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = exp2dp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  exp2dp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: exp2dp_d.c                                                 */
/* ======================================================================== */

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
/* atan2dp_d.h - arctangent two argument driver file                       */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "atan2dp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*MTH_TWO_PI)
#define RAND_OFFSET  ( -MTH_TWO_PI)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (5)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-9)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "atan2DP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = {
/*   0 -  09 */  2.3135381,  1.8968619, -0.0756768,  0.8868028, -0.9800547,  0.1826697, -1.1155889, -1.0483080,  1.6465753, -0.8641856,
/*  10 -  19 */ -0.8528155, -1.9450655, -2.6390254,  0.5221994,  2.8218998, -0.9806798, -3.1345328, -1.9067114, -2.3209479,  1.0272207,
/*  20 -  29 */  2.8233285,  2.6390254,  1.1275215,  1.3495004, -2.9128084, -1.9651832, -2.5642326,  1.8925702, -2.3064093, -2.1316203,
/*  30 -  39 */  0.4856401,  2.7499643,  1.9174446,  1.3146485, -2.7798670,  2.2517497, -1.0791098, -0.4656905, -1.9318173, -3.0600822,
/*  40 -  49 */  1.4257409,  0.8000701, -0.9783753,  0.4934743,  1.3673927, -1.0034392,  0.6332442, -0.3479142,  1.5669944, -1.1302520,
/*  50 -  59 */  1.6678470, -1.8060988,  3.0330084, -2.9716971, -0.9224464, -1.7681531, -1.2403497,  0.9910658,  0.7251339,  0.0664521,
/*  60 -  69 */ -1.1956786, -2.4353275,  0.0850895,  2.2100750, -1.0904034, -3.0326055,  1.3948207,  1.3624830, -0.6940544,  1.3543253,
/*  70 -  79 */  0.8774785, -1.1167824, -1.5397275, -1.4583951, -0.7318605,  0.4957987, -0.5997590, -0.2675051,  1.8631171, -2.2671664,
/*  80 -  89 */ -2.9832040,  1.7920738, -0.5029850, -0.9580196, -2.9132679, -0.2031369,  0.2392143, -1.2708957, -2.7262275, -0.3890131,
/*  90 -  99 */ -2.3026158,  1.7395388, -0.1722220, -0.8664596,  2.6893643, -1.2955357, -1.1141723,  0.6524964, -1.0036292, -2.5341911,
/* 100 - 109 */ -0.6030755, -1.4845922,  0.1847009, -2.2969809, -1.7284012, -2.1670837, -0.9162604, -2.6918627, -3.0926890,  1.9026916,
/* 110 - 119 */ -0.6157909, -1.2167198,  1.3122679, -0.2426267,  2.9885612,  2.7933659,  3.0079707, -2.5318231, -2.4902929,  1.9892559,
/* 120 - 129 */ -1.8243082, -0.6330179,  0.1249213, -0.2402831, -0.0144180,  1.7226800,  1.2449822, -2.1712261,  1.0182503, -0.9841044,
/* 130 - 139 */  1.8955267,  2.3830600, -1.5845531,  2.8392730,  1.5114688, -1.1034743,  0.0325057, -2.1286954, -2.3589811,  2.7031802,
/* 140 - 149 */ -0.5401727, -1.5467144, -1.2573473,  2.0498470,  1.0994474, -1.6878354, -1.2113809,  2.3451656,  1.1922679,  1.9623993,
/* 150 - 159 */  2.6861392,  0.9585329,  0.6380016, -0.4698215,  0.9541665, -0.2773711, -1.5496726, -1.6967815,  1.1994481, -1.2693016,
/* 160 - 169 */ -1.7465209, -2.4450130,  2.9895873,  2.6623165,  1.8586202,  0.9722465, -2.2202118,  1.7101600,  3.0139285, -2.0721991,
/* 170 - 179 */  0.5109130, -2.9975483, -0.0452963,  1.1814785, -0.8643483,  0.4049361,  1.8757297,  2.9287528, -1.3302178, -3.1057060,
/* 180 - 189 */ -2.8633637, -0.1973840,  2.4147408,  1.1097204, -2.3930683, -0.7517271, -0.6176767,  0.7760660,  0.7684358,  0.6968723,
/* 190 - 199 */  1.7993756,  0.6814629,  2.3639156,  1.7913911,  1.4757554, -2.4254864,  2.6482566, -1.6377824,  0.8112791, -0.9589719,
/* 200 - 200 */  0.0636593,
};

double b [NUM_INPUTS] = {
/*   0 -  09 */ -91.2572958,  18.7408531, -53.8650442, -75.7569229,  96.3077229,  -7.6091001, -19.2073345,  90.0992421,   8.8307813,  58.0715861,
/*  10 -  19 */ -55.1536422,  82.1953898,  90.7922245,  70.3973330,  54.3926883,  27.9326546, -70.8640362,  28.7746900,  67.9949544,  -4.3990179,  
/*  20 -  29 */  56.3853689,  72.7330394,  89.7958760,   0.6506345, -53.2568907,  90.5001414, -34.3886068,   0.1867002,  18.4165466, -89.5764153,  
/*  30 -  39 */  86.0586351,  96.1277471,  33.6452472, -93.5818388, -13.4470613, -65.5907704, -99.7548511,  -4.3503695, -56.5984360, -97.3693208,  
/*  40 -  49 */  66.9302629,  39.2945708, -19.9401670, -65.2324650, -72.0181957,  40.9931386,  62.4405059, -93.5376590,  20.1598249, -49.2629567,  
/*  50 -  59 */  97.3422339,  38.1619053,  24.9950952,  57.8565606, -59.7228016,  94.3208155, -33.4966502,   1.9489241, -13.1378145, -17.3492702,  
/*  60 -  69 */  15.8208954, -40.3999316, -21.6943411, -46.7005935,  83.4348239,  56.1003863,  -0.9574840,   3.5718092,  26.1776647, -42.3677828,  
/*  70 -  79 */  75.9682995,  71.6556690,  43.3485769,  74.3978270, -17.6547310,  40.5521602,  79.0387887, -37.0366985,  32.3184751, -64.2953153,  
/*  80 -  89 */  21.3656540, -79.2134105,  87.1901856, -72.6390439, -99.0990864, -10.6543498, -51.6327866, -68.6458331,  93.0084248, -45.0833611,  
/*  90 -  99 */ -37.1702853,   5.1907654, -83.6970233, -52.2043266,  21.5931263, -51.1775924,  32.6228238,  40.7333065, -41.1037088, -92.1953541,  
/* 100 - 109 */  47.8323105,  51.2813626, -46.9896947, -27.5270931, -87.4029587, -59.7726969, -74.5733577, -25.9424445, -78.4035322,  12.3785878,  
/* 110 - 119 */ -58.3340343,  89.3806460, -89.5980000, -85.7810516,  12.0531909,  40.0593417,  61.7391895,  40.9334400,  87.7929490,  88.5997007,  
/* 120 - 129 */ -99.2242204, -73.7385827,  67.2410088,  43.0963350,  93.5867665,  51.0842296,  -8.7863589,  55.6547355,  54.9392907,  37.9593670,  
/* 130 - 139 */  41.4129360,  21.6191053, -58.7140204,  53.4582739, -50.1859543, -21.1997344,  51.5337994,  10.5222224, -14.6191417, -89.4206358,  
/* 140 - 149 */  28.6006195, -37.8060334, -35.7869307, -55.6486036,  61.7771647, -92.8920502,  47.2177382, -50.7940962,  82.0212409, -12.0875024,  
/* 150 - 159 */ -64.5874273, -60.2094873, -38.0300459,  89.7133750,  76.1698976,  73.2225305, -76.2539171,  42.4176305,  60.8972830,  51.4205129,  
/* 160 - 169 */ -71.9763577,  19.9461477,  22.6601886, -80.4704549,  80.2687399, -60.5444334,  40.8969899,  66.7207540,  31.5421414,  60.5660213,  
/* 170 - 179 */ -63.2807533,  26.1853248, -24.6500728, -10.7415857,  76.0305761,  73.5657775,  49.2212160,  73.1837210, -32.8017910,  30.0932223,  
/* 180 - 189 */ -65.3040785,   4.7972407,  64.1718504,  57.8754685,  55.7897783,  20.5711835, -35.8692133,  67.7430589, -18.7016050,  98.6509677,  
/* 190 - 199 */   6.7179056, -90.9222510,  24.8186046, -36.4573513,  77.1555061, -23.1775585,  40.8544334,  82.2189711,   2.3360194,  11.5269520,  
/* 200 - 200 */  31.0396471,  
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
    output[MTH_FCN_RTS][i] = atan2 (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = atan2dp (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = atan2dp_c (a[i],b[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = atan2dp_i (a[i],b[i]);
  }
  atan2dp_v (a, b, output[MTH_FCN_VEC], NUM_INPUTS);

  /* Check results and display */
  allequal (NUM_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_PREDEF);

  /* ======================================================================== */
  /*  SPECIAL CASE and EXTENDED RANGE TEST DATA                               */
  /* ======================================================================== */

  /* Obtain results using special case test vectors */
  a_sc[0] = b_sc[0] = 0;
  a_sc[1] = b_sc[1] = _lltod(0x8000000000000000);
  a_sc[2] = b_sc[2] = _lltod(0x7FF0000000000000);
  a_sc[3] = b_sc[3] = _lltod(0xFFF0000000000000);
  a_sc[4] = b_sc[4] = 1;
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
      output[MTH_FCN_RTS][i] = atan2 (a_sc[i],b_sc[i]);
      output[MTH_FCN_ASM][i] = atan2dp (a_sc[i],b_sc[i]);
      output[MTH_FCN_CI] [i] = atan2dp_c (a_sc[i],b_sc[i]);
      output[MTH_FCN_INL][i] = atan2dp_i (a_sc[i],b_sc[i]);
      i++;
    }
  }
  atan2dp_v (a_sc, b_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS*NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS*NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  b_ext[0] = 1.;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = atan2 (a_ext[i],b_ext[i]);
    output[MTH_FCN_ASM][i] = atan2dp (a_ext[i],b_ext[i]);
    output[MTH_FCN_CI] [i] = atan2dp_c (a_ext[i],b_ext[i]);
    output[MTH_FCN_INL][i] = atan2dp_i (a_ext[i],b_ext[i]);
    a_ext[i+1] = a_ext[i] * 2.1;
    b_ext[i+1] = b_ext[i] *(-1.);
  }
  atan2dp_v (a_ext, b_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = atan2dp_i (input[0][i],input[1][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
	output[MTH_FCN_RTS][i] = atan2 (input[0][i],input[1][i]);
	profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
	profile_start();
    output[MTH_FCN_ASM][i] = atan2dp (input[0][i],input[1][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
	output[MTH_FCN_CI][i] = atan2dp_c (input[0][i],input[1][i]);
	profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  atan2dp_v (input[0], input[1], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: atan2dp_d.c                                                */
/* ======================================================================== */



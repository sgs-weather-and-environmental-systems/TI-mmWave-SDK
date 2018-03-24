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
/* log2dp_d.h - log base 2 driver file                                     */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "log2dp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (10001.0)
#define RAND_OFFSET  (   -1.0)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (6)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL    (1e-8)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "log2DP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT | MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = 
{
/*   0 -  04 */  2489.2649736, 9443.3078004, 6955.4981987, 1933.0101774, 2633.7180318,
/*   5 -  09 */  4703.2060297,  529.4456706, 2422.6100483, 9886.0317200,   87.6337049,
/*  10 -  14 */  2318.2353777, 6531.8372930, 5017.7131332, 8402.2680088, 4920.2771308,
/*  15 -  19 */  3752.6587757, 2181.0001355, 5943.8693066, 4154.9904529, 7191.3249399,
/*  20 -  24 */  9022.2167468, 2507.1321101, 9416.6212649, 3290.3627812, 6524.1143518,
/*  25 -  29 */  1185.9568993, 3513.8266409, 1911.2502612, 9284.5759143, 8647.6187158,
/*  30 -  34 */  2557.2505907, 6331.2642889, 5198.3899385, 4894.9019533, 6268.7381252,
/*  35 -  39 */  3360.2915487, 5657.5807001, 3468.3539961, 7746.8661930, 3266.3863159,
/*  40 -  44 */  5430.2096353, 1245.3403638, 3546.3811289, 9616.5095821, 2818.7965474,
/*  45 -  49 */  8521.4839309, 3600.7623956, 9509.7737158, 9504.4376055, 9240.4505817,
/*  50 -  54 */  1298.2704447, 3463.2414555,  581.7933284,  529.7657143, 3522.9454851,
/*  55 -  59 */  5373.1646931, 4645.6074082, 3092.7829085,  535.0156847, 2706.3189041,
/*  60 -  64 */  3663.3572817, 1045.3471102, 6052.7295713, 6270.1468907, 3061.1457770,
/*  65 -  69 */  1883.6480139, 7208.4380403,  325.5636587, 1759.0104646, 6714.8519063,
/*  70 -  74 */  4630.8821523, 2592.1999425, 2055.0254820, 9828.5967860, 2365.9059342,
/*  75 -  79 */  4165.3328553, 9664.6725360, 9126.1884702, 7837.0883521, 9635.8666666,
/*  80 -  84 */  3833.8240742, 5926.5006952, 1921.3285478, 7048.8762107, 7152.5411431,
/*  85 -  89 */  4887.0679766, 9072.8972462, 7830.0826908, 5701.0565140, 4316.3888165,
/*  90 -  94 */  7001.9019077, 6897.6830678, 8940.4013439, 5704.9026266, 6916.6893553,
/*  95 -  99 */  2509.4560492, 9824.3877415, 4194.1612358, 3479.7745892, 6536.1575373,
/* 100 - 104 */  4762.9965873, 8187.0977925, 4849.9083909, 4106.3813691, 3506.4853206,
/* 105 - 109 */  9580.4922304, 2483.2928422, 3885.4837628, 9337.9575375, 3843.7330435,
/* 110 - 114 */  1333.1270309, 7915.2470814, 8955.7747925, 9709.5020809, 9847.3874224,
/* 115 - 119 */  1770.2154705, 2476.7038363, 9401.7199650, 9887.8536022, 4366.5998181,
/* 120 - 124 */  3474.3809415, 8602.0194607, 6696.9491524, 8112.6929863, 8898.1719480,
/* 125 - 129 */  6447.8131318, 9012.1838109, 8795.4371984, 9231.3582832, 5453.9426627,
/* 130 - 134 */  8946.4952464, 5735.4688393, 8335.8001175, 1629.7907230, 2148.0389340,
/* 135 - 139 */  1592.3932504, 3528.6801932, 4363.9297479, 7644.2438993, 2521.5105555,
/* 140 - 144 */  5584.3530115, 6498.9507235, 7875.6456993, 8093.7696097, 8613.9906239,
/* 145 - 149 */  4411.1376046, 8780.7781030, 1373.5052695,  301.2880669, 7739.6799047,
/* 150 - 154 */  9674.4490104, 8768.3313238, 1710.6723220, 9733.2895055, 3326.7900875,
/* 155 - 159 */   135.1159175, 7282.2179435, 6980.2576554, 6005.1717640, 8832.7259784,
/* 160 - 164 */  5066.5212490, 9525.4375434, 7274.1704357, 1708.1140128, 6299.9513064,
/* 165 - 169 */   789.3287416,  349.1056621, 8796.7838421, 5906.3791511, 7808.4103849,
/* 170 - 174 */  1669.9829555, 3897.0960900, 2070.9691925,  834.9331511, 1246.4134107,
/* 175 - 179 */  3954.8957187, 6553.5637984, 3738.7359072, 2428.4396525, 9643.6642791,
/* 180 - 184 */  4371.2316781, 3724.9346687, 2177.2329141, 4739.4544539, 4155.6309228,
/* 185 - 189 */  1454.9004011,  636.6707407, 6750.9567068, 7876.6961828, 1086.0034557,
/* 190 - 194 */  1602.4396744, 6483.7640657,  997.5972861,  113.4317391, 2246.9576103,
/* 195 - 199 */  8161.5743108, 2400.8469961, 9489.2403040, 3120.5264006, 9502.1701835,
/* 200 - 200 */  4344.7576497,
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
    output[MTH_FCN_RTS][i] = log2 (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = log2dp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = log2dp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = log2dp_i (a[i]);
  }
  log2dp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = log2 (a_sc[i]);
    output[MTH_FCN_ASM][i] = log2dp (a_sc[i]);
    output[MTH_FCN_CI] [i] = log2dp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = log2dp_i (a_sc[i]);
  }
  log2dp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = log2 (a_ext[i]);
    output[MTH_FCN_ASM][i] = log2dp (a_ext[i]);
    output[MTH_FCN_CI] [i] = log2dp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = log2dp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  log2dp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = log2dp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = log2 (input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = log2dp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = log2dp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  log2dp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: log2dp_d.c                                                 */
/* ======================================================================== */

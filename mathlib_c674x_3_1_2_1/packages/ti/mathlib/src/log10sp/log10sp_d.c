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
/* log10sp_d.h - log10 driver file                                         */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "log10sp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (1000001.0)
#define RAND_OFFSET  (     -1.0)

/*  Number of input arguments */
#define NUM_INPUTS     (201)
#define NUM_SC_INPUTS    (7)
#define NUM_EXT_INPUTS (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-5)


/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "log10SP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = 
{
/*   0 -  04 */  920184.5063765, 182379.1119679, 382181.6699036, 291296.1817645, 736276.2133991,
/*   5 -  09 */  413037.4952929, 616996.8623519, 826318.5844631, 173241.6031542, 784028.6320466,
/*  10 -  14 */  976065.8912868, 374039.7151784, 856094.0404753, 403451.7501951, 815068.5125761,
/*  15 -  19 */  282926.6915757, 871180.9700556, 867967.7436367, 962742.4410124, 374455.8143055,
/*  20 -  24 */  785690.4862970, 219946.6280076, 713006.5090306, 931410.7057498, 628132.6224710,
/*  25 -  29 */  986507.5030108, 828885.5375070, 713505.6837507, 888248.4402638, 156040.1537284,
/*  30 -  34 */  542552.6351054, 941764.4477205, 540598.4376451, 182214.5118521, 551365.2665486,
/*  35 -  39 */  310234.1381602,  20990.5797884, 999444.5491402,  33532.9256771, 985975.7809896,
/*  40 -  44 */  222664.5949517, 999604.6377293, 624653.0953392, 593431.3289670, 531415.8631044,
/*  45 -  49 */   47581.0340092, 425533.1306504, 234008.9490799, 786488.7425884, 481257.8594062,
/*  50 -  54 */   17836.1785927, 474314.2441315, 292416.8195025,  99852.1936695, 444487.2895656,
/*  55 -  59 */  353946.5615868, 830561.4431689, 179501.3145454, 217543.7802081, 373859.4669676,
/*  60 -  64 */  651460.8889073, 449805.3325427, 322137.0668377, 511892.3845398, 463087.1955951,
/*  65 -  69 */  129059.8762657, 208518.7071077, 211112.7527549, 461971.2473192, 892933.9005685,
/*  70 -  74 */  796137.4430053, 387599.9532337, 298183.6372464, 886211.7719198, 469576.8341217,
/*  75 -  79 */  414847.9934179,  90899.8280118, 718863.6901555,  90430.8337065, 147174.2721193,
/*  80 -  84 */  436273.3962606, 485664.4973139, 985431.1527733, 896298.3761208, 391656.7269982,
/*  85 -  89 */  730916.9180941, 950486.5477805, 454759.8211826, 491442.5328053, 479790.9653551,
/*  90 -  94 */  242738.7421288,  76423.3452796, 723441.2855155, 222625.6302332, 600246.0010973,
/*  95 -  99 */  488179.3670543, 560222.5607080, 907222.1852593, 218402.2053418, 874286.8549054,
/* 100 - 104 */  939586.2457130, 977781.7142256, 765631.0344657, 907671.3744685, 264527.4853309,
/* 105 - 109 */  324203.9848170, 391221.2175773, 714753.4834155, 403243.0990585, 301618.7784431,
/* 110 - 114 */  694053.2826855, 891058.4903808, 700874.5023269, 757665.7508823, 753767.1146532,
/* 115 - 119 */  512963.7917861, 967746.4677917, 989633.2732874, 111401.8903728, 110296.9414768,
/* 120 - 124 */  479442.4773275, 767774.8842591, 780933.3774339, 689879.1040609, 988403.9374025,
/* 125 - 129 */  331479.4487083, 245543.8452481, 727572.1596549, 708467.4871450, 393146.8957747,
/* 130 - 134 */  453541.9434361, 164528.9171790, 330327.9277667, 122622.1774292, 834133.0680143,
/* 135 - 139 */  418759.7653344, 998175.1731253, 178356.7480524, 262158.2643734, 365718.6399763,
/* 140 - 144 */  340970.6200044, 660546.6555312, 108939.7409252, 349950.3849473, 452862.8412661,
/* 145 - 149 */  169817.3210691, 183652.2469776, 200774.2662454, 889320.2298957, 744621.0091774,
/* 150 - 154 */  795856.1869482, 193115.5631234, 678821.3611628, 912088.0790592, 704682.9698467,
/* 155 - 159 */   94548.0559947, 322886.9744765, 660596.2351088, 138385.5490218, 118251.2998765,
/* 160 - 164 */  784315.1488906, 451610.5988871, 798258.9816634, 966086.8834751, 502833.3618170,
/* 165 - 169 */  207856.8379728, 862466.0455021, 797314.5830052, 375587.5961221, 329023.8323139,
/* 170 - 174 */  958805.9736787, 240285.7255048, 788358.7343177, 679952.1817945, 199836.2821280,
/* 175 - 179 */  396408.4770296, 568702.2482647, 594677.5502692, 163254.0065901, 828365.8089292,
/* 180 - 184 */   32840.7290545, 872374.4194199, 884231.6659614, 583600.0940896, 958259.8504797,
/* 185 - 189 */  789193.4457097, 890451.5925058, 163019.2405963, 595481.6285919,  82562.2077714,
/* 190 - 194 */  151358.0916312, 536681.6229039, 656370.2163453, 962951.8067097, 125063.0652845,
/* 195 - 199 */  151544.7341742, 333549.0651071, 102119.7639609, 727092.7425107, 919813.0411491,
/* 200 - 200 */  281026.5996295,
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
    output[MTH_FCN_RTS][i] = log10f (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = log10sp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = log10sp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = log10sp_i (a[i]);
  }
  log10sp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
  a_sc[6] = _itof(0xFFFFFFFF);
  for (i = 0; i < NUM_SC_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = log10 (a_sc[i]);
    output[MTH_FCN_ASM][i] = (isinf(a_sc[i]) && a_sc[i]>0) ? log10(a_sc[i]) : log10sp(a_sc[i]); // ignore inf input for Asm
    output[MTH_FCN_CI] [i] = log10sp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = log10sp_i (a_sc[i]);
  }
  log10sp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = log10 (a_ext[i]);
    output[MTH_FCN_ASM][i] = log10sp (a_ext[i]);
    output[MTH_FCN_CI] [i] = log10sp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = log10sp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  log10sp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = log10sp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = log10f (input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = log10sp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = log10sp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  log10sp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: log10sp_d.c                                                */
/* ======================================================================== */

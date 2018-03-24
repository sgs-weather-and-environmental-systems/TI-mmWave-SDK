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
/* asinhdp_d.h - asinh driver file                                         */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "asinhdp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (1000001.0)
#define RAND_OFFSET  (  -5000.0)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (8)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL    (1e-10)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "asinhDP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT | MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = {
/*   0 -  04 */  882801.6794445, 560317.0630053, 122262.5250991, 488666.1829456,  59841.4251888,
/*   5 -  09 */  584370.8070949, 374632.8022302, 912026.4368577, 842783.8098368, 312756.9875380,
/*  10 -  14 */  723821.9348381, 806095.6331373, 127254.1847402, 933245.6419599, 379333.5453191,
/*  15 -  19 */  151118.0176415, 417104.0555357, 206774.3096981, 135532.0028255, 504309.8405133,
/*  20 -  24 */  793258.8017512, 502566.9568444, 375486.0566168,  46851.7703576, 960520.6096414,
/*  25 -  29 */  778533.3748699,  94466.0389568, 517367.4473240, 185082.6081897, 597005.1261599,
/*  30 -  34 */  856933.5341473, 274538.3196528, 345328.3101796,  97330.6720787, 843501.7982517,
/*  35 -  39 */  261801.0670960, 904483.0122721,  23203.8910473, 811726.8713380,  23121.1452181,
/*  40 -  44 */  930146.9469522, 703193.0835740, 123614.9634868, 679481.8491929,  74764.9524670,
/*  45 -  49 */   78021.1774775, 725942.6554218, 960100.1254672, 591223.2092584, 661556.6206542,
/*  50 -  54 */  169918.5582823, 186895.5718195, 313341.3101541, 568101.7263595, 591523.7737617,
/*  55 -  59 */  262682.7787054, 683254.4938615, 512461.3051655, 727250.6830705, 710304.6866620,
/*  60 -  64 */  727878.7498375, 794207.5389890, 906234.8791187, 617886.1733557,  74645.4646405,
/*  65 -  69 */  313486.9240174,  38548.1287870, 685756.8188983, 939723.8052013, 562998.6751490,
/*  70 -  74 */  646423.4216111, 199043.0318191, 131873.1958555, 624235.4650102, 836948.5525543,
/*  75 -  79 */   35575.4701211,  60403.7970599, 175207.7966430, 313775.8034993, 677529.0288811,
/*  80 -  84 */  719391.3802034, 486645.2022061, 369263.5398134, 191905.0707410, 703455.6914472,
/*  85 -  89 */  429683.2768611, 892407.9681125, 238395.7080342, 199783.1569117, 460318.2428449,
/*  90 -  94 */  372581.5412187,  81020.2721105, 992170.2879347, 631093.6094214, 876207.0696352,
/*  95 -  99 */  560831.2518734, 445316.7274230, 595036.8261095,  85858.0363305, 127190.9020074,
/* 100 - 104 */  532238.6463448, 586083.4749314, 257131.1955642, 814263.2478729, 814639.3386080,
/* 105 - 109 */  442559.0342842, 250071.5894191, 260614.1244948, 446954.4465755, 595415.8756193,
/* 110 - 114 */  517321.1611491, 685705.6454784, 176171.0931318,  60479.6141308, 108129.4135054,
/* 115 - 119 */  909496.3602833, 349836.5751374, 457908.0234948, 656546.5614665, 344586.8533488,
/* 120 - 124 */  896344.1686953, 996652.4538629, 397103.9970643,     96.2401071, 348522.1789260,
/* 125 - 129 */  482150.6273325, 156976.7293764, 473969.9093535, 835734.6420742, 304778.3051430,
/* 130 - 134 */  359902.5528877, 964559.8958883,  68279.3041031, 466975.9796017,  14446.5485080,
/* 135 - 139 */  251140.5666811, 360803.2688866, 540509.1859847, 733551.7334338, 721301.9341041,
/* 140 - 144 */  620637.3310868, 713147.0818281, 715017.1680112, 355255.6088280, 336035.3195075,
/* 145 - 149 */  757548.0866992, 760989.3296372, 710279.0540959, 615238.1118337,  31198.8486069,
/* 150 - 154 */  254551.1672393, 955758.7633309, 135718.3164065, 499840.2234308, 183177.7645389,
/* 155 - 159 */  846002.3094769, 179265.5599926, 717990.0871624, 119125.9546122, 735741.4073163,
/* 160 - 164 */  612588.3100005, 824996.9605397, 235198.5453145, 568457.2748272, 910600.1081331,
/* 165 - 169 */  576287.7427351, 300684.4179585, 876351.8299096, 137025.4501108, 292572.3901982,
/* 170 - 174 */  661935.4286696, 799953.1940939, 944266.5768153, 906825.4771285, 281365.4328340,
/* 175 - 179 */   52884.3978818, 581343.9523098, 948475.2534796, 706280.6677766, 964819.8101342,
/* 180 - 184 */  885941.7665924, 520153.2858538,  64860.9873477, 442536.1919205, 296316.4028624,
/* 185 - 189 */  340524.6830367, 101383.9403789, 993239.2675543, 847214.7953092, 713144.2347114,
/* 190 - 194 */  133310.9561250, 724553.4887445, 158223.2461638, 534160.6298664,  86278.9611551,
/* 195 - 199 */  317292.6625962, 445480.4045156, 292426.8053394, 478658.2879981,  72224.3540203,
/* 200 - 200 */  529557.8900335,
};

/* This function saves the result obtained from predefined data to the specified file*/
/*
void save_output(double * output, int size)
{
  int i;
  FILE * out = fopen("../asinhdp_output.dat","w");

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
    output[MTH_FCN_RTS][i] = asinh (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = asinhdp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = asinhdp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = asinhdp_i (a[i]);
  }
  asinhdp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    /* RTS's output is not as precise as ours, compared to Matlab */
    output[MTH_FCN_RTS][i] =  (i==2 ||i==3)? asinhdp_c (a_sc[i]):asinh (a_sc[i]);
    output[MTH_FCN_ASM][i] =  asinhdp (a_sc[i]);
    output[MTH_FCN_CI] [i] =  asinhdp_c (a_sc[i]);
    output[MTH_FCN_INL][i] =  asinhdp_i (a_sc[i]);
  }
  asinhdp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = asinh (a_ext[i]);
    output[MTH_FCN_ASM][i] = asinhdp (a_ext[i]);
    output[MTH_FCN_CI] [i] = asinhdp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = asinhdp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  asinhdp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

//  save_output(output[MTH_FCN_INL], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = asinhdp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = asinh (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = asinhdp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  asinhdp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
  profile_update (MTH_FCN_VEC);
  profile_avg    (MTH_FCN_VEC, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = asinhdp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

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
/*  End of file: asinhdp_d.c                                                */
/* ======================================================================== */

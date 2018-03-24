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
/* atandp_d.h - arctangent driver file                                     */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "atandp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*MTH_TWO_PI)
#define RAND_OFFSET  ( -MTH_TWO_PI)

/*  Number of input arguments */
#define NUM_INPUTS      (201)
#define NUM_SC_INPUTS     (7)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-9)

/* Number of random test values */
#define BUF_SIZE        (128)

/* Function name */
#define KERNEL_NAME  "atanDP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] = 
{
/*   0 -  09 */  4.6857751, -4.3888050, -6.2219309,  2.9734052, -3.3967064,  3.6387301, -1.7971204, -5.4644940, -3.9856986, -0.5585872,
/*  10 -  19 */  3.8899913, -1.3168933, -5.4385924, -3.7650699,  4.6782969, -0.4647531,  1.0419428, -1.0364327, -1.2014995, -2.1744585,
/*  20 -  29 */  3.1192100,  4.3466117,  1.2910699, -1.2718891,  5.4156570,  0.8315685, -6.0598363, -0.7572985,  4.4759914, -6.1766455,
/*  30 -  39 */  0.3737053,  0.5156207,  0.9926337,  5.5872771, -1.6042174, -4.4321149,  0.0484700, -0.1984939, -4.7144343, -5.7204383,
/*  40 -  49 */ -1.6439593, -5.2481460,  2.4693651, -1.7414520, -2.7835699,  0.5988448, -1.7384408,  0.9387471,  1.9785296, -6.0000916,
/*  50 -  59 */  2.7242336, -0.0025418, -2.6517277,  6.2686322,  2.6614318, -2.6427103, -2.6400110, -2.4830394,  1.8838924, -0.4713757,
/*  60 -  69 */ -4.6442288, -4.8222659, -4.3154439,  4.5527520,  1.4895902,  5.6976069, -3.4396315,  2.1984083,  5.1242322,  2.3639411,
/*  70 -  79 */ -4.1265235, -0.7093108, -0.1325848,  0.2595502,  2.0924353, -5.7657023, -3.6162158, -6.1753312,  2.8462950,  2.4904875,
/*  80 -  89 */ -3.0831660, -5.7871494,  2.5259382,  6.0172287, -4.4142767,  4.5001068, -2.6030415,  3.6806216,  3.3684705, -5.7893480,
/*  90 -  99 */  0.6336588, -1.3586379, -2.2594250,  0.2887305,  4.3750683, -1.4995354, -1.6341247,  0.8448597,  5.4956329,  2.5371082,
/* 100 - 109 */  4.0196222,  3.7116159,  4.6723642,  1.7090287,  5.2056630, -4.3639392, -5.1992106,  3.8826736, -3.1818808,  5.7020068,
/* 110 - 119 */ -2.0431976, -3.6693872,  3.1784537,  4.3081429,  2.8606615, -4.5421471,  2.6360666,  3.7467859,  2.6723677, -2.9248591,
/* 120 - 129 */  2.9170800, -4.2826643, -5.2518562,  1.1890674,  3.7210742,  1.2962931,  6.0178581, -0.3196450, -3.7216546, -4.4120904,
/* 130 - 139 */  4.7258738,  1.1919446,  1.4413478, -4.2122495,  1.3541709,  6.1918232, -6.0560219, -1.8461036, -2.0835953, -5.7400353,
/* 140 - 149 */  3.2752317,  3.3855143,  0.9150622, -0.2683679,  0.2876863,  3.7615734, -3.9849563, -1.7430330, -2.0745753, -3.8509931,
/* 150 - 159 */ -1.8411623, -5.0391879,  0.8101256, -5.8721242,  1.7456782, -0.5412394,  5.4864989,  2.9558379,  5.2709332,  0.2325686,
/* 160 - 169 */  0.0316935, -5.2198479, -0.8460418,  2.9672278,  2.0953534, -3.9875018,  3.0934242,  4.9277258, -4.0785624, -0.1447828,
/* 170 - 179 */  3.6277482, -4.7947532, -4.7209644,  3.9513529,  3.9101131,  4.8825841,  5.5174241, -2.5734623, -0.8850934, -6.0615151,
/* 180 - 189 */ -1.2242225, -0.9716348,  1.0316600,  2.0928574,  1.8022556, -5.9010623,  1.0032966, -2.0393881, -4.8233904, -2.5928760,
/* 190 - 199 */ -5.7267153,  4.8141505,  1.6676956,  2.9808447,  5.8558562, -0.0463704, -1.8786020, -3.5725546,  2.0789706,  2.6725338,
/* 200 - 200 */  3.2779916,
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
    output[MTH_FCN_RTS][i] = atan (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = atandp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = atandp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = atandp_i (a[i]);
  }
  atandp_v(a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = atan (a_sc[i]);
    output[MTH_FCN_ASM][i] = atandp (a_sc[i]);
    output[MTH_FCN_CI] [i] = atandp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = atandp_i (a_sc[i]);
  }
  atandp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = atan (a_ext[i]);
    output[MTH_FCN_ASM][i] = atandp (a_ext[i]);
    output[MTH_FCN_CI] [i] = atandp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = atandp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  atandp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  /* For values over 6.0e+11, where the output approaches the pi/2 asymptote, */
  /* there is the slight increase in relative error. For best performance,    */
  /* these values have been rounded to pi/2 without further calculations.     */
  allequal (NUM_EXT_INPUTS, 1.7e-8, KERNEL_REQ);
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
    output[MTH_FCN_INL][i] = atandp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = atan (input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = atandp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = atandp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  atandp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: atandp_d.c                                                 */
/* ======================================================================== */


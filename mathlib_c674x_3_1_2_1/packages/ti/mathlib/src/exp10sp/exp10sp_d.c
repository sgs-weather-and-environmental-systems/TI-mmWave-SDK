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
/* exp10sp_d.h - exp base 10 driver file                                   */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "exp10sp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*10.0)
#define RAND_OFFSET  ( -10.0)

/*  Number of input arguments */
#define NUM_INPUTS     (201)
#define NUM_SC_INPUTS    (7)
#define NUM_EXT_INPUTS (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-5)

/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "exp10SP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = {
/*   0 -  09 */  7.2555330,  8.1863761,  7.7506020,  4.8799741, -9.4049913, -1.9325319,  0.7166932, -2.7496546,  4.2748349, -3.2138848,
/*  10 -  19 */ -4.2416360,  3.3820191,  5.8675362,  3.6622841,  8.9243333, -8.7333771, -9.8688202, -5.0328877, -6.7867291,  5.5326228, 
/*  20 -  29 */  8.2269113,  3.7660479, -1.4249858,  7.7599622,  8.6579726,  0.3091667, -8.4037573, -3.5208564, -3.5127629, -8.7488544, 
/*  30 -  39 */ -4.0274223,  6.9362425, -6.1931270,  0.5085038, -7.8078777, -8.7487045, -0.4191279,  8.5598237, -2.3827548, -1.1938234, 
/*  40 -  49 */  9.4900223, -6.9335072,  6.4818313, -4.7682750, -3.7562043,  8.4076066,  9.8143845,  3.4203095,  9.4244026,  5.7568750, 
/*  50 -  59 */ -4.2494801,  3.1379537, -4.5922453, -6.6839170,  8.9073566, -8.9768792, -2.4000274, -3.9183689, -8.6777567,  0.4301454, 
/*  60 -  69 */ -3.9562872, -3.9992191,  1.3571700,  1.7426653,  7.8902695, -8.3411409, -5.3612892,  2.0608031,  6.9274730, -1.0179319, 
/*  70 -  79 */  3.4299765,  5.5902710,  4.0511835, -9.6987901, -2.9760216, -6.7452011,  6.8728349, -5.1023506,  1.5083506,  2.7718159, 
/*  80 -  89 */ -0.0446651, -0.7626204, -0.0799416,  9.0430710,  4.8118501,  6.4247566, -7.9859137,  3.3761378, -0.3279694, -3.5634269, 
/*  90 -  99 */ -5.4271156, -5.5045403, -0.4404623,  6.2010968,  1.1741231,  7.5309898, -3.2386088,  9.4393750,  2.3457293,  4.7979289, 
/* 100 - 109 */  0.1248551, -3.3313973,  5.4886780,  5.3261313, -4.6300683, -4.3318838, -5.2023603,  5.0978407,  5.1668774, -9.2997218, 
/* 110 - 119 */ -8.6596684, -3.1106918,  9.2930631,  2.9761855, -6.8649719, -9.5738751,  3.7729911, -9.3403731, -4.8491260, -7.6131199, 
/* 120 - 129 */  2.2082465,  8.8643438,  8.7606911,  6.0866976, -5.3196049,  9.4196491,  2.9912979, -8.1303067,  8.1446565,  0.9503867, 
/* 130 - 139 */  3.1947633,  6.9530240,  6.7417982,  9.3441549, -8.4825344,  5.3481580, -8.9068292, -3.1077617,  7.4481928, -1.7488046, 
/* 140 - 149 */ -1.1496570,  3.1489800,  6.9566196, -6.7371676,  4.6145191,  4.3076952,  3.1973633, -4.9881574, -0.1403476, -6.4102220, 
/* 150 - 159 */  5.8080650,  5.3900567, -7.1450875,  0.8543764,  1.6885158,  2.6160875,  8.7403849, -6.9310297, -5.7012586,  2.0925669, 
/* 160 - 169 */  9.6088466, -6.0055634,  4.2849247, -4.1395103, -5.7316564,  4.3425168,  8.8510481, -6.6973507, -1.4449982,  1.5411367, 
/* 170 - 179 */  2.3884696,  0.1270904, -4.7426721, -0.0306071, -4.1524353, -0.7732077, -6.1993210, -9.1217965, -2.7147859, -9.6322201, 
/* 180 - 189 */  0.6400001,  2.5483941, -8.3680449, -9.9680401, -0.8979266, -0.1020661,  0.5335943, -8.3479005,  9.3082845,  4.7956578, 
/* 190 - 199 */  2.5871062,  5.7680854,  8.4096276, -4.0162494, -6.6593667, -0.6771267, -9.8835867,  9.1537332,  5.0575942, -3.4759923, 
/* 200 - 200 */  5.4020199
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
    output[MTH_FCN_RTS][i] = exp10f (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = exp10sp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = exp10sp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = exp10sp_i (a[i]);
  }
  exp10sp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = exp10 (a_sc[i]);
    output[MTH_FCN_ASM][i] = exp10sp (a_sc[i]);
    output[MTH_FCN_CI] [i] = exp10sp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = exp10sp_i (a_sc[i]);
  }
  exp10sp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = exp10 (a_ext[i]);
    output[MTH_FCN_ASM][i] = (a_ext[i] > -256) ? exp10sp(a_ext[i]) : exp10(a_ext[i]); /* ignore large negative input for Asm */
    output[MTH_FCN_CI] [i] = exp10sp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = exp10sp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  exp10sp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = exp10sp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_RTS][i] = exp10f (input[0][i]);
  }
  profile_update (MTH_FCN_RTS);
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_ASM][i] = exp10sp (input[0][i]);
  }
  profile_update (MTH_FCN_ASM);
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    output[MTH_FCN_CI][i] = exp10sp_c (input[0][i]);
  }
  profile_update (MTH_FCN_CI);
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  exp10sp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: exp10sp_d.c                                                */
/* ======================================================================== */

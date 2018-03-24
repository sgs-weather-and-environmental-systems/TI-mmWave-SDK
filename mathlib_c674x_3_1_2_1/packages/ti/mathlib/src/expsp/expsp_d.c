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
/* expsp_d.h - exp driver file                                             */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvsp.h>
#include "expsp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*100.0)
#define RAND_OFFSET  ( -100.0)

/*  Number of input arguments */
#define NUM_INPUTS     (201)
#define NUM_SC_INPUTS    (8)
#define NUM_EXT_INPUTS (237)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-6)

/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "expSP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT|MTH_REQ_IGNORE_INF)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

float a [NUM_INPUTS] = 
{
/*   0 -  09 */ -1.192093e-07, 0.4328359, -0.8656718,  1.298508,  -1.731343, 2.164179,  -2.597015, 3.029851,  -3.462687, 3.895523,
/*  10 -  19 */ -4.328358, 4.761194,  -5.194030, 5.626866,  -6.059701, 6.492537,  -6.925373, 7.358209,  -7.791045, 8.223881,
/*  20 -  29 */ -8.656716, 9.089552,  -9.522388, 9.955224,  -10.38806, 10.82090,  -11.25373, 11.68657,  -12.11940, 12.55224,
/*  30 -  39 */ -12.98507, 13.41791,  -13.85075, 14.28358,  -14.71642, 15.14925,  -15.58209, 16.01493,  -16.44776, 16.88060,
/*  40 -  49 */ -17.31343, 17.74627,  -18.17910, 18.61194,  -19.04478, 19.47761,  -19.91045, 20.34328,  -20.77612, 21.20896,
/*  50 -  59 */ -21.64179, 22.07463,  -22.50746, 22.94030,  -23.37313, 23.80597,  -24.23881, 24.67164,  -25.10448, 25.53731,
/*  60 -  69 */ -25.97015, 26.40298,  -26.83582, 27.26866,  -27.70149, 28.13433,  -28.56716, 29.02580,  -29.43284, 29.86567,
/*  70 -  79 */ -30.29851, 30.73134,  -31.16418, 31.59702,  -32.02985, 32.46269,  -32.89552, 33.32836,  -33.76119, 34.19403,
/*  80 -  89 */ -34.62687, 35.05970,  -35.49254, 35.92537,  -36.35821, 36.79105,  -37.22388, 37.65672,  -38.08955, 38.52239,
/*  90 -  99 */ -38.95522, 39.38806,  -39.82090, 40.25373,  -40.68657, 41.11940,  -41.55224, 41.98507,  -42.41791, 42.85075,
/* 100 - 109 */ -43.28358, 43.71642,  -44.14925, 44.58209,  -45.01493, 45.44776,  -45.88060, 46.31343,  -46.74627, 47.17910,
/* 110 - 119 */ -47.61194, 48.04478,  -48.47761, 48.91045,  -49.34328, 49.77612,  -50.20895, 50.64179,  -51.07463, 51.50746,
/* 120 - 129 */ -51.94030, 52.37313,  -52.80597, 53.23881,  -53.67164, 54.10448,  -54.53732, 54.97015,  -55.40298, 55.83582,
/* 130 - 139 */ -56.26866, 56.70149,  -57.13433, 57.56717,  -58.00251, 58.43283,  -58.86567, 59.29851,  -59.73134, 60.16418,
/* 140 - 149 */ -60.59702, 61.02985,  -61.46269, 61.89552,  -62.32836, 62.76119,  -63.19403, 63.62687,  -64.05970, 64.49254,
/* 150 - 159 */ -64.92538, 65.35821,  -65.79105, 66.22388,  -66.65672, 67.08955,  -67.52238, 67.95522,  -68.38806, 68.82089,
/* 160 - 169 */ -69.25373, 69.68657,  -70.11940, 70.55224,  -70.98508, 71.41791,  -71.85075, 72.28358,  -72.71642, 73.14925,
/* 170 - 179 */ -73.58209, 74.01492,  -74.44776, 74.88060,  -75.31343, 75.74627,  -76.17911, 76.61194,  -77.04478, 77.47762,
/* 180 - 189 */ -77.91045, 78.34328,  -78.77612, 79.20895,  -79.64179, 80.07463,  -80.50746, 80.94030,  -81.37313, 81.80597,
/* 190 - 199 */ -82.23881, 82.67164,  -83.10448, 83.53732,  -83.97015, 84.40298,  -84.83582, 85.26865,  -85.70149, 86.13433,
/* 200 - 200 */ -86.56716,
};

/* This function saves the result obtained from predefined data to the specified file*/
/*
void save_output(float * output, int size)
{
  int i;
  FILE * out = fopen("../expsp_output.dat","w");

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
    output[MTH_FCN_RTS][i] = expf(a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = expsp(a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = expsp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = expsp_i (a[i]);
  }
  expsp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = expf (a_sc[i]);
    output[MTH_FCN_ASM][i] = expsp (a_sc[i]);
    output[MTH_FCN_CI] [i] = expsp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = expsp_i (a_sc[i]);
  }
  expsp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = FLT_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = expf (a_ext[i]);
    output[MTH_FCN_ASM][i] = (a_ext[i] > -256) ? expsp(a_ext[i]) : expf(a_ext[i]); /* ignore large negative input for Asm */
    output[MTH_FCN_CI] [i] = expsp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = expsp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  expsp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

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
    output[MTH_FCN_INL][i] = expsp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = expf (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = expsp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = expsp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  expsp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: expsp_d.h                                                  */
/* ======================================================================== */

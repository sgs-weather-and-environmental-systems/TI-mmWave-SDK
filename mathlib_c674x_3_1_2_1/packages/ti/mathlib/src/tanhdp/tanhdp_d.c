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
/* tanhdp_d.h - tanh driver file                                           */
/* ======================================================================= */

#include <float.h>
#include <stdio.h>
#include <math.h>

#include <ti/mathlib/src/common/common.h>
#include <ti/mathlib/src/common/drvdp.h>
#include "tanhdp.h"


/* ======================================================================== */
/*  Defines for driver test functionality                                   */
/* ======================================================================== */

/* Range for random inputs:  RAND_OFFSET to (RAND_RANGE + RAND_OFFSET) */
#define RAND_RANGE   (2*20.0)
#define RAND_OFFSET  ( -20.0)

/*  Number of input arguments */
#define NUM_INPUTS     (201)
#define NUM_SC_INPUTS    (8)
#define NUM_EXT_INPUTS (1911)

/* Floating Point Tolerances */
#define RET_VAL_TOL   (1e-10)

/* Number of random test values */
#define BUF_SIZE       (128)

/* Function name */
#define KERNEL_NAME  "tanhDP"

/* Equality comparison requirements */
#define KERNEL_REQ   (MTH_REQ_PERCENT)


/* ======================================================================== */
/*  Pre-defined input test data                                             */
/* ======================================================================== */

double a [NUM_INPUTS] =
{
/*   0 -  09 */ -0.005494607,  0.09462786,  -0.01648362, 0.02197813,  -0.02747263, 0.03296714,  -0.03846165, 0.04395615,  -0.04945066, 0.05494517,
/*  10 -  19 */ -0.06043967, 0.06593418,  -0.07142869, 0.07692319,  -0.08241770, 0.08791220,  -0.09340671, 0.09890122,  -0.1043957,  0.1098902,
/*  20 -  29 */ -0.1153847,  0.1208792,   -0.1263738,  0.1318683, -0.1373628,  0.1428573, -0.1483518,  0.1538463, -0.1593408,  0.1648353,
/*  30 -  39 */ -0.1703298,  0.1758243,   -0.1813188,  0.1868133, -0.1923078,  0.1978023, -0.2032968,  0.2087913, -0.2142859,  0.2197804,
/*  40 -  49 */ -0.2252749,  0.2307694,   -0.2362639,  0.2417584, -0.2472529,  0.2527474, -0.2582419,  0.2637364, -0.2692309,  0.2747254,
/*  50 -  59 */ -0.2802199,  0.2857144,   -0.2912090,  0.2967035, -0.3021980,  0.3076925, -0.3131870,  0.3186815, -0.3241760,  0.3296705,
/*  60 -  69 */ -0.3351650,  0.3406595,   -0.3461540,  0.3516485, -0.3571430,  0.3626375, -0.3681321,  0.3736266, -0.3791211,  0.3846156,
/*  70 -  79 */ -0.3901101,  0.3956046,   -0.4010991,  0.4065936, -0.4120881,  0.4175826, -0.4230771,  0.4285716, -0.4340661,  0.4395606,
/*  80 -  89 */ -0.4450551,  0.4505496,   -0.4560441,  0.4615386, -0.4670331,  0.4725277, -0.4780222,  0.4835167, -0.4890112,  0.4945057,
/*  90 -  99 */ -0.5000000,  0.6756757,   -0.8513514,  1.027027,  -1.202703,   1.378378,  -1.554054,   1.729730,  -1.905405,   2.081081,
/* 100 - 109 */ -2.256757,   2.432432,    -2.608108,   2.783784,  -2.959460,   3.135135,  -3.310811,   3.486486,  -3.662162,   3.837838,
/* 110 - 119 */ -4.013514,   4.189189,    -4.364865,   4.540541,  -4.716216,   4.891892,  -5.067567,   5.243243,  -5.418919,   5.594594,
/* 120 - 129 */ -5.770270,   5.945946,    -6.121622,   6.297297,  -6.472973,   6.648649,  -6.824324,   7.000000,  -7.175676,   7.351351,
/* 130 - 139 */ -7.527027,   7.702703,    -7.878378,   8.054054,  -8.229730,   8.405405,  -8.581081,   8.756757,  -8.932432,   9.108109,
/* 140 - 149 */ -9.283784,   9.459459,    -9.635135,   9.810811,  -9.986486,   10.16216,  -10.33784,   10.51351,  -10.68919,   10.86487,
/* 150 - 159 */ -11.04054,   11.21622,    -11.39189,   11.56757,  -11.74324,   11.91892,  -12.09459,   12.27027,  -12.44595,   12.62162,
/* 160 - 169 */ -12.79730,   12.97297,    -13.14865,   13.32432,  -13.50000,   13.67568,  -13.85135,   14.02703,  -14.20270,   14.37838,
/* 170 - 179 */ -14.55405,   14.72973,    -14.90541,   15.08108,  -15.25676,   15.43243,  -15.60811,   15.78378,  -15.95946,   16.13514,
/* 180 - 189 */ -16.31081,   16.48649,    -16.66216,   16.83784,  -17.01351,   17.18919,  -17.36486,   17.54054,  -17.71622,   17.89189,
/* 190 - 199 */ -18.06757,   18.24324,    -18.41892,   18.59459,  -18.77027,   18.94595,  -19.12162,   19.29730,  -19.47297,   19.64865,
/* 200 - 200 */ -19.82432,
};

/* This function saves the given data - vector to the specified file*/
/*
void save_output(double * output, int size)
{
  int i;
  FILE * out = fopen("../tanhdp_output.dat","w");

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
    output[MTH_FCN_RTS][i] = tanh (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_ASM][i] = tanhdp (a[i]);
  }
  for (i = 0; i < NUM_INPUTS; i++) {
    output[MTH_FCN_CI][i] = tanhdp_c (a[i]);
  }
  for (i = 0; i < NUM_INPUTS ; i++) {
    output[MTH_FCN_INL][i] = tanhdp_i (a[i]);
  }
  tanhdp_v (a, output[MTH_FCN_VEC], NUM_INPUTS);

//  save_output(output[MTH_FCN_INL], NUM_INPUTS);

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
    output[MTH_FCN_RTS][i] = tanh (a_sc[i]);
    output[MTH_FCN_ASM][i] = tanhdp (a_sc[i]);
    output[MTH_FCN_CI] [i] = tanhdp_c (a_sc[i]);
    output[MTH_FCN_INL][i] = tanhdp_i (a_sc[i]);
  }
  tanhdp_v (a_sc, output[MTH_FCN_VEC], NUM_SC_INPUTS);

  /* Check results and display */
  allequal (NUM_SC_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_SPECIAL);

  /* Obtain results using extended range test vectors */
  a_ext[0] = DBL_MIN;
  for (i = 0; i < NUM_EXT_INPUTS ; i++) {
    output[MTH_FCN_RTS][i] = tanh (a_ext[i]);
    output[MTH_FCN_ASM][i] = tanhdp (a_ext[i]);
    output[MTH_FCN_CI] [i] = tanhdp_c (a_ext[i]);
    output[MTH_FCN_INL][i] = tanhdp_i (a_ext[i]);
    a_ext[i+1] = a_ext[i] * (-2.1);
  }
  tanhdp_v (a_ext, output[MTH_FCN_VEC], NUM_EXT_INPUTS);

  /* Check results and display */
  allequal (NUM_EXT_INPUTS, RET_VAL_TOL, KERNEL_REQ);
  print_test_results (MTH_TST_EXTENDED);

  /* ======================================================================== */
  /*  RANDOM TEST DATA & PROFILING                                            */
  /* ======================================================================== */

  profile_init(MTH_FCN_INL);
  for (i = 0; i < BUF_SIZE; i++) {
    /* Fill input random data vector */
    input[0][i] = gimme_random (RAND_RANGE, RAND_OFFSET);

    /* Run the inline routine */
    profile_start ();
    output[MTH_FCN_INL][i] = tanhdp_i (input[0][i]);
    profile_update (MTH_FCN_INL);
  }
  profile_avg (MTH_FCN_INL, BUF_SIZE);
  
  // Time the RTS function 
  profile_init (MTH_FCN_RTS);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_RTS][i] = tanh (input[0][i]);
    profile_update (MTH_FCN_RTS);
  }
  profile_avg    (MTH_FCN_RTS, BUF_SIZE);

  // Time the fastRTS C intrinsic function
  profile_init (MTH_FCN_CI);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_CI][i] = tanhdp_c (input[0][i]);
    profile_update (MTH_FCN_CI);
  }
  profile_avg    (MTH_FCN_CI, BUF_SIZE);

  // Time the fastRTS ASM function
  profile_init (MTH_FCN_ASM);
  for (i = 0; i < BUF_SIZE; i++) {
    profile_start();
    output[MTH_FCN_ASM][i] = tanhdp (input[0][i]);
    profile_update (MTH_FCN_ASM);
  }
  profile_avg    (MTH_FCN_ASM, BUF_SIZE);


  // Time the fastRTS vector function
  profile_init (MTH_FCN_VEC);
  tanhdp_v (input[0], output[MTH_FCN_VEC], BUF_SIZE);
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
/*  End of file: tanhdp_d.h                                                 */
/* ======================================================================== */

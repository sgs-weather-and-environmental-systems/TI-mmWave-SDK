/* ======================================================================= */
/* DSPF_sp_vecmul_d.c -- Vector Multiplication                             */
/*                Driver code; tests kernel and reports result in stdout   */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/  */ 
/*                                                                         */
/*                                                                         */
/*  Redistribution and use in source and binary forms, with or without     */
/*  modification, are permitted provided that the following conditions     */
/*  are met:                                                               */
/*                                                                         */
/*    Redistributions of source code must retain the above copyright       */
/*    notice, this list of conditions and the following disclaimer.        */
/*                                                                         */
/*    Redistributions in binary form must reproduce the above copyright    */
/*    notice, this list of conditions and the following disclaimer in the  */
/*    documentation and/or other materials provided with the               */
/*    distribution.                                                        */
/*                                                                         */
/*    Neither the name of Texas Instruments Incorporated nor the names of  */
/*    its contributors may be used to endorse or promote products derived  */
/*    from this software without specific prior written permission.        */
/*                                                                         */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    */
/*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  */
/*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  */
/*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   */
/*                                                                         */
/* ======================================================================= */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <limits.h>
#include <c6x.h>

/* ======================================================================= */
/* Interface header files for the natural C and optimized C code           */
/* ======================================================================= */
#include "DSPF_sp_vecmul_cn.h"
#include "DSPF_sp_vecmul.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        4
#define CYCLE_FORMULA_NX_PT1  64
#define CYCLE_FORMULA_NX_PT2  128
/* inverse of [ 64 1] */
/*            [128 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0156,  0.0156},
 { 2.0000, -1.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];
/* ======================================================================= */
/* Tell compiler arrays are double word alligned                           */
/* ======================================================================= */
#pragma DATA_ALIGN(ptr_y_opt, 8);
#pragma DATA_ALIGN(ptr_y_cn, 8);
#pragma DATA_ALIGN(ptr_x1, 8);
#pragma DATA_ALIGN(ptr_x2, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)

float ptr_y_opt[N];
float ptr_y_cn[N];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
float ptr_x1[N] =
{
    9.562244, -7.658583, 7.386465, 1.357105, 
    -7.596975, 9.406588, 6.799334, -8.753667,    
    -4.438549, -1.807400, 2.536175, 8.382061, 
    -1.696966, 4.230003, 9.417494, -1.290560, 
    2.707639, 8.031101, 7.431675, -7.145681, 
    -5.988049, 2.418560, 5.500584, -5.063780, 
    -2.610956, -3.178051, -0.8722095, -6.583526, 
    4.912119, -8.040442, 7.805387, -8.358116, 
    5.630453, 6.973557, -0.9824524, 2.106505, 
    -2.910599, 5.181909, 1.788817, 2.231399, 
    6.863413, -0.8602419, 7.655794, -0.1285467, 
    2.457013, 1.243301, 4.433217, 0.9353981, 
    5.688828, -1.072948, 8.238159, -8.268259, 
    9.978748, 4.551621, 1.168133, -7.143517, 
    6.752739, 4.504947, -1.652407, -4.536586, 
    -3.705849, 1.633921, 3.787166, 7.277353,
    -5.782825, 0.1350317, -1.499005, -5.205998, 
    5.150465, 5.838238, -2.282402, -3.638912, 
    -0.3814974, -4.429882, -6.839276, -2.091840, 
    -4.290879, -5.138987, 2.850393, 9.138474, 
    -6.273289, 8.190338, 1.374808, -6.129670, 
    4.084768, 3.031589, -3.362062, 0.4313736, 
    -9.504731, -9.554542, 5.970487, -7.843755, 
    3.776141, 5.500513, 5.829879, 4.189381, 
    8.930758, -4.039604, 9.916422, 1.088944, 
    3.121769, 8.906977, -5.507256, 9.630362, 
    -6.587568, 8.821203, 9.139200, -6.499705, 
    -8.913804, -4.635831, 0.9201946, 5.503730, 
    2.075188, -3.678076, -1.332949, 6.855581, 
    2.522655, -4.549039, 0.2906885, 7.768009, 
    -6.514081, 6.401365, -6.376163, -8.054727, 
    -9.373704, -9.796483, 9.348938, 7.760752
};

float ptr_x2[N] = 
{
    -5.782825, 0.1350317, -1.499005, -5.205998, 
    5.150465, 5.838238, -2.282402, -3.638912, 
    -0.3814974, -4.429882, -6.839276, -2.091840, 
    -4.290879, -5.138987, 2.850393, 9.138474, 
    -6.273289, 8.190338, 1.374808, -6.129670, 
    4.084768, 3.031589, -3.362062, 0.4313736, 
    -9.504731, -9.554542, 5.970487, -7.843755, 
    3.776141, 5.500513, 5.829879, 4.189381, 
    8.930758, -4.039604, 9.916422, 1.088944, 
    3.121769, 8.906977, -5.507256, 9.630362, 
    -6.587568, 8.821203, 9.139200, -6.499705, 
    -8.913804, -4.635831, 0.9201946, 5.503730, 
    2.075188, -3.678076, -1.332949, 6.855581, 
    2.522655, -4.549039, 0.2906885, 7.768009, 
    -6.514081, 6.401365, -6.376163, -8.054727, 
    -9.373704, -9.796483, 9.348938, 7.760752,
    9.562244, -7.658583, 7.386465, 1.357105, 
    -7.596975, 9.406588, 6.799334, -8.753667,    
    -4.438549, -1.807400, 2.536175, 8.382061, 
    -1.696966, 4.230003, 9.417494, -1.290560, 
    2.707639, 8.031101, 7.431675, -7.145681, 
    -5.988049, 2.418560, 5.500584, -5.063780, 
    -2.610956, -3.178051, -0.8722095, -6.583526, 
    4.912119, -8.040442, 7.805387, -8.358116, 
    5.630453, 6.973557, -0.9824524, 2.106505, 
    -2.910599, 5.181909, 1.788817, 2.231399, 
    6.863413, -0.8602419, 7.655794, -0.1285467, 
    2.457013, 1.243301, 4.433217, 0.9353981, 
    5.688828, -1.072948, 8.238159, -8.268259, 
    9.978748, 4.551621, 1.168133, -7.143517, 
    6.752739, 4.504947, -1.652407, -4.536586, 
    -3.705849, 1.633921, 3.787166, 7.277353
};

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_opt(int n);
clock_t time_cn(int n);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
void main()
{
    clock_t t_overhead, t_start, t_stop, t_opt, t_cn;
    float pct_diff, max_pct_diff = 0;
    int i, j=1, n;
    int form_error = 0;
    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;
    for (n = 8; n <= N; n += 8) {
      /* ----------------------------------------------------------------- */
      /*  Clear state/output buffers with fixed values.                    */
      /* ----------------------------------------------------------------- */
      memset(ptr_y_opt, 0, sizeof(ptr_y_opt));
      memset(ptr_y_cn, 0, sizeof(ptr_y_cn));

      /* ----------------------------------------------------------------- */
      /* Call the individual timing routines                               */
      /* ----------------------------------------------------------------- */
      t_opt = time_opt(n) - t_overhead;
      t_cn  = time_cn(n)  - t_overhead;

      printf("DSPF_sp_vecmul\tIter#: %d\t", j++);

      /* ----------------------------------------------------------------- */
      /* compute percent difference and track max difference               */
      /* ----------------------------------------------------------------- */
      for (i = 0; i < n; i++) {           
          pct_diff = (ptr_y_cn[i] - ptr_y_opt[i]) / ptr_y_cn[i] * 100.0;
          if (pct_diff < 0) pct_diff *= -1;
          if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      }    
      if (max_pct_diff > 0.02)
          printf("Result Failure, max_pct_diff=%f\n", max_pct_diff);
      else
          printf("Result Successful ");
  
      /* ----------------------------------------------------------------- */
      /* Print timing results                                              */
      /* ----------------------------------------------------------------- */
      printf("\tN = %d\tnatC: %d\toptC: %d\n", n, t_cn, t_opt);
      if (n == CYCLE_FORMULA_NX_PT1)
        form_cycle[0] = t_opt;
      if (n == CYCLE_FORMULA_NX_PT2)
        form_cycle[1] = t_opt;
    }
    /* Provide memory information */
#ifdef __TI_COMPILER_VERSION__            // for TI compiler only
    printf("Memory:  %d bytes\n", &kernel_size);
#endif

    /* Provide profiling information */
    for (i = 0; i < FORMULA_SIZE; i++) {
        form_temp[i] = 0;
        for (j = 0; j < FORMULA_SIZE; j++) {
            form_temp[i] += form_inv[i][j] * form_cycle[j];
        }
        if (i != (FORMULA_SIZE-1)) {
            form_result[i] = (int) (form_temp[i] * FORMULA_DEVIDE + 0.5);
            if ((form_result[i] - form_temp[i] * FORMULA_DEVIDE) >  0.1 ||
                (form_result[i] - form_temp[i] * FORMULA_DEVIDE) < -0.1) {
                form_error = 1;
            }
        }
        else {
            form_result[i] = (int) (form_temp[i] + 0.5);
        }
    }

    if (!form_error)
        if (FORMULA_DEVIDE == 1) {
            printf("Cycles:  %d*Nx + %d \n", form_result[0], form_result[1]);
        }
        else {
            printf("Cycles:  %d/%d*Nx + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
        }
    else
        printf("Cycles Formula Not Available\n");
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_cn(int n)
{
    clock_t t_start, t_stop;

    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_vecmul_cn(ptr_x1, ptr_x2, ptr_y_cn, n);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_opt(int n)
{
    clock_t t_start, t_stop;
    
    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_vecmul(ptr_x1, ptr_x2, ptr_y_opt, n);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_vecmul_d.c                                       */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


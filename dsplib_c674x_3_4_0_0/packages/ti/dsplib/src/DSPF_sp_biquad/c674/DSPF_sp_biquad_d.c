/* ======================================================================= */
/* DSPF_sp_biquad_d.c -- Biquad Filter                                     */
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
#include "DSPF_sp_biquad_cn.h"
#include "DSPF_sp_biquad.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        1
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
#pragma DATA_ALIGN(ptr_delay_opt, 8);
#pragma DATA_ALIGN(ptr_delay_cn, 8);
#pragma DATA_ALIGN(ptr_ha, 8);
#pragma DATA_ALIGN(ptr_hb, 8);
#pragma DATA_ALIGN(ptr_x, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)

float ptr_y_opt[N];
float ptr_y_cn[N];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
float ptr_delay_opt[2] = { 0, 0 };
float ptr_delay_cn[2]  = { 0, 0 };

float ptr_ha[3] = { 1, -0.390641, 0.534300 };
float ptr_hb[3] = { 0.067504, 0.270019, 0.405028 };

float ptr_x[N] =
{
    -4.802592, 6.001369, -1.371723, 8.212952, 
    -6.36306, -4.723942, -7.08922, -7.278629, 
    7.385843, 1.594091, 0.9972038, -7.100904, 
    7.060621, 2.441102, -2.980952, 0.2649899, 
    -1.96384, -8.480666, -5.201677, -7.533621, 
    -6.321844, -5.20095, -1.654659, -9.006911, 
    8.054321, 8.895744, -0.1827183, -0.2149477, 
    -3.245612, 8.001078, -2.615065, -7.775945, 
    5.605041, -2.205224, -5.166174, -1.921757, 
    -8.07091, -7.360534, 8.841011, 9.122692, 
    1.504172, -8.804409, -5.304402, -2.936829
    , 6.423882, -9.691931, -9.139524, -6.620199, 
    2.98231, 4.634448, 2.95492, -0.9815254, 
    0.9401779, -4.073584, 4.893856, -6.2209, 
    3.735509, -6.329777, -2.630308, 2.512371, 
    5.604548, -8.377484, 8.587719, 5.514254, 
    -0.2641668, -1.282828, -1.064325, -3.87301, 
    0.1701736, 0.2154312, 6.352554, 5.896627, 
    2.886362, -2.427812, 6.231609, 0.6565113, 
    -2.985458, 8.780031, 7.518856, 1.003127, 
    2.449502, 1.740894, -5.845154, -3.975073, 
    -0.5815334, -5.390237, 6.886175, -6.104714, 
    -5.481565, -6.585839, -5.446714, -1.286026, 
    -3.777954, 8.467594, -1.395852, -6.303674, 
    8.097618, 9.594967, -1.2226, -7.777616, 
    -4.838706, -1.825603, 1.897922, -4.755765, 
    2.056862, 4.224316, -5.565065, -7.651647, 
    -4.066483, -3.624434, -1.516665, 0.1571655, 
    -8.289684, -4.750356, 6.020292, -9.415594, 
    8.577084, 4.606618, -0.2278204, 1.570501, 
    -5.254329, -0.8230228, 9.26177, 0.9361153, 
    0.4227161, -5.368113, -0.2220449, 2.481202
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
    int i, j, n;
    int form_error = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;
    
    for (j = 1, n = 8; n <= N; n += 8, j++) {
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
    
      printf("DSPF_sp_biquad\tIter#: %d\t", j);
    
      /* ----------------------------------------------------------------- */
      /* compute percent difference and track max difference               */
      /* ----------------------------------------------------------------- */
      for (i = 0; i < n; i++) {           
          pct_diff = (ptr_y_cn[i] - ptr_y_opt[i]) / ptr_y_cn[i] * 100.0;
          if (pct_diff < 0) pct_diff *= -1;
          if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      }    
      if (max_pct_diff > 0.02)
          printf("Result Failure, max_pct_diff=%f", max_pct_diff);
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
    DSPF_sp_biquad_cn(ptr_x, ptr_hb, ptr_ha, ptr_delay_cn, ptr_y_cn, n);
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
    DSPF_sp_biquad(ptr_x, ptr_hb, ptr_ha, ptr_delay_opt, ptr_y_opt, n);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_biquad_d.c                                       */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


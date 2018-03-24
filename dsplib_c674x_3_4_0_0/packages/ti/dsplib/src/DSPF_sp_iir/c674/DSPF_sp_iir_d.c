/* ======================================================================= */
/* DSP_iir_d.c -- IIR Filter                                               */
/*                Driver code; tests kernel and reports result in stdout   */
/*                                                                         */
/* Rev 0.0.2                                                               */
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
#include "DSPF_sp_iir_cn.h"
#include "DSPF_sp_iir.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        2//1
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
#pragma DATA_ALIGN(ptr_y1_opt, 8);
#pragma DATA_ALIGN(ptr_y2_opt, 8);
#pragma DATA_ALIGN(ptr_y1_asm, 8);
#pragma DATA_ALIGN(ptr_y2_asm, 8);
#pragma DATA_ALIGN(ptr_y1_cn, 8);
#pragma DATA_ALIGN(ptr_y2_cn, 8);
#pragma DATA_ALIGN(ptr_ha, 8);
#pragma DATA_ALIGN(ptr_hb, 8);
#pragma DATA_ALIGN(ptr_x, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)
#define PAD (4)

float ptr_y1_opt[N + PAD];
float ptr_y2_opt[N + PAD];
float ptr_y1_asm[N + PAD];
float ptr_y2_asm[N + PAD];

float ptr_y1_cn[N + PAD];
float ptr_y2_cn[N + PAD];

float ptr_x[N + PAD];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
float ptr_ha[PAD + 1] = { 1, -0.390641, 0.534300, -0.084233, 0.020651 };
float ptr_hb[PAD + 1] = { 0.067504, 0.270019, 0.405028, 0.270019, 0.067504 };

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_opt(int n);
clock_t time_i(int n);
clock_t time_cn(int n);

/* ======================================================================= */
/* Prototypes for utility functions                                        */
/* ======================================================================= */
void UTIL_fillRandSP(float *ptr_x, int n, float factor);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
void main()
{
    clock_t t_overhead, t_start, t_stop, t_opt, t_i, t_cn;
    float pct_diff, max_pct_diff = 0;
    int i, j=1, n, form_error = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    /* ------------------------------------------------------------------- */
    /*  Generate random input in range (-10, 10).                          */
    /* ------------------------------------------------------------------- */
    UTIL_fillRandSP(ptr_x, N + PAD, 10.0);

    for (n = 8; n <= N; n += 8) {
      /* ----------------------------------------------------------------- */
      /*  Clear state/output buffers with fixed values.                    */
      /* ----------------------------------------------------------------- */
      memset(ptr_y1_opt, 0, sizeof(ptr_y1_opt));
      memset(ptr_y2_opt, 0, sizeof(ptr_y2_opt));
      memset(ptr_y1_asm, 0, sizeof(ptr_y1_asm));
      memset(ptr_y2_asm, 0, sizeof(ptr_y2_asm));

      memset(ptr_y1_cn, 0, sizeof(ptr_y1_cn));
      memset(ptr_y2_cn, 0, sizeof(ptr_y2_cn));

      /* ----------------------------------------------------------------- */
      /* Call the individual timing routines                               */
      /* ----------------------------------------------------------------- */
      t_opt = time_opt(n) - t_overhead;
      t_i   = time_i(n) - t_overhead;
      t_cn  = time_cn(n)  - t_overhead;

      printf("DSPF_sp_iir\tIter#: %d\t", j++);
      /* ----------------------------------------------------------------- */
      /* compute percent difference and track max difference               */
      /* ----------------------------------------------------------------- */
      pct_diff = 0; max_pct_diff = 0;
      for (i = 0; i < (n + PAD); i++) {           
          pct_diff = (ptr_y2_cn[i] - ptr_y2_opt[i]) / ptr_y2_cn[i] * 100.0;
          if (pct_diff < 0) pct_diff *= -1;
          if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      }    
      if (max_pct_diff > 0.02)
          printf("Intrinsic Failure, max_pct_diff=%f\t", max_pct_diff);
      else
          printf("Intrinsic Successful\t");
                   
      /* ----------------------------------------------------------------- */
      /* compute percent difference and track max difference               */
      /* ----------------------------------------------------------------- */
      pct_diff = 0; max_pct_diff = 0;
      for (i = 0; i < (n + PAD); i++) {           
          pct_diff = (ptr_y2_cn[i] - ptr_y2_asm[i]) / ptr_y2_cn[i] * 100.0;
          if (pct_diff < 0) pct_diff *= -1;
          if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      }    
      if (max_pct_diff > 0.02)
          printf("Asm Failure, max_pct_diff=%f\t", max_pct_diff);
      else
          printf("Asm Successful\t");
                   
      /* ----------------------------------------------------------------- */
      /* Print timing results                                              */
      /* ----------------------------------------------------------------- */
      printf("\tN = %d\tnatC: %d\toptC: %d\tAsm: %d\n", n, t_cn, t_i, t_opt);
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
            printf("Cycles:  %d*Nr + %d \n", form_result[0], form_result[1]);
        }
        else {
            printf("Cycles:  %d/%d*Nr + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
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
    DSPF_sp_iir_cn(ptr_y1_cn, ptr_x, ptr_y2_cn, ptr_hb, ptr_ha, n);
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
    DSPF_sp_iir(ptr_y1_asm, ptr_x, ptr_y2_asm, ptr_hb, ptr_ha, n);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_i(int n)
{
    clock_t t_start, t_stop;
    
    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_iir_opt(ptr_y1_opt, ptr_x, ptr_y2_opt, ptr_hb, ptr_ha, n);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

void UTIL_fillRandSP(float *ptr_x, int n, float factor)
{
    float rand_midpoint = RAND_MAX / 2.0;
    int i;

    // fill array with floats in the range (-factor, factor)
    for (i = 0; i < n; i++)
        ptr_x[i] = ((rand() - rand_midpoint) / rand_midpoint) * factor;
}
/* ======================================================================= */
/*  End of file:  DSPF_sp_iir_d.c                                          */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


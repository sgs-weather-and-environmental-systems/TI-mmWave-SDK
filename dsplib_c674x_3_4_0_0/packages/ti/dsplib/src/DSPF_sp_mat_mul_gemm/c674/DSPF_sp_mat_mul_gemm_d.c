/* ======================================================================= */
/* DSPF_sp_mat_mul_gemm_d.c -- Matrix Multiply  “y = a*x1*x2+y"            */
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
#include "DSPF_sp_mat_mul_gemm_cn.h"
#include "DSPF_sp_mat_mul_gemm.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          8
#define FORMULA_DEVIDE        32
#define CYCLE_FORMULA_R1_PT1  12
#define CYCLE_FORMULA_R1_PT2  8
#define CYCLE_FORMULA_R2_PT1  12
#define CYCLE_FORMULA_R2_PT2  8
#define CYCLE_FORMULA_C2_PT1  12
#define CYCLE_FORMULA_C2_PT2  8
/* inverse of [12*12*12 12*12 12*12 12*12 12 12 12 1] */
/*            [12*12* 8 12*12 12* 8 12* 8 12 12  8 1] */
/*            [12* 8*12 12* 8 12*12  8*12 12  8 12 1] */
/*            [ 8*12*12  8*12  8*12 12*12  8 12 12 1] */
/*            [12* 8* 8 12* 8 12* 8  8* 8 12  8  8 1] */
/*            [ 8*12* 8  8*12  8* 8 12* 8  8 12  8 1] */
/*            [ 8* 8*12  8* 8  8*12  8*12  8  8 12 1] */
/*            [ 8* 8* 8  8* 8  8* 8  8* 8  8  8  8 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{ 0.0156,   -0.0156,   -0.0156,   -0.0156,    0.0156,    0.0156,    0.0156,   -0.0156},
 {-0.1250,    0.1875,    0.1250,    0.1250,   -0.1875,   -0.1875,   -0.1250,    0.1875},
 {-0.1250,    0.1250,    0.1875,    0.1250,   -0.1875,   -0.1250,   -0.1875,    0.1875},
 {-0.1250,    0.1250,    0.1250,    0.1875,   -0.1250,   -0.1875,   -0.1875,    0.1875},
 { 1.0000,   -1.5000,   -1.5000,   -1.0000,    2.2500,    1.5000,    1.5000,   -2.2500},
 { 1.0000,   -1.5000,   -1.0000,   -1.5000,    1.5000,    2.2500,    1.5000,   -2.2500},
 { 1.0000,   -1.0000,   -1.5000,   -1.5000,    1.5000,    1.5000,    2.2500,   -2.2500},
 {-8.0000,   12.0000,   12.0000,   12.0000,  -18.0000,  -18.0000,  -18.0000,   27.0000}
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
#define NR1 (16)
#define NC1 (16)
#define NC2 (16)

float ptr_y_opt[NR1 * NC2];
float ptr_y_cn[NR1 * NC2];
float ptr_x1[NR1 * NC1];
float ptr_x2[NC1 * NC2];

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_opt(int r1, int c1r2, int c2);
clock_t time_cn(int r1, int c1r2, int c2);

/* ======================================================================= */
/* Prototypes for utility functions                                        */
/* ======================================================================= */
void UTIL_fillRandSP(float *ptr_x, int N, float factor);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
void main()
{
    clock_t t_overhead, t_start, t_stop, t_opt, t_cn;
    int i, j=1, r1 = NR1, c1r2 = NC1, c2 = NC2;
    int form_error = 0;
    float pct_diff, max_pct_diff = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    /* ------------------------------------------------------------------- */
    /*  Generate random inputs in range (-10, 10).                         */
    /* ------------------------------------------------------------------- */
    UTIL_fillRandSP(ptr_x1, NR1 * NC1, 10.0);
    UTIL_fillRandSP(ptr_x2, NC1 * NC2, 10.0);
    

    for(r1 = 8, i = 1; r1 <= NR1; r1 += 4) {
      for(c1r2 = 8; c1r2 <= NC1; c1r2 += 4) {
        for(c2 = 8; c2 <= NC2; i++, c2 += 4) {
          /* ------------------------------------------------------------- */
          /*  Clear state/output buffers with fixed values.                */
          /* ------------------------------------------------------------- */
          //memset(ptr_y_opt, 0, sizeof(ptr_y_opt));
          //memset(ptr_y_cn, 0, sizeof(ptr_y_cn));
          UTIL_fillRandSP(ptr_y_cn, NC1 * NC2, 10.0);
          memcpy(ptr_y_opt, ptr_y_cn, sizeof(ptr_y_cn));

          /* ------------------------------------------------------------- */
          /* Call the individual timing routines                           */
          /* ------------------------------------------------------------- */
          t_opt = time_opt(r1, c1r2, c2) - t_overhead;
          t_cn  = time_cn(r1, c1r2, c2)  - t_overhead;

          printf("DSPF_sp_mat_mul_gemm\tIter#: %d\t", j++);

          /* ------------------------------------------------------------- */
          /* compute percent difference and track max difference           */
          /* ------------------------------------------------------------- */
          for (i = 0; i < r1 * c2; i++) {           
              pct_diff = (ptr_y_cn[i] - ptr_y_opt[i]) / ptr_y_cn[i] * 100.0;
              if (pct_diff < 0) pct_diff *= -1;
              if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
          }    
          if (max_pct_diff > 0.05)
              printf("Result Failure, max_pct_diff=%f\n", max_pct_diff);
          else
              printf("Result Successful ");
      
          /* ------------------------------------------------------------- */
          /* Print timing results                                          */
          /* ------------------------------------------------------------- */
          printf("\tNR = %.2d\tNC1 = %.2d\tNC2 = %.2d\tnatC: %d\toptC: %d\n", r1, c1r2, c2, t_cn, t_opt);
          if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT1)
              form_cycle[0] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT1)
              form_cycle[1] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT1)
              form_cycle[2] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT2)
              form_cycle[3] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT1)
              form_cycle[4] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT2)
              form_cycle[5] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT2)
              form_cycle[6] = t_opt;
          if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT2)
              form_cycle[7] = t_opt;
        }
      }
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

    if (!form_error) {
      printf("Cycles:  ");
      if (form_result[0])
        printf("%d/%d*r1*c2*c1 + ", form_result[0], FORMULA_DEVIDE);
      if (form_result[1])
        printf("%d/%d*r1*c2 + ", form_result[1], FORMULA_DEVIDE);
      if (form_result[2])
        printf("%d/%d*r1*c1 + ", form_result[2], FORMULA_DEVIDE);
      if (form_result[3])
        printf("%d/%d*c2*c1 + ", form_result[3], FORMULA_DEVIDE);
      if (form_result[4])
        printf("%d/%d*r1 + ", form_result[4], FORMULA_DEVIDE);
      if (form_result[5])
        printf("%d/%d*c2 + ", form_result[5], FORMULA_DEVIDE);
      if (form_result[6])
        printf("%d/%d*c1 + ", form_result[6], FORMULA_DEVIDE);
      if (form_result[7])
        printf("%d\n", form_result[7]);
    }
    else
      printf("Cycles Formula Not Available\n");
    
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_cn(int r1, int c1r2, int c2)
{
    clock_t t_start, t_stop;

    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_mat_mul_gemm_cn(ptr_x1, 10.01, r1, c1r2, ptr_x2, c2, ptr_y_cn);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_opt(int r1, int c1r2, int c2)
{
    clock_t t_start, t_stop;
    
    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_mat_mul_gemm(ptr_x1, 10.01, r1, c1r2, ptr_x2, c2, ptr_y_opt);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

void UTIL_fillRandSP(float *ptr_x, int N, float factor)
{
    float rand_midpoint = RAND_MAX / 2.0;
    int i;

    // fill array with floats in the range (-factor, factor)
    for (i = 0; i < N; i++)
        ptr_x[i] = ((rand() - rand_midpoint) / rand_midpoint) * factor;
}
/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_gemm_d.c                                 */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


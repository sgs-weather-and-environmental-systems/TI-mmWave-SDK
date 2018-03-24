/* ======================================================================= */
/* DSP_dotprod_d.c -- Dot Product                                          */
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
#include "DSPF_sp_dotprod_cn.h"
#include "DSPF_sp_dotprod.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        2
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
#pragma DATA_ALIGN(y_opt, 8);
#pragma DATA_ALIGN(y_cn, 8);
#pragma DATA_ALIGN(ptr_x1, 8);
#pragma DATA_ALIGN(ptr_x2, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)

float y_opt, y_cn;
float ptr_x1[N], ptr_x2[N];

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_opt(int n);
clock_t time_cn(int n);

/* ======================================================================= */
/* Prototypes for utility functions                                        */
/* ======================================================================= */
void UTIL_fillRandSP(float *ptr_x, int n, float factor);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop, t_opt, t_cn;
    int i, j=1, n, form_error = 0;
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
    /*  Fill input arrays with randomized data in range (-10, 10).         */
    /* ------------------------------------------------------------------- */
    UTIL_fillRandSP(ptr_x1, N, 10.0);
    UTIL_fillRandSP(ptr_x2, N, 10.0);

    /* ------------------------------------------------------------------- */
    /*  Clear state/output buffers with fixed values.                      */
    /* ------------------------------------------------------------------- */
    for (n = 8; n <= N; n += 8) {
      /* ----------------------------------------------------------------- */
      /* Call the individual timing routines                               */
      /* ----------------------------------------------------------------- */
      t_opt = time_opt(n) - t_overhead;
      t_cn  = time_cn(n)  - t_overhead;

      printf("DSPF_sp_dotp_cplx\tIter#: %d\t", j++);

      /* ----------------------------------------------------------------- */
      /* compute percent difference and track max difference               */  
      /* ----------------------------------------------------------------- */
      pct_diff = (y_cn - y_opt) / y_cn * 100.0;
      if (pct_diff < 0) pct_diff *= -1;
      if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      if (max_pct_diff > 0.001)
          printf("Result Failure  max_pct_diff = %f", max_pct_diff);
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
    y_cn = DSPF_sp_dotprod_cn(ptr_x1, ptr_x2, n);
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
    y_opt = DSPF_sp_dotprod(ptr_x1, ptr_x2, n);
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
/*  End of file:  DSPF_sp_dotprod_d.c                                      */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


/* ======================================================================= */
/* DSPF_sp_bitrev_cplx_d.c -- Complex Bit Reversal                         */
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
#include <math.h>
#include <c6x.h>

#include "DSPF_sp_bitrev_cplx.h"
#include "DSPF_sp_bitrev_cplx_cn.h"

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

void bitrev_index(short *index, int nx);

/* ======================================================================== */
/*  Kernel-specific alignments                                              */
/* ======================================================================== */
#pragma DATA_ALIGN(ptr_x_i, 8);
#pragma DATA_ALIGN(ptr_x_cn, 8);
#pragma DATA_ALIGN(ptr_index, 8);

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define NX (128)
#define NI (16)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */

float ptr_x_i[2 * NX];
float ptr_x_cn[2 * NX];

short ptr_index[NI];

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */

void main ()
{
    int i, j=1, nx, form_error = 0;
    clock_t t_start, t_stop, t_overhead, t_cn, t_opt;
    float pct_diff, max_pct_diff = 0;

    /* -------------------------------------------------------------------- */
    /* Initialize input vector temporarily.                                 */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < NX; i+=2)
    {
        ptr_x_i[2 * i] = sin (2 * 3.1415 * 500 * i / (double) NX);
        ptr_x_i[2 * i + 1] = sin (2 * 3.1415 * 1000 * i / (double) NX);
    }

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /* Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.    */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(nx = 4; nx <= NX; nx += 4) {
      /* ------------------------------------------------------------------ */
      /* Copy vector to other input.                                        */
      /* ------------------------------------------------------------------ */
      memcpy(ptr_x_cn, ptr_x_i, sizeof (ptr_x_cn));
      memset(ptr_index, 0, sizeof(ptr_index));
      
      /* ------------------------------------------------------------------ */
      /* Generate index table.                                              */
      /* ------------------------------------------------------------------ */
      bitrev_index(ptr_index, nx);

      t_start = _itoll(TSCH, TSCL);
      DSPF_sp_bitrev_cplx_cn ((double *)ptr_x_cn, ptr_index, nx);
      t_stop = _itoll(TSCH, TSCL);
      t_cn = (t_stop - t_start) - t_overhead;
    
      t_start = _itoll(TSCH, TSCL);
      DSPF_sp_bitrev_cplx ((double *)ptr_x_i, ptr_index, nx);
      t_stop = _itoll(TSCH, TSCL);
      t_opt = (t_stop - t_start) - t_overhead;

      printf("DSPF_sp_bitrev_cplx\tIter#: %d\t", j++);

      /* ------------------------------------------------------------------ */
      /* compute percent difference and track max difference                */  
      /* ------------------------------------------------------------------ */
      for(i=0; i<nx; i++) {
        pct_diff = (ptr_x_cn[i] - ptr_x_i[i]) / ptr_x_cn[i] * 100.0;
        if (pct_diff < 0) pct_diff *= -1;
        if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
      }
      if (max_pct_diff > 0.008)
          printf("Result Failure  max_pct_diff = %f", max_pct_diff);
      else
          printf("Result Successful ");
          
      /* ------------------------------------------------------------------ */
      /* Print timing results                                               */
      /* ------------------------------------------------------------------ */
      printf("\tNX = %d\tnatC: %d\toptC: %d\n", nx, t_cn, t_opt);

      if (nx == CYCLE_FORMULA_NX_PT1)
        form_cycle[0] = t_opt;
      if (nx == CYCLE_FORMULA_NX_PT2)
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

/* -------------------------------------------------------- */
/* This routine calculates the index for bit reversal of    */
/* an array of length nx. The length of the index table is  */
/* 2^(2*ceil(k/2)) where nx = 2^k.                          */
/*                                                          */
/* In other words, the length of the index table is:        */
/* - for even power of radix: sqrt(nx)                      */
/* - for odd power of radix: sqrt(2*nx)                     */
/* -------------------------------------------------------- */
void bitrev_index(short *index, int nx)
{
    int i, j, k, radix = 2;
    short nbits, nbot, ntop, ndiff, n2, raddiv2;
    nbits = 0;
    i = nx;

    while (i > 1)
    {
        i = i >> 1;
        nbits++;
    }

    raddiv2 = radix >> 1;
    nbot = nbits >> raddiv2;
    nbot = nbot << raddiv2 - 1;
    ndiff = nbits & raddiv2;
    ntop = nbot + ndiff;
    n2 = 1 << ntop;
    index[0] = 0;

    for ( i = 1, j = n2/radix + 1; i < n2 - 1; i++)
    {
        index[i] = j - 1;
        for (k = n2/radix; k*(radix-1) < j; k /= radix)
            j -= k*(radix-1);
        j += k;
    }

    index[n2 - 1] = n2 - 1;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_bitrev_cplx_d.c                                  */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

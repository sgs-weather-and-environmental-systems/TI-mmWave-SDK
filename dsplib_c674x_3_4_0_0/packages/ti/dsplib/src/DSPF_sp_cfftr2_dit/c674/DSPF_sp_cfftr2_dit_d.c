/* ======================================================================= */
/* DSPF_sp_cfftr2_dit_d.c -- Complex Forward FFT with Radix 2 and DIT      */
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

#include "DSPF_sp_cfftr2_dit.h"
#include "DSPF_sp_cfftr2_dit_cn.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif
extern char kernel_size;

void gen_w_r2(float* w, int n);
void bit_rev(float* x, int n);

/* ======================================================================== */
/*  Kernel-specific alignments                                              */
/* ======================================================================== */
#pragma DATA_ALIGN(x_asm, 8);
#pragma DATA_ALIGN(x_cn, 8);

#pragma DATA_ALIGN(w, 8);

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define N (256)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */

float x_asm[N * 2];
float x_cn[N * 2];

float w[N * 2];

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */

int main ()
{
    int i;
    clock_t t_start, t_stop, t_overhead;
    float pct_diff, max_pct_diff = 0;

    memset (x_asm, 0x55, sizeof (x_asm));
    memset (x_cn, 0x55, sizeof (x_cn));

    /* -------------------------------------------------------------------- */
    /* Initialize input vector temporarily.                                 */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < 2*N; i++)
    {
        x_asm[2 * i] = sin (2 * 3.1415 * 500 * i / (double) N);
        x_asm[2 * i + 1] = sin (2 * 3.1415 * 1000 * i / (double) N);
    }
    /* -------------------------------------------------------------------- */
    /* Copy vector to all inputs.                                           */
    /* -------------------------------------------------------------------- */
    memcpy (x_cn, x_asm, sizeof (x_cn));

    /* -------------------------------------------------------------------- */
    /* Generate bit-reversed coefficient table.                             */
    /* -------------------------------------------------------------------- */
    gen_w_r2(w, N);
    bit_rev(w, N >> 1);

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /* Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.    */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    printf ("Cycle Counts:\t");
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_cfftr2_dit_cn(x_cn, w, N);
    t_stop = _itoll(TSCH, TSCL);
    printf ("natC: %u\t", (t_stop - t_start) - t_overhead);

    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_cfftr2_dit(x_asm, w, N);
    t_stop = _itoll(TSCH, TSCL);
    printf ("ASM:  %u\t", (t_stop - t_start) - t_overhead);

    /* ---------------------------------------------------------------- */
    /* compute percent difference and track max difference              */  
    /* ---------------------------------------------------------------- */
    for(i=0; i<2*N; i++) {
      pct_diff = (x_cn[i] - x_asm[i]) / x_cn[i] * 100.0;
      if (pct_diff < 0) pct_diff *= -1;
      if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
    }
    if (max_pct_diff > 0.001)
        printf("Result Failure  max_pct_diff = %f\n", max_pct_diff);
    else
        printf("Result Successful\n");

    /* Provide memory information */
#ifdef __TI_COMPILER_VERSION__            // for TI compiler only
    printf("Memory:  %d bytes\n", &kernel_size);
#endif

    /* Provide profiling information */
    printf("Cycles:  %d (N=256)\n", (t_stop - t_start) - t_overhead);
}

/* generate real and imaginary twiddle table of size n/2 complex numbers */
void gen_w_r2(float* w, int n)
{
    int i;
    float pi = 4.0 * atan(1.0);
    float e = pi * 2.0 / n;

    for(i = 0; i < (n >> 1); i++)
    {
        w[2 * i] = cos(i * e);
        w[2 * i + 1] = sin(i * e);
    }
}

/* bit reverse coefficients */
void bit_rev(float* x, int n)
{
    int i, j, k;
    float rtemp, itemp;
    j = 0;

    for(i=1; i < (n-1); i++)
    {
        k = n >> 1;

        while(k <= j)
        {
            j -= k;
            k >>= 1;
        }

        j += k;

        if(i < j)
        {
            rtemp = x[j*2];
            x[j*2] = x[i*2];
            x[i*2] = rtemp;
            itemp = x[j*2+1];
            x[j*2+1] = x[i*2+1];
            x[i*2+1] = itemp;
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_cfftr2_dit_d.c                                   */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

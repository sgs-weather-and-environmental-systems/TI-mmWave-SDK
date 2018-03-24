/* ======================================================================= */
/* DSP_fltoq15_d.c -- Float to Q15 conversion                              */
/*                    Driver code implementation                           */
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
#include "DSP_fltoq15_cn.h"
#include "DSP_fltoq15.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        1
#define CYCLE_FORMULA_NX_PT1  32
#define CYCLE_FORMULA_NX_PT2  64
/* inverse of [32 1] */
/*            [64 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0313,  0.0313},
 { 2.0000, -1.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================= */
/* Inform the compiler the arrays are double word alligned                 */
/* ======================================================================= */
#pragma DATA_ALIGN(flt, 4);
#pragma DATA_ALIGN(q15_c, 4);
#pragma DATA_ALIGN(q15_i, 4);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (64)

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
const float flt[N] =
{
     3.40282346e+38F,       /* max float                            */
     2.0F,                  /* saturate (exceeds max Q.15 number)   */
     1.000030517578F,       /* saturate (exceeds max Q.15 number)   */
     1.0F,                  /* saturate (exceeds max Q.15 number)   */
     0.999969482F,          /* max pos Q.15 number                  */
     0.5F,
     0.000030617578125F,    /* 1, round towards - inf               */
     0.000030517578125F,    /* 1, pos Q.15 number closest to 0      */
     0.0F,                  /* zero                                 */
    -0.000030517578125F,    /* -1, neg Q.15 number closest to 0     */
    -0.000030617578125F,    /* -2, round towards -inf               */
    -0.5F,
    -1.0F,                  /* most negative Q.15 number            */
    -1.000030517578F,       /* saturate                             */
    -2.0F,                  /* saturate                             */
    -512.0F,                /* saturate                             */
     3.40282346e+38F,       /* max float                            */
     2.0F,                  /* saturate (exceeds max Q.15 number)   */
     1.000030517578F,       /* saturate (exceeds max Q.15 number)   */
     1.0F,                  /* saturate (exceeds max Q.15 number)   */
     0.999969482F,          /* max pos Q.15 number                  */
     0.5F,
     0.000030617578125F,    /* 1, round towards - inf               */
     0.000030517578125F,    /* 1, pos Q.15 number closest to 0      */
     0.0F,                  /* zero                                 */
    -0.000030517578125F,    /* -1, neg Q.15 number closest to 0     */
    -0.000030617578125F,    /* -2, round towards -inf               */
    -0.5F,
    -1.0F,                  /* most negative Q.15 number            */
    -1.000030517578F,       /* saturate                             */
    -2.0F,                  /* saturate                             */
    -512.0F,                /* saturate                             */
     3.40282346e+38F,       /* max float                            */
     2.0F,                  /* saturate (exceeds max Q.15 number)   */
     1.000030517578F,       /* saturate (exceeds max Q.15 number)   */
     1.0F,                  /* saturate (exceeds max Q.15 number)   */
     0.999969482F,          /* max pos Q.15 number                  */
     0.5F,
     0.000030617578125F,    /* 1, round towards - inf               */
     0.000030517578125F,    /* 1, pos Q.15 number closest to 0      */
     0.0F,                  /* zero                                 */
    -0.000030517578125F,    /* -1, neg Q.15 number closest to 0     */
    -0.000030617578125F,    /* -2, round towards -inf               */
    -0.5F,
    -1.0F,                  /* most negative Q.15 number            */
    -1.000030517578F,       /* saturate                             */
    -2.0F,                  /* saturate                             */
    -512.0F,                /* saturate                             */
     3.40282346e+38F,       /* max float                            */
     2.0F,                  /* saturate (exceeds max Q.15 number)   */
     1.000030517578F,       /* saturate (exceeds max Q.15 number)   */
     1.0F,                  /* saturate (exceeds max Q.15 number)   */
     0.999969482F,          /* max pos Q.15 number                  */
     0.5F,
     0.000030617578125F,    /* 1, round towards - inf               */
     0.000030517578125F,    /* 1, pos Q.15 number closest to 0      */
     0.0F,                  /* zero                                 */
    -0.000030517578125F,    /* -1, neg Q.15 number closest to 0     */
    -0.000030617578125F,    /* -2, round towards -inf               */
    -0.5F,
    -1.0F,                  /* most negative Q.15 number            */
    -1.000030517578F,       /* saturate                             */
    -2.0F,                  /* saturate                             */
    -512.0F,                /* saturate                             */
};

/* ======================================================================== */
/*  Result arrays, with padding to catch output overrun.                    */
/* ======================================================================== */
short q15_c[N];
short q15_i[N];

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int n);
clock_t time_i(int n);

/* ======================================================================= */
/* MAIN -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop;
    clock_t t_c, t_i;
    int i, j, n, fail = 0;
    int form_error = 0;

    /* =================================================================== */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /* Compute overhead of calling _itoll(TSCH, TSCL) twice to get timing info        */
    /* =================================================================== */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for (n = 2, i = 1; n <= N; i++, n += 2) {
        /* -------------------------------------------------------------------- */
        /*  Fill output buffers with fixed values.                              */
        /* -------------------------------------------------------------------- */
        memset(q15_c, 0x5A, sizeof(q15_c));
        memset(q15_i, 0x5A, sizeof(q15_i));

        /* =================================================================== */
        /* Call the individual timing routines, and subtract off overhead      */
        /* =================================================================== */
        t_c = time_c(n) - t_overhead;    // Calculate time to run Natural C Algorithm
        t_i = time_i(n) - t_overhead;    // Calculate time to run Optimized C Algorithm

        /* =================================================================== */
        /* Print timing results                                                */
        /* =================================================================== */
        printf("DSP_fltoq15\tIter#: %d\t", i);

        /* =================================================================== */
        /* Check the results arrays, and report any failures                   */
        /* =================================================================== */
        if (memcmp(q15_i, q15_c, sizeof(q15_c))) {
            fail++;
            printf("Result failure (q15_i)");
        }
        else
            printf("Result successful (q15_i)");

        printf("\tN = %d\tnatC: %d, optC: %d\n", n, t_c, t_i);

        if (n == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (n == CYCLE_FORMULA_NX_PT2)
          form_cycle[1] = t_i;
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

    return(fail);
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fltoq15_cn(flt, q15_c, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_i(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fltoq15(flt, q15_i, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_flttoq15_d.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


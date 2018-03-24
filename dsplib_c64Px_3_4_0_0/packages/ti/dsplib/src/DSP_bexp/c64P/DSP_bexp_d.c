/* ======================================================================= */
/* DSP_bexp_d.c -- Block exponent of a vector                              */
/*                 Driver code implementation                              */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
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
/* Interface header files for the natural C and optimized C code           */
/* ======================================================================= */
#include "DSP_bexp.h"
#include "DSP_bexp_cn.h"

/* ======================================================================= */
/* Inform the compiler the arrays are double word alligned                 */
/* ======================================================================= */
#pragma DATA_ALIGN(x, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)
#define PAD (16)

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
const int x[N + 2*PAD] =
{
     0x00000000,  0x00000000,  0x00000000,  0x00000000, // Beginning Pad
     0x00000000,  0x00000000,  0x00000000,  0x00000000, // Beginning Pad
     0x00000000,  0x00000000,  0x00000000,  0x00000000, // Beginning Pad
     0x00000000,  0x00000000,  0x00000000,  0x00000000, // Beginning Pad

     0x00000001,  0x00000002,  0x00000004,  0x00000006,
     0x00000010,  0x00000020,  0x00000040,  0x00000060,
     0x00000100,  0x00000200,  0x00000400,  0x00000600,
     0x00001000,  0x00002000,  0x00004000,  0x00006000,
     0x00010000,  0x00020000,  0x00040000,  0x00060000,
     0x00100000,  0x00200000,  0x00400000,  0x00600000,
     0x01000000,  0x02000000,  0x04000000,  0x06000000,
     0x10000000,  0x20000000,  0x40000000,  0x60000000,
    -0x00000001, -0x00000002, -0x00000004, -0x00000006,
    -0x00000010, -0x00000020, -0x00000040, -0x00000060,
    -0x00000100, -0x00000200, -0x00000400, -0x00000600,
    -0x00001000, -0x00002000, -0x00004000, -0x00006000,
    -0x00010000, -0x00020000, -0x00040000, -0x00060000,
    -0x00100000, -0x00200000, -0x00400000, -0x00600000,
    -0x01000000, -0x02000000, -0x04000000, -0x06000000,
    -0x10000000, -0x20000000, -0x40000000, -0x60000000,
     0x00000008,  0x0000000A,  0x0000000C,  0x0000000E,
     0x00000080,  0x000000A0,  0x000000C0,  0x000000E0,
     0x00000800,  0x00000A00,  0x00000C00,  0x00000E00,
     0x00008000,  0x0000A000,  0x0000C000,  0x0000E000,
     0x00080000,  0x000A0000,  0x000C0000,  0x000E0000,
     0x00800000,  0x00A00000,  0x00C00000,  0x00E00000,
     0x08000000,  0x0A000000,  0x0C000000,  0x0E000000,
     0x80000000,  0xA0000000,  0xC0000000,  0xE0000000,
    -0x00000008, -0x0000000A, -0x0000000D, -0x0000000E,
    -0x00000080, -0x000000A0, -0x000000D0, -0x000000E0,
    -0x00000800, -0x00000A00, -0x00000D00, -0x00000E00,
    -0x00008000, -0x0000A000, -0x0000D000, -0x0000E000,
    -0x00080000, -0x000A0000, -0x000D0000, -0x000E0000,
    -0x00800000, -0x00A00000, -0x00D00000, -0x00E00000,
    -0x08000000, -0x0A000000, -0x0D000000, -0x0E000000,
    -0x80000000, -0xA0000000, -0xD0000000, -0xE0000000,

     0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF, // Ending Pad
     0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF, // Ending Pad
     0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF, // Ending Pad
     0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF,  0x7FFFFFFF, // Ending Pad
};

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_cn(int n);
clock_t time_i(int n);

int max_cn;
int max_i;

/* ======================================================================= */
/* MAIN -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop;
    clock_t t_cn, t_i;
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

    /* =================================================================== */
    /* Loop through multiple test cases to check if algorithm works for    */
    /* all valid values of N. See kernel for algorithm restrictions.       */
    /* =================================================================== */
    for (n = 8, i = 1; n <= N; n += 8, i++) {
		/* ================================================================= */
        /* Call the individual timing routines, and subtract off overhead    */
        /* ================================================================= */
        t_cn = time_cn(n) - t_overhead;    // Calculate time to run Natural C Algorithm
        t_i = time_i(n) - t_overhead;    // Calculate time to run Intrinsic C Algorithm

        /* ================================================================= */
        /* Print iteration information                                       */
        /* ================================================================= */
        printf("DSP_bexp\tIter#: %d\t", i);

        /* ================================================================= */
        /* Check the results arrays, and report any failures                 */
        /* ================================================================= */
        if (memcmp(&max_i, &max_cn, sizeof(max_cn))) {
            fail++;
            printf("Result failure (max_i)");
        }
        else
            printf("Result successful (max_i)");

        /* ================================================================= */
        /* Print timing results                                              */
        /* ================================================================= */
        printf("\tN = %d\tnatC: %d\tintC: %d\n", n, t_cn, t_i);

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
      printf("Cycles:  %d/%d*Nx + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
    else
      printf("Cycles Formula Not Available\n");

    return(fail);
}

/* ======================================================================= */
/* Timing Functions                                                        */
/* ======================================================================= */
clock_t time_cn(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    max_cn = DSP_bexp_cn(x + PAD, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

clock_t time_i(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    max_i = DSP_bexp(x + PAD, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_bexp_d.c                                             */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


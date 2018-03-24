/* ======================================================================= */
/* DSPF_q15tofl_d.c -- Float to Q15 conversion                             */
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
#include "DSPF_q15tofl_cn.h"
#include "DSPF_q15tofl.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        2
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
#pragma DATA_ALIGN(q15, 8);
#pragma DATA_ALIGN(flt_c, 8);
#pragma DATA_ALIGN(flt_i, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define N (128)

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
short q15[N] =
{
    0x76E2, 0x8B0E, 0x4A09, 0xBA35, 0xEB22, 0xE6EB, 0x8CCF, 0xDF71,
    0xAACF, 0x3CE2, 0xADDA, 0x3E77, 0x8CA7, 0x6C43, 0x0F68, 0xCCF6,
    0x5A0A, 0xCD7B, 0x8397, 0xA5BC, 0xB196, 0x963C, 0x61C8, 0xE43A,
    0x1C8B, 0x55F2, 0x32B9, 0xB3DD, 0xE468, 0x64CE, 0x3F29, 0x2815,
    0x99CB, 0x813E, 0xCAB7, 0xE031, 0xE954, 0x8AF2, 0x9943, 0x2780,
    0x8DC1, 0x2C18, 0xA0EA, 0x6371, 0x9033, 0x2F1F, 0xF36D, 0xB972,
    0x5B46, 0x9837, 0x6009, 0x7354, 0x7CBB, 0xCB4E, 0x4D5F, 0x90E4,
    0x27B1, 0xCBF3, 0xD4CD, 0xCA53, 0xD3A7, 0xDD56, 0xEF72, 0x866E,
    0x637B, 0x6CE5, 0x084D, 0x3A65, 0xCA8D, 0x45D0, 0x8A5D, 0xB246,
    0x031B, 0xBC84, 0xB401, 0x9DC2, 0xB285, 0xE273, 0x6C99, 0xE626,
    0x3D8A, 0x5E49, 0x0742, 0xDAE3, 0x7488, 0x5DF7, 0x36BD, 0xA466,
    0xBE5F, 0x8DAB, 0x6647, 0xCF7F, 0x8A8D, 0xBFF5, 0x3E81, 0x867D,
    0x1CD2, 0x1103, 0xF7C9, 0x8B0F, 0xAE8D, 0x03A4, 0x22BE, 0x7CC3,
    0x739C, 0x9D08, 0xC9DF, 0xB2AA, 0x155F, 0x2D3D, 0x79AC, 0xD731,
    0x9654, 0x0273, 0x9582, 0x5C69, 0xBC3B, 0xB957, 0x3641, 0x293F,
    0x3533, 0x94DA, 0x1E69, 0xE5A3, 0xD45A, 0xC82B, 0x8758, 0xFAC3,
};

/* ======================================================================== */
/*  Result arrays, with padding to catch output overrun.                    */
/* ======================================================================== */
float flt_c[N];
float flt_i[N];

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

    for(n = 4, i = 1; n <= N; i++, n += 4) {
        /* -------------------------------------------------------------------- */
        /*  Fill output buffers with fixed values.                              */
        /* -------------------------------------------------------------------- */
        memset(flt_c, 0x5A, sizeof(flt_c));
        memset(flt_i, 0x5A, sizeof(flt_i));

        /* =================================================================== */
        /* Call the individual timing routines, and subtract off overhead      */
        /* =================================================================== */
        t_c = time_c(n) - t_overhead;   // Calculate time to run Natural C Algorithm
        t_i = time_i(n) - t_overhead;   // Calculate time to run Optimized C Algorithm

        /* =================================================================== */
        /* Print timing results                                                */
        /* =================================================================== */
        printf("DSPF_q15tofl\tIter#: %d\t", i);

        /* =================================================================== */
        /* Check the results arrays, and report any failures                   */
        /* =================================================================== */
        if (memcmp(flt_i, flt_c, sizeof(flt_c))) {
            fail++;
            printf("Result Failure (flt_i)");
        }
        else
            printf("Result Successful (flt_i)");

        printf("\tN = %d\tnatC: %d\toptC: %d\n", n, t_c, t_i);

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
    DSPF_q15tofl_cn(q15, flt_c, n);
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
    DSPF_q15tofl(q15, flt_i, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSPF_q15tofl_d.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


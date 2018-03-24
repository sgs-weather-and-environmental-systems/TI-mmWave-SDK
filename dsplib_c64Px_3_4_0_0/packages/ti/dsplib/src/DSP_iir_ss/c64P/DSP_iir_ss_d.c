/* ======================================================================= */
/* DSP_iir_ss_d.c -- IIR Filter                                            */
/*                Driver code implementation                               */
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
#include "DSP_iir_ss_cn.h"
#include "DSP_iir_ss.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        8
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
/* Tell compiler arrays are double word alligned                           */
/* ======================================================================= */
#pragma DATA_ALIGN(ptr_Coefs, 8);
#pragma DATA_ALIGN(ptr_Input, 8);
#pragma DATA_ALIGN(ptr_State, 8);
#pragma DATA_ALIGN(ptr_r_c, 8);
#pragma DATA_ALIGN(ptr_r_i, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define NCOEFS  (64)
#define N       (128)
#define T       (NCOEFS + PAD)
#define PAD     (8)
#define SFB     (16383.5)

short ptr_State[N + PAD];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
short ptr_Coefs[NCOEFS + 2 * PAD] =
{
    0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000,
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    (short)(-2.0*SFB), (short)(1.0*SFB),
    (short)( 1.4*SFB), (short)(-0.74*SFB),
    (short)( 2.0*SFB), (short)(1.0*SFB),
    (short)(-1.4*SFB), (short)(-0.74*SFB),
    0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000
};

short ptr_Input[N + 2 * PAD] =
{
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0CCC, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
};

short ptr_r_c[N + PAD];
short ptr_r_i[N + PAD];

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nCoefs);
clock_t time_i(int nCoefs);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop, t_c, t_i;
    int i, j, nCoefs, fail = 0;
    int form_error = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(nCoefs = 8, i = 1; nCoefs <= NCOEFS; i++, nCoefs += 8) {
        /* ---------------------------------------------------------------- */
        /*  Fill output buffers with fixed values.                          */
        /* ---------------------------------------------------------------- */
        memset(ptr_r_c, 0x5A, sizeof(ptr_r_c));
        memset(ptr_r_i, 0x5A, sizeof(ptr_r_i));

        /* ---------------------------------------------------------------- */
        /* Call the individual timing routines                              */
        /* ---------------------------------------------------------------- */
        t_c = time_c(nCoefs) - t_overhead;
        t_i = time_i(nCoefs) - t_overhead;

        /* ---------------------------------------------------------------- */
        /* Print timing results                                             */
        /* ---------------------------------------------------------------- */
        printf("DSP_iir_ss\tIter#: %d\t", i);

        /* ---------------------------------------------------------------- */
        /* Check the results array                                          */
        /* ---------------------------------------------------------------- */
        if (memcmp(ptr_r_i, ptr_r_c, sizeof(ptr_r_c))) {
            fail++;
            printf("Result Failure (r_i)");
        }
        else
            printf("Result Successful (r_i)");

        printf("\tnCoefs = %d\tnatC: %d\toptC: %d\n", nCoefs, t_c, t_i);

        if (nCoefs == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (nCoefs == CYCLE_FORMULA_NX_PT2)
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
            printf("Cycles:  %d*nCoefs + %d \n", form_result[0], form_result[1]);
        }
        else {
            printf("Cycles:  %d/%d*nCoefs + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
        }
    else
        printf("Cycles Formula Not Available\n");

    return (fail);
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nCoefs)
{
    clock_t t_start, t_stop;
    int i;

    for (i = 0; i < T; i++)
        ptr_State[i] = 0;

    for (i = 0; i < N-1; i++)
        ptr_r_c[i] = DSP_iir_ss_cn(ptr_Input[i], ptr_Coefs, nCoefs, ptr_State);

    /* -------------------------------------------------------------------- */
    /* Measure the cycle count of the last iteration of the loop            */
    /* Other measurements are redundant - they take the same amount of time */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    ptr_r_c[i] = DSP_iir_ss_cn(ptr_Input[N-1], ptr_Coefs, nCoefs, ptr_State);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_i(int nCoefs)
{
    clock_t t_start, t_stop;
    int i;

    for (i = 0; i < T; i++)
        ptr_State[i] = 0;

    for (i = 0; i < N-1; i++)
        ptr_r_i[i] = DSP_iir_ss(ptr_Input[i], ptr_Coefs, nCoefs, ptr_State);

    /* -------------------------------------------------------------------- */
    /* Measure the cycle count of the last iteration of the loop            */
    /* Other measurements are redundant - they take the same amount of time */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    ptr_r_i[i] = DSP_iir_ss(ptr_Input[N-1], ptr_Coefs, nCoefs, ptr_State);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_iir_ss_d.c                                           */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


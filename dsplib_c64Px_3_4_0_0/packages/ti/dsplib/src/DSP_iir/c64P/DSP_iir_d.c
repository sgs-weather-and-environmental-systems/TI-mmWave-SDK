/* ======================================================================= */
/* DSP_iir_d.c -- Real IIR Filter                                          */
/*                Driver file implementation                               */
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
#include <string.h>
#include <limits.h>
#include <c6x.h>

/* ======================================================================= */
/* Interface header files for the natural C and optimized C code           */
/* ======================================================================= */
#include "DSP_iir_cn.h"
#include "DSP_iir.h"

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
/* Tell compiler arrays are double word alligned                           */
/* ======================================================================= */
#pragma DATA_ALIGN(ptr_Input, 8);
#pragma DATA_ALIGN(ptr_State, 8);

#pragma DATA_ALIGN(ptr_r1_output_used_c, 8);
#pragma DATA_ALIGN(ptr_r1_output_used_i, 8);
#pragma DATA_ALIGN(ptr_r2_output_used_c, 8);
#pragma DATA_ALIGN(ptr_r2_output_used_i, 8);
#pragma DATA_ALIGN(ptr_Coefs_h1, 8);
#pragma DATA_ALIGN(ptr_Coefs_h2, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define PAD (8)
#define SFB (16383.5)
#define NOUTPUTSAMPS (64)
#define T (NOUTPUTSAMPS + PAD)
#define N (NOUTPUTSAMPS * 10)
short ptr_State[N + PAD];

short ptr_Input[N + 2 * PAD];

/* Extra parameters For ZTE requirements */
short ptr_r1_output_used_c[N + PAD + 4];
short ptr_r1_output_used_i[N + PAD + 4];

short ptr_r2_output_used_c[N + PAD];
short ptr_r2_output_used_i[N + PAD];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
short ptr_Coefs_h2[5] =
{
    (short)( 0.25*SFB), (short)(1.00*SFB),
    (short)( 1.50*SFB), (short)(1.00*SFB),
    (short)( 0.25*SFB)
};

short ptr_Coefs_h1[5] =
{
    (short)( 0.25*SFB), (short)(1.00*SFB),
    (short)( 1.50*SFB), (short)(1.00*SFB),
    (short)( 0.25*SFB)  
};

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
    int i, j, nOutSamps, fail = 0;
    int form_error = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;
    
    for (i=0; i < N + 2 * PAD; i++) {
            ptr_Input[i] = 0;
    }
    ptr_Input[10] = 0xCCC;

    for(nOutSamps = 8, i = 1; nOutSamps <= NOUTPUTSAMPS; i++, nOutSamps += 4) {
        /* ---------------------------------------------------------------- */
        /*  Fill output buffers with fixed values.                          */
        /* ---------------------------------------------------------------- */
        memset(ptr_r1_output_used_c, 0x5A, sizeof(ptr_r1_output_used_c));
        memset(ptr_r1_output_used_i, 0x5A, sizeof(ptr_r1_output_used_i));
        memset(ptr_r2_output_used_c, 0x5A, sizeof(ptr_r2_output_used_c));
        memset(ptr_r2_output_used_i, 0x5A, sizeof(ptr_r2_output_used_i));
        
        /* ---------------------------------------------------------------- */
        /* Call the individual timing routines                              */
        /* ---------------------------------------------------------------- */
        t_c = time_c(nOutSamps) - t_overhead;
        t_i = time_i(nOutSamps) - t_overhead;

        /* ---------------------------------------------------------------- */
        /* Print timing results                                             */
        /* ---------------------------------------------------------------- */
        printf("DSP_iir_real16\tIter#: %d\t", i);

        /* ---------------------------------------------------------------- */
        /* Check the results array                                          */
        /* ---------------------------------------------------------------- */
        if ( (memcmp(ptr_r1_output_used_i, ptr_r1_output_used_c, sizeof(ptr_r1_output_used_c))) &&
             (memcmp(ptr_r2_output_used_i, ptr_r2_output_used_c, sizeof(ptr_r2_output_used_c)))) {
            fail++;
            printf("Result Failure (r_i)");
        }
        else
            printf("Result Successful (r_i)");

        printf("\tnOutSamps = %d\tnatC: %d\toptC: %d\n", nOutSamps, t_c, t_i);

        if (nOutSamps == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (nOutSamps == CYCLE_FORMULA_NX_PT2)
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

    return (fail);
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nOutSamps)
{
    clock_t t_start, t_stop;
    int i;

    for (i = 0; i < T; i++)
        ptr_State[i] = 0;

    /* -------------------------------------------------------------------- */
    /* Measure the cycle count of the of the loop                           */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSP_iir_cn (ptr_r1_output_used_c, (const short*) ptr_Input, ptr_r2_output_used_c, ptr_Coefs_h2, ptr_Coefs_h1, nOutSamps);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_i(int nOutSamps)
{
    clock_t t_start, t_stop;
    int i;

    for (i = 0; i < T; i++)
        ptr_State[i] = 0;

    /* -------------------------------------------------------------------- */
    /* Measure the cycle count of the iteration of the loop                 */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSP_iir (ptr_r1_output_used_i, (const short*) ptr_Input, ptr_r2_output_used_i, ptr_Coefs_h2, ptr_Coefs_h1, nOutSamps);   
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_iir_d.c                                              */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


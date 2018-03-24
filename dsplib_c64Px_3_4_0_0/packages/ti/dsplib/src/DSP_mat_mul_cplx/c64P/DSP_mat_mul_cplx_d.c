/* ======================================================================= */
/* DSP_mat_mul_cplx_d.c -- Perform Matrix Multiplication                   */
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

#include "DSP_mat_mul_cplx_cn.h"
#include "DSP_mat_mul_cplx.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          8
#define FORMULA_DEVIDE        2
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

/* ======================================================================== */
/*  Kernel-specific alignments                                              */
/* ======================================================================== */
#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(y, 8);
#pragma DATA_ALIGN(r_c, 8);
#pragma DATA_ALIGN(r_i, 8);

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define R1   (16)
#define C1R2 (16)
#define   C2 (16)
#define R1C1 (R1*C1R2)
#define R1C2 (R1*C2)
#define R2C2 (C2*C1R2)

short x[R1C1*2];
short y[R2C2*2];

short r_c[R1C2*2];
short r_i[R1C2*2];

// Right shift the result by qs bits
int qs = 0;

/* ======================================================================== */
/*  Generate pointers to point to matrices                                  */
/* ======================================================================== */
const short *const ptr_x = (short *)x;
const short *const ptr_y = (short *)y;
short *const ptr_r_c = (short *)r_c;
short *const ptr_r_i = (short *)r_i;

/* ======================================================================== */
/*  Prototypes for timing functions.                                        */
/* ======================================================================== */
clock_t time_c(int r1, int c1r2, int c2);
clock_t time_i(int r1, int c1r2, int c2);

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */
int main()
{   
    clock_t t_overhead, t_start, t_stop;
    clock_t t_c, t_i;
    int i, j, r1 = R1, c1r2 = C1R2, c2 = C2, fail = 0;
    int form_error = 0;

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.   */
    /* -------------------------------------------------------------------- */
    t_start    = _itoll(TSCH, TSCL);
    t_stop     = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    /* =================== */    
    /* Initialize matrices */
    /* =================== */
    for (i=0; i<R1C2*2; i++)  {
        x[i] = (short) ((int) rand()>>2);
    }
    for (i=0; i<R2C2*2; i++) {
        y[i] = (short) ((int) rand()>>2);
    }

    for(r1 = 4, i = 1; r1 <= R1; r1 += 4) {
        for(c1r2 = 4; c1r2 <= C1R2; c1r2 += 4) {
            for(c2 = 4; c2 <= C2; i++, c2 += 4) {
 
                /* -------------------------------------------------------- */
                /*  Force uninitialized arrays to fixed values.             */
                /* -------------------------------------------------------- */
                memset(r_c, 0xA5, sizeof(r_c));
                memset(r_i, 0xA5, sizeof(r_i));

                /* -------------------------------------------------------- */
                /*  Call the individual timing routines, rhead.             */
                /*  and subtract off overhead.                              */
                /* -------------------------------------------------------- */
                t_c = time_c(r1, c1r2, c2) - t_overhead;
            
                t_i = time_i(r1, c1r2, c2) - t_overhead;
    
                /* -------------------------------------------------------- */
                /*  Print timing results.                                   */
                /* -------------------------------------------------------- */
                printf("DSP_mat_mul_cplx\tIter#: %d\t", i);

                /* -------------------------------------------------------- */
                /*  Check the results arrays, and report any failures.      */
                /* -------------------------------------------------------- */
                if (memcmp(r_i, r_c, sizeof(r_c))) {
                    fail++;
                    printf("Result Failure (r_i)");
                }
                else
                    printf("Result Succesful (r_i)");

                printf("\tR1 = %d\tC1R2 = %d\tC2 = %d\tnatC: %d\tintC: %d\n", r1, c1r2, c2, t_c, t_i);

                if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT1)
                    form_cycle[0] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT1)
                    form_cycle[1] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT1)
                    form_cycle[2] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT2)
                    form_cycle[3] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT1)
                    form_cycle[4] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT1 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT2)
                    form_cycle[5] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT1 && r1 == CYCLE_FORMULA_R1_PT2)
                    form_cycle[6] = t_i;
                if (c2 == CYCLE_FORMULA_C2_PT2 && c1r2 == CYCLE_FORMULA_R2_PT2 && r1 == CYCLE_FORMULA_R1_PT2)
                    form_cycle[7] = t_i;
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

    return (fail);
}

/* ======================================================================== */
/*  TIME_C   -- Measure elapsed time for natural C version.                 */
/* ======================================================================== */
clock_t time_c(int r1, int c1r2, int c2)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_mat_mul_cplx_cn(ptr_x, r1, c1r2, ptr_y, c2, ptr_r_c, qs);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for intrinsic C version.               */
/* ======================================================================== */
clock_t time_i(int r1, int c1r2, int c2)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_mat_mul_cplx(ptr_x, r1, c1r2, ptr_y, c2, ptr_r_i, qs);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_mat_mul_cplx_d.c                                      */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


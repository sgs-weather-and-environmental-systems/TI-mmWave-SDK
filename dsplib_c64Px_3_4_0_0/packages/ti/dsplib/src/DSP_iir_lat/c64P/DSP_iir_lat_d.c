/* ======================================================================= */
/* DSP_iir_lat_d.c -- IIR lattice Filter                                   */
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
#include "DSP_iir_lat_cn.h"
#include "DSP_iir_lat.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          4
#define FORMULA_DEVIDE        4
#define CYCLE_FORMULA_NX_PT1  20
#define CYCLE_FORMULA_NX_PT2  16
#define CYCLE_FORMULA_NR_PT1  32
#define CYCLE_FORMULA_NR_PT2  28
/* inverse of [20*32 20 32 1] */
/*            [20*28 20 28 1] */
/*            [16*32 16 32 1] */
/*            [16*28 16 28 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{ 0.0625,   -0.0625,   -0.0625,    0.0625},
 {-1.7500,    2.0000,    1.7500,   -2.0000},
 {-1.0000,    1.0000,    1.2500,   -1.2500},
 {28.0000,  -32.0000,  -35.0000,   40.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================= */
/* Kernel specific data allignment(s)                                      */
/* ======================================================================= */
#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(k, 8);
#pragma DATA_ALIGN(b_c, 8);
#pragma DATA_ALIGN(b_i, 8);
#pragma DATA_ALIGN(r_c, 8);
#pragma DATA_ALIGN(r_i, 8);

/* ======================================================================= */
/*  Parameters of fixed dataset.                                           */
/* ======================================================================= */
#define NK  (32)
#define NK1 (NK+1)
#define NX  (20)
#define PAD (16)


/* ======================================================================= */
/*  Initialized arrays with fixed test data.                               */
/* ======================================================================= */
short x[NX + 2*PAD] =
{
    0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A, 0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A,
    0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A, 0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A,

    0xBBCD,  0xABCD,  0x1223,  0x1111, 0x2222,  0x3333,    2191,  738, 
    -242,    308,     1411,   -322,    603,     197,      -1972,  2191, 
    738,    -242,     308,     0,

    0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A, 0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A,
    0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A, 0x5A5A,  0x5A5A,  0x5A5A,  0x5A5A,
};

const short k[NK] =
{
    -13839,   22437,  -27054,   19741,
    -16792,  -30550,  -25856,   6973,
    -13839,   22437,  -27054,   19741,
    -16792,  -30550,  -25856,   6973,
    -13839,   22437,  -27054,   19741,
    -16792,  -30550,  -25856,   6973,
    -13839,   22437,  -27054,   19741,
    -16792,  -30550,  -25856,   6973,
};

int  b_c[NK1 + 2*PAD] =
{
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,

    0x000A0000,  0x00050000,  0x00A00000,  0x00110000,
    0x00340000,  0xF6B50000,  0x003C0000,  0xFFE10000,
    0x009D0000,

    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
    0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,  0x5A5A5A5A,
};

int b_i[NK1 + 2*PAD];

short r_c[NX + 2*PAD];
short r_i[NX + 2*PAD];

/* ======================================================================= */
/*  Generate pointers to skip beyond array padding                         */
/* ======================================================================= */
short *const ptr_x = x + PAD;

int *const ptr_b_c = b_c + PAD;
int *const ptr_b_i = b_i + PAD;

short *const ptr_r_c = r_c + PAD;
short *const ptr_r_i = r_i + PAD;

/* ======================================================================= */
/*  Prototypes for timing functions.                                       */
/* ======================================================================= */
clock_t time_c(int nx, int nk);
clock_t time_i(int nx, int nk);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop, t_c, t_i;
    int i, j, nx, nk, fail = 0;
    int form_error = 0;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for (nx = 2, j = 1; nx <= NX; nx += 2) {
        for (nk = 4; nk <= NK; j++, nk += 4) {
            /* ------------------------------------------------------------------- */
            /* Initialize all arrays                                               */
            /* ------------------------------------------------------------------- */
            memset(r_c, 0xA5, sizeof(r_c));
            memset(r_i, 0xA5, sizeof(r_i));
            memcpy(b_i, b_c, sizeof(b_i));

            /* ------------------------------------------------------------------- */
            /* natC and optC maintain b[] << 15                                    */
            /* ------------------------------------------------------------------- */
            for (i = 0; i < (NK1 + 2*PAD); i++)
                b_c[i] = b_i[i] >> 1;

            /* ------------------------------------------------------------------- */
            /* Call the individual timing routines                                 */
            /* ------------------------------------------------------------------- */
            t_c = time_c(nx, nk) - t_overhead;
            t_i = time_i(nx, nk) - t_overhead;

            /* ------------------------------------------------------------------- */
            /* Print timing results                                                */
            /* ------------------------------------------------------------------- */
            printf("DSP_iir_lat\tIter#: %d\t", j);

            /* ------------------------------------------------------------------- */
            /* Check the results array                                             */
            /* ------------------------------------------------------------------- */
            if (memcmp(r_i, r_c, sizeof(r_c))) {
                fail++;
                printf("Result Failure (r_i)");
            }
            else
                printf("Result Successful (r_i)");

            printf("\tNX = %d\tNK = %d\tnatC: %d\toptC: %d\n", nx, nk, t_c, t_i);

            if (nx == CYCLE_FORMULA_NX_PT1 && nk == CYCLE_FORMULA_NR_PT1)
                form_cycle[0] = t_i;
            if (nx == CYCLE_FORMULA_NX_PT1 && nk == CYCLE_FORMULA_NR_PT2)
                form_cycle[1] = t_i;
            if (nx == CYCLE_FORMULA_NX_PT2 && nk == CYCLE_FORMULA_NR_PT1)
                form_cycle[2] = t_i;
            if (nx == CYCLE_FORMULA_NX_PT2 && nk == CYCLE_FORMULA_NR_PT2)
                form_cycle[3] = t_i;
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
        printf("%d/%d*Nr*Nh + ", form_result[0], FORMULA_DEVIDE);
      if (form_result[1])
        printf("%d/%d*Nr + ", form_result[1], FORMULA_DEVIDE);
      if (form_result[2])
        printf("%d/%d*Nh + ", form_result[2], FORMULA_DEVIDE);
      if (form_result[3])
        printf("%d\n", form_result[3]);
    }
    else
      printf("Cycles Formula Not Available\n");

    return (fail);
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nx, int nk)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_iir_lat_cn(ptr_x, nx, k, nk, ptr_b_c, ptr_r_c);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

clock_t time_i(int nx, int nk)
{
    clock_t t_start, t_stop;
    t_start = _itoll(TSCH, TSCL);
    DSP_iir_lat(ptr_x, nx, k, nk, ptr_b_i, ptr_r_i);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_iir_d.c                                              */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


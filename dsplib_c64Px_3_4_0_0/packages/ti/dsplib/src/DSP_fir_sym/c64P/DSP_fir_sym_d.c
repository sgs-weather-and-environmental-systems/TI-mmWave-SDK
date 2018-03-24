/* ======================================================================= */
/* DSP_fir_sym_d.c -- FIR Filter (Symmetric)                               */
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
#include "DSP_fir_sym_cn.h"
#include "DSP_fir_sym.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          4
#define FORMULA_DEVIDE        16
#define CYCLE_FORMULA_NX_PT1  16
#define CYCLE_FORMULA_NX_PT2  12
#define CYCLE_FORMULA_NR_PT1  16
#define CYCLE_FORMULA_NR_PT2  12
/* inverse of [16*16 16 16 1] */
/*            [16*12 16 12 1] */
/*            [12*16 12 16 1] */
/*            [12*12 12 12 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{ 0.0625,   -0.0625,   -0.0625,    0.0625},
 {-0.7500,    1.0000,    0.7500,   -1.0000},
 {-0.7500,    0.7500,    1.0000,   -1.0000},
 { 9.0000,  -12.0000,  -12.0000,   16.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================= */
/* Tell compiler arrays are double word alligned                           */
/* ======================================================================= */
#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(h, 8);
#pragma DATA_ALIGN(r_c, 8);
#pragma DATA_ALIGN(r_i, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define NH  (16)
#define NR  (16)
#define NX  (50)      /* NX = 2*NH + NR + 2 */
#define PAD (16)

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
const short x[NX] =
{
    0xFF94,   0x000A,  0x236F,  0xFE45,  0xF9B1,  0x00E3,  0x001F,   0xD5E4,
    0x03EE,   0xF9F2,  0x001A,  0xFFFC,  0xFFD6,  0xFFFD,  0x0000,   0x0000,
    0xFFFF,   0xE82B,  0xABCD,  0xBCDE,  0xCDEF,  0xDEFA,  0xEFAB,   0xFAB1,
    0xAB12,   0xB123,  0x1234,  0x2345,  0x3456,  0x4567,  0x5678,   0x6789,
    0x789A,   0x89AB,  0x9ABC,  0xABCD,  0xADDA,  0xEFFE,  0xBCCA,   0xDEAD,
    0x7FF7,   0x7FFF,  0xFDCA,  0x4823,  0x2567,  0x4EEA,  0x8000,   0x7ACE,
    0x2A3E,   0x4096
};

const short h[NH + 2*PAD] =
{
    0x02AC,   0xFFFF,  0x3F6B,  0x3D15,  0xFFDE,  0xFFFB,  0x0003,  0xFFE5,
    0xFFEA,   0x0032,  0x2411,  0xFC54,  0x0072,  0xFF6A,  0xFFE5,  0xFFFA,
    0xDBC7,   0xFFF8,  0x0002,  0x0000,  0x3FCC,  0xE8AA,  0x019E,  0x0009,
    0xFF26,   0x0005,  0x0023,  0x0009,  0xEA26,  0x07F0,  0xF3CD,  0x001B,
    0xF07B,   0x007B,  0x0001,  0x0372,  0xFFFE,  0xFFF6,  0x0016,  0xFFD2,
    0x185F,   0x00FF,  0xFAAF,  0xDADE,  0xDEAD,  0xCEAD,  0xABBA,  0x7FFF
};

short r_c[NR + 2*PAD];
short r_i[NR + 2*PAD];

/* ======================================================================= */
/* Generate pointers to skip beyond array padding                          */
/* ======================================================================= */
const short *const x_ptr = x;
const short *const h_ptr = h + PAD;
short *const r_ptr_c = r_c + PAD;
short *const r_ptr_i = r_i + PAD;

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nh, int nr);
clock_t time_i(int nh, int nr);

/* ======================================================================= */
/* MAIN -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop;
    clock_t t_c, t_i;
    int i, j, nh, nr, fail = 0;
    int form_error = 0;

    /* =================================================================== */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /* Compute overhead of calling _itoll(TSCH, TSCL) twice to get timing info        */
    /* =================================================================== */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for (nr = 8, i = 1; nr <= NR; nr += 4) {
        for (nh = 8; nh <= NH; i++, nh += 4) {
            /* =================================================================== */
            /* Force uninitialized arrays to fixed values                          */
            /* =================================================================== */
            memset(r_c, 0xA5A5, sizeof(r_c));
            memset(r_i, 0xA5A5, sizeof(r_i));

            /* =================================================================== */
            /* Call the individual timing toutines, and subtract off overhead      */
            /* =================================================================== */
            t_c = time_c(nh, nr) - t_overhead;  // Calculate time to run Natural C Algorithm
            t_i = time_i(nh, nr) - t_overhead;  // Calculate time to run Optimized C Algorithm

            /* =================================================================== */
            /* Print timing results                                                */
            /* =================================================================== */
            printf("DSP_fir_sym\tIter#: %d\t", i);

            /* =================================================================== */
            /* Check the results arrays, and report any failures                   */
            /* =================================================================== */
            if (memcmp(r_i, r_c, sizeof(r_c))) {
                fail++;
                printf("Result Failure (r_i)");
            }
            else
                printf("Result Successful (r_i)");

            printf("\tNR = %d\tNH = %d\tnatC: %d\toptC: %d\n", nr, nh, t_c, t_i);

            if (nr == CYCLE_FORMULA_NX_PT1 && nh == CYCLE_FORMULA_NR_PT1)
                form_cycle[0] = t_i;
            if (nr == CYCLE_FORMULA_NX_PT1 && nh == CYCLE_FORMULA_NR_PT2)
                form_cycle[1] = t_i;
            if (nr == CYCLE_FORMULA_NX_PT2 && nh == CYCLE_FORMULA_NR_PT1)
                form_cycle[2] = t_i;
            if (nr == CYCLE_FORMULA_NX_PT2 && nh == CYCLE_FORMULA_NR_PT2)
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

    return(fail);
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int nh, int nr)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fir_sym_cn(x_ptr, h_ptr, r_ptr_c, nh, nr, 0);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

clock_t time_i(int nh, int nr)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fir_sym(x_ptr, h_ptr, r_ptr_i, nh, nr, 0);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_fir_sym_d.c                                          */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


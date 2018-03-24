/* ======================================================================= */
/* DSP_dotp_sqr_d.c -- Vector Dot Product and Square implementation        */
/*                     Driver file implementation                          */
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

/* Interface header files for the natural C and optimized C code */
#include "DSP_dotp_sqr_cn.h"
#include "DSP_dotp_sqr.h"

#pragma DATA_ALIGN(x,  8);      /* DWord-aligned.*/
#pragma DATA_ALIGN(y,  8);      /* DWord-aligned.*/

/* Parameters of fixed vector set. */
#define N   (128)               /* Number of samples                    */
#define PAD (16)                /* Amount of pad (for catching overrun) */

/* Initialized arrays with fixed test data. */
short x[N + 2*PAD] =
{
    -0x38D9,  0x07A2,  0x15E6, -0x60C6, -0x0020, -0x6123,  0x369A,  0x0358,
    -0x02D5, -0x55D0, -0x22F2,  0x0945,  0x54DE, -0x2E11, -0x6ADE,  0x3DD0,
    -0x1675,  0x1BEC,  0x3D53, -0x1A35, -0x1F57,  0x6BB0, -0x6FBC, -0x1AD2,
     0x4F9C,  0x6FA8, -0x5C9F,  0x4C7B,  0x341B,  0x6BE1, -0x0BD6,  0x06E0,
     0x3979,  0x6BB6,  0x7C9F,  0x2DA2, -0x51B1,  0x5C0A,  0x3F44, -0x79C1,
     0x5809, -0x7483, -0x17AD, -0x5E29,  0x78CE,  0x0228, -0x137B,  0x1B54,
    -0x5DAE,  0x4F52, -0x5901, -0x7728, -0x3202,  0x36AB,  0x06E3, -0x7D20,
     0x3305, -0x4476,  0x40FC,  0x5AB7,  0x70D0,  0x19A6, -0x06EC, -0x0A62,
     0x6950,  0x21D5, -0x7CA1,  0x433E,  0x73B0,  0x7449, -0x6570, -0x192F,
     0x47E7,  0x2BD0,  0x250F,  0x7896,  0x32AF,  0x6194,  0x7DC9, -0x0BFF,
     0x1156,  0x1FDE, -0x45D7, -0x32D5, -0x6E09,  0x3352, -0x7D52,  0x2008,
     0x2E8E,  0x663C, -0x1E61, -0x6E2A, -0x7E8C, -0x63B5, -0x5B99,  0x4A57,
     0x46B3,  0x555C, -0x49F1, -0x5EC0, -0x473C,  0x16BC,  0x0855, -0x1D88,
    -0x5FD6,  0x3574,  0x7BEB, -0x3F77, -0x4897, -0x75F4,  0x4C4F, -0x1B25,
    -0x3C16, -0x78A6, -0x7132,  0x2D2F,  0x0331,  0x34C6,  0x1A20,  0x0BD8,
     0x5605, -0x7168, -0x6ADD, -0x7ECB, -0x5418, -0x3038, -0x0FBB,  0x4DF4,
     0x3B7C,  0x15C4, -0x1004, -0x4479,  0x0145, -0x073E,  0x36EF, -0x7095,
    -0x09B6,  0x7811,  0x5F34, -0x5C5E, -0x63E6, -0x241A, -0x74C5, -0x620A,
     0x42B1, -0x17D2,  0x02CC,  0x5779, -0x6841,  0x12E1,  0x52B5,  0x61CC,
    -0x0534, -0x09AB,  0x778B,  0x2B9C,  0x13C4, -0x2CF0, -0x7AEB,  0x5BEF,
};

short y[N + 2*PAD] =
{
     0x6A73, -0x2EC6,  0x5523, -0x5563, -0x19FE,  0x6FDE,  0x050F,  0x6FFA,
     0x49D2, -0x210A, -0x2454, -0x20E9, -0x76D3, -0x4172,  0x567B,  0x2B00,
    -0x17BB, -0x7CB3,  0x7CE7,  0x6C83,  0x52A0,  0x61EF, -0x3BEE, -0x1466,
     0x6D66, -0x623C,  0x09C6,  0x1C16,  0x0615, -0x3C59, -0x0CFA, -0x50F4,
     0x2B0E,  0x4002,  0x7ABE,  0x5583, -0x6176, -0x1DBD, -0x24EC, -0x661E,
     0x0069, -0x429D, -0x6221,  0x6FA3,  0x466C, -0x0A1B,  0x19B9, -0x2343,
    -0x0CBE, -0x142D,  0x0337,  0x4A5D, -0x65FA,  0x5445,  0x7EBB, -0x05AC,
     0x1890, -0x5220,  0x316F,  0x26CB,  0x2930, -0x6123, -0x2024,  0x39BB,
    -0x55BB, -0x47F1,  0x0EA7, -0x4561,  0x323B,  0x2066,  0x24E4,  0x57ED,
     0x6B5F, -0x6387, -0x6A68, -0x7134, -0x59DF, -0x7E74, -0x6B2B, -0x7972,
     0x4630,  0x0D9B, -0x3E0F, -0x7497,  0x62F4, -0x5D1D,  0x696E, -0x5C0D,
     0x2EF3,  0x666E, -0x420E, -0x2526, -0x4C75, -0x35E1, -0x6316, -0x5899,
     0x3A96,  0x72BE,  0x554E, -0x06CB,  0x126E,  0x0B8A, -0x0702,  0x68B4,
     0x07CC,  0x76C1, -0x5BB6,  0x0FE7,  0x290B, -0x1346,  0x6213, -0x781A,
     0x5655,  0x74EC,  0x0116, -0x7761,  0x091D,  0x4E87,  0x73CB, -0x51AA,
    -0x146E, -0x4AFA,  0x3472, -0x1893, -0x4EA2, -0x6CBE,  0x3BB9,  0x02E8,
    -0x4FAE, -0x717A, -0x1F7A, -0x1BD1, -0x348D,  0x0629,  0x5B63, -0x1F66,
     0x0FDF,  0x6B23,  0x3406, -0x43CC, -0x56E2, -0x7BDE,  0x4D81, -0x30BA,
    -0x6CB3,  0x12AB, -0x2475, -0x31DF, -0x7656,  0x5FAC, -0x088A, -0x4658,
    -0x37FA,  0x2C1D,  0x2935,  0x6F1B,  0x0E96, -0x75E8,  0x7A15,  0x65A5,
};

/*  The test function performs the test for the dotp_sqr routine. The inputs
    for the test are provided as arguments to the function. The function also
    benchmarks the Kernel and provides the timimg information.
    After the test is run, the function compares the natural C and optimized
    C output to ensure that the test ran correctly. 
*/

int dotp_sqr_test(short * x_c, short * x_cn, short * y_c, short * y_cn,
                 int G, int nx, unsigned int * time, unsigned int * time_n)
{
    int fail = 0;
    int d_c, d_cn, G_c, G_cn;
    clock_t t_start, t_stop;

    /* Use the passed G value for both d and G */
    d_c = G;
    d_cn = G;

    /* Call the optimized C kernel */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    G_c = DSP_dotp_sqr(G, x_c, y_c, &d_c, nx);
    t_stop = _itoll(TSCH, TSCL);

    *time = t_stop - t_start;

    /* Call the natural C kernel */
    t_start = _itoll(TSCH, TSCL);
    G_cn = DSP_dotp_sqr_cn(G, x_cn, y_cn, &d_cn, nx);
    t_stop = _itoll(TSCH, TSCL);

    *time_n = t_stop - t_start;

    /* Ensure that the output match for both the kernels */
    if ((G_c != G_cn) || (d_c != d_cn)) {
        fail = 1;
    }

    /* Return with Pass/Fail information */
    if (fail) {
        return (1);
    }
    else {
        return (0);
    }
}

/* Top level driver for the test. */
int main()
{
    clock_t t_overhead, time, time_n; 
    clock_t t_cn, t_i;
    int fail = 0, i, j, G;
    int form_error = 0;

    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info. */
    t_overhead = _itoll(TSCH, TSCL);
    t_overhead = _itoll(TSCH, TSCL) - t_overhead;

    /*  TEST 1: Verify that the function can accept various values for G.
        Test with various G values. 
    */
    G = -131072;
    for (i = 0; i < 128; i ++) {
        fail += dotp_sqr_test(x, x, y, y, G, 128, &time, &time_n);
        G += (i + 1) * 2500;
    }

    /*  TEST 2: Verify that the function can accept various alignements for
        both x and y input test vectors. Test with various alignments. 
    */
    G = 0;
    for (i = 0; i < 16; i ++) {
        fail += dotp_sqr_test((x + i), (x + i), (y + i), (y + i), G, 128, &time, &time_n);
    }

    if (fail)
        printf("DSP_dotp_sqr: Result Failure\n");

    /*  TEST 3: Verify the handling of the input count by the function.
        The Kernel should be able to run from the minimum count (4) to higher
        counts. Test with various count values. 
    */
    G = 0;
    for (i = 0; i <= N; i += 4) {
        fail = dotp_sqr_test(x, x, y, y, G, i, &time, &time_n);

        /* -------------------------------------------------------------------- */
        /*  Print timing results.                                               */
        /* -------------------------------------------------------------------- */
        printf("DSP_dotp_sqr\tIter#: %d\t", i/4);

        /* Accumulate the total time taken by the Kernel.*/
        t_i = time - t_overhead;
        t_cn = time_n - t_overhead;

        if (fail)
            printf("Result Failure");
        else
            printf("Result Successful");

        printf("\tNX = %d\tnatC: %d\tintC: %d\n", i, t_cn, t_i);

        if (i == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (i == CYCLE_FORMULA_NX_PT2)
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

/* ======================================================================== */
/*  End of file:  DSP_dotp_sqr_d.c                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */


/* ======================================================================== */
/* DSP_maxidx_c.h -- Maximum Vector Value                                   */
/*                   Driver Code Implementation                             */
/*                                                                          */
/* Rev 0.0.1                                                                */
/*                                                                          */
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

#include "DSP_maxidx_cn.h"
#include "DSP_maxidx.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        16
#define CYCLE_FORMULA_NX_PT1  128
#define CYCLE_FORMULA_NX_PT2  192
/* inverse of [128 1] */
/*            [192 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0156,    0.0156},
 { 3.0000,   -2.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* kernel specific input arrays */
#pragma DATA_ALIGN(Input, 8);
/* implementation specific output arrays */
#pragma DATA_ALIGN(Max_c, 8);
#pragma DATA_ALIGN(Max_i, 8);

#define N       (256)
#define nInputs (N)
#define PAD     (8)

short Input[N] =
{
  0x429e, 0x4aab, 0x2444, 0x0589, 0x0bbd, 0xfc91, 0xb1a7, 0xbae7,
  0xcb1c, 0xf4a0, 0xe041, 0xa21e, 0x0e65, 0x4db2, 0xeff4, 0x05cf,
  0xed66, 0x3e8a, 0xe11c, 0x1292, 0xe176, 0x0529, 0xe129, 0xe628,
  0x19f5, 0x038b, 0x34f2, 0x2b68, 0x34e1, 0x118a, 0xcf36, 0x2d18,
  0x0c28, 0x346f, 0x0cc0, 0xb5f4, 0xcdfa, 0x307a, 0xd0df, 0x96d2,
  0xc3b8, 0x11f7, 0xd42c, 0xbe45, 0x0154, 0x2fae, 0xc9cc, 0x5ae8,
  0x0c9b, 0xe65d, 0x2135, 0x1877, 0xef80, 0x5e91, 0xf4b0, 0xb56c,
  0x0121, 0x3be5, 0x0bdc, 0x2a7c, 0xfa5e, 0xdbcd, 0xb379, 0xb1f0,
  0x1035, 0x166b, 0x0175, 0x4545, 0x38ce, 0xed13, 0x7fad, 0xda9f,
  0x2062, 0x004a, 0x1226, 0xbb35, 0xb1ef, 0xdaaa, 0xfe8b, 0xbabd,
  0x9ebb, 0xe52b, 0x096e, 0xfc4e, 0xfa24, 0xce40, 0xe887, 0xe5ee,
  0xf511, 0x1f03, 0x21c4, 0xc635, 0x412a, 0x41c2, 0xe4dc, 0xd6fd,
  0xd448, 0xe2cf, 0x0cbe, 0xee51, 0xff33, 0xe038, 0xa22a, 0x4f86,
  0xdaac, 0x098a, 0xf195, 0xd26a, 0xd377, 0xbf09, 0x1f2e, 0x926c,
  0x232e, 0x539c, 0x3fae, 0x1c5d, 0xf8b3, 0xde14, 0xf1cb, 0x0037,
  0x1551, 0xe461, 0x0a4c, 0x33fe, 0x201f, 0x1ec0, 0x1422, 0x26e8,
  0x02B3, 0x39E6, 0x1CB4, 0x4BBD, 0x103A, 0x0812, 0x3F07, 0x149D,
  0x4411, 0x3FB2, 0x412A, 0x5490, 0x05B9, 0x7604, 0x6FDB, 0x517B,
  0x09CF, 0x09AF, 0x2093, 0x521F, 0x0C36, 0x63AB, 0x2510, 0x278C,
  0x711A, 0x2207, 0x1D98, 0x3DAE, 0x0269, 0x2328, 0x1A91, 0x1D21,
  0x652A, 0x0EF8, 0x1A34, 0x2728, 0x0C18, 0x15F8, 0x280D, 0x0564,
  0x6569, 0x2B99, 0x354C, 0x28AD, 0x2FF2, 0x37DE, 0x15E8, 0x42D1,
  0x1E84, 0x1B63, 0x2A6A, 0x5034, 0x2279, 0x5FB6, 0x0922, 0x65FE,
  0x29CC, 0x0384, 0x1555, 0x0C98, 0x0A39, 0x3F7B, 0x685A, 0x77F1,
  0x3547, 0x0202, 0x50E7, 0x238C, 0x7FC5, 0x0F13, 0x158F, 0x0003,
  0x0147, 0x6A73, 0x5051, 0x2CD2, 0x2E05, 0x476D, 0x3C2F, 0x76B5,
  0x2513, 0x04AB, 0x6457, 0x69E8, 0x636E, 0x3046, 0x1E8D, 0x6696,
  0x2E54, 0x0146, 0x3EC0, 0x7704, 0x51CA, 0x6BA8, 0x1DB9, 0x6C5E,
  0x6D60, 0x2EB5, 0x47F9, 0x504E, 0x7E0A, 0x4414, 0x30E6, 0x07C4,
  0x1F48, 0x6931, 0x00FE, 0x780F, 0x7569, 0x15E4, 0x1779, 0x1976,
  0x67DD, 0x30B0, 0x07A8, 0x229C, 0x3A7B, 0x406A, 0x6359, 0x366F,
  0x2BD9, 0x0EF8, 0x365B, 0x7314, 0x3275, 0x603D, 0x06E2, 0x1FFA,
};

/* results, padded with guard to show array overflow */
int Max_c;
int Max_i;

clock_t time_c(int n);
clock_t time_i(int n);

/****************************************************************************/
/* TOP LEVEL DRIVER FOR THE TEST.                                           */
/****************************************************************************/
int main()
{
    clock_t t_overhead, t_start, t_stop, t_c, t_i;
    int i, j, n, fail = 0;
    int form_error = 0;

   /*************************************************************************/
   /* COMPUTE THE OVERHEAD OF CALLING CLOCK TWICE TO GET TIMING INFO.       */
   /*************************************************************************/
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(n = 32, i = 1; n <= N; i++, n += 16) {
        Max_c = 0x7373;
        Max_i = 0x7373;

        /********************************************************************/
        /* CALL THE INDIVIDIUAL TIMING ROUTINES.                            */
        /********************************************************************/
        t_c = time_c(n) - t_overhead;
        t_i = time_i(n) - t_overhead;

        /********************************************************************/
        /* PRINT TIMING RESULTS                                             */
        /********************************************************************/ 
        printf("DSP_maxidx\tIter#: %d\t", i);

        /********************************************************************/
        /* CHECK THE RESULTS ARRAY.                                         */
        /********************************************************************/
        if (Max_i != Max_c) {
            fail++;
            printf("Result Failure (max_i)");
        }
        else
            printf("Result Successful (max_i)");

        printf("\tN = %d\tnatC: %d\tintC: %d\n", n, t_c, t_i);

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

    return (fail);
}

/****************************************************************************/
/* COMPUTE THE ELAPSED TIME OF THE COMPILED NATURAL C ROUTINE               */
/****************************************************************************/
clock_t time_c(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    Max_c = DSP_maxidx_cn(Input, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/****************************************************************************/
/* COMPUTE THE ELAPSED TIME OF THE COMPILED INTRINSIC C ROUTINE             */
/****************************************************************************/
clock_t time_i(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    Max_i = DSP_maxidx(Input, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/****************************************************************************/
/*                  END OF DRIVER FILE                                      */
/****************************************************************************/


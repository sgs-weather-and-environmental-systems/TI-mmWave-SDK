/* ======================================================================= */
/* DSP_mat_trans_d.c -- Matrix Transpose                                   */
/*                      Driver code implementation                         */
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
#include "DSP_mat_trans_cn.h"
#include "DSP_mat_trans.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          4
#define FORMULA_DEVIDE        16
#define CYCLE_FORMULA_NX_PT1  24
#define CYCLE_FORMULA_NX_PT2  20
#define CYCLE_FORMULA_NR_PT1  24
#define CYCLE_FORMULA_NR_PT2  20
/* inverse of [24*24 24 24 1] */
/*            [24*20 24 20 1] */
/*            [20*24 20 24 1] */
/*            [20*20 20 20 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{ 0.0625,   -0.0625,   -0.0625,    0.0625},
 {-1.2500,    1.5000,    1.2500,   -1.5000},
 {-1.2500,    1.2500,    1.5000,   -1.5000},
 {25.0000,  -30.0000,  -30.0000,   36.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================= */
/* Inform the compiler the arrays are double word alligned                 */
/* ======================================================================= */
#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(r_c, 8);
#pragma DATA_ALIGN(r_i, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define M   (24)
#define N   (24)
#define PAD (16)

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
const short x[M * N + 2 * PAD] =
{
    0xB0DF, 0x2E62, 0x239A, 0xBB87, 0xDB85, 0xA09E, 0xE23F, 0xDC66,     // Beginning
    0xB9EA, 0x157C, 0xDF3F, 0x94DD, 0x8E5C, 0x5EDC, 0x16CF, 0x1F42,     // PAD
    0xDFC6, 0x9192, 0x0691, 0xF83F, 0xD9DB, 0x651F, 0xB2AB, 0x373A,
    0xA8F5, 0x41DC, 0xDFE8, 0xB9DF, 0x4122, 0x2712, 0xC4F9, 0xDA7D,
    0x1229, 0x00BD, 0xFB2F, 0xF0AA, 0x50FF, 0x55B6, 0xA92F, 0xCC9D,
    0xE2FE, 0x3611, 0xCB4A, 0xFA65, 0xDCBC, 0x6FB5, 0x4514, 0xA012,
    0xF0EF, 0x4FE5, 0x1219, 0xCA80, 0x394B, 0xF0A8, 0x9A4C, 0x0268,
    0x5935, 0xFFD6, 0xC683, 0x748A, 0xB613, 0xCDFE, 0xFD5A, 0x0D60,
    0xD9FD, 0x2F44, 0x3848, 0xD6DB, 0xDF5E, 0x47A7, 0x4159, 0xC747,
    0x4100, 0x6089, 0x869B, 0xCE3A, 0x74FF, 0x61EF, 0xFFD0, 0x914C,
    0xFEC3, 0x4FB0, 0x852E, 0xD2E0, 0x8DCC, 0x0759, 0x1AD8, 0xC717,
    0x2F4F, 0x3486, 0x2900, 0x80D8, 0x5440, 0x64C8, 0x3D04, 0x350D,
    0x5764, 0x268F, 0x1564, 0xB98F, 0x3B41, 0x3FE7, 0x25E8, 0x4623,
    0x3F1C, 0xE89D, 0x7F14, 0x2DE5, 0x6E89, 0xA215, 0x4B78, 0x078D,
    0xABB3, 0x8B66, 0x7058, 0x612A, 0xC2B3, 0xDF53, 0x54FD, 0x0BCF,
    0x340C, 0xD792, 0xD3FC, 0x752D, 0x1A57, 0x6315, 0x2138, 0xAADF,
    0x0E29, 0x0D53, 0x9465, 0x164F, 0xAAE7, 0x808D, 0xB71D, 0x7CFE,
    0x4283, 0xF0A0, 0xD7D4, 0xDE62, 0x0E67, 0x5656, 0x7A5B, 0x6D38,
    0x70E2, 0xDD6F, 0x43FB, 0x9C71, 0x8C6F, 0x0CF5, 0x5D09, 0x8FFC,
    0x88CD, 0xF1FE, 0x27CF, 0xFBC7, 0xF178, 0xB465, 0x4A93, 0x296F,
    0x2FCF, 0x1C8A, 0x85B0, 0x2953, 0x3804, 0x63D3, 0x7398, 0x840E,
    0x1E32, 0x2B8E, 0x5998, 0x3739, 0xA990, 0xF144, 0x5A4E, 0xE1C6,
    0x366B, 0x2FC4, 0xC14C, 0xBF8D, 0xF717, 0xF10B, 0x800B, 0xF9F2,
    0xC61A, 0x550D, 0x13E6, 0xAF7B, 0x791F, 0xB56C, 0xE025, 0x4D1C,
    0xAB48, 0x1720, 0xC0E5, 0xEFC8, 0x9470, 0x02F7, 0x5C6A, 0xC302,
    0x3ECD, 0xE698, 0x84AA, 0x0D40, 0x3E88, 0x2F56, 0x39AF, 0x0F3D,
    0xE6A0, 0x59E1, 0xB65A, 0x56C8, 0x8D12, 0x6C67, 0xCBD0, 0xEC13,
    0xD0A4, 0xD69A, 0x72ED, 0xCAF9, 0x2C95, 0xB80A, 0x5F92, 0xD58F,
    0xB0DF, 0x2E62, 0x239A, 0xBB87, 0xDB85, 0xA09E, 0xE23F, 0xDC66,
    0xB9EA, 0x157C, 0xDF3F, 0x94DD, 0x8E5C, 0x5EDC, 0x16CF, 0x1F42,
    0x9909, 0x3AD8, 0xE663, 0x6399, 0x7075, 0x6A03, 0xC06A, 0x80BF,
    0x9AC0, 0xAA9A, 0x2CBF, 0x1613, 0x6E76, 0x2139, 0x4FD1, 0xEABA,
    0xDFC6, 0x9192, 0x0691, 0xF83F, 0xD9DB, 0x651F, 0xB2AB, 0x373A,
    0xA8F5, 0x41DC, 0xDFE8, 0xB9DF, 0x4122, 0x2712, 0xC4F9, 0xDA7D,
    0x1229, 0x00BD, 0xFB2F, 0xF0AA, 0x50FF, 0x55B6, 0xA92F, 0xCC9D,
    0xE2FE, 0x3611, 0xCB4A, 0xFA65, 0xDCBC, 0x6FB5, 0x4514, 0xA012,
    0xF0EF, 0x4FE5, 0x1219, 0xCA80, 0x394B, 0xF0A8, 0x9A4C, 0x0268,
    0x5935, 0xFFD6, 0xC683, 0x748A, 0xB613, 0xCDFE, 0xFD5A, 0x0D60,
    0xD9FD, 0x2F44, 0x3848, 0xD6DB, 0xDF5E, 0x47A7, 0x4159, 0xC747,
    0x4100, 0x6089, 0x869B, 0xCE3A, 0x74FF, 0x61EF, 0xFFD0, 0x914C,
    0xFEC3, 0x4FB0, 0x852E, 0xD2E0, 0x8DCC, 0x0759, 0x1AD8, 0xC717,
    0x2F4F, 0x3486, 0x2900, 0x80D8, 0x5440, 0x64C8, 0x3D04, 0x350D,
    0x5764, 0x268F, 0x1564, 0xB98F, 0x3B41, 0x3FE7, 0x25E8, 0x4623,
    0x3F1C, 0xE89D, 0x7F14, 0x2DE5, 0x6E89, 0xA215, 0x4B78, 0x078D,
    0xABB3, 0x8B66, 0x7058, 0x612A, 0xC2B3, 0xDF53, 0x54FD, 0x0BCF,
    0x340C, 0xD792, 0xD3FC, 0x752D, 0x1A57, 0x6315, 0x2138, 0xAADF,
    0x0E29, 0x0D53, 0x9465, 0x164F, 0xAAE7, 0x808D, 0xB71D, 0x7CFE,
    0x4283, 0xF0A0, 0xD7D4, 0xDE62, 0x0E67, 0x5656, 0x7A5B, 0x6D38,
    0x70E2, 0xDD6F, 0x43FB, 0x9C71, 0x8C6F, 0x0CF5, 0x5D09, 0x8FFC,
    0x88CD, 0xF1FE, 0x27CF, 0xFBC7, 0xF178, 0xB465, 0x4A93, 0x296F,
    0x2FCF, 0x1C8A, 0x85B0, 0x2953, 0x3804, 0x63D3, 0x7398, 0x840E,
    0x1E32, 0x2B8E, 0x5998, 0x3739, 0xA990, 0xF144, 0x5A4E, 0xE1C6,
    0x366B, 0x2FC4, 0xC14C, 0xBF8D, 0xF717, 0xF10B, 0x800B, 0xF9F2,
    0xC61A, 0x550D, 0x13E6, 0xAF7B, 0x791F, 0xB56C, 0xE025, 0x4D1C,
    0xAB48, 0x1720, 0xC0E5, 0xEFC8, 0x9470, 0x02F7, 0x5C6A, 0xC302,
    0x3ECD, 0xE698, 0x84AA, 0x0D40, 0x3E88, 0x2F56, 0x39AF, 0x0F3D,
    0xE6A0, 0x59E1, 0xB65A, 0x56C8, 0x8D12, 0x6C67, 0xCBD0, 0xEC13,
    0xD0A4, 0xD69A, 0x72ED, 0xCAF9, 0x2C95, 0xB80A, 0x5F92, 0xD58F,
    0xFEC3, 0x4FB0, 0x852E, 0xD2E0, 0x8DCC, 0x0759, 0x1AD8, 0xC717,
    0x2F4F, 0x3486, 0x2900, 0x80D8, 0x5440, 0x64C8, 0x3D04, 0x350D,
    0x5764, 0x268F, 0x1564, 0xB98F, 0x3B41, 0x3FE7, 0x25E8, 0x4623,
    0x3F1C, 0xE89D, 0x7F14, 0x2DE5, 0x6E89, 0xA215, 0x4B78, 0x078D,
    0xABB3, 0x8B66, 0x7058, 0x612A, 0xC2B3, 0xDF53, 0x54FD, 0x0BCF,
    0x340C, 0xD792, 0xD3FC, 0x752D, 0x1A57, 0x6315, 0x2138, 0xAADF,
    0x0E29, 0x0D53, 0x9465, 0x164F, 0xAAE7, 0x808D, 0xB71D, 0x7CFE,
    0x4283, 0xF0A0, 0xD7D4, 0xDE62, 0x0E67, 0x5656, 0x7A5B, 0x6D38,
    0x70E2, 0xDD6F, 0x43FB, 0x9C71, 0x8C6F, 0x0CF5, 0x5D09, 0x8FFC,
    0x88CD, 0xF1FE, 0x27CF, 0xFBC7, 0xF178, 0xB465, 0x4A93, 0x296F,
    0x2FCF, 0x1C8A, 0x85B0, 0x2953, 0x3804, 0x63D3, 0x7398, 0x840E,
    0x1E32, 0x2B8E, 0x5998, 0x3739, 0xA990, 0xF144, 0x5A4E, 0xE1C6,
    0x366B, 0x2FC4, 0xC14C, 0xBF8D, 0xF717, 0xF10B, 0x800B, 0xF9F2,
    0xC61A, 0x550D, 0x13E6, 0xAF7B, 0x791F, 0xB56C, 0xE025, 0x4D1C,
    0xAB48, 0x1720, 0xC0E5, 0xEFC8, 0x9470, 0x02F7, 0x5C6A, 0xC302,
    0x3ECD, 0xE698, 0x84AA, 0x0D40, 0x3E88, 0x2F56, 0x39AF, 0x0F3D,
    0x9909, 0x3AD8, 0xE663, 0x6399, 0x7075, 0x6A03, 0xC06A, 0x80BF,     // Ending
    0x9AC0, 0xAA9A, 0x2CBF, 0x1613, 0x6E76, 0x2139, 0x4FD1, 0xEABA      // PAD
};

short r_c[M*N + 2*PAD];
short r_i[M*N + 2*PAD];

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_c(int m, int n);
clock_t time_i(int m, int n);

/* ======================================================================= */
/* MAIN -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
int main()
{
    clock_t t_overhead, t_start, t_stop;
    clock_t t_c, t_i;
    int i, j, m, n, fail = 0;
    int form_error = 0;

    /* =================================================================== */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /* Compute overhead of calling _itoll(TSCH, TSCL) twice to get timing info        */
    /* =================================================================== */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(m = 4, i = 1; m <= M; m += 4) {
        for(n = 4; n <= N; i++, n += 4) {
            /* =================================================================== */
            /* Force uninitialized arrays to fixed values                          */
            /* =================================================================== */
            memset(r_c, 0x5A, sizeof(r_c));
            memset(r_i, 0x5A, sizeof(r_i));

            /* =================================================================== */
            /* Call the individual timing routines, and subtract off overhead      */
            /* =================================================================== */
            t_c = time_c(m, n) - t_overhead;    // Calculate time to run Natural C Algorithm
            t_i = time_i(m, n) - t_overhead;    // Calculate time to run Optimized C Algorithm

            /* =================================================================== */
            /* Print timing results                                                */
            /* =================================================================== */
            printf("DSP_mat_trans\tIter#: %d\t", i);

            /* =================================================================== */
            /* Check the results arrays, and report any failures                   */
            /* =================================================================== */
            if (memcmp(r_i, r_c, sizeof(r_c))) {
                fail++;
                printf("Result failure (r_i)");
            }
            else
                printf("Result successful (r_i)");

            printf("\t#ROWS = %d\t#COLS = %d\tnatC: %d\toptC: %d\n", m, n, t_c, t_i);
 
            if (m == CYCLE_FORMULA_NX_PT1 && n == CYCLE_FORMULA_NR_PT1)
                form_cycle[0] = t_i;
            if (m == CYCLE_FORMULA_NX_PT1 && n == CYCLE_FORMULA_NR_PT2)
                form_cycle[1] = t_i;
            if (m == CYCLE_FORMULA_NX_PT2 && n == CYCLE_FORMULA_NR_PT1)
                form_cycle[2] = t_i;
            if (m == CYCLE_FORMULA_NX_PT2 && n == CYCLE_FORMULA_NR_PT2)
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
        printf("%d/%d*R*C + ", form_result[0], FORMULA_DEVIDE);
      if (form_result[1])
        printf("%d/%d*R + ", form_result[1], FORMULA_DEVIDE);
      if (form_result[2])
        printf("%d/%d*C + ", form_result[2], FORMULA_DEVIDE);
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
clock_t time_c(int m, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_mat_trans_cn(x, m, n, r_c + PAD);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_i(int m, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_mat_trans(x, m, n, r_i + PAD);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSP_mat_trans_d.c                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


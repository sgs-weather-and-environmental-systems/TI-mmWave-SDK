/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft16x16 -- Driver file for fft16x16                           */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_fft16x16' */
/*      kernel.  The function prototype appears below.  The driver itself  */
/*      is invoked as a standard C program, and results are reported on    */
/*      stdout. The driver will use a fixed test vector.                   */
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
#include <string.h>
#include <c6x.h>

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define CYCLE_FORMULA_NX_PT1  128
#define CYCLE_FORMULA_NX_PT2  256
#define FORMULA_SIZE          2
int     form_cycle [FORMULA_SIZE];

#include "DSP_fft16x16_cn.h"
#include "DSP_fft16x16.h"
#include "DSP_fft16x16_i.h"
#include "gen_twiddle_fft16x16.h"

/* ======================================================================== */
/*  Kernel-specific alignments                                              */
/* ======================================================================== */
#pragma DATA_ALIGN(w, 8);

#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(x_cn, 8);
#pragma DATA_ALIGN(x_i, 8);
#pragma DATA_ALIGN(x_sa, 8);

#pragma DATA_ALIGN(y_cn, 8);
#pragma DATA_ALIGN(y_i, 8);
#pragma DATA_ALIGN(y_sa, 8);

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define N   (256)
#define PAD (16)

/* ======================================================================== */
/*  Number of input arguments:                                              */
/* ======================================================================== */
#define NUM_INPUTS (1)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
short x[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x393D,  0x144A,  0x0F1F, -0x72ED, -0x5689, -0x64C1,  0x6193,  0x54CD,
     0x7E16, -0x2016, -0x6AEF,  0x4922, -0x5368,  0x0897,  0x54EB,  0x0084,

     0x1FAE,  0x1489,  0x1EC9, -0x6F5E,  0x5BE8, -0x024A,  0x75B7,  0x2217,
    -0x2EB6,  0x4D81,  0x0757,  0x254F, -0x7FCC, -0x6A05,  0x65AE, -0x5AC9,
     0x5D3B,  0x4219, -0x47E8,  0x4A2C, -0x03AD,  0x6576,  0x00D7,  0x7AA6,
    -0x0016, -0x2FEE,  0x55CB,  0x1E2C, -0x32AC,  0x2494, -0x4F3C, -0x6FFF,
     0x0826,  0x4087, -0x4C0A,  0x2E16,  0x4CEB, -0x6DE1, -0x03EC,  0x0BC2,
    -0x484A, -0x2E04,  0x7E82,  0x4FAD, -0x55DF, -0x6293,  0x5530, -0x4875,
     0x5E20,  0x7DB6, -0x516A, -0x47EE, -0x4EC0, -0x3429,  0x2649, -0x3754,
    -0x3F41, -0x00AD,  0x37BA,  0x5271, -0x3CFA, -0x1F8B,  0x2494, -0x371C,
    -0x51F4,  0x1E9F, -0x0CCB,  0x59E3,  0x180D, -0x38F2, -0x2132, -0x2B94,
    -0x17D1,  0x31A9, -0x275A,  0x2993,  0x417D, -0x49B1, -0x750B,  0x123F,
     0x3CCC, -0x18E2,  0x61E9,  0x5E28, -0x1D06, -0x68BA,  0x1647,  0x6698,
    -0x18EE,  0x50D8,  0x4231,  0x2468, -0x4A2F, -0x4FED,  0x7584,  0x6DC2,
     0x3008,  0x23BA,  0x5366, -0x2ADE, -0x379A, -0x751F,  0x3367, -0x4DE8,
     0x4A1C,  0x42C4, -0x3A38, -0x34B1, -0x031A,  0x161B,  0x3F68,  0x244D,
     0x75F3, -0x7695, -0x7439,  0x797D, -0x3AD0,  0x18E2, -0x0248, -0x2D0D,
     0x5974, -0x31D6,  0x0D25, -0x3A8C,  0x2907, -0x343B, -0x6A7F, -0x24C1,
    -0x56E9,  0x2A61,  0x1653, -0x66E7, -0x0081, -0x3549, -0x7E9C, -0x52ED,
     0x0077, -0x7C9D,  0x0411, -0x3E67,  0x6FA9,  0x3843,  0x5D37,  0x7640,
     0x021C,  0x52D1,  0x3649, -0x0232, -0x5179,  0x2204, -0x06FF, -0x20F1,
    -0x4878, -0x59D2, -0x42CF,  0x5DE2,  0x0334,  0x305C, -0x5CC4,  0x0208,
     0x338C,  0x74B7,  0x4AA6, -0x2CC7,  0x0256, -0x7E98, -0x46AF, -0x5D0B,
     0x6BD0,  0x1578,  0x5DCD,  0x0E96,  0x0CCB, -0x23C8,  0x7A56, -0x5FD6,
     0x5AA2,  0x13A3, -0x4913, -0x6E7F,  0x0E97,  0x1045,  0x1310, -0x4AF4,
     0x6109,  0x2E24,  0x0194,  0x09EE, -0x7CEC, -0x5FDA, -0x13D6,  0x68D8,
    -0x1CF3, -0x5984, -0x3410, -0x1BDF, -0x50A2, -0x5676,  0x3DBA,  0x45A4,
     0x2648, -0x412D, -0x5694,  0x2AD7,  0x2202,  0x0767, -0x2503,  0x54AD,
     0x72B7, -0x7AB2, -0x516B, -0x6D54,  0x74ED, -0x4088,  0x4054, -0x2C2A,
     0x71C3, -0x2056,  0x1932, -0x2341,  0x4799, -0x5911, -0x157C,  0x2875,
    -0x336D, -0x34F4,  0x43A4,  0x669B, -0x7B82,  0x456D, -0x25CD,  0x1E52,
     0x0D98, -0x15E3, -0x337B,  0x025A, -0x2145,  0x0537,  0x6CA7,  0x58F5,
    -0x42A1,  0x455D,  0x1087,  0x130F, -0x75F6, -0x6A54,  0x66C3,  0x0B25,
    -0x3D68,  0x58B8, -0x2E70, -0x2196,  0x49EA, -0x7203,  0x4449, -0x0D4E,
     0x006E,  0x545F,  0x291A,  0x239D, -0x64EF,  0x5A21, -0x36AE, -0x7482,
     0x390C, -0x5420, -0x4630, -0x0778,  0x4816,  0x660F, -0x30ED, -0x7944,
     0x2971, -0x288A,  0x176E, -0x25EA,  0x1B62,  0x792E,  0x55D6, -0x7A84,
    -0x1682,  0x5CA4,  0x7FDC,  0x0AED, -0x1EA0,  0x6813, -0x31C6,  0x0C70,
    -0x74C0,  0x150B, -0x3E70,  0x1F4C, -0x551A, -0x0990, -0x4C4C, -0x410F,
    -0x027E, -0x4782,  0x6F2C, -0x1CC9,  0x47E7, -0x01B2,  0x4D47, -0x31B9,
     0x229D, -0x5EA5,  0x5057,  0x65DB,  0x0A61, -0x237A, -0x3476, -0x41D3,
     0x3A7E, -0x2BE0,  0x0CE4,  0x5334, -0x3A76,  0x1070, -0x7421,  0x5099,
     0x7900,  0x483E,  0x1C26, -0x6E0C,  0x0741,  0x28DE, -0x530A, -0x403D,
    -0x1390,  0x6D37, -0x0467,  0x10A9, -0x5E49, -0x16AC, -0x1F75,  0x3668,
    -0x6C9F, -0x0D13, -0x6D49, -0x1ADE,  0x5D62, -0x4F88,  0x7560, -0x74AC,
    -0x3848, -0x2FC7, -0x15E4, -0x5EE8,  0x072C,  0x21D0, -0x567F,  0x2F26,
    -0x2D06, -0x7038,  0x1AE2, -0x19ED, -0x5B26,  0x08B0,  0x38BD,  0x6C56,
    -0x2A22, -0x36D8,  0x773F,  0x428D, -0x0B3D, -0x7A88,  0x2C6A, -0x2783,
    -0x1DEB, -0x04DB,  0x0265,  0x435E,  0x34B9,  0x6F06, -0x15A2,  0x11DB,
     0x5D5D, -0x7CA5,  0x199E, -0x2FA2,  0x183B, -0x0196, -0x7BD1, -0x53E6,
    -0x6332, -0x12EF,  0x65AC, -0x40B1,  0x10DC, -0x4D1C,  0x45B1,  0x7759,
    -0x3898,  0x7549,  0x0967, -0x5103, -0x3E04,  0x7912, -0x7A49, -0x1A90,
    -0x0C1F, -0x2AE4,  0x139B,  0x19AB, -0x3354,  0x176B, -0x4DF2, -0x318A,
    -0x774C,  0x474C,  0x2825, -0x4E4A, -0x3B1D, -0x300C, -0x5944,  0x6485,
    -0x2692, -0x32E1,  0x7752, -0x0C84,  0x76E9,  0x4535,  0x307E,  0x67C8,
     0x093F, -0x4492, -0x187F,  0x0280,  0x6307, -0x518D, -0x1579, -0x5F48,
     0x28C4,  0x7C05, -0x7B06, -0x442B, -0x7F8C,  0x2C22,  0x3F7F, -0x695A,
    -0x6FE8, -0x67D2,  0x3112,  0x0CBE,  0x3684, -0x7F64, -0x3A40, -0x797B,
    -0x76DC, -0x006D, -0x6979, -0x6F65, -0x5DEB, -0x16E5, -0x3B2D, -0x6416,
     0x2528, -0x72B7,  0x511F,  0x600A,  0x133F,  0x53EA,  0x0832,  0x6556,
     0x5F8F, -0x2DD1,  0x6285,  0x2F50, -0x36BE, -0x4921, -0x0CBE, -0x7045,
     0x7CF9,  0x1B81, -0x2396, -0x6102, -0x0A4E, -0x3CF0, -0x396A, -0x29BE,
    -0x5575, -0x4855, -0x2921, -0x2929, -0x0518, -0x3637,  0x3766,  0x4454,
    -0x2183,  0x7F66, -0x6708,  0x5EF9, -0x184F, -0x213F,  0x3B57, -0x5C25,
    -0x0B16, -0x60F7,  0x08A5,  0x3140,  0x3C37,  0x4495,  0x1A70,  0x36CD,
     0x0FDA, -0x67E1,  0x60D7,  0x17EC, -0x18CC,  0x1078, -0x46A2, -0x4F0F,

     0x3694, -0x6FBD,  0x18D6,  0x3D8A, -0x7E9F,  0x162E,  0x2EF0,  0x6AE5,
     0x372C, -0x30D1,  0x16E8,  0x081A, -0x2DE1,  0x0940, -0x7429, -0x209F
},

};

short x_cn[NUM_INPUTS][2*N + 2*PAD];
short x_i[NUM_INPUTS][2*N + 2*PAD];
short x_sa[NUM_INPUTS][2*N + 2*PAD];

short y_cn[NUM_INPUTS][2*N + 2*PAD];
short y_i[NUM_INPUTS][2*N + 2*PAD];
short y_sa[NUM_INPUTS][2*N + 2*PAD];

short w[NUM_INPUTS][2*N + 2*PAD];

/* ======================================================================== */
/*  Prototypes for timing functions.                                        */
/* ======================================================================== */
clock_t time_cn(int cur_input, int n);
clock_t time_i(int cur_input, int n);
clock_t time_sa(int cur_input, int n);

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */
int main()
{
    clock_t t_overhead, t_start, t_stop;
    clock_t t_cn, t_i;
#ifdef  _LITTLE_ENDIAN
    clock_t t_sa;
#endif
    int i, j, k, m, n, radix, fail;

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.   */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for (j = 0; j < NUM_INPUTS; j++) {
        for (i = 0; i < 2*N + 2*PAD; i++)
            x[j][i] = x[j][i] >> 4;
    }

    for (j = 16, k = 1, fail = 0; j <= N; k++, j *= 2) {
        for (n = 31, m = 1; (j & (1 << n)) == 0; n--, m++)
            ;
        radix = m & 1 ? 2 : 4;

        /* -------------------------------------------------------------------- */
        /*  Generate twiddle factors for fft of size 'j'                        */
        /* -------------------------------------------------------------------- */
        gen_twiddle_fft16x16(&w[0][PAD], j);
        
        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_cn, x, sizeof(x_cn));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_cn));

        memcpy(y_i, y_cn, sizeof(y_i));
        memcpy(y_sa, y_cn, sizeof(y_sa));
        /* -------------------------------------------------------------------- */
        /*  Check the results arrays, and report any failures.                  */
        /* -------------------------------------------------------------------- */
        for(i = 0; i < NUM_INPUTS; i++) {
            t_cn = time_cn(i, j) - t_overhead;
            t_i = time_i(i, j) - t_overhead;
#ifdef  _LITTLE_ENDIAN 
            t_sa = time_sa(i, j) - t_overhead;
#endif
        }

        printf("DSP_fft16x16\tIter#: %d\t", k);

        if (memcmp(y_cn, y_i, sizeof(y_cn))) {
            fail++;
            printf("Result Failure (y_i) ");
        }
        else
            printf("Result Successful (y_i) ");

#ifdef  _LITTLE_ENDIAN 
        if (memcmp(y_cn, y_sa, sizeof(y_cn))) {
            fail++;
            printf("Result Failure (y_sa) ");
        }
        else
            printf("Result Successful (y_sa) ");
#endif

#ifdef  _LITTLE_ENDIAN 
        printf("\tRadix = %d\tN = %d\tnatC: %d\tintC: %d\tSA: %d\n", radix, j, t_cn, t_i, t_sa);
#else
        printf("\tRadix = %d\tN = %d\tnatC: %d\tintC: %d\n", radix, j, t_cn, t_i);
#endif

        if (j == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (j == CYCLE_FORMULA_NX_PT2)
          form_cycle[1] = t_i;
    }

    /* Provide memory information */
#ifdef __TI_COMPILER_VERSION__            // for TI compiler only
    printf("Memory:  %d bytes\n", &kernel_size);
#endif

    /* Provide profiling information */
    printf("Cycles:  %d (N=128) %d (N=256)\n", form_cycle[0], form_cycle[1]);

    return (fail);
}

/* ======================================================================== */
/*  TIME_CN  -- Measure elapsed time for natural C version.                 */
/* ======================================================================== */
clock_t time_cn(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft16x16_cn(&w[cur_input][PAD], n, &x_cn[cur_input][PAD], &y_cn[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return  t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for intrinsic C version.               */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft16x16_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return  t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA   -- Measure elapsed time for serial SA version.                */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft16x16(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return  t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_fft16x16_d.c                                          */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


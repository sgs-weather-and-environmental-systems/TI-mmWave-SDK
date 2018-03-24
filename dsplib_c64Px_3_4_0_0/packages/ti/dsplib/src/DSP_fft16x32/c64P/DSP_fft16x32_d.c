/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft16x32_d.c -- Driver file for DSP_fft16x32                   */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_fft16x32' */
/*      kernel.  The function prototype appears below.  The driver itself  */
/*      is invoked as a standard C program, and results are reported on    */
/*      stdout.                                                            */
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

#include "DSP_fft16x32_cn.h"
#include "DSP_fft16x32.h"
#include "DSP_fft16x32_i.h"
#include "gen_twiddle_fft16x32.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define CYCLE_FORMULA_NX_PT1  128
#define CYCLE_FORMULA_NX_PT2  256
#define FORMULA_SIZE          2
int     form_cycle [FORMULA_SIZE];

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
int x[NUM_INPUTS][2*N + 2*PAD] = 
{
/* Input Number: 0 */

{
    -0x56E4B152, -0x030C6568, -0x336D7170,  0x52420A0A,
     0x0840E71F, -0x64D54D5C,  0x5D8FA6C7, -0x1DCE5D15,
    -0x59DB96D1, -0x2DEB28B4,  0x393FA54B, -0x38C50238,
     0x4B8A5E5D, -0x6BD6C1C5,  0x488687B5, -0x3AB9DFDC,

    -0x750239B3,  0x7568E820,  0x162B8883, -0x0CF71174,
     0x5976968E, -0x27EC27FF,  0x01EDB97A,  0x4AAEC48F,
     0x6EEFFBB7, -0x7E934F05,  0x63ABA195, -0x24363DA4,
    -0x21AC0BC3,  0x08EB3FE0,  0x4B3C65F0,  0x22F93D8C,
    -0x7EB44C5D, -0x4A7A84B8,  0x2E5A084A,  0x09E1DD92,
    -0x5E88AF9F,  0x3F606D8A,  0x29392B85,  0x04CCF25B,
     0x647B4226, -0x0E6682EA,  0x4139E5B7, -0x215B9774,
    -0x798BD22C, -0x487E453F,  0x2A3A2041, -0x5D5D0F0C,
    -0x33B08832, -0x791E798C,  0x13100D6B,  0x2E3BD89F,
    -0x3681D5F5, -0x4A47CF33, -0x0762E9EE, -0x1927F4EB,
     0x5E8EAB76, -0x4AFC00E9, -0x08F8152C,  0x13C8BF43,
    -0x7DE04EF0, -0x5203DABC,  0x2B8D1450,  0x62F2508E,
    -0x2E3FEB9D,  0x7E652337, -0x74786819,  0x08D0CC89,
     0x5F24E6B9, -0x55B6E9F8,  0x52FB2089,  0x0D1FA6D9,
     0x4C41569B, -0x5D398952,  0x665A430B,  0x3CDD1BC3,
    -0x59351FE0, -0x0AAA4279,  0x48DF3D86,  0x37FFBFE2,
     0x068B527B, -0x13EC80A4,  0x0907D13F,  0x2F6ABB7F,
     0x772B135C, -0x017692C6, -0x3F4B576A, -0x3D50C5E1,
     0x23C73C91, -0x47823B3B,  0x0D6EBD82, -0x7DFB8653,
     0x45F20279,  0x7F35AB67,  0x163B6014, -0x66F9ED27,
    -0x2765184B, -0x4430000F, -0x6C53C582,  0x17B2E715,
    -0x65BCC851, -0x18F9F9E0,  0x5B74E530,  0x652543C3,
    -0x3BCCA6A1,  0x0907998E, -0x0CCB6E93,  0x5F9BA607,
     0x15ED6ADE,  0x03BE3187, -0x5522CA07, -0x76CB463B,
    -0x6A6461BE,  0x5D28664E, -0x52CD35BD, -0x07100CB8,
    -0x562B05BF, -0x20D8A3B9, -0x4E0BEA5D,  0x5372700F,
    -0x1BBE2BDF, -0x5EAB6577, -0x6CDB7BEA, -0x7EF694BA,
     0x1DA69C6B, -0x0CB031A5, -0x790E73F2,  0x7871E868,
     0x53CB80EB, -0x4CE1FCE5,  0x40BC1EC5, -0x4B28EA79,
    -0x363BB385, -0x790742F5, -0x4E385A6B, -0x335B3941,
    -0x0EDEDDEF,  0x6F258689, -0x4001ED1D, -0x467E50AA,
    -0x678D8267,  0x5952682E,  0x7F62740C,  0x3323C0FC,
    -0x294301E4, -0x0A162CA5, -0x7E646324, -0x3EAFCC45,
     0x46438CA9, -0x74108F59, -0x6FDDACEF, -0x1F5038F2,
     0x0138368C,  0x2DDE62C0, -0x776C689E, -0x232F5A5E,
    -0x20348EB7, -0x3A028DD6, -0x5A62986F, -0x39058DC4,
     0x7C1C15E8, -0x693A5390, -0x25EC5FF3,  0x113B1551,
    -0x7F734EFD, -0x66471FC8, -0x4D61A171,  0x5331A1B8,
    -0x4B105BE2,  0x4544A0C6,  0x2C91754E, -0x4DE10EE8,
     0x52228CCA,  0x33221962,  0x295E712F,  0x67B96D6C,
     0x21807814,  0x33B86428, -0x2BD46273, -0x08C279C1,
    -0x2F4A8D4F,  0x39FAC3C6, -0x6FF75906, -0x77C0B1F7,
     0x1D78C886, -0x42B1B861, -0x09B9C068, -0x29422FC8,
     0x3EA3B2E3, -0x0A0F9A2B,  0x4973536C,  0x5DF8845E,
     0x0A29B91C,  0x7558FCC0, -0x0692B3B7,  0x15867E0E,
     0x70726EDA, -0x43E1BFB3, -0x5ADC2348,  0x642AC1DF,
    -0x53680D3F,  0x1EE517C5,  0x2C6CDC6F, -0x5813BEE9,
    -0x3B033727, -0x69419983,  0x3487B4D1, -0x160EEC81,
    -0x333290C1, -0x02693D10, -0x3D4C2F0B,  0x3E964DE2,
     0x65DE55A4,  0x241D18C4,  0x5174A2B4,  0x3D480CB6,
     0x14678C12,  0x59B3B82E, -0x0A104CB7,  0x27A22B69,
    -0x38D82E88, -0x372BA5AF, -0x0A16C012,  0x2D492BDA,
     0x32615F84,  0x48847FF2,  0x7DECDE09,  0x5F0BBE80,
     0x67430D42,  0x0C3ED025, -0x3CF7459C, -0x43447754,
     0x34264006, -0x4C1A21A7,  0x3EB4D4E7, -0x15AC7579,
    -0x33CFDEE5,  0x4930D551,  0x5A56D460,  0x15D3B826,
     0x2ADEA4C4, -0x62E16579,  0x35E7E7D3,  0x6B644258,
    -0x3A1B2105, -0x71162989, -0x1EC5D62D, -0x37C40172,
     0x00FB2581, -0x530790B3, -0x579DE59D, -0x04447087,
    -0x18FE814C, -0x35AE1475, -0x2543551F,  0x3D5CABC7,
    -0x59F52752, -0x11EDB9FC, -0x67E8BF86,  0x40CC188D,
     0x51C1962D,  0x2E67ADD2,  0x2F8162A8,  0x6DDDCFDD,
     0x67BEE0C3, -0x1B824F54,  0x6C2E5C33, -0x3B593101,
    -0x5CD9B72C, -0x2601AADB, -0x7EF687B9, -0x248EE226,
    -0x73BFC52A, -0x3A765DAC, -0x1B9FB9FA, -0x72208B05,
     0x4763B45D, -0x4152EF94, -0x46CF92D5, -0x3927E52C,
     0x3BC0D373,  0x08E46AB2,  0x449A8B33, -0x0A4B986A,
    -0x176B584D, -0x35F3649B, -0x2A135E6F, -0x58D781C3,
    -0x69C4284B,  0x29EBE908, -0x37267397, -0x408A56BE,
     0x36A18F38,  0x4B251C9D, -0x05B8F0AC, -0x1EAC188B,
     0x1A9342A0, -0x4ABDEEBF,  0x5046E2AE,  0x70262980,
    -0x1C8953C9, -0x65D4C449, -0x405DAA11, -0x3F154769,
     0x3FD8B2B7, -0x765469AA,  0x5299FE88, -0x1997B235,
    -0x1A958060,  0x00737BE8, -0x3DCD0E34, -0x54D7B373,
     0x57D579D4,  0x631BEFE9,  0x06B30A64,  0x2DA1BBCF,
    -0x0F0D8202, -0x22572C48,  0x72BCC1C7, -0x65CAA7A2,
    -0x531D13BF, -0x5EEF74D7, -0x2981F4C0, -0x65A09B2D,
     0x3D8C01B1,  0x11418804,  0x2297C9FA, -0x2B516741,
    -0x1E0E08EE,  0x4D274AEF,  0x100D4393,  0x22FDC96D,
    -0x7E0F849C, -0x5CC7BAC5,  0x55E831C1, -0x1F95481E,
    -0x70241348,  0x64F63A22, -0x2D0B308D, -0x136F7690,
     0x327CE4C9, -0x5BFE871D,  0x501E8406, -0x427E8678,
     0x29EF95E2,  0x591D8C54,  0x3BF08CFF,  0x2E05271F,
     0x04E46C8D,  0x5FC0E454, -0x1649C736,  0x5E932251,
     0x14C1878B, -0x1C5F2F5A, -0x2443C9F7,  0x438F149B,
    -0x57DF906E, -0x49417D45, -0x6CCB9619,  0x5A4B224B,
     0x0D36AE5A, -0x0285921E,  0x5E35CBFA, -0x00BA066D,
    -0x31695C96, -0x2EE068A4, -0x4D9B21DF, -0x15D6003C,
    -0x3B29D8C9,  0x35775AE2, -0x7D49D502,  0x4C114036,
     0x60928909,  0x02DA0B0E,  0x26D84767,  0x1B887A58,
    -0x40A8B7DB,  0x2C47172C,  0x3FB7F56B, -0x0430219C,
     0x04E923C4, -0x110FFA03,  0x1FA5C15E,  0x4BE0FB43,
     0x746CF656,  0x61D6EAD5,  0x3CA9B469, -0x2048A6E8,
    -0x26111F7B, -0x0F213952,  0x2662962A, -0x26ACC30F,
    -0x532BC776,  0x38E4539F,  0x7C1836D9,  0x25021723,
     0x7CA1D045, -0x38A743C7,  0x71674176,  0x226B2DCF,
     0x24A703A1,  0x42D5C758,  0x4D082D80, -0x172C20EF,
     0x3F1713C1,  0x753DE2CE,  0x7349A8BA, -0x48D5DCA9,
     0x66E85076, -0x3E305480,  0x7691186F,  0x0B58AC61,
    -0x51D07186,  0x70CC5770, -0x58645939, -0x2DB8C198,
    -0x10B29507,  0x730B8D24, -0x543FA35A,  0x4D34AEF2,
     0x4E7ED8E2,  0x001E33FE, -0x5F133774,  0x10BA12CE,
    -0x75AE7E7E, -0x68936501,  0x37B3AD05, -0x59DA664B,
    -0x6886901F, -0x13275895,  0x5E024B20,  0x65819418,
    -0x0F7B8290,  0x35595BDC, -0x12075892, -0x2715D567,
     0x3BEC2581,  0x5E24533F, -0x2AA499F6,  0x59A43DA6,
    -0x56EBF504, -0x5B3353CB,  0x572FB62D,  0x4A68F3C3,
    -0x5F612711,  0x0FE7DE5F, -0x3E123C39,  0x787E78F9,
     0x29A2EE53,  0x56B1F714,  0x29E135A4,  0x1E1163F5,
    -0x5FB6A551, -0x57C92EFD, -0x48DFBC68,  0x10444B45,
     0x304998F0, -0x288954CD, -0x155B33CE, -0x7674F0B9,
    -0x763E55E9,  0x6D0EB2FC,  0x6E0D0082,  0x22C63F3E,
     0x6AF2F32F,  0x1DE2F85B, -0x1887E8A7,  0x68963E0F,
     0x5E656304,  0x24475836,  0x54018F9F, -0x618377D5,
     0x4FE0752C,  0x072EC506,  0x63628329,  0x1B32AD1A,
     0x51CF6CD4,  0x3BCF8971,  0x5B35809F, -0x27378EC9,
     0x3E7D70D7,  0x2C59EC3F,  0x025072E5, -0x66FC61EC,
    -0x76411661,  0x311DD149,  0x09D01D94,  0x417C03FF,
    -0x1D9456B2, -0x21404B3E,  0x7E339AF1, -0x3602E2C3,
     0x1B4A6EAF,  0x3CE79E72, -0x3ADB9006,  0x5CA4F062,
    -0x312FDE8D,  0x6FEF855A, -0x6EA2570D,  0x19448C59,
     0x4E4B7036,  0x311A9439,  0x682E80FF, -0x0878426D,
     0x5BE52BC8, -0x403D187B,  0x28231E42,  0x54556ADE,
     0x180FF549, -0x57EFD3BB,  0x0F4FD60B, -0x5E0CDA98,
    -0x3439427D, -0x025046AC, -0x2F498578, -0x4591A199,
    -0x21BE78EA,  0x6A048995,  0x25533B86,  0x61BECDED,
    -0x5984FF18, -0x4D9B5679,  0x674892B1,  0x59318062,
     0x711D635F,  0x12CC93C5, -0x4B58451A, -0x4F70DDD2,

     0x574E23E5,  0x069BF1F2,  0x0A62370B, -0x5D741FFE,
     0x51DCEC31, -0x0933AD77, -0x08251B0F, -0x521A75B0,
     0x115269E2,  0x48314B1A,  0x438B18B8,  0x41DD546D,
     0x29615CD9,  0x512F846F,  0x255F4D49, -0x68A43428
},

};

int x_cn[NUM_INPUTS][2*N + 2*PAD];
int x_i[NUM_INPUTS][2*N + 2*PAD];
int x_sa[NUM_INPUTS][2*N + 2*PAD];

int y_cn[NUM_INPUTS][2*N + 2*PAD];
int y_i[NUM_INPUTS][2*N + 2*PAD];
int y_sa[NUM_INPUTS][2*N + 2*PAD];

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
    int i, j, k, n, m, radix, fail;

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.   */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for (j = 16, k = 1, fail = 0; j <= N; k++, j *= 2) {
        t_cn = 0;
        t_i = 0;
#ifdef  _LITTLE_ENDIAN
        t_sa = 0;
#endif

        for (n = 31, m = 1; (j & (1 << n)) == 0; n--, m++)
            ;
        radix = m & 1 ? 2 : 4;

        /* -------------------------------------------------------------------- */
        /*  Generate twiddle factors for fft of size 'j'                        */
        /* -------------------------------------------------------------------- */
        gen_twiddle_fft16x32(&w[0][PAD], j);

        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_cn, x, sizeof(x));
        memcpy(x_i, x, sizeof(x));
        memcpy(x_sa, x, sizeof(x));
        memcpy(y_i, y_cn, sizeof(y_i));
        memcpy(y_sa, y_cn, sizeof(y_i));

        /* -------------------------------------------------------------------- */
        /*  Check the results arrays, and report any failures.                  */
        /* -------------------------------------------------------------------- */
        for(i = 0; i < NUM_INPUTS; i++) {
            t_cn += time_cn(i, j) - t_overhead;
            t_i += time_i(i, j) - t_overhead;
#ifdef  _LITTLE_ENDIAN 
            t_sa = time_sa(i, j) - t_overhead;
#endif
        }

        printf("DSP_fft16x32\tIter#: %d\t", k);

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
    DSP_fft16x32_cn(&w[cur_input][PAD], n, &x_cn[cur_input][PAD], &y_cn[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I  -- Measure elapsed time for intrinsic C version.                */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft16x32_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA  -- Measure elapsed time for intrinsic SA version.              */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft16x32(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_fft16x32_d.c                                          */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


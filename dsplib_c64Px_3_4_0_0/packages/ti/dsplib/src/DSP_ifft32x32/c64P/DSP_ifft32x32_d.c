/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_ifft32x32 -- Driver file for DSP_ifft32x32                     */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'ifft32x32'    */
/*      kernel.  The function prototype appears below.  The driver itself  */
/*      is invoked as a standard C program, and results are reported on    */
/*      stdout.                                                            */
/*                                                                         */
/*      Building this with the "COMM_FLOW" and "RAND_DATA" macros set      */
/*      will build a driver which generates and tests with random data     */
/*      sets.  Otherwise, the driver will use a fixed test vector.         */
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

#include "DSP_ifft32x32_cn.h"
#include "DSP_ifft32x32.h"
#include "DSP_ifft32x32_i.h"
#include "gen_twiddle_fft32x32.h"

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
#pragma DATA_ALIGN(x_c, 8);
#pragma DATA_ALIGN(x_i, 8);
#pragma DATA_ALIGN(x_sa, 8);

#pragma DATA_ALIGN(y_c, 8);
#pragma DATA_ALIGN(y_i, 8);
#pragma DATA_ALIGN(y_sa, 8);

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
#define N   (256)
#define PAD (16)

/* ======================================================================== */
/*  Number of input arguements:            .                                */
/* ======================================================================== */
#define NUM_INPUTS (1)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
int x[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
    -0x56BBF382, -0x33FFB3CC,  0x35C4A18C,  0x0E60EFD1,
    -0x2BC60C27,  0x2CC37D52, -0x4C548EEE, -0x75D3BEDC,
     0x55BC2D08, -0x128FFC3F, -0x447F1FBD,  0x0E274EE5,
     0x48CD2584, -0x205E45B2, -0x67D2A6FD,  0x4D295309,

    -0x48322274, -0x6AE99196,  0x5E24A8BA,  0x6B798B32,
     0x2F2E67EB, -0x6F8DF77F,  0x106B90BB, -0x6D8B3260,
     0x1C053113, -0x2C07CC4E, -0x2F329AD6,  0x1E7DCFD7,
     0x68F49CF5,  0x53C4E571, -0x6E57BF11, -0x0358609D,
    -0x1BFFA6D2, -0x28F7A064, -0x2E1ECECD, -0x5D5D41B6,
    -0x113EDE0E, -0x4B32F096, -0x2F89F41A,  0x346F74AC,
    -0x1C8BD4B5, -0x0A4D172F, -0x23D2CA38,  0x4B46C402,
    -0x2B9004EA,  0x612A9FC7,  0x0EF10A83, -0x20AC6673,
    -0x018609AE, -0x12439F05,  0x1C40494E, -0x22646692,
    -0x7582B6CF,  0x0FCB626A, -0x57BAF172, -0x2845D922,
     0x0E219778,  0x7555F468, -0x6AF226F1,  0x66CE0E20,
     0x59BFF8A6, -0x5ACB8F7B, -0x1A9BDCC6, -0x5DCE9776,
    -0x03C13AA2, -0x02936016, -0x6836FE26,  0x516C1842,
     0x214CB0A5, -0x6015F96E,  0x090B50ED,  0x28F18A22,
     0x2076A661, -0x46B3580A,  0x6A05F3F0, -0x3EF3EDBD,
     0x5BA907A2, -0x46D25D67, -0x5F0566B6, -0x545A8250,
    -0x1C7361C7, -0x1A94A9FA,  0x4212942A,  0x26324EC8,
     0x583EF30F, -0x2B0FA652,  0x0E793E7B,  0x007325C1,
    -0x630B9D32,  0x5083F237,  0x6A9D6261,  0x1673DBDC,
    -0x410382B0,  0x1D0D71B0,  0x621040B5,  0x023DBEBA,
    -0x4E63B9AD,  0x21EBF92C, -0x4A746FE8,  0x62E18C61,
     0x4854ACFA,  0x76BB3B4D,  0x5F8A1F03,  0x4E2D8766,
    -0x0B002A67, -0x22D568D3,  0x2D196D64,  0x6EAF47C1,
    -0x37A342BB,  0x1B452D3E, -0x2DCF20B5,  0x3777ACC9,
     0x436E99AE, -0x4D32A07B,  0x043DFF13, -0x35EA7825,
     0x624590C6, -0x73FDC636,  0x1C49449D, -0x019E93D5,
     0x6BA336AE, -0x0381B7DA, -0x41BF16EC,  0x08782D38,
     0x0F065D6A, -0x4D79997B,  0x03D856B4,  0x4C89896E,
     0x408EB1E2,  0x0A5EE488, -0x586373DE, -0x2D2E7C8B,
     0x5949A0AB,  0x4720AE53, -0x3D67D93D, -0x1C941664,
     0x02600B15,  0x2B94D7C7,  0x7D2164A8,  0x445288FB,
     0x5E9C4F09,  0x7E8812A2,  0x5741C679, -0x62D5794A,
    -0x0322F2D5, -0x0FD66AF9,  0x6448AFED, -0x7FB38717,
     0x0CDE4AC5, -0x17220B0E,  0x16FB954E, -0x636F6C3C,
     0x5EEA58FC, -0x4AE3A7EF,  0x0EDE497D, -0x76A867BA,
    -0x5F13F52D, -0x602C4B72,  0x7029B808, -0x39A519D7,
     0x635ABA6C,  0x68BA5A36,  0x34D8D1CA,  0x55B73C73,
     0x6891961B, -0x57CC7A6D,  0x0C5DE086,  0x7CBEA430,
    -0x52034140, -0x6CD0B294,  0x3D75091E,  0x2C0212D8,
    -0x3D4B4F18, -0x5F7777D4,  0x0F9C47C3, -0x71D3D824,
    -0x1B1582C6, -0x619BE74E,  0x319F78BC,  0x3607AAD9,
     0x58C64BA8, -0x5FE5D9EF, -0x502608DA,  0x765A28FA,
    -0x6BE75311,  0x5C10CCAC, -0x197AB7B4,  0x5AF44200,
    -0x5C8EC722,  0x6425A84B,  0x00B74601, -0x3378D48E,
     0x521EF5E1, -0x33EF2077,  0x747A6B82,  0x52BBCC74,
    -0x597CE7A1, -0x4DB3F0CB,  0x07849A64,  0x000522D2,
     0x134F8157,  0x27FBA61B, -0x21E903F9,  0x02BC39A4,
    -0x0BDF6D37,  0x055231B5,  0x0577691A,  0x50F85E26,
    -0x2D02338F,  0x22FD0E41,  0x0791DE9F,  0x0EA50038,
    -0x17CE42C6,  0x700F11C7,  0x07317CFB,  0x0064B402,
     0x6C0EB608,  0x78E89480, -0x239A616D, -0x4A5F12BA,
     0x270DD547, -0x39598BCE, -0x48859193, -0x328F1C2A,
    -0x3E352A40, -0x5071811A, -0x37DA69A5, -0x194DDD46,
     0x626C2F3A,  0x04FDC092,  0x6B3E6F31, -0x5214B985,
     0x10E40663,  0x23565728,  0x5FA64C83, -0x679997F0,
     0x51936483, -0x0B8EEB70,  0x74CC446A, -0x41EB4AFB,
    -0x6531C289,  0x4810A607,  0x505314D5,  0x5FB1B33B,
    -0x093B388B,  0x19CD9D6B, -0x54A8771E, -0x7E5E4D29,
    -0x7FB968E7,  0x3610E7ED, -0x692C0C40,  0x4519EEDB,
     0x18EC143D, -0x2E7ECB51,  0x44AD3198,  0x5002D4EA,
    -0x1DDE52EA,  0x6F80C7CB, -0x1F1F43FE, -0x1BE3FD53,
     0x068D631B, -0x3EE7C8C4, -0x24BFB57D,  0x17EA6967,
     0x3C5D203D, -0x1B0766C2,  0x4A6C778F, -0x492BDDCA,
    -0x6A0DA828,  0x7BED9E84, -0x3CA60262,  0x49156A72,
     0x0C6D73FE,  0x3E5614EC,  0x43FDFDBB, -0x491FAC44,
     0x5E9C9280,  0x61235A0B, -0x686032D2,  0x184E9A39,
    -0x5835EDBE,  0x67CF4628, -0x3AB72361,  0x2D88336E,
     0x40EE635A, -0x2B2515DB,  0x06D11A4C, -0x104A08B7,
     0x64BCAC7C,  0x4D4BD5CB, -0x44EB873D, -0x2DDAF728,
     0x1C1BBB22, -0x6B58C903, -0x173C1A56,  0x24445D1C,
    -0x0F8F3FF6, -0x11078DA3, -0x46AA94F8,  0x1AC60195,
    -0x28A7A585,  0x6C48A6CF, -0x785F3460, -0x0B668B18,
    -0x0AC29236, -0x64DD6A91, -0x1A73D632, -0x29E938C5,
    -0x68B8BB4F,  0x169A8169,  0x31674C70, -0x48092751,
    -0x07C57812, -0x7EB788C3,  0x2963DE5B,  0x0584438E,
     0x45A771A8,  0x65D380ED,  0x08A849D2,  0x5A908094,
     0x730AE51C,  0x73724791, -0x5C6E6E77, -0x12575910,
     0x4A40BD1A, -0x540B572D,  0x1083C8B7,  0x130C6964,
     0x3DE6F5C1, -0x14385523,  0x51EF85A7,  0x74E8B511,
    -0x72ECE4F3,  0x5F816924, -0x7F180DA8,  0x5C4B826C,
     0x21F48CA9,  0x58676EA3,  0x05DFDAA6, -0x4A9DB022,
    -0x4935FB74,  0x0879F0FF,  0x4E0D5578,  0x2770CF88,
    -0x3C340A25, -0x5E8378F0, -0x70199081, -0x27F1C54B,
    -0x539ED262,  0x5E88C556,  0x013D69F1,  0x5724D771,
    -0x45B6B851, -0x136CBA25,  0x308902DD,  0x282829CF,
     0x52197080, -0x467D5E0E, -0x3F3BB387,  0x771C4D4F,
    -0x09600EDD, -0x55CC2C94,  0x476F9204,  0x6DD207F6,
    -0x7658F7E4, -0x4DEA7452, -0x60C73954, -0x4F1B0877,
     0x599E907C, -0x294E16CB,  0x44BE00FB, -0x7D017E8C,
     0x6D9BF8C3,  0x0DC22DFD,  0x32F58953,  0x04DED9D7,
    -0x66BB01ED, -0x78B834A8, -0x2E490D10,  0x2995CB41,
    -0x29E83DDE, -0x20EB8D5A,  0x59DBB6EF, -0x3F706172,
     0x5F91A178, -0x5394817F,  0x4794F0E5,  0x2AD7B174,
     0x16B9597C, -0x07EDA53B,  0x5049987C,  0x36204034,
    -0x5772FD3E,  0x1D66460D,  0x5AADCB97, -0x5EF7280A,
    -0x0436B2DA, -0x7805E8F2, -0x009C5580, -0x49D80DB1,
     0x609A982D, -0x25D6A69A,  0x0CD039A3, -0x63ABB691,
     0x0AA74337,  0x0135654A, -0x747828B3, -0x3E4FB48A,
     0x4604DEEE, -0x659F1F5C, -0x2A22460B, -0x0F0CBC8A,
     0x007C9F88,  0x4D8C2518,  0x2013FB8E, -0x7A845262,
     0x06CBA14D, -0x742ED792,  0x1AACB467,  0x4F933706,
    -0x6BD98419,  0x26A133EE,  0x055EA30C, -0x70751150,
    -0x60496A02,  0x5EE8221A, -0x26D9224D, -0x5E03E5D8,
     0x7166D795, -0x3A5A7FA6, -0x1505ED49, -0x3719BBAC,
    -0x0462DE47, -0x716BE7F3, -0x685C2A6C, -0x63091218,
     0x7A4F09F6, -0x39B4917F,  0x762F7DF1, -0x595F93FC,
    -0x2A068BEF, -0x1AA157A6, -0x6F74F7CF, -0x678F7D7F,
     0x47F56E92,  0x520266DD,  0x18BB9211, -0x54E1EDA4,
    -0x2E4B2972,  0x44B7FFA6,  0x2A33D3C7, -0x5618742E,
    -0x1AA5A4BA, -0x78964ABC,  0x14D13331,  0x149E7EA7,
    -0x1CCAC6FD, -0x5366B1BC, -0x61051D73, -0x0AF41FF4,
    -0x2B62AD3E,  0x1907A01F, -0x29AA81CE, -0x2A03844A,
    -0x1552F6D7, -0x7DA97A69, -0x14552E21,  0x4EA4089F,
     0x47676F3E,  0x413EC2F5,  0x7D5D0906, -0x2F488116,
    -0x7355C28D,  0x1AB050B5,  0x051210A8,  0x03BE0472,
    -0x5A64E58F, -0x21795DE1, -0x52139BC8,  0x4D3C1586,
     0x5EE0AC2D,  0x7B2F4941,  0x43EB0306, -0x00F7A9B5,
     0x4444FBCE, -0x1C20702C, -0x620C214C, -0x539673BE,
     0x3B3A9ACE,  0x69BB7990,  0x11EE6134,  0x1A7D4D84,
     0x6DC127F7, -0x0974479F,  0x688F81D0,  0x6352D617,
    -0x17D6736D, -0x5594F4F6, -0x24C5264B, -0x4CB37105,
    -0x67C86987,  0x5D0084AE, -0x6779A86D,  0x3248B952,
    -0x0ECFA9AA, -0x725CB73A,  0x40EAF1B9, -0x760127C0,
    -0x11C3313C,  0x26212DFB, -0x04FB14C0, -0x66DBCB1C,
    -0x364B8F57, -0x499A2E92, -0x7F02D73D, -0x3227EAF8,
     0x04C7DD60, -0x774A661D, -0x5062F8E7, -0x6B3AD40F,
     0x2A08852A,  0x1EE7185D,  0x296D549A, -0x7F776024,
    -0x20A37E98, -0x6DE48E67,  0x7089BA6E, -0x7422AE5F,

    -0x4D3FB9E1,  0x606F17FF,  0x0A8D4B66,  0x0305C806,
     0x317EA042,  0x0D41806D,  0x2A2295DE, -0x6E0BB4CF,
    -0x3AC786B4,  0x3C624A76,  0x60AEBC22, -0x0A455836,
    -0x29A40B68, -0x5C24BB79, -0x365BD119, -0x294FDDBE
},

};

int x_c[NUM_INPUTS][2*N + 2*PAD];
int x_i[NUM_INPUTS][2*N + 2*PAD];
int x_sa[NUM_INPUTS][2*N + 2*PAD];

int y_c[NUM_INPUTS][2*N + 2*PAD];
int y_i[NUM_INPUTS][2*N + 2*PAD];
int y_sa[NUM_INPUTS][2*N + 2*PAD];

int w[NUM_INPUTS][2*N + 2*PAD];

/* ======================================================================== */
/*  Prototypes for timing functions.                                        */
/* ======================================================================== */
clock_t time_c(int cur_input, int n);
clock_t time_i(int cur_input, int n);
clock_t time_sa(int cur_input, int n);

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */
int main()
{   
    clock_t t_overhead, t_start, t_stop;
    clock_t t_c, t_i;
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
        for (n = 31, m = 1; (j & (1 << n)) == 0; n--, m++)
            ;
        radix = m & 1 ? 2 : 4;

        /* -------------------------------------------------------------------- */
        /* Generate twiddle factors                                             */
        /* -------------------------------------------------------------------- */
        gen_twiddle_fft32x32(&w[0][PAD], j, 2147483647.5);

        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_c, x, sizeof(x_c));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_sa));

        /* -------------------------------------------------------------------- */
        /*  Force uninitialized arrays to fixed values.                         */
        /* -------------------------------------------------------------------- */
        memset(y_c, 0xA5, sizeof(y_c));
        memset(y_i, 0xA5, sizeof(y_i));
        memset(y_sa, 0xA5, sizeof(y_sa));

        /* -------------------------------------------------------------------- */
        /*  Check the results arrays, and report any failures.                  */
        /* -------------------------------------------------------------------- */
        for(i = 0; i < NUM_INPUTS; i++) {
            t_c = time_c(i, j) - t_overhead;
            t_i = time_i(i, j) - t_overhead;
#ifdef  _LITTLE_ENDIAN 
            t_sa = time_sa(i, j) - t_overhead;
#endif
        }

        printf("DSP_ifft32x32\tIter#: %d\t", k);

        if (memcmp(y_c, y_i, sizeof(y_c))) {
            fail++;
            printf("Result Failure (y_i) ");
        }
        else
            printf("Result Successful (y_i) ");

#ifdef  _LITTLE_ENDIAN 
        if (memcmp(y_c, y_sa, sizeof(y_c))) {
            fail++;
            printf("Result Failure (y_sa) ");
        }
        else
            printf("Result Successful (y_sa) ");
#endif

#ifdef  _LITTLE_ENDIAN 
        printf("\tRadix = %d\tN = %d\tnatC: %d\tintC: %d\tSA: %d\n", radix, j, t_c, t_i, t_sa);
#else
        printf("\tRadix = %d\tN = %d\tnatC: %d\tintC: %d\n", radix, j, t_c, t_i);
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
/*  TIME_C   -- Measure elapsed time for natural C version.                 */
/* ======================================================================== */
clock_t time_c (int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft32x32_cn(&w[cur_input][PAD], n, &x_c[cur_input][PAD], &y_c[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for optimized C (with intrinsics)      */
/*              version.                                                    */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft32x32_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA   -- Measure elapsed time for SA                                */
/*              version.                                                    */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft32x32(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_ifft32x32_d.c                                         */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


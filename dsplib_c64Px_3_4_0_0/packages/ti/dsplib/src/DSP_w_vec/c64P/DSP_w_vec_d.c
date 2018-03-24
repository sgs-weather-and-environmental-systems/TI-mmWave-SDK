/* ======================================================================= */
/* DSP_w_vec_d.c -- Weighted Vector Sum                                    */
/*                  Driver code implementation                             */
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

#include "DSP_w_vec_cn.h"
#include "DSP_w_vec.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        8
#define CYCLE_FORMULA_NX_PT1  16
#define CYCLE_FORMULA_NX_PT2  32
/* inverse of [16 1] */
/*            [32 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0625,  0.0625},
 { 2.0000, -1.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* kernel specific input arrays */
#pragma DATA_ALIGN(a, 8);
#pragma DATA_ALIGN(b, 8); 
/* implementation specific output arrays */
#pragma DATA_ALIGN(c_c, 8);
#pragma DATA_ALIGN(c_i, 8);

#define N   (256)   /* number of elements in input and output vectors */
#define PAD (16)

#define M (16384)

short a[N + 2*PAD] =
{
    0xD9CF,  0x0E33,  0x2ADE,  0xFE88,  0xCE0D,  0x10D6,  0x29B4,  0x3D39,  
    0x0DC4,  0xE849,  0xDB6A,  0x14C5,  0x117B,  0x0C1D,  0x2321,  0x24C3,  

    0xE3B5,  0xC48C,  0x3E1B,  0xD4D3,  0x0E3E,  0xE83C,  0xEB19,  0x1A12,  
    0xCD9B,  0xCE2F,  0x3F27,  0xEDA9,  0xCA97,  0x1D68,  0x2EFC,  0xD185,  
    0x0B12,  0x0273,  0x2293,  0xC1F2,  0x0A24,  0xF26A,  0xD7BF,  0xF121,  
    0xF42C,  0xD906,  0x3696,  0xD5AD,  0x37E0,  0x1D63,  0xCFA4,  0x0DCC,  
    0xC64D,  0x21AE,  0xE57B,  0x25A3,  0x2FAB,  0x233A,  0x2A16,  0xF309,  
    0xF670,  0xF0FD,  0x0361,  0x3D18,  0x01F7,  0xEC0B,  0xEF0D,  0xC4DA,  
    0xF7C3,  0x1E7C,  0xC198,  0xEE2D,  0xF235,  0x13FF,  0x388E,  0xD925,  
    0x3978,  0x16DC,  0xD33E,  0xDDD0,  0xE22D,  0xDFCE,  0x373E,  0xEAEE,  
    0xFEC0,  0x021B,  0x3AA0,  0x0B9E,  0x12EE,  0x2DC9,  0x2B55,  0xE62E,  
    0x0ADC,  0x2F0D,  0x23EA,  0xFF9D,  0xF6C2,  0xF540,  0xCFC4,  0xDEF7,  
    0x3798,  0x193A,  0x052F,  0xFC34,  0xD2C3,  0x12D7,  0x3390,  0x124D,  
    0xF60B,  0xF620,  0xFB0E,  0xD40E,  0x0253,  0xDC86,  0x157F,  0x3A81,  
    0xC2D6,  0xD32C,  0x1F3D,  0xE3D5,  0xD414,  0x2464,  0x1FA7,  0x28DE,  
    0x160A,  0xEC22,  0x0C9F,  0x2F61,  0xF59B,  0x2008,  0x2E4A,  0x3309,  
    0xD362,  0xE712,  0x114C,  0x20E5,  0x0466,  0xFC01,  0xF345,  0xC3E5,  
    0x2357,  0xEF78,  0xD719,  0x2E02,  0xE19C,  0x1DA2,  0x279A,  0xF6E1,  
    0x23CA,  0xE1F1,  0xE8E7,  0xF2A2,  0xC7E4,  0xD3F8,  0xF01D,  0xF9BE,  
    0x1ACE,  0x2E88,  0x2345,  0x2AA0,  0x0BB2,  0x2206,  0xE4E7,  0x3224,  
    0xD3C0,  0x0378,  0x0659,  0xC626,  0x25B0,  0xDBA4,  0xD478,  0x23A5,  
    0xF01F,  0x2498,  0xF749,  0x1583,  0x04FD,  0x0685,  0xF197,  0xE83F,  
    0xCA95,  0x181E,  0x2D88,  0xC3A3,  0xD358,  0xE3D4,  0xCDD7,  0xE4F8,  
    0xD442,  0xEE02,  0x08CB,  0xE3FE,  0x10F3,  0xE132,  0xD89A,  0x3B3C,  
    0xE4D5,  0xC7BF,  0xD3DD,  0x0DDA,  0x2878,  0x1C33,  0x0944,  0x1E11,  
    0xCE26,  0x28C1,  0x22CD,  0x28B3,  0x1166,  0xDF7D,  0xF584,  0xD6DE,  
    0xEFA3,  0x3E43,  0x1EF6,  0x36C3,  0x3BA0,  0xD04E,  0xFA71,  0x38DE,  
    0xF7D8,  0xC7E8,  0xD091,  0x17F4,  0x0DDB,  0xCB01,  0x03CD,  0x3F57,  
    0x2D17,  0xD309,  0xE4AC,  0x2EF7,  0xDC1C,  0x11A1,  0x2073,  0xDECC,  
    0xD8EE,  0xE3C1,  0x2574,  0x21D0,  0x120B,  0x2C5D,  0xEA24,  0xC119,  
    0x3222,  0x1601,  0xDF76,  0xE462,  0xDED5,  0x1885,  0xE0B7,  0x1DF3,  
    0xFCB4,  0xE493,  0xFD3D,  0x009C,  0xE3D6,  0x2DA1,  0x2021,  0xE66C,  
    0xA03E,  0x871C,  0x5E13,  0xB77E,  0x5D45,  0xF0BC,  0x0301,  0xEFEB,  
    0xF75B,  0x2C53,  0xDFD0,  0x6B0B,  0x4474,  0x7130,  0x93BC,  0xD4C2,  

    0x3DEA,  0xEC1B,  0xFD11,  0xE60C,  0x39C4,  0xF795,  0x825F,  0xAC41,  
    0x36F1,  0x601C,  0x45C5,  0xC852,  0x108C,  0xA866,  0x6D28,  0xA80B  
};

short b[N + 2*PAD] =
{
    0x0BBF,  0x0043,  0x3D01,  0xD608,  0xDC75,  0x1212,  0xDCD3,  0xC719,  
    0xD4EC,  0x38EA,  0x000D,  0xCDF9,  0xC7C7,  0x28B4,  0xE904,  0xF9CC,  

    0x0167,  0x0D49,  0x1178,  0x206A,  0xF4B0,  0xCE10,  0x3672,  0x3F62,  
    0xEBC5,  0xE3E1,  0xCE77,  0xF954,  0x0227,  0x0B54,  0xFDE4,  0x1404,  
    0x007A,  0x1C62,  0xE29B,  0xF7C2,  0xF878,  0xDB91,  0x3891,  0xE909,  
    0xE4A6,  0x0543,  0x1D4A,  0xEDB1,  0x2F8A,  0x2B63,  0x29A6,  0x17DF,  
    0xE996,  0x0DF2,  0xF853,  0xE168,  0xDA47,  0xCD3A,  0x10BE,  0xF824,  
    0xFC7A,  0xC21F,  0x2625,  0xDC48,  0x1F16,  0x2C9F,  0xFBB7,  0xC137,  
    0xEA5A,  0x0B9F,  0xC652,  0xC40A,  0x14C5,  0x324E,  0xC2B7,  0x136A,  
    0x060B,  0xD07E,  0x183D,  0xFCC9,  0xC924,  0xCD64,  0x0074,  0x3D95,  
    0xF697,  0xC05F,  0xD10A,  0xC8DA,  0x210C,  0x3296,  0xF558,  0xF9F8,  
    0x2E0D,  0xECD9,  0xF70B,  0xFA7A,  0x06B8,  0x0505,  0xE9B2,  0xF8B6,  
    0xD95C,  0xE8B7,  0x03BC,  0xCE6B,  0x1459,  0xF3DD,  0x24D8,  0xE96C,  
    0x3BFE,  0xE23D,  0x2AF5,  0x1F6F,  0xECD1,  0xE7BA,  0xF7B1,  0x3282,  
    0x270C,  0xE851,  0xC56E,  0xD16C,  0xCDDE,  0x1AAF,  0x0C01,  0x298D,  
    0x1B9F,  0x37B7,  0xC755,  0x28DC,  0xD754,  0xD8D8,  0xFFC8,  0x3476,  
    0xC400,  0xCB6C,  0x2A61,  0x1053,  0xF6EB,  0x0640,  0xC317,  0xF72A,  
    0x23DF,  0xDF7D,  0xFACB,  0xEF81,  0xE065,  0xDB86,  0xE0D8,  0x29B9,  
    0x12B8,  0x22E4,  0x2E49,  0xCF5F,  0x1A11,  0x1FFF,  0x1B01,  0xE37D,  
    0xEB37,  0x3754,  0x10A8,  0x1AFF,  0xCB1D,  0xF25B,  0x1804,  0x0BE7,  
    0x06C3,  0x32EE,  0x2EAD,  0x3EB8,  0xDEA9,  0xEFBC,  0xCCE9,  0x0424,  
    0xC00F,  0xCCCB,  0x0E16,  0xCB10,  0xCC3B,  0x1360,  0xEA98,  0xCC7A,  
    0xFC3B,  0x07B3,  0x3B7A,  0x3A46,  0x283B,  0x343C,  0x235C,  0xF3CE,  
    0x12C7,  0x0125,  0xE765,  0xD172,  0x04A3,  0xC79E,  0x07FB,  0xDD49,  
    0xFA4C,  0xC50A,  0xE2B3,  0xC481,  0x3F37,  0x06DB,  0x1379,  0x12D7,  
    0x1E95,  0x234D,  0x0904,  0x1C84,  0xF7FC,  0x0CEE,  0xF9D1,  0x3E4A,  
    0x3BDA,  0xCB51,  0x3116,  0x1548,  0x15F2,  0x2927,  0xCCBF,  0xEF33,  
    0x143F,  0x087D,  0x3F1E,  0x0E56,  0xCD01,  0x06FC,  0x3303,  0xDE67,  
    0x0B6A,  0x083D,  0xCDA2,  0xDB35,  0xC756,  0xF7B0,  0xC802,  0x1F4C,  
    0x2B42,  0x077A,  0xD76C,  0x39C0,  0x218B,  0xF5FC,  0x2E5C,  0x325D,  
    0xD967,  0x1AB7,  0x275E,  0x3706,  0x276F,  0x3B34,  0xFDCC,  0xE41C,  
    0x36D6,  0x15AC,  0x35DD,  0x1E50,  0xCBDB,  0x1E2F,  0xFFE1,  0x0C3E,  
    0xA644,  0x88E0,  0xF200,  0x231C,  0x765D,  0xCD99,  0xFC34,  0x7327,  
    0xACE1,  0xE169,  0xCFCB,  0x4C6D,  0xAE91,  0x0BEC,  0x98D2,  0x661F,  

    0x0399,  0x873B,  0xCA64,  0x8E8B,  0x95CF,  0xC029,  0x57E2,  0xDF59,  
    0xF0F4,  0x9482,  0xF239,  0x09CA,  0x80EF,  0x934D,  0x5222,  0x8DF9  
};

/* results */
short c_c[N + 2*PAD], *const ptr_c_c = c_c + PAD;
short c_i[N + 2*PAD], *const ptr_c_i = c_i + PAD;

const short *const ptr_a = a + PAD;
const short *const ptr_b = b + PAD;

clock_t time_c(int n);
clock_t time_i(int n);

/****************************************************************************/
/* TOP LEVEL DRIVER FOR THE TEST.                                           */
/****************************************************************************/
int main()
{
    clock_t t_overhead, t_start, t_stop, t_c, t_i;
    int i, j, n, fail = 0;    /* failure status */
    int form_error = 0;

    for(n = 8, i = 1; n <= N; i++, n += 8) {
        /********************************************************************/
        /* COMPUTE THE OVERHEAD OF CALLING CLOCK TWICE TO GET TIMING INFO.  */
        /********************************************************************/
        /* Initialize timer for clock */
        TSCL= 0,TSCH=0;
        t_start    = _itoll(TSCH, TSCL);
        t_stop     = _itoll(TSCH, TSCL);
        t_overhead = t_stop - t_start;

        memset(c_c, 0x5A, sizeof(c_c));
        memset(c_i, 0x5A, sizeof(c_i));

        /********************************************************************/
        /* CALL THE INDIVIDIUAL TIMING ROUTINES.                            */
        /********************************************************************/
        t_c = time_c(n) - t_overhead;
        t_i = time_i(n) - t_overhead;

        /********************************************************************/
        /* PRINT TIMING RESULTS                                             */ 
        /********************************************************************/ 
        printf("DSP_w_vec\tIter#: %d\t", i);

        /********************************************************************/
        /* CHECK THE RESULTS ARRAY.                                         */
        /********************************************************************/
        if (memcmp(c_i,  c_c, sizeof(c_c)) != 0) {
            fail++;
            printf("Result Failure (c_i)");
        }
        else
            printf("Result Successful (c_i)");

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
            printf("Cycles:  %d*Nr + %d \n", form_result[0], form_result[1]);
        }
        else {
            printf("Cycles:  %d/%d*Nr + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
        }
    else
        printf("Cycles Formula Not Available\n");

    return (fail) ;
}

/****************************************************************************/
/* COMPUTE THE ELAPSED TIME OF THE COMPILED NATURAL C ROUTINE               */
/****************************************************************************/
clock_t time_c(int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_w_vec_cn(ptr_a, ptr_b, M, ptr_c_c, n);
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
    DSP_w_vec(ptr_a, ptr_b, M, ptr_c_i, n);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_w_vec_d.c                                             */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


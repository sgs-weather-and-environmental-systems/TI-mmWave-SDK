/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_ifft16x16 -- Driver file for ifft16x16                         */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'ifft16x16'    */
/*      kernel.  The function prototype appears below.  The driver itself  */
/*      is invoked as a standard C program, and results are reported on    */
/*      stdout.                                                            */
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

#include "DSP_ifft16x16_cn.h"
#include "DSP_ifft16x16.h"
#include "DSP_ifft16x16_i.h"
#include "gen_twiddle_ifft16x16.h"

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
#pragma DATA_ALIGN(x_c, 8);
#pragma DATA_ALIGN(x_i, 8);
#pragma DATA_ALIGN(x_sa, 8);
#pragma DATA_ALIGN(y_c, 8);
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
#define NUM_INPUTS  (1)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
short x[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
    -0x5DAE, -0x70DE,  0x554E,  0x56B6,  0x462A,  0x4FF6,  0x321E,  0x24BA,
     0x19C0, -0x3691,  0x5DE4,  0x0E0F, -0x531A, -0x1BEB, -0x2A63,  0x1DBD,

    -0x02B3, -0x39E6, -0x1CB4,  0x4BBD,  0x103A,  0x0812,  0x3F07,  0x149D,
     0x4411,  0x3FB2,  0x412A, -0x5490, -0x05B9,  0x7604, -0x6FDB,  0x517B,
    -0x09CF,  0x09AF, -0x2093,  0x521F,  0x0C36,  0x63AB,  0x2510,  0x278C,
    -0x711A,  0x2207, -0x1D98,  0x3DAE,  0x0269,  0x2328, -0x1A91, -0x1D21,
    -0x652A, -0x0EF8,  0x1A34, -0x2728, -0x0C18,  0x15F8, -0x280D,  0x0564,
    -0x6569, -0x2B99,  0x354C, -0x28AD, -0x2FF2, -0x37DE, -0x15E8, -0x42D1,
     0x1E84, -0x1B63,  0x2A6A,  0x5034,  0x2279,  0x5FB6,  0x0922, -0x65FE,
     0x29CC, -0x0384, -0x1555,  0x0C98,  0x0A39,  0x3F7B,  0x685A, -0x77F1,
    -0x3547,  0x0202,  0x50E7,  0x238C, -0x7FC5, -0x0F13,  0x158F,  0x0003,
     0x0147,  0x6A73,  0x5051, -0x2CD2, -0x2E05,  0x476D, -0x3C2F, -0x76B5,
    -0x2513,  0x04AB,  0x6457, -0x69E8,  0x636E, -0x3046, -0x1E8D,  0x6696,
    -0x2E54, -0x0146,  0x3EC0,  0x7704, -0x51CA,  0x6BA8, -0x1DB9, -0x6C5E,
     0x6D60,  0x2EB5, -0x47F9, -0x504E,  0x7E0A,  0x4414, -0x30E6, -0x07C4,
     0x1F48, -0x6931,  0x00FE,  0x780F,  0x7569, -0x15E4,  0x1779, -0x1976,
     0x67DD,  0x30B0,  0x07A8,  0x229C, -0x3A7B, -0x406A, -0x6359, -0x366F,
     0x2BD9, -0x0EF8,  0x365B,  0x7314,  0x3275, -0x603D,  0x06E2,  0x1FFA,
     0x5E88,  0x1167,  0x551C,  0x354F,  0x549E, -0x3CB8,  0x4DDC, -0x49E6,
    -0x26AA, -0x69AC, -0x3CC5,  0x116D,  0x0F67, -0x149C, -0x7181,  0x1A34,
     0x7E9E,  0x16A3, -0x22C9, -0x57C5,  0x5A23, -0x399B,  0x16E6,  0x5405,
    -0x6749, -0x3DF5, -0x4C27, -0x182A,  0x3B40, -0x66A0, -0x4D64, -0x2279,
     0x7543, -0x5405, -0x0970, -0x5F6B,  0x02B7,  0x2324,  0x401F, -0x2909,
     0x4CBE,  0x4BB2,  0x2415,  0x622E, -0x2D46, -0x358B,  0x7E98, -0x7FE3,
     0x5749,  0x4A95, -0x04BE, -0x72E4,  0x569F, -0x0382,  0x17DC, -0x0D2F,
     0x35BE, -0x773C,  0x2937, -0x50BA, -0x38EC, -0x2475, -0x0C54,  0x13C2,
    -0x7608,  0x62F2,  0x36B5,  0x13E3,  0x2A87,  0x23FC, -0x36D0, -0x3287,
    -0x289C,  0x3C7A, -0x4644, -0x5D5D, -0x3328,  0x4E7A, -0x1447, -0x7759,
    -0x582F,  0x43B4, -0x3B96, -0x0EEB,  0x0547,  0x0175,  0x57B9, -0x205E,
    -0x1E83,  0x7B91, -0x6BE7, -0x61B5,  0x36A3, -0x502F,  0x040A, -0x65CE,
     0x6D60,  0x0168, -0x7F42, -0x183E,  0x08B3, -0x7E1F,  0x7563, -0x1D6D,
     0x15BF, -0x6BEB,  0x2986,  0x7E89, -0x1513, -0x7F62, -0x79E1, -0x4842,
    -0x6007,  0x5F4B, -0x164A, -0x5B5B, -0x2BA4, -0x07E7,  0x7933, -0x5011,
     0x3294, -0x05D7, -0x7E3A,  0x7CB8,  0x41D3,  0x2037,  0x4C74, -0x1A96,
    -0x0E76, -0x48EB,  0x0BC3, -0x5816,  0x7559,  0x07A3,  0x3F0E,  0x3281,
    -0x2324,  0x27CC,  0x25ED,  0x190A, -0x0A26, -0x4EFC, -0x54B7, -0x5524,
    -0x10A6, -0x1F41,  0x6690,  0x2EF9,  0x4A12, -0x758A,  0x0F82,  0x4AFD,
    -0x7E47, -0x765C,  0x0829,  0x054E,  0x02BE,  0x0341,  0x5E6C, -0x08F6,
    -0x1B27,  0x1A4D, -0x263E,  0x173D, -0x15FA,  0x7ECA, -0x7273, -0x4D31,
     0x4359,  0x69C2,  0x6D8D,  0x09BC, -0x6BCD,  0x77CD,  0x67FC,  0x0F05,
    -0x3C9E, -0x106C, -0x7839, -0x3316,  0x0F94, -0x182B, -0x679C, -0x1224,
    -0x1E49, -0x2E8F, -0x302D, -0x1348, -0x134D, -0x1112, -0x02C8,  0x6CBD,
     0x1004,  0x2402, -0x4166,  0x2CCA,  0x7CC0, -0x4663,  0x363E,  0x2852,
    -0x6395,  0x76F7, -0x33D7,  0x5CA0,  0x4B41, -0x54E8,  0x7141, -0x5334,
    -0x3AB0, -0x6698, -0x1C72,  0x70FE, -0x1A02, -0x3D46,  0x7D19,  0x2A69,
     0x226C, -0x5E9F,  0x0AF7, -0x2771, -0x2BCC,  0x3FBA,  0x17E4,  0x743C,
     0x3D17,  0x35C0,  0x5711,  0x15CC, -0x2404, -0x71E0,  0x7B85,  0x332F,
     0x75DA,  0x1148,  0x1EA7, -0x6BDA,  0x7B00,  0x6EFE,  0x2F64,  0x5C4F,
     0x1B3B, -0x3009,  0x607C, -0x3D9A, -0x519C,  0x54E6,  0x1969, -0x15B3,
    -0x2C37, -0x1364,  0x786D,  0x6557, -0x1707,  0x189C, -0x35C2, -0x2BB7,
     0x3271,  0x13B1,  0x10D1,  0x33AC,  0x58A8, -0x26F0,  0x0CCB,  0x44D3,
    -0x62FC, -0x6094,  0x4911, -0x58D8,  0x6222,  0x2495, -0x4B0B,  0x0E37,
     0x6B0C,  0x6A17,  0x2F8C,  0x1DFF,  0x66CB,  0x5C55, -0x4D64,  0x6AFD,
     0x40D7, -0x3356,  0x69B3,  0x2580, -0x4913,  0x6208,  0x5DD9, -0x194A,
    -0x4F3B, -0x1865,  0x2266,  0x1CFD, -0x21DC,  0x7BE9,  0x057C, -0x5C05,
     0x1DD8,  0x2CF8,  0x4296,  0x02ED,  0x1D0C,  0x78EF, -0x3F35, -0x3645,
    -0x2B7F,  0x27BE, -0x2DE1, -0x6BAD,  0x292D,  0x1D42,  0x7B81,  0x3CBB,
     0x70AF,  0x7E6D, -0x4918, -0x5F97,  0x2830, -0x3711,  0x490C, -0x64A2,
     0x781C,  0x41DE, -0x6ABC, -0x6181, -0x08BB,  0x59E2, -0x0EF9,  0x6EAE,
     0x3BDD,  0x695D,  0x0A89, -0x78D8, -0x5B28,  0x591A, -0x3F02, -0x5A62,
    -0x09D3, -0x5706,  0x15F8, -0x1166,  0x2F7A,  0x5F21, -0x6B95,  0x4894,
     0x2B82,  0x6724, -0x372D,  0x515A, -0x79EB, -0x4243,  0x30F2,  0x762C,
     0x47D3,  0x167A,  0x3ABE, -0x45E1, -0x34AD,  0x60EF, -0x381F, -0x68C0,
     0x7E2A, -0x5317, -0x4F9F, -0x7208, -0x31AD, -0x03DE, -0x3014, -0x2DD1,
    -0x138A,  0x73F9,  0x113F, -0x594B, -0x326C,  0x72A4,  0x0C31, -0x349D,
    -0x0D6E,  0x0E6A, -0x6A25, -0x5477,  0x7524,  0x785B, -0x1B93, -0x6CED,

    -0x2867, -0x40F7, -0x4CEE, -0x580C,  0x1E0B,  0x7FC0, -0x147C, -0x1AAF,
    -0x5891, -0x0F3C,  0x50BA, -0x1F17,  0x4E01, -0x24F4, -0x4BC8, -0x69B7
},

};

short x_c[NUM_INPUTS][2*N + 2*PAD];
short x_i[NUM_INPUTS][2*N + 2*PAD];
short x_sa[NUM_INPUTS][2*N + 2*PAD];

short y[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x5197, -0x08FF,  0x2F82, -0x11CE,  0x7753,  0x28B9, -0x22D4,  0x57CD,
     0x0838,  0x2337, -0x5FF1,  0x1317, -0x09E7, -0x08D1,  0x641F, -0x5EEB,

    -0x1E8D, -0x013F,  0x6F5B, -0x2FBB,  0x50A0, -0x5140,  0x306C, -0x0B33,
    -0x4B13, -0x290C,  0x1552, -0x3E0C, -0x4AE9, -0x4A23, -0x1A39,  0x4B53,
     0x399E, -0x7A87,  0x23B0, -0x51B2, -0x427E, -0x2575, -0x0EC3, -0x2CBB,
     0x68DF,  0x77DF, -0x07DF, -0x19ED,  0x69E6, -0x05E7, -0x248F, -0x1AC0,
     0x19BB, -0x0B8B, -0x5761, -0x267F,  0x60B5, -0x18E7, -0x2CE6,  0x38ED,
    -0x1C86, -0x5CA4,  0x330E, -0x1884,  0x7080, -0x706C, -0x7B3D,  0x6042,
     0x396F,  0x53E1, -0x10E1, -0x7F11,  0x4CE1,  0x667F,  0x1BC7,  0x7C0A,
    -0x30F8,  0x0512,  0x3A66,  0x7676, -0x7451,  0x0A77, -0x5E70,  0x37AE,
     0x321F,  0x2E94,  0x67C3, -0x69B9, -0x149A,  0x2BAE, -0x7DEB, -0x08CA,
    -0x5380,  0x43B9, -0x0F09,  0x7E51, -0x3426, -0x4CD5,  0x609C,  0x5994,
     0x62C0,  0x7FD6, -0x1C79, -0x4858, -0x12DC,  0x2F3A,  0x21B2, -0x1AD9,
    -0x4BB9, -0x1724, -0x6D27,  0x0929,  0x76CD,  0x7222,  0x3E6C,  0x0984,
    -0x2562, -0x66D6, -0x7D6D,  0x1460,  0x2A40,  0x7F21,  0x56E7,  0x4E79,
    -0x3802,  0x47A5, -0x62C8,  0x27B1, -0x1086, -0x4F64, -0x08FC, -0x2FA9,
     0x421F,  0x0A12, -0x65F9,  0x58BA, -0x750E,  0x1D98, -0x4E97, -0x0C8C,
     0x4D46,  0x65A5, -0x48E7, -0x2504, -0x5F34,  0x4472,  0x65BA,  0x5EF5,
    -0x3F70, -0x7523, -0x6241, -0x6B3E, -0x0DB9, -0x1131, -0x2AE4,  0x2FD4,
     0x2788, -0x1C68, -0x68DE, -0x06BC, -0x1E99,  0x59DB,  0x72F3,  0x7522,
    -0x1B15, -0x2396, -0x00E1,  0x2110,  0x27EA, -0x6149,  0x68DD, -0x1B6D,
    -0x7240, -0x1BCD, -0x1299,  0x1BB0, -0x2190,  0x5737, -0x090C, -0x30C0,
    -0x7261, -0x450D,  0x26DA, -0x7372, -0x4611, -0x762F, -0x0BB7,  0x60AF,
    -0x01BD, -0x0C1B,  0x4B2A,  0x7F1F, -0x7BA5, -0x3629, -0x575C,  0x0B1B,
    -0x2EA8, -0x402F,  0x49B7, -0x7FBE, -0x1866, -0x5B13, -0x2C7D,  0x49F4,
     0x2487, -0x0E5B,  0x08AB, -0x0C11,  0x62AE,  0x47C1,  0x0057, -0x7251,
    -0x1838,  0x494A,  0x5C5D, -0x56EC, -0x72DB,  0x64FC,  0x1402,  0x7FC2,
    -0x4414, -0x0847,  0x31EA, -0x443C, -0x6738,  0x5D7D,  0x1F97,  0x6DF1,
     0x0E6E,  0x6654, -0x04E8, -0x616A,  0x0989, -0x5731,  0x6854,  0x09D4,
     0x7E81,  0x417B,  0x6771,  0x7C51, -0x4452,  0x75DB, -0x431A,  0x5B99,
     0x745E, -0x45A0,  0x4BA3, -0x3532,  0x1F47, -0x631D,  0x03E4, -0x04F3,
     0x09D2,  0x1422, -0x2FE2,  0x2120, -0x432F, -0x4348,  0x088F, -0x761C,
     0x200A,  0x671F, -0x1810,  0x54FB, -0x16D1, -0x58D5, -0x7335,  0x603B,
    -0x3958, -0x5574, -0x0818, -0x38A6, -0x2C2F,  0x09CB, -0x6A9A, -0x6D9E,
    -0x29F7, -0x08B4, -0x3612,  0x0762, -0x46D8,  0x4FD4, -0x0272,  0x1DE0,
    -0x2D27,  0x1506, -0x4458, -0x6073,  0x684E, -0x3396,  0x4294,  0x63BB,
     0x05DE,  0x3F77,  0x2D53,  0x350F,  0x02FA,  0x230F, -0x6D15, -0x1F03,
    -0x1BF7,  0x2A0F,  0x31E3, -0x2487, -0x0957, -0x11AB,  0x1F61,  0x2279,
    -0x543D,  0x4DC5,  0x7C63, -0x565C,  0x4311, -0x5C27, -0x545E,  0x01D5,
     0x3B79,  0x6929, -0x6D71, -0x6A2D, -0x0833, -0x4189,  0x59F4,  0x15CD,
     0x3D6E,  0x4EBF,  0x37B7, -0x79E5, -0x13B5,  0x25C2, -0x45C7,  0x6FBA,
     0x7DC7, -0x1B6A,  0x1DDB, -0x4CF4, -0x3505, -0x2A48,  0x1E26, -0x71A6,
    -0x7025,  0x721A, -0x28F7,  0x3393,  0x45BD, -0x3D48,  0x24C8, -0x682D,
    -0x5742,  0x262B,  0x04FB, -0x28DF, -0x6372,  0x04BC, -0x78C1, -0x3205,
    -0x3EEC, -0x2488, -0x4008,  0x4215,  0x5A7A,  0x3ACA,  0x30BE,  0x4AE1,
    -0x0BE7,  0x1F10,  0x50EC,  0x405B,  0x51C4,  0x35B0, -0x7E38, -0x1073,
     0x1DF6,  0x7E39,  0x1AD0,  0x5A5B, -0x1FA4, -0x220B, -0x1554, -0x59F4,
    -0x44B6,  0x068A, -0x34C3, -0x4CE7,  0x6B87,  0x5812, -0x4CB6, -0x2F4C,
     0x0AFD,  0x113C, -0x34AC,  0x1A9D,  0x1ECF,  0x73E8,  0x0F0A,  0x00AA,
     0x6648,  0x48C6, -0x1429,  0x669A, -0x10CD,  0x4976,  0x671D, -0x0A59,
    -0x14F6, -0x1054,  0x5287,  0x0954, -0x2A6D,  0x27CF, -0x1001, -0x35FE,
     0x5151,  0x699D, -0x4E3A, -0x183C,  0x5260, -0x47B0,  0x712D,  0x75F3,
     0x0D2B,  0x02C3, -0x4F90,  0x7403,  0x2889,  0x6918,  0x5D2D,  0x7A1A,
    -0x4D4B, -0x0DA1, -0x6300,  0x02EB,  0x60AA,  0x12BD,  0x19C2, -0x1DB9,
    -0x729C, -0x5668,  0x58E6,  0x6001, -0x7C86, -0x24C0, -0x6E8C,  0x747E,
    -0x7A64,  0x5499, -0x74D3, -0x5467,  0x2078,  0x6748,  0x0248,  0x2C3D,
     0x3E76, -0x5C1E,  0x0F54,  0x6A3F, -0x7B24,  0x3895,  0x10BE, -0x0DFC,
     0x71D1, -0x2C21, -0x5D90, -0x1BA6, -0x3F3D,  0x56B6,  0x1016, -0x6FE4,
    -0x6B5B, -0x0B40, -0x2A7A, -0x4AED, -0x1B62,  0x3901, -0x653B, -0x1567,
    -0x4E77,  0x7090,  0x3B2D, -0x5783,  0x7DE0, -0x1036,  0x553A,  0x79A6,
    -0x747A, -0x2F79, -0x2B94, -0x3206,  0x5BED, -0x7D2C,  0x0AD9, -0x06FA,
    -0x05DA, -0x355C, -0x3A2B, -0x2E1E, -0x76B8, -0x5EF2, -0x0EC4,  0x6DDD,
    -0x713F, -0x7F7E,  0x3EE6, -0x6C99, -0x7100, -0x797A,  0x43AE,  0x49B7,
     0x6908,  0x0D6F, -0x4E59, -0x0042, -0x0CA1,  0x1E9F,  0x05EA, -0x0C33,
     0x62DB,  0x4AC0,  0x3D88,  0x2385, -0x0A27,  0x6F86,  0x191C,  0x7689,
     0x634E, -0x2895,  0x5B7F, -0x7B99, -0x6FC5,  0x43EE, -0x70E3,  0x7C51,

     0x0800,  0x5ED9, -0x2A99, -0x44FB, -0x44EB,  0x0BFE,  0x33F0,  0x7F89,
    -0x7E5F,  0x20FF, -0x1363,  0x4619, -0x1A92,  0x058F,  0x5B82,  0x49DD
},

};

short y_c[NUM_INPUTS][2*N + 2*PAD];
short y_i[NUM_INPUTS][2*N + 2*PAD];
short y_sa[NUM_INPUTS][2*N + 2*PAD];

short w[NUM_INPUTS][2*N + 2*PAD];
short w_sa[NUM_INPUTS][2*N + 2*PAD];

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

    for (j = 16, k = 1; j <= N; k++, fail = 0, j *= 2) {
        t_c = 0;
        t_i = 0;
#ifdef  _LITTLE_ENDIAN
        t_sa = 0;
#endif

        for (n = 31, m = 1; (j & (1 << n)) == 0; n--, m++)
            ;
        radix = m & 1 ? 2 : 4;

        /* -------------------------------------------------------------------- */
        /* Generate twiddle factors                                             */
        /* -------------------------------------------------------------------- */
        gen_twiddle_ifft16x16(&w[0][PAD], j);
        gen_twiddle_ifft16x16_sa(&w_sa[0][PAD], j);
        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_c, x, sizeof(x_c));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_sa));
        memcpy(y_c, y, sizeof(y_c));
        memcpy(y_i, y, sizeof(y_i));
        memcpy(y_sa, y, sizeof(y_sa));

        /* -------------------------------------------------------------------- */
        /*  Check the results arrays, and report any failures.                  */
        /* -------------------------------------------------------------------- */
        for(i = 0; i < NUM_INPUTS; i++) {
            t_c += time_c(i, j) - t_overhead;
            t_i += time_i(i, j) - t_overhead;
#ifdef  _LITTLE_ENDIAN 
            t_sa = time_sa(i, j) - t_overhead;
#endif
        }

        printf("DSP_ifft16x16\tIter#: %d\t", k);

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
clock_t time_c(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft16x16_cn(&w[cur_input][PAD], n, &x_c[cur_input][PAD], &y_c[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for intrinsic C version.               */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft16x16_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA   -- Measure elapsed time for SA version.                       */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft16x16(&w_sa[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_ifft16x16_d.c                                         */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft16x16_imre -- Driver file for fft16x16_imre                 */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_fft16x16  */
/*      _imre' kernel.  The function prototype appears below.  The driver  */
/*      itself is invoked as a standard C program, and results are         */
/*      reported on stdout. The driver will use a fixed test vector.       */
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

#include "DSP_fft16x16_imre_cn.h"
#include "DSP_fft16x16_imre.h"
#include "DSP_fft16x16_imre_i.h"
#include "gen_twiddle_fft16x16_imre.h"

/* ======================================================================== */
/*  Kernel-specific alignments                                              */
/* ======================================================================== */
#pragma DATA_ALIGN(w, 8);

#pragma DATA_ALIGN(x, 8);
#pragma DATA_ALIGN(x_cn, 8);
#pragma DATA_ALIGN(x_i, 8);
#pragma DATA_ALIGN(x_sa, 8);

#pragma DATA_ALIGN(y, 8);
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
    -0x4FB8,  0x7BF0,  0x0D47,  0x0D11,  0x305B,  0x73FB,  0x0585, -0x4FE2,
     0x7879, -0x55C9,  0x5739, -0x7AFF, -0x03DB, -0x5B14, -0x1F55,  0x2D1C,

    -0x6D09,  0x1B3D, -0x49A6,  0x2BEE, -0x00BB,  0x27DC,  0x4D08,  0x74BC,
     0x59B7, -0x3134, -0x5615, -0x5B7E, -0x59CB,  0x7D99,  0x107F,  0x559B,
     0x3EB8, -0x1F69, -0x3E8B,  0x1BB0,  0x7A7B, -0x5C61,  0x2F46, -0x5698,
     0x2110, -0x6A30,  0x48E7, -0x6BA9,  0x1FD3, -0x4B34,  0x381E,  0x44AE,
    -0x05C2, -0x6403,  0x37F5, -0x7ED3, -0x6B61, -0x2AAB, -0x272D,  0x2FD7,
    -0x514D, -0x68EF,  0x62B3, -0x5F1E, -0x5069,  0x5DFF, -0x5905,  0x1E71,
     0x34A7, -0x1540, -0x1988,  0x0A87, -0x1E4C,  0x3692,  0x34F6,  0x29BB,
    -0x09DF, -0x4BEB, -0x2204, -0x6DCC,  0x315F, -0x746D,  0x5C28, -0x3E9E,
     0x6B49,  0x234A,  0x48B0,  0x56F1,  0x7FE2, -0x54C9, -0x2C85, -0x1573,
    -0x060C, -0x0C22,  0x4164, -0x6429,  0x0012,  0x349A, -0x0BE6, -0x51DD,
     0x1475,  0x3BE8,  0x6B21, -0x1E86, -0x00BF,  0x7637, -0x2A8D, -0x27AF,
    -0x6258,  0x6EB3, -0x60B9,  0x3B8F, -0x2395,  0x1C9C, -0x708E, -0x13B3,
    -0x7BBE, -0x5570, -0x2312, -0x152D,  0x4AA2,  0x1662, -0x2CFF,  0x5960,
    -0x5E9F,  0x39EB,  0x7883,  0x2C2C, -0x2E40, -0x459F, -0x493A, -0x09D4,
    -0x27AB,  0x5BA8, -0x735D,  0x5C18, -0x74AD,  0x332B, -0x3DDF, -0x4ACF,
     0x7BB5,  0x4BB2, -0x5AC0,  0x444A,  0x24CB,  0x21BC,  0x4569, -0x606E,
    -0x2059, -0x742C, -0x4908, -0x4968,  0x18EA, -0x798D, -0x2094,  0x041E,
     0x4873,  0x65D1,  0x42B8,  0x621C,  0x3571, -0x16B6,  0x542F, -0x046B,
    -0x02B1, -0x474A, -0x3066, -0x0F63,  0x580D, -0x3FB5, -0x6918,  0x132E,
    -0x5093, -0x0489, -0x6CFF,  0x5334,  0x6D89,  0x1745,  0x1C3D,  0x4A5E,
     0x164A, -0x7944,  0x65F8,  0x6733, -0x53C7,  0x73C3,  0x6AC6,  0x4ADF,
    -0x31C5,  0x1A00, -0x142F, -0x41B5,  0x1FA8,  0x0243, -0x1B38, -0x250F,
     0x783F, -0x591C,  0x0B03, -0x3D0F,  0x5888, -0x0753, -0x23CC, -0x6618,
     0x1B09,  0x51C1, -0x66B7,  0x0608,  0x77E3,  0x4005, -0x1D1C, -0x0C12,
    -0x40B1, -0x3F7A,  0x44FE, -0x203F,  0x6780,  0x5A67,  0x531D,  0x5C09,
     0x515B, -0x6337, -0x3543,  0x38C9,  0x5D9C, -0x76C6,  0x2948, -0x3E9F,
    -0x402B,  0x5C1E,  0x643F, -0x4D58, -0x672E,  0x3AA4,  0x08F6,  0x45CB,
     0x58D6,  0x48AF,  0x767A, -0x1094,  0x6049, -0x5AB8, -0x6FE8,  0x3687,
     0x6C33, -0x3AF0,  0x7EFE,  0x368E,  0x4427, -0x44CE, -0x167D,  0x444E,
     0x2B0A, -0x25AA,  0x4492,  0x3E15, -0x63C6,  0x4B16, -0x6A55, -0x086C,
    -0x3C6A, -0x0790,  0x4816,  0x5003,  0x45E9,  0x68C1, -0x7E5E,  0x6C0E,
    -0x3EC9, -0x0247,  0x759D, -0x690A, -0x5C9D,  0x13D3,  0x4D56,  0x437C,
    -0x503D, -0x7B30,  0x09D1, -0x47F2, -0x21F7,  0x1DB0, -0x1BF0, -0x2054,
    -0x0AEB,  0x65AF, -0x3577, -0x4EE8,  0x6522,  0x56BD,  0x4531, -0x2840,
    -0x0B26,  0x7C00,  0x77B0, -0x1B11, -0x583B, -0x1230, -0x6ACE, -0x4C4A,
     0x6C9F, -0x494B,  0x6F5D,  0x7724,  0x170A,  0x1CEA,  0x6EE1, -0x21D2,
     0x1522,  0x54DC, -0x56CD, -0x161A,  0x6D75,  0x0D2D,  0x6EDF, -0x2092,
    -0x7D26,  0x72B7, -0x21FF, -0x17D8,  0x1EA8,  0x0010,  0x045E, -0x2E53,
     0x3ECE, -0x2FEF, -0x0662,  0x6B03,  0x234E, -0x4728, -0x7ADD,  0x1A94,
     0x2D9A, -0x252B, -0x35F7,  0x0462, -0x0CB3,  0x1A4D,  0x75BE,  0x6306,
     0x2AC7, -0x121B, -0x0F3B,  0x7FE5, -0x3AD1,  0x1BAE,  0x1B0E, -0x32D6,
    -0x19B1, -0x22D2,  0x0A7A, -0x4DF9,  0x0DD5, -0x1B13,  0x4BFB,  0x6AAC,
     0x0B73, -0x3DFF,  0x29D2, -0x687A,  0x3F63,  0x3B1F,  0x7C76, -0x0CBD,
    -0x6B39, -0x0559,  0x7A95, -0x59F6, -0x3691,  0x2836,  0x11B9, -0x3D82,
     0x747D,  0x7038,  0x3C0C,  0x6705,  0x586E, -0x2109, -0x123E,  0x06C4,
     0x70FB,  0x29B1, -0x1564,  0x4EE4,  0x5265, -0x1DD3,  0x3E13,  0x3C9A,
     0x419F,  0x044C, -0x565D, -0x3096, -0x662C,  0x7125, -0x6E4F, -0x1AD2,
    -0x0F2A, -0x38EB, -0x0065, -0x48A2, -0x771A,  0x2A5E,  0x1D60, -0x7FE7,
     0x7B65,  0x63BD, -0x458E, -0x3C91,  0x35DF, -0x0D7B,  0x5423, -0x4297,
    -0x5205,  0x7BB7,  0x2330,  0x7558, -0x1435,  0x1EA6, -0x4E07, -0x081E,
     0x45FC,  0x2E8A,  0x6ECD,  0x304B, -0x0F97, -0x285A, -0x3222, -0x1177,
     0x4D8F,  0x1D65,  0x6755, -0x746F,  0x7E5F, -0x3908, -0x5CFA, -0x4898,
    -0x3F0E, -0x5005,  0x6244, -0x168A,  0x08A3, -0x086C,  0x2C5C, -0x076A,
     0x6701, -0x606A,  0x6B25,  0x536C, -0x4BD5,  0x022A,  0x2441,  0x627A,
    -0x08F9, -0x4293, -0x4891, -0x748C,  0x1EDC,  0x719D,  0x218B,  0x6056,
     0x72CE, -0x08C5,  0x4CA6,  0x68BF,  0x55B8,  0x6BB6, -0x253E,  0x1707,
    -0x3B14, -0x5BEC, -0x054C,  0x679A,  0x1C4D, -0x6AE5, -0x3F62, -0x68EE,
    -0x59B0,  0x057E, -0x7B72, -0x756E,  0x675F,  0x3F88, -0x3A3B,  0x55E6,
    -0x47EE,  0x12C6,  0x100E,  0x68DA,  0x1DDB, -0x37C2,  0x6ECB, -0x1C9E,
    -0x197F,  0x7B94, -0x28EF, -0x750F,  0x1506,  0x49C3,  0x2670, -0x1A61,
     0x046F, -0x083B,  0x17D8, -0x0178,  0x57E6,  0x75CF, -0x38E3,  0x4AF1,
    -0x523D, -0x3A83,  0x3CA3,  0x30AA, -0x660C, -0x3776,  0x6CA2, -0x3ECD,
     0x6245,  0x7582,  0x5492,  0x0322,  0x010A, -0x1504, -0x7CCB,  0x7448,
    -0x1254, -0x0E32, -0x413F,  0x241D,  0x2291,  0x58C8,  0x18B1, -0x041B,

    -0x0414, -0x3D97,  0x18AA, -0x5AE8,  0x3DEC,  0x491E,  0x6513, -0x666C,
    -0x0138, -0x6785,  0x6EBE, -0x2C01, -0x41D2, -0x2609, -0x5BC6, -0x5502
},

};

short x_cn[NUM_INPUTS][2*N + 2*PAD];
short x_i[NUM_INPUTS][2*N + 2*PAD];
short x_sa[NUM_INPUTS][2*N + 2*PAD];

short y[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x4F9A,  0x13A8, -0x55BA,  0x4D98, -0x0200,  0x6B84,  0x1BE2,  0x646E,
    -0x799A, -0x3961,  0x4483,  0x5B25,  0x40D4,  0x56EA,  0x6EE7, -0x3566,

     0x1F28, -0x7B0A,  0x2D09, -0x78B1, -0x0FAF, -0x37CA,  0x2CBD, -0x1E5A,
     0x5A5F, -0x1FC1,  0x065F,  0x724A,  0x2703, -0x106D, -0x5FCC,  0x2A6D,
     0x55DF, -0x01A3, -0x7723, -0x13C8,  0x6348,  0x62C1, -0x218C,  0x5C06,
     0x6FDC, -0x70E6,  0x37C9,  0x4DD7, -0x7380, -0x3C35,  0x143B,  0x548C,
    -0x18C4,  0x2100,  0x50B8,  0x075F,  0x2F79, -0x5403,  0x1B5B,  0x5320,
    -0x43E0, -0x5C96, -0x06D6, -0x7952,  0x021C, -0x2EE4,  0x427A,  0x7234,
    -0x3848,  0x2CE3, -0x5096,  0x3EAA, -0x619E,  0x6ED8,  0x610D,  0x5810,
     0x234E,  0x03B1, -0x0958,  0x09ED, -0x7C85, -0x1878,  0x239A,  0x3694,
    -0x3A6B, -0x1B4C,  0x4A5E, -0x445C,  0x553E, -0x4BE6, -0x60CC, -0x06B9,
     0x5D34, -0x7385,  0x4BE8, -0x0645,  0x59DA, -0x78B1,  0x1C3A, -0x3A6C,
     0x779D,  0x7C96,  0x2E67,  0x5341,  0x39C2, -0x4DD2,  0x2754, -0x55AB,
    -0x24EF,  0x002E,  0x6CDB, -0x67F3,  0x01DC, -0x3045, -0x1D4C, -0x6266,
     0x27F4,  0x7CE0, -0x4E7A,  0x6FA8,  0x5BEF, -0x5614, -0x6F6F, -0x5253,
    -0x4BA5, -0x1434,  0x0E85,  0x2E6F,  0x164F,  0x61E4,  0x68E8,  0x7D58,
    -0x4C27, -0x5210,  0x62B2, -0x0D04, -0x222F, -0x299F, -0x5E89, -0x0692,
    -0x7374, -0x7544,  0x0FC1, -0x0B35,  0x3AF3,  0x4C7A, -0x3C01,  0x4E8F,
     0x7B70, -0x0316, -0x1760,  0x2321, -0x26B2,  0x5492,  0x36C1,  0x212E,
     0x77E7, -0x496D,  0x5F10, -0x05CE, -0x01BD, -0x0D72,  0x123B,  0x09D9,
     0x468C,  0x6786, -0x0B75, -0x6978,  0x4DEA,  0x074B,  0x2B25,  0x41BD,
    -0x17C2, -0x3723, -0x1AA4,  0x0FA5, -0x3AC1, -0x0BA9,  0x67B5, -0x5D8F,
     0x2B73, -0x202A,  0x20FF,  0x0FF2,  0x0191, -0x7A1D,  0x4416, -0x210C,
    -0x6A41, -0x781C,  0x6BC0, -0x5526, -0x4BCF,  0x15FE, -0x4FD3, -0x1105,
     0x79AA,  0x360B, -0x2366,  0x713C,  0x6D5E, -0x06FB,  0x1292, -0x2B8C,
     0x5FB7,  0x0875, -0x7EAD, -0x30F9, -0x6D89,  0x2561, -0x632F, -0x75B4,
    -0x6046,  0x0344,  0x55DC, -0x61D9, -0x5B9C,  0x1277, -0x2319,  0x3E75,
     0x3D5F, -0x6053,  0x6AEE, -0x0258, -0x47B7, -0x171F, -0x7900, -0x39D0,
     0x12FB, -0x73B3,  0x5DE8,  0x681E,  0x3B73, -0x1B1D, -0x7488,  0x598D,
     0x209E, -0x4241,  0x01F2,  0x1048, -0x0E7C, -0x00DD,  0x5E17, -0x76CA,
     0x3959, -0x5290,  0x5353,  0x71FD,  0x31E5, -0x2A62, -0x7273,  0x7374,
    -0x232A, -0x1C46, -0x5CEA,  0x2B4A,  0x6870, -0x3021, -0x75CA,  0x3E74,
     0x531D, -0x40CA,  0x09E5,  0x18DD, -0x299F, -0x7A8D, -0x42EC, -0x3230,
     0x13AA,  0x7F55,  0x1328, -0x5D53, -0x727A,  0x69A3, -0x2AF4, -0x47AD,
     0x5DB7, -0x7ACD, -0x4E9B,  0x5ED9, -0x4C58, -0x4F99,  0x5169, -0x7A02,
     0x1AC8, -0x214D,  0x68DA, -0x2027, -0x00C3,  0x739E,  0x5699,  0x1C52,
    -0x017F,  0x0CCD, -0x3F9F, -0x2F28,  0x7657,  0x1E84, -0x45DA, -0x7F2C,
    -0x1D54,  0x0B2D, -0x0E77,  0x4C64,  0x70CF,  0x0F66,  0x56FB, -0x382E,
     0x6A8D, -0x65FD, -0x290A,  0x7050, -0x2C4B, -0x7963, -0x6D21,  0x4F6E,
    -0x2192, -0x40E5,  0x1C01,  0x39DB, -0x6B02, -0x3B40,  0x3933,  0x38DE,
     0x4F6B, -0x6DCB, -0x536B, -0x67EA,  0x7375,  0x771C, -0x7D0C,  0x19F7,
    -0x0F7B,  0x4399,  0x614C, -0x3776,  0x01E5,  0x636A,  0x65F1, -0x0610,
    -0x4513,  0x5FEF, -0x0B30, -0x17E0, -0x287A,  0x42C5,  0x2754, -0x7C94,
     0x4B93,  0x5C53,  0x2A75, -0x2FBC,  0x1DB4, -0x0B1F,  0x2B57, -0x7D45,
     0x02F5,  0x5AAD,  0x471C,  0x2A4E,  0x42D3, -0x217F,  0x0048, -0x6A99,
     0x602B,  0x2F48, -0x46B1, -0x37D7,  0x0383, -0x65D5, -0x4E3D,  0x27F4,
    -0x55C8, -0x505A,  0x0A9F,  0x3C35, -0x5DF2, -0x2BDD,  0x5236, -0x5917,
    -0x3D68,  0x2F97,  0x1043, -0x518F,  0x6C13,  0x7C9C, -0x2B67, -0x03E9,
     0x4F0C,  0x4D91,  0x58F5, -0x081E,  0x7579,  0x2533,  0x1070,  0x441E,
     0x12A9, -0x02BC, -0x25EE, -0x0ECC, -0x6867, -0x4F5E,  0x1807, -0x3FCD,
    -0x72D8, -0x3890, -0x190A,  0x17A6, -0x4B51,  0x32B6, -0x3A0B,  0x1627,
    -0x1D8D,  0x5700,  0x549F,  0x552E,  0x3185,  0x1C88, -0x772E, -0x3E53,
    -0x148D,  0x3F58, -0x0E7C,  0x24DE, -0x4699, -0x5C0F,  0x793E, -0x331F,
    -0x5EE1, -0x010D,  0x33B9, -0x2173,  0x3C4B,  0x6642, -0x5AE7, -0x37F3,
    -0x4538,  0x4B35,  0x224B,  0x59B9,  0x2A42,  0x5439, -0x62FC,  0x02AF,
    -0x7B54, -0x647E, -0x7221, -0x464E, -0x06D8, -0x29CB,  0x4820, -0x013E,
     0x08C0, -0x1B6A,  0x7590, -0x7202, -0x2271,  0x36B3, -0x0FF8,  0x2A41,
     0x69BF, -0x55E8, -0x3FF3,  0x2000, -0x3211,  0x42FD, -0x6FE9, -0x2812,
    -0x7E87,  0x4475,  0x25F7,  0x18DC, -0x3EEC,  0x3B23,  0x66DD,  0x725B,
    -0x3C9F,  0x62EF,  0x5D7F,  0x46A0,  0x2ECD, -0x0BCC, -0x3C1D, -0x07D5,
     0x585D, -0x2805, -0x6EB9, -0x3E57, -0x3628,  0x3EAF,  0x16AB, -0x5163,
    -0x7F2F, -0x622C,  0x0C7C,  0x3C48, -0x7BED, -0x6FC2,  0x3DE6,  0x1D51,
     0x31EE,  0x1F4F,  0x2538, -0x6052, -0x2F19, -0x1456,  0x19FC,  0x404E,
    -0x0BBC, -0x410C,  0x751E, -0x23F8,  0x18FB,  0x020F,  0x54C3,  0x0645,
     0x078A, -0x64AB,  0x4238,  0x07EF, -0x7BE2, -0x5BA8,  0x7A83, -0x00E1,
    -0x444F, -0x655F,  0x2C18, -0x52F5, -0x098A,  0x60F0,  0x402E,  0x5BBA,

     0x1532, -0x4F82,  0x2432,  0x6EF6,  0x4CF0,  0x6EBC,  0x1AE2,  0x1EF8,
    -0x5667,  0x621B, -0x6C80, -0x2F9B, -0x2413, -0x2AB3,  0x05AA, -0x6803
},

};

short y_cn[NUM_INPUTS][2*N + 2*PAD];
short y_i[NUM_INPUTS][2*N + 2*PAD];
short y_sa[NUM_INPUTS][2*N + 2*PAD];

short w[NUM_INPUTS][2*N + 2*PAD];
short w_sa[NUM_INPUTS][2*N + 2*PAD];

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
    int i, j, k, n, m, radix, fail = 0;

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.   */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(j = 16, k = 1; j <= N; k++, j *= 2) {
        for (n = 31, m = 1; (j & (1 << n)) == 0; n--, m++)
            ;
        radix = m & 1 ? 2 : 4;

        /* -------------------------------------------------------------------- */
        /*  Generate twiddle factors for fft of size 'j'                        */
        /* -------------------------------------------------------------------- */
        gen_twiddle_fft16x16_imre(&w[0][PAD], j);
        gen_twiddle_fft16x16_imre_sa(&w_sa[0][PAD], j);
        
        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_cn, x, sizeof(x_cn));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_i));
        memcpy(y_cn, y, sizeof(y_cn));
        memcpy(y_i, y, sizeof(y_i));
        memcpy(y_sa, y, sizeof(y_i));

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

        printf("DSP_fft16x16_imre\tIter#: %d\t", k);

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
    DSP_fft16x16_imre_cn(&w[cur_input][PAD], n, &x_cn[cur_input][PAD], &y_cn[cur_input][PAD]);
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
    DSP_fft16x16_imre_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
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
    DSP_fft16x16_imre(&w_sa[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_fft16x16_imre_d.c                                     */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


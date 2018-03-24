/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_ifft16x16_imre -- Driver file for ifft16x16_imre               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'ifft16x16     */
/*      _imre' kernel.  The function prototype appears below.  The driver  */
/*      itself is invoked as a standard C program, and results are         */
/*      reported on stdout.                                                */
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

#include "DSP_ifft16x16_imre_cn.h"
#include "DSP_ifft16x16_imre.h"
#include "DSP_ifft16x16_imre_i.h"
#include "gen_twiddle_ifft16x16_imre.h"

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
     0x4DF4,  0x69AD,  0x2C4F, -0x1CA9,  0x7883,  0x73E9, -0x4491, -0x34C9,
     0x262A,  0x2EE7,  0x76A5, -0x3FDA, -0x654B, -0x72A5,  0x48C4,  0x0D2C,

    -0x0A7C,  0x364E, -0x2CAE,  0x64F2, -0x35CA, -0x5123, -0x6665,  0x6867,
     0x7D3C, -0x160C,  0x2BDE, -0x1F52, -0x1F38, -0x3F79, -0x24E0,  0x14CC,
    -0x6866, -0x332C,  0x751A, -0x396D, -0x35C8,  0x261C,  0x7ACF,  0x5254,
    -0x7303, -0x7498,  0x653D,  0x7FCA, -0x6974,  0x65C2,  0x6EB2,  0x5FD1,
    -0x45D7,  0x3C7E,  0x5B42, -0x17B0, -0x5693,  0x0AF6, -0x3423, -0x550C,
     0x70DB, -0x11AF, -0x6C79,  0x261D,  0x43DB, -0x2E3B, -0x6ED1,  0x5196,
     0x0D90,  0x66DD, -0x6D56, -0x4577,  0x3C16,  0x0F40, -0x48B2, -0x2CC6,
     0x6199,  0x2F75, -0x2556, -0x2009,  0x04D1,  0x5732, -0x7C19,  0x09D7,
     0x4C64, -0x2165, -0x2ABE,  0x1CB3, -0x1E63,  0x5F18,  0x0F2C,  0x5FDD,
    -0x63F0, -0x68EA,  0x0489,  0x1D21,  0x7197,  0x2D58,  0x2091,  0x477B,
     0x2D36, -0x26BA,  0x72D0, -0x36E4,  0x6859,  0x78B4,  0x33CB, -0x0ADD,
     0x49FB, -0x7F44,  0x60BF, -0x615F, -0x73D9,  0x5603, -0x36F3,  0x5456,
     0x475D,  0x1111,  0x35B7,  0x42B4, -0x05A5,  0x1B24, -0x0475,  0x3AA4,
     0x66C0,  0x3EFD, -0x5096,  0x5D86, -0x5EE9, -0x76C7,  0x4632, -0x1708,
    -0x0A42, -0x5159,  0x4FC1, -0x4F26,  0x0431,  0x311A, -0x6257, -0x47E9,
    -0x54CB,  0x0744,  0x0BF3,  0x6FAC,  0x3562,  0x1B0C, -0x4A70,  0x186F,
     0x4793,  0x30E7,  0x3DE7, -0x2DE6,  0x1AB2, -0x4F4A, -0x6901, -0x3BEA,
     0x7367, -0x2265, -0x2F2E, -0x0C7A, -0x18D5, -0x1DA5,  0x6B3F,  0x3914,
    -0x1FCF,  0x53B6, -0x4EE9, -0x1E01, -0x1C3E, -0x73B5, -0x6E30,  0x6DE9,
    -0x5997,  0x7372, -0x7FA2, -0x071A,  0x618A,  0x229E, -0x1B5F, -0x37AF,
    -0x1A2A, -0x043F,  0x7CFD,  0x7AD6,  0x021F, -0x6AD8,  0x5191,  0x5B4C,
    -0x5EEC,  0x1665, -0x4D72,  0x63C5,  0x3554,  0x76AE, -0x5AD3,  0x5565,
    -0x1B96,  0x1B45,  0x70CE, -0x7B8C, -0x07DB,  0x645F, -0x6752, -0x41C8,
     0x1BD3, -0x67FA, -0x0E3E, -0x27F5, -0x2E21, -0x4F77,  0x2536,  0x6935,
    -0x47B3, -0x6623,  0x4E0B,  0x1B05,  0x1296,  0x458F,  0x0E52,  0x31AB,
     0x0F69,  0x31A8, -0x5373, -0x5CAB,  0x5ACC, -0x33E1, -0x494D,  0x6D0B,
     0x761A,  0x3D42, -0x53B6,  0x76CD,  0x5065,  0x18A9,  0x2A31, -0x5890,
    -0x5B42,  0x6F1F,  0x1B7F, -0x5F3F, -0x5D2F, -0x32EA,  0x7008, -0x6A9C,
     0x5272, -0x6BE7, -0x22FD, -0x310D,  0x487D,  0x42BC,  0x1952,  0x4FE6,
     0x169F,  0x198F,  0x24E7,  0x22B3,  0x037E, -0x516A,  0x11CC, -0x394D,
    -0x773C, -0x2749, -0x27AF,  0x494A,  0x1685, -0x7347, -0x5630,  0x7DC9,
    -0x6374,  0x1834,  0x499E, -0x2663,  0x4F07,  0x450C, -0x126C,  0x7E2F,
     0x4414, -0x2413,  0x20BE, -0x20EA,  0x3EAF,  0x133E,  0x2DA9, -0x6D05,
     0x4F80,  0x6023, -0x742D, -0x4038, -0x48F5,  0x2CF8, -0x2D47, -0x446A,
    -0x763D, -0x1135, -0x50F4,  0x45D7, -0x6B86,  0x295B,  0x6883, -0x18B8,
     0x17B4, -0x28E4,  0x55CB, -0x01E3, -0x4EA5, -0x5451, -0x0EE2, -0x1709,
     0x1B56, -0x3A93, -0x2407, -0x2EEF,  0x2A7C,  0x435E,  0x7273, -0x51CD,
    -0x7094,  0x3D47,  0x62AF, -0x2A15, -0x203A, -0x63D9, -0x3B03, -0x4286,
     0x6642,  0x66BF,  0x3E0B,  0x660F,  0x302C, -0x2169, -0x5B39, -0x1D44,
    -0x1442,  0x1408, -0x5AAC, -0x7D51, -0x0325,  0x57BE, -0x0356,  0x2E27,
     0x63AF,  0x0C49, -0x60AB,  0x5AB2, -0x1D59,  0x6523,  0x7CCE,  0x2A27,
    -0x18A8, -0x7545,  0x34FE,  0x2EDD, -0x4048, -0x6800,  0x6161,  0x50B0,
    -0x78BD,  0x0FF4, -0x24BF,  0x5F36,  0x6D7A,  0x1EB2, -0x7662, -0x3D3D,
    -0x57B6,  0x5F86,  0x2C2E, -0x3256, -0x3B35,  0x6774, -0x40FB,  0x4037,
    -0x5B17, -0x302F, -0x34AA,  0x68F6, -0x2797,  0x0E50,  0x4EDE,  0x63B8,
    -0x5734, -0x35E6, -0x639A,  0x0DCE,  0x779F,  0x005D, -0x320F,  0x0F16,
    -0x2A65, -0x651C,  0x2D04, -0x69C3, -0x14CA, -0x1CD3,  0x2F8D,  0x2DC6,
    -0x62F6,  0x6A80,  0x6AF2,  0x3A52, -0x075F, -0x4277,  0x15BC, -0x5B56,
     0x6426, -0x6B15, -0x749A,  0x1C04,  0x1A6C, -0x249C,  0x57CA, -0x73EB,
     0x5FE5,  0x23DE,  0x40B0,  0x2957,  0x06EB, -0x06ED, -0x2500, -0x55EA,
    -0x4C0C, -0x60D9,  0x2511,  0x29C2,  0x6826, -0x543C, -0x6162,  0x22FA,
    -0x2B3C,  0x0F3E,  0x6EDB,  0x1CDA, -0x1AF7,  0x0031,  0x0723,  0x7411,
     0x25D7,  0x441F, -0x282D, -0x31D0,  0x55D3,  0x6B99,  0x74C0, -0x5245,
    -0x2AAC,  0x605B, -0x2A33, -0x5180,  0x48C2, -0x120B,  0x0C21, -0x1958,
     0x02CC, -0x6490,  0x0386, -0x17F0, -0x3FFC,  0x7A71, -0x369F, -0x0CA1,
     0x1754,  0x4C62, -0x2D35, -0x45A3,  0x36E1, -0x62E4, -0x32AF,  0x5F09,
     0x66C7,  0x318E,  0x77CF,  0x09F9, -0x2CD0,  0x66E6, -0x0F10, -0x5C90,
     0x125D, -0x0C3F,  0x1ECD,  0x3FBB, -0x0A03, -0x732F, -0x73D2, -0x62B4,
     0x2276, -0x0E70,  0x55E9,  0x5C1C, -0x1581, -0x2898, -0x701A,  0x46C5,
    -0x1458,  0x45EA, -0x41BA,  0x4FE4, -0x0DC1, -0x3989, -0x35DF, -0x54C6,
    -0x58F0,  0x0DF5, -0x0292, -0x6FF3,  0x7B8E,  0x7601, -0x7E73,  0x2049,
     0x5ADA, -0x0FE2, -0x1816, -0x0D17, -0x5AD5, -0x358E,  0x3645, -0x3FEC,
    -0x11E9, -0x188E, -0x0BE0, -0x3F77, -0x03C6, -0x2CE3, -0x403A,  0x1BC5,
    -0x6C3B,  0x4333, -0x1789,  0x0F67,  0x7E6A,  0x74EC, -0x6FCD,  0x315A,

     0x6023, -0x0B50, -0x3453,  0x5943, -0x2F98,  0x4D57,  0x4BD2, -0x535A,
     0x2F39,  0x155C,  0x0F7D,  0x5354, -0x3572, -0x1D61, -0x6D38,  0x5299
},

};

short x_c[NUM_INPUTS][2*N + 2*PAD];
short x_i[NUM_INPUTS][2*N + 2*PAD];
short x_sa[NUM_INPUTS][2*N + 2*PAD];

short y[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
    -0x4056, -0x55E1,  0x0879,  0x05A6,  0x2ACC, -0x00C4,  0x141B, -0x3E3A,
     0x11C3, -0x4D0D, -0x6CD7,  0x1EC5, -0x6322,  0x629D, -0x2314,  0x622A,

     0x0AC6,  0x65B5,  0x0E69, -0x6F5F, -0x0A4F, -0x5EEA, -0x1E06, -0x5CCD,
     0x517B, -0x3FC0,  0x7E08,  0x64B5, -0x4AE5,  0x531A, -0x29A3,  0x6F03,
     0x6BFE,  0x4DBC,  0x05A5, -0x2C92, -0x3D3E,  0x74B1,  0x3783, -0x1E07,
     0x21CC,  0x273F, -0x7030, -0x6532,  0x6B4B,  0x122E, -0x648C,  0x4277,
     0x1A11,  0x4497, -0x3D9B, -0x67A8, -0x5731,  0x2C26,  0x4248,  0x38E8,
    -0x44C8, -0x0695,  0x2A2C, -0x63D0, -0x6B82, -0x1F5C, -0x1D12,  0x4505,
     0x47B7, -0x3876, -0x5148, -0x7A79,  0x3299, -0x2E5F, -0x43DC,  0x785E,
     0x4022,  0x5B86,  0x3A81, -0x6BC5,  0x6998, -0x3344, -0x1A4A,  0x6B1B,
     0x0271, -0x247B, -0x4FB7,  0x05C5,  0x459A, -0x50D5, -0x26FF,  0x710B,
    -0x5868,  0x6A5D,  0x19B4, -0x19AA,  0x7316, -0x6A08,  0x48AB,  0x18E1,
     0x234C, -0x0C1A,  0x122B,  0x2D45,  0x05C8,  0x3870,  0x28A4, -0x2841,
    -0x5BE8,  0x2A94,  0x7CF7,  0x13B4,  0x6FDC, -0x6420,  0x0265,  0x0BFD,
     0x31A9, -0x27B7,  0x6D9F, -0x598F, -0x3B9F, -0x0F79, -0x7E91,  0x2C2D,
    -0x73A5,  0x646E,  0x5A8B, -0x5BDE,  0x3AF6, -0x3F32,  0x4305,  0x4461,
     0x4D08, -0x6CB6, -0x7224, -0x6D57, -0x1C4B,  0x52BC, -0x16D1, -0x594C,
     0x4319, -0x686D, -0x2F71,  0x11CA, -0x4B9B,  0x52B1,  0x63F5, -0x16F2,
     0x15CE,  0x524D,  0x5CD8,  0x7913, -0x4219, -0x45AA,  0x7FE0,  0x1A2B,
     0x1FD4, -0x2329,  0x0DC2, -0x5402, -0x511C, -0x0A27, -0x404B,  0x36DF,
    -0x6EF4,  0x504A, -0x36F3,  0x2E5E, -0x6F43,  0x4C61,  0x5E76, -0x1E5F,
    -0x2E60, -0x33F9,  0x394D, -0x7E02, -0x334C, -0x7740, -0x5560,  0x5D4E,
     0x174A, -0x3F6D, -0x50B9, -0x4974,  0x6362, -0x238E, -0x765A, -0x3DD2,
     0x4FE9,  0x6DAA,  0x5C8D,  0x49BF,  0x735E,  0x0ECC,  0x51B5,  0x733F,
     0x374C, -0x4C67, -0x429C,  0x33BB, -0x0FCF, -0x268B, -0x2E53, -0x264B,
    -0x43C1,  0x16D1,  0x49D8,  0x48B9, -0x5580, -0x67E3, -0x5B9E,  0x56C6,
    -0x6124,  0x02BB,  0x6123, -0x3615, -0x7784,  0x2E70, -0x40E7, -0x7F53,
     0x4D17,  0x57D6, -0x7DB9,  0x3DA7,  0x0892,  0x2A52,  0x3F46, -0x6A0F,
     0x0590,  0x3006, -0x5216, -0x7739,  0x0056,  0x314D,  0x7A8D,  0x36EC,
     0x339B, -0x19D2,  0x217B,  0x4354, -0x644E, -0x5BAE,  0x4EFE,  0x598E,
     0x1095,  0x5B03,  0x3F8B,  0x526B, -0x67AA, -0x775D, -0x4F6E, -0x7996,
    -0x7C93, -0x7FD9, -0x3C95, -0x419D, -0x339A, -0x53ED,  0x7AEB,  0x4BF4,
     0x3E74,  0x1D7B,  0x2B0F, -0x38CF, -0x209B,  0x117A,  0x7D53, -0x0CF2,
     0x1F6F, -0x2949,  0x6D26,  0x4113,  0x4C69, -0x6D9A, -0x3006,  0x7FCA,
    -0x3223,  0x7642, -0x1E82,  0x2873, -0x5F7E, -0x34E8,  0x5771, -0x248D,
    -0x6472,  0x7243,  0x749D,  0x770C, -0x0690,  0x3EB6, -0x5D94,  0x59D1,
    -0x5C95, -0x4A02,  0x15A5,  0x4256, -0x3974, -0x423A, -0x103F,  0x63B0,
     0x2988, -0x5D9C,  0x676C,  0x0A25, -0x380A,  0x10DC,  0x7DA0,  0x77A9,
     0x366F,  0x60ED, -0x5420,  0x5694,  0x4808, -0x2267,  0x1E19,  0x5B22,
     0x7CB3,  0x5DB0, -0x0A5F, -0x75D6, -0x5801, -0x3124,  0x03D7, -0x6764,
     0x72B9,  0x1AB2, -0x671E, -0x01C0,  0x0DEC, -0x04C6, -0x33E5,  0x2B33,
    -0x4A38,  0x2E84, -0x297A,  0x57A7,  0x71E2, -0x734B, -0x2401, -0x7B9A,
    -0x5AA5, -0x71EA, -0x2F84,  0x1B90, -0x289C, -0x5852, -0x250D, -0x48E0,
     0x48A8,  0x17CC, -0x4C9D, -0x7451, -0x34EE, -0x6EDE, -0x6985, -0x0907,
     0x6477,  0x53D7,  0x2C63, -0x485C,  0x289B,  0x191C,  0x042B,  0x48C3,
    -0x1ADA, -0x7F38,  0x0F4F, -0x245E,  0x10E7,  0x3F6B, -0x6617, -0x7FB6,
     0x7503, -0x2796,  0x50FE, -0x0FAF,  0x2F86,  0x1A99, -0x2F96,  0x755D,
     0x60CE,  0x19D6,  0x2BF0, -0x7908,  0x3860, -0x00DD,  0x02ED,  0x7816,
    -0x4C6D,  0x4AC8, -0x68D9, -0x211C, -0x565C, -0x1514,  0x703F,  0x0B5B,
    -0x6653, -0x3AC7, -0x0BB8,  0x3A09, -0x3C0C,  0x24F7, -0x6B0A, -0x2557,
    -0x03E1,  0x7D32, -0x0708,  0x7EEF, -0x2F2F,  0x2A5A, -0x4F13, -0x0DE5,
     0x641A, -0x7C1C, -0x1A85, -0x032E, -0x61AF, -0x298C, -0x64F9,  0x37AC,
     0x14CF, -0x2E03, -0x106F, -0x68F2,  0x3F05, -0x3B98, -0x28D5,  0x1ABE,
     0x6E7C,  0x513E, -0x0C6A,  0x10BF,  0x0A2C, -0x0432, -0x277F, -0x6A1C,
    -0x7043,  0x2055,  0x63E0, -0x5A52, -0x26E0, -0x2D55, -0x680E,  0x5EE5,
     0x2D15,  0x1AED,  0x755B, -0x1C8D, -0x77FC,  0x1AA8,  0x64E6,  0x6003,
    -0x463E, -0x61F7, -0x6C97, -0x4125, -0x494F, -0x7A77, -0x11BD,  0x7180,
    -0x413A, -0x6566,  0x0A02, -0x1170, -0x4017,  0x4BDF, -0x6357,  0x4A68,
     0x7E3B, -0x35AD, -0x07F0,  0x7C00,  0x04BF,  0x1104,  0x12F0, -0x3F6D,
    -0x2A24,  0x48C0, -0x7FF5, -0x5B81,  0x6349,  0x154E,  0x09EC,  0x38ED,
     0x52D5,  0x4D9E,  0x32DC, -0x1B4D, -0x0871, -0x707C,  0x5763,  0x60FE,
    -0x602D,  0x3D6D, -0x3E06,  0x5737,  0x1DB5,  0x5E98,  0x4552,  0x28AD,
     0x194F, -0x16B3, -0x133A,  0x4E7F, -0x5592, -0x1366,  0x1966, -0x0CB8,
    -0x4EDF,  0x1C0D, -0x4AD6,  0x2105,  0x75A8,  0x52F0, -0x1841,  0x18CA,
     0x0D48,  0x5E86, -0x3786,  0x4DA8,  0x0B79, -0x3634, -0x5E15, -0x709E,
    -0x1803, -0x03CF,  0x2F8E, -0x36A8, -0x47AF,  0x47E1,  0x6625, -0x0EC8,

    -0x55FF,  0x51FB,  0x4125, -0x650A, -0x3F9C,  0x6C5B,  0x11D4, -0x578B,
     0x5429,  0x4C5B, -0x2E83, -0x507E, -0x1DA6, -0x58EA,  0x0748,  0x6D85
},

};

short y_c[NUM_INPUTS][2*N + 2*PAD];
short y_i[NUM_INPUTS][2*N + 2*PAD];
short y_sa[NUM_INPUTS][2*N + 2*PAD];

short w[NUM_INPUTS][2*N + 2*PAD];

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
        /* Generate twiddle factors                                             */
        /* -------------------------------------------------------------------- */
        gen_twiddle_ifft16x16_imre(&w[0][PAD], j);

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
            t_c = time_c(i, j) - t_overhead;
            t_i = time_i(i, j) - t_overhead;
#ifdef  _LITTLE_ENDIAN 
            t_sa = time_sa(i, j) - t_overhead;
#endif
        }

        printf("DSP_ifft16x16_imre\tIter#: %d\t", k);

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
    DSP_ifft16x16_imre_cn(&w[cur_input][PAD], n, &x_c[cur_input][PAD], &y_c[cur_input][PAD]);
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
    DSP_ifft16x16_imre_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
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
    DSP_ifft16x16_imre(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_ifft16x16_imre_d.c                                    */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


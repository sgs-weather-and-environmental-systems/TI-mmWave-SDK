/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft32x32s_d.c -- Driver file for DSP_fft32x32s                 */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_fft32x32s'*/
/*      kernel.  The function prototype appears below.  The driver itself  */
/*      is invoked as a standard C program, and results are reported on    */
/*      stdout. The driver will use a fixed test vector.                   */
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

#include "DSP_fft32x32s_cn.h"
#include "DSP_fft32x32s.h"
#include "DSP_fft32x32s_i.h"
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
int w_new[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
    -0x18CA1BF6,  0x5F415BC8, -0x34223A06, -0x37173611,
     0x48D58CAE, -0x7DC7D2E5, -0x02970BC3, -0x36CE025B,
     0x0957D19A,  0x458DA7EC, -0x000CFADD,  0x04B017FD,
    -0x2DE8AAEE,  0x5AFD00C6, -0x26CE5C59,  0x73E9EAB4,

     0x6DC12B0D, -0x61A99E05, -0x460238A4, -0x610D2210,
    -0x4C8B90C5, -0x6151D0D4,  0x73EA60FF,  0x7A979767,
     0x3ECCA94E, -0x7E6F3CC6,  0x0BE50D9D, -0x09419CC4,
     0x60477616, -0x2C4EEDD8, -0x44809E42, -0x51754600,
    -0x176FF823, -0x465343A3,  0x08553214,  0x3DC37A5A,
     0x1C2AE88E,  0x0A2D0ED2,  0x531E7B3F, -0x4503B026,
    -0x7B086BD6, -0x36CC9254,  0x76D3470D, -0x2B073C8A,
    -0x08D6A703, -0x763E5147, -0x2183D636,  0x18D67F2F,
     0x6B080329,  0x339BDF5F, -0x49DE41E7, -0x2283C7A1,
     0x0E2AE0EA, -0x4E820698, -0x75AD392A,  0x4CBBC931,
     0x1F767E30,  0x005AFF43, -0x0524BF85,  0x17C2F7BC,
     0x0D9FCDFC,  0x26160E24, -0x17E9E969,  0x54476A54,
     0x626EF609, -0x75BE296B, -0x4CA92736, -0x0C09B58B,
    -0x168968C8,  0x375BFFEC, -0x0D00FE3A,  0x679D0CE2,
    -0x62594AB1,  0x7E0E0127,  0x3BB94DDF, -0x165E0E98,
    -0x1DBFF18A, -0x7C0F1B46,  0x634296A4, -0x17D75736,
     0x79AB2E05,  0x27456DBD, -0x329A3807,  0x1590AA58,
    -0x3C5730E8, -0x1EBFC4FB,  0x3D8F4F47, -0x605E4B50,
    -0x3E91F093, -0x0CBAB153, -0x53764FD9,  0x0AFDFB20,
     0x601CEE06, -0x764D8282, -0x5E3071DE,  0x305A883D,
    -0x7CEA6AE0,  0x3C9F59C4, -0x68F72B0F, -0x170DC1E4,
     0x56BBF0E3,  0x7A26FA11, -0x25DC9E34, -0x303FF04E,
     0x6A071669,  0x51AB3E60,  0x7892C43E, -0x470E1C1E,
     0x0A86F786,  0x21A3F027, -0x54DB7CF9,  0x3E22A6B2,
     0x6339DCDB, -0x489F9F2D,  0x5105747F,  0x01D8022B,
    -0x1831CA4C,  0x4155E526, -0x1EA262F4, -0x0145B1A5,
     0x79C12E2B, -0x499630FA,  0x6D0C2216, -0x63F3E0F6,
    -0x202065EA,  0x18BD412F,  0x220DC50E, -0x3612EF72,
    -0x0A5F5BBC,  0x1F7C8054, -0x30069005, -0x2E27CDAC,
     0x2AF2CD73, -0x36D5D9E0, -0x07D9BAF7,  0x49DAA884,
    -0x422D455C,  0x51F0C9AD, -0x1E153554, -0x55E40AA6,
     0x44585326,  0x046F8AD5,  0x298595C4,  0x0E19709E,
    -0x0B665E0B, -0x7B6DE908,  0x6320084E, -0x72D59531,
     0x2FED09DA, -0x15246E5B,  0x3C78A11C, -0x373D7B8F,
    -0x27ECB422,  0x4DBDE9AF, -0x645DB3E9,  0x11F5A702,
    -0x123F2E83,  0x346B2427,  0x50774B8C, -0x4245CCE2,
    -0x1DFF39DC,  0x65B00BC4, -0x3CE5DA06,  0x1772DA47,
     0x4606837D, -0x60BC32D1,  0x282627F6,  0x7D2FA1DB,
     0x27D3C2FC, -0x4ADCF544, -0x450B1176,  0x1E3E97AB,
    -0x3DB9DFC2, -0x6F9831F3,  0x798E81A9, -0x21974C3B,
    -0x0CFB9359, -0x68E00BEB, -0x0E468ADB, -0x1F799E1F,
    -0x1435BD2C, -0x065583EE,  0x7EA29EAD,  0x32C43BF5,
    -0x526687B7,  0x60134BE2, -0x614E2BA4,  0x242F7178,
    -0x34B62F09, -0x7A1428B5, -0x3D08C4B9, -0x43FCA336,
    -0x0E098502,  0x2A2A42AB,  0x26C19C9D, -0x27C73EBB,
    -0x542816BF, -0x02769C79,  0x31C84FC5,  0x6ACF397B,
    -0x091292C6, -0x281CC96E, -0x2E79D3EB,  0x67635217,
     0x14171CA2, -0x11E8BD70,  0x692D0C82, -0x34832815,
     0x26098D59,  0x5AE665AD, -0x4948A61E,  0x511BBDA5,
     0x0BA1D71A, -0x6DA8704D,  0x47A22434,  0x45144EB2,
     0x031F657C,  0x3D19EAAD, -0x123DB08E,  0x019AF2C1,
    -0x6945EA4F, -0x08950D88, -0x4642BD93, -0x7065D28A,
     0x441C209F,  0x6CF9F5B6, -0x045851D0, -0x17B1B63B,
     0x753B55B0,  0x674E81AB, -0x37CB2A94,  0x66932774,
     0x33131BF5,  0x382F4488, -0x7BE31094, -0x317C38B9,
     0x24C2C616,  0x0C8BD197, -0x10ECF5E5, -0x793608AC,
     0x4E88B47C, -0x5F9B2328,  0x3AE80683,  0x6E43AC04,
     0x1A20BB55, -0x23CCAA7C, -0x5DBEEE9E, -0x1FAC70C8,
     0x250460D5, -0x28A4FC0A,  0x0B803E45,  0x4E833517,
     0x4A075E47, -0x43EE0981,  0x243C9CA7,  0x10DC7E0C,
     0x7CDEF861,  0x10477AA8, -0x6F169E5F, -0x2F7A549C,
    -0x20056499, -0x16DE15AD, -0x6EE85E66,  0x19269A18,
    -0x58B0B56B,  0x7D5EF44F, -0x422BEC76, -0x6D7F52B8,
     0x3D77584B, -0x5FB63033,  0x32B55E3C,  0x57D4E8CF,
     0x2AB8EF92, -0x604F2DBD, -0x2C0686DE, -0x027B4C71,
     0x416AE459,  0x054D063A,  0x094F9629, -0x488E3623,
    -0x66C5A7FD, -0x39BFE688, -0x7641E9E0,  0x22A4DC9D,
    -0x40275940,  0x49034829, -0x5FD3ECE2,  0x33B05E7D,
    -0x4783E1D4, -0x21A550A6, -0x7EF41287, -0x30A6051C,
     0x41D010B4,  0x12CF856C,  0x1BA16AC1, -0x7C06C8FE,
    -0x274165B5,  0x7125CFEE, -0x0B8E1CB8, -0x19D52E70,
     0x0797D1E2,  0x2354F656, -0x79B10453,  0x192B36AF,
     0x7725AD2C, -0x0B8135CC, -0x5B7E9C08, -0x0A6F5185,
     0x47164629,  0x416D7C3C,  0x629F30B7,  0x55A6BDC0,
     0x234BDAFF,  0x470BF8C7,  0x067138AB,  0x0C22235A,
    -0x5576D66C,  0x5C623835,  0x77890177, -0x0172E942,
    -0x6EF46D89, -0x7A6A0745, -0x460C4921, -0x270DE4D1,
     0x0E708691, -0x06A09CE5, -0x1B784BF2, -0x07B1E4EE,
     0x0692C61C,  0x049823C1,  0x2E5B185E, -0x0CC3E407,
    -0x7B461597, -0x2CD49833,  0x6ADAE134,  0x3F6A22CD,
    -0x1053451A, -0x60DFB37D, -0x6307E1A3, -0x7AB72E5B,
    -0x72D12D08, -0x3AE5C456,  0x0107AC7A,  0x187A23C2,
    -0x3CAEEBEB,  0x3DDCB348,  0x2CB2F6ED,  0x108FDB3B,
    -0x61D59D57, -0x09B405AA, -0x5F6DB029, -0x738CDD33,
     0x21732F48, -0x658ABD2F,  0x6DEB549C, -0x6CD930AC,
    -0x2581AE59,  0x3716BBBA,  0x5503D66D,  0x2231DB6D,
     0x3412ACD8,  0x4B22077D, -0x0361249E, -0x27A0783C,
     0x16A61D5C, -0x4B3652BF, -0x72E2DE6D, -0x31C75776,
     0x4981426E,  0x0782E8A3,  0x79B9BAC7,  0x0FB4A78F,
     0x16347C26, -0x2E6890A6, -0x589DD8E3,  0x33BEAB8D,
    -0x47032E25,  0x30AFA33C, -0x4A4070B4, -0x591694EA,
     0x0A800B51,  0x5DD8AB3A, -0x3F32891E,  0x10F139AD,
    -0x018C4ECE, -0x6A68FE47,  0x22A38813,  0x5F75AC8A,
     0x5395424C, -0x128A1426, -0x382D0C76, -0x01857E7F,
     0x1C97471E, -0x7E70A8D7,  0x7DEAC3C8, -0x58D7D767,
     0x7D5FA626, -0x705A49C8, -0x35612272,  0x644877CB,
     0x392BD17D, -0x06D2CA65, -0x39F70E37,  0x2D0E1263,
     0x7F1B3541, -0x581D1629, -0x7E6EF177, -0x4E6C036E,
     0x7E927C37,  0x4C5B68B6,  0x67FA358B, -0x43632A5B,
     0x3D041D4F,  0x1C1D4E80,  0x27027EB9, -0x30DFB899,
     0x399BB455, -0x294FCF5D, -0x56D2B7B8,  0x4F0E1F2C,
     0x4741AB87, -0x3FC887BF,  0x7E36FECC, -0x1E2F6F00,
     0x3A90B25B,  0x0504B828,  0x5F93DAE4,  0x69162C86,
    -0x2CEA83E1, -0x0C4B2451,  0x27A642E5,  0x305CFAFE,
     0x708652DD, -0x5AB92EFA, -0x25F7D0EB, -0x5247B310,
     0x034AED04, -0x7249DD9C,  0x2D781BE7,  0x6F62B506,
    -0x3214DEA1,  0x6596ECA2,  0x14EB06CB, -0x49835078,
     0x61E3D1D2,  0x052ED0C1, -0x2AC20305,  0x27A7710B,
     0x6450B163, -0x6169B027,  0x2001B7DB,  0x2BCA6EBD,
    -0x61F8A4F6, -0x26A9EE12, -0x530A44A5,  0x73A304E3,
    -0x3B80D836,  0x5C04962D, -0x246D6B1B,  0x1C96D4FE,
    -0x6ECEA870,  0x3366D919, -0x23BA6FAA, -0x04C0B1EC,
    -0x623DF19B, -0x5E6F9DE6, -0x243C7185, -0x6EBC1B55,
     0x7B9F955C, -0x2E75C407, -0x4D02A664,  0x22E36AE5,
    -0x638C962C, -0x0D0FA240, -0x62C4EF73,  0x6BCE2847,
     0x7DFE9D79,  0x2F18028A,  0x75D119C6, -0x7847ED52,
    -0x7431FC66,  0x19376ABA, -0x0C03DAF3,  0x722FB6E5,
     0x605BA239, -0x16F876ED,  0x7259BC1C, -0x4ACFB495,
    -0x4F02FF8B,  0x316E2446, -0x477C2625, -0x4DFE8525,
    -0x70B25053,  0x68A6D95F,  0x4A4F149E,  0x1ECA4C87,
     0x6D62B0F9, -0x16986A5F, -0x44D72715,  0x136BC3B0,
     0x5C691B61, -0x396E03BC, -0x79F0DEB2,  0x521AA9F2,
     0x1E2C9D67,  0x0FD532A8, -0x1046AF52,  0x2941044F,
     0x76EB3B51, -0x0B1A62A0,  0x615289B6,  0x7612BC6C,
     0x3A23E2C4,  0x539F0FB9, -0x24A4EA45,  0x556FE874,
    -0x4E57B0DE,  0x25BCDB1A, -0x25CF9E4D, -0x077EB1E5,
    -0x4F4C4ACC,  0x537D5CD4,  0x4BA7FDB3,  0x159D915E,
     0x003ABB9B,  0x71DE65E0,  0x025A2C78, -0x731E7EAB,

    -0x77C0C073, -0x2138E007,  0x39088672, -0x60E8D83F,
    -0x469191A5, -0x3D442B55, -0x7262E322,  0x5F58F5B5,
    -0x3C5459C8,  0x7E8F2AC7,  0x0659B56C, -0x4B105D0D,
     0x0EF59ED5, -0x0A62BB42, -0x5F646F1B, -0x7000C697
},

};

int x[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x7730673F,  0x40F75764, -0x203AC8A0, -0x41972FA3,
    -0x2DB04F7B,  0x45222AA3, -0x1F31237F, -0x1992913F,
     0x3261DFAD, -0x4937FF6E,  0x74E4C539,  0x229C9F2E,
     0x75FC706A, -0x0E0D8C8F, -0x3E3CBB62, -0x3589CDFB,

    -0x697ADCDC,  0x4544B919, -0x1CE53FC7, -0x27A257BA,
     0x43E77DBE,  0x23B4D948,  0x179C426E,  0x7A37CA7E,
     0x3A1A0BB3, -0x56BCB69E, -0x16CDE69F,  0x4461F66D,
    -0x19E60113,  0x19427D12, -0x1A37FC14, -0x7AA77435,
    -0x3653760F, -0x467C1EA7,  0x51426B18,  0x4AA611BD,
     0x23A193CE, -0x74DB3F7B,  0x6A092CA6,  0x7D96816F,
     0x63DC3555,  0x7642998D, -0x5C3B9BE9, -0x53E5B9AA,
    -0x24357CE4,  0x50445F5F,  0x71AAD7C7, -0x0B79A15E,
     0x39B624CC,  0x4B13288E,  0x12F85E8C, -0x6882CDB2,
     0x4681322F,  0x4AE3C9ED, -0x1DFA24A3, -0x515F649E,
     0x6C37F394, -0x660B236D, -0x5080B87B, -0x7A757523,
     0x7A09CFF1, -0x742C473A, -0x6DC2BA1F,  0x1C7EE9C3,
     0x32221E53,  0x7CA4D353, -0x2CC23F65,  0x4C6022D5,
     0x20E74318, -0x4618F135,  0x4C3C1F01,  0x1169D67C,
     0x2E0B8D6E, -0x2FC388D5, -0x2C8C822C,  0x7A223C4C,
     0x7E126A9F, -0x434F1494,  0x29F371A9, -0x44E44942,
     0x13A667A4, -0x7FFECA84, -0x11DE1930, -0x161BF473,
    -0x50A28380, -0x6090F7DE,  0x19D77D47, -0x27372FC4,
    -0x7BABDB1B,  0x037E7649,  0x79A1FC31, -0x64347EB6,
     0x232CC4A6, -0x44B3B3CB, -0x4B5FB7A7,  0x3063C384,
     0x31F2DD69,  0x2BD7DA1E,  0x5289753F, -0x3487AAF2,
     0x625C8D2B,  0x1BCEADB9,  0x4948562F,  0x4A223088,
     0x38EBDD09,  0x2A61B128, -0x703ADC29,  0x4AAB4FE7,
     0x077457D0,  0x299043CF,  0x3046AAF8,  0x644AA770,
    -0x3D808C27, -0x27854F67,  0x6BF88F8D,  0x112CCE5D,
     0x031245B1, -0x71C95DDC,  0x54120F0A, -0x54CF3351,
    -0x1AA9FB02,  0x3C9CF34C,  0x771CDF19,  0x1EF096A0,
     0x199ED140,  0x5EA477B4,  0x07DB8F67, -0x4D7E3FB5,
    -0x3CAFA539,  0x50B42C9F,  0x0A5AF7FA, -0x7A812D0C,
    -0x60CF437F,  0x7F785CC8,  0x0F8F3C89,  0x26C8CE76,
    -0x1A73C6FA,  0x0EBA2594, -0x13D1299B, -0x31699A98,
     0x7CC53D79,  0x4FBAF637, -0x09EED199, -0x33C9ACA8,
    -0x1E41D45A, -0x4E798CC9,  0x4CC53D67, -0x79E48F3E,
     0x69AA78F0, -0x762AB419, -0x66443A41, -0x4E5A1ADF,
     0x34BA9686,  0x41E57439, -0x176874AF,  0x1A3118B1,
     0x712D2962,  0x71D05D8B, -0x0AE1D662, -0x581D42A7,
     0x62410B90,  0x58F284CF, -0x7CB61CA1, -0x125268C4,
    -0x547865C3,  0x3AC002A6,  0x3BFA0F2A, -0x07D09C8D,
     0x5912D711,  0x29AB7AD9, -0x71347660, -0x504C848C,
     0x3F0FCF54, -0x547F0137,  0x1C84B3A5,  0x610D949A,
     0x0A35D553, -0x3638A1C5,  0x1EB3851F, -0x095EC59F,
    -0x5C5C0066,  0x06A75E15,  0x59DF23BD,  0x46416CC1,
     0x508D8070, -0x4B359B7E,  0x14E0884B,  0x1335F237,
     0x1B5D3D1C,  0x33C00BFB, -0x6D2447F4,  0x2A19D1F6,
     0x06A44273, -0x699DD93F, -0x6DA9FA61,  0x2AEF7AC2,
     0x777A7034,  0x25BDAD39,  0x55F5DAE7,  0x69F41BF0,
     0x70B709A7,  0x51F51CB4, -0x58A66677, -0x75425AE9,
     0x118E7E08, -0x7F4F43E0,  0x6E950363,  0x2B09FBE1,
    -0x2CF4EDC9,  0x467D5620,  0x40D2AC97,  0x43DFCE89,
     0x11EFC33B, -0x7D3F24F0,  0x778AFE9C, -0x6197577C,
     0x56740300, -0x24638D90,  0x55E84CD8,  0x000BA2D1,
    -0x169A4014,  0x2A5F753A, -0x5C3595C0,  0x6D47486F,
     0x242733AE,  0x42F2DC9A,  0x5CE0588A,  0x19D62985,
     0x121608E9, -0x603D6C63, -0x2A8E86A8,  0x768596A4,
    -0x3737BDEE,  0x7FB5413B, -0x0BC32800, -0x0FA5F23B,
     0x10B67A2A, -0x286A0AB2, -0x19020BB4, -0x3B8E30A2,
    -0x31461847, -0x4B7AB507, -0x26E95C34, -0x7AE3DAD3,
    -0x4F095275,  0x7FF26DEE,  0x3DCF7930, -0x3E3229DC,
    -0x5E5BFD39, -0x5C7B68DB,  0x0EC44025,  0x4D314004,
    -0x7BCD6142,  0x20977674, -0x671800BA, -0x4BE559E6,
    -0x52B010F1,  0x79ACF898,  0x4FB0078E,  0x4CA429AD,
    -0x59A45675, -0x739FEEDC,  0x1DE297D0,  0x731AF08D,
    -0x4658EB97, -0x2D9B1D2A, -0x3D857D3D,  0x6A1FF755,
    -0x49D34BC0,  0x7DF5D9D9, -0x53C493F3,  0x5C9810C9,
    -0x73F14BB5,  0x0257306D, -0x1DA8F222,  0x08D191E8,
     0x1993A372, -0x7D359C84,  0x68C6048B, -0x7291D3DD,
    -0x3614FF5C, -0x6274ED6C, -0x4D534641, -0x216F86C3,
     0x77630AEF,  0x264DCFCC, -0x708E3B57,  0x5BCAA450,
     0x107669F0,  0x3FB7530F,  0x2AEE6DB7,  0x0C45D687,
     0x7E3E1BF9,  0x5562A957, -0x7FBE52A0,  0x07B6B9F0,
     0x59C93193, -0x72273BB7, -0x173FB994,  0x738CBC06,
    -0x23362545,  0x0415FEC0,  0x138F614F, -0x46218AA1,
    -0x64D2C490, -0x7AF8FC44,  0x1D533B06,  0x4FA0B7FA,
    -0x7BEB71F9,  0x1993B53E,  0x1F896300, -0x4B6A2938,
    -0x5C58E33C,  0x00946A8C, -0x3FFF036E,  0x098093CC,
     0x294D7248, -0x6E9DD5A5,  0x52EE9670, -0x2FE3C88D,
     0x39C77139,  0x7A554C67, -0x08D4EE50,  0x54526286,
    -0x01555B40, -0x152FF70E,  0x3C0C04D9,  0x2F2AF956,
     0x7DB96944,  0x1A4271A9, -0x32A1BE89,  0x7F0BCE7F,
    -0x4861A405, -0x3A4DA089, -0x62FE2746,  0x35AE6CE4,
    -0x79726447, -0x06B83646,  0x1EA92F9E,  0x1158984A,
    -0x38C1AB74, -0x2BABFE93, -0x08C75AE3, -0x402607E1,
     0x42CD17A4, -0x57A09453, -0x3ABFC219, -0x633E9514,
    -0x21077C00, -0x044DE7D1,  0x5B24E323, -0x649B7717,
    -0x6BBA499C, -0x061932DF,  0x0E58ACC2, -0x28EF26BA,
    -0x5483F4E5, -0x4210FF14,  0x7C43B5CA,  0x3F133090,
    -0x49EB5500,  0x08313965,  0x6446FF3B, -0x0A094B37,
    -0x26139AB0, -0x23F69C19, -0x06A41A0D, -0x3E7FE55E,
    -0x2A06AA3E,  0x7C648CD2,  0x41DF981F,  0x3AF58965,
     0x5149D974,  0x49CE8FF9, -0x0E09D54F,  0x0A1DADFE,
    -0x0B1AAFF3,  0x14882C70,  0x5A13A264, -0x287C8C47,
    -0x49DCD344,  0x45191050, -0x30DE5A38,  0x557DF620,
     0x05C4C874,  0x6EE443D4,  0x14CD27D3, -0x048EE37C,
     0x248694F4, -0x37BF7591,  0x596EA67F, -0x2025AB4B,
     0x518D0718,  0x0A8E3540,  0x2E127AEF,  0x30910E56,
     0x332AE4F5,  0x2DD1D372,  0x042CABA0, -0x1E27A496,
     0x0E92473B, -0x6BB9A1FA, -0x4CA129E2, -0x1261C783,
     0x34DF025F,  0x15814A88,  0x7EEBA1C6, -0x366FF803,
     0x460DC618,  0x6D880825,  0x28433C10,  0x7360B839,
    -0x4FC3676E, -0x6D948E49, -0x7FC9971E, -0x512BE475,
    -0x0D11E901,  0x70E7A42B, -0x03B96897, -0x20EC1BD7,
     0x288E03E3, -0x767F3723, -0x256A6FFD,  0x0BB4D222,
     0x5AEAAAAC, -0x075EBAAC,  0x39FE1FA8, -0x7CF26C01,
     0x11058417,  0x5E3EE3EE, -0x3838A29D, -0x4FB93B6D,
    -0x4C365024,  0x2B7359ED,  0x6D75F750, -0x7E585693,
     0x1C23B41E, -0x2657378A,  0x7B440AA8,  0x03AD107D,
     0x04F4172B,  0x7EB3A2F1, -0x1D40F1B1, -0x63A123A9,
    -0x5694CBFD,  0x4E7C8257, -0x1106BA8E,  0x6C5DC6A4,
     0x3C41EC26,  0x7DA36EE9,  0x06E243A8,  0x523FC040,
    -0x6EB063D4,  0x04A801CD, -0x0EB808E0,  0x15A2917B,
    -0x66F71C58, -0x2CF3EFEE,  0x1FEBC759,  0x36871102,
     0x1F5BB1CF, -0x23FED257,  0x79433DDC, -0x20986107,
     0x45692B70, -0x6EF1604B,  0x3653B887, -0x7D6FC74C,
     0x51A8D2AB,  0x3A3A44D6,  0x3130B1DE, -0x6AC3385B,
     0x33E07FFB, -0x48C51932,  0x4A9A09E2, -0x0C0DE61D,
     0x5889AA00,  0x28197119,  0x4741E7F8,  0x689CFDEB,
     0x41107899, -0x09175B18, -0x41DA5EB0, -0x2214E503,
     0x587723C5, -0x3D125AF4,  0x7F97315E, -0x588C1357,
    -0x6A2AE137, -0x4331FAC1,  0x085EBAD3, -0x7CF792FD,
     0x62409625, -0x24B94D9C,  0x7D7C9BAB, -0x4E1B1201,
     0x408DB7CE,  0x7BD35622, -0x5FEE784B, -0x4EFA6787,
    -0x4487C2CC, -0x1B155D8F,  0x57E53330,  0x31512761,
     0x19AADB8B,  0x2E2A058F,  0x2F0B0FEB, -0x7005C069,
     0x5524E4E7,  0x140C52D9,  0x662E8673, -0x6C5F0219,
    -0x227E3869,  0x22A2D416, -0x0007AB3D, -0x4444D048,
    -0x6D5627B1, -0x2F3EB462,  0x531B6201, -0x433F4824,
    -0x6DAB1967, -0x02BDA606, -0x547F4D3A, -0x61795CF4,
     0x41FC1C0E,  0x50B6DA5B,  0x6411D86D,  0x0172698F,

     0x20A5AEDC,  0x021FAF8E,  0x0DA880E8,  0x07E0D386,
    -0x21F026F0, -0x78D5943A,  0x139A7DA1,  0x5F4C1D64,
     0x37C1A72D, -0x5F938725,  0x6D6DEFE8, -0x023D48F2,
     0x137D0C87,  0x4D1E226E, -0x2DDE15A1, -0x0FFBC2DC
},

};

int x_cn[NUM_INPUTS][2*N + 2*PAD];
int x_i[NUM_INPUTS][2*N + 2*PAD];
int x_sa[NUM_INPUTS][2*N + 2*PAD];

int y_cn[NUM_INPUTS][2*N + 2*PAD];
int y_i[NUM_INPUTS][2*N + 2*PAD];
int y_sa[NUM_INPUTS][2*N + 2*PAD];

int w[NUM_INPUTS][2*N + 2*PAD];

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
    t_start    = _itoll(TSCH, TSCL);
    t_stop     = _itoll(TSCH, TSCL);
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
        memcpy(x_cn, x, sizeof(x_cn));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_sa));

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

        printf("DSP_fft32x32s\tIter#: %d\t", k);

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
/*  TIME_CN -- Measure elapsed time for natural C version.                  */
/* ======================================================================== */
clock_t time_cn(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft32x32s_cn(&w[cur_input][PAD], n, &x_cn[cur_input][PAD], &y_cn[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return (t_stop - t_start);
}

/* ======================================================================== */
/*  TIME_I  -- Measure elapsed time for intrinsic C version.                */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft32x32s_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return (t_stop - t_start);
}

/* ======================================================================== */
/*  TIME_SA  -- Measure elapsed time for SA version.                        */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft32x32s(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop = _itoll(TSCH, TSCL);
    return (t_stop - t_start);
}

/* ======================================================================== */
/*  End of file:  DSP_fft32x32s_d.c                                         */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


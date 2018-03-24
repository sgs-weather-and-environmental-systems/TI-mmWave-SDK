/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_ifft16x32_d.c -- Driver file for DSP_ifft16x32                 */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_ifft16x32'*/
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

#include "DSP_ifft16x32_cn.h"
#include "DSP_ifft16x32.h"
#include "DSP_ifft16x32_i.h"
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
#pragma DATA_ALIGN(x_c, 8);
#pragma DATA_ALIGN(x_i, 8);
#pragma DATA_ALIGN(x_sa, 8);

#pragma DATA_ALIGN(y, 8);
#pragma DATA_ALIGN(y_c, 8);
#pragma DATA_ALIGN(y_i, 8);
#pragma DATA_ALIGN(y_sa, 8);

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define N (256)
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
    -0x4AF2AAD5,  0x08C3C636, -0x045937AA,  0x0A3C7B5B,
     0x253DB9C5, -0x3422FD6F, -0x227A0836, -0x0B91F870,
    -0x1E9758E9, -0x55FD39C9, -0x185DF8F2, -0x204FEF86,
     0x3FD069F9,  0x5A4759EC,  0x7221D819,  0x3A4FD7C0,

     0x30071174,  0x04DA228A,  0x549CDFD9, -0x6A0A35DF,
    -0x255F0E71,  0x6DBBD555, -0x00CC4A6C,  0x36562270,
    -0x0F3E1998, -0x7586E64E, -0x4846472F,  0x46182B2F,
     0x560CEF0C, -0x0893EF30,  0x3E85364E,  0x2E84B559,
    -0x7A87715D, -0x320AAA4E, -0x6C9A5889, -0x6E90CA29,
     0x327D7A5E,  0x683AE32A,  0x272E76EE,  0x6EED1416,
    -0x3AD7E54E, -0x7A1A98CF,  0x2773D099, -0x13C054B0,
     0x05935259,  0x5166823A,  0x3ED409B6,  0x3F8168F6,
    -0x66CCE963, -0x29CB8427,  0x607A067E,  0x3FA0A3C7,
    -0x3E6AAC94,  0x4C8BD564,  0x22283BCC,  0x1C0BA30F,
    -0x23106649, -0x28C9A60B,  0x0675AF4E, -0x4559B671,
     0x311D2298,  0x20D00E57,  0x5EA494C2,  0x3080EE8D,
     0x7B7795C0,  0x5C069858,  0x2A9DE4B7, -0x12371470,
    -0x45F5DB52,  0x2E62870C,  0x798A945D,  0x04814E41,
    -0x2F4994CC, -0x04EEE78B, -0x26723027,  0x1C8140F8,
     0x57A8A9BF,  0x152AD80C,  0x4124BBA2, -0x7FDF6E8F,
     0x48B8BAEB,  0x55F6BFC4,  0x099D536B, -0x24C409D6,
    -0x23DA9B23, -0x673FCF19,  0x5F3EC516,  0x18E874EA,
     0x3D3771EC, -0x6468929D, -0x368118D9, -0x1C89890F,
     0x713B160C, -0x385A0E02,  0x23E92E4E,  0x4E250F51,
     0x16682287,  0x56713CF4, -0x51E04491,  0x2628EEEF,
     0x561F837D,  0x67B8887C, -0x6A880F4B,  0x5F657BB0,
    -0x54F27052,  0x7032F1BC, -0x7A3CE9CB,  0x2E6C9F4B,
    -0x204E5DF7, -0x66157B66, -0x3C487570,  0x4344BF48,
    -0x23407E74,  0x798DBC06,  0x4367FC26, -0x529EA05C,
    -0x4C17EF1C, -0x42C50DE2,  0x51773B4D, -0x2190085E,
     0x777ED35E,  0x2F562FC4,  0x305A0A12,  0x57526B42,
     0x4E81BD9A, -0x5E1C09E5,  0x49418707,  0x79ECBDDF,
     0x5581C88C,  0x46D1756B,  0x5A209B92, -0x05DE997F,
    -0x41111DBD, -0x1D265B0E,  0x2959F84E,  0x7D9ED547,
    -0x46BF6302,  0x6E50D018,  0x438B27F0, -0x2B1B5477,
    -0x5D7CD000, -0x6A80E86D,  0x33FB1D33,  0x640D131A,
    -0x1039AF47, -0x63FFB212, -0x30DF19AD,  0x2BD6D237,
     0x6BE741AF,  0x2E96CEFB, -0x04272F74, -0x0B937C60,
     0x2D40C3B4, -0x71F73E4D,  0x78B1B023,  0x25757A53,
    -0x2342B51B, -0x5581BC0A,  0x38DAAF7D, -0x48202686,
    -0x4F380110, -0x6724FE48, -0x49C7DF4B, -0x2413AD05,
    -0x3C66F3DA, -0x0C5C3CE3, -0x2CE718BC, -0x4FFEECCD,
     0x1C71C5D3, -0x5C30A40D, -0x4A000ED1, -0x49489CA8,
     0x0327055F, -0x78C774E4,  0x33212F3C,  0x52AB670C,
     0x1C9F6CBD,  0x7EF25060,  0x3EF4A5B4,  0x048E998B,
    -0x385F1D65,  0x612E1F29, -0x2D92F6D6, -0x450696EF,
     0x418BE6E2,  0x5B218DA4, -0x13B19C34, -0x317C7421,
     0x0C742FFD,  0x2266E2CF,  0x072647C0,  0x24927669,
     0x20171564, -0x609EDD14, -0x6698E8F8, -0x0F8C77C8,
     0x59394AFA,  0x732AF2E3,  0x1A22CB6C, -0x5DD2A11D,
    -0x4C24A159, -0x1A8E00F7,  0x0CDED6F1,  0x71A1DAC4,
    -0x3D256D34, -0x4E1ABF31, -0x71E179A7,  0x14584CC8,
    -0x08908713,  0x44A2ADDA, -0x150C81D6,  0x19A555ED,
     0x2606DB32, -0x2CE918F6, -0x4BBC4542,  0x637CEEEB,
    -0x31FC81D4, -0x2310BD1F, -0x1CDB6624,  0x4B8E1E84,
    -0x5122E29F, -0x71783624,  0x79DE7F5F, -0x11D91E05,
     0x18224227, -0x6BAF5DD4,  0x260E7A5D,  0x1749B537,
    -0x73249AC1, -0x3D3B97A1,  0x76657E5D,  0x4F8E5910,
     0x19CADAC6,  0x2C52F170,  0x088CA317, -0x68B8C4C0,
    -0x02F0F622,  0x1DD1FCBE,  0x3FACF938,  0x455A0A7F,
     0x15B276B0,  0x7BEE516C, -0x01EF9C4C, -0x7C99FFB0,
    -0x7A7EE9D1,  0x0421CEB2, -0x1093F9E4, -0x0A5AAE19,
     0x2FDE6E22, -0x03612577, -0x3CB8457D,  0x08114BC8,
     0x6EE304FE, -0x46342DB6, -0x0001EB9B,  0x5D489F83,
    -0x74936AFC, -0x6B4C2C49, -0x340C89E1, -0x1D50A1DF,
    -0x767E5AD8, -0x3B007E1C,  0x4B56AB6A,  0x0B5C1EB8,
    -0x575F35B9, -0x6813D46E, -0x0BF166A3, -0x4FC0365D,
     0x306B5818, -0x683D1190,  0x6C486F84,  0x1505A1EA,
     0x0535C87A,  0x114E32C0,  0x7124F76F, -0x72B714B0,
     0x7EEA7978,  0x7CDC25F1,  0x3E005F58,  0x5074C888,
    -0x0116C85D,  0x4F359491, -0x020FE4B4, -0x170641E9,
    -0x2AD7ECD2, -0x4CEA40C4, -0x4A3BAAA3, -0x34CF96A4,
    -0x17B2FDAA, -0x5D4F7020,  0x4841625D, -0x666E1FBD,
    -0x66E12E6D, -0x1E563F07, -0x150F335B,  0x7E9B3E1F,
     0x76D3E110,  0x6A157130, -0x57ED9CA0,  0x3907DF2E,
     0x32C92FED, -0x4C04531D,  0x6B36DEE6,  0x48B8C846,
     0x561B2FCC,  0x5CD54D14,  0x06EB8B96, -0x441242D4,
     0x4992EC23, -0x396D1CB8, -0x37E4793E,  0x26337E13,
     0x0D83FBDD,  0x0997F5C7,  0x107E0223,  0x4299BDC2,
     0x4AFEBABB, -0x2DB7C536,  0x68B61F4F, -0x585ACC19,
     0x1BF25807, -0x5A75C9F0, -0x59793640,  0x37896D10,
     0x209D300C,  0x09C8D15D, -0x6E51D522, -0x5AE33F31,
     0x58EDEDD6,  0x0FFD4D62, -0x7519DF66, -0x5CF3137C,
     0x3838FCBC, -0x38C4CC75, -0x4385B4FA,  0x3BDFEC56,
    -0x6D2334CA,  0x1735A53D,  0x4F062082, -0x3CDA8B34,
    -0x45C3AB8B,  0x7548A8F2,  0x23DA8CEB, -0x00876769,
     0x70A0794C,  0x0885CCCC, -0x758D5CAF, -0x1D4AD9FD,
     0x1171A5DD, -0x50BE2DFD, -0x6F64213D,  0x78F8268B,
    -0x71A2B872,  0x6BA0AFC7,  0x3EB66390,  0x70DC1022,
    -0x5B237731, -0x505E78FB,  0x6C94DCA5, -0x2C85DB68,
    -0x22731FE3,  0x13331194, -0x717FA59D,  0x56A679B2,
    -0x2A06112A, -0x0E4018AD,  0x0FE0C88B, -0x230ECD9B,
     0x42421D58,  0x61BB46A5, -0x54049A53, -0x6D139844,
     0x442098DF,  0x1DC1B9DF,  0x5062D09F,  0x382730E8,
     0x77C910BA, -0x3465D1E7,  0x0472227E,  0x0C7A6BF6,
     0x4C3BC439,  0x2BD900EE,  0x51818FBE, -0x27F85C4B,
     0x28645EF1, -0x59929763, -0x4AD9E74A, -0x558355C7,
    -0x3C53E23B, -0x334925E4, -0x6CDA34BB, -0x4FDE9F6E,
     0x5462C834,  0x2CA2D38C,  0x34760FF1, -0x50E5DAD7,
    -0x077B0F8A,  0x143D939B,  0x40F67B19, -0x4D8C88BD,
    -0x1491FD23, -0x40AEBDB1,  0x4533BAAC,  0x4B68432F,
    -0x0A1563FD,  0x5B7D03B4, -0x4024FC16,  0x046E599E,
    -0x52E53FC1,  0x7A5076FD,  0x264993AF,  0x758498A3,
    -0x0731BE1C,  0x6AE62484, -0x7F47433D,  0x763B41D9,
     0x4DAE0CC4, -0x1077A6C4, -0x026B0249,  0x0305F53B,
     0x3DD4B486, -0x1F3C12FE,  0x0D6CADCA,  0x3843E41A,
    -0x37C82CC3,  0x308F7661, -0x75FA57A6,  0x0098A8C1,
    -0x0F7A4F38, -0x281594C7,  0x590F9452, -0x290AB0B8,
     0x10D4B881,  0x1D7BB3D1,  0x17FB2E33,  0x43ED0C00,
     0x79BA44AF, -0x2F4AE332,  0x4D712217,  0x6BC91B1C,
    -0x21BAD9BE, -0x1E05B763, -0x5C1A08B8,  0x4ADA50F2,
    -0x0DAF75A1, -0x27C47D46, -0x6329802C,  0x188DD171,
    -0x214360D8, -0x3E590298,  0x561F5BB5,  0x4BC28035,
    -0x14F16DA9, -0x133DF9B0, -0x3107F602, -0x3F1B6D2E,
     0x03E54F24,  0x209E9F86,  0x2B0F0090, -0x71C13047,
     0x67DA98E5, -0x5889F784, -0x70BBA829, -0x06ECFBB1,
     0x303ADE0D, -0x37A347A7, -0x187981EC,  0x09FC1FAD,
     0x1C2673DF,  0x23633E3F,  0x44547BAF,  0x49FF7986,
     0x118F7F78,  0x6FC98FF4,  0x3E5A400B,  0x2DEECCB6,
    -0x0C65B864,  0x23A64A76, -0x2D4B7D8F, -0x6681A704,
     0x39DE43CE,  0x7F955BFA,  0x4D4AA572,  0x09AAB45B,
    -0x38F788D2,  0x7BE796D3, -0x4A24CC99, -0x122E365B,
    -0x75A3575B,  0x1ECEBDC0,  0x40185E64, -0x67EB7F4D,
     0x6398D2D6, -0x49F193DB,  0x486E1447,  0x5F7699BC,
    -0x354190A7,  0x77B27CAC,  0x48E81742,  0x5C412F5D,
    -0x3DCAF440, -0x02C6B22F,  0x5BB8AB77,  0x51256ACA,
    -0x762F571D,  0x3BCB7DD4, -0x3921B0E7,  0x369FDDA6,
    -0x6FC59A07,  0x40F18F97, -0x01900268, -0x18E3EAFF,
     0x3C3C04F4,  0x7044FCE1, -0x43007FB0,  0x7B5ECE04,
    -0x19985855, -0x655ACC71, -0x6E53AFB4, -0x415BA43D,
    -0x5E6094B6,  0x7379052C,  0x7D4A7D87,  0x4E10B7BC,
     0x4A074A8F, -0x03A50191,  0x142F2C40, -0x1C2C3888,

     0x58D0C849,  0x42D72D24, -0x64E2EA36,  0x349446DB,
    -0x0D9B1056,  0x11A6D302, -0x4927618B,  0x0A9ADC9B,
    -0x3689E42B,  0x01EA8BE5,  0x15CDF4F1, -0x10C414A0,
     0x3E730D44,  0x69E44FF1, -0x5995463B,  0x07057D0D
},

};

int x_c[NUM_INPUTS][2*N + 2*PAD];
int x_i[NUM_INPUTS][2*N + 2*PAD];
int x_sa[NUM_INPUTS][2*N + 2*PAD];

int y[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x3FD0CE68, -0x3D460ADE, -0x34773FB5, -0x6ED11950,
     0x7AC1E220, -0x23556441,  0x1C8553B0, -0x7C3D6B5F,
     0x47C6426D, -0x71A78AC2,  0x26728487, -0x28EB77BC,
    -0x215C570B,  0x35808F09, -0x4E16F2A3, -0x0C13000D,

     0x5136A2D3, -0x553EFE4F,  0x0E0345DB, -0x41043A65,
    -0x345800DA,  0x15D80308, -0x17106F14, -0x2DF4488E,
    -0x6E7B0A12,  0x20EA7AA5,  0x17A7ED6F,  0x5B78F668,
     0x4C3AA7B7,  0x1E416B50, -0x00B5F30B,  0x155E3BB1,
     0x18696C85, -0x7AE61F27, -0x11679700, -0x0DEB18FB,
    -0x2B5E9574,  0x5BDFB4D2,  0x00070155, -0x1A9FCA03,
     0x3BFCF933,  0x007ED0BE,  0x0A0208CE,  0x4FEF1E22,
     0x3E1D53DC, -0x1CDEA9E7,  0x0CC63838, -0x6A7196DC,
     0x2B071AF9, -0x6CFBC926, -0x61A1DF40,  0x5AA665B4,
     0x0D611BE9, -0x3D484C32, -0x10C0F5A3, -0x258F2672,
    -0x246F10E5, -0x5F91AF98, -0x3DF01432, -0x0F856BD8,
    -0x16C42403,  0x23C9B075, -0x12042162,  0x3EDB3389,
     0x1BAA8834, -0x4D5921C9, -0x18BC5255, -0x04486831,
     0x6187FF9C, -0x4B937690, -0x2EAB1442, -0x1E858729,
    -0x087C876F, -0x7BA45E35, -0x77EFED58, -0x37A6446C,
    -0x18A68AFE,  0x4D5AF03C,  0x3DB23A6A,  0x6393E386,
     0x58B2A7CB,  0x47CE13BC,  0x11D3D0E3, -0x600CC819,
     0x146C23D8, -0x25189A0A,  0x380EE788,  0x290F16F6,
    -0x1C3C9D68,  0x2BF35E5A,  0x19CD8AA9, -0x652C0D10,
     0x21D4902C, -0x7DC931E9, -0x00545C47, -0x36417ECF,
     0x190BA9EC,  0x24BD9886, -0x38FD12DD, -0x43936F01,
    -0x53172155,  0x09B34E75,  0x13147227, -0x3822F185,
    -0x4C5036B4, -0x0944C324, -0x76A9E9C3,  0x48FBB93C,
    -0x4C8F0BE8, -0x7F399B7C, -0x75A14F78, -0x731DFAE5,
     0x46F72467,  0x74ECE20B, -0x0010CF35,  0x5A6BA297,
    -0x27E70AFA,  0x23C940D9, -0x6459AE96, -0x6387C58C,
     0x1EDD47F0,  0x11D5387A,  0x2DCE57F6, -0x44812708,
    -0x24E61134, -0x76BEA11C,  0x71CC61BB,  0x0DD07651,
     0x60D73AB4, -0x6128C1DC, -0x174D451F, -0x03CDB851,
     0x5B2BC7C3,  0x04535EF5,  0x3673C78E,  0x40201E75,
     0x66E714F3,  0x59C7BABD, -0x7BCC076C, -0x349977DA,
    -0x264F8945,  0x4D791E7B,  0x673F4727, -0x2A94E494,
     0x64EEC7FB,  0x30C4F811, -0x35DE38E0, -0x753A9B2F,
    -0x0ED98F4E,  0x687A1384,  0x6155BE41, -0x1976F564,
     0x423036FB,  0x4849BEA0,  0x1E23D00C,  0x28E59F5C,
    -0x222EA630, -0x31611D81,  0x2D16AC98,  0x7C6C9C94,
    -0x44D17DE1, -0x3975787B, -0x0B692B06,  0x37B4061C,
     0x36ADF79C, -0x2DD7C3C8, -0x68DE1451,  0x47A6479D,
    -0x3D545E19, -0x28FB0370, -0x7E56F26E,  0x421AB1C1,
    -0x12659F8B,  0x4B07F21E,  0x758EBADA, -0x69D1D377,
     0x1BFF29C2, -0x0CA55054, -0x5D43335A,  0x67E19346,
    -0x6E338FB3,  0x78D352BD,  0x3C6DF887, -0x7393C03A,
     0x3EA465E0,  0x6B631379,  0x16015E9F,  0x2EDC3D1F,
    -0x34888865,  0x29FDC183, -0x337A583E, -0x67894C54,
     0x7305A750,  0x2887B133, -0x1BABD4DE, -0x62B41255,
     0x1DBF2A9C,  0x264890C0, -0x7EAB52FD,  0x2F9EA10D,
     0x378AD556, -0x44AC5433,  0x0F6018FA, -0x6C7D2C1C,
    -0x1E1B283E, -0x2880E41D, -0x7EB729CE, -0x3FC80CFA,
    -0x2D16C0FB, -0x62B094AD, -0x7905D7C1,  0x5DD09C4F,
    -0x75492D8D,  0x296B1CFD,  0x4E4415F3, -0x146A73EF,
     0x42B4AC14, -0x46ED5C76,  0x4FC05EC1, -0x7259C3D4,
     0x243C2CFF, -0x46F4B67F, -0x6FA7FAD8, -0x03A14DAF,
     0x4F23B0F7,  0x369E83D2, -0x050A2256,  0x16FCF6E8,
     0x10A59ED7,  0x38072C42,  0x2BC3AAC1, -0x61F947D9,
    -0x0ED5C7C4,  0x7AF13543,  0x50A34B6E, -0x650A5B35,
     0x0379BF07,  0x116A3CB6, -0x78CE8B41, -0x2A651C01,
    -0x11409FE3,  0x71DE9312,  0x3FF670EE,  0x0BCB44E9,
     0x4B0372F0,  0x57933477,  0x25367B7D,  0x35C99A61,
    -0x46907FA6,  0x1A21212B,  0x0FDE19E2,  0x7CF0BF52,
     0x47039B39, -0x1C8E4E02,  0x6D13093A,  0x5622CA42,
    -0x6FD87DAC,  0x47B84A17, -0x3617C67D,  0x3C76F084,
     0x2C990D10, -0x3B08F757, -0x4453AD1F, -0x6E5B6E6C,
    -0x23BA919D, -0x55882CE8, -0x109EB793,  0x28B7F219,
     0x0075BB9D, -0x1E2FA107, -0x503382F2, -0x0E82D8EB,
    -0x2E17BF92,  0x19E0998C,  0x67B1EAD1,  0x4939A6B8,
    -0x22B9D443, -0x1FA6F9EF, -0x415D20A6,  0x70140962,
     0x4D7AF6C4,  0x1638898D, -0x5702362D, -0x582C81B9,
     0x6D6628F7,  0x50D41678,  0x027E82E4,  0x6B4C6043,
    -0x087F1DCC, -0x69232630,  0x2F00BA3B,  0x60188356,
    -0x54364D48,  0x0FE24119,  0x43D0E015,  0x580FA841,
    -0x6055C39C,  0x0ADC81C5,  0x282E2057,  0x02F9A2D7,
    -0x1ED2D239, -0x0DCB0C7D,  0x4E66EBAA, -0x3EF05D8F,
    -0x26E00B92, -0x5C340B06,  0x62108A26,  0x21AD3508,
    -0x147829FD, -0x55785A97, -0x7D14B802,  0x79D17285,
    -0x1BF33E4E, -0x2124E449,  0x7DE295C0,  0x2CD7CAA6,
    -0x504F8BAA, -0x1229829E, -0x66592D6E,  0x13F11120,
    -0x3C8C8C0F,  0x452E8CE2,  0x58730E00, -0x7714D2A4,
    -0x1BA9B912, -0x202EDF16, -0x3C8B9D2F, -0x645A0D9C,
    -0x60C6795A,  0x7B71051E, -0x3FBDAB9A, -0x1A284E8B,
     0x0D2637B8, -0x4A692D5D, -0x16F33AE1, -0x75741340,
     0x6372F09F, -0x7B50DBD6,  0x63DBF549, -0x2A184336,
    -0x46BEB1E8, -0x605B342D,  0x4579061B,  0x01A86302,
    -0x5D0DC92F,  0x47696184, -0x058768CB, -0x5B13730C,
     0x02E361DE, -0x0FEC2EDB,  0x2EDBE92B,  0x3EB2B3AB,
    -0x51E4468A,  0x59EC4746, -0x4221EE65,  0x70A344BB,
     0x4C55037F, -0x7DF6EE54,  0x2762B245,  0x5595D877,
    -0x0115B1A1,  0x06E4ED49,  0x0D7AD1B6, -0x7FA7CE38,
     0x481CBA92,  0x61723C1E,  0x2E9124F3,  0x243A5537,
    -0x37B9FA6E, -0x6BC5507D,  0x6AC17DB3, -0x262DA56C,
     0x2C656A81, -0x4F0B26A7,  0x4DB8BE9F, -0x71739C29,
    -0x1972B9E1, -0x34DFD458, -0x63322BE5,  0x18734298,
     0x38B40E88, -0x2FD81ADE,  0x67B24519, -0x1040AD47,
    -0x0F9AE8C6, -0x3F8E8DF2,  0x253FCC77, -0x775D0B44,
     0x75D2A1E8, -0x35F455DE,  0x4AE97C61, -0x2727C3C4,
    -0x63374970, -0x27BE753C, -0x0EAA07C0,  0x7A734F0D,
    -0x4D01AA9E, -0x0D4029D3, -0x0372D251, -0x01901970,
     0x605267E5,  0x11B423FF,  0x445226FE, -0x2579755B,
    -0x3CA8FB10, -0x2E8B2845,  0x491764BA,  0x7CBBEEC9,
     0x51D183E5, -0x75E76F54, -0x16EABC47,  0x0A3503E1,
     0x028CDCBA,  0x4DA775AD, -0x67FA0BC0,  0x40D1312A,
     0x3E13CD43,  0x4937005F, -0x5C058565, -0x0907BC2F,
     0x0ECB5851,  0x0F95A64A, -0x0C25C62E, -0x36CC8747,
     0x15F1010D,  0x42EDFA65, -0x25056A26,  0x6D074BE5,
    -0x350F95D9,  0x28F2AF83,  0x5C5A16D6,  0x1D8C5E0D,
     0x7EA3A646, -0x60FAEAD0, -0x74FA5E1F, -0x48B8E521,
    -0x63100EBA, -0x031E898F,  0x580B37D7, -0x033D859F,
    -0x44B7DF43,  0x4946EEF0,  0x78A4CAB8,  0x6F6B7C05,
    -0x137695B7,  0x6A252113, -0x3D0F6AFB,  0x5E30CAE1,
    -0x344501D9, -0x5530978A, -0x66287A53, -0x6AA2F471,
    -0x1CCC226C,  0x2C9FEA54, -0x2874CCFE,  0x26375B3C,
    -0x3C66708B, -0x4352E1AB, -0x3BCF18C7, -0x151D81A8,
     0x6C4915CC, -0x7603C3BA, -0x77E7DA13,  0x18FD3275,
     0x7398B470,  0x47AE203F, -0x58CCB1D1, -0x787ACC33,
     0x727B0992,  0x31B20DA6,  0x050DCAA1,  0x157873F1,
     0x3F0FEB8D,  0x717BEDA8, -0x1207C1E6, -0x4E480CE0,
     0x607D9677,  0x6F317297, -0x6B29ACB7, -0x71512F37,
     0x47C7A806, -0x7F145458, -0x4BFD7A10, -0x0BC7004B,
    -0x220F96CA, -0x799F8057, -0x67267CE3,  0x3E442E5A,
    -0x41F81FCA, -0x1C6160EB,  0x3A6599F3,  0x77BF5BD6,
    -0x2F6ACAD4,  0x61495A15, -0x1C53528D,  0x1E3C8F15,
    -0x721820D2,  0x77CDE8E9, -0x33E3C125, -0x6B21AD61,
    -0x6143DEED,  0x751A993D,  0x4999FC02, -0x5DFEC371,
     0x33D7558A,  0x136479E2, -0x09509DBD, -0x4DD6BCCE,
    -0x5911820A, -0x15A9268F,  0x6A5DEB6D,  0x28AA2BD2,
    -0x1F89546D,  0x4B584F5D, -0x0FF2BDB9,  0x5A9CAA25,
     0x03DDAF6C,  0x024898E6, -0x3BDEF0F6, -0x487D5014,
    -0x24686C72,  0x793DEE7C,  0x52AAC877, -0x72BD98CD,
    -0x726A99F2, -0x3E3DB3FE,  0x01BC13E9, -0x0C32A340,

     0x1A98D656,  0x031D1884, -0x011ECE07,  0x5E194C2B,
     0x14E60E33, -0x2EF43E2F, -0x76CD03DF,  0x53CE2F19,
     0x28E86C39, -0x1C743982,  0x518DEAF3, -0x38C21FDC,
    -0x1DE9821B, -0x4FE65231,  0x4C6EA751, -0x65EE030D
},

};

int y_c[NUM_INPUTS][2*N + 2*PAD];
int y_i[NUM_INPUTS][2*N + 2*PAD];
int y_sa[NUM_INPUTS][2*N + 2*PAD];

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
        gen_twiddle_fft16x32(&w[0][PAD], j);

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

        printf("DSP_ifft16x32\tIter#: %d\t", k);

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
    DSP_ifft16x32_cn(&w[cur_input][PAD], n, &x_c[cur_input][PAD], &y_c[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for intrinsic C version.               */
/* ======================================================================== */
clock_t time_i(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft16x32_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA   -- Measure elapsed time for SA version.                       */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_ifft16x32(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_ifft16x32_d.c                                         */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


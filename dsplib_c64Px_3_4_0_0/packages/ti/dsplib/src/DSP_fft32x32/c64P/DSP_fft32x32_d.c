/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft32x32_d -- Driver file for fft32x32                         */
/*                                                                         */
/*  USAGE                                                                  */
/*      This code contains a driver program for testing the 'DSP_fft32x32' */
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

#include "DSP_fft32x32_cn.h"
#include "DSP_fft32x32.h"
#include "DSP_fft32x32_i.h"
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
#define NUM_INPUTS  (1)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
int x[NUM_INPUTS][2*N + 2*PAD] =
{
/* Input Number: 0 */

{
     0x61DEED4D,  0x4AC29E4A, -0x528F5F8E,  0x6908687F,
    -0x026C3291,  0x54F60DB5, -0x07E3E221, -0x703E127B,
     0x4324F5E1,  0x63DEBEB9,  0x2867F529, -0x0A8DB10C,
    -0x09EF49FE,  0x06C94C01,  0x5E2C280B,  0x3C1A3390,

     0x261855D6, -0x0FED6144, -0x1953895E, -0x26F75959,
    -0x390F7331,  0x1FD21AF4,  0x599EF8D7, -0x5E7D57F7,
     0x0AC9CBE2,  0x75A34744, -0x2FA449BD,  0x01B17FA5,
     0x0348D869,  0x26D95A81, -0x6B4D22DA,  0x55502255,
     0x07512945, -0x673FD03C, -0x24270B23, -0x1F669CB2,
     0x5C3A9CD1,  0x1E573163, -0x03075F93, -0x080ECC42,
    -0x591F12E5,  0x2214AF50, -0x45138073, -0x3F235CF5,
    -0x63E37B19,  0x2B231E61,  0x068B7FBD,  0x23A90C45,
    -0x7CEEF308,  0x4BA3C201, -0x33DAAA17,  0x5A69DF38,
    -0x1613A9D7,  0x786E52CD,  0x4594720C, -0x57615353,
     0x2B7109C2,  0x3ED8F994,  0x4C760968, -0x4CD232AC,
     0x40FCA3A9,  0x62F74D46,  0x3804A9BB,  0x031946D2,
     0x3F5140C6, -0x1E1C4AB8, -0x40F123F9,  0x2B724779,
     0x39DFB844, -0x247C4D4B,  0x5794525D,  0x1112EB32,
    -0x332B81F1, -0x21B45DFF, -0x5A7FDACB, -0x23726FFE,
     0x029CD51D,  0x1690648E,  0x650498C6,  0x0BF372C3,
    -0x0DC232FC, -0x183A8E5B,  0x6619F1F8,  0x2CC0DF82,
    -0x5CE96CAC,  0x684EDF55, -0x036520B5, -0x44615AFD,
    -0x428378C5,  0x4148CFC1, -0x7B7B1CA7, -0x59A1D70C,
     0x76BEA1FA,  0x75D6CE56,  0x60DB5150, -0x0C4B59BC,
     0x48FFA794, -0x7794629B,  0x08A45508,  0x11382626,
    -0x117F52AD, -0x6A631653, -0x73706DF3,  0x451E9A3E,
     0x1DBC5E8F, -0x451091B9,  0x32B6BB47, -0x37C25C8F,
    -0x6D0D65BD,  0x7A2A0A81, -0x7EFF3467, -0x04336D1C,
    -0x2E7A231A,  0x78A33C20,  0x68AB4114,  0x506403A2,
     0x3CC4EE0F,  0x1A148B88, -0x288F18D1,  0x4CC3B56C,
    -0x1C6E969B, -0x6A919BAF,  0x67CBB08B,  0x32D0092F,
    -0x639679AE, -0x2AD1263C, -0x761EE947, -0x299F555A,
    -0x1FB24BFD, -0x29512341, -0x4F70706C,  0x0E39E7A5,
    -0x0EF57ACD, -0x26FDAB7B,  0x0A0E8B97,  0x52DC3D89,
    -0x41969EC7,  0x00C9B1F4,  0x37C381CA, -0x0A727DA7,
     0x10B387E2, -0x2E779E58, -0x72557C58, -0x71E8B2FB,
     0x7C27DF98,  0x1A05BB83,  0x55E1E8A1,  0x00DCFD58,
    -0x643EEDB6, -0x3DE334E4, -0x6522816F, -0x5A640BF0,
     0x02EA76A6, -0x095F655E, -0x0B4D372E,  0x267D8198,
    -0x7971BBEE,  0x3DB2569A, -0x24F835B9,  0x71E2EFFA,
     0x41039AF6, -0x07DC11F1,  0x0128E5FF,  0x56714968,
    -0x289B3434, -0x41B06455,  0x2CB83CD4,  0x4AE048FD,
    -0x70418386,  0x20FBD131,  0x1A83289E, -0x33F416E1,
    -0x6057F08D,  0x57BC22E9, -0x180BC89B, -0x0A3CC1F6,
     0x4BB4D923,  0x4D4E8D72,  0x7BA93C22, -0x582527F4,
     0x4049A822, -0x697F4686,  0x79ABE88B, -0x1D018D24,
    -0x46A8EF4D, -0x39EF641A,  0x34C67360, -0x3C37C756,
    -0x1791F2F5, -0x51EBF029,  0x2D7ECDC9, -0x5E6EB4B8,
     0x21BD6EDC,  0x015CD728, -0x6FD21BC6, -0x2E771DF4,
     0x506588B1, -0x23A5733B,  0x3CBA715C, -0x69775A34,
     0x30B6C28F, -0x51F70486, -0x368B2E7A, -0x56CB5271,
    -0x3D309DA1,  0x0F536C9D,  0x1C93703D, -0x0A364AA0,
    -0x6AECD062, -0x0981A5D7, -0x082FBEC9, -0x17C30835,
     0x4D115AE0, -0x2DEBE93C,  0x13A8BA71, -0x07ECCB79,
    -0x19C6C471,  0x0BCDD826,  0x3FB8E9C5, -0x3D7B903E,
     0x4E03537B,  0x6DFFB872,  0x01BF0E8E,  0x544DCB9E,
    -0x4914DD4D, -0x15F9DF11,  0x40C047D5,  0x1BD22050,
     0x2BD94524,  0x52371CB0,  0x70C3C483, -0x0CFD4793,
    -0x04A2997F,  0x63CD24A6, -0x3A46F6E0, -0x1F914724,
     0x535871FA, -0x3CA7386A, -0x18FF3A62, -0x16CE4509,
    -0x52815DD0,  0x6131D07B, -0x4CF35660, -0x64F4EEB6,
     0x7D3FD000, -0x4895B231,  0x77A7D5DA, -0x51B4C576,
    -0x5C766776,  0x73C30844,  0x3A5E50F0,  0x4EEEFB27,
     0x26F7C40F,  0x041CEC57, -0x7779F29E, -0x6E7D4DF0,
    -0x4E2C77F8, -0x7013239F,  0x4167F9FE, -0x78AEB8E4,
     0x53830A15, -0x3BC99684, -0x12F65FA3,  0x75445A9E,
     0x0BD6BA29,  0x1D8207DE,  0x1719D1EB, -0x48F2F261,
    -0x6F541277, -0x01ADDDE4,  0x2E7BDDF3, -0x3DF2F2BA,
    -0x1B7BABF4,  0x3D9FA4CF,  0x65F5D739, -0x327FC71E,
     0x2B6EB227, -0x722E93D6,  0x1D7F6C97, -0x5D9A87DA,
     0x48D36B44,  0x4EB92AF3,  0x57B0BF2E,  0x0BAE4C03,
    -0x4654AE1E,  0x44102E6A, -0x5F2E2970,  0x73297BB8,
     0x428B52F6, -0x4C0B5C6D,  0x100D1481,  0x1BB0747D,
    -0x2DE8A0DD,  0x5CE3B572, -0x3CBAC042, -0x7CEC249D,
     0x36552F2D, -0x1D42D85C,  0x5A009542,  0x6B51C7D6,
     0x0F62433F,  0x1545D1ED,  0x06046BA6,  0x057E254B,
    -0x79F8398D, -0x5F616CDB, -0x6EF82303, -0x3F042C6B,
     0x4FADA82B, -0x61ADD3E9, -0x10F5FE45,  0x466ADB62,
     0x6A3692AB, -0x6DAD793F, -0x2A33C4D8,  0x0FDC666A,
     0x2E34297D,  0x427DE782, -0x2B1AF721,  0x29CAD9B7,
     0x14021127, -0x00DE6952,  0x7900E0CA, -0x69B7665A,
    -0x33C1B565, -0x37F992EF, -0x0E4B55CC, -0x24FFFBF9,
     0x10245501, -0x268F3131, -0x4C81CDA1,  0x2F6515E7,
    -0x38B45BC6,  0x1DAE923C, -0x4E9DC8E1, -0x3351CF75,
    -0x1FC1264A,  0x049D6011, -0x765B86F9, -0x14F15EF8,
     0x7C805612,  0x3EB3EC90,  0x40286493, -0x1C4DB9F3,
    -0x24997006, -0x23F057F0,  0x01F4B9E9, -0x170618AD,
    -0x76A54627,  0x59FF666F,  0x5D4BCE97, -0x068B4ACB,
     0x53F834D1,  0x00925DF2, -0x6C0C2921,  0x691F81F2,
    -0x7A68AE87,  0x3CA3220C,  0x6217B90F, -0x6F98EAE7,
    -0x165C2217,  0x53EA0D8C, -0x2AB90AA6,  0x2963419C,
     0x0968FB8B, -0x0974754C, -0x63E0EC3C, -0x372AEDF1,
     0x38B5CC34,  0x49AAD8BF,  0x6B0F1E8E, -0x048D4877,
    -0x19209DF3, -0x3E874EBA, -0x2B414A51, -0x69206A46,
    -0x53537D45,  0x6D4B6618,  0x358F1CD8, -0x680BFE62,
    -0x556650A6,  0x2830E5F6,  0x1FCFE57D,  0x3EC5305F,
    -0x5CFBF447,  0x278125B5, -0x3B016197, -0x4518311F,
     0x5FB37865,  0x71FB8E50, -0x0F4BEBA5,  0x0A72C372,
    -0x2FBC6A0A, -0x3E2C42A1,  0x01B2992A,  0x774DA929,
    -0x790D09D2,  0x41534476,  0x668BE3F9,  0x3D386867,
    -0x29B4C1A7, -0x4B913412,  0x2374EBE8, -0x2DEF7BF5,
     0x5A36727C, -0x7B20D763, -0x254E9C26,  0x51E09AC2,
     0x28E427C7,  0x2C3FDCE9, -0x26D9C845, -0x6BD87EF2,
     0x5124F7D5, -0x6A587D2D, -0x517C682A,  0x67E9A268,
     0x2B8EC335, -0x32B8599C, -0x4163F153,  0x68FCF818,
    -0x29E6BA49, -0x59746D02,  0x615531E3,  0x05153D2E,
    -0x6E7394F9, -0x41CC81DE,  0x05BC49A4,  0x2A17C523,
     0x4A53020E,  0x66F9B117, -0x284766DF,  0x072785AB,
    -0x04CBD25F, -0x0FD0EB08,  0x6ADFAD8B, -0x790333D9,
     0x476529EF, -0x181C584E, -0x110FD2E2, -0x220EE1BA,
    -0x257F21BC, -0x5CFF9199,  0x6068CDB5, -0x34A637B2,
     0x1ADFBD8D, -0x360ABC48,  0x4ABBBE61, -0x05696576,
    -0x752A94DA,  0x2E581C80, -0x7F53D272,  0x026A5065,
    -0x7ABD448A, -0x62F2C894,  0x67495631, -0x6BEDD750,
    -0x4CE79237,  0x076DB606,  0x3C079D7B,  0x499B228A,
    -0x3FD4B6FB, -0x6E11D15A, -0x1A82C764, -0x6A018989,
    -0x1706096D,  0x0CCF94CA, -0x38BD1DF9,  0x6575AB1D,
    -0x4B3ED5DE,  0x513B2958,  0x1A6A20C4, -0x2A661DD3,
    -0x757B5C59,  0x037EC54E,  0x4C299049, -0x62412E0F,
     0x7C656C31,  0x34A9174E, -0x1FEE3BA0, -0x6EF11FFB,
    -0x1F150F03,  0x6D424CA4,  0x5873308E, -0x2E1A0146,
     0x269F5C54, -0x5E8A54D7, -0x5B9D6674,  0x1FF69FA3,
     0x7D96C8BA, -0x7EC06A70, -0x72275EC0, -0x2F5B993E,
    -0x4EB14925, -0x4AE0855B, -0x4A882F36, -0x13D90412,
    -0x258AAA37,  0x7CCB33E7, -0x728C48F1, -0x10176C2D,
     0x4A131800,  0x2D5C5119, -0x29EC66AE, -0x515260DD,
     0x3B8913B3,  0x2487D52F,  0x2C5F1F57, -0x1D0AD393,
    -0x30FD511E, -0x74B22ECF,  0x0A63A291, -0x24DF8FE1,
    -0x374AE149, -0x6E4C7E82, -0x1F668432, -0x2E2DFFCF,
    -0x716ED44B,  0x7EF645F8, -0x5A082006,  0x631D38F5,
    -0x0D3537DE,  0x33C50F9E,  0x6F17CC63, -0x4D18B16A,
     0x3FC3F445, -0x750A41F2, -0x67FA7DF7, -0x58EB7045,

     0x0BD967E7,  0x1B3EE06B, -0x22D3F58F, -0x2212B02A,
     0x4B9794A4, -0x138A95CF,  0x07E6448D, -0x52B3FD65,
     0x30BE697A,  0x7FC4D572, -0x63D9F4E2, -0x19F6FEE0,
     0x46BA6D2A, -0x3796D008,  0x11D2E02F, -0x62D880DB
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
        /* Generate twiddle factors                                             */
        /* -------------------------------------------------------------------- */
        gen_twiddle_fft32x32(&w[0][PAD], j, 2147483647.5);

        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_cn, x, sizeof(x_cn));
        memcpy(x_i, x, sizeof(x_i));
        memcpy(x_sa, x, sizeof(x_sa));

        /* -------------------------------------------------------------------- */
        /*  Force uninitialized arrays to fixed values.                         */
        /* -------------------------------------------------------------------- */
        memset(y_cn, 0xA5, sizeof(y_cn));
        memset(y_i, 0xA5, sizeof(y_i));
        memset(y_sa, 0xA5, sizeof(y_sa));

        printf("DSP_fft32x32\tIter#: %d\t", k);

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

        printf("DSP_fft32x32\tIter#: %d\t", k);

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
    DSP_fft32x32_cn(&w[cur_input][PAD], n, &x_cn[cur_input][PAD], &y_cn[cur_input][PAD]);
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
    DSP_fft32x32_i(&w[cur_input][PAD], n, &x_i[cur_input][PAD], &y_i[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return  t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_SA   -- Measure elapsed time for intrinsic C version.              */
/* ======================================================================== */
clock_t time_sa(int cur_input, int n)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_fft32x32(&w[cur_input][PAD], n, &x_sa[cur_input][PAD], &y_sa[cur_input][PAD]);
    t_stop  = _itoll(TSCH, TSCL);
    return  t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_fft32x32_d.c                                          */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


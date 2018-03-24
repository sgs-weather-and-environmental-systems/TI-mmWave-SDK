/* ======================================================================= */
/* DSP_blk_eswap32_d.c -- Endian-swap a block of 32-bit values             */
/*                        Driver code implementation                       */
/*                                                                         */
/* Rev 0.0.1                                                               */
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
#include <c6x.h>

#include "DSP_blk_eswap32_cn.h"
#include "DSP_blk_eswap32.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        2
#define CYCLE_FORMULA_NX_PT1  64
#define CYCLE_FORMULA_NX_PT2  128
/* inverse of [ 64 1] */
/*            [128 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0156,  0.0156},
 { 2.0000, -1.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================== */
/*  Parameters of fixed dataset.                                            */
/* ======================================================================== */
#define NX (128)
#define PAD (16)

/* ======================================================================== */
/*  Initialized arrays with fixed test data.                                */
/* ======================================================================== */
unsigned x[NX + 2*PAD] =
{
     0x832C4F88,  0x2BB3397E,  0x1563465E,  0x89C4A5C4,
     0xD226A050,  0xEA85669B,  0xEEDEDDAC,  0x94635B33,
     0x6A76FA20,  0xF5BC68C7,  0xF40751C1,  0x960BF451,
     0x71EA921E,  0x407E3C7A,  0xDF6D5B61,  0x2985B218,

     0xC53E573A,  0x4DE309A6,  0xADBBF03B,  0xF7C76EAC,
     0x284722DD,  0x35234BCD,  0x90B732FD,  0x6EC1DCE5,
     0x656E2075,  0xFCA79A3D,  0xCA147927,  0xF19DFC7A,
     0xBE617A86,  0x985824C7,  0x72B418F6,  0xBD94A3C8,
     0x4D48AF4A,  0x6B4E7190,  0x9B6A2141,  0xFA1D60A5,
     0x8D5B9079,  0x9D2C8E4A,  0xD5D8E598,  0x2BA7B043,
     0xD0306C5A,  0x23432D7A,  0x81805A86,  0x859BBB8E,
     0xCD9744AB,  0xC9E3E311,  0xE8A42A4D,  0x49D78909,
     0x055B9F85,  0x27D20806,  0x9D05A0EA,  0xBA65FB98,
     0x38CCDEBC,  0xBD6B5C34,  0x131D28C9,  0xCA99673A,
     0x9D549AF6,  0x2F4C0D24,  0xE2F5A0F4,  0x0A59251B,
     0x1506F2EB,  0xDD262B11,  0xBC1A2818,  0x06C3F407,
     0x1B6D4F04,  0xC2822AC3,  0x7FE0BC3C,  0x9BE081AD,
     0x9A7F96E5,  0xE21B8594,  0x637A3182,  0x5AB2E9AB,
     0x6D0536F2,  0x31A52043,  0xB409F4C1,  0xA23EA2D9,
     0xB8560C7C,  0x3E877EDA,  0x1F371D5C,  0x6FD482D1,
     0xDEB6A494,  0x76855B53,  0xFA6E2C28,  0x94505728,
     0x3E33B838,  0x6CC6D43E,  0x835815B4,  0x5989DE4D,
     0x746076D4,  0xE732A221,  0x99A5D6D7,  0x369F6F91,
     0x61B982CB,  0x19A98CBA,  0xD7C662D5,  0x9E70393E,
     0x9F12220F,  0xD9F9A8F5,  0x93A4F5ED,  0x96D9684B,
     0xA6E69863,  0x302077B1,  0xB9FAABB8,  0x150C068D,
     0x57D72161,  0x18C18527,  0xF460831E,  0xD7A6FAF7,
     0x244C87DE,  0xC24C9616,  0x1F98844D,  0xACC9EDC9,
     0x8F61C7BF,  0x3FD00377,  0x7F533F72,  0xEAE18035,
     0xC53E573A,  0x4DE309A6,  0xADBBF03B,  0xF7C76EAC,
     0x284722DD,  0x35234BCD,  0x90B732FD,  0x6EC1DCE5,
     0x656E2075,  0xFCA79A3D,  0xCA147927,  0xF19DFC7A,
     0xBE617A86,  0x985824C7,  0x72B418F6,  0xBD94A3C8,
     0x4D48AF4A,  0x6B4E7190,  0x9B6A2141,  0xFA1D60A5,
     0x8D5B9079,  0x9D2C8E4A,  0xD5D8E598,  0x2BA7B043,
     0xD0306C5A,  0x23432D7A,  0x81805A86,  0x859BBB8E,

     0x302DC0DC,  0xD6ED5AF3,  0xAFDA6CA7,  0x0A649F6C,
     0x0D916900,  0xF8E3D6C3,  0xC2DFCED9,  0x1C2D468E,
     0x607874B1,  0x0E30CC4E,  0x87E82006,  0x12B69B72,
     0xA1E5F1BD,  0x13B3A81D,  0x7F8E42AC,  0x8EEEB1C4
};

unsigned x_cn[NX + 2*PAD];
unsigned x_i[NX + 2*PAD];

unsigned r_cn[NX + 2*PAD];
unsigned r_i[NX + 2*PAD];

/* ======================================================================== */
/*  Generate pointers to skip beyond array padding                          */
/* ======================================================================== */
unsigned *const ptr_x_cn = x_cn + PAD;
unsigned *const ptr_r_cn = r_cn + PAD;

unsigned *const ptr_x_i = x_i + PAD;
unsigned *const ptr_r_i = r_i + PAD;

/* ======================================================================== */
/*  Prototypes for timing functions.                                        */
/* ======================================================================== */
clock_t time_cn(int nx);
clock_t time_i(int nx);

/* ======================================================================== */
/*  MAIN -- Top level driver for the test.                                  */
/* ======================================================================== */
int main()
{   
    clock_t t_overhead, t_start, t_stop;
    clock_t t_cn, t_i;
    int i, j, nx, fail = 0;
    int form_error = 0;

    /* -------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info.   */
    /* -------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    for(nx = 4, i = 1; nx <= NX; i++, nx += 4) {
        /* -------------------------------------------------------------------- */
        /*  Copy vector to all inputs.                                          */
        /* -------------------------------------------------------------------- */
        memcpy(x_cn, x, sizeof(x_cn));
        memcpy(x_i, x, sizeof(x_i));

        /* -------------------------------------------------------------------- */
        /*  Force uninitialized arrays to fixed values.                         */
        /* -------------------------------------------------------------------- */
        memset(r_cn, 0xA5, sizeof(r_cn));
        memset(r_i, 0xA5, sizeof(r_i));

        /* -------------------------------------------------------------------- */
        /*  Call the individual timing routines, and subtract off overhead.     */
        /* -------------------------------------------------------------------- */
        t_cn = time_cn(nx) - t_overhead;
        t_i = time_i(nx) - t_overhead;

        /* -------------------------------------------------------------------- */
        /*  Print timing results.                                               */
        /* -------------------------------------------------------------------- */
        printf("DSP_blk_eswap32\tIter#: %d\t", i);

        /* -------------------------------------------------------------------- */
        /*  Check the results arrays, and report any failures.                  */
        /* -------------------------------------------------------------------- */
        if (memcmp(x_i, x_cn, sizeof(x_cn))) {
            fail++;
            printf("Result Failure (x_i)\t");
        }
        else
            printf("Result Succesfull (x_i)\t");
        if (memcmp(r_i, r_cn, sizeof(r_cn))) {
            fail++;
            printf("Result Failure (r_i)");
        }
        else
            printf("Result Succesfull (r_i)");

        printf("\tNX = %d\tnatC: %d\tintC: %d\n", nx, t_cn, t_i);

        if (nx == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = t_i;
        if (nx == CYCLE_FORMULA_NX_PT2)
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
      printf("Cycles:  %d/%d*n_words + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
    else
      printf("Cycles Formula Not Available\n");

    return (fail);
}

/* ======================================================================== */
/*  TIME_CN  -- Measure elapsed time for natural C version.                 */
/* ======================================================================== */
clock_t time_cn(int nx)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_blk_eswap32_cn(ptr_x_cn, ptr_r_cn, nx);
    t_stop = _itoll(TSCH, TSCL);
    DSP_blk_eswap32_cn(ptr_x_cn, NULL, nx);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  TIME_I   -- Measure elapsed time for intrinsic C version.               */
/* ======================================================================== */
clock_t time_i(int nx)
{
    clock_t t_start, t_stop;

    t_start = _itoll(TSCH, TSCL);
    DSP_blk_eswap32(ptr_x_i, ptr_r_i, nx);
    t_stop = _itoll(TSCH, TSCL);
    DSP_blk_eswap32(ptr_x_i, NULL, nx);
    return t_stop - t_start;
}

/* ======================================================================== */
/*  End of file:  DSP_blk_eswap32_d.c                                       */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


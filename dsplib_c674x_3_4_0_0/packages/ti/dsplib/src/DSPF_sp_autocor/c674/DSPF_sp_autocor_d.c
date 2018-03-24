/* ======================================================================= */
/* DSPF_sp_autocor_d.c -- Autocorrelation                                  */
/*                Driver code; tests kernel and reports result in stdout   */
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

/* ======================================================================= */
/* Interface header files for the natural C and optimized C code           */
/* ======================================================================= */
#include "DSPF_sp_autocor_cn.h"
#include "DSPF_sp_autocor.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;
#define FORMULA_SIZE          4
#define FORMULA_DEVIDE        8
#define CYCLE_FORMULA_NX_PT1  128
#define CYCLE_FORMULA_NX_PT2  120
#define CYCLE_FORMULA_NR_PT1  64
#define CYCLE_FORMULA_NR_PT2  56

/* inverse of [128*64 128 64 1] */
/*            [128*56 128 56 1] */
/*            [120*64 120 64 1] */
/*            [120*56 120 56 1] */

float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{  0.0156,   -0.0156,   -0.0156,    0.0156},
 { -0.8750,    1.0000,    0.8750,   -1.0000},
 { -1.8750,    1.8750,    2.0000,   -2.0000},
 {105.0000, -120.0000, -112.0000,  128.0000}
};

float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

/* ======================================================================= */
/* Tell compiler arrays are double word alligned                           */
/* ======================================================================= */
#pragma DATA_ALIGN(ptr_r_opt, 8);
#pragma DATA_ALIGN(ptr_r_cn, 8);
#pragma DATA_ALIGN(ptr_x, 8);

/* ======================================================================= */
/* Parameters of fixed dataset                                             */
/* ======================================================================= */
#define Nx (128)
#define Nr (64)

float ptr_r_cn[Nr], ptr_r_opt[Nr];

/* ======================================================================= */
/* Initilized arrays with fixed test data                                  */
/* ======================================================================= */
float ptr_x[] =
{
    324.16, -200.68, -831.94, 959.62, 888.1, -39, -391.87, 952.36,
    -227.69, 439.72, 583.66, -881.85, -88.45, 535.32, 149.38, -223.34,
    887, 443.15, -155.45, 312.63, -40.78, 134.15, 811.87, 860.45,
    -211.29, -482.92, 355.51, 529.46, 175.47, 785.94, 585.79, -99.81,
    651.78, 297.56, 770.7, 677.29, -920.89, -75.84, 764.46, -304.12,
    -90.94, -288.96, 500.39, -845.18, -372.06, 696.69, -706.96, -207.30,
    -771.65, -693.89, 253.77, 905.67, 188.67, 933.19, 563.74, -698.18,
    329.59, -47.38, -519.24, 352, -157.99, 116.35, 735.9, 541.91,
    -146.96, -193.83, 342.1, -992.31, 488.07, 227.58, -0.68, -923.22,
    -661.69, -861.4, -64.86, -891.34, -459.22, 937.63, 298.54, 824.47,
    470.98, 385.18, -404.69, 359.09, -905.81, -622.45, 616.76, -894.78,
    784.99, -141.52, -328.26, -272.77, -736.1, 684.99, 794.64, -968.34,
    -628.65, -731.06, 630.33, 703.05, 647.12, 50.59, -636.61, 339.14,
    -505.21, 364.63, 554.09, -531.53, 202.41, 435.14, -144.73, 634.79,
    -99.51, 135.94, -755.28, 667.89, -600.36, -826.65, -611.12, 506.76,
    -382.74, -687.1, -633.31, 206.67, 612.78, -907.75, -653.86, -497.63,
    -301.45, -85.75, -573.46, 953.26, -773.03, 878.1, -20, 190.02,
    979.65, 879.2, 547.04, 197.64, -6.54, 670.2, -155.77, -548.84,
    134.54, 512.81, 293.08, -300.83, -481.2, -161.51, 472.18, 899.36,
    -274.2, 878.41, -908.02, 953.51, 990.33, -345.05, 318.73, 947.04,
    -793.66, 593.53, -375.32, -697.78, -823.9, 68.56, -892.8, -727.79,
    -647.45, 3, -288.69, -228.64, 725.2, 862.01, -30.49, 927.49,
    630.78, 998.08, -75.95, 553.37, 131.47, -264.14, 515.05, -403.37,
    213.07, -212.57, 573.69, -387.15, 270.03, -76.71, 862.3, -115.91
};

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_opt(int nx, int nr);
clock_t time_cn(int nx, int nr);

/* ======================================================================= */
/* Main -- Top level driver for testing the algorithm                      */
/* ======================================================================= */
void main()
{
    clock_t t_overhead, t_start, t_stop, t_opt, t_cn;
    float pct_diff, max_pct_diff = 0;
    int form_error = 0;
    int i, j=1, nx, nr;

    /* ------------------------------------------------------------------- */
    /* Compute the overhead of calling clock twice to get timing info      */
    /* ------------------------------------------------------------------- */
    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    t_start = _itoll(TSCH, TSCL);
    t_stop = _itoll(TSCH, TSCL);
    t_overhead = t_stop - t_start;

    /* ------------------------------------------------------------------- */
    /*  Clear autocor buffers with fixed values.                           */
    /* ------------------------------------------------------------------- */
    for(nx = 72; nx <= Nx; nx += 8) {
      for(nr = 4; nr <= Nr; nr += 4) {
        memset(ptr_r_opt, 0, sizeof(ptr_r_opt));
        memset(ptr_r_cn, 0, sizeof(ptr_r_cn));

        /* --------------------------------------------------------------- */
        /* Call the individual timing routines                             */
        /* --------------------------------------------------------------- */
        t_opt = time_opt(nx, nr) - t_overhead;
        t_cn  = time_cn(nx, nr)- t_overhead;

        printf("DSPF_sp_autocor\tIter#: %d\t", j++);

        /* --------------------------------------------------------------- */
        /* compute percent difference and track max difference             */
        /* --------------------------------------------------------------- */
        for (i = 0; i < nr; i++) {           
            pct_diff = (ptr_r_cn[i] - ptr_r_opt[i]) / ptr_r_cn[i] * 100.0;
            if (pct_diff < 0) pct_diff *= -1;
            if (pct_diff > max_pct_diff) max_pct_diff = pct_diff;
        }    
        if (max_pct_diff > 0.02)
            printf("Result Failure, max_pct_diff=%f", max_pct_diff);
        else
            printf("Result Successful ");
        
        /* --------------------------------------------------------------- */
        /* Print timing results                                            */
        /* --------------------------------------------------------------- */
        printf("\tNX = %d\tNR = %d\tnatC: %d\toptC: %d\n", nx, nr, t_cn, t_opt);
    
        if (nx == CYCLE_FORMULA_NX_PT1 && nr == CYCLE_FORMULA_NR_PT1)
            form_cycle[0] = t_opt;
        if (nx == CYCLE_FORMULA_NX_PT1 && nr == CYCLE_FORMULA_NR_PT2)
            form_cycle[1] = t_opt;
        if (nx == CYCLE_FORMULA_NX_PT2 && nr == CYCLE_FORMULA_NR_PT1)
            form_cycle[2] = t_opt;
        if (nx == CYCLE_FORMULA_NX_PT2 && nr == CYCLE_FORMULA_NR_PT2)
            form_cycle[3] = t_opt;
      }
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

    if (!form_error) {
        printf("Cycles:  ");
        if (form_result[0])
          printf("%d/%d*Nx*Nr + ", form_result[0], FORMULA_DEVIDE);
        if (form_result[1])
          printf("%d/%d*Nx + ", form_result[1], FORMULA_DEVIDE);
        if (form_result[2])
          printf("%d/%d*Nr + ", form_result[2], FORMULA_DEVIDE);
        if (form_result[3])
          printf("%d\n", form_result[3]);
    }
    else
        printf("Cycles Formula Not Available\n");
}

/* ======================================================================= */
/* Prototypes for timing functions                                         */
/* ======================================================================= */
clock_t time_cn(int nx, int nr)
{
    clock_t t_start, t_stop;

    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_autocor_cn(ptr_r_cn, ptr_x, nx, nr);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

clock_t time_opt(int nx, int nr)
{
    clock_t t_start, t_stop;
    
    /* ------------------------------------------------------------------- */
    /* Measure the cycle count                                             */
    /* ------------------------------------------------------------------- */
    t_start = _itoll(TSCH, TSCL);
    DSPF_sp_autocor(ptr_r_opt, ptr_x, nx, nr);
    t_stop = _itoll(TSCH, TSCL);

    return t_stop - t_start;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_autocor_d.c                                      */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


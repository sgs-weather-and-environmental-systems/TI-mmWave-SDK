/* ======================================================================= */
/* fft_example.c -- FFT Example File                                       */
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
/*        This example demonstrates the usage of the various FFT kernels   */
/*        provided with the C6x DSPLIB. The example shows:                 */
/*        - Twiddle factor generation for the various kernels              */
/*        - Scaling that needs to be applied to get similar output         */
/*          when using different kernels                                   */
/*        - Demonstrates the usage of FFT APIs                             */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

#include <stdint.h>
#include <math.h>
#include <ti/dsplib/dsplib.h>

#include "gen_twiddle_fft16x16.h"
#include "gen_twiddle_fft16x32.h"
#include "gen_twiddle_fft32x32.h"

/* Global definitions */
/* Number of samples for which FFT needs to be calculated */
#define N 256 
/* Number of unique sine waves in input data */
#define NUM_SIN_WAVES 4

/* 
    Scale need to be applied (1/2^SCALE) to input data for 16x32 and 32x32
    FFT for their output to match 16x16. This is dure to the inherent 
    scaling present in 16x16 kernel
*/
#define SCALE    3     


/* Align the tables that we have to use */
#pragma DATA_ALIGN(x_ref, 8);
int32_t x_ref [2*N];

#pragma DATA_ALIGN(x_16x16, 8);
int16_t x_16x16 [2*N];
#pragma DATA_ALIGN(y_16x16, 8);
int16_t y_16x16 [2*N];
#pragma DATA_ALIGN(w_16x16, 8);
int16_t w_16x16 [2*N];

#pragma DATA_ALIGN(x_16x32, 8);
int32_t x_16x32 [2*N];
#pragma DATA_ALIGN(y_16x32, 8);
int32_t y_16x32 [2*N];
#pragma DATA_ALIGN(w_16x32, 8);
int16_t w_16x32 [2*N];

#pragma DATA_ALIGN(x_32x32, 8);
int32_t x_32x32 [2*N];
#pragma DATA_ALIGN(y_32x32, 8);
int32_t y_32x32 [2*N];
#pragma DATA_ALIGN(w_32x32, 8);
int32_t w_32x32 [2*N];

/*  
    This function generates the input data and also updates the 
    input data arrays used by the various FFT kernels
*/
float x_ref_float [2*N];
void generateInput (int32_t numSinWaves) {
    int32_t i, j;
    float sinWaveIncFreq, sinWaveMag;

    /* 
        Based on numSinWave information, create the input data. The
        input data is first created using floating point dataType. The
        floating point data type is then converted to the appropriate
        fixed point notation
    */
    /* Clear the input floating point array */
    for (i = 0; i < N; i++) {
        x_ref_float[2*i] = (float)0.0;      
        x_ref_float[2*i + 1] = (float)0.0;  
    }

    /* Calculate the incremental freq for each sin wave */
    sinWaveIncFreq = ((float)3.142)/(numSinWaves*(float)1.0);

    /* Calculate the magnitude for each sin wave */
    sinWaveMag = (float)1.0/(numSinWaves * (float)1.0*N);

    /* Create the input array as sum of the various sin wave data */
    for (j = 0; j < numSinWaves; j++) {
        for (i = 0; i < N; i++) {
            x_ref_float[2*i] += sinWaveMag * (float)cos(sinWaveIncFreq*j*i);        
            x_ref_float[2*i + 1] = (float) 0.0;
        } 
    }
        
    /* Convert the floating point data to reference fixed point data */ 
    for (i = 0; i < N; i++) {
        x_ref[2*i] = x_ref_float[2*i] * 2147483648;     
        x_ref[2*i + 1] = x_ref_float[2*i + 1] * 2147483648;
    }
    
    /* Copy the reference input data to the various input arrays */     
    for (i = 0; i < N; i++) {
        x_16x16[2*i] = (x_ref[2*i] >> 16);      
        x_16x16[2*i + 1] = (x_ref[2*i + 1] >> 16);

        x_16x32[2*i] = x_ref[2*i] >> SCALE;     
        x_16x32[2*i + 1] = x_ref[2*i + 1] >> SCALE;

        x_32x32[2*i] = x_ref[2*i] >> SCALE;     
        x_32x32[2*i + 1] = x_ref[2*i + 1] >> SCALE;
    }
}

/* 
    The seperateRealImg function seperates the real and imaginary data
    of the FFT output. This is needed so that the data can be plotted
    using the CCS graph feature
*/

int16_t y_real_16x16  [N];
int16_t y_imag_16x16  [N];

int32_t y_real_16x32  [N];
int32_t y_imag_16x32  [N];

int32_t y_real_32x32  [N];
int32_t y_imag_32x32  [N];

seperateRealImg () {
    int32_t i, j;

    for (i = 0, j = 0; j < N; i+=2, j++) {
        y_real_16x16[j] = y_16x16[i];
        y_imag_16x16[j] = y_16x16[i + 1];

        y_real_16x32[j] = y_16x32[i];
        y_imag_16x32[j] = y_16x32[i + 1];

        y_real_32x32[j] = y_32x32[i];
        y_imag_32x32[j] = y_32x32[i + 1];
    }
}

/*
    The main function that implements the example functionality.
    This example demonstrates the usage of the various FFT kernels provided 
    with the C6x DSPLIB. The example shows:
        - Twiddle factor generation for the various kernels
        - Needed scaling to get correct output
        - Demonstrates usage of FFT APIs
*/

void main () {
    /* Generate the input data */
    generateInput (NUM_SIN_WAVES);
    
    /* Genarate the various twiddle factors */
    gen_twiddle_fft16x16(w_16x16, N);
    gen_twiddle_fft16x32(w_16x32, N);
    gen_twiddle_fft32x32(w_32x32, N, 2147483647.5);

    /* Call the various FFT routines */
    DSP_fft16x16(w_16x16, N, x_16x16, y_16x16);
    DSP_fft16x32(w_16x32, N, x_16x32, y_16x32);
    DSP_fft32x32(w_32x32, N, x_32x32, y_32x32);

    /* Call the test code to seperate the real and imaginary data */
    seperateRealImg ();
}

/* ======================================================================== */
/*  End of file:  fft_example.c                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */


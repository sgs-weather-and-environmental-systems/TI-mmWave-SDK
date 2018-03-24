/* ======================================================================= */
/* fft_sp_example.c -- FFT Example File                                    */
/*                                                                         */
/*        This example demonstrates the usage of the various FFT kernels   */
/*        provided with the C6x DSPLIB. The example shows:                 */
/*        - Twiddle factor generation for the various kernels              */
/*        - Scaling that needs to be applied to get similar output         */
/*          when using different kernels                                   */
/*        - Demonstrates the usage of FFT APIs                             */
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
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

#include <stdint.h>
#include <math.h>
#include <ti/dsplib/dsplib.h>

/* Global definitions */
/* Number of samples for which FFT needs to be calculated */
#define N 256 
/* Number of unique sine waves in input data */
#define NUM_SIN_WAVES 4

/* Align the tables that we have to use */
#pragma DATA_ALIGN(x_ref, 8);
float   x_ref [2*N];

#pragma DATA_ALIGN(x_sp, 8);
float   x_sp [2*N];
#pragma DATA_ALIGN(y_sp, 8);
float   y_sp [2*N];
#pragma DATA_ALIGN(w_sp, 8);
float   w_sp [2*N];

unsigned char brev[64] = {
    0x0, 0x20, 0x10, 0x30, 0x8, 0x28, 0x18, 0x38,
    0x4, 0x24, 0x14, 0x34, 0xc, 0x2c, 0x1c, 0x3c,
    0x2, 0x22, 0x12, 0x32, 0xa, 0x2a, 0x1a, 0x3a,
    0x6, 0x26, 0x16, 0x36, 0xe, 0x2e, 0x1e, 0x3e,
    0x1, 0x21, 0x11, 0x31, 0x9, 0x29, 0x19, 0x39,
    0x5, 0x25, 0x15, 0x35, 0xd, 0x2d, 0x1d, 0x3d,
    0x3, 0x23, 0x13, 0x33, 0xb, 0x2b, 0x1b, 0x3b,
    0x7, 0x27, 0x17, 0x37, 0xf, 0x2f, 0x1f, 0x3f
};

/*  
    This function generates the input data and also updates the 
    input data arrays used by the various FFT kernels
*/
void generateInput (int numSinWaves) {
    int   i, j;
    float sinWaveIncFreq, sinWaveMag;

    /* 
        Based on numSinWave information, create the input data. The
        input data is first created using floating point dataType. The
        floating point data type is then converted to the appropriate
        fixed point notation
    */

    /* Clear the input floating point array */
    for (i = 0; i < N; i++) {
        x_ref[2*i]   = (float)0.0;      
        x_ref[2*i+1] = (float)0.0;  
    }

    /* Calculate the incremental freq for each sin wave */
    sinWaveIncFreq = ((float)3.142)/(numSinWaves*(float)1.0);

    /* Calculate the magnitude for each sin wave */
    sinWaveMag = (float)1.0/(numSinWaves * (float)1.0*N);

    /* Create the input array as sum of the various sin wave data */
    for (j = 0; j < numSinWaves; j++) {
        for (i = 0; i < N; i++) {
            x_ref[2*i]  += sinWaveMag * (float)cos(sinWaveIncFreq*j*i);        
            x_ref[2*i+1] = (float) 0.0;
        } 
    }
        
    /* Copy the reference input data to the various input arrays */     
    for (i = 0; i < N; i++) {
        x_sp [2*i]   = x_ref[2*i];
        x_sp [2*i+1] = x_ref[2*i+1];
    }
}

/* 
    The seperateRealImg function seperates the real and imaginary data
    of the FFT output. This is needed so that the data can be plotted
    using the CCS graph feature
*/

float y_real_sp [N];
float y_imag_sp [N];

seperateRealImg () {
    int i, j;

    for (i = 0, j = 0; j < N; i+=2, j++) {
        y_real_sp[j] = y_sp[i];
        y_imag_sp[j] = y_sp[i + 1];
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

/* Function for generating Specialized sequence of twiddle factors */
void gen_twiddle_fft_sp (float *w, int n)
{
    int i, j, k;
    double x_t, y_t, theta1, theta2, theta3;
    const double PI = 3.141592654;

    for (j = 1, k = 0; j <= n >> 2; j = j << 2)
    {
        for (i = 0; i < n >> 2; i += j)
        {
            theta1 = 2 * PI * i / n;
            x_t = cos (theta1);
            y_t = sin (theta1);
            w[k] = (float) x_t;
            w[k + 1] = (float) y_t;

            theta2 = 4 * PI * i / n;
            x_t = cos (theta2);
            y_t = sin (theta2);
            w[k + 2] = (float) x_t;
            w[k + 3] = (float) y_t;

            theta3 = 6 * PI * i / n;
            x_t = cos (theta3);
            y_t = sin (theta3);
            w[k + 4] = (float) x_t;
            w[k + 5] = (float) y_t;
            k += 6;
        }
    }
}

void main () {
    /* Generate the input data */
    generateInput (NUM_SIN_WAVES);
    
    /* Genarate twiddle factors */
    gen_twiddle_fft_sp(w_sp, N);

    /* Call FFT routine */
    DSPF_sp_fftSPxSP(N, x_sp, w_sp, y_sp, brev, 4, 0, N);

    /* Call the test code to seperate the real and imaginary data */
    seperateRealImg ();
}

/* ======================================================================== */
/*  End of file:  fft_example.c                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */


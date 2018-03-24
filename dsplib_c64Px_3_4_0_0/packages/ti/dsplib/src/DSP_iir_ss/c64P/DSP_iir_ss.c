/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  DSPLIB  DSP Signal Processing Library                                  */
/*                                                                         */
/*  This library contains proprietary intellectual property of Texas       */
/*  Instruments, Inc.  The library and its source code are protected by    */
/*  various copyrights, and portions may also be protected by patents or   */
/*  other legal protections.                                               */
/*                                                                         */
/*  This software is licensed for use with Texas Instruments TMS320        */
/*  family DSPs.  This license was provided to you prior to installing     */
/*  the software.  You may review this license by consulting the file      */
/*  TI_license.PDF which accompanies the files in this library.            */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/* DSP_iir_ss.c -- IIR Filter                                              */
/*              Optimized C Implementation (w/ Intrinsics)                 */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_iir_ss (                                                   */
/*         short                 Input,                                    */
/*         const short *restrict ptr_Coefs,                                */
/*         int                   nCoefs,                                   */
/*         short       *restrict ptr_State                                 */
/*     )                                                                   */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      This function implements an IIR filter, with a number of biquad    */
/*      stages given by nCoefs / 4. It accepts a single sample of          */
/*      input and returns a single sample of output. Coefficients are      */
/*      expected to be in the range [-2.0, 2.0) with Q14 precision.        */
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

#pragma CODE_SECTION(DSP_iir_ss, ".text:optimized");

#include "DSP_iir_ss.h"

#ifdef _LITTLE_ENDIAN

short DSP_iir_ss (
    short                 Input, 
    const short *restrict Coefs, 
    int                   nCoefs, 
    short       *restrict State 
) 
{
    int j, x, t_0, t_1, p_0, p_1, p_2, p_3;
    
    int temp_1, temp_2;

    int s_32, s_10;

    long long c_7654;    
    long long c_3210;
    long long s_3210;

    /* -------------------------------------------------------------------- */
    /*  Initialize our starting state.                                      */
    /* -------------------------------------------------------------------- */
    x = Input;

    /* -------------------------------------------------------------------- */
    /*  Inform the compiler about various alignments, etc.                  */
    /* -------------------------------------------------------------------- */
    _nassert((int)Coefs % 8 == 0);
    _nassert((int)State % 8 == 0);
    _nassert((int)nCoefs % 4 == 0);
    _nassert((int)nCoefs >= 4);

    /* -------------------------------------------------------------------- */
    /*  Iterate over the biquads, processing two per iteration.             */
    /* -------------------------------------------------------------------- */
    for (j = 0; j < nCoefs; j += 8) {
           
        c_3210 = _amem8_const(&Coefs[j]);
        s_3210 = _amem8(&State[j]);
        c_7654 = _amem8_const(&Coefs[j + 4]);
     
        s_10 = _loll(s_3210);
        s_32 = _hill(s_3210);
                
        p_0 = _dotp2(_hill(c_3210), s_10);
        p_1 = _dotp2(_loll(c_3210), s_10);        
     
        p_2 = _dotp2(_hill(c_7654), s_32);
        p_3 = _dotp2(_loll(c_7654), s_32);
       
        t_0 = x + (p_0 >> 14);
        x += ((p_0 + p_1) >> 14);

        t_1 = x + (p_2 >> 14);
        x += ((p_2 + p_3) >> 14);

        /*-----------------------------------------------------------*/
        /*   Use of temp_1 and temp_2 cuts back a cross-path         */
        /*-----------------------------------------------------------*/             
        temp_1 = _pack2(s_32, t_1);
        temp_2 = _pack2(s_10, t_0);

        if (j < nCoefs - 4)
        {
            _mem8(&State[j]) = _itoll(temp_1, temp_2);
        }
        else
        {
            State[j] = _pack2(s_10, t_0);        
        }
         
    }
    return x;
}

/*-----------------------------------------------------------*/
/*  Big Endian version                                       */
/*-----------------------------------------------------------*/
#else
short DSP_iir_ss (
    short                 Input, 
    const short *restrict Coefs, 
    int                   nCoefs, 
    short       *restrict State 
) 
{
    int j, x, t_0, t_1, p_0, p_1, p_2, p_3;
    
    int temp_1, temp_2;

    int s_01, s_23;

    long long c_4567;    
    long long c_0123;
    long long s_0123;


    /* -------------------------------------------------------------------- */
    /*  Initialize our starting state.                                      */
    /* -------------------------------------------------------------------- */
    x = Input;

    /* -------------------------------------------------------------------- */
    /*  Inform the compiler about various alignments, etc.                  */
    /* -------------------------------------------------------------------- */
    _nassert((int)Coefs % 8 == 0);
    _nassert((int)State % 8 == 0);
    _nassert((int)nCoefs % 4 == 0);
    _nassert((int)nCoefs >= 4);

    /* -------------------------------------------------------------------- */
    /*  Iterate over the biquads, processing two per iteration.             */
    /* -------------------------------------------------------------------- */
    for (j = 0; j < nCoefs; j += 8) {
           
        c_0123 = _amem8_const(&Coefs[j]);
        s_0123 = _amem8(&State[j]);
        c_4567 = _amem8_const(&Coefs[j + 4]);
     
        s_01 = _hill(s_0123);
        s_23 = _loll(s_0123);
                
        p_0 = _dotp2(_loll(c_0123), s_01);
        p_1 = _dotp2(_hill(c_0123), s_01);        
     
        p_2 = _dotp2(_loll(c_4567), s_23);
        p_3 = _dotp2(_hill(c_4567), s_23);
       
        t_0 = x + (p_0 >> 14);
        x += ((p_0 + p_1) >> 14);

        t_1 = x + (p_2 >> 14);
        x += ((p_2 + p_3) >> 14);

        /*-----------------------------------------------------------*/
        /*   Use of temp_1 and temp_2 cuts back a cross-path         */
        /*-----------------------------------------------------------*/          
        temp_1 = _packlh2(t_1, s_23);
        temp_2 = _packlh2(t_0, s_01);

        if (j < nCoefs - 4)
        {
            _mem8(&State[j]) = _itoll(temp_2, temp_1);
        }
        else
        {
            State[j] = _packlh2(t_0, s_01);         
        }   
            
    }
    return x;
}


#endif

/* ======================================================================= */
/*  End of file:  DSP_iir_ss.c                                             */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


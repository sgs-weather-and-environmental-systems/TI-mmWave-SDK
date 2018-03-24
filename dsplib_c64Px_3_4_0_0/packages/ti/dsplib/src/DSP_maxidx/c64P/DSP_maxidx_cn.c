/* ======================================================================= */
/* DSP_maxidx_cn.c -- Maximum Vector Value                                 */
/*                    Natural C Implementation                             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*          int DSP_maxidx_cn (                                            */
/*              const short * x,      // Input array     //                */
/*              short         nx      // Length of input //                */
/*          );                                                             */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      The "maxidx" routine finds the largest element in an array,        */
/*      returning the index to that element within the array.              */
/*                                                                         */
/*      The input array is treated as 16 separate "columns" that are       */
/*      interleaved throughout the array.  If values in different columns  */
/*      are equal to the maximum value, then the element in the leftmost   */
/*      column is returned.  If two values within a column are equal to    */
/*      the maximum, then the one with the lower index is returned.        */
/*      Column takes precedence over index within the column.              */
/*                                                                         */
/*      The function returns the index of the maximum value.               */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      The input must be at least 48 elements long, and be a multiple     */
/*      of 16 elements long.                                               */
/*                                                                         */
/*      The code requires at least 48 bytes of stack, to make room for a   */
/*      32-byte temporary working buffer.                                  */
/*                                                                         */
/*      The optimized implementations assume that the Input array is       */
/*      double-word aligned, and are optimized for LITTLE ENDIAN.          */
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

#pragma CODE_SECTION(DSP_maxidx_cn, ".text:ansi");

int DSP_maxidx_cn (
    const short * x, 
    int           nx 
) 
{
    int    i, maxIndex = 0;
    short  maxValue = x[0];

    /* -------------------------------------------------------------------- */
    /*  Find the maximum and index of the input.                            */
    /* -------------------------------------------------------------------- */
    for (i = 1; i < nx; i ++) {
        if (x[i] > maxValue) {
            maxValue = x[i];
            maxIndex = i;
        }
    }
    
    /* -------------------------------------------------------------------- */
    /*  Return the the location                                             */
    /* -------------------------------------------------------------------- */
    return maxIndex;
}

/* ======================================================================== */
/*  End of file:  DSP_maxidx_cn.c                                           */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */


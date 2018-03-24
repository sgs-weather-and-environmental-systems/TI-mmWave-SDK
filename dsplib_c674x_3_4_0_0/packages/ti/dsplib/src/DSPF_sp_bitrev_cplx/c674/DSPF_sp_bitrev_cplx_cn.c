/* ======================================================================= */
/* DSPF_sp_bitrev_cplx_cn.c -- Complex Bit Reversal                        */
/*                 Natural C Implementation                                */
/*                                                                         */
/* Rev 0.0.2                                                               */
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

#pragma CODE_SECTION(DSPF_sp_bitrev_cplx_cn, ".text:natural");

#include "DSPF_sp_bitrev_cplx_cn.h"

void DSPF_sp_bitrev_cplx_cn (double* x, short* index, int nx)
{
    short i0, i1, i3;
    short j0, j1, j3;
    short t;
    int   a, b, ia, ib, ibs;
    int   i, mask;
    int   nbits, nbot, ntop, ndiff, n2, halfn;
    double xi0, xi1, xi3;
    double xj0, xj1, xj3;

    nbits = 0;
    i = nx;

    while (i > 1)
    {
        i = i >> 1;
        nbits++;
    }

    nbot  = nbits >> 1;
    ndiff = nbits & 1;
    ntop  = nbot + ndiff;
    n2    = 1 << ntop;
    mask  = n2 - 1;
    halfn = nx >> 1;

    for (i0 = 0; i0 < halfn; i0 += 2)
    {
        b = i0 & mask;
        a = i0 >> nbot;

        if (!b) ia = index[a];
        ib  = index[b];

        ibs = ib << nbot;
        j0  = ibs + ia;
        t   = i0 < j0;
        i1  = i0 + 1;
        j1  = j0 + halfn;
        i3  = i1 + halfn;
        j3  = j1 + 1;

        xi0 = x[i0];
        xi1 = x[i1];
        xj0 = x[j0];
        xj1 = x[j1];
        xi3 = x[i3];
        xj3 = x[j3];

        x[i1] = xj1;
        x[j1] = xi1;
        if (t)
        {
            x[i0] = xj0;
            x[j0] = xi0;
            x[i3] = xj3;
            x[j3] = xi3;
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_bitrev_cplx_cn.c                                 */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

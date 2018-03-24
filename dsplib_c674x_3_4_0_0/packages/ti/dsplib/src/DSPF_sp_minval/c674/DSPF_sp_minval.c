/* ======================================================================= */
/* DSPF_sp_minval.c -- Minimum Value                                       */
/*              Optimized C Implementation (w/ Intrinsics)                 */
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

#pragma CODE_SECTION(DSPF_sp_minval, ".text:optimized");

#include "DSPF_sp_minval.h"
#include "float.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

float DSPF_sp_minval(const float* x, int nx)
{
   int    i;
   float  x0, x1, x2, x3, min0, min1, min2, min3;
   __float2_t x_01, x_23;

   min0 = FLT_MAX;
   min1 = FLT_MAX;
   min2 = FLT_MAX;
   min3 = FLT_MAX;
  
   _nassert(nx % 4 == 0);
   _nassert(nx > 0);
   _nassert((int)x % 8 == 0);

   #pragma MUST_ITERATE(1,,)
   for (i = 0; i < nx; i+=4)
   {
      x_01 = _amem8_f2((void*)&x[i]);
      x_23 = _amem8_f2((void*)&x[i+2]);
      x0   = _hif2(x_01);
      x1   = _lof2(x_01);
      x2   = _hif2(x_23);
      x3   = _lof2(x_23);
      if (x0 < min0)
        min0 = x0;
      if (x1 < min1)
        min1 = x1;
      if (x2 < min2)
        min2 = x2;
      if (x3 < min3)
        min3 = x3;
   }
   if (min0 < min1)
     min1 = min0;
   if (min2 < min3)
     min3 = min2;
   if (min3 < min1)
     return min3;
   else    
     return min1;
}
/* ======================================================================= */
/*  End of file:  DSPF_sp_minval.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


/****************************************************************************/
/*  renormf.h        v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

#ifndef __RENORMF__
#define __RENORMF__

#include "float_config.h"
#include "reald.h"
#include "syntf.h"
#include "chunk.h"
#include "ieeemask.h"

#if (BPREAL == BPbigint)
   /* #define COUNT_LZERO(nnn) DEFAULT_IS_UNDEFINED                          */
   /* If defined, must be macro that returns the count of the number of      */
   /* consecutive zero bits at the most significant end of nnn.              */
   /* If COUNT_LZERO is not defined, alternate implementations will be used. */


   /* int RENORMF(bigint ff, int ee)                                         */
   /* ff (0<ff<REAL_HIDDEN_BIT) is left shifted until ff >= REAL_HIDDEN_BIT. */
   /* At least one shift is required.                                        */
   /* ee is decremented by the number of shifts.                             */
   #ifdef Support_DENORM
      #ifdef COUNT_LZERO
         #define RENORMF(ff,ee) do {int tmp = \
                                   COUNT_LZERO(ff)-BPbigint+\
                                   (REAL_FRC_MSBs)+1;\
                                ff <<= tmp; ee -= tmp-1;} while(0)
      #else
         #define RENORMF(ff,ee) while ((ff <<= 1) < REAL_HIDDEN_BIT) ee -= 1
      #endif
   #endif

   /* int RENORM2F(bigint ff, int ee)                                        */
   /* ff (0<ff<REAL_HIDDEN_BIT*2) is left shifted until ff>=REAL_HIDDEN_BIT*2*/
   /* At least one shift is required.                                        */
   /* ee is decremented by the number of shifts.                             */
   #ifdef COUNT_LZERO
      #define RENORM2F(ff,ee) do {int tmp=\
                                COUNT_LZERO(ff)-BPbigint+\
                                (REAL_FRC_BITS%BPbigint)+2;\
                               ff <<= tmp; ee -= tmp;} while (0)
   #else
      #define RENORM2F(ff,ee) do ee -= 1; while ((ff <<= 1) < REAL_HIDDEN_BIT*2)
   #endif
#elif (BPREAL == (BPbigint*2))
   extern int RENORMF(REAL_2UNS *ff);
#else
   #error "RENORMF not yet implemented for this size REAL"
#endif

#endif /* __RENORMF__ */

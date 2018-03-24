/****************************************************************************/
/*  powif_i.h         v8.1.3                                                */
/*                                                                          */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                   */
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

/* _CODE_ACCESS REAL POWIF(REAL x, int i) */

   REAL r, s, rp, sp;
   int invert;
   int t;

   RIPF(x, r, t);
   if EQLF(r, One_Over_RADIX) return SCLF(ONE,(t-1)*i);

   invert = false;
   t = i;
   if (t < 0) {
      invert = true;
      if (t > INT_MIN) t = -t;
   }
   CPYF(s,x);
   if (t & 1) CPYF(r,s); else CPYF(r,ONE);
   if (t < 0) t = -(INT_MIN/2); else t = t >> 1;
   while ((t != 0) && NEZF(r)) {
      SQRF2(sp,s);
      if GEQF(sp,REAL_MOST_POS) { /* overflow? */
         if (!invert) { errno = ERANGE; return REAL_MOST_POS; };
         INVF1(s); INVF1(r);
         invert = false;
         SQRF2(sp,s);         
      }
      if (t & 1) {
         MPYF3(rp,r,sp);
         if GEQF(rp,REAL_MOST_POS) { /* overflow? */
            if (!invert) { errno = ERANGE; return REAL_MOST_POS; };
            INVF1(s); INVF1(r);
            invert = false;
            SQRF2(sp,s);
            MPYF3(rp,r,sp);
         }
	 CPYF(r,rp);
      }
      CPYF(s,sp); 
      t = t >> 1;
   }
   if (invert) return INVF(r);
   return r;

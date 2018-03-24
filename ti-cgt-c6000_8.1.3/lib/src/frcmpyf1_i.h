/****************************************************************************/
/*  frcmpyf1_i.h         v8.1.3                                             */
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

/* _CODE_ACCESS unsigned  FRCMPYF(unsigned  l, unsigned  r) */

/*---------------------------------------------------------------------------*/
/* Fractional MultiPlY                                                       */
/* Forms the product (2*REAL_FRC_BITS bits) of l and r (each a fixed point   */
/* operand in range 1..2-, with radix point at REAL_FRC_BITS).               */
/* Returns uppermost bits as a fixed point number in the range               */
/* 1..4-, with the radix point at REAL_FRC_BITS+1.                           */
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/
/* See also:								     */
/*                                                                           */
/* Knuth D., "The Art of Computer Programming", Volume 2, ch 4.2	     */
/* ("Floating Point Arithmetic")					     */
/*                                                                           */
/* Goldberg D., "What Every Computer Scientist Should Know About	     */
/* Floating-Point Arithmetic", ACM Computing Surveys, Vol 23, No 1, March    */
/* 1991									     */
/*                                                                           */
/* Goldberg D., "Computer arithmetic."  Appendix A in "Computer		     */
/* Architecture: A Quantitative Approach, Patterson and Hennessy.	     */
/*                                                                           */
/* IEEE-754 "IEEE Standard for Binary Floating-Point Arithmetic"             */
/*---------------------------------------------------------------------------*/

   /*------------------------------------------------------------------------*/
   /* Re-align the inputs, split them into halves,                           */
   /* form all the cross products and add 'em up.                            */
   /*------------------------------------------------------------------------*/

   #define BBITS (BPbigint/2)
   #define BMSK ((((biguns)1)<< BBITS)-1)

   biguns p, sticky;

   /*------------------------------------------------------------------------*/
   /* l and r come into this function as 24-bit float significands	     */
   /* (hidden bit, implied radix point, 23 fractional digits) in Q9.23	     */
   /* format.  (This assumes 32-bit float).				     */
   /*------------------------------------------------------------------------*/
   l <<= (BPbigint-REAL_FRC_MSBs)/2 + 2;  /* so hi word of product has one */
   r <<= (BPbigint-REAL_FRC_MSBs)/2 + 2;  /* rounding bit plus room f. sticky */

   /*------------------------------------------------------------------------*/
   /* l and r are now in Q3.29 format.  We do a Q3.29 * Q3.29 multiply to    */
   /* get a Q6.58 result.  We truncate this to the upper 32 bits, giving     */
   /* Q6.26, and shift right to finally get Q7.25 The truncated bits are     */
   /* stored in "sticky" and OR'd into the lowest bit for the rounding	     */
   /* which will happen in MPYF.c					     */
   /*------------------------------------------------------------------------*/

#ifdef _TMS320C6x

   #if BPbigint == BPlonglong
      #error "sorry, you need to update this to reflect long long - see BLH"
   #endif
   {
       p = _mpyu(l, r) >> BBITS;
       sticky = _mpyu(l, r) << BBITS;
       
       p += _mpyhlu(l, r);
       p += _mpyhlu(r, l);
       
       sticky |= _mpyhlu(l, r) << BBITS;
       sticky |= _mpyhlu(r, l) << BBITS;
       
       p = _mpyhu(l,r) + (p >> BBITS);
       
       sticky |= p & 0x1;
       
       return (p >> 1) | (sticky != 0);
   }
#else
   {
   #if ((2*BPint) == BPbigint)
      unsigned l0, l1, r0, r1;
   #elif ((2*BPshrt) == BPbigint)
      unsigned short l0, l1, r0, r1;
   #elif ((2*BPchar) == BPbigint)
      unsigned char l0, l1, r0, r1;
   #else
      biguns l0, l1, r0, r1;
   #endif

      l1 = l & BMSK;
      r1 = r & BMSK;
      p = (biguns)l1 * r1 >> BBITS;
      sticky = (biguns)l1 * r1 << BBITS;

      l0 = l >> BBITS; p += (biguns)l0 * r1;
      r0 = r >> BBITS; p += (biguns)r0 * l1;
      
      sticky |= (biguns)l0 * r1 << BBITS;
      sticky |= (biguns)r0 * l1 << BBITS;

      p = (biguns)l0 * r0 + (p >> BBITS);
      
      sticky |= p & 0x1;

      return (p >> 1) | (sticky != 0);
   }
#endif


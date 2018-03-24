/****************************************************************************/
/*  frcdivf1_i.h         v8.1.3                                             */
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

/* biguns FRCDIVF(biguns l, biguns r) */

/*---------------------------------------------------------------------------*/
/* FRaCtional DIVide                                                         */
/* Forms the quotient of l/r (r is a fixed point                             */
/* operand in range 1..2-, with radix point at REAL_FRC_BITS).               */
/* Returns the quotient as a fixed point number in the range                 */
/* 0.5+..2-, with the radix point at REAL_FRC_BITS+1.                        */
/*---------------------------------------------------------------------------*/

#define IW (BPbigint/2-2) /* 14, size of est inverse */   
#define DW (IW-1)         /* bits produced in each step */ 

   bigint inv_div, rem, quo, t, rhi, rlo;

   /*------------------------------------------------------------------------*/
   /* Compute an approximate inverse of r, in the range 0.5..1.0,            */
   /* with radix point at IW bits                                            */
   /*------------------------------------------------------------------------*/
   rhi = r >> REAL_FRC_BITS-IW; 
   /* linear approximation */
   inv_div = FIXPT(1.411622,IW) - ((FIXPT(0.470459,IW) * rhi) >> IW);

   /* newton iteration */
   inv_div = ((FIXPT(2.0,IW) - ((inv_div * rhi) >> IW)) * inv_div) >> IW;
   inv_div = ((FIXPT(2.0,IW) - ((inv_div * rhi) >> IW)) * inv_div) >> IW;
   /*------------------------------------------------------------------------*/
   /* Long division.                                                         */
   /* Estimate the quotient in REAL_FRC_BITS * IW bits, keeping DW bits.     */
   /* Form the remainder in two steps to avoid intermediate overflow.        */
   /*------------------------------------------------------------------------*/
   rem = l; quo = 0; rlo = r & ((((bigint)1)<<REAL_FRC_BITS-IW)-1);
   do {
      t = ((rem >> (REAL_FRC_BITS-IW))* inv_div)>> IW*2-DW;
      rem = (((rem << DW+IW-REAL_FRC_BITS)
             - rhi * t) << REAL_FRC_BITS-IW)
            - rlo * t;
      quo = (quo << DW) + t;
   }
   while (quo < REAL_HIDDEN_BIT);

   /*------------------------------------------------------------------------*/
   /* Align radix point of result to REAL_FRC_BITS+1                         */
   /*------------------------------------------------------------------------*/
    quo >>= ((REAL_FRC_BITS)/DW +1)*DW - REAL_FRC_BITS-1;
    return quo;

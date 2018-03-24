/****************************************************************************/
/*  frcaddf_i.h         v8.1.3                                              */
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

/* _CODE_ACCESS int FRCADDF(int lx, REAL_2UNS *lf, int rx, REAL_2UNS *rf) */

/*---------------------------------------------------------------------------*/
/* Fractional ADD the value defined by *lf (fractional part of left),        */
/* lx (exponent part of left) with *rf,rx; placing the resultant fractional  */
/* part in lf and passing the resultant exponent part as the function result.*/
/*---------------------------------------------------------------------------*/
   int sc, dx;
   biguns sign;
   REAL_2UNS *tf;

   /* Compute shift needed to align radix points.  */
   /*  Swap inputs so left is larger.              */
   dx = lx; sc = dx - rx;
   if (sc < 0) { sc = -sc; dx = rx; tf = lf; lf = rf; rf = tf;}

   if (sc < REAL_FRC_BITS+2) {	/* significant bits to add */
      biguns lf_u_msh = lf->u.msh;
      biguns lf_u_lsh = lf->u.lsh;
      biguns rf_u_msh = rf->u.msh;
      biguns rf_u_lsh = rf->u.lsh;

      /* Reformat so that there's a guard digit at the bottom of the lsw */
      LSH1(lf_u_msh, lf_u_lsh);

      /* shift to align radix points */
      sc--; /* one less because of the guard digit */
      if (sc >= BPbigint) {
         rf_u_lsh = rf_u_msh;
         rf_u_msh = (bigint)rf_u_msh >> (REAL_FRC_MSBs)+2;
         sc -= BPbigint;
      }
      if (sc > 0) {
         rf_u_lsh = (rf_u_msh << BPbigint-sc) + (rf_u_lsh >> sc);
         rf_u_msh = (bigint)rf_u_msh >> sc;
      } else if (sc < 0) {
         LSH1(rf_u_msh, rf_u_lsh);
      }

      /* add */
      lf_u_msh += rf_u_msh;
      lf_u_lsh += rf_u_lsh;
      if (lf_u_lsh < rf_u_lsh) lf_u_msh += 1;

      /* back to sign-magnitude form */
      sign = 0;
      if ((bigint)lf_u_msh < 0) {
         sign = MINUS;
         lf_u_msh = ~lf_u_msh + ((lf_u_lsh = -lf_u_lsh) == 0);
      }

      /* renormalize */
      if (lf_u_msh < REAL_HIDDEN_BIT*2) {    /* cancellation */
         lf->u.msh = lf_u_msh;
         lf->u.lsh = lf_u_lsh;
         if ((sc = RENORMF(lf)+2) <= 0) return 0;
         dx -= sc;
         lf->u.msh |= sign;
      } else {
         if (lf_u_msh >= REAL_HIDDEN_BIT*4) {
            RSH1(lf_u_msh, lf_u_lsh);
            dx +=1;
         }
         if ((lf_u_lsh += 1) == 0) lf_u_msh += 1;  /* round with carry */

         RSH1(lf_u_msh, lf_u_lsh);

         lf_u_msh |= sign;

         lf->u.msh = lf_u_msh;
         lf->u.lsh = lf_u_lsh;
     }
   }
   /* back to sign-magnitude form */
   else if ((bigint)lf->u.msh < 0) {NEG2sCOMP((*lf)); lf->u.msh |= MINUS;}


   if (lx < rx) *rf = *lf;
                
   return dx;

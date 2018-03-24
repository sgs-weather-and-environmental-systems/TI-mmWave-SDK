/****************************************************************************/
/*  frexpf_i.h         v8.1.3                                               */
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


#ifdef IEEE
   #define OPTIMIZATION_BLOCK __asm(" ")

   {
   /* Deals properly with NAN, +/- INFINITY, +/- ZERO, denormalized numbers */
   #define BPsexp (REAL_EXP_BITS+1) /* Bits Per Sign/EXPonent part*/
   #define BIAS (REAL_EXP_BIAS-1)
   #define KEEP_EXP ((1<<REAL_EXP_BITS)-1)
   #define ZERO_EXP ((1<<(BPint-1))+(1<<(REAL_FRC_BITS%BPint))-1)
   #define MSBs (((BPREAL/BPint)-1)*(MSB_In_Hi_Addr))

      REAL y;
      int uy, e;
    
   #if defined(_TMS320C6x) && (BPREAL == BPint)
      CPYF(y,x);
      uy = (int)_ftoi(y);
   #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
      CPYF(y,x);
      uy = (int)_hi(y);
   #else
      int *ptr;
      CPYF(y,x);
      ptr = (int *)(&y) + MSBs;
      uy = *ptr;
   #endif
      e = ((uy >> (BPint-BPsexp)) & KEEP_EXP); /* maybe get compare to 0 free*/
   
      if (e == 0) /* +/- ZERO or denormalized? */
      {
         if EQZF(y) { *exp = 0; return x; } /* +/- ZERO */

         MPYF3(y,x,RADIX_to_MANTISSA); /* its not denormalized now! */
       #if defined(_TMS320C6x) && (BPREAL == BPint)
         uy = (int)_ftoi(y);
       #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
         uy = (int)_hi(y);
       #else
         uy = *ptr;
       #endif
         e = ((uy >> (BPint-BPsexp)) & KEEP_EXP) -REAL_MANTISSA;
      }
      else if (e == KEEP_EXP) { /* infinities and NAN's */
         if      LSSF(y,REAL_MOST_NEG) { errno = EDOM; return -INFINITY;}
         else if GTRF(y,REAL_MOST_POS) { errno = EDOM; return  INFINITY;}
         else                          { errno = EDOM; *exp = 0; return ZERO;}
         
      }
      e -= BIAS;
   
      *exp = e;
    #if defined(_TMS320C6x) && (BPREAL == BPint)
      y = _itof((uy & ZERO_EXP) | /* out with the old ...*/
                (BIAS << (BPint-BPsexp)));       /* and in with the new */
    #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
      y = _itod((uy & ZERO_EXP) | /* out with the old ...*/
                (BIAS << (BPint-BPsexp)), _lo(y)); /* and in with the new */
    #else
     *ptr = (uy & ZERO_EXP) | /* out with the old ...*/
             (BIAS << (BPint-BPsexp));       /* and in with the new */
      OPTIMIZATION_BLOCK;/*make sure *ptr is written before trying to read y*/
    #endif
      return y;
   }
#elif defined(C3x_Float_Format)
   /* C3x format only supported on C3x and C4x architectures to may as */
   /* well build in assembly sequences.                                */

   /* This sequence will decompose a 32 or 40-bit float.               */
   /* f,e in floating registers and *exp in *ARx                       */
   /* Suggest R0,R1, *exp in *AR2.                                     */
   /*      LDF      x, f    ; f = x;                                   */

   /*      BEQD     L1      ; if f == 0 then return 0,0.0              */
   /*      LDIU     0, e    ;                                          */
   /*      NOP              ;                                          */
   /*      NOP              ;                                          */

   /*      PUSHF    f       ;                                          */
   /*      LDE      0.5, f  ; -1.0 <= f < -0.5;  or 0.5 <= f < 1.0     */
   /*      POP      e       ; e in upper 8 bits                        */
   /*      CMPF     -1.0, f ;                                          */

   /*      BNEQD    L1      ;                                          */
   /*      LDFEQ    -0.5, f ;                                          */
   /*      ASH      -24, e  ; e in lower 8 bits                        */
   /*      ADDI     1, e    ;                                          */

   /*      ADDI     1, e    ; native f in range 1.0..2.0 so compensate */
   /* L1:  STI      e, *exp ;                                          */
   /*                       ; return                                   */

   /* get x loaded into R0, and exp loaded into AR2 */
#ifdef _REGPARM /* if _REGPARM then x already in R2, *exp already *AR2    */
   __asm("        LDF     R2, R0"       );
#else
   __asm("        LDF     *-AR3(2), R0" );
 #if (BPREAL == 32) 
   __asm("        LDIU    *-AR3(3), AR2");
 #elif (BPREAL == 40) 
   __asm("        LDIU    *-AR3(3), R0" );
   __asm("        LDIU    *-AR3(4), AR2");
 #else 
   #error "frexp not yet implemented for C3x/4x 64-bit"
 #endif
#endif
   __asm("        BEQD    L1"      );
   __asm("        LDIU    0, R1"   );
   __asm("        NOP"              );
   __asm("        NOP"              );
   __asm("        PUSHF   R0"      );
   __asm("        LDE     0.5, R0" );
   __asm("        POP     R1"      );
   __asm("        CMPF    -1.0,R0" );
   __asm("        BNED    L1"      );
   __asm("        LDFEQ   -0.5, R0");
   __asm("        ASH     -24, R1" );
   __asm("        ADDI    1, R1"   );
   __asm("        ADDI    1, R1"   );
   __asm("L1:"                      );
   __asm("        STI     R1,*AR2" );
#else
   #error "frexp not yet implemented for cases other than IEEE, C3x/4x"
#endif

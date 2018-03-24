/****************************************************************************/
/*  ldexpf_i.h         v8.1.3                                               */
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

/* _CODE_ACCESS REAL LDEXPF(REAL x, int n) */

#if defined(IEEE)
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
      e = ((uy >> (BPint-BPsexp)) & KEEP_EXP);

      if (e == 0) /* ZERO's and denormalized numbers */
      {
         if EQZF(x) return x; /* preserve signed ZERO's */

         MPYF3(y, x, RADIX_to_MANTISSA);  /* its not denormalized now! */
       #if defined(_TMS320C6x) && (BPREAL == BPint)
         uy = (int)_ftoi(y);
       #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
         uy = (int)_hi(y);
       #else
         uy = *ptr;
       #endif
         e = ((uy >> (BPint-BPsexp)) & KEEP_EXP) -REAL_MANTISSA;
      }
      else if (e == KEEP_EXP) return x; /* watch for infinity and NAN! */

      if (n > (REAL_EMAX + 1)+BIAS-e) /* overflow? */
      {
         errno = ERANGE; 
         CPYF(y,(GEZF(x) ? REAL_MOST_POS : REAL_MOST_NEG));
         MPYF2(y,TWO); /* to force +/- INFINITY, if supported */
         return y;
      }
      if (n < (REAL_EMIN+1)+BIAS-e) { /* underflow or denormalized? */
         if (n < (REAL_EMIN+1)-(REAL_MANTISSA-1)+BIAS-e) /* underflow? */
            return ZERO;
         /* resulting number will be denormalized */
       #if defined(_TMS320C6x) && (BPREAL == BPint)
         y = _itof((uy & ZERO_EXP) |                /* out with the old...*/
             ((e+n+REAL_MANTISSA)<<(BPint-BPsexp)));/* in with (some) new.*/
       #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
         y = _itod((uy & ZERO_EXP) |               /* out with the old...*/
             ((e+n+REAL_MANTISSA)<<(BPint-BPsexp)),_lo(y));/*in with new.*/
       #else
         *ptr= (uy & ZERO_EXP) |                    /* out with the old...*/
              ((e+n+REAL_MANTISSA)<<(BPint-BPsexp));/* in with (some) new.*/
         OPTIMIZATION_BLOCK;/**ptr must be written before trying to read y*/
       #endif
         return MPYF(y, RADIX_to_M_MANTISSA);          /* then rest of new   */
         /* MPYF will underflow if target does not support denormalized nos. */
      }
    #if defined(_TMS320C6x) && (BPREAL == BPint)
      y = _itof((uy & ZERO_EXP) |              /* out with the old ...*/
                ((e+n) << (BPint-BPsexp)));    /* and in with the new */
    #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
      y = _itod((uy & ZERO_EXP) |              /* out with the old ...*/
                ((e+n) << (BPint-BPsexp)),_lo(y)); /* and in with the new */ 
    #else
      *ptr = (uy & ZERO_EXP) |                 /* out with the old ...*/
             ((e+n) << (BPint-BPsexp));        /* and in with the new */
      OPTIMIZATION_BLOCK;/*make sure *ptr is written before trying to read y*/
    #endif
      return y;
   }
#elif defined(C3x_Float_Format)
   /* 32 and 40-bit floats but NOT 64-bit floats */

   /*   LDF     R2, R0        ; get x into R0 and compare to 0  */
   /*   BEQD    L1            ; if x == 0.0 return 0.0          */
   /*   PUSHF	R0	      ;                                 */
   /*   ANDN	20h, ST	      ; clear latched overflow          */
   /*   POP	R1            ;                                 */
   /*   ASH	-24, R1	      ; e of x in R1 now                */
   /*   ADDI	AR2, R1	      ; e+n, can overflow               */
   /*   ASH	24, R1	      ; e+n in 8 MSBs, can overflow     */
   /*   BNLVD	L1            ; replace L1 with BK/R11 for asm  */
   /*   PUSH	R1	      ;                                 */
   /*   POPF	R1	      ; 2**(e+n)                        */
   /*   LDE	R1, R0        ; f * 2**(e+n)                    */
   /*   LDI	AR2, R1	      ; e+n too negative - return 0.0   */
   /*   LDFLT	0.0, R0	      ;                                 */
   /*   LDFGE   R2, R0        ;                                 */
   /*   CMPF    0.0, R0       ;                                 */
   /*                                                           */
   /*Cons800	.SET	-2.0		; float whose mantissa is 080000000 */
   /*Cons7F8	.SET	1.99609375	; float whose mantissa is 07F800000 */
   /*Cons7F7	.SET	1.99560546875	; float whose mantissa is 07F700000 */
   /*                                                           */
   /*   LDFEQ	Cons800, R0   ; 80000000h into 32 LSBs          */
   /*   LDFLT   Cons7F8, R0   ; 7f800000h into 32 LSBs          */
   /*   LDFGT	Cons7F7, R0   ; 7f700000h into 32 LSBs          */
   /*   PUSH	R0	      ; 32-LSBs to memory               */
   /*   POPF	R0	      ;                                 */
   /*   ABSF	R0, R1	      ;		                        */
   /*   MPYF	R1, R0	      ; now {0, most-neg, most-pos}     */
   /*                         ; put BUD BK/R11 here for asm     */
   /*   LDINE  2, R1          ; ERANGE == 2                     */
   /*   LDIEQ  @_errno, R1    ;                                 */
   /*   STI    R1, @_errno    ;                                 */
   /*L1:                      ; return                          */

   __asm(""                             );
   __asm("        .global _errno"       ); 
   __asm(""                             );

   /* ldexp.asm version has LDIU SP, AR0; POP BK; here and uses       */
   /* *-AR0(1...) instead of *-AR3(2...) for stack based parameters.  */
#ifdef _REGPARM
   __asm("        LDF    R2, R0"       );
#else
   __asm("        LDF    *-AR3(2), R0" );
 #if (BPREAL > 32)
   __asm("        LDIU   *-AR3(3), R0" );
 #endif
#endif
   __asm("        BEQD    L1"           );
   __asm("        PUSHF   R0"           );
   __asm("        ANDN    20h, ST"      );
   __asm("        POP     R1"           );
   __asm("        ASH     -24, R1"      );
#if defined(_REGPARM)
   __asm("        ADDI    AR2, R1"      );
#elif (BPREAL == 32)
   __asm("        ADDI    *-AR3(3), R1" );
#elif (BPREAL == 40)
   __asm("        ADDI    *-AR3(4), R1" );
#else
   #error "ldexp not yet implemented for C3x/4x 64-bit"
#endif
   __asm("        ASH     24, R1"       );
   __asm("        BNLVD   L1"           );
   __asm("        PUSH    R1"           );
   __asm("        POPF    R1"           );
   __asm("        LDE     R1, R0"       );
#if defined(_REGPARM)
   __asm("        LDI     AR2, R1"      );
#elif (BPREAL == 32)
   __asm("        LDI     *-AR3(3), R1" );
#else
   __asm("        LDI     *-AR3(4), R1" );
#endif
   __asm("        LDFLT   0.0, R0"      );

#ifdef _BIGMODEL
   __asm("        LDP     @_errno"      );
#endif

#ifdef _REGPARM
   __asm("        LDFGE   R2, R0"       );
#else
   __asm("        LDFGE   *-AR3(2), R0" );
#endif

   __asm("        CMPF    0.0, R0"      );
   __asm(""                             );
   __asm("Cons800 .SET    -2.0"         );
   __asm("Cons7F8 .SET    1.99609375"   );
   __asm("Cons7F7 .SET    1.99560546875");
   __asm(""                             );
   __asm("        LDFEQ   Cons800, R0"  );
   __asm("        LDFLT   Cons7F8, R0"  );
   __asm("        LDFGT   Cons7F7, R0"  );
   __asm("        PUSH    R0"           );
   __asm("        POPF    R0"           );
   __asm("        ABSF    R0, R1"       );
   __asm("        MPYF    R1, R0"       );
   __asm("        LDINE   2, R1"        );
   __asm("        LDIEQ   @_errno, R1"  );
   __asm("        STI     R1, @_errno"  );
   __asm("L1:"                          );
#else
   if EQZF(x) return ZERO;
   #error "ldexp not yet implemented for cases other than IEEE, C3x/4x"
#endif

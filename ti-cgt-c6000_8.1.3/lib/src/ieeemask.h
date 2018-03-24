/****************************************************************************/
/*  ieeemask.h       v8.1.3                                                 */
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

#ifndef __ieeemask__
#define __ieeemask__

#ifndef BPint
   #error "target properties .h file must be included before ieeemask.h"
#endif

#if defined(_TMS320C6x) && !defined(__C6X_MIGRATION__)
 #include <c6x.h>
#endif

#if (BPREAL == BPbigint)
   union REAL_UNS_u {
      REAL r;
      biguns u;
   };
   typedef union REAL_UNS_u REAL_UNS;
   union REAL_INT_u {
      REAL r;
      bigint i;
   };
   typedef union REAL_INT_u REAL_INT;

 
  #if (defined(_TMS320C6x) && !defined(__C6X_MIGRATION__) && (BPbigint == BPint))
   #define REALasINT(I, R) (I)=(biguns)_ftoi(R)
   #define REALasUNS(U, R) (U)=_ftoi(R)
   #define INTasREAL(R, I) (R)=_itof((biguns)(I))
   #define UNSasREAL(R, U) (R)=_itof(U)

   #define return_REALasINT(R) return (biguns)_ftoi(R)
   #define return_REALasUNS(R) return _ftoi(R)
   #define return_INTasREAL(I) return _itof((biguns)(I))
   #define return_UNSasREAL(U) return _itof(U)

  #else
   #define REALasINT(I, R) do{REAL_INT XX; XX.r =(R); (I)= XX.i;}while(0)
   #define REALasUNS(U, R) do{REAL_UNS XX; XX.r =(R); (U)= XX.u;}while(0)
   #define INTasREAL(R, I) do{REAL_INT XX; XX.i =(I); (R)= XX.r;}while(0)
   #define UNSasREAL(R, U) do{REAL_UNS XX; XX.u =(U); (R)= XX.r;}while(0)

   #define return_REALasINT(R) do{REAL_INT XX; XX.r=(R); return XX.i;}while(0)
   #define return_REALasUNS(R) do{REAL_UNS XX; XX.r=(R); return XX.u;}while(0)
   #define return_INTasREAL(I) do{REAL_INT XX; XX.i=(I); return XX.r;}while(0)
   #define return_UNSasREAL(U) do{REAL_UNS XX; XX.u=(U); return XX.r;}while(0)
  #endif

    #define CREAL REAL_UNS
   #define REALasCREAL(CR,R) CR.r=(R)
   #define CREALasREAL(R,CR) (R)=CR.r
   #define UNSasCREAL(CR,U) CR.u=(U)
   #define INTasCREAL(CR,I) CR.i=(I)
   #define CREAL_SAME(l, r) (l==r)

   #define CREAL_IS_NAN(CR) (CR.u>REAL_INFNAN)

#elif (BPREAL==(2*BPbigint))
   union REAL_2UNS_u {
      REAL r;
      struct {
      #if MSB_In_Hi_Addr
         biguns lsh;
         biguns msh;
      #else
         biguns msh;
         biguns lsh;
      #endif
      } u;
   };
   typedef union REAL_2UNS_u REAL_2UNS;
   union REAL_2INT_u {
      REAL r;
      struct {
      #if MSB_In_Hi_Addr
         bigint lsh;
         bigint msh;
      #else
         bigint msh;
         bigint lsh;
      #endif
      } u;
   };
   typedef union REAL_2INT_u REAL_2INT;

   #if (MSB_In_Hi_Addr)
      #define INTasREAL(R,I) do{LSBI(R)= I; \
                                MSBI(R)= I;} while(0) /* I usually *p++ */
      #define UNSasREAL(R,U) do{LSBI(R)= U; \
                                MSBI(R)= U;} while(0) /* U usually *p++ */
   #else
      #define INTasREAL(R,I) do{MSBI(R)= I; \
                                LSBI(R)= I;} while(0) /* I usually *p++ */
      #define UNSasREAL(R,U) do{MSBI(R)= U; \
                                LSBI(R)= U;} while(0) /* U usually *p++ */
   #endif

   #define CREAL REAL_2UNS
   #define REALasCREAL(CR,R) CR.r=R
   #define CREALasREAL(R,CR) R=CR.r
   #if (MSB_In_Hi_Addr)
      #define UNSasCREAL(CR, U) CR.u.lsh=(U); CR.u.msh=(U)  /* u usually *p++*/
      #define INTasCREAL(CR, I) CR.u.lsh=(biguns)(I); CR.u.msh=(biguns)(I)
   #else
      #define UNSasCREAL(CR, U) CR.u.msh=(u); CR.u.lsh=(U)  /* u usually *p++*/
      #define INTasCREAL(CR, I) CR.u.msh=(biguns)(I); CR.u.lsh=(biguns)(I)
   #endif

   #define CREAL_SAME(l, r) (((l).u.msh == (r).u.msh) && \
                             ((l).u.lsh == (r).u.lsh))

   #define CREAL_IS_NAN(cr) ( ((cr).u.msh> REAL_INFNAN)|| \
                             (((cr).u.msh==REAL_INFNAN)&&((cr).u.lsh>0)))

   
   #define NEG2sCOMP(xx) xx.u.msh = ~xx.u.msh + ((xx.u.lsh = -xx.u.lsh) == 0)

   #define RIGHT_SHIFT(lll, nnn) do { \
      int sc = nnn; \
      if (sc >= BPbigint) {lll.u.lsh= lll.u.msh >> sc-BPbigint; lll.u.msh=0;} \
      else { lll.u.lsh = (lll.u.msh << BPbigint-sc) + (lll.u.lsh >> sc); \
             lll.u.msh >>= sc;}} while (0)

   #define LEFT_SHIFT(lll, nnn) do { \
      int sc = nnn; \
      if (sc >= BPbigint) {lll.u.msh= lll.u.lsh << sc-BPbigint; lll.u.lsh=0;} \
      else { lll.u.msh = (lll.u.lsh >> BPbigint-sc) + (lll.u.msh << sc); \
             lll.u.lsh <<= sc;}} while (0)

   #define RIGHT_SHIFT1(lll) do {\
      lll->u.lsh = (lll->u.lsh >> 1) + (lll->u.msh << BPbigint-1);\
      lll->u.msh >>=1;} while (0)

   #define LEFT_SHIFT1(lll) do {\
      lll->u.msh = (lll->u.msh << 1) + (lll->u.lsh >> BPbigint-1);\
      lll->u.lsh <<=1;} while (0)

   #define RSH1(msh,lsh) \
      do {lsh = (lsh >> 1) + (msh << BPbigint-1); msh >>=1;} while (0)

   #define LSH1(msh,lsh) \
      do {msh = (msh << 1) + (lsh >> BPbigint-1);  lsh <<=1;} while (0)


#else
   #error "no casting type defined for this size REAL"
#endif



#define OPTIMIZATION_BLOCK __asm(" ")

#if (MSB_In_Hi_Addr)
   #define MSC_OFFSET ((BPREAL/BPchar)-1) 
   #define LSC_OFFSET 0
   #define MSI_OFFSET ((BPREAL/BPint)-1) 
   #define LSI_OFFSET 0
   #define MSBI_OFFSET ((BPREAL/BPbigint)-1) 
   #define LSBI_OFFSET 0
   #define NEXT_MS_OFFSET (-1)
   #define CONSUME_MS(ptr) *ptr--
#else
   #define MSC_OFFSET 0
   #define LSC_OFFSET ((BPREAL/BPchar)-1)
   #define MSI_OFFSET 0
   #define LSI_OFFSET ((BPREAL/BPint)-1)
   #define MSBI_OFFSET 0
   #define LSBI_OFFSET ((BPREAL/BPbigint)-1) 
   #define NEXT_MS_OFFSET 1
   #define CONSUME_MS(ptr) *ptr++
#endif

#define LSC(right)  *((  char *)(&right)+ LSC_OFFSET)
#define LSI(right)  *((   int *)(&right)+ LSI_OFFSET)
#define LSBI(right) *((bigint *)(&right)+LSBI_OFFSET)

#define MSC(right)  *((  char *)(&right)+ MSC_OFFSET)
#define MSI(right)  *((   int *)(&right)+ MSI_OFFSET)
#define MSBI(right) *((bigint *)(&right)+MSBI_OFFSET)

#define NEXT_MS(ptr) ptr+=NEXT_MS_OFFSET;

#define SIGN_SET(right) (MSC(right) < 0)
#define MINUSC (((char)1)<<(BPchar-1))





#define MINUS (((biguns)1)<<(BPbigint-1))
#define UNORDERED (((int)1)<<(BPint-1)) /* return this for NAN input to CMPF */
#define MASK(bb) ((((bigint)1)<<(bb))-1) /*clear bits above the 2**(bb-1) bit*/

#define REAL_EXP_INFNAN ((((bigint)1)<<REAL_EXP_BITS)-1)
#define REAL_EXP_MASK   ((((bigint)1)<<REAL_EXP_BITS)-1)

#define REAL_FRC_MSBs (REAL_FRC_BITS % BPbigint) /*frc bits MS part*/
# if REAL_FRC_BITS > (BPbigint * 2)
#  error Sorry, this size float too large for this target.
# endif
#define REAL_FRC_MASK  ((((bigint)1)<< REAL_FRC_MSBs)-1)
#define REAL_HIDDEN_BIT (((bigint)1)<< REAL_FRC_MSBs)
#define REAL_INFNAN (((bigint)REAL_EXP_INFNAN) << REAL_FRC_MSBs)
#define REAL_NSNAN_BIT (((bigint)1)<<(REAL_FRC_MSBs-1)) /* MSB of fraction */
#define REAL_NAN    (REAL_INFNAN+1) /* signalling NAN */
#define REAL_NSNAN  (REAL_INFNAN+REAL_NSNAN_BIT) /*non-signl NAN*/

#define REAL_MOSTPOS (((REAL_EXP_INFNAN-1)<<REAL_FRC_MSBs)+REAL_FRC_MASK)
#define REAL_MOSTNEG (((REAL_EXP_INFNAN-1)<<REAL_FRC_MSBs)+REAL_FRC_MASK+MINUS)


   
#if !defined(LEAN) /* no smaller float size to provide conversion to/from */

#elif (BPLEAN == BPbigint)
   union LEAN_UNS_u {
      LEAN r;
      biguns u;
   };
   typedef union LEAN_UNS_u LEAN_UNS;
   union LEAN_INT_u {
      LEAN r;
      bigint i;
   };
   typedef union LEAN_INT_u LEAN_INT;

  #if (defined(_TMS320C6x) && !defined(__C6X_MIGRATION__) && (BPbigint == BPint))
   #define LEANasINT(I, R) (I)=(biguns)_ftoi(R)
   #define LEANasUNS(U, R) (U)=_ftoi(R)
   #define INTasLEAN(R, I) (R)=_itof((biguns)(I))
   #define UNSasLEAN(R, U) (R)=_itof(U)

   #define return_LEANasINT(R) return (biguns)_ftoi(R)
   #define return_LEANasUNS(R) return _ftoi(R)
   #define return_INTasLEAN(I) return _itof((biguns)(I))
   #define return_UNSasLEAN(U) return _itof(U)
  #else
   #define LEANasINT(I, R) do{LEAN_INT XX; XX.r =(R); (I)= XX.i;}while (0)
   #define LEANasUNS(U, R) do{LEAN_UNS XX; XX.r =(R); (U)= XX.u;}while (0)
   #define INTasLEAN(R, I) do{LEAN_INT XX; XX.i =(I); (R)= XX.r;}while (0)
   #define UNSasLEAN(R, U) do{LEAN_UNS XX; XX.u =(U); (R)= XX.r;}while (0)

   #define return_LEANasINT(R) do{LEAN_INT XX; XX.r=(R); return XX.i;}while (0)
   #define return_LEANasUNS(R) do{LEAN_UNS XX; XX.r=(R); return XX.u;}while (0)
   #define return_INTasLEAN(I) do{LEAN_INT XX; XX.i=(I); return XX.r;}while (0)
   #define return_UNSasLEAN(U) do{LEAN_UNS XX; XX.u=(U); return XX.r;}while (0)
  #endif
 
   #define CLEAN LEAN_UNS
   #define LEANasCLEAN(CR,R) CR.r=(R)
   #define CLEANasLEAN(R,CR) (R)=CR.r
   #define UNSasCLEAN(CR,U) CR.u=(U)
   #define INTasCLEAN(CR,I) CR.i=(I)
   #define CLEAN_SAME(l, r) (l==r)

   #define LEAN_IS_NAN(CR) (CR.u>LEAN_INFNAN)

#elif (BPLEAN==(2*BPbigint))
   #define INTasLEAN(r,i) do{int j; bigint *q = &r; \  /* i usually *p++ */
                             for (j=1; j<=BPLEAN/BPbigint; j++)\
                                *q++ = i;}while(0)
   #define UNSasLEAN(r,u) do{int j; biguns *q = &r; \  /* u usually *p++ */
                             for (j=1; j<=BPLEAN/BPbigint; j++)\
                                *q++ = u;}while(0)

   union LEAN_2UNSs_u {
      LEAN r;
      struct {
      #if MSB_In_Hi_Addr
         biguns lsh;
         biguns msh;
      #else
         biguns msh;
         biguns lsh;
      #endif
      } u;
   };
   typedef union LEAN_2UNSs_u LEAN_2UNSs;

   #define CLEAN LEAN_2UNSs
   #define LEANasCLEAN(cr,R) cr.r=R
   #define CLEANasLEAN(R,cr) R=cr.r
   #if (MSB_In_Hi_Addr)
      #define UNSasCLEAN(cr, u) cr.u.lsh=(u); cr.u.msh=(u) /*u usually *p++*/
      #define INTasCLEAN(cr, i) cr.u.lsh=(biguns)(i); cr.u.msh=(biguns)(i)
   #else
      #define UNSasCLEAN(cr, u) cr.u.msh=(u); cr.u.lsh=(u) /*u usually *p++*/
      #define INTasCLEAN(cr, i) cr.u.msh=(biguns)(i); cr.u.lsh=(biguns)(i)
   #endif

   #define CLEAN_SAME(l, r) (((l).u.msh == (r).u.msh) && \
                             ((l).u.lsh == (r).u.lsh))

   #define CLEAN_IS_NAN(cr) ( ((cr).u.msh> LEAN_INFNAN)|| \
                             (((cr).u.msh==LEAN_INFNAN)&&((cr).u.lsh>0)))
#else
   #error "no casting type defined for this size LEAN format"
#endif


#define LEAN_EXP_INFNAN ((((bigint)1)<<LEAN_EXP_BITS)-1)
#define LEAN_EXP_MASK ((((bigint)1)<<LEAN_EXP_BITS)-1)

#define LEAN_EXP_INFNAN ((((bigint)1)<<LEAN_EXP_BITS)-1)
#define LEAN_EXP_MASK   ((((bigint)1)<<LEAN_EXP_BITS)-1)

#define LEAN_FRC_MSBs (LEAN_FRC_BITS % BPbigint) /*frc bits MS part*/
#define LEAN_FRC_MASK  ((((bigint)1)<< LEAN_FRC_MSBs)-1)
#define LEAN_HIDDEN_BIT (((bigint)1)<< LEAN_FRC_MSBs)
#define LEAN_INFNAN (((bigint)LEAN_EXP_INFNAN) << LEAN_FRC_MSBs)
#define LEAN_NSNAN_BIT (((bigint)1)<<(LEAN_FRC_MSBs-1)) /* MSB of fraction */
#define LEAN_NAN    (LEAN_INFNAN+1) /* signalling NAN */
#define LEAN_NSNAN  (LEAN_INFNAN+LEAN_NSNAN_BIT) /*non-signl NAN*/

#endif /* __ieeemask__ */

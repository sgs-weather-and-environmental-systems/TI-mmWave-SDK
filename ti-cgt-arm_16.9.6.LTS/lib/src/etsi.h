/******************************************************************************/
/*                                                                            */
/*                                                                            */
/* Copyright (c) 1998-2017 Texas Instruments Incorporated                     */
/* http://www.ti.com/                                                         */
/*                                                                            */
/*  Redistribution and  use in source  and binary forms, with  or without     */
/*  modification,  are permitted provided  that the  following conditions     */
/*  are met:                                                                  */
/*                                                                            */
/*     Redistributions  of source  code must  retain the  above copyright     */
/*     notice, this list of conditions and the following disclaimer.          */
/*                                                                            */
/*     Redistributions in binary form  must reproduce the above copyright     */
/*     notice, this  list of conditions  and the following  disclaimer in     */
/*     the  documentation  and/or   other  materials  provided  with  the     */
/*     distribution.                                                          */
/*                                                                            */
/*     Neither the  name of Texas Instruments Incorporated  nor the names     */
/*     of its  contributors may  be used to  endorse or  promote products     */
/*     derived  from   this  software  without   specific  prior  written     */
/*     permission.                                                            */
/*                                                                            */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS     */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT     */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR     */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT     */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,     */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT     */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT     */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE     */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.      */
/*                                                                            */
/*                                                                            */
/******************************************************************************/
#ifndef _ETSIHDR
#define _ETSIHDR

#include <stdlib.h>
#include <linkage.h> 

#define MAX_32 (int)0x7fffffffL
#define MIN_32 (int)0x80000000L

#define MAX_16 (short)0x7fff
#define MIN_16 (short)0x8000

/******************************************************************************/
/* Macros for GSM ETSI math operations                                        */
/******************************************************************************/
#define L_add(a,b)     (_sadd((a),(b)))             /* int sat addition       */
#define L_sub(a,b)     (_ssub((a),(b)))             /* int sat subtract       */

/* CHANGE #4 */
/* For gsmefr: both L_add_c and L_sub_c, as defined in basicop2.c, depend on  */
/* the Carry flag defined in that file.  Specifically for L_add_c, using the  */
/* intrinsic results in incorrect output from gsmefr.  Since these two both   */
/* depend on the Carry flag, we always use the C versions from basicop2.c.    */
/*#define L_add_c(a,b)   (_addc((a),(b)))    */     /* int addition w/carry   */
/*#define L_sub_c(a,b)   (_subc((a),(b)))    */     /* int subtract w/carry   */

#define L_negate(a)    (L_sub(0,(a)))               /* integer negation       */
#define L_deposit_h(a) ((a)<<16)                    /* put short in upper 16  */
#define L_deposit_l(a) ((int)(a))                   /* put short in lower 16  */
#define L_abs(a)       (_abs_s(a))                  /* int absolute value     */
#define L_mult(a,b)    (_smpy((a),(b)))             /* short sat mpy => 32    */
#define L_mac(a,b,c)   (_smac((b),(c),(a)))         /* saturated mpy & accum  */
#define L_macNs(a,b,c) L_add_c((a),L_mult(b,c))     /* mpy & accum w/o saturat*/

/* CHANGE #1 */
/* L_msu as defined in application implementation does an L_mult which        */
/* contains a shift. _smsub doesn't have the shift.                           */
/* #define L_msu(a,b,c)   (_smsub((b),(c),(a))) */  /* saturated mpy & sub    */

#define L_msu(a,b,c)   (_ssub((a),L_mult(b,c)))     /* saturated mpy & sub    */

#define L_msuNs(a,b,c) L_sub_c((a),L_mult(b,c))     /* mpy & sub w/o saturate */
#define L_shl(a,b)     (_shl((a),(b)))              /* sat left shift         */
#define L_shr(a,b)     (_shr((a),(b)))              /* sat right shift        */
#define L_shr_r(a,b)   (L_shr((a),(b)) + ((b)>0 && (((a) & (1<<((b)-1))) != 0)))
#define abs_s(a)       _abs16_s(((a)<<16)>>16)      /* short absolute value   */
#define add(a,b)       (L_add((a)<<16,(b)<<16)>>16) /* short sat add          */
#define sub(a,b)       (L_sub((a)<<16,(b)<<16)>>16) /* short sat subtract     */
#define extract_h(a)   ((unsigned)(a)>>16)          /* extract upper 16 bits  */
#define extract_l(a)   (((a)&0xffff))               /* extract lower 16 bits  */
#define round(a)       extract_h(L_add((a),0x8000)) /* round                  */
#define mac_r(a,b,c)   (round(L_mac((a),(b),(c))))  /* mac w/ rounding        */
#define msu_r(a,b,c)   (round(L_msu((a),(b),(c))))  /* msu w/ rounding        */
#define mult_r(a,b)    (round(L_mult((a),(b))))     /* sat mpy w/ round       */
#define mult(a,b)      ((L_mult((a),(b))>>16))      /* short sat mpy upper 16 */

/* CHANGE #2 */
/* norm_l as defined in app. implementation differs from the compiler         */
/* implementation of CLZ by a off-by-one error. So where the compiler's       */
/* implementation returns the number of all leading zeroes, the app specific  */
/* implementation will return 1 less. Another difference between the two is   */
/* that the app. specific implementation will handle negative numbers,        */
/* whereas the compiler implementation won't. Commenting this out completely, */
/* and resorting to the app. specific implementation.                         */
/* #define norm_l(a)      (_norm(a))   */
/* #define norm_l(a)      (_norm(a)-1) */           /* return NORM of int     */

#define norm_s(a)      (norm_l((a))-16)             /* return NORM of short   */
#define negate(a)      (L_sub(0, ((a)<<16)) >> 16)  /* short sat negate       */
#define shl(a,b)       (_shl16((a),(b)))            /* sat short left shift   */
#define shr(a,b)       (_shr16((a),(b)))            /* sat short right shift  */

/* CHANGE #3 */
/* Below macro may not work if a or b are expressions with side-effects, such */
/* as *op++, in which case the compiler will reload the value for the second  */
/* use of a or b, which is not what we intend. Commenting this out completely */
/* and resorting to the app. specific implementation.                         */
/* #define shr_r(a,b)     (shr((a),(b)) + ((b)>0 && (((a) & (1<<((b)-1))) != 0)))
*/

#endif /* !_ETSIHDR */

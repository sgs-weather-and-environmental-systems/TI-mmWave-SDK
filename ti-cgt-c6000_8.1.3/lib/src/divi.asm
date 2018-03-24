;******************************************************************************
;* divi  v8.1.3                                                               *
;*                                                                            *
;* Copyright (c) 1996-2017 Texas Instruments Incorporated                     *
;* http://www.ti.com/                                                         *
;*                                                                            *
;*  Redistribution and  use in source  and binary forms, with  or without     *
;*  modification,  are permitted provided  that the  following conditions     *
;*  are met:                                                                  *
;*                                                                            *
;*     Redistributions  of source  code must  retain the  above copyright     *
;*     notice, this list of conditions and the following disclaimer.          *
;*                                                                            *
;*     Redistributions in binary form  must reproduce the above copyright     *
;*     notice, this  list of conditions  and the following  disclaimer in     *
;*     the  documentation  and/or   other  materials  provided  with  the     *
;*     distribution.                                                          *
;*                                                                            *
;*     Neither the  name of Texas Instruments Incorporated  nor the names     *
;*     of its  contributors may  be used to  endorse or  promote products     *
;*     derived  from   this  software  without   specific  prior  written     *
;*     permission.                                                            *
;*                                                                            *
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS     *
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT     *
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR     *
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT     *
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,     *
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT     *
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     *
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     *
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT     *
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE     *
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.      *
;*                                                                            *
;******************************************************************************
        .include c60asm.i
 
; The basic algorithm:
; 
; int __divi (int dividend, int divisor)
; {
;     int negative_quotient = (dividend<0) ^ (divisor<0);
;     register int i;
;     register int shift;
;     int quotient;
; 
;     divident = abs(dividend);
;     divisor  = abs(divisor);
;     shift = _lmbd(1, divisor) - _lmbd(1, dividend);
; 
;     if (dividend < divisor) return 0;
; 
;     divisor <<= shift;
;     shift++;
; 
;     for (i = 0; i < shift; i++)
;       dividend = _subc(dividend, divisor);
; 
;     quotient = dividend << (32-shift) >> (32-shift);
;     return (negative-quotient ? -quotient : quotient);
; }
; 
; Regs used:
; A0 = quotient_shift
; A1 = neg_num, zero_quo
; A2 = mag_num, neg_quo
; A4 = arg1: numerator, abs_num, retval: quotient
; A6 = copy neg_num
; B0 = subc loop counter
; B1 = loop counter, neg_den, mod
; B2 = mag_den, neg_loopcount, modulo_shift
; B3 = return address
; B4 = arg2: denominator, abs_den
; B5 = copy neg_den
;
; Regs killed:
; A0, A1, A2, A4, A6, B0, B1, B2, B4, B5 
;
; Regs used but not killed:
; B3


	.global __divi, __c6xabi_divi
	.sect	".text:__divi"
	.clink
__c6xabi_divi
__divi: .asmfunc

	 NEG	.S2	B4,	B5		; -den
||       STW    .D2     A10,    *B15--(8)
||	 ZERO	.L1	A10			; initialize condition
||       LMBD	.L2	 1,	B4,	B1

	 AND	.L2	B4,	B5,	B2	; den & -den
||       STW    .D2     A11,    *+B15(4)
||	 MV	.L1	A4,	A11		; copy num
|| [!B1] SHL	.S2	B4,	1,	B1	; den == MIN_INT?

	 CMPEQ	.L2	B5,	B2,	B0	; -den == (den & -den)
||	 MV	.D2	B1,	B5		; copy condition
||	 SHRU	.S1	A4,	31,	A1	; neg_num = num < 0
||	 SHRU	.S2	B4,	31,	B1	; neg_den = den < 0

   [ B0] ADD	.D1	A10,	1, 	A10	; 
||	 MV	.D2	B5,	B0		; copy condition
||       CMPEQ  .L2     B4,     B2,     B2	; den == (den & -den)
|| [ A1] NEG	.L1	A4,	A4		; abs_num = abs(num)
|| [ B1] NEG	.S2	B4,	B4		; abs_den = abs(den)
||	 B	.S1	LOOP			;
 
   [ B2] MVK	.S1	-1,	A10
||       NORM	.L1	A4,	A2		; mag_num = norm(abs_num)
||	 NORM	.L2	B4,	B2		; mag_den = norm(abs_den)
||	 MV	.D1	A1,	A6		; copy neg_num
||	 MV	.D2	B1,	B5		; copy neg_den
||	 B	.S2	LOOP			;
 
	 CMPGTU	.L1X	B4,	A4,	A1	; zero_quo = (abs_den > abs_num)
||	 SUB	.L2X	B2,	A2,	B0	; i = mag_den - mag_num
||	 MVK	.S1	31,	A0		;
||	 B	.S2	LOOP			;
|| [!B0] ZERO	.D1	A10
 
	 SHL	.S2	B4,	B0,	B4	; abs_den <<= i
||	 CMPLT	.L2	B0,	6,	B2	; check for negative loop counter
||	 SUB	.D2	B0,	6,	B1	; generate loop counter
|| 	 SUB	.L1X	A0,	B0,	A0	; quotient_shift = 31 - i
|| 	 B	.S1	LOOP			;
 
   [ B2] ZERO	.D2	B1			; zero negative loop counter
||	 SUBC	.L1X	A4,	B4,	A4	; abs_num = _subc(abs_num, abs_den)
||	 B	.S2	LOOP			;

LOOP: 
   [ B0] SUBC	.L1X	A4,	B4,	A4	; abs_num = _subc(abs_num, abs_den)
|| [ B0] SUB	.L2	B0,	1,	B0	; i-- (decrement subc counter)
|| [ B1] SUB	.D2	B1,	1,	B1	; i-- (decrement loop counter)
|| [ B1] B	.S1	LOOP			; for
 
	 RET	.S2	B3			; return
||	 LDW	.D2	*+B15(4),	A11
||	 ZERO	.L2	B2			; MIN_INT
 
   [!A1] SHL	.S1	A4,	A0,	A4	; quotient = abs_num << quotient_shift
|| [ A1] ZERO	.D1	A4			; if (zero_quo) quotient = zero
||	 XOR	.L1X	A6,	B5,	A2	; neg_quo = neg_num ^ neg_den
||       LDW    .D2     *++B15(8),      A10
||	 MVKH	.S2	0x80000000,	B2
 
   [!A1] SHRU	.S1	A4,	A0,	A4	; quotient = abs_num >> quotient_shift
|| 	 CMPEQ	.L2X	B2,	A11,	B0	; num == MIN_INT
 
   [ A2] NEG	.S1	A4,	A4		; if (neg_quo) quotient = -quotient
|| [!B0] ZERO	.L1	A10			; if ((num == MIN_INT) &&

	 MV	.L1	A10,	A2		;     (den is power of 2))
   [ A2] ADD	.L1	A4,	A2,	A4	; then correct divi result

         .endasmfunc

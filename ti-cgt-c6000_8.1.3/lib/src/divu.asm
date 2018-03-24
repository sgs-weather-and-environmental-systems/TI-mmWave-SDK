;******************************************************************************
;* divu  v8.1.3                                                               *
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
; unsigned __divu (unsigned  dividend, unsigned divisor)
; {
;     register int i;
;     register int shift = _lmbd(1, divisor) - _lmbd(1, dividend);
; 
;     if (dividend < divisor) return 0;
; 
;     divisor <<= shift;
;     shift++;
; 
;     for (i = 0; i < shift; i++)
;       dividend = _subc(dividend, divisor);
; 
;     return dividend << (32-shift) >> (32-shift);
; }
; 
; Regs used:
; A0 = quotient_shift
; A1 = mag_den, zero_quo
; A2 = first_div
; A4 = arg1: numerator, retval: quotient
; A6 = copy loop counter
; B0 = subc loop counter
; B1 = mag_num, truth value, loop counter
; B2 = truth value
; B3 = return address
; B4 = arg2: denominator
; 
; Regs killed:
; A0, A1, A2, A4, A6, B0, B1, B2, B4
;
; Regs used but not killed:
; B3

	 .global __divu, __c6xabi_divu
	 .sect	 ".text:__divu"
	 .clink
__c6xabi_divu
__divu:	 .asmfunc
	LMBD	1,	A4,	B1	; mag_num = lmbd(1, num), num32 = (magn_num == 0)
||	LMBD	1,	B4,	A1	; mag_den = lmbd(1, den)
||	MVK	32,	A0		; const 32
||	ZERO	A2			; first_div = 1
 
	CMPGTU	B4,	A4,	A1	; zero_quo = (den > num)
||	SUB	A1,	B1,	B0	; i = mag_den - mag_num
||[!B1] MVK	1,	A2		; if (num32) first_div = 1
 
	SHL	B4,	B0,	B4	; den <<= i
|| [B1]	ADD	B0,	1,	B0	; if (!num32) i++
||	MV	B0,	A6		; copy i
 
	CMPGTU	B4,	A4,	B2	; gt = den > num
||	SUB	A0,	B0,	A0	; quotient_shift = 32 - i
||	SHL	A2,	A6,	A2	; first_div <<= i
||	B	LOOP			;
 
   [B1]	ZERO	B2			; num32 && gt 
|| [B2]	MV	B2,	B1		; !(num32 && !gt)
|| [B2]	SHRU	A2,	1,	A2	; first_div >>= 1
||	B	LOOP			;
 
   [B2]	SHRU	B4,	1,	B4	; if (num32 && gt) den >> 1
||[!B1] SUB	A4,	B4,	A4	; if (num32 && !gt) num -= den
||	B	LOOP			;
 
  [!B1]	SHRU	B4,	1,	B4	; if (num32 && !gt) den >> 1
|| [B2]	SUB	A4,	B4,	A4	; if (num32 && gt) num -= den
||	CMPLT	B0,	7,	B2	; check for negative loop counter
||	SUB	B0,	7,	B1	; generate loop counter
||	B	LOOP			;
 
   [B2]	ZERO	B1			; zero negative loop counter
|| [B0]	SUBC	A4,	B4,	A4	; num = subc(num, den)
|| [B0]	SUB	B0,	1,	B0	; i--
||	B	LOOP			;
 
LOOP: 
   [B0]	SUBC	A4,	B4,	A4	; num = subc(num, den)
|| [B0]	SUB	B0,	1,	B0	; i--
|| [B1]	SUB	B1,	1,	B1	; i--
|| [B1]	B	LOOP			; for
 
	RET	B3			; return

  [!A1]	SHL	A4,	A0,	A4	; quotient = numerator << quotient_shift
|| [A1]	ZERO	A4			; if (zero_quo) quotient = 0
 
  [!A1]	SHRU	A4,	A0,	A4	; quotient = numerator >> quotient_shift

  [!A1]	ADD	A4,	A2,	A4

	NOP	2
        .endasmfunc

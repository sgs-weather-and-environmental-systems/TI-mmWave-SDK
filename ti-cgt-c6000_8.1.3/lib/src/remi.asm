;******************************************************************************
;* remi  v8.1.3                                                               *
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
; int __remi (int dividend, int divisor)
; {
;     int negative_remainder = (dividend<0) && (abs(divisor) <= abs(dividend));
;     register int i;
;     register int shift;
;     int remainder;    
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
;     remainder = dividend >> shift;
;     return (negative_remainder ? -remainder : remainder);
; }
; 
; Regs used:
; A1 = neg_num, zero_quo
; A2 = mag_num, neg_quo
; A4 = arg1: numerator, abs_num, retval: remainder
; A5 = copy numerator
; A6 = copy neg_num
; B0 = subc loop counter
; B1 = loop counter, neg_den, mod
; B2 = mag_den, neg_loopcount, modulo_shift
; B3 = return address
; B4 = arg2: denominator, abs_den
;
; Regs killed:
; A1, A2, A4, A5, A6, B0, B1, B2, B4
;
; Regs used but not killed:
; B3

        .global __remi, __c6xabi_remi
	.sect	".text:__remi"
	.clink
__c6xabi_remi
__remi: .asmfunc

         SHRU   .S1     A4,     31,     A1    ; neg_num = num < 0
||       SHRU   .S2     B4,     31,     B1    ; neg_den = den < 0
||       MV     .D1     A4,     A5            ; copy num
||       MV     .L2     B4,     B10           ; copy den
||       STW    .D2     B10,    *B15--(8)

   [ A1] NEG    .L1     A4,     A4            ; abs_num = abs(num)
|| [ B1] NEG    .L2     B4,     B4            ; abs_den = abs(den)
||       B      .S2     LOOP                  ;
||       STW    .D2     A10,    *+B15(4)
||       ZERO   .S1     A10                   ; MIN_INT
 
         NORM   .L1     A4,     A2            ; mag_num = norm(abs_num)
||       NORM   .L2     B4,     B2            ; mag_den = norm(abs_den)
||       MV     .D1     A1,     A6            ; copy neg_num
||       B      .S1     LOOP                  ;
 
         CMPGTU .L1X    B4,     A4,     A1    ; zero_quo = (abs_den > abs_num)
||       SUB    .L2X    B2,     A2,     B0    ; i = mag_den - mag_num
||       B      .S2     LOOP                  ;
||       MVKH   .S1     0x80000000,     A10
 
         SHL    .S2     B4,     B0,     B4    ; abs_den <<= i
||       CMPLT  .L2     B0,     6,      B2    ; check for negative loop counter
||       SUB    .D2     B0,     6,      B1    ; generate loop counter
||       B      .S1     LOOP                  ;
||       CMPEQ  .L1     A5,     A10,    A10   ; num == MIN_INT
 
   [ B2] ZERO   .L2     B1                    ; zero negative loop counter
||       SUBC   .L1X    A4,     B4,     A4    ; abs_num = _subc(abs_num, abs_den)
||       ADD    .D2     1,      B0,     B2    ; modulo_shift = i + 1
||       B      .S2     LOOP                  ;

LOOP: 
   [ B0] SUBC   .L1X    A4,     B4,     A4    ; abs_num = _subc(abs_num, abs_den)
|| [ B0] SUB    .L2     B0,     1,      B0    ; i-- (decrement subc counter)
|| [ B1] SUB    .D2     B1,     1,      B1    ; i-- (decrement loop counter)
|| [ B1] B      .S1     LOOP                  ; for
 
         RET    .S2     B3                    ; return
||       NEG    .L2     B10,    B4            ; -den
||       MV     .L1X    B10,    A2            ; copy den
||       LDW    .D2     *+B15(4),       A10
 
   [!A1] SHRU   .S2X    A4,     B2,     B1    ; mod = abs_num >> modulo_shift
||       AND    .L2     B4,     B10,    B0    ; den & -den
||       LDW    .D2     *++B15(8),      B10
 
   [ A1] MV     .S2X    A5,     B1            ; if (zero_quo) mod = num
|| [!A1] MV     .S1     A6,     A1            ;\ neg_mod = !zero_quo && neg_num
|| [ A1] ZERO   .D1     A1                    ;/
||       CMPEQ  .L2     B4,     B0,     B2    ; cond1 = -den == (den & -den)
||       CMPEQ  .L1X    A2,     B0,     A2    ; cond2 =  den == (den & -den)
 
   [ A1] NEG    .L2     B1,     B1            ; if (neg_mod) rem = -rem
||       OR     .S1X    A2,     B2,     A2    ; if ((den is power of 2) &&

         MV     .L1     B1,     A4
||       AND    .S1     A2,     A10,    A2    ;     (num == MIN_INT))

   [ A2] ZERO   .L1     A4                    ; then return 0
        .endasmfunc

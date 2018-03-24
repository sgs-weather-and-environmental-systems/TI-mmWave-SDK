;******************************************************************************
;* FD_MUL32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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

;****************************************************************************
;* FD_MUL - MULTIPLY TWO IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;* 	    POINT NUMBERS.
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0:r1
;*   o INPUT OP2 IS IN r2:r3
;*   o RESULT IS RETURNED IN r0:r1
;*   o INPUT OP2 IN r2:r3 IS NOT DESTROYED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS +/- INFINITY 
;*       (0x7ff00000:00000000) or (0xfff00000:00000000) 
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o ROUNDING MODE:  ROUND TO NEAREST
;*
;*   o IF THE OPERATION INVOLVES INFINITY AS AN INPUT, UNLESS THE OTHER INPUT
;*     IS ZERO, THE RESULT IS INFINITY WITH THE SIGN DETERMINED IN THE USUAL
;*     FASHION.
;*
;****************************************************************************
;*
;* +------------------------------------------------------------------+
;* | DOUBLE PRECISION FLOATING POINT FORMAT                           |
;* |   64-bit representation                                          |
;* |   31 30      20 19                  0                            |
;* |   +-+----------+---------------------+                           |
;* |   |S|     E    |        M1           |                           |
;* |   +-+----------+---------------------+                           |
;* |                                                                  |
;* |   31                                0                            |
;* |   +----------------------------------+                           |
;* |   |             M2                   |                           |
;* |   +----------------------------------+                           |
;* |                                                                  |
;* |   <S>  SIGN FIELD    :          0 - POSITIVE VALUE               |
;* |                                 1 - NEGATIVE VALUE               |
;* |                                                                  |
;* |   <E>  EXPONENT FIELD: 0000000000 - ZERO IFF M == 0              |
;* |            0000000001..1111111110 - EXPONENT VALUE(1023 BIAS)    |
;* |                        1111111111 - INFINITY                     |
;* |                                                                  |
;* |   <M1:M2>  MANTISSA FIELDS:  FRACTIONAL MAGNITUDE WITH IMPLIED 1 |
;* +------------------------------------------------------------------+
;*
****************************************************************************

	.arm

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_dmul, __TI_FD_MUL  ; RTS BEING BUILT
        .else
	.clink
        .asg FD_MUL, __TI_FD_MUL
        .endif

	.global	__TI_FD_MUL

	.if .TMS470_BIG_DOUBLE

rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
rp2_hi	.set	r2	; High word of regpair 2
rp2_lo	.set	r3	; Low word of regpair 2
op1m1	.set	r2	; OVERLOADED WITH INPUT #2
op1m2	.set	r3	; OVERLOADED WITH INPUT #2

	.else

rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
rp2_hi	.set	r3	; High word of regpair 2
rp2_lo	.set	r2	; Low word of regpair 2
op1m1	.set	r3	; OVERLOADED WITH INPUT #2
op1m2	.set	r2	; OVERLOADED WITH INPUT #2

	.endif

op1e	.set	r4
op2m1	.set	r5
op2m2	.set	r6
op2e	.set	r7
sign	.set	r8
tmp	.set	lr

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_FD_MUL
	.endif

__TI_FD_MUL: .asmfunc stack_usage(32)
	STMFD	sp!, {r2-r8, lr}
 
        EORS    sign, rp1_hi, rp2_hi    	; SET THE SIGN OF THE RESULT
        MOVMI   sign, #0x80000000       	;
        MOVPL   sign, #0x00000000       	;
 	
	MOV	op2m1, rp2_hi, LSL #11		; BUILD INPUT #2 MANTISSA
	ORR	op2m1, op2m1, rp2_lo, LSR #21	;
	MOV	op2m2, rp2_lo, LSL #11		;
	MOV	op2e, rp2_hi, LSL #1		; BUILD INPUT #2 EXPONENT
	MOVS	op2e, op2e, LSR #21		;
        ORRNE   op2m1, op2m1,#0x80000000	; SET IMPLIED 1 IN MANTISSA
        MOVEQ   rp1_hi, #0                  	; IF op2e == 0, ELSE UNDERFLOW
	MOVEQ	rp1_lo, #0			;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD sp!, {r2-r8, pc}        	;
	.else
	LDMEQFD	sp!, {r2-r8, lr}
	BXEQ	lr
	.endif

	MOV	tmp, #0x700			;
	ADD	tmp, tmp, #0xFF			;
        CMP     op2e, tmp               	; IF op2e == 0x7FF, THEN 
	BEQ	ovfl				; OVERFLOW

	MOV	op1m1, rp1_hi, LSL #11		; BUILD INPUT #1 MANTISSA
	ORR	op1m1, op1m1, rp1_lo, LSR #21	;
	MOV	op1m2, rp1_lo, LSL #11		;
	MOV	op1e, rp1_hi, LSL #1		; BUILD INPUT #1 EXPONENT
	MOVS	op1e, op1e, LSR #21		;
        ORRNE   op1m1, op1m1,#0x80000000	; SET IMPLIED 1 IN MANTISSA
        MOVEQ   rp1_hi, #0                  	; IF op1e == 0, ELSE UNDERFLOW
	MOVEQ	rp1_lo, #0			;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD sp!, {r2-r8, pc}        	;
	.else
	LDMEQFD	sp!, {r2-r8, lr}
	BXEQ	lr
	.endif

        CMP     op1e, tmp               	; IF op1e == 0x7FF, THEN 
	BEQ	ovfl				; OVERFLOW

        ADD     op1e, op1e, op2e        	; ADD EXPONENTS

	; MULTIPLY THE MANTISAE: op1m * op2m => rp1_hi:rp1_lo
	UMULL	rp1_lo, rp1_hi, op1m1, op2m1; op1m1*op2m1=> rp1_hi:rp1_lo:0:0
	UMULL	tmp, op2e, op1m1, op2m2	   ; op1m1*op2m2 =>  0 :op2e:tmp  : 0
	UMULL	op2m2, op1m1, op1m2, op2m2 ; op1m2*op2m2 =>  0 :  0 :op1m1:op2m2
	ADDS	tmp, tmp, op1m1		   ;                 0 :  0 :tmp  :0
	ADCS	op2e, op2e, #0		   ;                 0 :op2e: 0   : 0
	ADC	rp1_hi, rp1_hi, #0	   ;                rp1_hi :  0 : 0   : 0
	UMULL	op2m2, op1m1, op1m2, op2m1 ; op1m2*op2m1 =>  0 :op1m1:op2m2: 0
	ADDS	tmp, tmp, op2m2		   ;                 0 :  0 : tmp : 0
	ADCS	op2e, op2e, #0		   ;                 0 :op2e: 0   : 0
	ADC	rp1_hi, rp1_hi, #0 	   ;            rp1_hi :  0 : 0   : 0
	ADDS	op2e, op2e, op1m1	   ;                 0 :op2e: 0   : 0
	ADC	rp1_hi, rp1_hi, #0	   ;            rp1_hi :  0 : 0   : 0
	ADDS	rp1_lo, rp1_lo, op2e	   ;                 0 :rp1_lo: 0 : 0
	ADCS	rp1_hi, rp1_hi, #0	   ;            rp1_hi :  0 : 0   : 0

	MOVMI	tmp, #0x00000400	   ; SETUP 1/2 CONSTANT FOR ROUNDING
	MOVPL	tmp, #0x00000200	   ;

        ADDS    rp1_lo, rp1_lo, tmp        ; ROUND TO NEAREST
	ADCS	rp1_hi, rp1_hi, #0	   ;

	ADDMI	op1e, op1e, #0x1	   ; ALIGN THE RESULT
	BMI	$1			   ;
	MOVS	rp1_lo, rp1_lo, LSL #1	   ;
	ADC	rp1_hi, rp1_hi, rp1_hi	   ;

$1:	MOV	op2e, #0x300		   ;
	ADD	op2e, op2e, #0xFF	   ;
	SUBS    op1e, op1e, op2e           ; ADJUST FOR BIAS
        MOVLE   rp1_hi, #0x0               ; AND CHECK FOR UNDERFLOW
	MOVLE	rp1_lo, #0x0		   ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMLEFD sp!, {r2-r8, pc}           ;
	.else
	LDMLEFD	sp!, {r2-r8, lr}
	BXLE	lr
	.endif
 
	ADD	op2e, op2e, #0x400	   ; AND CHECK FOR EXPONENT OVERFLOW
        CMP     op1e, op2e	           ;
	BCS	ovfl			   ;

	MOV	rp1_lo, rp1_lo, LSR #11		; REPACK LOW PART OF RESULT 
	ORR	rp1_lo, rp1_lo, rp1_hi, LSL #21	; INTO rp1_lo
	MOV	rp1_hi, rp1_hi, LSL #1		; REPACK HIGH PART OF RESULT 
	MOV	rp1_hi, rp1_hi, LSR #12		; INTO rp1_hi
        ORR     rp1_hi, rp1_hi, op1e, LSL #20   ; REPACK THE EXPONENT INTO 
        ORR     rp1_hi, rp1_hi, sign            ; rp1_hi REPACK THE SIGN INTO 
						; rp1_hi
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r8, pc}     
	.else
	LDMFD	sp!, {r2-r8, lr}
	BX	lr
	.endif   	
 

ovfl:	MOV	rp1_lo, #0			; IF OVERFLOW, RETURN +/- 
	MOV	rp1_hi, #0xFF			; INFINITY
	MOV	rp1_hi, rp1_hi, LSL #3
	ADD	rp1_hi, rp1_hi, #7
	MOV	rp1_hi, rp1_hi, LSL #20
	ORR	rp1_hi, rp1_hi, sign
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r8, pc}        	;
	.else
	LDMFD	sp!, {r2-r8, lr}
	BX	lr
	.endif
 
	.endasmfunc

	.end

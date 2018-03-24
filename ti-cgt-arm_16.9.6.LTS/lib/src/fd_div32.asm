;******************************************************************************
;* FD_DIV32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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
;* FD_DIV - DIVIDES TWO IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;* 	    POINT NUMBERS.
;****************************************************************************
;*
;*   o DIVIDEND INPUT OP1 IS IN r0:r1
;*   o DIVISOR INPUT OP2 IS IN r2:r3
;*   o QUOTIENT IS RETURNED IN r0:r1
;*   o INPUT OP2 IN r2:r3 IS PRESERVED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS +/- INFINITY 
;*       (0x7ff00000:00000000) or (0xfff00000:00000000) 
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o ROUNDING MODE:  ROUND TO NEAREST
;*   o DIVIDE BY ZERO RETURNS ZERO
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
        .asg __aeabi_ddiv, __TI_FD_DIV  ; RTS BEING BUILT
        .else
	.clink
        .asg FD_DIV, __TI_FD_DIV
        .endif

	.global __TI_FD_DIV

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
	.armfunc __TI_FD_DIV
	.endif

__TI_FD_DIV:	.asmfunc stack_usage(32)
	STMFD	sp!, {r2-r8, lr}
 
        EORS    sign, rp1_hi, rp2_hi    ; SET THE SIGN OF THE RESULT
        MOVMI   sign, #0x80000000       ;
        MOVPL   sign, #0x00000000       ;
 	
	MOV	op2m1, rp2_hi, LSL #12	; BUILD INPUT #2 MANTISSA
	MOV	op2m1, op2m1, LSR #12	;
	MOVS	op2m2, rp2_lo, LSL #1	;
	ADC	op2m1, op2m1, op2m1	;
	MOV	op2e, rp2_hi, LSL #1	; BUILD INPUT #2 EXPONENT
	MOVS	op2e, op2e, LSR #21	;
        ORRNE   op2m1, op2m1,#0x00200000; SET IMPLIED 1 IN MANTISSA IF op2e != 0
        MOVEQ   rp1_hi, #0              ; IF op2e == 0, THEN UNDERFLOW
	MOVEQ	rp1_lo, #0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD sp!, {r2-r8, pc}        ;
	.else
	LDMEQFD sp!, {r2-r8, lr}
	BXEQ	lr
	.endif
	
	MOV	tmp, #0x700		;
	ADD	tmp, tmp, #0xFF		;
        CMP     op2e, tmp               ; IF op2e == 0x7FF, THEN OVERFLOW
	BEQ	ovfl			;

	MOV	op1m1, rp1_hi, LSL #12	; BUILD INPUT #1 MANTISSA
	MOV	op1m1, op1m1, LSR #12	;
	MOVS	op1m2, rp1_lo, LSL #1	;
	ADC	op1m1, op1m1, op1m1	;
	MOV	op1e, rp1_hi, LSL #1	; BUILD INPUT #1 EXPONENT
	MOVS	op1e, op1e, LSR #21	;
        ORRNE   op1m1, op1m1,#0x00200000; SET IMPLIED 1 IN MANTISSA IF op1e != 0
        MOVEQ   rp1_hi, #0              ; IF op1e == 0, THEN UNDERFLOW
	MOVEQ	rp1_lo, #0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMEQFD sp!, {r2-r8, pc}        ;
	.else
	LDMEQFD sp!, {r2-r8, lr}
	BXEQ	lr
	.endif

        CMP     op1e, tmp               ; IF op1e == 0x7FF, THEN OVERFLOW
	BEQ	ovfl			;

        SUB     op1e, op1e, op2e        ; SUBTRACT EXPONENTS
 
        ; DIVIDE THE MANTISAE:  op1m / op2m => rp1_hi:rp1_lo
        MOV     rp1_hi, #0x0            ; INITIALIZE THE QUOTIENT
	MOV	rp1_lo, #0x0		;
        MOV     tmp, #54                ; INITIALIZE THE SHIFT COUNTER
 
fdivb:  CMP     op1m1, op2m1            ; IF DIVIDEND IS LARGER THAN DIVISOR,
	BNE	$1			;
	CMP	op1m2, op2m2		;
$1:	BCC	$2			;
        ADCS    rp1_lo, rp1_lo, rp1_lo  ;  SHIFT A 1 INTO THE QUOTIENT
	ADC	rp1_hi, rp1_hi, rp1_hi	;
	SUBS	op1m2, op1m2, op2m2	;  AND SUBTRACT THE DIVISOR FROM
	SBC	op1m1, op1m1, op2m1	;  THE DIVIDEND
	B	$3			;
$2:	ADCS    rp1_lo, rp1_lo, rp1_lo	; ELSE, SHIFT A 0 INTO THE QUOTIENT
	ADC	rp1_hi, rp1_hi, rp1_hi	;
$3:	SUBS	tmp, tmp, #1		; UPDATE THE SHIFT COUNTER
	BEQ	fdive			; EXIT IF OUT OF SHIFTS
	ORRS	op2e, op1m1, op1m2	;
	BEQ	fdive			; IF DIVIDEND STILL THERE,
	MOVS	op1m2, op1m2, LSL #1	;  UPDATE DIVIDEND
	ADC	op1m1, op1m1, op1m1	;  AND
	B	fdivb			;  CONTINUE
 
fdive:  CMP	tmp, #32		; ADJUST THE QUOTIENT AS NECESSARY
	BCS	low			;
	CMP	tmp, #22		;
	BCC	high			;

mid:	RSB	op2e, tmp, #32		;
	MOV	rp1_hi, rp1_lo, LSR op2e;
	MOV	rp1_lo, rp1_lo, LSL tmp	;
	B	cont			;

low:	SUB	tmp, tmp, #32		;
	MOV	rp1_hi, rp1_lo, LSL tmp	;
	MOV	rp1_lo, #0		;
	B	cont			;

high:	MOV	rp1_hi, rp1_hi, LSL tmp	;
	RSB	op2e, tmp, #32		;
	ORR	rp1_hi, rp1_hi, rp1_lo, LSR op2e
	MOV	rp1_lo, rp1_lo, LSL tmp	;

cont:   TST     rp1_hi, #0x00200000     ; ALIGN THE QUOTIENT
	BNE	$4			;
	MOVS	rp1_lo, rp1_lo, LSL #1	;
	ADC	rp1_hi, rp1_hi, rp1_hi	;
        SUB     op1e, op1e, #0x1        ;
 
$4:     ADDS    rp1_lo, rp1_lo, #0x00000001     ; 1/2 ADJUST FOR ROUNDING
	ADC	rp1_hi, rp1_hi, #0		;
	TST	rp1_hi, #0x00400000		;
        ADDNE   op1e, op1e, #0x1        	;
	BICNE	rp1_hi, rp1_hi, #0x00400000	;
	BICEQ	rp1_hi, rp1_hi, #0x00200000	;
 
	MOV	op2e, #0x300		;
	ADD	op2e, op2e, #0xFF	;
	ADDS    op1e, op1e, op2e        ; ADJUST FOR BIAS
        MOVLE   rp1_hi, #0x0            ; AND CHECK FOR UNDERFLOW
	MOVLE	rp1_lo, #0x0		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMLEFD sp!, {r2-r8, pc}        ;
	.else
	LDMLEFD	sp!, {r2-r8, lr}
	BXLE	lr
	.endif
 
	ADD	op2e, op2e, #0x400	; AND CHECK FOR EXPONENT OVERFLOW
        CMP     op1e, op2e	        ;
	BCS	ovfl			;

	MOVS	rp1_hi, rp1_hi, LSR #1		; REPACK THE QUOTIENT INTO 
	MOV	rp1_lo, rp1_lo, RRX		; rp1_hi:rp1_lo. REPACK THE 
        ORR     rp1_hi, rp1_hi, op1e, LSL #20   ; EXPONENT INTO rp1_hi.
        ORR     rp1_hi, rp1_hi, sign            ; REPACK THE SIGN INTO rp1_hi
 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r8, pc}
	.else
	LDMFD	sp!, {r2-r8, lr}
	BX	lr
	.endif
 
ovfl:	MOV	rp1_lo, #0x0			; IF OVERFLOW, RETURN +/- 
	MOV	rp1_hi, #0xFF			; INFINITY
	MOV	rp1_hi, rp1_hi, LSL #3
	ADD	rp1_hi, rp1_hi, #7
	MOV	rp1_hi, rp1_hi, LSL #20
	ORR	rp1_hi, rp1_hi, sign
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {r2-r8, pc}
	.else
	LDMFD	sp!, {r2-r8, lr}
	BX	lr
	.endif
 
	.endasmfunc

	.end

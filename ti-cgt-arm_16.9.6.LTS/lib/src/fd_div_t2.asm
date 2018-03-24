;******************************************************************************
;* FD_DIV_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
;* FD$DIV - DIVIDES TWO IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
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

	.thumb

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_ddiv, __TI_FD$DIV  ; RTS BEING BUILT
        .else
	.clink
        .asg FD$DIV, __TI_FD$DIV
        .endif

	.global __TI_FD$DIV

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
	
	.thumbfunc __TI_FD$DIV
__TI_FD$DIV:	.asmfunc stack_usage(32)
	PUSH	{r2-r8, lr}
 
        EORS    sign, rp1_hi, rp2_hi    ; SET THE SIGN OF THE RESULT
	ITE	MI
        MOVMI	sign, #0x80000000       ;
        MOVPL	sign, #0x00000000       ;
 	
	LSL	op2m1, rp2_hi, #12	; BUILD INPUT #2 MANTISSA
	LSR	op2m1, op2m1, #12	;
	LSLS	op2m2, rp2_lo, #1	;
	ADCS	op2m1, op2m1, op2m1	;
	LSL	op2e, rp2_hi, #1	; BUILD INPUT #2 EXPONENT
	LSRS.W	op2e, op2e, #21		;
	ITEEE	NE
        ORRNE	op2m1, op2m1,#0x00200000; SET IMPLIED 1 IN MANTISSA IF op2e != 0
        MOVEQ	rp1_hi, #0              ; IF op2e == 0, THEN UNDERFLOW
	MOVEQ	rp1_lo, #0		;
        POPEQ	{r2-r8, pc}		;

	MOV	tmp, #0x700		;
	ADDS	tmp, tmp, #0xFF		;
        CMP	op2e, tmp               ; IF op2e == 0x7FF, THEN OVERFLOW
	BEQ	ovfl			;

	LSL	op1m1, rp1_hi, #12	; BUILD INPUT #1 MANTISSA
	LSR	op1m1, op1m1, #12	;
	LSLS	op1m2, rp1_lo, #1	;
	ADCS	op1m1, op1m1, op1m1	;
	LSL	op1e, rp1_hi, #1	; BUILD INPUT #1 EXPONENT
	LSRS	op1e, op1e, #21		;
	ITEEE	NE
        ORRNE	op1m1, op1m1,#0x00200000; SET IMPLIED 1 IN MANTISSA IF op1e != 0
        MOVEQ	rp1_hi, #0              ; IF op1e == 0, THEN UNDERFLOW
	MOVEQ	rp1_lo, #0		;
        POPEQ	{r2-r8, pc}		;

        CMP	op1e, tmp               ; IF op1e == 0x7FF, THEN OVERFLOW
	BEQ	ovfl			;

        SUBS	op1e, op1e, op2e        ; SUBTRACT EXPONENTS
 
        ; DIVIDE THE MANTISAE:  op1m / op2m => rp1_hi:rp1_lo
        MOVS	rp1_hi, #0x0            ; INITIALIZE THE QUOTIENT
	MOVS	rp1_lo, #0x0		;
        MOVS	tmp, #54                ; INITIALIZE THE SHIFT COUNTER
 
fdivb:  CMP	op1m1, op2m1            ; IF DIVIDEND IS LARGER THAN DIVISOR,
	BNE	$1			;
	CMP	op1m2, op2m2		;
$1:	BCC	$2			;
        ADCS	rp1_lo, rp1_lo, rp1_lo  ;  SHIFT A 1 INTO THE QUOTIENT
	ADCS	rp1_hi, rp1_hi, rp1_hi	;
	SUBS	op1m2, op1m2, op2m2	;  AND SUBTRACT THE DIVISOR FROM
	SBC	op1m1, op1m1, op2m1	;  THE DIVIDEND
	B	$3			;
$2:	ADCS	rp1_lo, rp1_lo, rp1_lo	; ELSE, SHIFT A 0 INTO THE QUOTIENT
	ADCS	rp1_hi, rp1_hi, rp1_hi	;
$3:	SUBS	tmp, tmp, #1		; UPDATE THE SHIFT COUNTER
	BEQ	fdive			; EXIT IF OUT OF SHIFTS
	ORRS	op2e, op1m1, op1m2	;
	BEQ	fdive			; IF DIVIDEND STILL THERE,
	LSLS	op1m2, op1m2, #1	;  UPDATE DIVIDEND
	ADCS	op1m1, op1m1, op1m1	;  AND
	B	fdivb			;  CONTINUE
 
fdive:  CMP	tmp, #32		; ADJUST THE QUOTIENT AS NECESSARY
	BCS	low			;
	CMP	tmp, #22		;
	BCC	high			;

mid:	RSB	op2e, tmp, #32		;
	LSR	rp1_hi, rp1_lo, op2e;
	LSL	rp1_lo, rp1_lo, tmp	;
	B	cont			;

low:	SUB	tmp, tmp, #32		;
	LSL	rp1_hi, rp1_lo, tmp	;
	MOVS	rp1_lo, #0		;
	B	cont			;

high:	LSL	rp1_hi, rp1_hi, tmp	;
	RSB	op2e, tmp, #32		;
	LSR	op2e, rp1_lo, op2e
	ORR	rp1_hi, rp1_hi, op2e
	LSL	rp1_lo, rp1_lo, tmp	;

cont:   TST	rp1_hi, #0x00200000     ; ALIGN THE QUOTIENT
	BNE	$4			;
	LSLS	rp1_lo, rp1_lo, #1	;
	ADCS	rp1_hi, rp1_hi, rp1_hi	;
        SUBS	op1e, op1e, #0x1        ;
 
$4:     ADDS	rp1_lo, rp1_lo, #0x00000001     ; 1/2 ADJUST FOR ROUNDING
	ADCS	rp1_hi, rp1_hi, #0		;
	TST	rp1_hi, #0x00400000		;
	ITTE	NE
        ADDNE	op1e, op1e, #0x1        	;
	BICNE	rp1_hi, rp1_hi, #0x00400000	;
	BICEQ	rp1_hi, rp1_hi, #0x00200000	;
 
	MOV	op2e, #0x300		;
	ADDS	op2e, op2e, #0xFF	;
	ADDS	op1e, op1e, op2e        ; ADJUST FOR BIAS
	ITTT	LE
        MOVLE	rp1_hi, #0x0            ; AND CHECK FOR UNDERFLOW
	MOVLE	rp1_lo, #0x0		;
        POPLE	{r2-r8, pc}        ;
 
	ADD	op2e, op2e, #0x400	; AND CHECK FOR EXPONENT OVERFLOW
        CMP	op1e, op2e	        ;
	BCS	ovfl			;

	LSRS	rp1_hi, rp1_hi, #1		; REPACK THE QUOTIENT INTO 
	RRX	rp1_lo, rp1_lo			; rp1_hi:rp1_lo. REPACK THE 
        ORR	rp1_hi, rp1_hi, op1e, LSL #20   ; EXPONENT INTO rp1_hi.
        ORR	rp1_hi, rp1_hi, sign            ; REPACK THE SIGN INTO rp1_hi
 
        POP	{r2-r8, pc}        
 
ovfl:	MOVS	rp1_lo, #0x0			; IF OVERFLOW, RETURN +/- 
	MOVS	rp1_hi, #0xFF			; INFINITY
	LSL	rp1_hi, rp1_hi, #3
	ADDS	rp1_hi, rp1_hi, #7
	LSL	rp1_hi, rp1_hi, #20
	ORR	rp1_hi, rp1_hi, sign
        POP	{r2-r8, pc}        
 
	.endasmfunc

	.end

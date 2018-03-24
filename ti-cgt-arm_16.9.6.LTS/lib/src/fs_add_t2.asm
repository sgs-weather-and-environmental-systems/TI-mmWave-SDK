;******************************************************************************
;* FS_ADD_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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

;*****************************************************************************
;* FS$ADD/FS$SUB - ADD/SUBTRACT TWO IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;* 	           POINT NUMBERS.
;*****************************************************************************
;*
;*   o INPUT OP1 IS IN r0
;*   o INPUT OP2 IS IN r1
;*   o RESULT IS RETURNED IN r0
;*   o FOR SUBTRACTION, INPUT OP2 IN r1 IS KILLED 
;*
;*   o SUBTRACTION, OP1 - OP2, IS IMPLEMENTED WITH ADDITION, OP1 + (-OP2)
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS +/- INFINITY (0x7f800000/ff800000)
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
;*   o ROUNDING MODE:  ROUND TO NEAREST (TIE TO EVEN)
;*
;*   o IF OPERATION INVOLVES INFINITY AS AN INPUT, THE FOLLOWING SUMMARIZES
;*     THE RESULT:
;*                   +----------+----------+----------+ 
;*         ADDITION  + OP2 !INF | OP2 -INF + OP2 +INF +
;*        +----------+==========+==========+==========+ 
;*        + OP1 !INF +    -     |   -INF   +   +INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 -INF +   -INF   |   -INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 +INF +   +INF   |   +INF   +   +INF   +
;*        +----------+----------+----------+----------+
;*
;*                   +----------+----------+----------+ 
;*       SUBTRACTION + OP2 !INF | OP2 -INF + OP2 +INF +
;*        +----------+==========+==========+==========+ 
;*        + OP1 !INF +    -     |   +INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 -INF +   -INF   |   -INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 +INF +   +INF   |   +INF   +   +INF   +
;*        +----------+----------+----------+----------+
;*
;****************************************************************************
;*
;* +--------------------------------------------------------------+
;* | SINGLE PRECISION FLOATING POINT FORMAT                       |
;* |								  |
;* |   31 30    23 22                    0			  |
;* |   +-+--------+-----------------------+			  |
;* |   |S|    E   |           M           +			  |
;* |   +-+--------+-----------------------+			  |
;* |								  |
;* |   <S>  SIGN FIELD    :        0 - POSITIVE VALUE		  |
;* |			           1 - NEGATIVE VALUE		  |
;* |								  |
;* |   <E>  EXPONENT FIELD:       00 - ZERO IFF M == 0		  |
;* |			     01...FE - EXPONENT VALUE (127 BIAS)  |
;* |				  FF - INFINITY			  |
;* |								  |
;* |   <M>  MANTISSA FIELD:  FRACTIONAL MAGNITUDE WITH IMPLIED 1  |
;* +--------------------------------------------------------------+
;*
;****************************************************************************

	.thumb

        .if __TI_EABI_ASSEMBLER
        .asg __aeabi_fadd, __TI_FS$ADD
        .asg __aeabi_fsub, __TI_FS$SUB
        .else
	.clink
        .asg FS$ADD, __TI_FS$ADD
        .asg FS$SUB, __TI_FS$SUB
        .endif

m0	.set	r2
e0	.set	r3
m1	.set	r4
e1	.set	r5
shift	.set	r6
tmp	.set	r7
sticky  .set    r8

	.thumbfunc __TI_FS$SUB, __TI_FS$ADD
        .global __TI_FS$ADD
        .global __TI_FS$SUB
__TI_FS$SUB: .asmfunc stack_usage(24)
	EOR	r1, r1, #0x80000000	; NEGATE INPUT #2
__TI_FS$ADD:
	PUSH	{r2-r8, lr}

	LSL	m1, r1, #8		; PUT INPUT #2 MANTISSA IN m1
	LSL	e1, r1, #1		; PUT INPUT #2 EXPONENT IN e1
	LSRS	e1, e1, #24		;
	BNE	$1			;

	CMP	m1, #0			; IF DENORMALIZED NUMBER (m0 != 0 AND
	IT	NE
	MOVNE	r0, #0			; e1 == 0), THEN UNDERFLOW
	POP	{r2-r8, pc}	; ELSE IT IS ZERO SO RETURN INPUT #1

$1:	ORR	m1, m1, #0x80000000	; SET IMPLIED ONE IN MANTISSA

	CMP	e1, #0xFF		; IF e1 == 0xFF, THEN OVERFLOW
	
	BEQ	ovfl1			;

	LSR	m1, m1, #2		; ADJUST THE MANTISSA
	CMP	r1, #0			; IF INPUT #2 IS NEGATIVE,
	IT	MI
	RSBMI	m1, m1, #0		;  THEN NEGATE THE MANTISSA
	
	LSL	m0, r0, #8		; PUT INPUT #1 MANTISSA IN m0
	LSL	e0, r0, #1		; PUT INPUT #1 EXPONENT IN e0
	LSRS	e0, e0, #24		;
	BNE	$2			;

	CMP	m0, #0			; IF DENORMALIZED NUMBER (m0 != 0 AND
	ITE	NE
	MOVNE	r0, #0			; e0 == 0), THEN UNDERFLOW
	MOVEQ	r0, r1			; ELSE IT IS ZERO SO RETURN INPUT #2
	POP	{r2-r8, pc}	;

$2:	ORR	m0, m0, #0x80000000	; SET IMPLIED ONE IN MANTISSA

	CMP	e0, #0xFF		; IF e0 == 0xFF, THEN OVERFLOW
	BEQ	ovfl0			;

	LSR	m0, m0, #2		; ADJUST THE MANTISSA
	CMP	r0, #0			; IF INPUT #1 IS NEGATIVE,
	IT	MI
	RSBMI	m0, m0, #0		;  THEN NEGATE THE MANTISSA
	
	SUBS	shift, e0, e1		; GET THE SHIFT AMOUNT
	ITTTT	MI
	MOVMI	tmp, m0			; IF THE SHIFT AMOUNT IS NEGATIVE, THEN
	MOVMI	m0, m1			;  SWAP THE TWO MANTISSA SO THAT m0
	MOVMI	m1, tmp			;  CONTAINS THE LARGER VALUE,
	RSBMI	shift, shift, #0	;  AND NEGATE THE SHIFT AMOUNT,
	IT	MI
	MOVMI	e0, e1			;  AND ENSURE THE LARGER EXP. IS IN e0
        
	CMP	shift, #25		; IF THE 2nd MANTISSA IS SIGNIFICANT,
	ITTEE	MI
	ASRMI	tmp, m1, shift
	ADDMI	m0, m0, tmp		; ADD IT TO THE FIRST MANTISSA
        MOVPL   sticky, #0              ; IF NOT SIGNIFICANT, STICKY = 0
        BPL     skip_sticky             ; SKIP COMPUTATION OF STICKY BIT
        RSB     tmp, shift, #28         ;
        LSL     sticky, m1, tmp         ; GET THE BITS THAT WERE SHIFTED OUT

skip_sticky:
	CMP	m0, #0x0		;
	ITT	EQ
	MOVEQ	r0, #0			; IF THE RESULT IS ZERO, 
	POPEQ	{r2-r8, pc}	        ; THEN UNDERFLOW
	ITTE	MI                      ;
	RSBMI	m0, m0, #0x0		; IF THE RESULT IS NEGATIVE, THEN
	MOVMI	tmp, #0x1		; NEGATE THE RESULT AND
	MOVPL	tmp, #0x0		; NOTE THE SIGN

loop:	SUB	e0, e0, #1       	; ADJUSTING THE EXPONENT AS NECESSARY
        LSLS	m0, m0, #1		; NORMALIZE THE RESULTING MANTISSA
	BPL	loop			;

        ANDS    m1, m0, #0x80           ; GUARD BIT
        BEQ     no_round                ; IF GUARD BIT 0, DO NOT ROUND
        AND     e1, m0, #0x20           ; IF RESULT REQUIRED NORMALIZATION
        ORR     sticky, sticky, e1      ;  BIT 26 MUST BE ADDED TO STICKY
	ADDS	m0, m0, #0x80		; ROUND THE MANTISSA TO THE NEAREST
	IT	CS                      ;
	ADDCS	e0, e0, #1		; ADJUST EXPONENT IF AN OVERFLOW OCCURS
        AND     m1, m0, #0x40           ; GET ROUND BIT
        ORRS    sticky, sticky, m1      ; (STICKY + ROUND)
        IT      EQ                      ; IF (ROUND + STICKY) == 0,
        BICEQ   m0, m0, #0x100          ; WE HAVE A TIE, ROUND TO EVEN

no_round:
	ADDS	e0, e0, #2		; NORMALIZE THE EXPONENT
	ITT	LE
	MOVLE	r0, #0			; CHECK FOR UNDERFLOW
	POPLE	{r2-r8, pc}	;
	CMP	e0, #0xFF		; CHECK FOR OVERFLOW
	BCS	ovfl			;

        BIC     m0, m0, #0xFF           ; CLEAR GUARD, ROUND, AND STICKY BITS
	LSL	m0, m0, #1		; REMOVE THE IMPLIED ONE

	LSR	r0, m0, #9		; REPACK THE MANTISSA INTO r0
	ORR	r0, r0, e0, LSL #23	; REPACK THE EXPONENT INTO r0
	ORR	r0, r0, tmp, LSL #31	; REPACK THE SIGN INTO r0

	POP	{r2-r8, pc}	;
	
ovfl1:	MOV	r0, r1			; OVERFLOW
ovfl0:  LSR	tmp, r0, #31		;
ovfl:	LSL	tmp, tmp, #31		; ISOLATE SIGN BIT
	MOVS	r0, #0xFF		; SET UP Emax EXPONENT
	LSL	r0, r0, #23
	ORRS	r0, r0, tmp		; COMBINE SIGN AND EXPONENT
	POP	{r2-r8, pc}	;

	.endasmfunc

	.end

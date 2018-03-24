;******************************************************************************
;* FS_MUL_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
;* FS$MUL - MULTIPLY TWO IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;* 	    POINT NUMBERS.
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0
;*   o INPUT OP2 IS IN r1
;*   o RESULT IS RETURNED IN r0
;*   o INPUT OP2 IN r1 IS NOT DESTROYED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS +/- INFINITY (0x7f800000/ff800000)
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
;*   o DENORMALIZED NUMBERS ARE TREATED AS UNDERFLOWS
;*   o ROUNDING MODE:  ROUND TO NEAREST
;*
;*   o IF THE OPERATION INVOLVES INFINITY AS AN INPUT, UNLESS THE OTHER INPUT
;*     IS ZERO, THE RESULT IS INFINITY WITH THE SIGN DETERMINED IN THE USUAL
;*     FASHION.
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

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_fmul, __TI_FS$MUL     ; RTS BEING BUILT
        .else
	.clink
        .asg FS$MUL, __TI_FS$MUL
        .endif

in1	.set	r0
in2	.set	r1

m1	.set	r2
e1	.set	r3
m2	.set	r4
e2	.set	r5
sign	.set	r6
tmp	.set	r7

	.thumbfunc __TI_FS$MUL
	.global __TI_FS$MUL
__TI_FS$MUL:	.asmfunc stack_usage(24)
	PUSH	{r2-r7, lr}

	EORS	sign, in1, in2		; SET THE SIGN OF THE RESULT
	ITE	MI
	MOVMI	sign, #0x80000000	;
	MOVPL	sign, #0x00000000	;

	LSL	m1, in1, #8		; PUT INPUT #1 MANTISSA IN m1
	LSL	e1, in1, #1		; PUT INPUT #1 EXPONENT IN e1
	LSRS	e1, e1, #24		;
	ITEE	NE
	ORRNE	m1, m1, #0x80000000	; SET IMPLIED ONE IN MANTISSA IF e1 != 0

	MOVEQ	in1, #0			; IF e1 == 0, THEN UNDERFLOW
	POPEQ	{r2-r7, pc}	;

	CMP	e1, #0xFF		; IF e1 == 0xFF, THEN OVERFLOW
	BEQ	ovfl			;

	LSL	m2, in2, #8		; PUT INPUT #2 MANTISSA IN m2
	LSL	e2, in2, #1		; PUT INPUT #2 EXPONENT IN e2
	LSRS	e2, e2, #24		;
	ITEE	NE
	ORRNE	m2, m2, #0x80000000	; SET IMPLIED ONE IN MANTISSA IF e2 != 0

	MOVEQ	in1, #0			; IF e2 == 0, THEN UNDERFLOW
	POPEQ	{r2-r7, pc}		;

	CMP	e2, #0xFF		; IF e2 == 0xFF, THEN OVERFLOW
	BEQ	ovfl			;

	ADDS	e1, e1, e2		; ADD EXPONENTS

	UMULL	e2, m2, m1, m2		; MULTIPLY THE MANTISAE INTO m2:e2

	CMP	m2, #0			;
	ITT	PL
	LSLPL	m2, m2, #1		; ADJUST THE EXPONENT AS NECESSARY
	SUBPL	e1, e1, #0x1		; AND ADJUST FOR BIAS

	ADDS	m2, m2, #0x00000080	; ADD 1/2 FOR ROUNDING
	ITT	CS
	ADDCS	e1, e1, #0x1		; AND ADJUST FOR OVERFLOW
	LSRCS	m2, m2, #1		;

	SUBS	e1, e1, #0x00000007E	; ADJUST THE BIAS
	ITT	LE
	MOVLE	in1, #0			; AND CHECK FOR UNDERFLOW
	POPLE	{r2-r7, pc}	;

	CMP	e1, #0x000000FF		; CHECK FOR EXPONENT OVERFLOW
	BCS	ovfl			;

	LSR	in1, m2, #8		; SETUP THE MANTISSA
	BICS	in1, in1, #0x00800000	; REMOVE IMPLIED 1 IN MANTISSA
	ORR	in1, in1, e1, LSL #23	; REPACK THE EXPONENT INTO in1
	ORRS	in1, in1, sign		; REPACK THE SIGN INTO in1
		
	POP	{r2-r7, pc}	;

ovfl:	MOVS	tmp, #0xFF		; OVERFLOW, RETURN +/- INFINITY
	LSLS	tmp, tmp, #23	; 
	ORR	in1, sign, tmp		;
	POP	{r2-r7, pc}	;

	.endasmfunc

	.end

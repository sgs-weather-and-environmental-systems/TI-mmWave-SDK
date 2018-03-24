;******************************************************************************
;* FD_TOI16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* FD$TOI - CONVERT AN IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;*          INTO A SIGNED 32 BIT INTEGER 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0:r1
;*   o RESULT IS RETURNED IN r0
;*   o INPUT OP IN r1 IS DESTROYED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0x7FFFFFFF/0x80000000, DEPENDING ON THE SIGN OF
;*     THE INPUT
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
;*   o ROUNDING MODE:  ROUND TO ZERO
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
;****************************************************************************

	.thumb

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_d2iz, __TI_FD$TOI     ; RTS BEING BUILT
        .else
	.clink
        .asg FD$TOI, __TI_FD$TOI
        .endif

	.global	__TI_FD$TOI

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

ope	.set	r2
tmp	.set	r3
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
sign	.set	lr
	.else
sign	.set	r4
	.endif
	
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FD$TOI
	.endif

__TI_FD$TOI:	.asmfunc stack_usage(12)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	PUSH	{r2, r3, lr}		; SAVE CONTEXT
	.else
	PUSH	{r2, r3, r4}
	.endif
	
	LSLS	ope, rp1_hi, #1		; PUT EXPONENT IN ope
	LSRS	ope, ope, #21		;

	MOVS	tmp, #0x3		;
	LSLS	tmp, tmp, #8		;
	ADDS	tmp, #0xFF		;
	SUBS	ope, ope, tmp		; ADJUST FOR EXPONENT BIAS AND
	BCC	unfl			; CHECK FOR UNDERFLOW

	MOVS	tmp, #0x1F		;
	SUBS	ope, tmp, ope		; CHECK FOR OVERFLOW
	BLS	ovfl			; IF OVERFLOW, RETURN INFINITY

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	MOV	sign, rp1_hi		; SAVE SIGN
	.else
	MOVS	sign, rp1_hi		; SAVE SIGN
	.endif
	LSLS	rp1_hi, rp1_hi, #11	; PUT HI MANTISSA IN rp1_hi
	MOVS	tmp, #0x1		;
	LSLS	tmp, tmp, #31		;
	ORRS	rp1_hi, tmp		; SET IMPLIED ONE IN HI MANTISSA

	LSRS	rp1_hi, ope		; COMPUTE THE INTEGER VALUE
	CMP	ope, #11		; FROM HI HALF OF THE MANTISSA.
	BCS	$1			; IF THE LOW HALF OF THE MANTISSA IS
	ADDS	ope, #21		;  SIGNIFICANT, INCLUDE IT INTO THE 
	LSRS	rp1_lo, ope		;  INTEGER VALUE, ALSO.
	ORRS	rp1_hi, rp1_lo		; 

$1:
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	MOV	tmp, sign		;
	.else
	MOVS	tmp, sign		;
	.endif
	CMP	tmp, #0x0		; IF THE INPUT IS NEGATIVE,
	BPL	$2			;  THEN NEGATE THE RESULT
	NEGS	rp1_hi, rp1_hi    	;

$2:	
	.if .TMS470_LITTLE_DOUBLE	; IN LITTLE ENDIAN MODE MAKE SURE
	MOVS	r0, r1			; RESULT IS IN R0.
	.endif
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r2, r3, pc}		;
	.else
	POP	{r2, r3, r4}
	BX	lr
	.endif

unfl:   MOVS    r0, #0                  ; UNDERFLOW
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r2, r3, pc}		;
	.else
	POP	{r2, r3, r4}
	BX	lr
	.endif
 
ovfl:	MOVS	tmp, rp1_hi		; IF OVERFLOW, RETURN INFINITY
	MOVS	r0, #0x1		;
	LSLS	r0, r0, #31		;
	CMP	tmp, #0			; CHECK THE SIGN OF THE INPUT
	BMI	$3			; AND ADJUST THE VALUE OF INFINITY
	SUBS	r0, #1			; ACCORDINGLY
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
$3:	POP	{r2, r3, pc}		;
	.else
$3:	POP	{r2, r3, r4}
	BX	lr
	.endif

	.endasmfunc

	.end

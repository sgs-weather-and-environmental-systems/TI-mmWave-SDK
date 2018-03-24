;******************************************************************************
;* FD_TOU16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* FD$TOU - CONVERT AN IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;*          INTO AN UNSIGNED 32 BIT INTEGER 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0:r1
;*   o RESULT IS RETURNED IN r0
;*   o INPUT OP IN r1 IS DESTROYED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0xFFFFFFFF
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
;*   o NEGATIVE VALUE RETURNS ZERO
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
        .asg __aeabi_d2uiz, __TI_FD$TOU     ; RTS BEING BUILT
        .else
	.clink
        .asg FD$TOU, __TI_FD$TOU
        .endif

	.global	__TI_FD$TOU

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

ope	.set	r2
tmp	.set	r3

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FD$TOU
	.endif

__TI_FD$TOU:	.asmfunc stack_usage(8)
	PUSH	{r2, r3}		; SAVE CONTEXT

	CMP	rp1_hi, #0		; CHECK FOR A NEGATIVE VALUE
	BMI	unfl			;

	LSLS	ope, rp1_hi, #1		; PUT EXPONENT IN ope
	LSRS	ope, ope, #21		;

	MOVS	tmp, #0x3		;
	LSLS	tmp, tmp, #8		;
	ADDS	tmp, #0xFF		;
	SUBS	ope, ope, tmp		; ADJUST FOR EXPONENT BIAS AND
	BCC	unfl			; CHECK FOR UNDERFLOW

	MOVS	tmp, #0x1F		;
	SUBS	ope, tmp, ope		; CHECK FOR OVERFLOW
	BCC	ovfl			; IF OVERFLOW, RETURN 0xFFFFFFFF

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
	; If little endian doubles, copy the result into r0 for return.
	.if .TMS470_LITTLE_DOUBLE
	MOVS	r0, rp1_hi		;
	.endif
	POP	{r2, r3}		;
	BX	lr			;

unfl:   MOVS    r0, #0                  ; UNDERFLOW
	POP	{r2, r3}		;
	BX	lr			;
 
ovfl:	MOVS	r0, #0x0		; IF OVERFLOW, RETURN INFINITY
	SUBS	r0, r0, #0x1		;
	POP	{r2, r3}		;
	BX	lr			;
 
	.endasmfunc

	.end

;******************************************************************************
;* I_TOFS_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
;* I$TOFS - CONVERT A 32 BIT SIGNED INTEGER TO AN IEEE 754 FORMAT
;*          SINGLE PRECISION FLOATING POINT NUMBER
;****************************************************************************
;*
;*   o INPUT OP IS IN R0
;*   o RESULT IS RETURNED IN R0
;*
;*   o ROUNDING MODE:  ROUND TO NEAREST
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

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_i2f, __TI_I$TOFS  ; RTS BEING BUILT
        .else
	.clink
        .asg I$TOFS, __TI_I$TOFS 
        .endif

m0	.set	r1
e0	.set	r2

	.thumbfunc __TI_I$TOFS
	.global __TI_I$TOFS
__TI_I$TOFS:	.asmfunc stack_usage(12)
	CMP	r0, #0			; 
	IT	EQ
	BXEQ	lr			; IF ZERO, RETURN ZERO

	PUSH	{m0, r2, lr}		; SAVE CONTEXT

	ITE	PL
	MOVPL	m0, r0			;
	RSBSMI	m0, r0, #0		; IF NEGATIVE, NEGATE IT

	MOV	e0, #0x9E		; SET THE EXPONENT FIELD

	BMI	$1			;		
loop:	SUBS	e0, e0, #1		; ADJUSTING THE EXPONENT, ACCORDINGLY
	LSLS	m0, m0, #1		; NORMALIZE THE MANTISSA
	BPL	loop			;

$1:	ADDS	m0, m0, #0x00000080	; ADD 1/2 TO ROUND
	ITE	CS
	ADDCS	e0, e0, #0x1		; AND ADJUST THE EXPONENT ACCORDINGLY
	LSLCC	m0, m0, #1		; MASK IMPLIED 1 OUT OF THE MANTISSA

	LSR	m0, m0, #9		; PACK THE MANTISSA
	ORR	m0, m0, e0, LSL #23	; PACK THE EXPONENT
	CMP	r0, #0			; IF THE INPUT WAS NEGATIVE
	ITE	MI
	ORRMI	r0, m0, #0x80000000	;  THEN SET THE SIGN FIELD
	MOVPL	r0, m0			;

	POP 	{m0, r2, pc}		; RESTORE CONTEXT

	.endasmfunc

	.end

;******************************************************************************
;* I_TOFS16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
        .asg __aeabi_i2f, __TI_I$TOFS   ; RTS BEING BUILT
        .else
	.clink
        .asg I$TOFS, __TI_I$TOFS 
        .endif

m0	.set	r1
e0	.set	r2

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_I$TOFS
	.endif

	.global __TI_I$TOFS
__TI_I$TOFS:	.asmfunc stack_usage(8)
	PUSH	{r1, r2}		; SAVE CONTEXT

	MOVS	e0, #0x9E		; SET THE EXPONENT FIELD

	CMP	r0, #0			; IF ZERO, RETURN ZERO
	BMI	$1			;
	BNE	$2			;
	POP	{r1, r2}		;
	BX	lr			; 

$1:	NEGS	m0, r0			; IF NEGATIVE, NEGATE IT
	BMI	cont			;
	B	loop			;
$2:	MOVS	m0, r0			;

loop:	SUBS	e0, #1			; NORMALIZE THE MANTISSA
	LSLS	m0, m0, #1		; ADJUSTING THE EXPONENT, ACCORDINGLY
	BPL	loop			;

cont:	ADDS	m0, #0x80		; ADD 1/2 TO ROUND
	BCC	$3			;
	ADDS	e0, #0x1		; AND ADJUST THE EXPONENT ACCORDINGLY
	B	$4			;

$3:	LSLS	m0, m0, #1		; MASK IMPLIED 1 OUT OF THE MANTISSA

$4:	LSRS	m0, m0, #9		; PACK THE MANTISSA
	LSLS	e0, e0, #23		;
	ORRS	m0, e0			; PACK THE EXPONENT
	CMP	r0, #0			; IF THE INPUT WAS NEGATIVE
	BPL	$5			;
	MOVS	e0, #1			;
	LSLS	e0, e0, #31		;
	ORRS	m0, e0			;  THEN SET THE SIGN FIELD
$5:	MOVS	r0, m0			;
	POP 	{r1, r2}		; RESTORE CONTEXT
	BX	lr			;

	.endasmfunc

	.end

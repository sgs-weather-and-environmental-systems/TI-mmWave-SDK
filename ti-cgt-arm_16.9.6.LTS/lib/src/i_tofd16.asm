;******************************************************************************
;* I_TOFD16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* I$TOFD - CONVERT AN SIGNED 32 BIT INTEGER INTO AN IEEE 754 FORMAT
;*          DOUBLE PRECISION FLOATING POINT                 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0
;*   o RESULT IS RETURNED IN r0:r1
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

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_i2d, __TI_I$TOFD   ; RTS BEING BUILT
        .else
	.clink
        .asg I$TOFD, __TI_I$TOFD 
        .endif

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

e0	.set	r2

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_I$TOFD
	.endif

	.global __TI_I$TOFD
__TI_I$TOFD:	.asmfunc stack_usage(4)
	PUSH	{r2}			; SAVE CONTEXT

	MOVS	e0, #0x4		; PRESETUP FOR EXPONENT FIELD

	CMP	r0, #0			; IF ZERO, RETURN ZERO
	BNE	$1			;
	MOVS	r1, #0			;
	POP	{r2}			;
	BX	lr			;

$1:	BPL	$2			; IF NEGATIVE, ENCODE SIGN IN THE
	ADDS	e0, #0x8		; EXPONENT FIELD
	NEGS	r0, r0			;

$2:	LSLS	e0, e0, #8		; SETUP REMAINDER OF THE EXPONENT FIELD
	ADDS	e0, #0x1F		;

	.if .TMS470_LITTLE_DOUBLE
	MOVS	rp1_hi, r0		;
	.endif
loop:	SUBS	e0, e0, #0x1		; NORMALIZE THE MANTISSA
	LSLS	rp1_hi, rp1_hi, #1	; ADJUSTING THE EXPONENT, ACCORDINGLY
	BCC	loop			;

done:	LSLS	rp1_lo, rp1_hi, #20	; SETUP LOW HALF OF RESULT
	LSRS	rp1_hi, rp1_hi, #12	; SETUP HIGH HALF OF RESULT
	LSLS	e0, e0, #20		;
	ORRS	rp1_hi, e0		;

	POP	{r2}			;
	BX	lr			;

	.endasmfunc

	.end

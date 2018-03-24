;******************************************************************************
;* FS_TOULL_T2.ASM  - THUMB-2 STATE -  v16.9.6                                *
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
;* FS$TOULL - CONVERT AN IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;* 	      POINT NUMBER TO A 64 BIT UNSIGNED INTEGER
;****************************************************************************
;*
;*   o INPUT OP IS IN r0
;*   o RESULT IS RETURNED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0xFFFFFFFF:FFFFFFFF
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
;*   o NEGATIVE VALUE RETURNS ZERO
;*   o ROUNDING MODE:  ROUND TO ZERO
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
        .asg __aeabi_f2ulz, __TI_FS$TOULL  ; RTS BEING BUILT
        .else
	.clink
        .asg FS$TOULL, __TI_FS$TOULL
        .endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FS$TOULL
	.endif

tmp     .set    r2
e0	.set	r3

	.global __TI_FS$TOULL
__TI_FS$TOULL: .asmfunc stack_usage(12)
	
        MOVS  	r1, #0			; ALSO INITIALIZE R1 TO ZERO
        CMP	r0, #0			; CHECK FOR A NEGATIVE VALUE
	ITT	MI
	MOVMI	r0, #0			; RETURN ZERO IF IT IS NEGATIVE
	BXMI	lr

	PUSH	{r2, r3, lr}		; SAVE CONTEXT

	LSLS	e0, r0, #1		; PUT EXPONENT IN e0
	LSRS	e0, e0, #24		;

	SUBS	e0, e0, #0x7F		; CHECK FOR UNDERFLOW
	ITT	CC
	MOVCC	r0, #0			; IF UNDERFLOW, RETURN ZERO
	POPCC	{r2, r3, pc}		;

	RSBS	e0, e0, #0x3F		; CHECK FOR OVERFLOW
	BCC	ovfl			; IF OVERFLOW, RETURN 0xFFFFFFFF

	LSLS	r0, r0, #8		; PUT MANTISSA IN r0
	ORR	r0, r0, #0x80000000	; SET IMPLIED ONE IN MANTISSA

        ; COMPUTE THE INTEGER VALUE
        CMP	e0, #0x20               ; IF e0 GREATER OR EQUAL TO 32, PERFORM
	ITTT	CS
        MOVCS	r1, r0                  ; RIGHT SHIFT IN TWO STEPS.
        MOVCS	r0, #0                  ;    r0:r1 >>= 32 
        SUBCS	e0, e0, #0x20           ;    and 
        LSR	r1, r1, e0          ;    r0:r1 >>= e0 - 32
	ITTTT	CC
        RSBCC	tmp, e0, #0x20          ;
	LSLCC	tmp, r0, tmp
        ORRCC	r1, r1, tmp     ;
        LSRCC	r0, r0, e0          ; 

	; IN LITTLE ENDIAN MODE THE OUTPUT LONG LONG VALUE SHOULD BE IN R1:R0.
	; SO SWAP THE REGISTER VALUES BEFORE RETURN.

	.if .TMS470_LITTLE
	CPY	lr, r0			;
	CPY	r0, r1			;
	CPY	r1, lr			;
	.endif

	POP	{r2, r3, pc}		;

ovfl:	MOVS	r0, #0x0		; IF OVERFLOW, RETURN 
	SUBS	r0, r0, #0x1		; 0xFFFFFFFF:FFFFFFFF
        CPY     r1, r0                  ;
	POP	{r2, r3, pc}		;

	.endasmfunc

	.end

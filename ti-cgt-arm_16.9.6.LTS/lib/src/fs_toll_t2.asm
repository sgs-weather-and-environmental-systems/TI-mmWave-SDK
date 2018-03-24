;******************************************************************************
;* FS_TOLL_T2.ASM  - THUMB-2 STATE -  v16.9.6                                 *
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
;* FS$TOLL - CONVERT AN IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;*           POINT NUMBER TO A 64 BIT SIGNED INTEGER
;****************************************************************************
;*
;*   o INPUT OP IS IN r0
;*   o RESULT IS RETURNED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0x7FFFFFFF:FFFFFFFF/80000000:00000000, DEPENDING ON 
;*     THE SIGN OF THE INPUT
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
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
        .asg __aeabi_f2lz, __TI_FS$TOLL    ; RTS BEING BUILT
        .else
	.clink
        .asg FS$TOLL, __TI_FS$TOLL
        .endif

	.if .TMS470_LITTLE

o_hi	.set r1
o_lo	.set r0

	.else

o_hi	.set r0
o_lo	.set r1

	.endif

sign	.set	r2
tmp     .set    r3
e0	.set	r4

	.thumbfunc __TI_FS$TOLL
	.global __TI_FS$TOLL
__TI_FS$TOLL: .asmfunc stack_usage(16)
        PUSH	{r2, r3, r4, lr}

	LSL	e0, r0, #1		; PUT EXPONENT IN e0
	LSR	e0, e0, #24		;

	SUBS	e0, e0, #0x7F		; CHECK FOR UNDERFLOW
	ITTT	MI
	MOVMI	r0, #0			; IF UNDERFLOW, RETURN ZERO
	MOVMI	r1, #0			; 
	POPMI   {r2, r3, r4, pc}	;

	RSBS	e0, e0, #0x3F		; CHECK FOR OVERFLOW
	BLS	ovfl			; IF OVERFLOW, RETURN INFINITY

	MOVS	sign, r0		; SAVE THE SIGN
	LSL	r0, r0, #8		; PUT MANTISSA IN m0
	ORR	r0, r0, #0x80000000	; SET IMPLIED ONE IN MANTISSA

	MOVS	r1, #0			;
        ; COMPUTE THE INTEGER VALUE
        CMP     e0, #0x20               ; IF e0 GREATER OR EQUAL TO 32, PERFORM
	ITTT	CS
        MOVCS   r1, r0                  ; RIGHT SHIFT IN TWO STEPS.
        MOVCS   r0, #0                  ;    r0:r1 >>= 32 
        SUBCS   e0, e0, #0x20           ;    and 
        LSR     r1, r1, e0          ;    r0:r1 >>= e0 - 32
	ITTTT	CC
        RSBCC   tmp, e0, #0x20          ;
	LSLCC	tmp, r0, tmp            ;
        ORRCC   r1, r1, tmp             ;
        LSRCC   r0, r0, e0	        ; 

        CMP     sign, #0                ; IF THE INPUT IS NEGATIVE,
	BPL	return			;

	MOVS	tmp, #0
        RSBS    r1, r1, #0              ;  THEN NEGATE THE RESULT
        SBC     r0, tmp, r0             ;

return:
	; IN LITTLE ENDIAN MODE THE OUTPUT LONG LONG VALUE SHOULD BE IN R1:R0.
	; SO SWAP THE REGISTER VALUES BEFORE RETURN.

	.if .TMS470_LITTLE
	CPY	lr, r0			;
	CPY	r0, r1			;
	CPY	r1, lr			;
	.endif

	POP	{r2, r3, r4, pc}	;

ovfl:	CMP	r0, #0			; IF OVERFLOW, RETURN INFINITY
	MOV	o_hi, #0x80000000	; CHECK THE SIGN OF THE INPUT
        MOV     o_lo, #0                ;
	IT	MI
	POPMI   {r2, r3, r4, pc}	;
	SUBS 	o_lo, o_lo, #0x1	; AND ADJUST INFINITY ACCORDINGLY
	SBC  	o_hi, o_hi, #0  	; 
	POP   {r2, r3, r4, pc}	;

	.endasmfunc

	.end

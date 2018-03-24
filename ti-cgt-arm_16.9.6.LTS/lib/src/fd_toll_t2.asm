;******************************************************************************
;* FD_TOLL_T2.ASM  - THUMB-2 STATE -  v16.9.6                                 *
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
;* FD$TOLL - CONVERT AN IEEE 754 FORMAT DOUBLE PRECISION FLOATING 
;*           INTO A SIGNED 64 BIT INTEGER 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0:r1
;*   o RESULT IS RETURNED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0x7FFFFFFF:FFFFFFFF/0x80000000:00000000, DEPENDING 
;*     ON THE SIGN OF THE INPUT
;*   o UNDERFLOW RETURNS ZERO (0x00000000:00000000)
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

        .if __TI_EABI_ASSEMBLER          ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_d2lz, __TI_FD$TOLL  ; RTS BEING BUILT
        .else
	.clink
        .asg FD$TOLL, __TI_FD$TOLL
        .endif

	.global	__TI_FD$TOLL

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

	.if .TMS470_LITTLE
o_hi	.set r1
o_lo	.set r0
	.else
o_hi	.set r0
o_lo	.set r1
	.endif

ope	.set	r4
sign	.set	r2
tmp     .set    r3

	.thumbfunc __TI_FD$TOLL
__TI_FD$TOLL: .asmfunc stack_usage(16)
        PUSH	{r2, r3, r4, lr}	; SAVE CONTEXT

	LSL	ope, rp1_hi, #1		; PUT EXPONENT IN ope
	LSR	ope, ope, #21		;

	SUBS	ope, ope, #0x300	; ADJUST FOR EXPONENT BIAS AND
	SUBS	ope, ope, #0xFF		; CHECK FOR UNDERFLOW
	ITTT	MI
	MOVMI	rp1_hi, #0		; IF UNDERFLOW, RETURN ZERO
	MOVMI	rp1_lo, #0		; IF UNDERFLOW, RETURN ZERO
	POPMI  {r2, r3, r4, pc}	;

	RSBS	ope, ope, #0x3F		; CHECK FOR OVERFLOW
	BLS	ovfl			; IF OVERFLOW, RETURN INFINITY

        MOVS	sign, rp1_hi            ;
	LSL	rp1_hi, rp1_hi, #11	; SHIFT THE EXPONENT (11 BITS) 
        ORR	rp1_hi, rp1_hi, rp1_lo, LSR #21 ; OUT OF THE MANTISSA R0:R1 
        LSL	rp1_lo, rp1_lo, #11	; 
	ORR	rp1_hi, rp1_hi, #0x80000000	; SET IMPLIED ONE IN HI MANTISSA 

        ; ADJUST THE VALUE IN R0:R1 FOR THE EXPONENT BY RIGHT SHIFTING 
        ; EXPONENT NUMBER OF BITS OUT OF R0:R1.
        SUBS    tmp, ope, #0x20         ; IF (EXP >= 32)
	ITTEE	CS
        LSRCS   rp1_lo, rp1_hi, tmp ;    R1 = MNT.HI >> EXP - 32
        MOVCS   rp1_hi, #0              ;    R0 = 0 

        RSBCC   tmp, ope, #0x20         ; IF (EXP < 32)
        LSRCC   rp1_lo, rp1_lo, ope ; R0:R1 = R0:R1 >> EXP
	ITTT	CC
        LSLCC   tmp, rp1_hi, tmp    ;
        ORRCC   rp1_lo, rp1_lo, tmp     ;
        LSRCC   rp1_hi, rp1_hi, ope ;

	CMP	sign, #0		; IF THE INPUT IS NEGATIVE,
        BPL     return                  ;
	MOVS	tmp, #0
	RSBS 	rp1_lo, rp1_lo, #0	;  THEN NEGATE THE RESULT
	SBC	rp1_hi, tmp, rp1_hi     ;

return:
        ; IF THE ENDIANNESS OF THE DOUBLE IS DIFFERENT FROM THE TARGET
	; ENDIAN (MIXED ENDIAN) SWAP THE REGISTER VALUES BEFORE RETURNING.

	.if .TMS470_LITTLE != .TMS470_LITTLE_DOUBLE
	CPY	lr, o_hi		
	CPY	o_hi, o_lo	
	CPY	o_lo, lr
	.endif

	POP	{r2, r3, r4, pc}	

ovfl:	CMP	rp1_hi, #0		; IF OVERFLOW, RETURN INFINITY
	MOV	o_hi, #0x80000000	; CHECK THE SIGN OF THE INPUT
        MOV	o_lo, #0                ;
	IT	MI
	POPMI	{r2, r3, r4, pc}	;
	SUBS 	o_lo, o_lo, #0x1	; AND ADJUST INFINITY ACCORDINGLY
	SBC  	o_hi, o_hi, #0  	; 
	POP	{r2, r3, r4, pc}	        ;

	.endasmfunc

	.end

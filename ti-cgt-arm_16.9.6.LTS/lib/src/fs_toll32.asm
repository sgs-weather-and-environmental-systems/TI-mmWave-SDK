;******************************************************************************
;* FS_TOLL32.ASM  - 32 BIT STATE -  v16.9.6                                   *
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
;* FS_TOLL - CONVERT AN IEEE 754 FORMAT SINGLE PRECISION FLOATING 
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

	.arm

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_f2lz, __TI_FS_TOLL    ; RTS BEING BUILT
        .else
	.clink
        .asg FS_TOLL, __TI_FS_TOLL
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
e0	.set	lr

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_FS_TOLL
	.endif

	.global __TI_FS_TOLL
__TI_FS_TOLL: .asmfunc stack_usage(12)
        STMFD	sp!, {r2, r3, lr}

	MOV	e0, r0, LSL #1		; PUT EXPONENT IN e0
	MOV	e0, e0, LSR #24		;

	SUBS	e0, e0, #0x7F		; CHECK FOR UNDERFLOW
	MOVMI	r0, #0			; IF UNDERFLOW, RETURN ZERO
	MOVMI	r1, #0			; 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMMIFD sp!, {r2, r3, pc}	;
	.else
	LDMMIFD	sp!, {r2, r3, lr}
	BXMI	lr
	.endif

	RSBS	e0, e0, #0x3F		; CHECK FOR OVERFLOW
	BLS	ovfl			; IF OVERFLOW, RETURN INFINITY

	MOV	sign, r0		; SAVE THE SIGN
	MOV	r0, r0, LSL #8		; PUT MANTISSA IN m0
	ORR	r0, r0, #0x80000000	; SET IMPLIED ONE IN MANTISSA

	MOV	r1, #0			;
        ; COMPUTE THE INTEGER VALUE
        CMP     e0, #0x20               ; IF e0 GREATER OR EQUAL TO 32, PERFORM
        MOVCS   r1, r0                  ; RIGHT SHIFT IN TWO STEPS.
        MOVCS   r0, #0                  ;    r0:r1 >>= 32 
        SUBCS   e0, e0, #0x20           ;    and 
        MOV     r1, r1, LSR e0          ;    r0:r1 >>= e0 - 32
        RSBCC   tmp, e0, #0x20          ;
        ORRCC   r1, r1, r0, LSL tmp     ;
        MOVCC   r0, r0, LSR e0          ; 

        CMP     sign, #0                ; IF THE INPUT IS NEGATIVE,
	BPL	return			;

        RSBS    r1, r1, #0              ;  THEN NEGATE THE RESULT
        RSC     r0, r0, #0              ;

return:
	; IN LITTLE ENDIAN MODE THE OUTPUT LONG LONG VALUE SHOULD BE IN R1:R0.
	; SO SWAP THE REGISTER VALUES BEFORE RETURN.

	.if .TMS470_LITTLE
	MOV	lr, r0			;
	MOV	r0, r1			;
	MOV	r1, lr			;
	.endif

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD 	sp!, {r2, r3, pc}	;
	.else
	LDMFD	sp!, {r2, r3, lr}
	BX	lr
	.endif

ovfl:	CMP	r0, #0			; IF OVERFLOW, RETURN INFINITY
	MOV	o_hi, #0x80000000	; CHECK THE SIGN OF THE INPUT
        MOV     o_lo, #0                ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMMIFD sp!, {r2, r3, pc}	;
	.else
	LDMMIFD	sp!, {r2, r3, lr}
	BXMI	lr
	.endif
	SUBS 	o_lo, o_lo, #0x1	; AND ADJUST INFINITY ACCORDINGLY
	SBC  	o_hi, o_hi, #0  	; 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {r2, r3, pc}	;
	.else
	LDMFD	sp!, {r2, r3, lr}
	BX	lr
	.endif

	.endasmfunc

	.end

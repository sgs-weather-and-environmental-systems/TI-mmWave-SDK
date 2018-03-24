;******************************************************************************
;* LL_TOFS32.ASM  - 32 BIT STATE -  v16.9.6                                   *
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
;* LL_TOFS - CONVERT A 64 BIT SIGNED INTEGER TO AN IEEE 754 FORMAT
;*           SINGLE PRECISION FLOATING POINT NUMBER
;****************************************************************************
;*
;*   o INPUT OP IS IN R0:R1 (R1:R0 IF LITTLE ENDIAN)
;*   o RESULT IS RETURNED IN R0
;*   o R1 IS DESTROYED
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

	.arm

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_l2f, __TI_LL_TOFS  ; RTS BEING BUILT
        .else
	.clink
        .asg LL_TOFS, __TI_LL_TOFS 
        .endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_LL_TOFS
	.endif

sign	.set	r2
e0	.set	lr

	.global __TI_LL_TOFS
__TI_LL_TOFS: .asmfunc stack_usage(8)
        CMP	r0, #0			; 
        CMPEQ	r1, #0			; 
	BXEQ	lr			; IF ZERO, RETURN ZERO

	STMFD	sp!, {r2, lr}		; SAVE CONTEXT

	; IN LITTLE ENDIAN MODE THE INPUT LONG LONG VALUE IS IN R1:R0. SWAP THE
	; WORDS SO THAT WE HAVE THE LONG LONG VAULUE IN R0:R1.

	.if .TMS470_LITTLE
	MOV	r2, r0			;
	MOV	r0, r1			;
	MOV	r1, r2			;
	.endif

        MOV     sign, r0                ;
	MOV	e0, #0xBE		; SET THE EXPONENT FIELD

        CMP     r0, #0                  ;
        BPL     loop                    ;
	RSBS  	r1, r1, #0		; IF NEGATIVE, NEGATE IT
        RSCS    r0, r0, #0              ;
	BMI	cont			; HANDLE THE SPACIAL CASE 0x8000:0:0:0

loop:	MOVS	r0, r0, LSL #1		; NORMALIZE THE MANTISSA
        ORR     r0, r0, r1, LSR #31     ;
        MOV     r1, r1, LSL #1          ;
	SUB	e0, e0, #1		; ADJUSTING THE EXPONENT, ACCORDINGLY
	BPL	loop			;
cont:
   	ADDS	r0, r0, #0x00000080	; ADD 1/2 TO ROUND
	ADDCS	e0, e0, #0x1		; AND ADJUST THE EXPONENT ACCORDINGLY

	MOVCC	r0, r0, LSL #1		; MASK IMPLIED 1 OUT OF THE MANTISSA
	MOV	r0, r0, LSR #9		; PACK THE MANTISSA
	ORR	r0, r0, e0, LSL #23	; PACK THE EXPONENT
	CMP	sign, #0		; IF THE INPUT WAS NEGATIVE
	ORRMI	r0, r0, #0x80000000	;  THEN SET THE SIGN FIELD

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD 	sp!, {r2, pc}		; RESTORE CONTEXT
	.else
	LDMFD	sp!, {r2, lr}
	BX	lr
	.endif

	.endasmfunc

	.end

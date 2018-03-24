;******************************************************************************
;* LL_TOFS_T2.ASM  - THUMB-2 STATE -  v16.9.6                                 *
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
;* LL$TOFS - CONVERT A 64 BIT SIGNED INTEGER TO AN IEEE 754 FORMAT
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

	.thumb

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_l2f, __TI_LL$TOFS  ; RTS BEING BUILT
        .else
	.clink
        .asg LL$TOFS, __TI_LL$TOFS 
        .endif

sign	.set	r2
e0	.set	r3

	.thumbfunc __TI_LL$TOFS
	.global __TI_LL$TOFS
__TI_LL$TOFS: .asmfunc stack_usage(16)
        CMP	r0, #0			; 
 	ITT	EQ
        CMPEQ	r1, #0			;
        BXEQ	lr			; IF ZERO, RETURN ZERO

	PUSH	{r2, r3, r4, lr}	; SAVE CONTEXT

	; IN LITTLE ENDIAN MODE THE INPUT LONG LONG VALUE IS IN R1:R0. SWAP THE
	; WORDS SO THAT WE HAVE THE LONG LONG VAULUE IN R0:R1.

	.if .TMS470_LITTLE
	CPY	r2, r0			;
	CPY	r0, r1			;
	CPY	r1, r2			;
	.endif

        MOVS    sign, r0                ;
	MOVS	e0, #0xBE		; SET THE EXPONENT FIELD

        CMP     r0, #0                  ;
        BPL     loop                    ;
	MOVS	r4, #0
	RSBS 	r1, r1, #0		; IF NEGATIVE, NEGATE IT
        SBCS    r0, r4, r0              ;
	BMI	cont			; HANDLE THE SPACIAL CASE 0x8000:0:0:0

loop:	SUBS	e0, e0, #1
	LSLS	r0, r0, #1		; NORMALIZE THE MANTISSA
        ORR     r0, r0, r1, LSR #31     ;ADJUSTING THE EXPONENT, ACCORDINGLY
        LSL     r1, r1, #1          	;
	BPL	loop			;
cont:
   	ADDS	r0, r0, #0x00000080	; ADD 1/2 TO ROUND
	ITE	CS
	ADDCS	e0, e0, #0x1		; AND ADJUST THE EXPONENT ACCORDINGLY

	LSLCC	r0, r0, #1		; MASK IMPLIED 1 OUT OF THE MANTISSA
	LSRS	r0, r0, #9		; PACK THE MANTISSA
	ORR	r0, r0, e0, LSL #23	; PACK THE EXPONENT
	CMP	sign, #0		; IF THE INPUT WAS NEGATIVE
	IT	MI
	ORRMI	r0, r0, #0x80000000	;  THEN SET THE SIGN FIELD

	POP 	{r2, r3, r4, pc}	; RESTORE CONTEXT

	.endasmfunc

	.end

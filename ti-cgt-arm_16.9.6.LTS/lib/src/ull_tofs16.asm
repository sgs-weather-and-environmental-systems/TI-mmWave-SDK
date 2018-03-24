;******************************************************************************
;* ULL_TOFS16.ASM  - 16 BIT STATE -  v16.9.6                                  *
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
;* ULL$TOFS - CONVERT A 64 BIT UNSIGNED INTEGER TO AN IEEE 754 FORMAT
;*	      SINGLE PRECISION FLOATING POINT NUMBER
;****************************************************************************
;*
;*   o INPUT OP IS IN R0:R1 (r1:r0 IF LITTLE ENDIAN)
;*   o RESULT IS RETURNED IN R0
;*   o THE VALUE IN R1 IS DESTROYED
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

        .if __TI_EABI_ASSEMBLER          ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_ul2f, __TI_ULL$TOFS ; RTS BEING BUILT
        .else
	.clink
        .asg ULL$TOFS, __TI_ULL$TOFS 
        .endif

e0	.set	r2
tmp     .set    r3

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_ULL$TOFS
	.endif

	.global __TI_ULL$TOFS
__TI_ULL$TOFS: .asmfunc stack_usage(12)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        PUSH    {r2, r3, lr}		; SAVE CONTEXT
	.else
	PUSH	{r2-r3}
	.endif	

	; IN LITTLE ENDIAN MODE THE INPUT LONG LONG VALUE IS IN R1:R0. SWAP THE
	; WORDS SO THAT WE HAVE THE LONG LONG VAULUE IN R0:R1.

	.if .TMS470_LITTLE
	MOVS	tmp, r0			;
	MOVS	r0, r1			;
	MOVS	r1, tmp			;
	.endif

	MOVS	e0, #0xBE		; SET THE EXPONENT FIELD

	CMP     r0, #0                  ; IF ZERO, RETURN ZERO
	BMI	cont			;
        BNE     loop			;
        CMP     r1, #0                  ;
        BNE     loop                    ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r2, r3, pc}		;
	.else
	POP	{r2-r3}
	BX	lr
	.endif
 
loop:   SUBS    e0, #1                  ; NORMALIZE THE MANTISSA
        LSLS    r0, r0, #1              ; ADJUSTING THE EXPONENT, ACCORDINGLY
        LSRS    tmp, r1, #31            ;
        ORRS    r0, tmp                 ;
        LSLS    r1, r1, #1              ;
        CMP     r0, #0                  ;
        BPL     loop                    ;

cont:	ADDS    r0, #0x80               ; ADD 1/2 TO ROUND
        BCC     $1			;
        ADDS    e0, #0x1                ; AND ADJUST THE EXPONENT ACCORDINGLY
        B       $2			;
 
$1:	LSLS    r0, r0, #1              ; MASK IMPLIED 1 OUT OF THE MANTISSA
 
$2:	LSRS    r0, r0, #9              ; PACK THE MANTISSA
        LSLS    e0, e0, #23             ;
        ORRS    r0, e0                  ; PACK THE EXPONENT

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r2, r3, pc}		;
	.else
	POP	{r2-r3}
	BX	lr
	.endif

	.endasmfunc

	.end

;******************************************************************************
;* FS_TOU16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* FS$TOU - CONVERT AN IEEE 754 FORMAT SINGLE PRECISION FLOATING 
;* 	    POINT NUMBER TO A 32 BIT UNSIGNED INTEGER
;****************************************************************************
;*
;*   o INPUT OP IS IN r0
;*   o RESULT IS RETURNED IN r0
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o OVERFLOW RETURNS 0xFFFFFFFF
;*   o UNDERFLOW RETURNS ZERO (0x00000000)
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
        .asg __aeabi_f2uiz, __TI_FS$TOU    ; RTS BEING BUILT
        .asg __aeabi_f2iz, __TI_FS$TOI    
        .else
	.clink
        .asg FS$TOU, __TI_FS$TOU
        .asg FS$TOI, __TI_FS$TOI
        .endif

e0      .set    r1
tmp     .set    r2

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FS$TOU
	.endif

	.global __TI_FS$TOU, __TI_FS$TOI
__TI_FS$TOU: .asmfunc stack_usage(12)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	PUSH	{r1, r2, lr}		; SAVE CONTEXT
	.else
	PUSH	{r1-r3}
	.endif

	CMP	r0, #0			; CHECK FOR A NEGATIVE VALUE
	BPL	pos	
	.if !(__TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__)
	MOV	r3, lr
	.endif
	BL	__TI_FS$TOI			; CAST TO INT
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r1, r2, pc}
	.else
	MOV	lr, r3
	POP	{r1-r3}
	BX	lr
	.endif

pos:    LSLS    e0, r0, #1              ; PUT EXPONENT IN e0
        LSRS    e0, e0, #24             ;
 
        SUBS    e0, #0x7F               ; CHECK FOR UNDERFLOW
        BCC     unfl 	                ; IF UNDERFLOW, RETURN ZERO
 
        MOVS    tmp, #0x1F              ;
        SUBS    e0, tmp, e0             ;
        BCC     ovfl    	        ; CHECK FOR OVERFLOW
 
	LSLS    r0, r0, #8              ; PUT MANTISSA IN r0
        MOVS    tmp, #1                 ;
        LSLS    tmp, tmp, #31           ;
        ORRS    r0, tmp                 ; SET IMPLIED ONE IN MANTISSA
 
	LSRS	r0, e0			; COMPUTE THE INTEGER VALUE
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r1, r2, pc}		;
	.else
	POP	{r1-r3}
	BX	lr
	.endif

unfl:   MOVS    r0, #0                  ; UNDERFLOW
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r1, r2, pc}		;
	.else
	POP	{r1-r3}
	BX	lr
	.endif
 
ovfl:	MOVS	r0, #0x0		; IF OVERFLOW, RETURN INFINITY
	SUBS	r0, r0, #0x1		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r1, r2, pc}		;
	.else
	POP	{r1-r3}
	BX	lr
	.endif

	.endasmfunc

	.end

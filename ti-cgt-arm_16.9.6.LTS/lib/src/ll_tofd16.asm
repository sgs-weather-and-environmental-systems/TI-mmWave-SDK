;******************************************************************************
;* LL_TOFD16.ASM  - 16 BIT STATE -  v16.9.6                                   *
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
;* LL$TOFD - CONVERT AN SIGNED 64 BIT INTEGER INTO AN IEEE 754 FORMAT
;*           DOUBLE PRECISION FLOATING POINT                 
;****************************************************************************
;*
;*   o INPUT OP IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
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
        .asg __aeabi_l2d, __TI_LL$TOFD   ; RTS BEING BUILT
        .else
	.clink
        .asg LL$TOFD, __TI_LL$TOFD 
        .endif

	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp1_lo	.set	r1	; Low word of regpair 1
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp1_lo	.set	r0	; Low word of regpair 1
	.endif

	.if .TMS470_LITTLE
i_hi	.set	r1	; High word of input
i_lo	.set	r0	; Low word of input
	.else
i_hi	.set	r0	; High word of input
i_lo	.set	r1	; Low word of input
	.endif

e0	.set	r2
tmp     .set    r3
tmp2    .set    r4

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_LL$TOFD
	.endif

	.global __TI_LL$TOFD
__TI_LL$TOFD: .asmfunc stack_usage(16)
	CMP	r0, #0				; IF ZERO, RETURN ZERO
	BNE	$1			
        CMP     r1, #0                  
        BNE     $1
	BX	lr			

$1:	
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        PUSH	{r2-r4, lr}			; SAVE CONTEXT
	.else
	PUSH	{r2-r4}
	.endif

	; IF THE ENDIANNESS OF THE DOUBLE IS DIFFERENT FROM THE TARGET
	; ENDIAN (MIXED ENDIAN) SWAP THE INPUT VALUE BEFORE OPERATING ON. 

	.if .TMS470_LITTLE != .TMS470_LITTLE_DOUBLE
	MOVS	tmp, i_hi			
	MOVS	i_hi, i_lo			
	MOVS	i_lo, tmp			
	.endif

	MOVS	e0, #0x4			; PRESETUP FOR EXPONENT FIELD

        CMP     rp1_hi, #0                  
        BPL	$2				; IF NEGATIVE, ENCODE SIGN IN 
	ADDS	e0, #0x8			; THE EXPONENT FIELD

        MOVS    tmp, #0                 
	NEGS	rp1_lo, rp1_lo			; AND NEGATE THE INPUT VALUE 
        SBCS    tmp, rp1_hi                 
        MOVS    rp1_hi, tmp                 

$2:	
        LSLS	e0, e0, #8			; SETUP REMAINDER OF THE 
	ADDS	e0, #0x3F			; EXPONENT

loop:	SUBS	e0, e0, #0x1			; NORMALIZE THE MANTISSA
        MOVS    tmp2, rp1_hi                	
	LSLS	rp1_hi, rp1_hi, #1		; ADJUSTING THE EXPONENT
        LSRS    tmp, rp1_lo, #31            
        ORRS    rp1_hi, tmp                 
        LSLS    rp1_lo, rp1_lo, #1              
        CMP     tmp2, #0                
	BPL	loop		

done:	
        LSRS    rp1_lo, rp1_lo, #12             
        LSLS	tmp, rp1_hi, #20		; SETUP LOW HALF OF RESULT
        ORRS    rp1_lo, tmp                 
	LSRS	rp1_hi, rp1_hi, #12		; SETUP HIGH HALF OF RESULT
	LSLS	e0, e0, #20		
	ORRS	rp1_hi, e0			

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP	{r2-r4, pc}
	.else
	POP	{r2-r4}
	BX	lr
	.endif

	.endasmfunc

	.end

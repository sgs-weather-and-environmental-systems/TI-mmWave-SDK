;******************************************************************************
;* FS_TOLL16.ASM  - 16 BIT STATE -  v16.9.6                                   *
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
;* 	     POINT NUMBER TO A 64 BIT SIGNED INTEGER
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

e0	.set	r2
tmp	.set	r3
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
sign	.set	lr
	.else
sign	.set	r4
	.endif
	
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FS$TOLL
	.endif

	.global __TI_FS$TOLL
__TI_FS$TOLL: .asmfunc stack_usage(12)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	PUSH	{r2, r3, lr}		;
	.else
	PUSH	{r2-r4}
	.endif

	LSLS	e0, r0, #1		; PUT EXPONENT IN e0
	LSRS	e0, e0, #24		;

	SUBS	e0, #0x7F		; CHECK FOR UNDERFLOW
	BMI	unfl			; IF UNDERFLOW, RETURN ZERO

	MOVS	tmp, #0x3F		;
	SUBS	e0, tmp, e0		;
	BLS	ovfl			; CHECK FOR OVERFLOW

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	MOV	sign, r0		; SAVE SIGN
	.else
	MOVS	sign, r0		; SAVE SIGN
	.endif
	LSLS	r0, r0, #8		; PUT MANTISSA IN r0
	MOVS	tmp, #1			;
	LSLS	tmp, tmp, #31		;
	ORRS	r0, tmp			; SET IMPLIED ONE IN MANTISSA

        MOVS    tmp, e0                 ; COMPUTE THE INTEGER VALUE BY RIGHT 
        SUBS    tmp, #32                ; SHIFTING THE MANTISSA BY THE e0
        BCC     $1                      ; 
        MOVS    r1, r0                  ; IF e0 >= 32
        MOVS    r0, #0                  ;    r0:r1 = 0:((r0 >> (e0 - 32))
	LSRS	r1, tmp		        ; 
	B       adj_sign                ;
$1:
        MOVS    r1, r0                  ; IF e0 < 32
        LSRS    r0, e0                  ;    r0:r1 = (r0:0) >> e0
        NEGS    tmp, tmp                ;
        LSLS    r1, tmp                 ;

adj_sign:
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	MOV	tmp, sign		;
	.else
	MOVS	tmp, sign		;
	.endif
	CMP	tmp, #0			;
	BPL	$2			; IF THE INPUT IS NEGATIVE,
        MOVS    tmp, #0                 ;
	NEGS	r1, r1			;  THEN NEGATE THE RESULT AND RETURN
        SBCS    tmp, r0                 ;
        MOVS    r0, tmp                 ;

$2:	
	; IN LITTLE ENDIAN MODE THE OUTPUT LONG LONG VALUE SHOULD BE IN R1:R0.
	; SO SWAP THE REGISTER VALUES BEFORE RETURN.

	.if .TMS470_LITTLE
	MOVS	tmp, r0			;
	MOVS	r0, r1			;
	MOVS	r1, tmp			;
	.endif

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP 	{r2, r3, pc}		;
	.else
	POP	{r2-r4}
	BX	lr
	.endif

unfl:	MOVS	r0, #0			; UNDERFLOW
        MOVS    r1, #0                  ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	POP 	{r2, r3, pc}		;
	.else
	POP	{r2-r4}
	BX	lr
	.endif

ovfl:   MOVS	tmp, r0			; OVERFLOW
	MOVS	o_lo, #0		;
	MOVS	o_hi, #0x1		;
	LSLS	o_hi, o_hi, #31		;
	CMP	tmp, #0			; IF INPUT IS NEGATIVE, RETURN
	BMI	$3			; 0x80000000:00000000
        MOVS    tmp, #0                 ;
	SUBS	o_lo, o_lo, #1          ; ELSE RETURN 0x7FFFFFFF:FFFFFFFF
        SBCS    o_hi, tmp               ;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
$3:	POP 	{r2, r3, pc}		;
	.else
$3:	POP	{r2-r4}
	BX	lr
	.endif

	.endasmfunc

	.end

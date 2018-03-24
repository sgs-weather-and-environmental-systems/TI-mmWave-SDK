;******************************************************************************
;* FD_CMP16.ASM  - 16 BIT STATE -  v16.9.6                                    *
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
;* FD$CMP - COMPARE TWO IEEE 754 FORMAT DOUBLE PRECISION FLOATING POINT 
;*          NUMBERS, SETTING THE STATUS ON THE RESULT.
;*
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0:r1
;*   o INPUT OP2 IS IN r2:r3
;*   o INPUTS ARE NOT DESTROYED
;*
;*   o SIGNALLING NOT-A-NUMBER (SNaN) AND QUIET NOT-A-NUMBER (QNaN)
;*     ARE TREATED AS INFINITY
;*   o +0 == -0
;*
;*   o IF COMPUTING THE RESULT INVOLVES INFINITIES, THE FOLLOWING TABLE
;*     SUMMARIZES THE EFFECTIVE RESULT
;*                   +----------+----------+----------+ 
;*                   + OP2 !INF | OP2 -INF + OP2 +INF +
;*        +----------+==========+==========+==========+ 
;*        + OP1 !INF +    -     |   +INF   +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 -INF +   -INF   |    -0    +   -INF   +
;*        +----------+----------+----------+----------+ 
;*        + OP1 +INF +   +INF   |   +INF   +    +0    +
;*        +----------+----------+----------+----------+
;*
;*   o THE RESULT OF THE COMPARE IS COMPUTED USING INTEGER SUBRACT IF THE
;*     SIGN OF THE INPUTS IS THE SAME.  THE TABLE SUMMARIZES THE 
;*     IMPLEMENTATION.
;*                 +-----------+-----------+ 
;*                 +   OP2 +   |   OP2 -   +
;*        +--------+===========+===========+ 
;*        + OP1 +  + OP1 - OP2 |    OP1    + 
;*        +--------+-----------+-----------+ 
;*        + OP1 -  +    OP1    | OP2 - OP1 + 
;*        +--------+-----------+-----------+ 
;*
;*   o THE FOLLOWING STATUS BITS ARE SET ON THE RESULT
;*     o Z=1,N=0,V=0  IFF 0
;*     o Z=0,N=1,V=0  IFF -
;*     o Z=0,N=0,V=0  IFF +
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

tmp	.set	r4
tmp2	.set	r5

BODY	.macro __TI_FD$CMP, rp1_hi, rp1_lo, rp2_hi, rp2_lo
	.thumb
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_FD$CMP
	.endif
	.global __TI_FD$CMP
__TI_FD$CMP: .asmfunc stack_usage(8)
	PUSH	{r4, r5}		;

	CMP	rp1_hi, rp2_hi		; HANDLE THE CASE OF BOTH INPUTS EQUAL 
	BNE	$1			;
	CMP	rp1_lo, rp2_lo		;
	BEQ	exit?			;

$1:	MOVS	tmp, rp1_lo		;
	ORRS	tmp, rp2_lo		; HANDLE THE CASE OF BOTH INPUTS BEING
	BNE	$2			; ZERO
	MOVS	tmp, rp1_hi		;
	ORRS	tmp, rp2_hi		;
	LSLS	tmp, tmp, #1		;
	CMP	tmp, #0x0		;
	BEQ	exit?			;

$2:	LSLS	tmp, rp1_hi, #1		; TEST OP1 == 0
	ORRS	tmp, rp1_lo		; 
	BNE	$3			;

	CMP	tmp, rp2_hi		; OP1 == 0, DISREGARD SIGN OF OP1
	                                ; WHEN COMPUTING RESULT STATUS
        B       exit?

$3:	LSLS	tmp, rp1_hi, #1		; CHECK INPUT #1 FOR INFINITY
	ASRS	tmp, tmp, #21		;
	ADDS	tmp, tmp, #1		;
	BNE	$4			;
	LSLS	tmp, rp2_hi, #1		; CHECK INPUT #2 FOR INFINITY
	ASRS	tmp, tmp, #21		;
	ADDS	tmp, tmp, #1		;
	BNE	$4			;

	LSRS	tmp, rp2_hi, #31	; HANDLE THE CASE OF BOTH INPUTS
	LSRS	tmp2, rp1_hi, #31	; BEING INFINITE
	SUBS	tmp, tmp, tmp2		;
        B       exit?

$4:	CMP	rp2_hi, #0		; CHECK OP2'S SIGN
	BMI	$6			;

	CMP	rp1_hi, #0		; OP2 IS POSITIVE.  IF OP1 IS NEGATIVE,
	BMI	exit?			; THE RESULT IS OP1
	CMP	rp1_hi, rp2_hi		; ELSE THE RESULT IS OP1 - OP2
        BNE	exit?			;
	MOVS	tmp, rp1_lo		; MAKE SURE WE SET THE N BIT CORRECTLY
	EORS	tmp, rp2_lo		;
	BMI	$5			;
	CMP	rp1_lo, rp2_lo		;
        B       exit?
$5:	CMP	rp2_lo, #0		;
	BNE 	exit?		; MAKE SURE WE SET THE Z BIT CORRECTLY
	MOVS	tmp, #1		;
        B       exit?

$6:	CMP	rp1_hi, #0		; OP2 IS NEGATIVE.  IF OP1 IS POSITIVE,
	BGT	exit?			; THE RESULT IS OP1
	CMP	rp2_hi, rp1_hi		; ELSE THE RESULT IS OP2 - OP1
	BNE	exit?			;
	MOVS	tmp, rp1_lo		; MAKE SURE WE SET THE N BIT CORRECTLY
	EORS	tmp, rp2_lo		;
	BMI	$7			;
	CMP	rp2_lo, rp1_lo		;
        B       exit?
$7:	CMP	rp1_lo, #0		;
	BNE 	exit?		; MAKE SURE WE SET THE Z BIT CORRECTLY
	MOVS	tmp, #1		;

exit?:	
        .if __TI_ARM_V6M0__
        .thumb
        
        MRS     tmp, APSR
        BMI     clearc?                	; Set the C flag correctly (C = !N)
        
        MOVS    tmp2, #0x20             ; Set up a bit mask for the C flag
        REV     tmp2, tmp2              ; We have to place this after the BMI,
                                        ; since the MOV will write status
        ORRS    tmp, tmp2
        B       write?
clearc?:
        MOVS    tmp2, #0x20             ; Set up a bit mask for the C flag
        REV     tmp2, tmp2              ; We have to place this after the BMI,
                                        ; since the MOV will write status
        BICS    tmp, tmp2
write?:
        MSR     APSR_nzcvq, tmp

	.else

        BX      pc                      ; This is a non-M0 Thumb 1; for
        .arm                        ; MRS, must switch to ARM mode

	MRS	tmp, CPSR
	ORRPL	tmp, tmp, #0x20000000	; IF N CLEAR, SET C
	BICMI	tmp, tmp, #0x20000000	; IF N SET, CLEAR C
	MSR	CPSR_f, tmp

	.endif

        POP	{r4, r5}		;
	BX	lr			;

	.endasmfunc

	.endm

	.if .TMS470_BIG_DOUBLE

op1_hi	.set	r0	; High word of regpair 1
op1_lo	.set	r1	; Low word of regpair 1
op2_hi	.set	r2	; High word of regpair 2
op2_lo	.set	r3	; Low word of regpair 2

	.else

op1_hi	.set	r1	; High word of regpair 1
op1_lo	.set	r0	; Low word of regpair 1
op2_hi	.set	r3	; High word of regpair 2
op2_lo	.set	r2	; Low word of regpair 2

	.endif

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
					   ; RTS BEING BUILT
	.global  __aeabi_cdcmpeq
	.thumbfunc __aeabi_cdcmpeq
	.sect ".text:__aeabi_cdcmple"
__aeabi_cdcmpeq:	
        BODY __aeabi_cdcmple, op1_hi, op1_lo, op2_hi, op2_lo
	.sect ".text:__aeabi_cdrcmple"
        BODY __aeabi_cdrcmple, op2_hi, op2_lo, op1_hi, op1_lo

        .else

	.clink
	BODY FD$CMP, op1_hi, op1_lo, op2_hi, op2_lo

        .endif

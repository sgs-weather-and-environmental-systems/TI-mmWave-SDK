;******************************************************************************
;* FS_CMP_T2.ASM  - THUMB-2 STATE -  v16.9.6                                  *
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
;* FS$CMP32 - COMPARE TWO IEEE 754 FORMAT SINGLE PRECISION FLOATING POINT 
;*            NUMBERS, SETTING THE STATUS ON THE RESULT.
;*
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0
;*   o INPUT OP2 IS IN r1
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
;*   o EABI, THE FOLLOWING STATUS BITS ARE SET ON THE RESULT
;*     o Z=1,C=1  IFF 0
;*     o Z=0,C=0  IFF -
;*     o Z=0,C=1  IFF +
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

tmp	.set	r4

BODY	.macro __TI_FS$CMP, op1, op2
	.thumb
	.thumbfunc __TI_FS$CMP
	.global __TI_FS$CMP
__TI_FS$CMP:	.asmfunc stack_usage(8)
	PUSH	{r4, lr}

	CMP	op1, op2		; HANDLE THE CASE OF BOTH INPUTS EQUAL 
	IT	EQ
	POPEQ	{r4, pc}

	ORR	tmp, op1, op2		; HANDLE THE CASE OF BOTH INPUTS BEING
	LSL	tmp, tmp, #1		; ZERO
	CMP	tmp, #0x0		;
	IT 	EQ
	POPEQ	{r4, pc}

	LSLS	tmp, op1, #1		; TEST OP1 == 0
	BNE	ct2?			; 

	CMP	tmp, op2		; AFTER CMP, IF OP2 is -VE,
        BMI     op2_pos?                ; C FLAG IS CLEAR TO INDICATE A BORROW
	ADDS	tmp, tmp, #2		; RTS-ABI REQUIRES C FLAG SET
        CMP	tmp, #1                 ; TO INDICATE OP1 > OP2
op2_pos?:
	POP	{r4, pc}

ct2?:	LSL	tmp, op1, #1		;
	LSR	tmp, tmp, #24		; CHECK INPUT #1 FOR INFINITY
	CMP	tmp, #0xFF		;
	BNE	ct1?			;
	LSL	tmp, op2, #1		; CHECK INPUT #2 FOR INFINITY
	LSR	tmp, tmp, #24	;
	CMP	tmp, #0xFF		;
	BNE	ct1?			;

	LSR	tmp, op2, #31		; HANDLE THE CASE OF BOTH INPUTS
	SUBS	tmp, tmp, op1, LSR #31	; BEING INFINITE
	POP	{r4, pc}

ct1?:	CMP	op2, #0			; CHECK OP2'S SIGN
	BMI	op2_m?			;

	CMP	op1, #0			; IF OP1 IS -VE, C FLAG IS 1 AFTER
        BGT     op1_pos?                ; CMP SINCE THERE IS NO BORROW
        MOVS	tmp, #0                 ; RT-ABI REQUIRES C FLAG CLEAR TO
        CMP	tmp, #1                 ; INDICATE OP1 < OP2
	POP	{r4, pc}
op1_pos?:
	CMP	op1, op2 		; 
	POP	{r4, pc}

op2_m?:	CMP	op1, #0			; OP2 IS NEGATIVE.  IF OP1 IS NEGATIVE,
	IT	MI
	CMPMI	op2, op1		; THE RESULT IS OP2 - OP1, ELSE OP1
	POP	{r4, pc}

	.endasmfunc

	.endm

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
					   ; RTS BEING BUILT
	.global  __aeabi_cfcmpeq
	.thumbfunc __aeabi_cfcmpeq
	.sect ".text:__aeabi_cfcmple"
__aeabi_cfcmpeq:	
        BODY __aeabi_cfcmple, r0, r1
	.sect ".text:__aeabi_cfrcmple"
        BODY __aeabi_cfrcmple, r1, r0

        .else

	.clink
	BODY FS$CMP, r0, r1

        .endif

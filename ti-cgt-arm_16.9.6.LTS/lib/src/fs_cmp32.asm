;******************************************************************************
;* FS_CMP32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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
;* FS_CMP32 - COMPARE TWO IEEE 754 FORMAT SINGLE PRECISION FLOATING POINT 
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

tmp	.set	lr

BODY	.macro  __TI_FS_CMP, op1, op2
	.arm
	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_FS_CMP
	.endif
	.global __TI_FS_CMP
__TI_FS_CMP:	.asmfunc stack_usage(4)
	STMFD	sp!, {lr}

	CMP	op1, op2		; HANDLE THE CASE OF BOTH INPUTS EQUAL 
	BEQ	done?       		;

	ORR	tmp, op1, op2		; HANDLE THE CASE OF BOTH INPUTS BEING
	MOV	tmp, tmp, LSL #1	; ZERO
	CMP	tmp, #0x0		;
	BEQ	done?       		;

	MOVS	tmp, op1, LSL #1	; TEST OP1 == 0
	BNE	ct2?			; 

	CMP	tmp, op2		; OP1 == 0, DISREGARD SIGN OF OP1 
	B       done?		 	; WHEN COMPUTING RESULT STATUS

ct2?:	MOV	tmp, op1, LSL #1	;
	MOV	tmp, tmp, LSR #24 	; CHECK INPUT #1 FOR INFINITY
	CMP	tmp, #0xFF		;
	BNE	ct1?			;
	MOV	tmp, op2, LSL #1	; CHECK INPUT #2 FOR INFINITY
	MOV	tmp, tmp, LSR #24	;
	CMP	tmp, #0xFF		;
	BNE	ct1?			;

	MOV	tmp, op2, LSR #31	; HANDLE THE CASE OF BOTH INPUTS
	SUBS	tmp, tmp, op1, LSR #31	; BEING INFINITE
	B	done?			;

ct1?:	CMP	op2, #0			; CHECK OP2'S SIGN
	BMI	op2_m?			;

	CMP	op1, #0			; OP2 IS POSITIVE.  IF OP1 IS POSITIVE,
	CMPGT	op1, op2 		; THE RESULT IS OP1 - OP2, ELSE OP1
	B	done?	        	;

op2_m?:	CMP	op1, #0			; OP2 IS NEGATIVE.  IF OP1 IS NEGATIVE,
	CMPMI	op2, op1		; THE RESULT IS OP2 - OP1, ELSE OP1

done?:

	MRS	tmp, CPSR
	ORRPL	tmp, tmp, #0x20000000	; IF N CLEAR, SET C
	BICMI	tmp, tmp, #0x20000000	; IF N SET, CLEAR C
	MSR	CPSR_f, tmp

	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        LDMFD   sp!, {pc} 	        ;
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif

	.endasmfunc

	.endm

        .if __TI_EABI_ASSEMBLER            ; ASSIGN EXTERNAL NAMES BASED ON
					   ; RTS BEING BUILT
	.global  __aeabi_cfcmpeq
	.armfunc __aeabi_cfcmpeq
	.sect ".text:__aeabi_cfcmple"
__aeabi_cfcmpeq:	
        BODY __aeabi_cfcmple, r0, r1
	.sect ".text:__aeabi_cfrcmple"
        BODY __aeabi_cfrcmple, r1, r0

        .else

	.clink
	BODY FS_CMP, r0, r1

        .endif

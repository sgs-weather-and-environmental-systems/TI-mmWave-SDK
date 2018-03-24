;******************************************************************************
;* ULL_CMP_T2.ASM  - THUMB-2 STATE -  v16.9.6                                 *
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
;* __aeabi_ulcmp - COMPARE TWO UNSIGNED 64-BIT NUMBERS
;*  
;****************************************************************************
;*
;*   o OPERAND 1 IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o OPERAND 2 IS IN r2:r3  (r3:r2 IF LITTLE ENDIAN)
;*
;*   o RETURNS NEGATIVE, ZERO OR POSITIVE INTEGER ACCORDING TO WHETHER THE
;*     COMPARISON RESULT IS <, == or >                      
;*
;****************************************************************************

	.thumb

	.thumbfunc __aeabi_ulcmp
	.global  __aeabi_ulcmp

	.if .TMS470_LITTLE

op1_hi .set    r1			    ; HIGH WORD OF OPERAND 1
op1_lo .set    r0                           ; LOW WORD OF OPERAND 1
op2_hi .set    r3			    ; HIGH WORD OF OPERAND 2
op2_lo .set    r2			    ; LOW WORD OF OPERAND 2

	.else

op1_hi .set    r0			    ; HIGH WORD OF OPERAND 1
op1_lo .set    r1			    ; LOW WORD OF OPERAND 1
op2_hi .set    r2			    ; HIGH WORD OF OPERAND 2
op2_lo .set    r3			    ; LOW WORD OF OPERAND 2

	.endif

__aeabi_ulcmp: .asmfunc stack_usage(0)
	CMP	op1_hi, op2_hi
	ITTT	EQ
	CMPEQ	op1_lo, op2_lo
	MOVEQ	A1, #0
	BXEQ	LR
	ITE	LS
	MVNLS	A1, #0
	MOVHI	A1, #1
	BX	LR
	.endasmfunc

	.end

;******************************************************************************
;* FS_EABI.ASM   - EABI SPECIFIC FLOAT HELPER FUNCTIONS  -  v16.9.6           *
;*                 AS REQUIRED BY: Run-Time ABI for the ARM Architecture      *
;*                                                                            *
;* Copyright (c) 2004-2017 Texas Instruments Incorporated                     *
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

;******************************************************************************
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
;******************************************************************************

	.global  __aeabi_cfcmple
	.global  __aeabi_fsub

tmp	.set	lr

	.arm

;****************************************************************************
;* __AEABI_FNEG -  FLOAT NEGATION
;****************************************************************************
	.sect ".text:__aeabi_fneg"
	.global  __aeabi_fneg
	.armfunc __aeabi_fneg
__aeabi_fneg: .asmfunc stack_usage(0)
	EOR	r0, r0, #0x80000000	; NEGATE OPERAND
	BX	lr
	.endasmfunc 

;****************************************************************************
;* __AEABI_FRSUB -  FLOAT REVERSE SUBTRACTION
;*                  SWAP INPUTS, CALL __AEABI_FSUB
;****************************************************************************
	.sect ".text:__aeabi_frsub"
	.global  __aeabi_frsub
	.armfunc __aeabi_frsub
__aeabi_frsub: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}

	; SWAP INPUTS
	MOV tmp, r0
	MOV r0,  r1
	MOV r1,  tmp

	BL __aeabi_fsub
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPEQ -  FLOAT EQUALITY TEST     
;*                   RETURNS 1 IF INPUTS ARE EQUAL, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpeq"
	.global  __aeabi_fcmpeq
	.armfunc __aeabi_fcmpeq
__aeabi_fcmpeq: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cfcmple

	MOVEQ	r0, #1			; Z set
	MOVNE	r0, #0			; Z clear
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc

	
;****************************************************************************
;* __AEABI_FCMPLT -  FLOAT LESS-THAN TEST     
;*                   RETURNS 1 IF INP1 < INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmplt"
	.global  __aeabi_fcmplt
	.armfunc __aeabi_fcmplt
__aeabi_fcmplt: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cfcmple

	MOVCC	r0, #1			; C clear
	MOVCS	r0, #0			; C set
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPLE -  FLOAT LESS-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 <= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmple"
	.global  __aeabi_fcmple
	.armfunc __aeabi_fcmple
__aeabi_fcmple: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cfcmple

	MOVLS	r0, #1			; C clear or Z set
	MOVHI	r0, #0			; C set and Z clear
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPGT -  FLOAT GREATER-THAN TEST     
;*                   RETURNS 1 IF INP1 > INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpgt"
	.global  __aeabi_fcmpgt
	.armfunc __aeabi_fcmpgt
__aeabi_fcmpgt: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cfcmple

	MOVHI	r0, #1			; C set and Z clear
	MOVLS	r0, #0			; C clear or Z set 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPGE -  FLOAT GREATER-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 >= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpge"
	.global  __aeabi_fcmpge
	.armfunc __aeabi_fcmpge
__aeabi_fcmpge: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cfcmple

	MOVCS	r0, #1			; C set 
	MOVCC	r0, #0			; C clear 
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {pc}
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPUN -  FLOAT UNORDERED                         
;*                   RETURNS 1 IF EITHER NUMBER IS A NaN, 0 OTHERWISE 
;*                   FLOAT NaN: 
;*                         SIGN BIT: 0
;*                         EXPONENT: 11111111 
;*                         MANTISSA: At least one bit set in the 20 most
;*                                   significant bits (EABI, Section 4.1.1.1)
;****************************************************************************
tmp1	.set	r3

	.sect ".text:__aeabi_fcmpun"
	.global  __aeabi_fcmpun
	.armfunc __aeabi_fcmpun
__aeabi_fcmpun: .asmfunc stack_usage(8)
	STMFD	sp!, {r3, lr}
	; check for all 1s in exponent
	MOV	tmp, r0, LSL #1
	MOV	tmp, tmp, LSR #24
	CMP	tmp, #0xFF
	BNE	$op2

	; check for non-zero mantissa
	MOV	tmp, r0, LSL #9
	MOV	tmp, tmp, LSR #12	; Use only 20 MS bits of mantissa
	MOV     tmp1, #0x100000		; 0xFFFFF   
        SUB     tmp1, tmp1, #1            
	ANDS	tmp1, tmp1, tmp
	MOVNE	r0, #1			; != 0 implies non-zero mantissa
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMNEFD sp!, {r3, pc}
	.else
	LDMNEFD	sp!, {r3, lr}
	BXNE	lr
	.endif

$op2:
	; repeat for op2
	; check for all 1s in exponent
	MOV	tmp, r1, LSL #1
	MOV	tmp, tmp, LSR #24
	CMP	tmp, #0xFF
	BNE	$fin

	; check for non-zero mantissa
	MOV	tmp, r1, LSL #9
	MOV	tmp, tmp, LSR #12	; Use only 20 MS bits of mantissa
	MOV     tmp1, #0x100000		; 0xFFFFF   
        SUB     tmp1, tmp1, #1            
	ANDS	tmp1, tmp1, tmp
	MOVNE	r0, #1			; != 0 implies non-zero mantissa
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMNEFD sp!, {r3, pc}
	.else
	LDMNEFD	sp!, {r3, lr}
	BXNE	lr
	.endif

$fin:
	MOV	r0, #0			
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD   sp!, {r3, pc}
	.else
	LDMFD	sp!, {r3, lr}
	BX	lr
	.endif
	.endasmfunc

	.end

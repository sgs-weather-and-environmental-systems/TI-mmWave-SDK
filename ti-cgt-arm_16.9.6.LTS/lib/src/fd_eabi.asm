;******************************************************************************
;* FD_EABI.ASM   - EABI SPECIFIC DOUBLE HELPER FUNCTIONS  -  v16.9.6          *
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

	.global  __aeabi_cdcmple
	.global  __aeabi_dsub

tmp	.set	lr

	.arm


;****************************************************************************
;* __AEABI_DNEG -  DOUBLE NEGATION
;****************************************************************************
	.if .TMS470_BIG_DOUBLE
rp_hi	.set	r0	; High word of regpair 
	.else
rp_hi	.set	r1	; High word of regpair
	.endif

	.sect ".text:__aeabi_dneg"
	.global  __aeabi_dneg
	.armfunc __aeabi_dneg
__aeabi_dneg: .asmfunc stack_usage(0)
	EOR	rp_hi, rp_hi, #0x80000000	; NEGATE OPERAND
	BX	lr
	.endasmfunc 


;****************************************************************************
;* __AEABI_DRSUB -  DOUBLE REVERSE SUBTRACTION
;*                  SWAP INPUTS, CALL __AEABI_DSUB
;****************************************************************************
	.sect ".text:__aeabi_drsub"
	.global  __aeabi_drsub
	.armfunc __aeabi_drsub
__aeabi_drsub: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}

	; SWAP INPUTS
	MOV tmp, r0
	MOV r0,  r2
	MOV r2,  tmp
	MOV tmp, r1
	MOV r1,  r3
	MOV r3,  tmp

	BL __aeabi_dsub
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif  
	.endasmfunc 


;****************************************************************************
;* __AEABI_DCMPEQ -  DOUBLE EQUALITY TEST     
;*                   RETURNS 1 IF INPUTS ARE EQUAL, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpeq"
	.global  __aeabi_dcmpeq
	.armfunc __aeabi_dcmpeq
__aeabi_dcmpeq: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cdcmple

	MOVEQ	r0, #1			; Z set
	MOVNE	r0, #0			; Z clear
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc

	
;****************************************************************************
;* __AEABI_DCMPLT -  DOUBLE LESS-THAN TEST     
;*                   RETURNS 1 IF INP1 < INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmplt"
	.global  __aeabi_dcmplt
	.armfunc __aeabi_dcmplt
__aeabi_dcmplt: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cdcmple

	MOVCC	r0, #1			; C clear
	MOVCS	r0, #0			; C set
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPLE -  DOUBLE LESS-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 <= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmple"
	.global  __aeabi_dcmple
	.armfunc __aeabi_dcmple
__aeabi_dcmple: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cdcmple

	MOVLS	r0, #1			; C clear or Z set
	MOVHI	r0, #0			; C set and Z clear
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPGT -  DOUBLE GREATER-THAN TEST     
;*                   RETURNS 1 IF INP1 > INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpgt"
	.global  __aeabi_dcmpgt
	.armfunc __aeabi_dcmpgt
__aeabi_dcmpgt: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cdcmple

	MOVHI	r0, #1			; C set and Z clear
	MOVLS	r0, #0			; C clear or Z set 
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPGE -  DOUBLE GREATER-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 >= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_dcmpge"
	.global  __aeabi_dcmpge
	.armfunc __aeabi_dcmpge
__aeabi_dcmpge: .asmfunc stack_usage(4)
	STMFD	sp!, {lr}
	BL	__aeabi_cdcmple

	MOVCS	r0, #1			; C set 
	MOVCC	r0, #0			; C clear 
	.if !__TI_TMS470_V4__
	LDMFD   sp!, {pc} 
	.else
	LDMFD	sp!, {lr}
	BX	lr
	.endif
	.endasmfunc


;****************************************************************************
;* __AEABI_DCMPUN -  DOUBLE UNORDERED                         
;*                   RETURNS 1 IF EITHER NUMBER IS A NaN, 0 OTHERWISE 
;*                   DOUBLE NaN: 
;*                         SIGN BIT: 0
;*                         EXPONENT: 11111111111 
;*                         MANTISSA: At least one bit set in the 20 most
;*                                   significant bits (EABI, Section 4.1.1.1)
;****************************************************************************
	.if .TMS470_BIG_DOUBLE
rp1_hi	.set	r0	; High word of regpair 1
rp2_hi	.set	r2	; High word of regpair 2
	.else
rp1_hi	.set	r1	; High word of regpair 1
rp2_hi	.set	r3	; High word of regpair 2
	.endif

msk	.set	r4

	.sect ".text:__aeabi_dcmpun"
	.global  __aeabi_dcmpun
	.armfunc __aeabi_dcmpun
__aeabi_dcmpun: .asmfunc stack_usage(8)
	STMFD	sp!, {r4, lr}
	; check for all 1s in exponent
	MOV	tmp, rp1_hi, LSL #1
	MOV	tmp, tmp, LSR #21
	MOV	msk, #0x800		; LOAD 0x7FF into msk
	SUB	msk, msk, #1
	CMP	tmp, msk
	BNE	$op2

	; check for non-zero mantissa
	MOV     msk, #0x100000		; 0xFFFFF   
        SUB     msk, msk, #1            
	ANDS	msk, msk, tmp
	MOVNE	r0, #1			; != 0 implies non-zero mantissa
	.if !__TI_TMS470_V4__
	LDMNEFD sp!, {r4, pc} 
	.else
	LDMNEFD	sp!, {r4, lr}
	BX	lr
	.endif

$op2:
	; repeat for op2
	; check for all 1s in exponent
	MOV	tmp, rp2_hi, LSL #1
	MOV	tmp, tmp, LSR #21
	MOV	msk, #0x800		; LOAD 0x7FF into msk
	SUB	msk, msk, #1
	CMP	tmp, msk
	BNE	$fin

	; check for non-zero mantissa
	MOV     msk, #0x100000		; 0xFFFFF   
        SUB     msk, msk, #1            
	ANDS	msk, msk, tmp
	MOVNE	r0, #1			; != 0 implies non-zero mantissa
	.if !__TI_TMS470_V4__
	LDMNEFD sp!, {r4, pc} 
	.else
	LDMNEFD	sp!, {r4, lr}
	BX	lr
	.endif

$fin:
	MOV	r0, #0			
	.if !__TI_TMS470_V4__
	LDMFD	sp!, {r4, pc} 
	.else
	LDMFD	sp!, {r4, lr}
	BX	lr
	.endif
	.endasmfunc

	.end
	


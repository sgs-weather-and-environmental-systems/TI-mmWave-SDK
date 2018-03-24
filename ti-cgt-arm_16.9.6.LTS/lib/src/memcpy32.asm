;******************************************************************************
;* MEMCPY32.ASM  - 32 BIT STATE -  v16.9.6                                    *
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
;* C_MEMCPY - COPY CHARACTERS FROM SOURCE TO DEST
;*
;****************************************************************************
;*
;*   o DESTINATION LOCATION IS IN r0
;*   o SOURCE LOCATION IS IN r1
;*   o NUMBER OF CHARACTERS TO BE COPIED IS IN r2
;****************************************************************************

        .arm
 
        .if __TI_EABI_ASSEMBLER 
        .asg memcpy, __TI_C_MEMCPY
	.armfunc __aeabi_memcpy
	.armfunc __aeabi_memcpy4
	.armfunc __aeabi_memcpy8
	.global __aeabi_memcpy
	.global __aeabi_memcpy4
	.global __aeabi_memcpy8
__aeabi_memcpy:
__aeabi_memcpy4:
__aeabi_memcpy8:
        .else
	.clink
        .asg C_MEMCPY, __TI_C_MEMCPY
        .endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_C_MEMCPY
	.endif

        .global __TI_C_MEMCPY
__TI_C_MEMCPY: .asmfunc stack_usage(12)
	CMP	r2, #0			; CHECK FOR n == 0
	BXEQ	lr			;

	STMFD	sp!, {r0, lr}		; SAVE RETURN VALUE AND ADDRESS

	TST	r1, #0x3		; CHECK ADDRESS ALIGNMENT
	BNE	_unaln			; IF NOT WORD ALIGNED, HANDLE SPECIALLY
	TST	r0, #0x3		;
	BNE	_saln			;

_aln:	CMP	r2, #16			; CHECK FOR n >= 16
	BCC	_l16			;

	STMFD	sp!, {r4}		;
	SUB	r2, r2, #16		;
_c16:	LDMIA	r1!, {r3, r4, r12, lr}	; COPY 16 BYTES
	STMIA	r0!, {r3, r4, r12, lr}	;
	SUBS	r2, r2, #16		;
	BCS	_c16			;
	LDMFD	sp!, {r4}		;
	ADDS	r2, r2, #16		; RETURN IF DONE
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc}		;
	.else
	LDMEQFD	sp!, {r0, lr}
	BXEQ	lr
	.endif
	
_l16:	ANDS	r3, r2, #0xC		;
	BEQ	_cp1			;
	BICS	r2, r2, #0xC		;
	ADR	r12, _4line - 16	;
	ADD	pc, r12, r3, LSL #2	;

_4line:	LDR	r3, [r1], #4		; COPY 4 BYTES
	STR	r3, [r0], #4		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc} 		; CHECK FOR n == 0
	.else
	BEQ	_ret
	.endif
	B	_cp1			;

	LDMIA	r1!, {r3, r12}		; COPY 8 BYTES
	STMIA	r0!, {r3, r12}		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc} 		; CHECK FOR n == 0
	.else
	BEQ	_ret
	.endif
	B	_cp1			;

	LDMIA	r1!, {r3, r12, lr}	; COPY 12 BYTES
	STMIA	r0!, {r3, r12, lr}	;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc} 		; CHECK FOR n == 0
	.else
	LDMEQFD	sp!, {r0, lr}
	BXEQ	lr
	.endif

_cp1:	SUBS	r2, r2, #1		;
	ADRNE	r3, _1line - 4		; SETUP TO COPY 1 - 3 BYTES...
	ADDNE	pc, r3, r2, LSL #4	;

_1line:	LDRB	r3, [r1], #1		; COPY 1 BYTE
	STRB	r3, [r0], #1		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {r0, pc}		;
	.else
	B	_ret
	.endif

	LDRH	r3, [r1], #2		; COPY 2 BYTES
	STRH	r3, [r0], #2		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {r0, pc}		;
	NOP
	.else
	LDMFD	sp!, {r0, lr}
	BX	lr
	.endif

	LDRH	r3, [r1], #2		; COPY 3 BYTES
	STRH	r3, [r0], #2		;
	LDRB	r3, [r1], #1		;
	STRB	r3, [r0], #1		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {r0, pc}		;
	.else
	LDMFD	sp!, {r0, lr}
	BX	lr
	.endif

_unaln:	LDRB	r3, [r1], #1		; THE ADDRESSES ARE NOT WORD ALIGNED.
	STRB	r3, [r0], #1		; COPY BYTES UNTIL THE SOURCE IS
	SUBS	r2, r2, #1		; WORD ALIGNED OR THE COPY SIZE
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc}		; BECOMES ZERO
	.else
	LDMEQFD	sp!, {r0, lr}
	BXEQ	lr
	.endif
	TST	r1, #0x3		;
	BNE	_unaln			;

_saln:	TST	r0, #0x1		; IF THE ADDRESSES ARE OFF BY 1 BYTE
	BNE	_off1			; JUST BYTE COPY

	TST	r0, #0x2		; IF THE ADDRESSES ARE NOW WORD ALIGNED
	BEQ	_aln			; GO COPY.  ELSE THEY ARE OFF BY 2, SO
					; GO SHORT WORD COPY

_off2:	SUBS	r2, r2, #4		; COPY 2 BYTES AT A TIME...
	BCC	_c1h			;
_c2:	LDR	r3, [r1], #4		; START BY COPYING CHUNKS OF 4,
	.if	.TMS470_BIG
	STRH	r3, [r0, #2]		;
	MOV	r3, r3, LSR #16		;
	STRH	r3, [r0], #4		;
	.else
	STRH	r3, [r0], #4		;
	MOV	r3, r3, LSR #16		;
	STRH	r3, [r0, #-2]		;
	.endif
	SUBS	r2, r2, #4		;
	BCS	_c2			;
	CMN	r2, #4			;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc}		;
	.else
	LDMEQFD	sp!, {r0, lr}
	BXEQ	lr
	.endif

_c1h:	ADDS	r2, r2, #2		; THEN COPY THE ODD BYTES.
	LDRCSH	r3, [r1], #2		;
	STRCSH	r3, [r0], #2		;
	SUBCS	r2, r2, #2		;
	ADDS	r2, r2, #1		;
	LDRCSB	r3, [r1], #1		;
	STRCSB	r3, [r0], #1		;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {r0, pc}		;
	.else
	LDMFD	sp!, {r0, lr}
	BX	lr
	.endif

_off1:	SUBS	r2, r2, #4		; COPY 1 BYTE AT A TIME...
	BCC	_c1b			;
_c1:	LDR	r3, [r1], #4		; START BY COPYING CHUNKS OF 4,
	.if	.TMS470_BIG
	STRB	r3, [r0, #3]		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0, #2]		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0, #1]		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0], #4		;
	.else
	STRB	r3, [r0], #4		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0, #-3]		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0, #-2]		;
	MOV	r3, r3, LSR #8		;
	STRB	r3, [r0, #-1]		;
	.endif
	SUBS	r2, r2, #4		;
	BCS	_c1			;

_c1b:	ADDS	r2, r2, #4		; THEN COPY THE ODD BYTES.
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMEQFD	sp!, {r0, pc}		;
	.else
	LDMEQFD	sp!, {r0, lr}
	BXEQ	lr
	.endif
_lp1:	LDRB	r3, [r1], #1		;
	STRB	r3, [r0], #1		;
	SUBS	r2, r2, #1		;
	BNE	_lp1			;
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
_ret:	LDMFD	sp!, {r0, pc}		;
	.else
_ret:	LDMFD	sp!, {r0, lr}
	BX	lr
	.endif

	.endasmfunc

	.end

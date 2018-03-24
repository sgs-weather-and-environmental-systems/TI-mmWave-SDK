;******************************************************************************
;* I_DIV32.ASM  - 32 BIT STATE -  v16.9.6                                     *
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
;* I_DIV/I_MOD - DIVIDE TWO SIGNED 32 BIT NUMBERS.
;* I$DIV/I$MOD - 16 BIT STATE INTERFACE TO I_DIV/I_MOD.
;*  
;****************************************************************************
;*
;*   o DIVIDEND IS IN r0
;*   o DIVISOR IS IN r1
;*
;*   o QUOTIENT IS PLACED IN r1
;*   o REMAINDER IS PLACED IN r0
;*
;*   o DIVIDE BY ZERO RETURNS ZERO
;*   o SIGN OF REMAINDER IS THE SIGN OF THE DIVIDEND
;*
;*   o EABI MODE, QUOTIENT IN r0, REMAINDER IN r1
;*   o EABI MODE, DIVIDE BY ZERO RETURNS
;*   	- 0 IF DIVIDEND == 0
;*   	- INT_MAX IF DIVIDEND > 0
;*   	- INT_MIN IF DIVIDEND < 0
;*
;****************************************************************************

	.arm

        .if __TI_EABI_ASSEMBLER                   ; ASSIGN EXTERNAL NAMES 
	.ref __aeabi_idiv0
        .asg __aeabi_idivmod, __TI_I_DIV          ; BASED ON RTS BEING BUILT
        .else
	.clink
        .asg I_DIV, __TI_I_DIV
        .endif

dvs	.set	r2		; WORK COPY OF THE DIVISOR (SHIFTED)
quo	.set	r3		; WORK COPY OF THE QUOTIENT
negs	.set	lr		; SAVED COPY OF THE SIGNS

        .if !__TI_EABI_ASSEMBLER

	.if !$$isdefed("__small_divide__")
	.if __TI_ARM9ABI_ASSEMBLER
	    .thumbfunc I$DIV
	    .thumbfunc I$MOD
	.endif
	
	.global I$DIV
	.global I$MOD

	.align
	.thumb
I$DIV:	.asmfunc stack_usage(0)
I$MOD:	BX	pc			; CHANGE TO 32-BIT STATE
	NOP
	.arm
	.endasmfunc

	.endif
	
	.if __TI_ARM9ABI_ASSEMBLER
	    .armfunc I_MOD
	.endif

	.global I_MOD
I_MOD:
	.endif

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.armfunc __TI_I_DIV
	.endif

	.global __TI_I_DIV
	.if __TI_EABI_ASSEMBLER
	.global __aeabi_idiv
__aeabi_idiv:
	.endif
__TI_I_DIV:	.asmfunc stack_usage(12)
	STMFD	sp!, {dvs, quo, lr}	; SAVE CONTEXT

	CMP	r1, #0			; CHECK FOR DIVISION BY ZERO, AND
	BEQ	div_by_zero

	.if __TI_TMS470_V7R4__
	ADD	quo, PC, #1
	BX	quo
	.thumb
	SDIV	quo, r0, r1
	BX	PC
	NOP
	.arm
	MUL	dvs, quo, r1
	SUB	r0, r0, dvs
	MOV	r1, quo
	.else
	
	MOV	negs, r1, LSR #1	; MOVE THE SIGN OF THE DIVISOR TO negs
	EORS	negs, negs, r0, ASR #1	; MOVE THE SIGN OF THE DIVIDEND TO negs
	RSBMI	r0, r0, #0		; ABSOLUTE SIGN OF THE DIVIDEND

	ANDS	quo, r1, #0x80000000	; INITIALIZE THE QUOTIENT
	RSBNE	r1, r1, #0		; ABSOLUTE SIGN OF THE DIVISOR
	MOVS	dvs, r1			

	CMP	dvs, r0,  LSR #16	; CALCULATE THE MAXIMUM DIVISOR
	MOVLS	dvs, dvs, LSL #16	; SHIFT AMOUNT WITH PSEUDO BINARY
	CMP	dvs, r0,  LSR #8	; SEARCH.
	MOVLS	dvs, dvs, LSL #8	;

	CMP	dvs, r0, LSR #1		; NOW FIND EXACTLY WHERE THE SHIFTED
	BHI	mod1			; DIVISOR SHOULD BE SO THAT WE CAN
	CMP	dvs, r0, LSR #2		; JUMP INTO THE CORRECT LOCATION
	BHI	mod2			; OF THE UNROLLED DIVIDE LOOP.
	CMP	dvs, r0, LSR #3		;
	BHI	mod3			;
	CMP	dvs, r0, LSR #4		;
	BHI	mod4			;
	CMP	dvs, r0, LSR #5		;
	BHI	mod5			;
	CMP	dvs, r0, LSR #6		;
	BHI	mod6			;
	CMP	dvs, r0, LSR #7		;
	BHI	mod7			;

divl:					; DIVIDE LOOP UNROLLED 8 TIMES
	CMP	r0, dvs, LSL #7		; IF DIVIDEND IS LARGER THAN DIVISOR,
	ADC	quo, quo, quo		; SHIFT A 1 INTO THE QUOTIENT AND 
	SUBCS	r0, r0, dvs, LSL #7	; SUBTRACT THE DIVISOR, ELSE SHIFT A 0.
	CMP	r0, dvs, LSL #6		;

mod7:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #6	;
	CMP	r0, dvs, LSL #5		;

mod6:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #5	;
	CMP	r0, dvs, LSL #4		;

mod5:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #4	;
	CMP	r0, dvs, LSL #3		;

mod4:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #3	;
	CMP	r0, dvs, LSL #2		;

mod3:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #2	;
	CMP	r0, dvs, LSL #1		;

mod2:	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs, LSL #1	;

mod1:	CMP	r0, dvs			;
	ADC	quo, quo, quo		;
	SUBCS	r0, r0, dvs		;

	CMP	r1, dvs			; IF THERE IS SHIFTED DIVISOR, THEN
	MOVCC	dvs, dvs, LSR #8	; CONTINUE THE LOOP.
	BCC	divl			;

	MOV	r1, quo			; ELSE DONE. PLACE THE QUOTIENT
	MOVS	negs, negs, LSL #1	; IT ITS RIGHT PLACE, AND
	RSBMI	r1, quo, #0		; SET THE SIGN OF THE QUOTIENT AND
	RSBCS	r0, r0, #0		; REMAINDER.
	.endif
	
        .if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
        MOV     r2, r0                  ; SWAP R0 & R1
        MOV     r0, r1
        MOV     r1, r2
        .endif

	.if !$$isdefed("__small_divide__")
	LDMFD	sp!, {dvs, quo, lr}
	BX	lr
	.else
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {dvs, pc}
	.else
	LDMFD	sp!, {dvs, lr}
	BX	lr
	.endif
	.endif

div_by_zero:

        .if __TI_EABI_ASSEMBLER         ; EABI RTS, QUOT IN R0, REM IN R1
	CMP     r0, #0
	MVNGT   r0, #0x80000000         ; IF DIVIDEND IS +VE, RETURN INT_MAX
        MOVLT   r0, #0x80000000         ; IF DIVIDEND IS -VE, RETURN INT_MIN
	BL      __aeabi_idiv0
	.else
	MOV	r0, #0			; DIVIDE BY ZERO RETURNS ZERO
        .endif

	.if !$$isdefed("__small_divide__")
	LDMFD	sp!, {dvs, quo, lr}
	BX	lr
	.else
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	LDMFD	sp!, {dvs, pc}
	.else
	LDMFD	sp!, {dvs, lr}
	BX	lr
	.endif
	.endif

	.endasmfunc

	.end

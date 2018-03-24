;
;  Copyright (c) 2012, Texas Instruments Incorporated
;  All rights reserved.
; 
;  Redistribution and use in source and binary forms, with or without
;  modification, are permitted provided that the following conditions
;  are met:
; 
;  *  Redistributions of source code must retain the above copyright
;     notice, this list of conditions and the following disclaimer.
; 
;  *  Redistributions in binary form must reproduce the above copyright
;     notice, this list of conditions and the following disclaimer in the
;     documentation and/or other materials provided with the distribution.
; 
;  *  Neither the name of Texas Instruments Incorporated nor the names of
;     its contributors may be used to endorse or promote products derived
;     from this software without specific prior written permission.
; 
;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
;  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
;  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
;  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
;  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
;  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
;  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
;  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
;  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
;
; ======== TaskSupport_asm.asm ========
;
        .global _ti_sysbios_family_msp430_TaskSupport_swap__E
        .global ti_sysbios_family_msp430_TaskSupport_swap__E
        .global _ti_sysbios_family_msp430_TaskSupport_swap__E
        .global ti_sysbios_family_msp430_TaskSupport_buildTaskStack
        .global _ti_sysbios_family_msp430_TaskSupport_glue
        .global ti_sysbios_family_msp430_TaskSupport_glue

        .align 2

;
;  ======== Task_buildTaskStack ========
;
;  Task_buildTaskStack(stack, fxn, exit, entry, arg0, arg1)
;			 r12, r13,  r14,   r15,[2;4], [4;8]
;
;  initial stack image:
;
;		r4 = -1 
;		r5 = -1 
;		r6 = -1     
;		r7 = -1     
;		r8 = -1     
;		r9 = -1     
;		r10 = -1     
;		initial SR    
;		glue    
;		arg0    
;		arg1    
;		fxn    
;		exit    
;		enter    
;

STACK   .set    R12	; 1st argument, return value
FXN     .set    R13     ; 2nd argument
EXIT    .set    R14     ; 3rd argument
ENTER   .set    R15     ; 4th argument

        .sect ".text:_ti_sysbios_family_msp430_TaskSupport_buildTaskStack"
        .clink

ti_sysbios_family_msp430_TaskSupport_buildTaskStack:
_ti_sysbios_family_msp430_TaskSupport_buildTaskStack:
        .asmfunc
    .if $DEFINED(__LARGE_CODE_MODEL__)

ARG0L   .set    4       ; 5th argument (stack offset)
ARG0H   .set    6       ;
ARG1L   .set    8       ; 6th argument (stack offset)
ARG1H   .set    10      ;

        MOV.A   ENTER, 0(STACK)
        MOV.A   EXIT, -4(STACK)
        MOV.A   FXN, -8(STACK)

        MOV.W   ARG1L(SP), R13
        MOV.W   R13, -12(STACK)
        MOV.W   ARG1H(SP), R13
        MOV.W   R13, -10(STACK)

        MOV.W   ARG0L(SP), R13
        MOV.W   R13, -16(STACK)
        MOV.W   ARG0H(SP), R13
        MOV.W   R13, -14(STACK)

        MOV.A   #_ti_sysbios_family_msp430_TaskSupport_glue, R13
        MOV.W   R13, -18(STACK)

	RRAM.A	#4, R13			; merge upper 4 bits of glue addr
	AND.W	#0xf000, R13		; into upper 4 bits of SR
	BIS.W	#8, R13			;
        MOV.W   R13,  -20(STACK)	; initial SR

	MOV.A	#-1, R13
        MOV.A   R13, -24(STACK)		; R10 = -1
        MOV.A   R13, -28(STACK)		; R9  = -1
        MOV.A   R13, -32(STACK)		; R8  = -1
        MOV.A   R13, -36(STACK)		; R7  = -1
        MOV.A   R13, -40(STACK)		; R6  = -1
        MOV.A   R13, -44(STACK)		; R5  = -1
        MOV.A   R13, -48(STACK)		; R4  = -1
        
        SUB.A	#48, R12		; return with adjusted stack pointer
	RETA
    .else

ARG0    .set    2       ; 5th argument (stack offset)
ARG1    .set    4       ; 6th argument (stack offset)

        MOV.W   ENTER, 0(STACK)
        MOV.W   EXIT, -2(STACK)
        MOV.W   FXN, -4(STACK)

        MOV.W   ARG1(SP), R13
        MOV.W   R13, -6(STACK)
        MOV.W   ARG0(SP), R13
        MOV.W   R13, -8(STACK)

        MOV.W   #_ti_sysbios_family_msp430_TaskSupport_glue, R13
        MOV.W   R13, -10(STACK)

        MOV.W   #8,  -12(STACK)		; initial SR (GIE=1)

	MOV.W	#-1, R13
        MOV.W   R13, -14(STACK)		; R10 = -1
        MOV.W   R13, -16(STACK)		; R9  = -1        
        MOV.W   R13, -18(STACK)		; R8  = -1        
        MOV.W   R13, -20(STACK)		; R7  = -1        
        MOV.W   R13, -22(STACK)		; R6  = -1        
        MOV.W   R13, -24(STACK)		; R5  = -1        
        MOV.W   R13, -26(STACK)		; R4  = -1        

        SUB.W	#26, R12		; return with adjusted stack pointer
	RET
    .endif
        .endasmfunc

;
;  ======== TaskSupport_swap ========
;
;  TaskSupport_swap(oldSP, newSP)
;

OLD     .set    r12                      ; 1st argument
NEW     .set    r13                      ; 2nd argument

        .sect ".text:_ti_sysbios_family_msp430_TaskSupport_swap__E"
        .clink

ti_sysbios_family_msp430_TaskSupport_swap__E:
_ti_sysbios_family_msp430_TaskSupport_swap__E:
        .asmfunc
    .if $DEFINED(__LARGE_CODE_MODEL__) & $DEFINED(__LARGE_DATA_MODEL__)
    	POP.A	R14
	PUSH.W	R14

	RRAM.A	#4, R14		; merge upper 4 bits of RA into
	AND.W	#0xf000, R14	; upper 4 bits of SR
	BIS.W	SR, R14

    	PUSH.W  R14	
        PUSHM.A	#7, R10
        MOV.A	SP, 0(OLD)	; large data pointer
        MOV.A	0(NEW), SP
        POPM.A	#7, R10
	RETI
    .elseif $DEFINED(__LARGE_CODE_MODEL__)
    	POP.A	R14
	PUSH.W	R14

	RRAM.A	#4, R14		; merge upper 4 bits of RA into
	AND.W	#0xf000, R14	; upper 4 bits of SR
	BIS.W	SR, R14

    	PUSH.W  R14	
        PUSHM.A	#7, R10
        MOV.W	SP, 0(OLD)	; small data pointer
        MOV.W	0(NEW), SP
        POPM.A	#7, R10
	RETI
    .else
    	PUSH.W	SR
        PUSH.W	R10
        PUSH.W	R9
        PUSH.W	R8
        PUSH.W	R7
        PUSH.W	R6
        PUSH.W	R5
        PUSH.W	R4
        MOV.W	SP, 0(OLD)	; small data pointer
        MOV.W	0(NEW), SP
        POP.W	R4
        POP.W	R5
        POP.W	R6
        POP.W	R7
        POP.W	R8
        POP.W	R9
        POP.W	R10
	RETI
    .endif
        .endasmfunc
;
;  ======== TaskSupport_glue ========
;
;  This glue function is executed immediately before executing the "fxn"
;  passed to Task_start.  This function loads the parameters to "fxn" into
;  registers - necessary for the arm register passing model.
;

        .sect ".text:_ti_sysbios_family_msp430_TaskSupport_glue"
        .clink

_ti_sysbios_family_msp430_TaskSupport_glue:
ti_sysbios_family_msp430_TaskSupport_glue:
        .asmfunc
    .if $DEFINED(__LARGE_CODE_MODEL__)
        MOV.A   16(SP), R12	; Task enter function
        CALLA	R12             ; call Task enter function

; return from Task enter function here
        POP.W   R12 		; task arg0L
        POP.W   R13 		; task arg0H

        POP.W	R14	 	; task arg1L
        POP.W	R15	 	; task arg1H
	RETA
    .else
        MOV.W   8(SP), R12	; Task enter function
        CALL	R12             ; call Task enter function

; return from Task enter function here
        POP.W   R12 		; task arg0
        POP.W	R13	 	; task arg1
	RET
    .endif
        .endasmfunc


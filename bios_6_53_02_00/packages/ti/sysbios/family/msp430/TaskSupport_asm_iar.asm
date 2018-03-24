;
;  Copyright (c) 2014, Texas Instruments Incorporated
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
; ======== TaskSupport_asm_iar.asm ========
;
;

;
;  ======== TaskSupport_buildTaskStack ========
;
;  For MSP430 and MSP430X_large targets:
;
;    Task_buildTaskStack(stack, fxn,  exit, entry,  arg0,  arg1)
;                        r12,   r13,  r14,   r15,  [2;4],  [4;8]
;
;  For MSP430X_small target:
;
;    Task_buildTaskStack(stack,  fxn,     exit,   entry,  arg0,    arg1)
;                        r12,   r14:r15,  4(SP),  8(SP),  12(SP),  16(SP)
;
;  initial stack image:
;
;               r4 = -1 
;               r5 = -1 
;               r6 = -1     
;               r7 = -1     
;               r8 = -1     
;               r9 = -1     
;               r10 = -1     
;               r11 = -1     
;               initial SR    
;               glue    
;               arg0    
;               arg1    
;               fxn    
;               exit    
;               enter    
;

#ifdef __SMALL_DATA_MODEL__

; 1st argument, return value
#define STACK   R12

; 2nd argument
#define FXNL    R14
#define FXNH    R15

; 3rd argument
#define EXIT    4

; 4th argument
#define ENTER   8 

#else

; 1st argument, return value
#define STACK   R12

; 2nd argument
#define FXN     R13

; 3rd argument
#define EXIT    R14

; 4th argument
#define ENTER   R15

#endif

        RSEG CODE:CODE

        NAME ti_sysbios_family_msp430_TaskSupport_buildTaskStack

        PUBLIC ti_sysbios_family_msp430_TaskSupport_buildTaskStack
        PUBLIC _ti_sysbios_family_msp430_TaskSupport_buildTaskStack

        EXTERN _ti_sysbios_family_msp430_TaskSupport_glue

ti_sysbios_family_msp430_TaskSupport_buildTaskStack:
_ti_sysbios_family_msp430_TaskSupport_buildTaskStack:

#if __CORE__ == __430X_CORE__

#ifdef __LARGE_DATA_MODEL__

; 5th argument (stack offset)
#define ARG0L 4       
#define ARG0H 6

; 6th argument (stack offset)
#define ARG1L 8       
#define ARG1H 10

        BIC     #1, STACK               ; force align of 2
        MOVX.A  ENTER, 0(STACK)
        MOVX.A  EXIT, -4(STACK)
        MOVX.A  FXN, -8(STACK)
        MOVX.W  ARG1L(SP), R13
        MOVX.W  R13, -12(STACK)
        MOVX.W  ARG1H(SP), R13
        MOVX.W  R13, -10(STACK)

        MOVX.W  ARG0L(SP), R13
        MOVX.W  R13, -16(STACK)
        MOVX.W  ARG0H(SP), R13
        MOVX.W  R13, -14(STACK)

        MOVX.A  #_ti_sysbios_family_msp430_TaskSupport_glue, R13
        MOVX.W  R13, -18(STACK)

        RRAM.A  #4, R13                 ; merge upper 4 bits of glue addr
        AND.W   #0xf000, R13            ; into upper 4 bits of SR
        BIS.W   #8, R13                 ;
        MOVX.W  R13,  -20(STACK)        ; initial SR

        MOVX.A  #-1, R13
        MOVX.A  R13, -24(STACK)         ; R11 = -1
        MOVX.A  R13, -28(STACK)         ; R10  = -1
        MOVX.A  R13, -32(STACK)         ; R9  = -1
        MOVX.A  R13, -36(STACK)         ; R8  = -1
        MOVX.A  R13, -40(STACK)         ; R7  = -1
        MOVX.A  R13, -44(STACK)         ; R6  = -1
        MOVX.A  R13, -48(STACK)         ; R5  = -1
        MOVX.A  R13, -52(STACK)         ; R4  = -1
        
        SUBX.A  #52, R12                ; return with adjusted stack pointer
        RETA
#endif

#ifdef __SMALL_DATA_MODEL__

; 5th argument (stack offset)
#define ARG0L 12       
#define ARG0H 14

; 6th argument (stack offset)
#define ARG1L 16       
#define ARG1H 18

        BIC     #1, STACK               ; force align of 2
        MOVX.A  ENTER(SP), R13
        MOVX.A  R13, 0(STACK)
        MOVX.A  EXIT(SP), R13
        MOVX.A  R13, -4(STACK)
        MOVX.W  FXNL, -8(STACK)
        MOVX.W  FXNH, -6(STACK)

        MOVX.W  ARG1L(SP), R13
        MOVX.W  R13, -12(STACK)
        MOVX.W  ARG1H(SP), R13
        MOVX.W  R13, -10(STACK)

        MOVX.W  ARG0L(SP), R13
        MOVX.W  R13, -16(STACK)
        MOVX.W  ARG0H(SP), R13
        MOVX.W  R13, -14(STACK)

        MOVX.A  #_ti_sysbios_family_msp430_TaskSupport_glue, R13
        MOVX.W  R13, -18(STACK)

        RRAM.A  #4, R13                 ; merge upper 4 bits of glue addr
        AND.W   #0xf000, R13            ; into upper 4 bits of SR
        BIS.W   #8, R13                 ;
        MOVX.W  R13,  -20(STACK)        ; initial SR

        MOVX.A  #-1, R13
        MOVX.A  R13, -24(STACK)         ; R11 = -1
        MOVX.A  R13, -28(STACK)         ; R10  = -1
        MOVX.A  R13, -32(STACK)         ; R9  = -1
        MOVX.A  R13, -36(STACK)         ; R8  = -1
        MOVX.A  R13, -40(STACK)         ; R7  = -1
        MOVX.A  R13, -44(STACK)         ; R6  = -1
        MOVX.A  R13, -48(STACK)         ; R5  = -1
        MOVX.A  R13, -52(STACK)         ; R4  = -1
        
        SUBX.A  #52, R12                ; return with adjusted stack pointer
        RETA
#endif

#else

; 5th argument (stack offset)
#define ARG0 2

; 6th argument (stack offset)
#define ARG1 4

        BIC     #1, STACK               ; force align of 2
        MOV.W   ENTER, 0(STACK)
        MOV.W   EXIT, -2(STACK)
        MOV.W   FXN, -4(STACK)

        MOV.W   ARG1(SP), R13
        MOV.W   R13, -6(STACK)
        MOV.W   ARG0(SP), R13
        MOV.W   R13, -8(STACK)

        MOV.W   #_ti_sysbios_family_msp430_TaskSupport_glue, R13
        MOV.W   R13, -10(STACK)

        MOV.W   #8,  -12(STACK)         ; initial SR (GIE=1)

        MOV.W   #-1, R13
        MOV.W   R13, -14(STACK)         ; R11 = -1
        MOV.W   R13, -16(STACK)         ; R10  = -1        
        MOV.W   R13, -18(STACK)         ; R9  = -1        
        MOV.W   R13, -20(STACK)         ; R8  = -1        
        MOV.W   R13, -22(STACK)         ; R7  = -1        
        MOV.W   R13, -24(STACK)         ; R6  = -1        
        MOV.W   R13, -26(STACK)         ; R5  = -1        
        MOV.W   R13, -28(STACK)         ; R4  = -1        

        SUB.W   #28, R12                ; return with adjusted stack pointer
        RET
#endif
        ENDMOD


;
;  ======== TaskSupport_swap ========
;
;  TaskSupport_swap(oldSP, newSP)
;

; 1st argument
#define OLD    r12 

; 2nd argument
#define NEW    r13

        RSEG CODE:CODE

        NAME ti_sysbios_family_msp430_TaskSupport_swap__E

        PUBLIC ti_sysbios_family_msp430_TaskSupport_swap__E
        PUBLIC _ti_sysbios_family_msp430_TaskSupport_swap__E

ti_sysbios_family_msp430_TaskSupport_swap__E:
_ti_sysbios_family_msp430_TaskSupport_swap__E:

#if __CORE__ == __430X_CORE__

#ifdef __LARGE_DATA_MODEL__     ; data model = Large
        POPX.A  R14
        PUSHX.W R14

        RRAM.A  #4, R14         ; merge upper 4 bits of RA into
        AND.W   #0xf000, R14    ; upper 4 bits of SR
        BIS.W   SR, R14

        PUSHX.W R14
        PUSHM.A #8, R11
        MOVX.A  SP, 0(OLD)      ; large data pointer
        MOVX.A  0(NEW), SP
        POPM.A  #8, R11
        RETI
#else                           ; data model = Small
        POPX.A  R14
        PUSHX.W R14

        RRAM.A  #4, R14         ; merge upper 4 bits of RA into
        AND.W   #0xf000, R14    ; upper 4 bits of SR
        BIS.W   SR, R14

        PUSHX.W R14
        PUSHM.A #8, R11
        MOVX.W  SP, 0(OLD)      ; small data pointer
        MOVX.W  0(NEW), SP
        POPM.A  #8, R11
        RETI
#endif

#else                           ; __CORE__ == __430_CORE__
        PUSH.W  SR
        PUSH.W  R11
        PUSH.W  R10
        PUSH.W  R9
        PUSH.W  R8
        PUSH.W  R7
        PUSH.W  R6
        PUSH.W  R5
        PUSH.W  R4
        MOV.W   SP, 0(OLD)      ; small data pointer
        MOV.W   0(NEW), SP
        POP.W   R4
        POP.W   R5
        POP.W   R6
        POP.W   R7
        POP.W   R8
        POP.W   R9
        POP.W   R10
        POP.W   R11
        RETI
#endif
        ENDMOD


;
;  ======== TaskSupport_glue ========
;
;  This glue function is executed immediately before executing the "fxn"
;  passed to Task_start.  This function loads the parameters to "fxn" into
;  registers - necessary for the arm register passing model.
;

        RSEG CODE:CODE

        NAME _ti_sysbios_family_msp430_TaskSupport_glue

        PUBLIC _ti_sysbios_family_msp430_TaskSupport_glue
        PUBLIC ti_sysbios_family_msp430_TaskSupport_glue
        PUBLIC glue

_ti_sysbios_family_msp430_TaskSupport_glue:
ti_sysbios_family_msp430_TaskSupport_glue:
glue:

#if __CORE__ == __430X_CORE__
        MOVX.A   16(SP), R12    ; Task enter function
        CALLA   R12             ; call Task enter function

; return from Task enter function here
        POPX.W   R12            ; task arg0L
        POPX.W   R13            ; task arg0H

        POPX.W  R14             ; task arg1L
        POPX.W  R15             ; task arg1H
        RETA
#else
        MOV.W   8(SP), R12      ; Task enter function
        CALL    R12             ; call Task enter function

; return from Task enter function here
        POP.W   R12             ; task arg0
        POP.W   R13             ; task arg1
        RET
#endif
        ENDMOD

        END


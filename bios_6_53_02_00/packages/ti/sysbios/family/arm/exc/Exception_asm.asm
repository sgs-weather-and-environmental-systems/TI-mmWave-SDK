;
;  Copyright (c) 2015-2017, Texas Instruments Incorporated
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
; ======== Exception_asm.s470 ========
;

        .cdecls C,NOLIST,"package/internal/Exception.xdc.h" 

        .state32

        .global ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I
        .global ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I
        .global ti_sysbios_family_arm_exc_Exception_excHandler__I
        .global ti_sysbios_family_arm_exc_Exception_initCore0__I

        .ref ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A

ti_sysbios_family_arm_exc_Exception_Module__state__V .tag ti_sysbios_family_arm_exc_Exception_Module_State

;
;  ======== Exception_excHandlerAsm ========
;  Common Exception handler
;

        .sect ".text:ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I"
        .clink
        .armfunc ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I

ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I:
        .asmfunc
        stmfd   sp!, {r0-r12}   ; save r4-r12 while we're at it

        mrc     p15, #0, r12, c5, c0, #0 ; read DFSR into r12
        stmfd   sp!, {r12}      ; save DFSR
        mrc     p15, #0, r12, c5, c0, #1 ; read IFSR into r12
        stmfd   sp!, {r12}      ; save IFSR
        mrc     p15, #0, r12, c6, c0, #0 ; read DFAR into r12
        stmfd   sp!, {r12}      ; save DFAR
    .if (__TI_ARM_V5E__ = 1)
        mov     r12, #0         ; not supported on Arm9
    .else
        mrc     p15, #0, r12, c6, c0, #2 ; read IFAR into r12
    .endif
        stmfd   sp!, {r12}      ; save IFAR

        mrs     r12, cpsr
        push    {r12}           ; save current CPSR

        mov     r0, sp          ; pass sp to exception handler
        sub     lr, lr, #4      ; back up to offending instruction
        mov     r1, lr          ; pass lr (=pc)

        mrs     r2, cpsr
        orr     r12, r2, #0x1f  ; switch to SYS mode
        msr     cpsr_cf, r12    ;

        stmfd   r0!, {lr}       ; save system lr
        mov     r12, sp
        stmfd   r0!, {r12}      ; save system sp
        mrs     r12, cpsr
        stmfd   r0!, {r12}      ; save system cpsr

        msr     cpsr_cf, r2     ; switch back to previous mode

        sub     sp, sp, #16     ; adjust sp to account for lr/sp/cpsr push
                                ; and to align the stack to 8-bytes

        ldr     pc, excHandlerAddr

excHandlerAddr:
        .word   ti_sysbios_family_arm_exc_Exception_excHandler__I
        .endasmfunc

;
;  ======== Exception_excHandlerDataAsm ========
;  Data Abort Exception handler
;

        .clink
        .armfunc ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I

ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I:
        .asmfunc
        stmfd   sp!, {r0-r12}   ; save r4-r12 while we're at it

        mrc     p15, #0, r12, c5, c0, #0 ; read DFSR into r12
        stmfd   sp!, {r12}      ; save DFSR
        mrc     p15, #0, r12, c5, c0, #1 ; read IFSR into r12
        stmfd   sp!, {r12}      ; save IFSR
        mrc     p15, #0, r12, c6, c0, #0 ; read DFAR into r12
        stmfd   sp!, {r12}      ; save DFAR
    .if (__TI_ARM_V5E__ = 1)
        mov     r12, #0         ; not supported on Arm9
    .else
        mrc     p15, #0, r12, c6, c0, #2 ; read IFAR into r12
    .endif
        stmfd   sp!, {r12}      ; save IFAR

        mrs     r12, cpsr
        add     r12, r12, #1    ; replace abort (0x17) with 0x18 
        push    {r12}           ; save current CPSR

        mov     r0, sp          ; pass sp to exception handler
        sub     lr, lr, #8      ; back up to offending instruction
        mov     r1, lr          ; pass lr (=pc)

        mrs     r2, cpsr
        orr     r12, r2, #0x1f  ; switch to SYS mode
        msr     cpsr_cf, r12    ;

        stmfd   r0!, {lr}       ; save system lr too
        mov     r12, sp
        stmfd   r0!, {r12}      ; save system sp
        mrs     r12, cpsr
        stmfd   r0!, {r12}      ; save system cpsr

        msr     cpsr_cf, r2     ; switch back to previous mode

        sub     sp, sp, #16     ; adjust sp to account for lr/sp/cpsr push
                                ; and to align the stack to 8-bytes

        ldr     pc, excHandlerAddr
        .endasmfunc


;
;  ======== Exception_initCore0 ========
;  Low level ARM mode-specific register initialization
;

        .sect ".text:ti_sysbios_family_arm_exc_Exception_initCore0__I"
        .clink
        .armfunc ti_sysbios_family_arm_exc_Exception_initCore0__I

ti_sysbios_family_arm_exc_Exception_initCore0__I:
        .asmfunc

; Initialize Abort sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f ; switch to Abort mode
        orr     r12, r12, #0x17 ; to initialize Abort sp
        msr     cpsr_cf, r12    ;

    .if (__TI_ARM_V7__ = 1)
        movw    sp, ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
    .else
        ldr     sp, excStackAddr
        ldr     sp, [sp]        ; base of exc stack
    .endif
        ldr     sp, [sp]        ; base of core0's exc stack
        ldr     r12, excStackSize
        ldr     r12, [r12]      ; size of exc stack
        add     sp, r12, sp     ; sp = initial exc stack

; Initialize Undefined sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f ; switch to Undef mode
        orr     r12, r12, #0x1b ; to initialize Undef sp
        msr     cpsr_cf, r12    ;

    .if (__TI_ARM_V7__ = 1)
        movw    sp, ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
    .else
        ldr     sp, excStackAddr
        ldr     sp, [sp]        ; base of exc stack
    .endif
        ldr     sp, [sp]        ; base of core0's exc stack
        ldr     r12, excStackSize
        ldr     r12, [r12]      ; size of exc stack
        add     sp, r12, sp     ; sp = initial exc stack

; Done
        mrs     r12, cpsr
        orr     r12, r12, #0x1f ; switch back to SYS mode
        msr     cpsr_cf, r12    ;

        bx      lr
        .endasmfunc

    .if (__TI_ARM_V7__ != 1)
excStackAddr:
        .word   ti_sysbios_family_arm_exc_Exception_Module__state__V.excStack
    .endif

excStackSize:
        .word   ti_sysbios_family_arm_exc_Exception_Module__state__V.excStackSize

        .end

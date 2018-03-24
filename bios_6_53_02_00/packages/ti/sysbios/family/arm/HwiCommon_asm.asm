;
;  Copyright (c) 2013-2014, Texas Instruments Incorporated
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
; ======== HwiCommon_asm.s470 ========
;
;

        .cdecls C,NOLIST,"package/internal/HwiCommon.xdc.h"

    .if __TI_EABI_ASSEMBLER
        .asg ti_sysbios_family_arm_HwiCommon_disableA__I, _ti_sysbios_family_arm_HwiCommon_disableA__I
        .asg ti_sysbios_family_arm_HwiCommon_enableA__I, _ti_sysbios_family_arm_HwiCommon_enableA__I
        .asg ti_sysbios_family_arm_HwiCommon_restoreA__I, _ti_sysbios_family_arm_HwiCommon_restoreA__I
        .asg ti_sysbios_family_arm_HwiCommon_disableFIQA__I, _ti_sysbios_family_arm_HwiCommon_disableFIQA__I
        .asg ti_sysbios_family_arm_HwiCommon_enableFIQA__I, _ti_sysbios_family_arm_HwiCommon_enableFIQA__I
        .asg ti_sysbios_family_arm_HwiCommon_restoreFIQA__I, _ti_sysbios_family_arm_HwiCommon_restoreFIQA__I
        .asg ti_sysbios_family_arm_HwiCommon_disableIRQA__I, _ti_sysbios_family_arm_HwiCommon_disableIRQA__I
        .asg ti_sysbios_family_arm_HwiCommon_enableIRQA__I, _ti_sysbios_family_arm_HwiCommon_enableIRQA__I
        .asg ti_sysbios_family_arm_HwiCommon_restoreIRQA__I, _ti_sysbios_family_arm_HwiCommon_restoreIRQA__I
        .asg ti_sysbios_family_arm_HwiCommon_swiHandler__I, _ti_sysbios_family_arm_HwiCommon_swiHandler__I

        .asg ti_sysbios_family_arm_HwiCommon_isrStack, _ti_sysbios_family_arm_HwiCommon_isrStack
        .asg ti_sysbios_family_xxx_Hwi_switchToTaskStack, _ti_sysbios_family_xxx_Hwi_switchToTaskStack
        .asg ti_sysbios_family_xxx_Hwi_switchToIsrStack, _ti_sysbios_family_xxx_Hwi_switchToIsrStack
        .asg ti_sysbios_family_xxx_Hwi_switchAndRunFunc, _ti_sysbios_family_xxx_Hwi_switchAndRunFunc
        .asg ti_sysbios_family_arm_HwiCommon_Module__state__V, _ti_sysbios_family_arm_HwiCommon_Module__state__V
    .endif

        .state32

        .global _ti_sysbios_family_arm_HwiCommon_disableA__I
        .global _ti_sysbios_family_arm_HwiCommon_enableA__I
        .global _ti_sysbios_family_arm_HwiCommon_restoreA__I

        .global _ti_sysbios_family_arm_HwiCommon_disableFIQA__I
        .global _ti_sysbios_family_arm_HwiCommon_enableFIQA__I
        .global _ti_sysbios_family_arm_HwiCommon_restoreFIQA__I

        .global _ti_sysbios_family_arm_HwiCommon_disableIRQA__I
        .global _ti_sysbios_family_arm_HwiCommon_enableIRQA__I
        .global _ti_sysbios_family_arm_HwiCommon_restoreIRQA__I

        .global _ti_sysbios_family_arm_HwiCommon_swiHandler__I

        .global _ti_sysbios_family_arm_HwiCommon_isrStack
        .global _ti_sysbios_family_xxx_Hwi_switchToTaskStack
        .global _ti_sysbios_family_xxx_Hwi_switchToIsrStack
        .global _ti_sysbios_family_xxx_Hwi_switchAndRunFunc

_ti_sysbios_family_arm_HwiCommon_Module__state__V .tag ti_sysbios_family_arm_HwiCommon_Module_State


;
;  ======== ti_sysbios_family_xxx_Hwi_switchToIsrStack ========
;  Char *ti_sysbios_family_xxx_Hwi_switchToIsrStack();
;
;  If not already on the isr stack, switch to it.
;
;  Checks the Hwi module object's taskSP. 
;  If 0, then set taskSP to current SP then switch to ISR stack.
;
;  Returns:
;        old taskSP value for use with switchToTaskStack()
;
 
        .sect ".text:_ti_sysbios_family_xxx_Hwi_switchToIsrStack"
        .clink
        .armfunc _ti_sysbios_family_xxx_Hwi_switchToIsrStack
_ti_sysbios_family_xxx_Hwi_switchToIsrStack:
        .asmfunc
        ldr     r1, taskSP
        ldr     r0, [r1]        ; old taskSP
        cmp     r0, #0          ; on ISR stack already?
        bxne    lr              ; return if yes

        str     sp, [r1]        ; save SP into taskSP
        ldr     sp, isrStack    ; switch to isrStack
        ldr     sp, [sp]        ; switch to isrStack
        bx      lr
        .endasmfunc

;
;  ======== ti_sysbios_family_xxx_Hwi_switchToTaskStack ========
;  ti_sysbios_family_xxx_Hwi_switchToTaskStack(Char *oldTaskSP);
;
;  If at bottom of ISR stack, switch to Task stack.
;
;  If oldTaskSP is zero, then this is the thread that switched
;  to the ISR stack first and therefore it is safe to switch
;  back to the task stack address saved in the Hwi module 
;  object's taskSP variable.
;
;

        .armfunc _ti_sysbios_family_xxx_Hwi_switchToTaskStack
_ti_sysbios_family_xxx_Hwi_switchToTaskStack:
        .asmfunc
        cmp     r0, #0          ; lowest order ISR?
        bxne    lr              ; return if not
        ldr     r1, taskSP      ; yes, restore
        ldr     sp, [r1]        ; interrupted task's SP
        str     r0, [r1]        ; signal return to TaskStack
        bx      lr
        .endasmfunc

;
;  ======== ti_sysbios_family_xxx_Hwi_switchAndRunFunc ========
;  ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
;
;  Switch to ISR stack, call the function Func() and then switch
;  back to Task stack.
;
        .armfunc _ti_sysbios_family_xxx_Hwi_switchAndRunFunc
_ti_sysbios_family_xxx_Hwi_switchAndRunFunc:
        .asmfunc
        push    {r4, lr}
        ldr     r1, taskSP
        ldr     r4, [r1]        ; old taskSP
        cmp     r4, #0          ; on ISR stack already?
        blne    callFunc        ; branch if yes

        str     sp, [r1]        ; save SP into taskSP
        ldr     sp, isrStack    ; switch to isrStack
        ldr     sp, [sp]        ; switch to isrStack

callFunc:                       ; should be on ISR stack
        blx     r0              ; Call func

        cmp     r4, #0          ; lowest order ISR?
        blne    exitFunc        ; branch if not
        ldr     r1, taskSP      ; yes, restore
        ldr     sp, [r1]        ; interrupted task's SP
        str     r4, [r1]        ; signal return to TaskStack

exitFunc:                       ; should be on Task stack
        pop     {r4, pc}        ; restore r4, lr into pc.
        .endasmfunc

taskSP:
        .word   _ti_sysbios_family_arm_HwiCommon_Module__state__V.taskSP

isrStack:
        .word   _ti_sysbios_family_arm_HwiCommon_Module__state__V.isrStack


        .sect ".text:_ti_sysbios_family_arm_HwiCommon_disableA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_disableA__I
_ti_sysbios_family_arm_HwiCommon_disableA__I:
        .asmfunc
        mrs     r0, cpsr
        orr     r12, r0, #128
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_enableA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_enableA__I
_ti_sysbios_family_arm_HwiCommon_enableA__I:
        .asmfunc
        mrs     r0, cpsr
        bic     r12, r0, #128
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_restoreA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_restoreA__I
_ti_sysbios_family_arm_HwiCommon_restoreA__I:
        .asmfunc
        msr     cpsr_cf, r0
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_disableFIQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_disableFIQA__I
_ti_sysbios_family_arm_HwiCommon_disableFIQA__I:
        .asmfunc
        mrs     r0, cpsr
        orr     r12, r0, #64
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_enableFIQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_enableFIQA__I
_ti_sysbios_family_arm_HwiCommon_enableFIQA__I:
        .asmfunc
        mrs     r0, cpsr
        bic     r12, r0, #64
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_restoreFIQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_restoreFIQA__I
_ti_sysbios_family_arm_HwiCommon_restoreFIQA__I:
        .asmfunc
        msr     cpsr_cf, r0
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_disableIRQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_disableIRQA__I
_ti_sysbios_family_arm_HwiCommon_disableIRQA__I:
        .asmfunc
        mrs     r0, cpsr
        orr     r12, r0, #128
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_enableIRQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_enableIRQA__I
_ti_sysbios_family_arm_HwiCommon_enableIRQA__I:
        .asmfunc
        mrs     r0, cpsr
        bic     r12, r0, #128
        msr     cpsr_cf, r12
        bx      r14
        .endasmfunc

        .sect ".text:_ti_sysbios_family_arm_HwiCommon_restoreIRQA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_restoreIRQA__I
_ti_sysbios_family_arm_HwiCommon_restoreIRQA__I:
        .asmfunc
        msr     cpsr_cf, r0
        bx      r14
        .endasmfunc

;
;  ======== ti_sysbios_family_arm_HwiCommon_swiHandler ========
;
;  Here on ARM SWI interrupt
;  - switch from user mode to system mode
;  - return from SWI in system mode. (BIOS runs in system mode)
;
        .sect ".text:_ti_sysbios_family_arm_HwiCommon_swiHandler__I"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_swiHandler__I

_ti_sysbios_family_arm_HwiCommon_swiHandler__I
        .asmfunc
        msr     cpsr_c, #0xdf   ; switch back to system mode
        sub     sp, sp, #4      ; make room for return addr
        stmfd   sp!, {lr}       ; save required C registers
        mov     r12, sp         ; snapshot system sp
        add     sp, sp, #8      ; fix system sp for later
        msr     cpsr_c, #0xd3   ; switch back to svc mode
        mov     r13, r12        ; use system sp
        str     lr, [sp, #4]    ; push lr_svc (interrupt return address)

        mrs     r12, spsr
        tst     r12, #0x20      ; test for thumb mode
        ldrneh  r12, [lr, #-2]  ; t bit set so load halfword
        bicne   r12, r12, #0xff00 ; clear upper half of swi instruction

        ldreq   r12, [lr, #-4]  ; t bit clear so load word
        biceq   r12, r12, #0xff000000 ; clear upper 8 bits of swi instruction

        bl      _ti_sysbios_family_arm_HwiCommon_switchToSystemModeA

        ldmfd   sp!, {lr}       
        ldmfd   sp!, {r15}^     ; pop return address and CPSR
        .endasmfunc


        .sect ".text:_ti_sysbios_family_arm_HwiCommon_switchToSystemModeA"
        .clink
        .armfunc _ti_sysbios_family_arm_HwiCommon_switchToSystemModeA

_ti_sysbios_family_arm_HwiCommon_switchToSystemModeA
        .asmfunc
        mrs     r12, spsr       ; r1 = user cpsr
        orr     r12, r12, #0x1f ; massage spsr to switch to system mode on return
        msr     spsr_cf, r12
        bx      lr
        .endasmfunc

        .end

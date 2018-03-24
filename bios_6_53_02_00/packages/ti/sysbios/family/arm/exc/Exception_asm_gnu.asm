@
@  Copyright (c) 2014-2017, Texas Instruments Incorporated
@  All rights reserved.
@
@  Redistribution and use in source and binary forms, with or without
@  modification, are permitted provided that the following conditions
@  are met:
@
@  *  Redistributions of source code must retain the above copyright
@     notice, this list of conditions and the following disclaimer.
@
@  *  Redistributions in binary form must reproduce the above copyright
@     notice, this list of conditions and the following disclaimer in the
@     documentation and/or other materials provided with the distribution.
@
@  *  Neither the name of Texas Instruments Incorporated nor the names of
@     its contributors may be used to endorse or promote products derived
@     from this software without specific prior written permission.
@
@  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
@  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
@  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
@  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
@  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
@  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
@  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
@  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
@  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
@  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
@  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@
@ ======== Exception_asm_gnu.asm ========
@

        .arm

        .global ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I
        .global ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I
        .global ti_sysbios_family_arm_exc_Exception_excHandler__I
        .global ti_sysbios_family_arm_exc_Exception_initCore0__I
        .global ti_sysbios_family_arm_exc_Exception_initCoreX__E

@
@  ======== Exception_excHandlerAsm ========
@  Common Exception handler
@

        .section .text.ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I
        .func ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I

ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I:
        stmfd   sp!, {r0-r12}   @ save r4-r12 while we're at it

        mrc     p15, #0, r12, c5, c0, #0 @ read DFSR into r12
        stmfd   sp!, {r12}      	 @ save DFSR
        mrc     p15, #0, r12, c5, c0, #1 @ read IFSR into r12
        stmfd   sp!, {r12}      	 @ save IFSR
        mrc     p15, #0, r12, c6, c0, #0 @ read DFAR into r12
        stmfd   sp!, {r12}      	 @ save DFAR
        mrc     p15, #0, r12, c6, c0, #2 @ read IFAR into r12
        stmfd   sp!, {r12}      	 @ save IFAR

        mrs     r12, cpsr
        push    {r12}           @ save current CPSR

        mov     r0, sp          @ pass sp to exception handler
        sub     lr, lr, #4      @ back up to offending instruction
        mov     r1, lr          @ pass lr (=pc)

        mrs     r2, cpsr
        orr     r12, r2, #0x1f  @ switch to SYS mode
        msr     cpsr_cf, r12    @

        stmfd   r0!, {lr}       @ save system lr
        mov     r12, sp
        stmfd   r0!, {r12}      @ save system sp
        mrs     r12, cpsr
        stmfd   r0!, {r12}      @ save system cpsr

        msr     cpsr_cf, r2     @ switch back to previous mode

        sub     sp, sp, #16     @ adjust sp to account for lr/sp/cpsr push
                                @ and to align the stack to 8-bytes

        ldr     pc, excHandlerAddr

        .align  2
excHandlerAddr:
        .word   ti_sysbios_family_arm_exc_Exception_excHandler__I
        .endfunc

@
@  ======== Exception_excHandlerDataAsm ========
@  Data Abort Exception handler
@

        .section .text.ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I
        .func ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I

ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I:
        stmfd   sp!, {r0-r12}   @ save r4-r12 while we're at it

        mrc     p15, #0, r12, c5, c0, #0 @ read DFSR into r12
        stmfd   sp!, {r12}      @ save DFSR
        mrc     p15, #0, r12, c5, c0, #1 @ read IFSR into r12
        stmfd   sp!, {r12}      @ save DFSR
        mrc     p15, #0, r12, c6, c0, #0 @ read DFAR into r12
        stmfd   sp!, {r12}      @ save DFAR
        mrc     p15, #0, r12, c6, c0, #2 @ read IFAR into r12
        stmfd   sp!, {r12}      @ save IFAR

        mrs     r12, cpsr
        add     r12, r12, #1    @ replace abort (0x17) with 0x18 
        push    {r12}           @ save current CPSR

        mov     r0, sp          @ pass sp to exception handler
        sub     lr, lr, #8      @ back up to offending instruction
        mov     r1, lr          @ pass lr (=pc)

        mrs     r2, cpsr
        orr     r12, r2, #0x1f  @ switch to SYS mode
        msr     cpsr_cf, r12    @

        stmfd   r0!, {lr}       @ save system lr too
        mov     r12, sp
        stmfd   r0!, {r12}      @ save system sp
        mrs     r12, cpsr
        stmfd   r0!, {r12}      @ save system cpsr

        msr     cpsr_cf, r2     @ switch back to previous mode

        sub     sp, sp, #16     @ adjust sp to account for lr/sp/cpsr push
                                @ and to align the stack to 8-bytes

        ldr     pc, excDataHandlerAddr

        .align  2
excDataHandlerAddr:
        .word   ti_sysbios_family_arm_exc_Exception_excHandler__I
        .endfunc


@
@  ======== Exception_initCore0 ========
@  Low level ARM mode-specific register initialization
@

        .section .text.ti_sysbios_family_arm_exc_Exception_initCore0__I
        .func ti_sysbios_family_arm_exc_Exception_initCore0__I

ti_sysbios_family_arm_exc_Exception_initCore0__I:

@ Initialize Abort sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f @ switch to Abort mode
        orr     r12, r12, #0x17 @ to initialize Abort sp
        msr     cpsr_cf, r12    @

        movw    sp, #:lower16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, #:upper16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        ldr     sp, [sp]        @ base of core0's exc stack
        ldr     r12, excStackSizeCore0
        ldr     r12, [r12]      @ size of exc stack
        add     sp, r12, sp     @ sp = initial exc stack

@ Initialize Undefined sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f @ switch to Undef mode
        orr     r12, r12, #0x1b @ to initialize Undef sp
        msr     cpsr_cf, r12    @

        movw    sp, #:lower16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, #:upper16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        ldr     sp, [sp]        @ base of core0's exc stack
        ldr     r12, excStackSizeCore0
        ldr     r12, [r12]      @ size of exc stack
        add     sp, r12, sp     @ sp = initial exc stack

@ Done
        mrs     r12, cpsr
        orr     r12, r12, #0x1f @ switch back to SYS mode
        msr     cpsr_cf, r12    @

        bx      lr
        .endfunc

        .align  2
excStackSizeCore0:
        .word   ti_sysbios_family_arm_exc_Exception_Module__state__V + 0x10


@
@  ======== Exception_initCoreX ========
@  Low level ARM mode-specific register initialization
@

        .section .text.ti_sysbios_family_arm_exc_Exception_initCoreX__E
        .func ti_sysbios_family_arm_exc_Exception_initCoreX__E

ti_sysbios_family_arm_exc_Exception_initCoreX__E:
        push    {r12, lr}       @ save 2 regs to maintain 8-byte sp alignment

@ Get Core Id
        movw    r0, #:lower16:ti_sysbios_hal_Core_getId__E
        movt    r0, #:upper16:ti_sysbios_hal_Core_getId__E
        blx     r0

@ Initialize Abort sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f @ switch to Abort mode
        orr     r12, r12, #0x17 @ to initialize Abort sp
        msr     cpsr_cf, r12    @

        movw    sp, #:lower16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, #:upper16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        ldr     sp, [sp, r0, lsl #2]    @ base of core0's exc stack
        ldr     r12, excStackSizeCoreX
        ldr     r12, [r12]      @ size of exc stack
        add     sp, r12, sp     @ sp = initial exc stack

@ Initialize Undefined sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f @ switch to Undef mode
        orr     r12, r12, #0x1b @ to initialize Undef sp
        msr     cpsr_cf, r12    @

        movw    sp, #:lower16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        movt    sp, #:upper16:ti_sysbios_family_arm_exc_Exception_Module_State_0_excStack__A
        ldr     sp, [sp, r0, lsl #2]     @ base of core0's exc stack
        ldr     r12, excStackSizeCoreX
        ldr     r12, [r12]      @ size of exc stack
        add     sp, r12, sp     @ sp = initial exc stack

@ Done
        mrs     r12, cpsr
        orr     r12, r12, #0x1f @ switch back to SYS mode
        msr     cpsr_cf, r12
        pop     {r12, lr}

        bx      lr
        .endfunc

        .align  2
excStackSizeCoreX:
        .word   ti_sysbios_family_arm_exc_Exception_Module__state__V + 0x10
        .end

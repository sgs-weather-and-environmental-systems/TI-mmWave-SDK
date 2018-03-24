@
@  Copyright (c) 2015-2016, Texas Instruments Incorporated
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
@ ======== Hwi_asm_gnu.asm ========
@

        .arm

        .global ti_sysbios_family_arm_gic_Hwi_dispatchIRQ__I
        .global ti_sysbios_family_arm_gic_Hwi_dispatchIRQC__I
        .global ti_sysbios_family_arm_gic_Hwi_init__E
        .global ti_sysbios_family_arm_gic_Hwi_initFIQStack__I
        .global ti_sysbios_family_arm_gic_Hwi_vectors
        .global ti_sysbios_family_arm_gic_Hwi_disable__E
        .global ti_sysbios_family_arm_gic_Hwi_enable__E
        .global ti_sysbios_family_arm_gic_Hwi_restore__E
        .global ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC

@
@  ======== Hwi_dispatchIRQ ========
@
@  Here on IRQ interrupt
@
@  task stack while in C code:
@
@       sp + 0x28 =  cpsr_sys
@       sp + 0x24 =  RA
@       sp + 0x20 =  lr_sys
@       sp + 0x1c =  saved r12
@       sp + 0x18 =  saved r5
@       sp + 0x14 =  saved r4
@       sp + 0x10 =  saved r3
@       sp + 0x0c =  saved r2
@       sp + 0x08 =  saved r1
@       sp + 0x04 =  saved r0
@       sp + 0x00 =  tskKey
@

        .section .text.ti_sysbios_family_arm_gic_Hwi_dispatchIRQ__I
        .func ti_sysbios_family_arm_gic_Hwi_dispatchIRQ__I
        .align 2

ti_sysbios_family_arm_gic_Hwi_dispatchIRQ__I:
        sub     lr, lr, #4
        srsdb   sp!, #0x1f          @ push sys CPSR and LR onto SYS stack
        cps     #0x1f               @ switch back to System mode
.if (ti_sysbios_family_arm_gic_Hwi_enableAsidTagging__D == TRUE)
        push    {r0-r7, r12, lr}    @ save required C registers
        ldr     r5, [sp, #40]       @ retrieve IRP
.else
        push    {r0-r5, r12, lr}    @ save required C registers
        ldr     r5, [sp, #32]       @ retrieve IRP
.endif

#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
        vstmdb  r13!, {D0-D7}   @ save vfp scratch regs
        vstmdb  r13!, {D16-D31} @ save vfp scratch regs
        fmrx    r1, FPEXC
        fmrx    r2, FPSCR
        push    {r1-r2}
#endif

.if (ti_sysbios_family_arm_gic_Hwi_enableAsidTagging__D == TRUE)
        movw    r1, #:lower16:ti_sysbios_family_arm_a15_Mmu_Module__state__V
        movt    r1, #:upper16:ti_sysbios_family_arm_a15_Mmu_Module__state__V
        ldr     r1, [r1]            @ get page table address
        mov     r2, #0              @ change ASID to 0 (Full Access)
        mrrc    p15, #0, r6, r7, c2 @ Read 64b TTBR0 into r7(high):r6(low)
        dmb                         @ ensure all memory accesses complete
        mcrr    p15, #0, r1, r2, c2 @ write new table addr and ASID to TTBR0
        isb
.endif

        mov     r4, sp          @ save sp
        bic     sp, sp, #0x7    @ align task stack to 8 bytes
        movw    r1, #:lower16:ti_sysbios_family_arm_gic_Hwi_taskDisable__C
        movt    r1, #:upper16:ti_sysbios_family_arm_gic_Hwi_taskDisable__C
        ldr     r1, [r1]
        cmp     r1, #0
        blxne   r1              @ call Task_disable()
        push    {r0-r1}         @ save tskKey

        @ switch to isr stack and run dispatchIRQC function. After returning
        @ from dispatchIRQC, switch back to task stack if not a nested IRQ
        movw    r1, #:lower16:ti_sysbios_family_arm_gic_Hwi_dispatchIRQC__I
        movt    r1, #:upper16:ti_sysbios_family_arm_gic_Hwi_dispatchIRQC__I
        mov     r0, r5          @ pass IRP as argument to dispatchIRQC()
        movw    r2, #:lower16:ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC
        movt    r2, #:upper16:ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC
        blx     r2
        pop     {r0-r1}         @ restore tskKey

        @ run task scheduler
        movw    r1, #:lower16:ti_sysbios_family_arm_gic_Hwi_taskRestoreHwi__C
        movt    r1, #:upper16:ti_sysbios_family_arm_gic_Hwi_taskRestoreHwi__C
        ldr     r1, [r1]
        cmp     r1, #0
        blxne   r1              @ call Task_restoreHwi()
                                @ returns with interrupts disabled
        mov     sp, r4          @ restore sp

.if (ti_sysbios_family_arm_gic_Hwi_enableAsidTagging__D == TRUE)
        dmb                         @ ensure all memory accesses complete
        mcrr    p15, #0, r6, r7, c2 @ restore TTBR0
        isb
.endif

#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
        pop     {r1-r2}
        fmxr    FPEXC, r1
        fmxr    FPSCR, r2
        vldmia  r13!, {D16-D31} @ restore vfp scratch regs
        vldmia  r13!, {D0-D7}   @ restore vfp scratch regs
#endif

.if (ti_sysbios_BIOS_smpEnabled__D == TRUE)
        @ release the inter-core lock
        movw    r0, #:lower16:ti_sysbios_family_arm_a15_smp_Core_unlock__E
        movt    r0, #:upper16:ti_sysbios_family_arm_a15_smp_Core_unlock__E
        blx     r0
        @ clear exclusive monitor state
        clrex
.endif

.if (ti_sysbios_family_arm_gic_Hwi_enableAsidTagging__D == TRUE)
        pop     {r0-r7, r12, lr}
.else
        pop     {r0-r5, r12, lr}
.endif

        rfeia   sp!
        .endfunc

@
@  ======== Hwi_init ========
@  Low level ARM mode-specific register initialization
@

        .section .text.ti_sysbios_family_arm_gic_Hwi_init__E
        .func ti_sysbios_family_arm_gic_Hwi_init__E

ti_sysbios_family_arm_gic_Hwi_init__E:

@ Set vector table base address
        movw    r0, #:lower16:ti_sysbios_family_arm_gic_Hwi_vectors
        movt    r0, #:upper16:ti_sysbios_family_arm_gic_Hwi_vectors
        mcr     p15, #0, r0, c12, c0, #0

        bx      lr
        .endfunc

@
@  ======== Hwi_initFIQStack ========
@  Low level ARM mode-specific register initialization
@

        .section .text.ti_sysbios_family_arm_gic_Hwi_initFIQStack__I
        .func ti_sysbios_family_arm_gic_Hwi_initFIQStack__I

ti_sysbios_family_arm_gic_Hwi_initFIQStack__I:
@ Initialize FIQ sp
        mrs     r12, cpsr
        bic     r12, r12, #0x1f @ switch to FIQ mode
        orr     r12, r12, #0x11 @ to initialize FIQ sp
        msr     cpsr, r12

        mov     sp, r0          @ sp = initial fiq stack

@ Done
        mrs     r12, cpsr
        orr     r12, r12, #0x1f @ switch back to SYS mode
        msr     cpsr, r12

        bx      lr
        .endfunc

        .end

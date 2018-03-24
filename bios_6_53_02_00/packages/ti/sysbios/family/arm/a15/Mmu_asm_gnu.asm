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
@
@ ======== Mmu_asm_gnu.asm ========
@

#include <ti/sysbios/family/AsmMacros.h>

        .equ Mmu_pageSize,  4096
        .equ Mmu_pageShift, 12

        .global ti_sysbios_family_arm_a15_Mmu_init__I
        .global ti_sysbios_family_arm_a15_Mmu_disableAsm__I
        .global ti_sysbios_family_arm_a15_Mmu_enableAsm__I
        .global ti_sysbios_family_arm_a15_Mmu_getAsid__E
        .global ti_sysbios_family_arm_a15_Mmu_isEnabled__E
        .global ti_sysbios_family_arm_a15_Mmu_instructionSync__I
        .global ti_sysbios_family_arm_a15_Mmu_switchContext__E
        .global ti_sysbios_family_arm_a15_Mmu_tlbInv__E
        .global ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E
        .global ti_sysbios_family_arm_a15_Mmu_writeMAIRAsm__I

        .arm
        .align  4

@
@ ======== Mmu_init ========
@ Initialize mmu registers
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_init__I
        .func ti_sysbios_family_arm_a15_Mmu_init__I
ti_sysbios_family_arm_a15_Mmu_init__I:
        mov  r0, #1                     @ TTBR0 used and desc uses Short format
        lsl  r0, r0, #31                @ Set TTBCR.EAE bit
        mcr  p15, #0, r0, c2, c0, #2    @ write r0 to TTBCR
        isb                             @ flush instruction pipeline
                                        @ isb makes sure cp15 changes
                                        @ are visible to all subsequent
                                        @ instructions

        bx   r14
        .endfunc

@
@ ======== Mmu_disableAsm ========
@ Disable MMU.
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_disableAsm__I
        .func ti_sysbios_family_arm_a15_Mmu_disableAsm__I

ti_sysbios_family_arm_a15_Mmu_disableAsm__I:
        mrc  p15, #0, r0, c1, c0, #0    @ read register c1
        mov  r1, #0x1                   @ move #1 into r1
        bic  r0, r0, r1                 @ clear bit 1 in r0
        mcr  p15, #0, r0, c1, c0, #0    @ mmu disabled (bit 1 = 0)

        bx   r14
        .endfunc
        
@
@ ======== Mmu_enableAsm ========
@ Enable MMU.
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_enableAsm__I
        .func ti_sysbios_family_arm_a15_Mmu_enableAsm__I

ti_sysbios_family_arm_a15_Mmu_enableAsm__I:
        mov  r1, #0
        ldr  r0, tableBuf               @ get page table address
        mcrr p15, #0, r0, r1, c2        @ write TTBR0 with Module->tableBuf.

        mrc  p15, #0, r0, c1, c0, #0    @ read register c1
        mov  r1, #0x1                   @ move #1 into r1
        orr  r0, r0, r1                 @ OR r1 with r0 into r0
        mcr  p15, #0, r0, c1, c0, #0    @ mmu enabled (bit 1 = 1)

        bx   r14
        .endfunc

tableBuf:
        .word    ti_sysbios_family_arm_a15_Mmu_Module_State_0_firstLevelTableBuf__A

@
@  ======== Mmu_getAsid ========
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_getAsid__E
        .func ti_sysbios_family_arm_a15_Mmu_getAsid__E

ti_sysbios_family_arm_a15_Mmu_getAsid__E:
        mrrc p15, #0, r0, r1, c2        @ Read 64b TTBR0 into r1(high):r0(low)
        ubfx r0, r1, #16, #8            @ Extract ASID

        bx   r14
        .endfunc

@
@ ======== Mmu_isEnabled ========
@ Determines if MMU is enabled. Returns TRUE if enabled otherwise FALSE.
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_isEnabled__E
        .func ti_sysbios_family_arm_a15_Mmu_isEnabled__E

ti_sysbios_family_arm_a15_Mmu_isEnabled__E:
        mov    r0, #0
        mrc    p15, #0, r1, c1, c0, #0  @ read register c1 to r1
        tst    r1, #0x1                 @ test bit 1
        movne  r0, #1                   @ if not 0, MMU is enabled

        bx     r14
        .endfunc

@
@ ======== Mmu_instructionSync ========
@ Execute isb barrier instruction
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_instructionSync__I
        .func ti_sysbios_family_arm_a15_Mmu_instructionSync__I

ti_sysbios_family_arm_a15_Mmu_instructionSync__I:
        dmb                             @ Required to meet Errata 798181 reqs
        isb                             @ flush instruction pipeline

        bx     r14
        .endfunc

@
@  ======== Mmu_switchContext ========
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_switchContext__E
        .func ti_sysbios_family_arm_a15_Mmu_switchContext__E

ti_sysbios_family_arm_a15_Mmu_switchContext__E:
        and    r0, r0, #0xFF            @ clear MSB 24 bits
        lsl    r0, r0, #16              @ shift ASID LSB to bit48
        bic    r1, r1, #0x1F            @ clear LSB 5 bits
        dmb                             @ ensure all memory accesses complete
        mcrr   p15, #0, r1, r0, c2      @ write new table addr and ASID to TTBR0
        isb

        bx     r14
        .endfunc

@
@ ======== Mmu_tlbInvAll ========
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E
        .func ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E

ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E:
        dsb                             @ wait for invalidation to complete
        SMP_ASM(mcr  p15, #0, r0, c8, c3, #0)
        UP_ASM(mcr  p15, #0, r0, c8, c7, #0)
                                        @ invalidate unified TLB
        dsb                             @ wait for invalidation to complete
        isb                             @ flush instruction pipeline

        bx     r14
        .endfunc

@
@ ======== Mmu_tlbInv ========
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_tlbInv__E
        .func ti_sysbios_family_arm_a15_Mmu_tlbInv__E

ti_sysbios_family_arm_a15_Mmu_tlbInv__E:
        dsb                             @ wait for invalidation to complete
        add     r1, r0, r1              @ calculate last address
        lsr     r0, r0, #Mmu_pageShift  @ align pagePtr
        lsl     r0, r0, #Mmu_pageShift
tlbInv:
        SMP_ASM(mcr  p15, #0, r0, c8, c3, #3)
        UP_ASM(mcr  p15, #0, r0, c8, c7, #3)
                                        @ invalidate unified TLB
        add     r0, r0, #Mmu_pageSize   @ increment address by page size
        cmp     r0, r1                  @ compare to last address
        blo     tlbInv                  @ loop if count > 0
        dsb                             @ wait for invalidation to complete
        isb                             @ flush instruction pipeline

        bx      r14
        .endfunc

@
@ ======== Mmu_writeMAIRAsm ========
@ Write attr to appropriate byte offset within the selected MAIR register.
@
        .section .text.ti_sysbios_family_arm_a15_Mmu_writeMAIRAsm__I
        .func ti_sysbios_family_arm_a15_Mmu_writeMAIRAsm__I

ti_sysbios_family_arm_a15_Mmu_writeMAIRAsm__I:
        and  r2, r0, #0x3               @ attrIndx[1:0] gives byte offset
        lsl  r2, r2, #0x3               @ multiply by 8 to get bit offset
        mov  r3, #0xFF
        and  r1, r1, r3                 @ extract lsb byte from r1
        lsl  r1, r1, r2                 @ r1 is the encoded attribute
        lsl  r3, r3, r2                 @ generate bit mask
        tst  r0, #0x4                   @ attrIndx[2] selects MAIR 0 or 1
        bne  mair1

mair0:
        mrc  p15, #0, r0, c10, c2, #0   @ read MAIR0 into r0
        bic  r0, r0, r3
        orr  r0, r0, r1                 @ OR encoded attribute with MAIR0
        mcr  p15, #0, r0, c10, c2, #0   @ write r0 to  MAIR0
        b    exitSetMAIR

mair1:
        mrc  p15, #0, r0, c10, c2, #1   @ read MAIR1 into r0
        bic  r0, r0, r3
        orr  r0, r0, r1                 @ OR encoded attribute with MAIR1
        mcr  p15, #0, r0, c10, c2, #1   @ write r0 to  MAIR1

exitSetMAIR:
        isb                             @ flush instruction pipeline
        bx   r14
        .endfunc

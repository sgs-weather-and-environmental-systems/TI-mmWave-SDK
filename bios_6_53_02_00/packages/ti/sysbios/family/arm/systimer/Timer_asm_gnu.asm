@
@  Copyright (c) 2013-2016, Texas Instruments Incorporated
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
@ ======== Timer_asm.asm ========
@
@

        .global ti_sysbios_family_arm_systimer_Timer_readPhyCnt__I
        .global ti_sysbios_family_arm_systimer_Timer_readPhyCtrl__I
        .global ti_sysbios_family_arm_systimer_Timer_readVirtCnt__I
        .global ti_sysbios_family_arm_systimer_Timer_readVirtCtrl__I
        .global ti_sysbios_family_arm_systimer_Timer_writePhyCtrl__I
        .global ti_sysbios_family_arm_systimer_Timer_writePhyCmpVal__I
        .global ti_sysbios_family_arm_systimer_Timer_writeVirtCtrl__I
        .global ti_sysbios_family_arm_systimer_Timer_writeVirtCmpVal__I

        .arm
        .align  2

@
@ ======== Timer_readPhyCnt ========
@ Return PL1 Physical Timer Count
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_readPhyCnt__I
        .func ti_sysbios_family_arm_systimer_Timer_readPhyCnt__I

ti_sysbios_family_arm_systimer_Timer_readPhyCnt__I:
        mrrc    p15, #0, r1, r2, c14        @ Read CNTPCT into r1 and r2
        str     r1, [r0]                    @ Store low word
        str     r2, [r0, #4]                @ Store high word
        mov     pc, lr
        .endfunc

@
@ ======== Timer_readPhyCtrl ========
@ Return PL1 Physical Timer Control register contents
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_readPhyCtrl__I
        .func ti_sysbios_family_arm_systimer_Timer_readPhyCtrl__I

ti_sysbios_family_arm_systimer_Timer_readPhyCtrl__I:
        mrc     p15, #0, r0, c14, c2, #1    @ Read CNTP_CTL into r0
        mov     pc, lr
        .endfunc

@
@ ======== Timer_readVirtCnt ========
@ Return Virtual Timer Count
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_readVirtCnt__I
        .func ti_sysbios_family_arm_systimer_Timer_readVirtCnt__I

ti_sysbios_family_arm_systimer_Timer_readVirtCnt__I:
        mrrc    p15, #1, r1, r2, c14        @ Read CNTVCT into r1 and r2
        str     r1, [r0]                    @ Store low word
        str     r2, [r0, #4]                @ Store high word
        mov     pc, lr
        .endfunc

@
@ ======== Timer_readVirtCtrl ========
@ Return Virtual Timer Control register contents
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_readVirtCtrl__I
        .func ti_sysbios_family_arm_systimer_Timer_readVirtCtrl__I

ti_sysbios_family_arm_systimer_Timer_readVirtCtrl__I:
        mrc     p15, #0, r0, c14, c3, #1    @ Read CNTV_CTL into r0
        mov     pc, lr
        .endfunc

@
@ ======== Timer_writePhyCtrl ========
@ Write argument to PL1 Physical Timer Control register
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_writePhyCtrl__I
        .func ti_sysbios_family_arm_systimer_Timer_writePhyCtrl__I

ti_sysbios_family_arm_systimer_Timer_writePhyCtrl__I:
        mcr     p15, #0, r0, c14, c2, #1     @ Write r0 to CNTP_CTL
        isb
        mov     pc, lr
        .endfunc

@
@ ======== Timer_writePhyCmpVal ========
@ Write argument to PL1 Physical Timer CompareValue register
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_writePhyCmpVal__I
        .func ti_sysbios_family_arm_systimer_Timer_writePhyCmpVal__I

ti_sysbios_family_arm_systimer_Timer_writePhyCmpVal__I:
        ldr     r1, [r0]                     @ load low word into r1
        ldr     r2, [r0, #4]                 @ load high word into r2
        mcrr    p15, #2, r1, r2, c14         @ Write r1 and r2 to CNTP_CVAL
        isb
        mov     pc, lr
        .endfunc

@
@ ======== Timer_writeVirtCtrl ========
@ Write argument to Virtual Timer Control register
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_writeVirtCtrl__I
        .func ti_sysbios_family_arm_systimer_Timer_writeVirtCtrl__I

ti_sysbios_family_arm_systimer_Timer_writeVirtCtrl__I:
        mcr     p15, #0, r0, c14, c3, #1     @ Write r0 to CNTV_CTL
        isb
        mov     pc, lr
        .endfunc

@
@ ======== Timer_writeVirtCmpVal ========
@ Write argument to Virtual Timer CompareValue register
@
        .section .text.ti_sysbios_family_arm_systimer_Timer_writeVirtCmpVal__I
        .func ti_sysbios_family_arm_systimer_Timer_writeVirtCmpVal__I

ti_sysbios_family_arm_systimer_Timer_writeVirtCmpVal__I:
        ldr     r1, [r0]                     @ load low word into r1
        ldr     r2, [r0, #4]                 @ load high word into r2
        mcrr    p15, #3, r1, r2, c14         @ Write r1 and r2 to CNTV_CVAL
        isb
        mov     pc, lr
        .endfunc

        .end

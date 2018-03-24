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
@ ======== Cache_asm_gnu.asm ========
@

#include <ti/sysbios/family/AsmMacros.h>

        .equ Cache_sizeL1dCacheLine, 64
        .equ Cache_sizeL1pCacheLine, 64
        .equ Cache_sizeL2CacheLine, 64

        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_disableL1D__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_disableL1P__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_enableL1D__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_enableL1P__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_disableBP__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_enableBP__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_invL1d__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_invL1p__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_invL1dAll__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wb__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wbInv__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wbAll__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_wait__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_preFetch__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_getCacheLevelInfo__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_getL2AuxControlReg__I)
        SMP_ASM(.global ti_sysbios_family_arm_a15_smp_Cache_setL2AuxControlReg__I)

        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_disableL1D__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_disableL1P__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_enableL1D__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_enableL1P__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_disableBP__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_enableBP__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_invL1d__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_invL1p__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_invL1dAll__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_invL1pAll__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_invBPAll__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wb__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wbInv__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wbAll__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wbInvAll__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_wait__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_preFetch__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_getEnabled__E)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_getCacheLevelInfo__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_getL2AuxControlReg__I)
        UP_ASM(.global ti_sysbios_family_arm_a15_Cache_setL2AuxControlReg__I)

        .arm
        .align  4

@
@ ======== Cache_disableL1D ========
@ To disable the L1 data cache, first set the C bit to 0 in
@ SCTLR register, then writeback invalidate the whole L1 data
@ cache.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_disableL1D__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_disableL1D__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_disableL1D__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_disableL1D__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_disableL1D__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_disableL1D__I:)
        stmfd   sp!, {r0-r7, r9-r11, lr}

        mrc     p15, #0, r0, c1, c0, #0 @ read register CR
        bic     r0, r0, #0x0004         @ clear C bit in CR
        mcr     p15, #0, r0, c1, c0, #0 @ DCache disabled
        SMP_ASM(movw r0, #:lower16:ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E)
        SMP_ASM(movt r0, #:upper16:ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E)
        UP_ASM(movw r0, #:lower16:ti_sysbios_family_arm_a15_Cache_wbInvAll__E)
        UP_ASM(movt r0, #:upper16:ti_sysbios_family_arm_a15_Cache_wbInvAll__E)
        blx     r0                      @ push out all of L1D
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_disableL1P ========
@ To disable the L1 instruction cache, first set the I bit to 0 in SCTLR
@ register, then invalidate the whole instruction cache.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_disableL1P__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_disableL1P__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_disableL1P__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_disableL1P__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_disableL1P__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_disableL1P__I:)
        mrc     p15, #0, r0, c1, c0, #0 @ read register CR
        bic     r0, r0, #0x1000         @ clear I bit in CR
        mcr     p15, #0, r0, c1, c0, #0 @ ICache disabled
        SMP_ASM(mcr p15, #0, r0, c7, c1, #0)
        UP_ASM(mcr p15, #0, r0, c7, c5, #0)
                                        @ invalidate all ICache
        dsb                             @ drain write buffer
        bx      lr
        .endfunc


@
@ ======== Cache_enableL1D ========
@ To enable the L1 data cache set the C bit to 1 in the SCTLR register.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_enableL1D__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_enableL1D__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_enableL1D__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_enableL1D__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_enableL1D__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_enableL1D__I:)
        mrc     p15, #0, r0, c1, c0, #0 @ read register CR
        orr     r0, r0, #0x0004         @ set C bit (bit 2) to 1
        mcr     p15, #0, r0, c1, c0, #0 @ L1D Cache enabled
        dsb                             @ drain write buffer
        bx      lr
        .endfunc


@
@ ======== Cache_enableL1P ========
@ To enable the L1 instruction cache set the I bit to 1 in the c1 register.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_enableL1P__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_enableL1P__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_enableL1P__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_enableL1P__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_enableL1P__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_enableL1P__I:)
        SMP_ASM(mcr p15, #0, r0, c7, c1, #0)
        UP_ASM(mcr p15, #0, r0, c7, c5, #0)
                                        @ Invalidate entire instruction cache
        dsb                             @ drain write buffer
        mrc     p15, #0, r0, c1, c0, #0 @ read register CR
        orr     r0, r0, #0x1000         @ set I bit (bit 12) to 1
        mcr     p15, #0, r0, c1, c0, #0 @ ICache enabled
        bx      lr
        .endfunc


@
@ ======== Cache_invL1d ========
@ Invalidates a range of MVA (modified virtual addresses) in the L1 data cache
@     Cache_invL1d(Ptr blockPtr, SizeT byteCnt, Bool wait)
@
@       r0 - contains blockPtr
@       r1 - contains byteCnt
@       r2 - contains wait
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_invL1d__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_invL1d__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_invL1d__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_invL1d__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_invL1d__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_invL1d__I:)
        add     r1, r0, r1              @ calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        @ align blockPtr to cache line
1:
        mcr     p15, #0, r0, c7, c6, #1 @ invalidate single entry in DCache
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        @ increment address by cache line size
        cmp     r0, r1                  @ compare to last address
        blo     1b                      @ loop if > 0
        tst     r2, #0x1                @ check if wait param is TRUE
        beq     2f
        dsb                             @ drain write buffer
2:
        bx      lr                      @ return
        .endfunc


@
@ ======== Cache_invL1p ========
@ Invalidates a range of modified virtual addresses in L1 instruction cache
@     Cache_invL1p(Ptr blockPtr, SizeT byteCnt, Bool wait)
@
@       r0 - contains blockPtr
@       r1 - contains byteCnt
@       r2 - contains wait
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_invL1p__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_invL1p__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_invL1p__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_invL1p__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_invL1p__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_invL1p__I:)
        add     r1, r0, r1               @ calculate last address
        bic     r0, r0, #Cache_sizeL1pCacheLine - 1
                                         @ align blockPtr to cache line
1:
        mcr     p15, #0, r0, c7, c5, #1  @ invalidate single entry in ICache
        add     r0, r0, #Cache_sizeL1pCacheLine
                                         @ increment address by cache line size
        cmp     r0, r1                   @ compare to last address
        blo     1b                       @ loop if > 0
        tst     r2, #0x1                 @ check if wait param is TRUE
        beq     2f
        dsb                              @ drain write buffer
2:
        bx      lr
        .endfunc


@
@ ======== Cache_invL1dAll ========
@ Invalidates all in data cache. Note: This is risky since data cache may
@ contain some stack variable or valid data that should not be invalidated.
@ Only use this function if you know for sure the data cache contains unwanted
@ information.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_invL1dAll__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_invL1dAll__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_invL1dAll__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_invL1dAll__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_invL1dAll__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_invL1dAll__E:)
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 @ read clidr
        ands    r3, r0, #0x7000000      @ extract loc from clidr
        mov     r3, r3, lsr #23         @ left align loc bit field
        beq     5f                      @ if loc is 0, then no need to clean
        mov     r10, #0                 @ start clean at cache level 0
1:
        add     r2, r10, r10, lsr #1    @ work out 3x current cache level
        mov     r1, r0, lsr r2          @ extract cache type bits from clidr
        and     r1, r1, #7              @ mask of the bits for current cache only
        cmp     r1, #2                  @ see what cache we have at this level
        blt     4f                      @ skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        mrc     p15, #1, r1, c0, c0, #0 @ read the new csidr
        and     r2, r1, #7              @ extract the length of the cache lines
        add     r2, r2, #4              @ add 4 (line length offset)
        movw    r4, #0x3ff
        ands    r4, r4, r1, lsr #3      @ find maximum number on the way size
        clz     r5, r4                  @ find bit position of way size increment
        movw    r7, #0x7fff
        ands    r7, r7, r1, lsr #13     @ extract max number of the index size
2:
        mov     r9, r4                  @ create working copy of max way size
3:
        orr     r11, r10, r9, lsl r5    @ factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    @ factor index number into r11
        mcr     p15, #0, r11, c7, c6, #2 @ invalidate by set/way
        subs    r9, r9, #1              @ decrement the way
        bge     3b
        subs    r7, r7, #1              @ decrement the index
        bge     2b
4:
        add     r10, r10, #2            @ increment cache number
        cmp     r3, r10
        bgt     1b
5:
        mov     r10, #0                 @ swith back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in csselr
        isb                             @ flush prefetch buffer
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_invL1pAll ========
@ Invalidates all entries in the instruction cache
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_invL1pAll__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_invL1pAll__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_invL1pAll__E:)
        SMP_ASM(mcr p15, #0, r0, c7, c1, #0)
        UP_ASM(mcr p15, #0, r0, c7, c5, #0)
                                        @ invalidate all entries in ICache
        dsb                             @ drain write buffer
        bx      lr                      @ return
        .endfunc


@
@ ======== Cache_invBPAll ========
@ Invalidates all branch predictors
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_invBPAll__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_invBPAll__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_invBPAll__E:)
        SMP_ASM(mcr p15, #0, r0, c7, c1, #6)
        UP_ASM(mcr p15, #0, r0, c7, c5, #0)
                                        @ invalidate all branch predictors
        dsb                             @ drain write buffer
        bx      lr                      @ return
        .endfunc


@
@ ======== Cache_wb ========
@ Writes back the range of MVA in data cache. First, wait on any previous cache
@ operation.
@
@     Cache_wb(Ptr blockPtr, SizeT byteCnt, Type type, Bool wait)
@
@       r0 - contains blockPtr
@       r1 - contains byteCnt
@       r2 - contains bit mask of cache type (unused)
@       r3 - contains wait
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wb__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wb__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wb__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wb__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wb__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wb__E:)
        add     r1, r0, r1              @ calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        @ align address to cache line
1:
        mcr     p15, #0, r0, c7, c10, #1 @ write back a cache line
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        @ increment address by cache line size
        cmp     r0, r1                  @ compare to last address
        blo     1b                      @ loop if count > 0
        tst     r3, #0x1                @ check if wait param is TRUE
        beq     2f
        dsb                             @ drain write buffer
2:
        bx      lr
        .endfunc


@
@ ======== Cache_wbInv ========
@ Writes back and invalidates the range of MVA in data cache.
@ First, wait on any previous cache operation.
@
@     Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Type type, Bool wait)
@
@       r0 - contains blockPtr
@       r1 - contains byteCnt
@       r2 - contains bitmask of cache type (unused)
@       r3 - contains wait
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wbInv__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wbInv__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wbInv__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wbInv__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wbInv__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wbInv__E:)
        add     r1, r0, r1              @ calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        @ align blockPtr to cache line
1:
        mcr     p15, #0, r0, c7, c14, #1@ writeback inv a cache line
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        @ increment address by cache line size
        cmp     r0, r1                  @ compare to last address
        blo     1b                      @ loop if count > 0
        tst     r3, #0x1                @ check if wait param is TRUE
        beq     2f
        dsb                             @ drain write buffer
2:
        bx      lr
        .endfunc


@
@ ======== Cache_wait ========
@ Wait for the 'Drain write buffer' to complete
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wait__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wait__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wait__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wait__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wait__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wait__E:)
        mcr     p15, #0, r0, c7, c10, #4 @ drain write buffer
        bx      lr                       @ return
        .endfunc


@
@ ======== Cache_wbAll ========
@ Write back all of L1 data cache
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wbAll__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wbAll__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wbAll__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wbAll__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wbAll__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wbAll__E:)
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 @ read clidr
        ands    r3, r0, #0x7000000      @ extract loc from clidr
        mov     r3, r3, lsr #23         @ left align loc bit field
        beq     5f                      @ if loc is 0, then no need to clean

        mov     r10, #0                 @ start clean at cache level 0

1:
        add     r2, r10, r10, lsr #1    @ work out 3x current cache level
        mov     r1, r0, lsr r2          @ extract cache type bits from clidr
        and     r1, r1, #7              @ mask of the bits for current cache only
        cmp     r1, #2                  @ see what cache we have at this level
        blt     4f                      @ skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4@ flush prefetch buffer,
                                        @ with armv7 this is 'isb',
                                        @ but we compile with armv5
        mrc     p15, #1, r1, c0, c0, #0 @ read the new csidr
        and     r2, r1, #7              @ extract the length of the cache lines
        add     r2, r2, #4              @ add 4 (line length offset)
        movw    r4, #0x3ff
        ands    r4, r4, r1, lsr #3      @ find maximum number on the way size
        clz     r5, r4                  @ find bit position of way size increment
        movw    r7, #0x7fff
        ands    r7, r7, r1, lsr #13     @ extract max number of the index size
2:
        mov     r9, r4                  @ create working copy of max way size
3:
        orr     r11, r10, r9, lsl r5    @ factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    @ factor index number into r11
        mcr     p15, #0, r11, c7, c10, #2 @ clean line by set/way
        subs    r9, r9, #1              @ decrement the way
        bge     3b
        subs    r7, r7, #1              @ decrement the index
        bge     2b
4:
        add     r10, r10, #2            @ increment cache number
        cmp     r3, r10
        bgt     1b

5:
        mov     r10, #0                 @ switch back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_wbAllLoUIS ========
@ Write back all of L1 data cache to PoU
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E:)
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 @ read clidr
        ands    r3, r0, #0xE00000       @ extract LoUIS from clidr
        mov     r3, r3, lsr #20         @ left align LoUIS bit field
        beq     5f                      @ if LoUIS is 0, then no need to clean

        mov     r10, #0                 @ start clean at cache level 0

1:
        add     r2, r10, r10, lsr #1    @ work out 3x current cache level
        mov     r1, r0, lsr r2          @ extract cache type bits from clidr
        and     r1, r1, #7              @ mask of the bits for current cache only
        cmp     r1, #2                  @ see what cache we have at this level
        blt     4f                      @ skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4@ flush prefetch buffer,
                                        @ with armv7 this is 'isb',
                                        @ but we compile with armv5
        mrc     p15, #1, r1, c0, c0, #0 @ read the new csidr
        and     r2, r1, #7              @ extract the length of the cache lines
        add     r2, r2, #4              @ add 4 (line length offset)
        movw    r4, #0x3ff
        ands    r4, r4, r1, lsr #3      @ find maximum number on the way size
        clz     r5, r4                  @ find bit position of way size increment
        movw    r7, #0x7fff
        ands    r7, r7, r1, lsr #13     @ extract max number of the index size
2:
        mov     r9, r4                  @ create working copy of max way size
3:
        orr     r11, r10, r9, lsl r5    @ factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    @ factor index number into r11
        mcr     p15, #0, r11, c7, c10, #2 @ clean line by set/way
        subs    r9, r9, #1              @ decrement the way
        bge     3b
        subs    r7, r7, #1              @ decrement the index
        bge     2b
4:
        add     r10, r10, #2            @ increment cache number
        cmp     r3, r10
        bgt     1b

5:
        mov     r10, #0                 @ switch back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer,
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_wbInvAll ========
@ Write back and invalidate entire data cache
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wbInvAll__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wbInvAll__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wbInvAll__E:)
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 @ read clidr
        ands    r3, r0, #0x7000000      @ extract loc from clidr
        mov     r3, r3, lsr #23         @ left align loc bit field
        beq     5f                      @ if loc is 0, then no need to clean

        mov     r10, #0                 @ start clean at cache level 0

1:
        add     r2, r10, r10, lsr #1    @ work out 3x current cache level
        mov     r1, r0, lsr r2          @ extract cache type bits from clidr
        and     r1, r1, #7              @ mask of the bits for current cache only
        cmp     r1, #2                  @ see what cache we have at this level
        blt     4f                      @ skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        mrc     p15, #1, r1, c0, c0, #0 @ read the new csidr
        and     r2, r1, #7              @ extract the length of the cache lines
        add     r2, r2, #4              @ add 4 (line length offset)
        movw    r4, #0x3ff
        ands    r4, r4, r1, lsr #3      @ find maximum number on the way size
        clz     r5, r4                  @ find bit position of way size increment
        movw    r7, #0x7fff
        ands    r7, r7, r1, lsr #13     @ extract max number of the index size
2:
        mov     r9, r4                  @ create working copy of max way size
3:
        orr     r11, r10, r9, lsl r5    @ factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    @ factor index number into r11
        mcr     p15, #0, r11, c7, c14, #2 @ clean & invalidate by set/way
        subs    r9, r9, #1              @ decrement the way
        bge     3b
        subs    r7, r7, #1              @ decrement the index
        bge     2b
4:
        add     r10, r10, #2            @ increment cache number
        cmp     r3, r10
        bgt     1b
5:
        mov     r10, #0                 @ swith back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_wbInvAllLoUIS ========
@ Write back and invalidate entire data cache to PoU
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E:)
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 @ read clidr
        ands    r3, r0, #0xE00000       @ extract LoUIS from clidr
        mov     r3, r3, lsr #20         @ left align LoUIS bit field
        beq     5f                      @ if LoUIS is 0, then no need to clean

        mov     r10, #0                 @ start clean at cache level 0

wbInvAllLoUISLoop1:
        add     r2, r10, r10, lsr #1    @ work out 3x current cache level
        mov     r1, r0, lsr r2          @ extract cache type bits from clidr
        and     r1, r1, #7              @ mask of the bits for current cache only
        cmp     r1, #2                  @ see what cache we have at this level
        blt     4f                      @ skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        mrc     p15, #1, r1, c0, c0, #0 @ read the new csidr
        and     r2, r1, #7              @ extract the length of the cache lines
        add     r2, r2, #4              @ add 4 (line length offset)
        movw    r4, #0x3ff
        ands    r4, r4, r1, lsr #3      @ find maximum number on the way size
        clz     r5, r4                  @ find bit position of way size increment
        movw    r7, #0x7fff
        ands    r7, r7, r1, lsr #13     @ extract max number of the index size
2:
        mov     r9, r4                  @ create working copy of max way size
3:
        orr     r11, r10, r9, lsl r5    @ factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    @ factor index number into r11
        mcr     p15, #0, r11, c7, c14, #2 @ clean & invalidate by set/way
        subs    r9, r9, #1              @ decrement the way
        bge     3b
        subs    r7, r7, #1              @ decrement the index
        bge     2b
4:
        add     r10, r10, #2            @ increment cache number
        cmp     r3, r10
        bgt     1b
5:
        mov     r10, #0                 @ swith back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0@ select current cache level in cssr
        isb                             @ flush prefetch buffer
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        bx      lr
        .endfunc


@
@ ======== Cache_preFetch ========
@ r0 = block start address
@ r1 = length in bytes
@
@ Flush then pull memory block into L2 cache.
@
@ NO data accesses between context save/restore other than
@ loading the memory block.
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_preFetch__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_preFetch__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_preFetch__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_preFetch__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_preFetch__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_preFetch__I:)
        stmfd   sp!, {r4-r8}

        @ No data reads beyond this point other than
        @ loading memory block into L2 cache

        add     r1, r0, r1                  @ calculate last address
        bic     r0, r0, #Cache_sizeL2CacheLine - 1

        @ now, pull block into this cache way
1:
        mcr     p15, #0, r0, c7, c14, #1    @ writeback inv this cache line to
                                            @ remove it from any other cache
                                            @ way
        ldr     r6, [r0]                    @ Load first word of cache line
                                            @ into this L2 cache way
                                            @ (unified, so data load works)
        add     r0, r0, #Cache_sizeL2CacheLine
                                            @ increment address by cache
                                            @ line size
        cmp     r0, r1                      @ compare to last address
        blo     1b

        ldmfd   sp!, {r4-r8}
        bx      lr
        .endfunc


@
@ ======== Cache_getEnabled ========
@ Determine the mask of enabled caches
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_getEnabled__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_getEnabled__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_getEnabled__E:)
        mov     r0, #0
        mrc     p15, #0, r1, c1, c0, #0 @ fetch Control Register into r1

        @ Check if program cache enabled
        tst     r1, #0x1000             @ test I bit (bit 12) for program cache
        addne   r0, r0, #5              @ if I bit is true, program caches are
                                        @ enabled

        @ Check if data cache enabled
        tst     r1, #0x0004             @ test C bit (bit 2) for data cache
        addne   r0, r0, #0xa            @ if C bit is true, L1D and unified L2
                                        @ data cache is enabled

        @ Check if all cache enabled
        cmp     r0, #0xf
        movweq  r0, #0x7fff

        bx      lr
        .endfunc

@
@ ======== Cache_getLevelInfo ========
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_getCacheLevelInfo__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_getCacheLevelInfo__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_getCacheLevelInfo__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_getCacheLevelInfo__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_getCacheLevelInfo__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_getCacheLevelInfo__I:)
        mcr     p15, #2, r0, c0, c0, #0 @ write to Cache Size Selection Reg
        mrc     p15, #1, r0, c0, c0, #0 @ read Cache Size Id Reg
        bx      lr
        .endfunc

@
@ ======== Cache_disableBP ========
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_disableBP__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_disableBP__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_disableBP__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_disableBP__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_disableBP__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_disableBP__E:)
        mrc     p15, #0, r0, c1, c0, #0 @ read register SCTLR
        bic     r0, r0, #0x0800         @ clear Z bit in SCTLR to disable BP
        mcr     p15, #0, r0, c1, c0, #0 @ BP disabled
        SMP_ASM(mcr p15, #0, r0, c7, c1, #6)
        UP_ASM(mcr p15, #0, r0, c7, c5, #6)
                                        @ Invalidate all branch predictors
        bx      lr
        .endfunc

@
@ ======== Cache_enableBP ========
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_enableBP__E)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_enableBP__E)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_enableBP__E)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_enableBP__E)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_enableBP__E:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_enableBP__E:)
        mrc     p15, #0, r0, c1, c0, #0 @ read register SCTLR
        orr     r0, r0, #0x0800         @ set Z bit in SCTLR to enable BP
        mcr     p15, #0, r0, c1, c0, #0 @ BP enabled
        bx      lr
        .endfunc

@
@ ======== Cache_getL2AuxControlReg ========
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_getL2AuxControlReg__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_getL2AuxControlReg__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_getL2AuxControlReg__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_getL2AuxControlReg__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_getL2AuxControlReg__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_getL2AuxControlReg__I:)
        mrc     p15, #1, r0, c15, c0, #0 @ read L2ACTLR register

        bx      lr
        .endfunc

@
@ ======== Cache_setL2AuxControlReg ========
@ This function should only be called on OMAP5 and J6 devices
@
        SMP_ASM(.section .text.ti_sysbios_family_arm_a15_smp_Cache_setL2AuxControlReg__I)
        UP_ASM(.section .text.ti_sysbios_family_arm_a15_Cache_setL2AuxControlReg__I)
        SMP_ASM(.func ti_sysbios_family_arm_a15_smp_Cache_setL2AuxControlReg__I)
        UP_ASM(.func ti_sysbios_family_arm_a15_Cache_setL2AuxControlReg__I)

SMP_ASM(ti_sysbios_family_arm_a15_smp_Cache_setL2AuxControlReg__I:)
UP_ASM(ti_sysbios_family_arm_a15_Cache_setL2AuxControlReg__I:)
        push    {r4-r12, lr}
        ldr     r12, =0x104
        dsb
        smc     0x1
        pop     {r4-r12, lr}

        bx      lr
        .endfunc

        .end

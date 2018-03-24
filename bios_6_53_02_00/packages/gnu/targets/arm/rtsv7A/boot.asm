@ --COPYRIGHT--,EPL
@   Copyright (c) 2012 Texas Instruments and others.
@   All rights reserved. This program and the accompanying materials
@   are made available under the terms of the Eclipse Public License v1.0
@   which accompanies this distribution, and is available at
@   http://www.eclipse.org/legal/epl-v10.html
@
@   Contributors:
@       Texas Instruments - initial implementation
@
@ --/COPYRIGHT--
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@  boot.asm
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#define A15  1
#define A15F 2

    .syntax unified

    .global _c_int00

    .section .c_int00, "ax"
    .func _c_int00
    .code 32                         @ select ARM instruction set 

_c_int00:
    @ disable interrupts (IRQs and FIQs)
    mrs r0, cpsr_cf
    orr r12, r0, #192
    msr cpsr_cf, r12

    cps #0x1f                        @ change cpu mode to system mode

    @ Init SCTLR register - disable all caches
    mrc  p15, #0, r0, c1, c0, #0
    movw r1, #0x1004
    bic  r0, r0, r1
    mcr  p15, #0, r0, c1, c0, #0
    isb

@ Only invalidate L1 and L2 cache for A15
#if (xdc_target_name__ == A15) || (xdc_target_name__ == A15F)
    
    @ invalidate l1d and l2 cache
    mrc     p15, #1, r0, c0, c0, #1  @ read clidr
    ands    r3, r0, #0x7000000       @ extract loc from clidr
    mov     r3, r3, lsr #23          @ left align loc bit field
    beq     invfinished              @ if loc is 0, then no need to clean
    mov     r10, #0                  @ start clean at cache level 0
invloop1:
    add     r2, r10, r10, lsr #1     @ work out 3x current cache level
    mov     r1, r0, lsr r2           @ extract cache type bits from clidr
    and     r1, r1, #7               @ mask of the bits for current cache only
    cmp     r1, #2                   @ see what cache we have at this level
    blt     invskip                  @ skip if no cache, or just i-cache

    mcr     p15, #2, r10, c0, c0, #0 @ select current cache level in cssr
    isb                              @ flush prefetch buffer,
    mrc     p15, #1, r1, c0, c0, #0  @ read the new csidr
    and     r2, r1, #7               @ extract the length of the cache lines
    add     r2, r2, #4               @ add 4 (line length offset)
    movw    r4, #0x3ff
    ands    r4, r4, r1, lsr #3       @ find maximum number on the way size
    clz     r5, r4                   @ find bit position of way size increment
    movw    r7, #0x7fff
    ands    r7, r7, r1, lsr #13      @ extract max number of the index size
invloop2:
    mov     r9, r4                   @ create working copy of max way size
invloop3:
    orr     r11, r10, r9, lsl r5     @ factor way and cache number into r11
    orr     r11, r11, r7, lsl r2     @ factor index number into r11
    mcr     p15, #0, r11, c7, c6, #2 @ invalidate by set/way
    subs    r9, r9, #1               @ decrement the way
    bge     invloop3
    subs    r7, r7, #1               @ decrement the index
    bge     invloop2
invskip:
    add     r10, r10, #2             @ increment cache number
    cmp     r3, r10
    bgt     invloop1
invfinished:
    mov     r10, #0                  @ swith back to cache level 0
    mcr     p15, #2, r10, c0, c0, #0 @ select current cache level in csselr
    isb                              @ flush prefetch buffer

#endif

    @ Init SCTLR register - disable mmu
    mrc p15, #0, r0, c1, c0, #0
    mov r1, #0x1
    bic r0, r0, r1
    mcr p15, #0, r0, c1, c0, #0
    dsb
    isb

    @ invalidate TLB
    mcr p15, #0, r0, c8, c7, #0      @ invalidate unified TLB
    mcr p15, #0, r0, c8, c6, #0      @ invalidate data TLB
    mcr p15, #0, r0, c8, c5, #0      @ invalidate instruction TLB
    dsb                              @ wait for invalidation to complete
    isb                              @ flush instruction pipeline

#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
    @ enable access to cp10 and cp11
    @ required for SIMD and VFP to work
    movw r0, #0x0000
    movt r0, #0x00F0
    mcr p15, #0, r0, c1, c0, #2
    isb

    @ set the FPEXC.EN bit to enable Advanced SIMD and VFP
    movw r0, #0x0000
    movt r0, #0x4000
    fmxr fpexc, r0                   @ gcc does not support UAL equivalent
                                     @ instruction, vmsr
#endif

    @ initialize stack pointer
    ldr r0, =__TI_STACK_BASE
    mov sp, r0
    ldr r0, =__TI_STACK_SIZE
    add sp, r0

    @ align to 64-bits for EABI
    mov r7, sp
    mov r0, #0x07
    bic r7, r0
    mov sp, r7

    @ run any reset functions
    ldr r0, =xdc_runtime_Startup_reset__I
    cmp r0, #0
    beq _reset_fxns_done_
    blx r0

_reset_fxns_done_:

    @ do more initialization in C, go to main()
    ldr r0, =gnu_targets_arm_rtsv7A_startupC
    blx r0

    .endfunc
    .end

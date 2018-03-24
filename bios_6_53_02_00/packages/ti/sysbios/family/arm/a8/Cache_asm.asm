;
;  Copyright (c) 2013, Texas Instruments Incorporated
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
; ======== Cache_asm.asm ========
;
;

        .cdecls C,NOLIST,"package/internal/Cache.xdc.h"

        .global ti_sysbios_family_arm_a8_Cache_disableL1d__I
        .global ti_sysbios_family_arm_a8_Cache_disableL1p__I
        .global ti_sysbios_family_arm_a8_Cache_enableL1d__I
        .global ti_sysbios_family_arm_a8_Cache_enableL1p__I
        .global ti_sysbios_family_arm_a8_Cache_invL1d__I
        .global ti_sysbios_family_arm_a8_Cache_invL1p__I
        .global ti_sysbios_family_arm_a8_Cache_invL1dAll__E
        .global ti_sysbios_family_arm_a8_Cache_invL1pAll__E
        .global ti_sysbios_family_arm_a8_Cache_wb__E
        .global ti_sysbios_family_arm_a8_Cache_wbInv__E
        .global ti_sysbios_family_arm_a8_Cache_wbAll__E
        .global ti_sysbios_family_arm_a8_Cache_wbInvAll__E
        .global ti_sysbios_family_arm_a8_Cache_wait__E
        .global ti_sysbios_family_arm_a8_Cache_getEnabled__E
        .global ti_sysbios_family_arm_a8_Cache_getLockdownReg__I
        .global ti_sysbios_family_arm_a8_Cache_setLockdownReg__I
        .global ti_sysbios_family_arm_a8_Cache_wayLoadLock__I
        .global ti_sysbios_family_arm_a8_Cache_getCacheLevelInfo__I
        .global ti_sysbios_family_arm_a8_Cache_getL2AuxControlReg__I
        .global ti_sysbios_family_arm_a8_Cache_setL2AuxControlReg__I
        .global ti_sysbios_family_arm_a8_Cache_disableBP__E
        .global ti_sysbios_family_arm_a8_Cache_enableBP__E
        .global ti_sysbios_family_arm_a8_Cache_disableL2__I
        .global ti_sysbios_family_arm_a8_Cache_enableL2__I

        .state32
        .align  4

;
; ======== Cache_disableL1d ========
; To disable the L1 data cache, writeback invalidate the whole data cache first.
; then disable the data cache by setting the C bit to 0 in the c1 register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_disableL1d__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_disableL1d__I

ti_sysbios_family_arm_a8_Cache_disableL1d__I
        .asmfunc
        stmfd   sp!, {r0-r7, r9-r11, lr}
                                        ; push out all of L1D
        bl      ti_sysbios_family_arm_a8_Cache_wbInvAll__E

        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        bic     r0, r0, #0x0004         ; clear C bit in CR
        mcr     p15, #0, r0, c1, c0, #0 ; DCache disabled

        ldmfd   sp!, {r0-r7, r9-r11, lr}
        mov     pc, lr
        .endasmfunc


;
; ======== Cache_disableL1p ========
; To disable the L1 instruction cache, invalidate the whole instruction cache
; first, then disable it by setting the I bit to 0 in the c1 register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_disableL1p__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_disableL1p__I

ti_sysbios_family_arm_a8_Cache_disableL1p__I
        .asmfunc
        mcr     p15, #0, r0, c7, c5, #0 ; invalidate all ICache

        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        bic     r0, r0, #0x1000         ; clear I bit in CR
        mcr     p15, #0, r0, c1, c0, #0 ; ICache disabled
        bx      r14
        .endasmfunc


;
; ======== Cache_disableL2 ========
; To disable the L2 unified cache clear the L2EN bit
; in the Auxiliary Control Register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_disableL2__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_disableL2__I

ti_sysbios_family_arm_a8_Cache_disableL2__I
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #1 ; read register ACR
        bic     r0, r0, #0x2            ; clear L2EN in ACR
        mcr     p15, #0, r0, c1, c0, #1 ; L2 Cache disabled
        bx      r14
        .endasmfunc


;
; ======== Cache_enableL1d ========
; To enable the L1 data cache set the C bit to 1 in the c1 register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_enableL1d__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_enableL1d__I

ti_sysbios_family_arm_a8_Cache_enableL1d__I
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        orr     r0, r0, #0x0004         ; set C bit (bit 2) to 1
        mcr     p15, #0, r0, c1, c0, #0 ; DCache enabled
        bx      r14
        .endasmfunc


;
; ======== Cache_enableL1p ========
; To enable the L1 instruction cache set the I bit to 1 in the c1 register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_enableL1p__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_enableL1p__I

ti_sysbios_family_arm_a8_Cache_enableL1p__I
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        orr     r0, r0, #0x1000         ; set I bit (bit 12) to 1
        mcr     p15, #0, r0, c7, c5, #0 ; Invalidate entire instruction cache
        mcr     p15, #0, r0, c1, c0, #0 ; ICache enabled
        bx      r14
        .endasmfunc

;
; ======== Cache_enableL2 ========
; To enable the L2 unified cache set the L2EN bit
; in the Auxiliary Control Register.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_enableL2__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_enableL2__I

ti_sysbios_family_arm_a8_Cache_enableL2__I
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #1 ; read register ACR
        orr     r0, r0, #0x2            ; set L2EN in ACR
        mcr     p15, #0, r0, c1, c0, #1 ; L2 Cache enabled
        bx      r14
        .endasmfunc


;
; ======== Cache_invL1d ========
; Invalidates a range of MVA (modified virtual addresses) in the L1 data cache
;     Cache_invL1d(Ptr blockPtr, SizeT byteCnt, Bool wait)
;
;       r0 - contains blockPtr
;       r1 - contains byteCnt
;       r2 - contains wait
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_invL1d__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_invL1d__I

ti_sysbios_family_arm_a8_Cache_invL1d__I
        .asmfunc
        add     r1, r0, r1              ; calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align blockPtr to cache line
invDCache_loop:
        mcr     p15, #0, r0, c7, c6, #1 ; invalidate single entry in DCache
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp     r0, r1                  ; compare to last address
        blo     invDCache_loop          ; loop if > 0
        tst     r2, #0x1                ; check if wait param is TRUE
        mcrne   p15, #0, r0, c7, c10, #4 ; drain write buffer
        bx      r14                     ; return
        .endasmfunc


;
; ======== Cache_invL1p ========
; Invalidates a range of modified virtual addresses in L1 instruction cache
;     Cache_invL1p(Ptr blockPtr, SizeT byteCnt, Bool wait)
;
;       r0 - contains blockPtr
;       r1 - contains byteCnt
;       r2 - contains wait
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_invL1p__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_invL1p__I

ti_sysbios_family_arm_a8_Cache_invL1p__I
        .asmfunc
        add     r1, r0, r1              ; calculate last address
        bic     r0, r0, #Cache_sizeL1pCacheLine - 1
                                        ; align blockPtr to cache line
invICache_loop:
        mcr     p15, #0, r0, c7, c5, #1 ; invalidate single entry in ICache
        add     r0, r0, #Cache_sizeL1pCacheLine
                                        ; increment address by cache line size
        cmp     r0, r1                  ; compare to last address
        blo     invICache_loop          ; loop if > 0
        tst     r2, #0x1                ; check if wait param is TRUE
        mcrne   p15, #0, r0, c7, c10, #4 ; drain write buffer
        bx      r14
        .endasmfunc


;
; ======== Cache_invL1dAll ========
; Invalidates all in data cache. Note: This is risky since data cache may
; contain some stack variable or valid data that should not be invalidated.
; Only use this function if you know for sure the data cache contains unwanted
; information.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_invL1dAll__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_invL1dAll__E

ti_sysbios_family_arm_a8_Cache_invL1dAll__E
        .asmfunc
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 ; read clidr
        ands    r3, r0, #0x7000000      ; extract loc from clidr
        mov     r3, r3, lsr #23         ; left align loc bit field
        beq     invfinished             ; if loc is 0, then no need to clean

        mov     r10, #0                 ; start clean at cache level 0

invloop1:
        add     r2, r10, r10, lsr #1    ; work out 3x current cache level
        mov     r1, r0, lsr r2          ; extract cache type bits from clidr
        and     r1, r1, #7              ; mask of the bits for current cache only
        cmp     r1, #2                  ; see what cache we have at this level
        blt     invskip                 ; skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
                                        ; but we compile with armv5
        mrc     p15, #1, r1, c0, c0, #0 ; read the new csidr
        and     r2, r1, #7              ; extract the length of the cache lines
        add     r2, r2, #4              ; add 4 (line length offset)
        mov     r4, #0x3ff
        ands    r4, r4, r1, lsr #3      ; find maximum number on the way size
        clz     r5, r4                  ; find bit position of way size increment
        mov     r7, #0x7fff
        ands    r7, r7, r1, lsr #13     ; extract max number of the index size
invloop2:
        mov     r9, r4                  ; create working copy of max way size
invloop3:
        orr     r11, r10, r9, lsl r5    ; factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    ; factor index number into r11
        mcr     p15, #0, r11, c7, c6, #2 ; invalidate by set/way
        subs    r9, r9, #1              ; decrement the way
        bge     invloop3
        subs    r7, r7, #1              ; decrement the index
        bge     invloop2
invskip:
        add     r10, r10, #2            ; increment cache number
        cmp     r3, r10
        bgt     invloop1
invfinished:
        mov     r10, #0                 ; swith back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        mov     pc, lr
        .endasmfunc


;
; ======== Cache_invL1pAll ========
; Invalidates all entries in the instruction cache
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_invL1pAll__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_invL1pAll__E

ti_sysbios_family_arm_a8_Cache_invL1pAll__E
        .asmfunc
        mcr     p15, #0, r0, c7, c5, #0 ; invalidate all entries in ICache
        bx      r14                     ; return
        .endasmfunc


;
; ======== Cache_wb ========
; Writes back the range of MVA in data cache. First, wait on any previous cache
; operation.
;
;     Cache_wb(Ptr blockPtr, SizeT byteCnt, Type type, Bool wait)
;
;       r0 - contains blockPtr
;       r1 - contains byteCnt
;       r2 - contains bit mask of cache type (unused)
;       r3 - contains wait
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wb__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wb__E

ti_sysbios_family_arm_a8_Cache_wb__E
        .asmfunc
        add     r1, r0, r1              ; calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align address to cache line
writeback:
        mcr     p15, #0, r0, c7, c10, #1 ; write back a cache line
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp     r0, r1                  ; compare to last address
        blo     writeback               ; loop if count > 0
        tst     r3, #0x1                ; check if wait param is TRUE
        mcrne   p15, #0, r0, c7, c10, #4 ; drain write buffer
        bx      r14
        .endasmfunc


;
; ======== Cache_wbInv ========
; Writes back and invalidates the range of MVA in data cache.
; First, wait on any previous cache operation.
;
;     Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Type type, Bool wait)
;
;       r0 - contains blockPtr
;       r1 - contains byteCnt
;       r2 - contains bitmask of cache type (unused)
;       r3 - contains wait
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wbInv__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wbInv__E

ti_sysbios_family_arm_a8_Cache_wbInv__E
        .asmfunc
        add     r1, r0, r1              ; calculate last address
        bic     r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align blockPtr to cache line
writebackInv:
        mcr     p15, #0, r0, c7, c14, #1 ; writeback inv a cache line
        add     r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp     r0, r1                  ; compare to last address
        blo     writebackInv            ; loop if count > 0
        tst     r3, #0x1                ; check if wait param is TRUE
        mcrne   p15, #0, r0, c7, c10, #4 ; drain write buffer
        bx      r14
        .endasmfunc


;
; ======== Cache_wait ========
; Wait for the 'Drain write buffer' to complete
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wait__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wait__E

ti_sysbios_family_arm_a8_Cache_wait__E
        .asmfunc
        mcr     p15, #0, r0, c7, c10, #4 ; drain write buffer
        bx      r14                     ; return
        .endasmfunc


;
; ======== Cache_wbAll ========
; Write back all of L1 data cache
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wbAll__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wbAll__E

ti_sysbios_family_arm_a8_Cache_wbAll__E
        .asmfunc
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 ; read clidr
        ands    r3, r0, #0x7000000      ; extract loc from clidr
        mov     r3, r3, lsr #23         ; left align loc bit field
        beq     wbafinished                ; if loc is 0, then no need to clean

        mov     r10, #0                 ; start clean at cache level 0

wbaloop1:
        add     r2, r10, r10, lsr #1    ; work out 3x current cache level
        mov     r1, r0, lsr r2          ; extract cache type bits from clidr
        and     r1, r1, #7              ; mask of the bits for current cache only
        cmp     r1, #2                  ; see what cache we have at this level
        blt     wbaskip                 ; skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
                                        ; but we compile with armv5
        mrc     p15, #1, r1, c0, c0, #0 ; read the new csidr
        and     r2, r1, #7              ; extract the length of the cache lines
        add     r2, r2, #4              ; add 4 (line length offset)
        mov     r4, #0x3ff
        ands    r4, r4, r1, lsr #3      ; find maximum number on the way size
        clz     r5, r4                  ; find bit position of way size increment
        mov     r7, #0x7fff
        ands    r7, r7, r1, lsr #13     ; extract max number of the index size
wbaloop2:
        mov     r9, r4                  ; create working copy of max way size
wbaloop3:
        orr     r11, r10, r9, lsl r5    ; factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    ; factor index number into r11
        mcr     p15, #0, r11, c7, c10, #2 ; clean line by set/way
        subs    r9, r9, #1              ; decrement the way
        bge     wbaloop3
        subs    r7, r7, #1              ; decrement the index
        bge     wbaloop2
wbaskip:
        add     r10, r10, #2            ; increment cache number
        cmp     r3, r10
        bgt     wbaloop1

wbafinished:
        mov     r10, #0                 ; switch back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        mov     pc, lr

        .endasmfunc


;
; ======== Cache_wbInvAll ========
; Write back and invalidate entire data cache
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wbInvAll__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wbInvAll__E

ti_sysbios_family_arm_a8_Cache_wbInvAll__E
        .asmfunc
        stmfd   sp!, {r0-r7, r9-r11, lr}
        mrc     p15, #1, r0, c0, c0, #1 ; read clidr
        ands    r3, r0, #0x7000000      ; extract loc from clidr
        mov     r3, r3, lsr #23         ; left align loc bit field
        beq     finished                ; if loc is 0, then no need to clean

        mov     r10, #0                 ; start clean at cache level 0

loop1:
        add     r2, r10, r10, lsr #1    ; work out 3x current cache level
        mov     r1, r0, lsr r2          ; extract cache type bits from clidr
        and     r1, r1, #7              ; mask of the bits for current cache only
        cmp     r1, #2                  ; see what cache we have at this level
        blt     skip                    ; skip if no cache, or just i-cache

        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
                                        ; but we compile with armv5
        mrc     p15, #1, r1, c0, c0, #0 ; read the new csidr
        and     r2, r1, #7              ; extract the length of the cache lines
        add     r2, r2, #4              ; add 4 (line length offset)
        mov     r4, #0x3ff
        ands    r4, r4, r1, lsr #3      ; find maximum number on the way size
        clz     r5, r4                  ; find bit position of way size increment
        mov     r7, #0x7fff
        ands    r7, r7, r1, lsr #13     ; extract max number of the index size
loop2:
        mov     r9, r4                  ; create working copy of max way size
loop3:
        orr     r11, r10, r9, lsl r5    ; factor way and cache number into r11
        orr     r11, r11, r7, lsl r2    ; factor index number into r11
        mcr     p15, #0, r11, c7, c14, #2 ; clean & invalidate by set/way
        subs    r9, r9, #1              ; decrement the way
        bge     loop3
        subs    r7, r7, #1              ; decrement the index
        bge     loop2
skip:
        add     r10, r10, #2            ; increment cache number
        cmp     r3, r10
        bgt     loop1
finished:
        mov     r10, #0                 ; swith back to cache level 0
        mcr     p15, #2, r10, c0, c0, #0; select current cache level in cssr
        mcr     p15, #0, r10, c7, c5, #4; flush prefetch buffer,
                                        ; with armv7 this is 'isb',
        ldmfd   sp!, {r0-r7, r9-r11, lr}
        mov     pc, lr

        .endasmfunc


;
; ======== Cache_getEnabled ========
; Determine the mask of enabled caches
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_getEnabled__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_getEnabled__E

ti_sysbios_family_arm_a8_Cache_getEnabled__E
        .asmfunc
        mov     r0, #0
                                        ; Do L1 first
        mrc     p15, #0, r1, c1, c0, #0 ; fetch Control Register into r1

        tst     r1, #0x1000             ; test I bit (bit 12) for L1P
        addne   r0, r0, #1              ; if I is true, L1P is enabled

        tst     r1, #0x0004             ; test C bit (bit 2) for L1D
        addne   r0, r0, #2              ; if C bit is true, L1D is enabled

                                        ; Do L2 next
        mrc     p15, #0, r1, c1, c0, #1 ; fetch Auxiliary Control Register into r1

        tst     r1, #0x0002             ; test L2EN bit (bit 1) for L2EN
        beq     getEnabledDone

        tst     r0, #0x0001
        addne   r0, r0, #4              ; If L2EN and L1P then L2P

        tst     r0, #0x0002
        addne   r0, r0, #8              ; If L2EN and L1D then L2D

getEnabledDone:
        bx      r14
        .endasmfunc

;
; ======== Cache_getLevelInfo ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_getCacheLevelInfo__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_getCacheLevelInfo__I

ti_sysbios_family_arm_a8_Cache_getCacheLevelInfo__I
        mcr     p15, #2, r0, c0, c0, #0 ; write to Cache Size Selection Reg
        mrc     p15, #1, r0, c0, c0, #0 ; read Cache Size Id Reg
        bx      r14
        .endasmfunc

;
; ======== Cache_getL2AuxControlReg ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_getL2AuxControlReg__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_getL2AuxControlReg__I

ti_sysbios_family_arm_a8_Cache_getL2AuxControlReg__I
        .asmfunc
        mrc     p15, #1, r0, c9, c0, #2 ; get L2 aux ctrl register
        bx      r14
        .endasmfunc

;
; ======== Cache_setL2AuxControlReg ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_setL2AuxControlReg__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_setL2AuxControlReg__I

ti_sysbios_family_arm_a8_Cache_setL2AuxControlReg__I
        .asmfunc
        mcr     p15, #1, r0, c9, c0, #2 ; set L2 aux ctrl register
        bx      r14
        .endasmfunc

;
; ======== Cache_getLockdownReg ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_getLockdownReg__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_getLockdownReg__I

ti_sysbios_family_arm_a8_Cache_getLockdownReg__I
        .asmfunc
        mrc     p15, #1, r0, c9, c0, #0 ; get L2 lockdown register
        bx      r14
        .endasmfunc

;
; ======== Cache_setLockdownReg ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_setLockdownReg__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_setLockdownReg__I

ti_sysbios_family_arm_a8_Cache_setLockdownReg__I
        .asmfunc
        mcr     p15, #1, r0, c9, c0, #0 ; set L2 lockdown register
        bx      r14
        .endasmfunc

;
; ======== Cache_wayLoadLock ========
; r0 = block start address
; r1 = length in bytes
; r2 = way bitmask
;
; Algorithm:
;
; 1) Disable I cache to prevent caching of code
; 2) Lock all but referenced L2 cache way.
; 3) Clean/invalidate referenced L2 cache way.
; 4) Flush then pull memory block into L2 cache.
; 5) Restore L2 locks to previous state plus this wayBit.
; 6) Restore I cache.
;
; NO data accesses between context save/restore other than
; loading the memory block being locked
;
; This function is aligned so that it is entirely contained
; within a single L2 cache way.
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_wayLoadLock__I"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_wayLoadLock__I

ti_sysbios_family_arm_a8_Cache_wayLoadLock__I
        .asmfunc
        stmfd   sp!, {r4-r8}

        ; No data reads beyond this point other than
        ; loading memory block into L2 cache

        add     r1, r0, r1                  ; calculate last address
        bic     r0, r0, #Cache_sizeL2CacheLine - 1

        ; Disable I cache

        mcr     p15, #0, r0, c7, c5, #0     ; invalidate all ICache
        mrc     p15, #0, r3, c1, c0, #0     ; read register CR
        bic     r6, r3, #0x1000             ; clear I bit in CR
                                            ; r3 = old CR
        mcr     p15, #0, r6, c1, c0, #0     ; ICache disabled

        ; lock all but this way

        mov     r4, #0                      ; r4 = 0 for convenience

        mrc     p15, #1, r5, c9, c0, #0     ; r5 = old lockdown reg
        mcr     p15, #0, r4, c7, c10, #4    ; DSB

        mov     r6, #0xff                   ; all 8 way bits
        bic     r6, r6, r2                  ; r6 &= ~(this waybit)

        mcr     p15, #1, r6, c9, c0, #0     ; lock all but this way
        mcr     p15, #0, r4, c7, c10, #4    ; DSB

        ; first calculate how many sets there are per L2 way
        mov     r6, #0x02
        mcr     p15, #2, r6, c0, c0, #0     ; select L2 cache size id reg
        mrc     p15, #1, r6, c0, c0, #0     ; r6 = L2 cache size id reg
                                            ; bits 13-27 are NumSets
        mov     r7, #0x7fff
        and     r7, r7, r6, lsr #13         ; r7 = NumSets

        ; flush/invalidate selected cache way
flushLoop:
        clz     r8, r2
        rsb     r8, r8, #31                 ; waynum
        orr     r8, r4, r8, lsl #29         ; move waynum into place
        orr     r8, r8, r7, lsl #6          ; shift setnum left by 6
        orr     r8, r8, #2                  ; L2 operation
        mcr     p15, #0, r8, c7, c14, #2    ; clean/inv by set/way
        subs    r7, r7, #1
        bne     flushLoop

        ; wait for flush to complete
        mcrne   p15, #0, r0, c7, c10, #4    ; drain write buffer

        ; now, pull block into this cache way
loadLoop:
        mcr     p15, #0, r0, c7, c14, #1    ; writeback inv this cache line to
                                            ; remove it from any other cache
                                            ; way
        ldr     r6, [r0]                    ; Load first word of cache line
                                            ; into this L2 cache way
                                            ; (unified, so data load works)
        add     r0, r0, #Cache_sizeL2CacheLine
                                            ; increment address by cache
                                            ; line size
        cmp     r0, r1                      ; compare to last address
        blo     loadLoop

        ; update lockdown

        orr     r5, r5, r2                  ; set this waybit in lockdown
        mcr     p15, #0, r4, c7, c10, #4    ; DSB
        mcr     p15, #1, r5, c9, c0, #0     ; update lockdown
        mcr     p15, #0, r4, c7, c10, #4    ; DSB

        ; Re-store I cache setting

        mcr     p15, #0, r3, c1, c0, #0     ; restore old CR saved in r3

        ldmfd   sp!, {r4-r8}
        bx      lr
        .endasmfunc

;
; ======== Cache_disableBP ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_disableBP__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_disableBP__E

ti_sysbios_family_arm_a8_Cache_disableBP__E
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        nop
        bic     r0, r0, #0x0800         ; clear BP bit in CR
        mcr     p15, #0, r0, c1, c0, #0 ; BP disabled
        nop
        mrc     p15, #0, r0, c1, c0, #0 ; return CR
        bx      r14
        .endasmfunc

;
; ======== Cache_enableBP ========
;
        .sect ".text:ti_sysbios_family_arm_a8_Cache_enableBP__E"
        .clink
        .armfunc ti_sysbios_family_arm_a8_Cache_enableBP__E

ti_sysbios_family_arm_a8_Cache_enableBP__E
        .asmfunc
        mrc     p15, #0, r0, c1, c0, #0 ; read register CR
        nop
        orr     r0, r0, #0x0800         ; set BP bit in CR
        mcr     p15, #0, r0, c1, c0, #0 ; BP enabled
        nop
        mrc     p15, #0, r0, c1, c0, #0 ; return CR
        bx      r14
        .endasmfunc

        .end

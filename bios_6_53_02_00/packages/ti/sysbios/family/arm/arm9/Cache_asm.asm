;
;  Copyright (c) 2012, Texas Instruments Incorporated
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

    .if __TI_EABI_ASSEMBLER
        .asg ti_sysbios_family_arm_arm9_Cache_disableL1d__I, _ti_sysbios_family_arm_arm9_Cache_disableL1d__I
        .asg ti_sysbios_family_arm_arm9_Cache_disableL1p__I, _ti_sysbios_family_arm_arm9_Cache_disableL1p__I
        .asg ti_sysbios_family_arm_arm9_Cache_enableL1d__I, _ti_sysbios_family_arm_arm9_Cache_enableL1d__I
        .asg ti_sysbios_family_arm_arm9_Cache_enableL1p__I, _ti_sysbios_family_arm_arm9_Cache_enableL1p__I
        .asg ti_sysbios_family_arm_arm9_Cache_invL1d__I, _ti_sysbios_family_arm_arm9_Cache_invL1d__I
        .asg ti_sysbios_family_arm_arm9_Cache_invL1p__I, _ti_sysbios_family_arm_arm9_Cache_invL1p__I
        .asg ti_sysbios_family_arm_arm9_Cache_invL1dAll__E, _ti_sysbios_family_arm_arm9_Cache_invL1dAll__E
        .asg ti_sysbios_family_arm_arm9_Cache_invL1pAll__E, _ti_sysbios_family_arm_arm9_Cache_invL1pAll__E
        .asg ti_sysbios_family_arm_arm9_Cache_wb__E, _ti_sysbios_family_arm_arm9_Cache_wb__E
        .asg ti_sysbios_family_arm_arm9_Cache_wbInv__E, _ti_sysbios_family_arm_arm9_Cache_wbInv__E
        .asg ti_sysbios_family_arm_arm9_Cache_wbAll__E, _ti_sysbios_family_arm_arm9_Cache_wbAll__E
        .asg ti_sysbios_family_arm_arm9_Cache_wbInvAll__E, _ti_sysbios_family_arm_arm9_Cache_wbInvAll__E
        .asg ti_sysbios_family_arm_arm9_Cache_wait__E, _ti_sysbios_family_arm_arm9_Cache_wait__E
        .asg ti_sysbios_family_arm_arm9_Cache_getEnabled__E, _ti_sysbios_family_arm_arm9_Cache_getEnabled__E
    .endif

        .global _ti_sysbios_family_arm_arm9_Cache_disableL1d__I
        .global _ti_sysbios_family_arm_arm9_Cache_disableL1p__I
        .global _ti_sysbios_family_arm_arm9_Cache_enableL1d__I
        .global _ti_sysbios_family_arm_arm9_Cache_enableL1p__I
        .global _ti_sysbios_family_arm_arm9_Cache_invL1d__I
        .global _ti_sysbios_family_arm_arm9_Cache_invL1p__I
        .global _ti_sysbios_family_arm_arm9_Cache_invL1dAll__E
        .global _ti_sysbios_family_arm_arm9_Cache_invL1pAll__E
        .global _ti_sysbios_family_arm_arm9_Cache_wb__E
        .global _ti_sysbios_family_arm_arm9_Cache_wbInv__E
        .global _ti_sysbios_family_arm_arm9_Cache_wbAll__E
        .global _ti_sysbios_family_arm_arm9_Cache_wbInvAll__E
        .global _ti_sysbios_family_arm_arm9_Cache_wait__E
        .global _ti_sysbios_family_arm_arm9_Cache_getEnabled__E

        .state32
        .align  4

;
; ======== Cache_disableL1d ========
; To disable the L1 data cache, writeback invalidate the whole data cache first.
; then disable the data cache by setting the C bit to 0 in the c1 register.
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_disableL1d__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_disableL1d__I

_ti_sysbios_family_arm_arm9_Cache_disableL1d__I
        .asmfunc
wbInvAll_loop:
        mrc p15, #0, r15, c7, c14, #3   ; test, writeback and inv all DCache
        bne wbInvAll_loop

        mrc p15, #0, r0, c1, c0, #0     ; read register c1
        mov r1, #0x0004                 ; set C bit (bit 2) to 1
        bic r0, r0, r1                  ; clear C bit in c1
        mcr p15, #0, r0, c1, c0, #0     ; DCache disabled
        bx r14
        .endasmfunc


;
; ======== Cache_disableL1p ========
; To disable the L1 instruction cache, invalidate the whole instruction cache
; first, then disable it by setting the I bit to 0 in the c1 register.
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_disableL1p__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_disableL1p__I

_ti_sysbios_family_arm_arm9_Cache_disableL1p__I
        .asmfunc
        mcr p15, #0, r0, c7, c5, #0     ; invalidate all ICache

        mrc p15, #0, r0, c1, c0, #0     ; read register c1
        mov r1, #0x1000                 ; set I bit (bit 12) to 1
        bic r0, r0, r1                  ; clear I bit in c1
        mcr p15, #0, r0, c1, c0, #0     ; ICache disabled
        bx r14
        .endasmfunc


;
; ======== Cache_enableL1d ========
; To enable the L1 data cache set the C bit to 1 in the c1 register.
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_enableL1d__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_enableL1d__I

_ti_sysbios_family_arm_arm9_Cache_enableL1d__I
        .asmfunc
        mrc p15, #0, r1, c1, c0, #0     ; read register c1
        mov r0, #0x0004                 ; set C bit (bit 2) to 1
        orr r1, r1, r0                  ; OR with c1 register
        mcr p15, #0, r1, c1, c0, #0     ; DCache enabled
        bx r14
        .endasmfunc


;
; ======== Cache_enableL1p ========
; To enable the L1 instruction cache set the I bit to 1 in the c1 register.
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_enableL1p__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_enableL1p__I

_ti_sysbios_family_arm_arm9_Cache_enableL1p__I
        .asmfunc
        mrc p15, #0, r1, c1, c0, #0     ; read register c1
        mov r0, #0x1000                 ; set I bit (bit 12) to 1
        orr r1, r1, r0                  ; OR with c1 register
        mcr p15, #0, r0, c7, c5, #0     ; Invalidate entire instruction cache
        mcr p15, #0, r1, c1, c0, #0     ; ICache enabled
        bx r14
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
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_invL1d__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_invL1d__I

_ti_sysbios_family_arm_arm9_Cache_invL1d__I
        .asmfunc
        add r1, r0, r1                  ; calculate last address
        bic r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align blockPtr to cache line
invDCache_loop:
        mcr p15, #0, r0, c7, c6, #1     ; invalidate single entry in DCache
        add r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp r0, r1                      ; compare to last address
        blo invDCache_loop              ; loop if > 0
        tst r2, #0x1                    ; check if wait param is TRUE
        mcrne p15, #0, r0, c7, c10, #4  ; drain write buffer 
        bx r14                          ; return
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
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_invL1p__I"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_invL1p__I

_ti_sysbios_family_arm_arm9_Cache_invL1p__I
        .asmfunc
        add r1, r0, r1                  ; calculate last address
        bic r0, r0, #Cache_sizeL1pCacheLine - 1
                                        ; align blockPtr to cache line
invICache_loop:
        mcr p15, #0, r0, c7, c5, #1     ; invalidate single entry in ICache
        add r0, r0, #Cache_sizeL1pCacheLine
                                        ; increment address by cache line size
        cmp r0, r1                      ; compare to last address
        blo invICache_loop              ; loop if > 0
        tst r2, #0x1                    ; check if wait param is TRUE
        mcrne p15, #0, r0, c7, c10, #4  ; drain write buffer
        bx r14
        .endasmfunc


;
; ======== Cache_invL1dAll ========
; Invalidates all in data cache. Note: This is risky since data cache may
; contain some stack variable or valid data that should not be invalidated.
; Only use this function if you know for sure the data cache contains unwanted
; information.
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_invL1dAll__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_invL1dAll__E

_ti_sysbios_family_arm_arm9_Cache_invL1dAll__E
        .asmfunc
        mcr p15, #0, r0, c7, c6, #0     ; invalidate all entries in DCache
        bx r14
        .endasmfunc


;
; ======== Cache_invL1pAll ========
; Invalidates all entries in the instruction cache
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_invL1pAll__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_invL1pAll__E

_ti_sysbios_family_arm_arm9_Cache_invL1pAll__E
        .asmfunc
        mcr p15, #0, r0, c7, c5, #0     ; invalidate all entries in ICache
        bx r14                          ; return
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
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_wb__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_wb__E

_ti_sysbios_family_arm_arm9_Cache_wb__E
        .asmfunc
        add r1, r0, r1                  ; calculate last address
        bic r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align address to cache line
writeback:
        mcr p15, #0, r0, c7, c10, #1    ; write back a cache line
        add r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp r0, r1                      ; compare to last address
        blo writeback                   ; loop if count > 0
        tst r3, #0x1                    ; check if wait param is TRUE
        mcrne p15, #0, r0, c7, c10, #4  ; drain write buffer
        bx r14
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
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_wbInv__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_wbInv__E

_ti_sysbios_family_arm_arm9_Cache_wbInv__E
        .asmfunc
        add r1, r0, r1                  ; calculate last address
        bic r0, r0, #Cache_sizeL1dCacheLine - 1
                                        ; align blockPtr to cache line
writebackInv:
        mcr p15, #0, r0, c7, c14, #1    ; writeback inv a cache line
        add r0, r0, #Cache_sizeL1dCacheLine
                                        ; increment address by cache line size
        cmp r0, r1                      ; compare to last address
        blo writebackInv                ; loop if count > 0
        tst r3, #0x1                    ; check if wait param is TRUE
        mcrne p15, #0, r0, c7, c10, #4  ; drain write buffer
        bx r14
        .endasmfunc
        

;
; ======== Cache_wait ========
; Wait for the 'Drain write buffer' to complete
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_wait__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_wait__E

_ti_sysbios_family_arm_arm9_Cache_wait__E
        .asmfunc
        mcr p15, #0, r0, c7, c10, #4    ; drain write buffer
        bx r14                          ; return
        .endasmfunc


;
; ======== Cache_wbAll ========
; Write back all of L1 data cache
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_wbAll__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_wbAll__E

_ti_sysbios_family_arm_arm9_Cache_wbAll__E
        .asmfunc
wball_loop:
        mrc p15, #0, r15, c7, c10, #3   ; test and write back
        bne wball_loop
        mcr p15, #0, r0, c7, c10, #4    ; drain write buffer
        bx r14                          ; return
        .endasmfunc


;
; ======== Cache_wbInvAll ========
; Write back and invalidate all of L1 data cache
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_wbInvAll__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_wbInvAll__E

_ti_sysbios_family_arm_arm9_Cache_wbInvAll__E
        .asmfunc
wbinvl1dall_loop:
        mrc p15, #0, r15, c7, c14, #3   ; test, write back and invalidate
        bne wbinvl1dall_loop
        mcr p15, #0, r0, c7, c10, #4    ; drain write buffer
        bx r14                          ; return
        .endasmfunc


;
; ======== Cache_getEnabled ========
; Determine the mask of enabled caches
;
        .sect ".text:_ti_sysbios_family_arm_arm9_Cache_getEnabled__E"
        .clink
        .armfunc _ti_sysbios_family_arm_arm9_Cache_getEnabled__E

_ti_sysbios_family_arm_arm9_Cache_getEnabled__E
        .asmfunc
        mov r0, #0
        mrc     p15, #0, r1, c1, c0, #0 ; fetch Control Register into r1
        tst     r1, #0x1000             ; test I bit (bit 12) for L1P
        addne   r0, r0, #1              ; if I is true, L1P is enabled
        tst     r1, #0x0004             ; test C bit (bit 2) for L1D
        addne   r0, r0, #2              ; if C bit is true, L1D is enabled
        bx r14
        .endasmfunc

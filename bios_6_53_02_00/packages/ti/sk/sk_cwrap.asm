;/*
; *
; * Copyright (c) 2013-2014, Texas Instruments Incorporated
; * All rights reserved.
; *
; *  Redistribution and use in source and binary forms, with or without
; *  modification, are permitted provided that the following conditions
; *  are met:
; *
; *    Redistributions of source code must retain the above copyright
; *    notice, this list of conditions and the following disclaimer.
; *
; *    Redistributions in binary form must reproduce the above copyright
; *    notice, this list of conditions and the following disclaimer in the
; *    documentation and/or other materials provided with the
; *    distribution.
; *
; *    Neither the name of Texas Instruments Incorporated nor the names of
; *    its contributors may be used to endorse or promote products derived
; *    from this software without specific prior written permission.
; *
; *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
; *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
; *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
; *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
; *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; *
;*/
        .include "sk_ns.inc"
        .include "reglist.inc"

        .if $isdefed("__TI_ELFABI__")
        .if __TI_ELFABI__
            .asg SK_registerOSSWE, _SK_registerOSSWE
            .asg SK_registerOSHWE, _SK_registerOSHWE
            .asg SK_registerOSIntr, _SK_registerOSIntr
            .asg SK_registerSCWP, _SK_registerSCWP
            .asg SK_load, _SK_load
            .asg SK_unload, _SK_unload
            .asg SK_algoInvoke, _SK_algoInvoke
            .asg SK_cacheL1DChangeSize, _SK_cacheL1DChangeSize
            .asg SK_cacheL1PChangeSize, _SK_cacheL1PChangeSize
            .asg SK_cacheL2ChangeSize, _SK_cacheL2ChangeSize
            .asg SK_allocSC, _SK_allocSC
            .asg SK_freeSC, _SK_freeSC
            .asg SK_setPDC, _SK_setPDC
            .asg SK_setEventReg, _SK_setEventReg
            .asg SK_getUIDu, _SK_getUIDu
            .asg SK_setDelegateKey, _SK_setDelegateKey
            .asg SK_setMAR, _SK_setMAR
            .asg SK_getSecKey, _SK_getSecKey
            .asg SK_secureBlock, _SK_secureBlock
            .asg SK_downcallOS, _SK_downcallOS
            .asg SK_algo_return, _SK_algo_return
            .asg SK_eventMap, _SK_eventMap
        .endif
        .endif

        .sect  ".text"

syscall .macro  funcName, callNum
        .global funcName
funcName:
        MVK  callNum, B0
||      BNOP  syscallCommon, 5
        .endm

;
; Common code for syscall wrappers.  Should be called with the syscall
; code in B0.
;

syscallCommon:
        STW  B3, *B15--[2]
        SWE
        NOP

        LDW  *++B15[2], B3
 [ A0]  NEG  A0, A4      ; A0 - 0 success, non-zero failure
        NOP  3
        BNOP  B3, 5

;;
;; _SK_downcallOS is defined in sk_swe.asm, since it needs to exist
;; in secure space to be callable by a secure algo.
;;
        syscall _SK_registerOSSWE,      SK_SYSCALL_REGSWE
        syscall _SK_registerOSHWE,      SK_SYSCALL_REGHWE
        syscall _SK_registerOSIntr,     SK_SYSCALL_REGINT
        syscall _SK_registerSCWP,       SK_SYSCALL_REGSCWP
        syscall _SK_load,               SK_SYSCALL_LOAD
        syscall _SK_unload,             SK_SYSCALL_UNLOAD
        syscall _SK_algoInvoke,         SK_SYSCALL_ALGOINVOKE
        syscall _SK_cacheL1DChangeSize, SK_SYSCALL_L1DSIZE
        syscall _SK_cacheL1PChangeSize, SK_SYSCALL_L1PSIZE
        syscall _SK_cacheL2ChangeSize,  SK_SYSCALL_L2SIZE
        syscall _SK_allocSC,            SK_SYSCALL_ALLOCSC
        syscall _SK_freeSC,             SK_SYSCALL_FREESC
        syscall _SK_setPDC,             SK_SYSCALL_SETPDC
        syscall _SK_setEventReg,        SK_SYSCALL_SETEVENTREG
        syscall _SK_getUIDu,            SK_SYSCALL_GETUID
        syscall _SK_setDelegateKey,     SK_SYSCALL_SETDELKEY
        syscall _SK_setMAR,             SK_SYSCALL_SETMAR
        syscall _SK_getSecKey,          SK_SYSCALL_GETSECKEY
        syscall _SK_secureKey,          SK_SYSCALL_SECUREKEY

        .title      "sk_secuser: SK code callable by secure user algos"
        .page
;; ========================================================================
;;  _SK_downcallOS:  System call wrapper for making a host OS downcall
;;
;;  INPUTS
;;    A4 - host OS system call number (index)
;;
;;  OUTPUTS
;;    A5:A4 - Return code from system call
;;
        .if 0
        .sect  ".text:_sk_secuser"
        .endif

        .global _SK_downcallOS
_SK_downcallOS:
        MVK  SK_SYSCALL_DOWNCALL, B0
||      MV  A4, A0
||      STW  B3, *B15--[2]
        SWE
        NOP

        LDW  *++B15[2], B3
        NOP  4
        BNOP  B3, 5

;; ========================================================================
;;  _sk_algo_return:  code stub to which a secure algo returns
;;
;;  INPUTS
;;  NONE
;;
;;  OUTPUTS
;;  NONE
;;
;;  This function is loaded into B3 when calling a secure algorithm.  When
;;  the algorithm returns to this code, the "algo return" system call will
;;  be invoked.  Since it needs to be callable from a secure user algo, it
;;  needs to be placed on a secure page with user execute (UX) permission.
;;  It also needs SX permission since a secure supervisor algo will also
;;  call it, but it's pretty much the rule that all secure code pages will
;;  have SX.
;;
        .global  _sk_algo_return
_sk_algo_return:
        ;
        ; Invoke the "algo return syscall"
        ;
        MVK  SK_SYSCALL_ALGORETURN, B0
        SWE
        NOP
        ; should never get here

        .title      "SK_eventMap: translate eventMap() into setEventReg()"
        .page
;
; INTMUX1 register number in ECM space.
; EVTFLAG0 is at the very base of the space.
;
INTMUX1_EVENT_INDEX .set  (INTMUX1 - EVTFLAG0) / 4

        .global _SK_eventMap
_SK_eventMap:
        AND  A4,3,A2      ; vectId % 4
        SHL  A2,3,A2      ; bitpos
||      SUB  A4,4,A4      ; vectId - 4
        SHR  A4,2,A0      ; muxnum
        MVK  INTMUX1_EVENT_INDEX,A4
        ADD  A4,A0,A4    ; muxreg addr (event reg addr param)
||      MVKL  EVTFLAG0,A1
        MVKH  EVTFLAG0,A1
        LDW  *A1[A4],A1    ; read mux[muxnum]
        MVK  0x7f,A0
        SHL  A0,A2,A0    ; 0x7f << bitpos
        MVK  SK_SYSCALL_SETEVENTREG, B0
||      BNOP  syscallCommon,0
        NOT  A0,A0
        SHL  B4,A2,A2    ; eventId << bitpos
        AND  A1,A0,A0
        OR  A0,A2,A1    ; value param
        MV  A1,B4

        .end

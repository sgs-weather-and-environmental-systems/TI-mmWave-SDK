;
;  Copyright (c) 2014, Texas Instruments Incorporated
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
; ======== Hwi_switch_asm.asm ========
;
;
    .cdecls C,NOLIST,"package/internal/Hwi.xdc.h"

    .global ti_sysbios_family_xxx_Hwi_switchAndRunFunc


;
;  ======== ti_sysbios_family_xxx_Hwi_switchAndRunFunc ========
;
;  Hwi_switchAndRunFunc(Void (*func)());
;
;  Switch to ISR stack, call the function Func() and then switch
;  back to Task stack.
;
;

    .align 2
    .sect ".text:ti_sysbios_family_xxx_Hwi_switchAndRunFunc"
    .clink
ti_sysbios_family_xxx_Hwi_switchAndRunFunc:
    .asmfunc

 .if $DEFINED(__LARGE_CODE_MODEL__) & $DEFINED(__LARGE_DATA_MODEL__)

    ; Switch to ISR stack if not already on it
    ; setup pointer to Hwi module state structure
    MOV.A #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; load current taskSP value
    MOV.A ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), R11

    ; if taskSP was not zero: do nothing, jump to finish
    CMP.A #0, R11
    JNE doneSwitchI

    ; else, load current isrStack pointer
    MOV.A ti_sysbios_family_msp430_Hwi_Module_State.isrStack(R15), R13

    ; store current (task) stack pointer as taskSP 
    MOV.A SP, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

    ; swap isrStack pointer in as the SP
    MOV.A R13, SP

doneSwitchI:

    ; Save oldTaskSP
    PUSH.A R11

    ; Call func()
    CALLA R12

    ; Restore oldTaskSP
    POP.A R11

    ; Switch back to Task stack if necessary
    ; if oldTaskSP is not zero, nothing to do, jump to finish
    CMP.A #0, R11
    JNE doneSwitchT

    ; else, setup pointer to Hwi module state structure
    MOV.A #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; swap task stack pointer back into to SP
    MOV.A ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), SP

    ; write zero to taskSP to indicate back on a task stack
    MOV.A #0, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

doneSwitchT:

    ; pop the return address from stack
    POP.A R14

    ; branch back to caller (using return address popped above)
    BRA R14

 .elseif $DEFINED(__LARGE_CODE_MODEL__)

    ; Switch to ISR stack if not aleady on it
    ; setup pointer to Hwi module state structure
    MOV.W #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; load current taskSP value
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), R11

    ; if taskSP was not zero: do nothing, jump to finish
    CMP.W #0, R11
    JNE doneSwitchI

    ; else, load current isrStack pointer
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.isrStack(R15), R13

    ; store current (task) stack pointer as taskSP 
    MOV.W SP, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

    ; swap isrStack pointer in as the SP
    MOV.W R13, SP       

doneSwitchI:

    ; Save oldTaskSP
    PUSH.A R11

    ; Call func()
    CALLA R12

    ; Restore oldTaskSP
    POP.A R11

    ; Switch back to Task stack if necessary
    ; if oldTaskSP is not zero, nothing to do, jump to finish
    CMP.W #0, R11
    JNE doneSwitchT

    ; else, setup pointer to Hwi module state structure
    MOV.W #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; swap task stack pointer back into to SP
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), SP

    ; write zero to taskSP to indicate back on a task stack
    MOV.W #0, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

doneSwitchT:

    ; pop the return address from stack
    POP.A R14

    ; branch back to caller (using return address popped above)
    BRA R14

 .else

    ; Switch to ISR stack if not already on it
    ; setup pointer to Hwi module state structure
    MOV.W #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; load current taskSP value
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), R11

    ; if taskSP was not zero: do nothing, jump to finish
    CMP.W #0, R11
    JNE doneSwitchI

    ; else, load current isrStack pointer
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.isrStack(R15), R13

    ; store current (task) stack pointer as taskSP
    MOV.W SP, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

    ; swap isrStack pointer in as the SP
    MOV.W R13, SP

doneSwitchI:

    ; Save oldTaskSP
    PUSH.W R11

    ; Call func()
    CALL R12

    ; Restore oldTaskSP
    POP.W R11

    ; Switch back to Task stack if necessary
    ; if oldTaskSP is not zero, nothing to do, jump to finish
    CMP.W #0, R11
    JNE doneSwitchT

    ; else, setup pointer to Hwi module state structure
    MOV.W #ti_sysbios_family_msp430_Hwi_Module__state__V, R15

    ; swap task stack pointer back into to SP
    MOV.W ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15), SP

    ; write zero to taskSP to indicate back on a task stack
    MOV.W #0, ti_sysbios_family_msp430_Hwi_Module_State.taskSP(R15)

doneSwitchT:

    ; pop the return address from stack
    POP.W R14

    ; branch back to caller (using return address popped above)
    BR R14

    .endif

    .endasmfunc

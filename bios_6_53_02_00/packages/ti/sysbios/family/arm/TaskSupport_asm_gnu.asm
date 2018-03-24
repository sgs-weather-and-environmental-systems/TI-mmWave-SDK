@
@  Copyright (c) 2014-2016, Texas Instruments Incorporated
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
@ ======== TaskSupport_asm.asm ========
@

        .arm

        .global ti_sysbios_family_arm_TaskSupport_swap__E
        .global ti_sysbios_family_arm_TaskSupport_buildTaskStack
        .global ti_sysbios_family_arm_TaskSupport_glue

        .align  4


@
@  ======== Task_buildTaskStack ========
@
@  Task_buildTaskStack(stack, fxn, exit, entry, arg0, arg1)
@                                     r0,  r1,   r2,    r3,  [0],  [4]
@
@  initial stack image:
@
@               d8-d15 = 0      if vfp supported
@               r4  = -1
@               r5  = -1 
@               r6  = -1     
@               r7  = -1     
@               r8  = -1     
@               r9  = -1     
@               r10 = -1     
@               r11 = -1     
@               glue    
@               arg0    
@               arg1    
@               fxn    
@               exit    
@               enter    
@

STACK   .req     r0     @ 1st argument, return value
FXN     .req     r1     @ 2nd argument
EXIT    .req     r2     @ 3rd argument
ENTER   .req     r3     @ 4th argument
.set    ARG0,    0      @ 5th argument (stack offset)
.set    ARG1,    4      @ 6th argument (stack offset)

        .section .text.ti_sysbios_family_arm_TaskSupport_buildTaskStack
        .func ti_sysbios_family_arm_TaskSupport_buildTaskStack

ti_sysbios_family_arm_TaskSupport_buildTaskStack:

        str     ENTER, [STACK,#-4]!
        str     EXIT, [STACK,#-4]!
        str     FXN, [STACK,#-4]!

        ldr     r1, [sp, #ARG1]
        str     r1, [STACK,#-4]!
        ldr     r1, [sp, #ARG0]
        str     r1, [STACK,#-4]!

        ldr     r1, glueAddr
        str     r1, [STACK,#-4]!

        eor     r1, r1, r1          @ set r1 to 0
        sub     r1, r1, #1

        str     r1, [STACK,#-4]!    @ init r4-r11, lr with -1
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!
        str     r1, [STACK,#-4]!

#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
        eor     r2, r2, r2
        eor     r3, r3, r3
        strd    r2, [STACK,#-8]!        @ make room for 8 vfp
        strd    r2, [STACK,#-8]!        @ saved by parent regs
        strd    r2, [STACK,#-8]!        @ d8-d15
        strd    r2, [STACK,#-8]!
        strd    r2, [STACK,#-8]!
        strd    r2, [STACK,#-8]!
        strd    r2, [STACK,#-8]!
        strd    r2, [STACK,#-8]!
#endif
        bx      lr

        .endfunc

        .align 2
glueAddr:
        .word   ti_sysbios_family_arm_TaskSupport_glue

@
@  ======== TaskSupport_swap ========
@
@  TaskSupport_swap(oldSP, newSP)
@

OLD     .req    r0                      @ 1st argument
NEW     .req    r1                      @ 2nd argument

        .section .text.ti_sysbios_family_arm_TaskSupport_swap__E
        .func ti_sysbios_family_arm_TaskSupport_swap__E

ti_sysbios_family_arm_TaskSupport_swap__E:

        push    {r4-r11, lr}
#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
            vstmdb      r13!, {D8-D15}          @ push vfp caller regs
#endif
        str     sp, [OLD]
.if (ti_sysbios_BIOS_smpEnabled__D == TRUE)
        clrex                           @ clear exclusive monitor status
        @  This instruction is not supported on ARM9 but since SMP is never
        @  enabled for ARM9, it is okay to make execution of clrex conditional
        @  on SMP being enabled.
.endif
        ldr     sp, [NEW]
#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
            vldmia      r13!, {D8-D15}          @ pop vfp caller regs
#endif
        pop     {r4-r11, pc}

        .endfunc
@
@  ======== TaskSupport_glue ========
@
@  This glue function is executed immediately before executing the "fxn"
@  passed to Task_start.  This function loads the parameters to "fxn" into
@  registers - necessary for the arm register passing model.
@

        .section .text.ti_sysbios_family_arm_TaskSupport_glue
        .func ti_sysbios_family_arm_TaskSupport_glue

ti_sysbios_family_arm_TaskSupport_glue:

        ldr r0, [sp, #16]       @ Task enter function
        blx     r0                  @ call Task enter function

@ return from Task enter function here
        ldr     r0, [sp, #0]    @ task arg0
        ldr     r1, [sp, #4]    @ task arg1
        ldr     r2, [sp, #8]    @ task fxn

        ldr     lr, [sp, #12]   @ Task exit function
        bx      r2              @ call task fxn,  ("returns" to exit func)

        .endfunc


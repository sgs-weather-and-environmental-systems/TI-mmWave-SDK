/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== boot.asm ========
 */

    .global gnu_targets_arm_rtsv8A_startupAsm
    .weak   _c_int00

/*
 *  _c_int00 is defined as a weak function so TI-RTOS can provide its own
 *  version and override this.
 */
    .section .c_int00, "ax"
    .func _c_int00
_c_int00:
    ldr     x0, =gnu_targets_arm_rtsv8A_startupAsm
    br      x0
    .endfunc

    .section .text.gnu_targets_arm_rtsv8A_startupAsm, "ax"
    .func gnu_targets_arm_rtsv8A_startupAsm
gnu_targets_arm_rtsv8A_startupAsm:
    /*
     * ---------------------
     * Boot code starts here
     * ---------------------
     */

    mov     x0, #0x3C0
    msr     daif, x0            /* Mask all interrupts */

#if defined(__ARM_FP)
    mov     x0, #(3 << 20)
    msr     cpacr_el1, x0       /* Enable FP/SIMD at EL1 */
#endif

    isb                         /* Synchronize processor context */

    /*
     * ------------------------
     * Initialize stack pointer
     * ------------------------
     */
    msr     spsel, #1           /* Use SP_ELx for ELx */
    ldr     x0, =__TI_STACK_BASE
    ldr     x1, =__TI_STACK_SIZE
    add     x0, x0, x1
    and     x0, x0, #(~0xf)     /* 16-byte align SP */
    mov     sp, x0              /* Initialize SP */

    /* run any reset functions */
    ldr     x0, =xdc_runtime_Startup_reset__I
    cbz     x0, _reset_fxns_done_
    blr     x0

_reset_fxns_done_:

    /* do more initialization in C, go to main() */
    ldr     x0, =gnu_targets_arm_rtsv8A_startupC
    br      x0

    .endfunc

    .end

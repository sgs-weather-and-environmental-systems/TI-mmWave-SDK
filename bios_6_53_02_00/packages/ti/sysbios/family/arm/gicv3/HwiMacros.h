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
 *  ======== HwiMacros.h ========
 *  Assembly macros for Hwi module
 */
#ifndef ti_sysbios_family_arm_gicv3_HwiMacros__include
#define ti_sysbios_family_arm_gicv3_HwiMacros__include

#if defined(__ASSEMBLER__) && defined(__GNUC__) && !defined(__ti__)

#define icc_asgi1r_el1  s3_0_c12_c11_6
#define icc_bpr0_el1    s3_0_c12_c8_3
#define icc_bpr1_el1    s3_0_c12_c12_3
#define icc_ctlr_el1    s3_0_c12_c12_4
#define icc_ctlr_el3    s3_6_c12_c12_4
#define icc_dir_el1     s3_0_c12_c11_1
#define icc_eoir0_el1   s3_0_c12_c8_1
#define icc_eoir1_el1   s3_0_c12_c12_1
#define icc_iar0_el1    s3_0_c12_c8_0
#define icc_iar1_el1    s3_0_c12_c12_0
#define icc_igrpen0_el1 s3_0_c12_c12_6
#define icc_igrpen1_el1 s3_0_c12_c12_7
#define icc_igrpen1_el3 s3_6_c12_c12_7
#define icc_pmr_el1     s3_0_c4_c6_0
#define icc_rpr_el1     s3_0_c12_c11_3
#define icc_sgi0r_el1   s3_0_c12_c11_7
#define icc_sgi1r_el1   s3_0_c12_c11_5
#define icc_sre_el1     s3_0_c12_c12_5
#define icc_sre_el2     s3_4_c12_c9_5
#define icc_sre_el3     s3_6_c12_c12_5
#define ich_ap0r0_el2   s3_4_c12_c8_0
#define ich_ap1r0_el2   s3_4_c12_c8_1
#define ich_hcr_el2     s3_4_c12_c11_0
#define ich_lr0_el2     s3_4_c12_c12_0
#define ich_vmcr_el2    s3_4_c12_c11_7

.macro VECTOR_ENTRY name
        .align  7
\name:
.endm

.macro PUSH_CALLER_SAVE_CPU_REGS stackPtr
        stp     x0, x1, [\stackPtr, #-16]!
        stp     x2, x3, [\stackPtr, #-16]!
        stp     x4, x5, [\stackPtr, #-16]!
        stp     x6, x7, [\stackPtr, #-16]!
        stp     x8, x9, [\stackPtr, #-16]!
        stp     x10, x11, [\stackPtr, #-16]!
        stp     x12, x13, [\stackPtr, #-16]!
        stp     x14, x15, [\stackPtr, #-16]!
        stp     x16, x17, [\stackPtr, #-16]!
        stp     x18, x19, [\stackPtr, #-16]!
        stp     x29, x30, [\stackPtr, #-16]!
.endm

.macro POP_CALLER_SAVE_CPU_REGS stackPtr
        ldp     x29, x30, [\stackPtr], #16
        ldp     x18, x19, [\stackPtr], #16
        ldp     x16, x17, [\stackPtr], #16
        ldp     x14, x15, [\stackPtr], #16
        ldp     x12, x13, [\stackPtr], #16
        ldp     x10, x11, [\stackPtr], #16
        ldp     x8, x9, [\stackPtr], #16
        ldp     x6, x7, [\stackPtr], #16
        ldp     x4, x5, [\stackPtr], #16
        ldp     x2, x3, [\stackPtr], #16
        ldp     x0, x1, [\stackPtr], #16    /* x0 & x1 saved by vector entry */
.endm

.macro PUSH_CALLER_SAVE_FPU_REGS stackPtr
        stp     q0, q1, [\stackPtr, #-32]!
        stp     q2, q3, [\stackPtr, #-32]!
        stp     q4, q5, [\stackPtr, #-32]!
        stp     q6, q7, [\stackPtr, #-32]!
        stp     q8, q9, [\stackPtr, #-32]!
        stp     q10, q11, [\stackPtr, #-32]!
        stp     q12, q13, [\stackPtr, #-32]!
        stp     q14, q15, [\stackPtr, #-32]!
        stp     q16, q17, [\stackPtr, #-32]!
        stp     q18, q19, [\stackPtr, #-32]!
        stp     q20, q21, [\stackPtr, #-32]!
        stp     q22, q23, [\stackPtr, #-32]!
        stp     q24, q25, [\stackPtr, #-32]!
        stp     q26, q27, [\stackPtr, #-32]!
        stp     q28, q29, [\stackPtr, #-32]!
        stp     q30, q31, [\stackPtr, #-32]!
.endm

.macro POP_CALLER_SAVE_FPU_REGS stackPtr
        ldp     q30, q31, [\stackPtr], #32
        ldp     q28, q29, [\stackPtr], #32
        ldp     q26, q27, [\stackPtr], #32
        ldp     q24, q25, [\stackPtr], #32
        ldp     q22, q23, [\stackPtr], #32
        ldp     q20, q21, [\stackPtr], #32
        ldp     q18, q19, [\stackPtr], #32
        ldp     q16, q17, [\stackPtr], #32
        ldp     q14, q15, [\stackPtr], #32
        ldp     q12, q13, [\stackPtr], #32
        ldp     q10, q11, [\stackPtr], #32
        ldp     q8, q9, [\stackPtr], #32
        ldp     q6, q7, [\stackPtr], #32
        ldp     q4, q5, [\stackPtr], #32
        ldp     q2, q3, [\stackPtr], #32
        ldp     q0, q1, [\stackPtr], #32
.endm

.macro PUSH_ALL_CPU_REGS stackPtr
        stp     x0, x1, [\stackPtr, #-16]!
        stp     x2, x3, [\stackPtr, #-16]!
        stp     x4, x5, [\stackPtr, #-16]!
        stp     x6, x7, [\stackPtr, #-16]!
        stp     x8, x9, [\stackPtr, #-16]!
        stp     x10, x11, [\stackPtr, #-16]!
        stp     x12, x13, [\stackPtr, #-16]!
        stp     x14, x15, [\stackPtr, #-16]!
        stp     x16, x17, [\stackPtr, #-16]!
        stp     x18, x19, [\stackPtr, #-16]!
        stp     x20, x21, [\stackPtr, #-16]!
        stp     x22, x23, [\stackPtr, #-16]!
        stp     x24, x25, [\stackPtr, #-16]!
        stp     x26, x27, [\stackPtr, #-16]!
        stp     x28, x29, [\stackPtr, #-16]!
        stp     x30, xzr, [\stackPtr, #-16]!
.endm

#elif defined(__GNUC__) && !defined(__ti__)

#define ti_sysbios_family_arm_gicv3_HwiMacros_disable(key)  \
    {                                                       \
        __asm__ __volatile__ (                              \
            "mrs %0, daif\n\t"                              \
            "msr daifset, #2"                               \
            : "=r" (key)                                    \
            :: "cc", "memory"                               \
        );                                                  \
    }

#define ti_sysbios_family_arm_gicv3_HwiMacros_enable(key)   \
    {                                                       \
        __asm__ __volatile__ (                              \
            "mrs %0, daif\n\t"                              \
            "msr daifclr, #2"                               \
            : "=r" (key)                                    \
            :: "cc", "memory"                               \
        );                                                  \
    }

#define ti_sysbios_family_arm_gicv3_HwiMacros_restore(key)  \
    {                                                       \
        __asm__ __volatile__ (                              \
            "and x2, %0, #128\n\t"                          \
            "mrs x1, daif\n\t"                              \
            "bic x1, x1, #128\n\t"                          \
            "orr x1, x1, x2\n\t"                            \
            "msr daif, x1"                                  \
            :: "r" (key)                                    \
            : "x1", "x2", "cc", "memory"                    \
        );                                                  \
    }

#endif /* __ASSEMBLER__ && __GNUC__ && !__ti__ */

#endif /* ti_sysbios_family_arm_gicv3_HwiMacros__include */

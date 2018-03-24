/*
 * Copyright (c) 2013-2014, Texas Instruments Incorporated
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

#ifdef __cplusplus
extern "C" {
#endif

#if defined(__ti__)

/*
 *  ======== Hwi_disable ========
 */
#define ti_sysbios_family_arm_a8_intcps_Hwi_disable() _disable_IRQ()

/*
 *  ======== Hwi_enable ========
 */
#define ti_sysbios_family_arm_a8_intcps_Hwi_enable() _enable_IRQ()

/*
 *  ======== Hwi_restore ========
 */
#define ti_sysbios_family_arm_a8_intcps_Hwi_restore(key) _restore_interrupts(key)

#else

/*
 *  ======== Hwi_disable ========
 */
static inline UInt ti_sysbios_family_arm_a8_intcps_Hwi_disable()
{
    UInt key;
    __asm__ __volatile__ (
            "mrs %0, cpsr_cf\n\t"
            "cpsid i"
            : "=r" (key)
            :: "cc", "memory"
            );
    return key;
}

/*
 *  ======== Hwi_enable ========
 */
static inline UInt ti_sysbios_family_arm_a8_intcps_Hwi_enable()
{
    UInt key;
    __asm__ __volatile__ (
            "mrs %0, cpsr_cf\n\t"
            "cpsie i"
            : "=r" (key)
            :: "cc", "memory"
            );
    return key;
}

/*
 *  ======== Hwi_restore ========
 */
static inline Void ti_sysbios_family_arm_a8_intcps_Hwi_restore(UInt key)
{
    __asm__ __volatile__ (
            "and r12, %0, #128\n\t"
            "mrs r0, cpsr_cf\n\t"
            "bic r0, r0, #128\n\t"
            "orr r12, r12, r0\n\t"
            "msr cpsr_cf, r12"
            :: "r" (key)
            : "r0", "r12", "cc", "memory"
            );
}

/*
 *  ======== _disable_FIQ ========
 */
static inline UInt _disable_FIQ()
{
    UInt key;
    __asm__ __volatile__ (
            "mrs %0, cpsr_cf\n\t"
            "cpsid f"
            : "=r" (key)
            :: "cc", "memory"
            );
    return key;
}

/*
 *  ======== _enable_FIQ ========
 */
static inline UInt _enable_FIQ()
{
    UInt key;
    __asm__ __volatile__ (
            "mrs %0, cpsr_cf\n\t"
            "cpsie f"
            : "=r" (key)
            :: "cc", "memory"
            );
    return key;
}

/*
 *  ======== _restore_FIQ ========
 */
static inline Void _restore_FIQ(UInt key)
{
    __asm__ __volatile__ (
            "and r12, %0, #64\n\t"
            "mrs r0, cpsr_cf\n\t"
            "bic r0, r0, #64\n\t"
            "orr r12, r12, r0\n\t"
            "msr cpsr_cf, r12"
            :: "r" (key)
            : "r0", "r12", "cc", "memory"
            );
}

#endif

#ifdef __cplusplus
}
#endif

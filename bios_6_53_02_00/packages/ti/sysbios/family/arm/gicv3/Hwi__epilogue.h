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

#ifdef __cplusplus
extern "C" {
#endif

#ifndef ti_sysbios_Build_useHwiMacros
/* Use function call implementations */

/*
 *  ======== Hwi_disable ========
 */
#define ti_sysbios_family_arm_gicv3_Hwi_disable() \
    ti_sysbios_family_arm_gicv3_Hwi_disableFxn()

/*
 *  ======== Hwi_enable ========
 */
#define ti_sysbios_family_arm_gicv3_Hwi_enable() \
    ti_sysbios_family_arm_gicv3_Hwi_enableFxn()

/*
 *  ======== Hwi_restore ========
 */
#define ti_sysbios_family_arm_gicv3_Hwi_restore(key) \
    ti_sysbios_family_arm_gicv3_Hwi_restoreFxn(key)

#else /* ti_sysbios_Build_useHwiMacros */

#include <ti/sysbios/family/arm/gicv3/HwiMacros.h>

/*
 *  ======== Hwi_disable ========
 */
static inline UInt ti_sysbios_family_arm_gicv3_Hwi_disable()
{
    UInt key;
    ti_sysbios_family_arm_gicv3_HwiMacros_disable(key);
    return (key);
}

/*
 *  ======== Hwi_enable ========
 */
static inline UInt ti_sysbios_family_arm_gicv3_Hwi_enable()
{
    UInt key;
    ti_sysbios_family_arm_gicv3_HwiMacros_enable(key);
    return (key);
}

/*
 *  ======== Hwi_restore ========
 */
static inline Void ti_sysbios_family_arm_gicv3_Hwi_restore(UInt key)
{
    ti_sysbios_family_arm_gicv3_HwiMacros_restore(key);
}
#endif /* !ti_sysbios_Build_useHwiMacros */

#define ti_sysbios_family_arm_gicv3_Hwi_disableIRQ() \
    ti_sysbios_family_arm_gicv3_Hwi_disable()

#define ti_sysbios_family_arm_gicv3_Hwi_enableIRQ() \
    ti_sysbios_family_arm_gicv3_Hwi_enable()

#define ti_sysbios_family_arm_gicv3_Hwi_restoreIRQ(key) \
    ti_sysbios_family_arm_gicv3_Hwi_restore(key)

#define ti_sysbios_family_arm_gicv3_Hwi_readSystemReg(regName, val)  \
    {                                                                \
        __asm__ __volatile__ (                                       \
            "mrs %0, " #regName                                      \
            : "=r" (val)                                             \
        );                                                           \
    }

#define ti_sysbios_family_arm_gicv3_Hwi_writeSystemReg(regName, val) \
    {                                                                \
        __asm__ __volatile__ (                                       \
            "msr " #regName ", %0"                                   \
            :: "r" (val)                                             \
        );                                                           \
    }

#ifdef __cplusplus
}
#endif

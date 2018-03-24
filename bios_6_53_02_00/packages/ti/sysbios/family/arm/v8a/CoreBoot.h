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
 *  ======== Core_boot.h ========
 */
#ifndef __TI_SYSBIOS_FAMILY_ARM_V8A_COREBOOT_H__
#define __TI_SYSBIOS_FAMILY_ARM_V8A_COREBOOT_H__

#define GIC_BASE_ADDR   ti_sysbios_family_arm_gicv3_Hwi_gicdBaseAddress__D
#define GICR_BASE_ADDR  ti_sysbios_family_arm_gicv3_Hwi_gicrBaseAddress__D
#define GICS_BASE_ADDR  (GICR_BASE_ADDR + 0x00010000)
#define GICX_OFFSET     0x00020000

#define icc_igrpen1_el3 s3_6_c12_c12_7
#define icc_pmr_el1     s3_0_c4_c6_0
#define icc_sre_el2     s3_4_c12_c9_5
#define icc_sre_el3     s3_6_c12_c12_5

.macro GICD_WRITE_LOOP x, y, offset
    str     w1, [x0, #\offset]
    .if \y-\x
    GICD_WRITE_LOOP "(\x+1)", \y, "(\offset+4)"
    .endif
.endm

.macro INIT_GICD_IGROUPR
    ldr     x0, =GIC_BASE_ADDR
    mvn     w1, wzr
    GICD_WRITE_LOOP 0, 31, 0x0080
.endm

.macro INIT_GICD_IGRPMODR
    ldr     x0, =GIC_BASE_ADDR
    mov     w1, wzr
    GICD_WRITE_LOOP 0, 31, 0x0D00
.endm

#endif /* __TI_SYSBIOS_FAMILY_ARM_V8A_COREBOOT_H__ */

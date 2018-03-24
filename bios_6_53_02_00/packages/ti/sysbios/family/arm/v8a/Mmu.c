/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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
 *  ======== Mmu.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>

#include "package/internal/Mmu.xdc.h"

/*
 *  ======== Mmu_startup ========
 */
Void Mmu_startup()
{
    UInt32 idx;
    UInt64 addr, desc;
    Mmu_DescriptorAttrs attrs;

    Mmu_initDescAttrs(&attrs);

    /* Device memory attributes for 0x0 - 0x3FFFFFFF address space */
    attrs.type = Mmu_DescriptorType_BLOCK;
    attrs.noExecute = TRUE;
    attrs.privNoExecute = FALSE;
    attrs.contiguous = FALSE;
    attrs.notGlobal = FALSE;
    attrs.accessFlag = TRUE;
    attrs.shareable = 0x2; /* Outer shareable */
    attrs.accPerm = 0x10; /* RW at EL1 only */
    attrs.nonSecure = TRUE;
    attrs.attrIndx = 0;

    desc = Mmu_initLevel1Desc(0x0, &attrs);
    Mmu_module->level1Table[0] = desc;

    /* Table pointer for 0x40000000 - 0x7FFFFFFF address space */
    attrs.type = Mmu_DescriptorType_TABLE;
    attrs.nsTable = FALSE;
    attrs.apTable = 0;
    attrs.xnTable = FALSE;
    attrs.pxnTable = FALSE;

    desc = Mmu_initLevel1Desc((UInt64)(&(Mmu_module->level2Table[0])), &attrs);
    Mmu_module->level1Table[1] = desc;

    /* Normal memory attributes for 0x80000000 - 0xFFFFFFFF address space */
    attrs.type = Mmu_DescriptorType_BLOCK;
    attrs.noExecute = TRUE;
    attrs.privNoExecute = FALSE;
    attrs.contiguous = FALSE;
    attrs.notGlobal = FALSE;
    attrs.accessFlag = TRUE;
    attrs.shareable = 0x2; /* Outer shareable */
    attrs.accPerm = 0x10; /* RW at EL1 only */
    attrs.nonSecure = TRUE;
    attrs.attrIndx = 1;

    desc = Mmu_initLevel1Desc(0x80000000, &attrs);
    Mmu_module->level1Table[2] = desc;
    desc = Mmu_initLevel1Desc(0xC0000000, &attrs);
    Mmu_module->level1Table[3] = desc;

    /* Device memory attributes for 0x40000000 - 0x6FFFFFFF address space */
    attrs.type = Mmu_DescriptorType_BLOCK;
    attrs.noExecute = TRUE;
    attrs.privNoExecute = FALSE;
    attrs.contiguous = FALSE;
    attrs.notGlobal = FALSE;
    attrs.accessFlag = TRUE;
    attrs.shareable = 0x2; /* Outer shareable */
    attrs.accPerm = 0x10; /* RW at EL1 only */
    attrs.nonSecure = TRUE;
    attrs.attrIndx = 0;

    for (idx = 0, addr = 0x40000000; addr < 0x70000000; idx++, addr+=0x200000) {
        desc = Mmu_initLevel2Desc(addr, &attrs);
        Mmu_module->level2Table[idx] = desc;
    }

    /* Normal memory attributes for 0x70000000 - 0x7FFFFFFF address space */
    attrs.type = Mmu_DescriptorType_BLOCK;
    attrs.noExecute = TRUE;
    attrs.privNoExecute = FALSE;
    attrs.contiguous = FALSE;
    attrs.notGlobal = FALSE;
    attrs.accessFlag = TRUE;
    attrs.shareable = 0x2; /* Outer shareable */
    attrs.accPerm = 0x10; /* RW at EL1 only */
    attrs.nonSecure = TRUE;
    attrs.attrIndx = 1;

    for (; addr < 0x80000000; idx++, addr+=0x200000) {
        desc = Mmu_initLevel2Desc(addr, &attrs);
        Mmu_module->level2Table[idx] = desc;
    }

    Mmu_setMAIR(0, 0x00);
    Mmu_setMAIR(1, 0x44);

    Mmu_init(&Mmu_module->level1Table[0]);
    Mmu_setTCR(0x19);

    if (Mmu_enableMMU) {
        Mmu_enable();
    }
}

/*
 *  ======== Mmu_initDescAttrs ========
 */
Void Mmu_initDescAttrs(Mmu_DescriptorAttrs *attrs)
{
    attrs->type = Mmu_defaultAttrs.type;
    attrs->nsTable = Mmu_defaultAttrs.nsTable;
    attrs->apTable = Mmu_defaultAttrs.apTable;
    attrs->xnTable = Mmu_defaultAttrs.xnTable;
    attrs->pxnTable = Mmu_defaultAttrs.pxnTable;
    attrs->noExecute = Mmu_defaultAttrs.noExecute;
    attrs->privNoExecute = Mmu_defaultAttrs.privNoExecute;
    attrs->contiguous = Mmu_defaultAttrs.contiguous;
    attrs->notGlobal = Mmu_defaultAttrs.notGlobal;
    attrs->accessFlag = Mmu_defaultAttrs.accessFlag;
    attrs->shareable = Mmu_defaultAttrs.shareable;
    attrs->accPerm = Mmu_defaultAttrs.accPerm;
    attrs->nonSecure = Mmu_defaultAttrs.nonSecure;
    attrs->attrIndx = Mmu_defaultAttrs.attrIndx;
    attrs->reserved = Mmu_defaultAttrs.reserved;
}

Void Mmu_enable()
{
    __asm__ __volatile__ (
        "mrs x0, SCTLR_EL1 \n\t"
        "orr x0, x0, #0x1 \n\t"
        "msr SCTLR_EL1, x0"
        ::: "x0", "memory"
    );
}

UInt64 Mmu_initLevel1Desc(UInt64 phyAddr, Mmu_DescriptorAttrs *attrs)
{
    UInt64 desc;

    if (attrs->type == Mmu_DescriptorType_BLOCK) {
        desc = ((UInt64)attrs->type & 0x3) |
               ((UInt64)(attrs->attrIndx & 0x7) << 2) |
               ((UInt64)(attrs->nonSecure & 0x1) << 5) |
               ((UInt64)(attrs->accPerm & 0x3) << 6) |
               ((UInt64)(attrs->shareable & 0x3) << 8) |
               ((UInt64)(attrs->accessFlag & 0x1) << 10) |
               ((UInt64)(attrs->notGlobal & 0x1) << 11) |
               ((UInt64)phyAddr & 0xFFFFFFFFC0000000) |
               ((UInt64)(attrs->contiguous & 0x1) << 52) |
               ((UInt64)(attrs->privNoExecute & 0x1) << 53) |
               ((UInt64)(attrs->noExecute & 0x1) << 54) |
               ((UInt64)(attrs->reserved & 0xF) << 55);
    }
    else {
        desc = ((UInt64)attrs->type & 0x3) |
               ((UInt64)phyAddr & 0xFFFFFFFFFFFFF000) |
               ((UInt64)(attrs->pxnTable & 0x1) << 59) |
               ((UInt64)(attrs->xnTable & 0x1) << 60) |
               ((UInt64)(attrs->apTable & 0x3) << 61) |
               ((UInt64)(attrs->nsTable & 0x1) << 63);
    }

    return (desc);
}

UInt64 Mmu_initLevel2Desc(UInt64 phyAddr, Mmu_DescriptorAttrs *attrs)
{
    UInt64 desc;

    if (attrs->type == Mmu_DescriptorType_BLOCK) {
        desc = ((UInt64)attrs->type & 0x3) |
               ((UInt64)(attrs->attrIndx & 0x7) << 2) |
               ((UInt64)(attrs->nonSecure & 0x1) << 5) |
               ((UInt64)(attrs->accPerm & 0x3) << 6) |
               ((UInt64)(attrs->shareable & 0x3) << 8) |
               ((UInt64)(attrs->accessFlag & 0x1) << 10) |
               ((UInt64)(attrs->notGlobal & 0x1) << 11) |
               ((UInt64)phyAddr & 0xFFFFFFFFFFE00000) |
               ((UInt64)(attrs->contiguous & 0x1) << 52) |
               ((UInt64)(attrs->privNoExecute & 0x1) << 53) |
               ((UInt64)(attrs->noExecute & 0x1) << 54) |
               ((UInt64)(attrs->reserved & 0xF) << 55);
    }
    else {
        desc = ((UInt64)attrs->type & 0x3) |
               ((UInt64)phyAddr & 0xFFFFFFFFFFFFF000) |
               ((UInt64)(attrs->pxnTable & 0x1) << 59) |
               ((UInt64)(attrs->xnTable & 0x1) << 60) |
               ((UInt64)(attrs->apTable & 0x3) << 61) |
               ((UInt64)(attrs->nsTable & 0x1) << 63);
    }

    return (desc);
}

Void Mmu_setMAIR(UInt8 idx, UInt16 attr)
{
    __asm__ __volatile__ (
        "lsl %0, %0, #3 \n\t"   /* 8 X idx */
        "lslv %1, %1, %0 \n\t"  /* attr << (8 X idx) */
        "mov x0, #0xFF \n\t"
        "lslv x0, x0, %0 \n\t"
        "mrs %0, MAIR_EL1 \n\t"
        "bic %0, %0, x0 \n\t"
        "orr %0, %0, %1 \n\t"
        "msr MAIR_EL1, %0"
        : "+r" (idx), "+r" (attr)
        :: "x0"
    );
}

Void Mmu_init(Ptr tableAddr)
{
    __asm__ __volatile__ (
        "msr TTBR0_EL1, %0"
        :: "r" (tableAddr)
        :
    );
}

Void Mmu_setTCR(UInt64 tcr)
{
    __asm__ __volatile__ (
        "msr TCR_EL1, %0"
        :: "r" (tcr)
        :
    );
}

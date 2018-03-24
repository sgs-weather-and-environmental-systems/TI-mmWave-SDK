/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== package.xdc ========
 *
 *
 *  The link below provides SYS/BIOS C28x register usage information:
 *
 *      {@link ./doc-files/c28regconv.html SYS/BIOS C28x Register Usage}
 *
 *! Open Issues:
 *  @p(blist)
 *      - System_printf() issue. Args need to be cast as UInt16
 *      - PLL not set ot 150MHz. Who whould do this? Gel OK?
 *      - Disable watchdog. Gel OK?
 *      - Hwi needs to be revisited wrt PIE
 *      - Task stack should be in lower memory. How to ensure?
 *      - Testcases need x28 specific config to build
 *      - UArg data type is different in SYS/BIOS 6 compared to DSP/BIOS 5.20.
 *      Old was Void *, New is intptr_t. Old was treated by codegen
 *      as a pointer and passed in XAR regs. New is treated as 32 bit 
 *      data and passed in ACC. Effects Task_glue().
 *  @p
 */

/*!
 *  ======== ti.sysbios.family.c28 ========
 *  Contains specifications for the C28 specific SYS/BIOS functions.
 *
 */
package ti.sysbios.family.c28.f28m35x [2,0,0,0]{
    module TimestampProvider;
}

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
 *  ======== ITI811X.xs ========
 *
 */

/*
 *  ======== ITI811X.getMemoryMap ========
 *  Returns the memory map as seen by a program running on this device
 *  when the registers are set as specified by the regs hash.
 */
function getMemoryMap(regs)
{
    if (regs != null && "l1PMode" in regs && regs.l1PMode != null) {
        if (this.$module.cacheSizeL1[regs.l1PMode] != undefined) {
            this.memMap["L1PSRAM"].len -=
                this.$module.cacheSizeL1[regs.l1PMode];
            if (this.memMap["L1PSRAM"].len == 0) {
                delete this.memMap["L1PSRAM"];
            }
        }
        else {
            throw new Error("Can't set L1P cache to size: " + regs.l1PMode);
        }
    }
    else {
        delete this.memMap["L1PSRAM"];
    }

    if (regs != null && "l1DMode" in regs && regs.l1DMode != null) {
        if (this.$module.cacheSizeL1[regs.l1DMode] != undefined) {
            this.memMap["L1DSRAM"].len -=
                this.$module.cacheSizeL1[regs.l1DMode];
            if (this.memMap["L1DSRAM"].len == 0) {
                delete this.memMap["L1DSRAM"];
            }
        }
        else {
            throw new Error("Can't set L1D cache to size: " + regs.l1DMode);
        }
    }
    else {
        delete this.memMap["L1DSRAM"];
    }

    if (regs != null && "l2Mode" in regs && regs.l2Mode != null) {
        if (this.$module.cacheSizeL2[regs.l2Mode] != undefined) {
            this.memMap["IRAM"].len -= this.$module.cacheSizeL2[regs.l2Mode];
            if (this.memMap["IRAM"].len == 0) {
                delete this.memMap["IRAM"];
            }
        }
        else {
            throw new Error("Can't set L2 cache to size: " + regs.l2Mode);
        }
    }

    return (this.memMap);
}

function instance$meta$init()
{
    var HDVICP2 = xdc.useModule("ti.catalog.peripherals.hdvicp2.HDVICP2");

    this.hdvicp0 = HDVICP2.create({ name: "HDVICP0", baseAddr: 0x58000000, intNum:94});
}

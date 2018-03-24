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
 *  ======== Mmu.xs ========
 */

var Mmu = null;
var Memory = null;
var Startup = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    Mmu = this;

    /* set fxntab default */
    Mmu.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Memory = xdc.module('xdc.runtime.Memory');
    Startup = xdc.useModule('xdc.runtime.Startup');

    Startup.firstFxns[Startup.firstFxns.length++] = Mmu.startup;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /*
     *  Place the first level table buffer into the specified section
     *  name. The table buffer must be aligned on a 4096 Byte boundary.
     */
    Memory.staticPlace(
                        mod.level1Table,
                        (Mmu.NUM_LEVEL1_ENTRIES * 8),
                        null
                      );

    /*
     *  Place the second level table buffer into the specified section
     *  name. The table buffer must be aligned on a 4096 Byte boundary.
     */
    Memory.staticPlace(
                        mod.level2Table,
                        (Mmu.NUM_LEVEL1_ENTRIES * 8),
                        null
                      );


    mod.level1Table.length = Mmu.NUM_LEVEL1_ENTRIES;
    mod.level2Table.length = Mmu.NUM_LEVEL1_ENTRIES;

    for (var i = 0; i < Mmu.NUM_LEVEL1_ENTRIES; i++) {
        mod.level1Table[i] = 0;
        mod.level2Table[i] = 0;
    }
}

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
 *  ======== PinMux.xs ========
 */

var PinMux = null;
/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    PinMux = this;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    var Program = xdc.useModule('xdc.cfg.Program');

    /* These registers are on all FR devices */
    PinMux.forceSetDefaultRegister.$add({ register : "p1sel0" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p1sel1" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p1out"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p1dir"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p1ren"  , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p1ies"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p1ifg"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p1ie"   , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p2out"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p2sel0" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p2sel1" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p2dir"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p2ren"  , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "p2ies"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p2ifg"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "p2ie"   , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "pjout"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "pjsel0" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "pjsel1" , regForceSet : false });
    PinMux.forceSetDefaultRegister.$add({ register : "pjdir"  , regForceSet : true  });
    PinMux.forceSetDefaultRegister.$add({ register : "pjren"  , regForceSet : false });

    /* Add the following registers for these devices */
    if (Program.cpu.deviceName.match(/^MSP430FR57(39|37|35|33|31|29|27|25|23|21)/i) ||
        Program.cpu.deviceName.match(/^MSP430FR5(9|8)/i)) {

        PinMux.forceSetDefaultRegister.$add({ register : "p3out"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p3sel0" , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p3sel1" , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p3dir"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p3ren"  , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p3ies"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p3ifg"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p3ie"   , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p4out"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p4sel0" , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p4sel1" , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p4dir"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p4ren"  , regForceSet : false });
        PinMux.forceSetDefaultRegister.$add({ register : "p4ies"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p4ifg"  , regForceSet : true  });
        PinMux.forceSetDefaultRegister.$add({ register : "p4ie"   , regForceSet : false });
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
}

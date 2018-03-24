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
 *  ======== SR.xs ========
 */
var GetSet;

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    // Activate getter/setter support on current instance
    GetSet.init(this);
    GetSet.init(this.SR);
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    // Get handle to getter/setter service
    GetSet = xdc.module("xdc.services.getset.GetSet");
}

/*
 *  ======== getSCG1 ========
 */
function getSCG1()
{
    var REGS = this.$module;
    if(this.SR.SCG1 == REGS.SCG1)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setSCG1 ========
 */
function setSCG1(set)
{
    var REGS = this.$module;
    if(set)
    {
        this.SR.SCG1 = REGS.SCG1;
    }
    else
    {
        this.SR.SCG1 = REGS.SCG1_OFF;
    }

    return set;
}

/*
 *  ======== getSCG0 ========
 */
function getSCG0()
{
    var REGS = this.$module;
    if(this.SR.SCG0 == REGS.SCG0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setSCG0 ========
 */
function setSCG0(set)
{
    var REGS = this.$module;

    if(set)
    {
        this.SR.SCG0 = REGS.SCG0;
    }
    else
    {
        this.SR.SCG0 = REGS.SCG0_OFF;
    }

    return set;
}

/*
 *  ======== getOSCOFF ========
 */
function getOSCOFF()
{
    var REGS = this.$module;
    if(this.SR.OSCOFF == REGS.OSCOFF)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setOSCOFF ========
 */
function setOSCOFF(set)
{
    var REGS = this.$module;

    if(set)
    {
        this.SR.OSCOFF = REGS.OSCOFF;
    }
    else
    {
        this.SR.OSCOFF = REGS.OSCOFF_OFF;
    }

    return set;
}

/*
 *  ======== getCPUOFF ========
 */
function getCPUOFF()
{
    var REGS = this.$module;
    if(this.SR.CPUOFF == REGS.CPUOFF)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setCPUOFF ========
 */
function setCPUOFF(set)
{
    var REGS = this.$module;

    if(set)
    {
        this.SR.CPUOFF = REGS.CPUOFF;
    }
    else
    {
        this.SR.CPUOFF = REGS.CPUOFF_OFF;
    }

    return set;
}

/*
 *  ======== getGIE ========
 */
function getGIE()
{
    var REGS = this.$module;
    if(this.SR.GIE == REGS.GIE)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setGIE ========
 */
function setGIE(set)
{
    var REGS = this.$module;

    if(set)
    {
        this.SR.GIE = REGS.GIE;
    }
    else
    {
        this.SR.GIE = REGS.GIE_OFF;
    }

    return set;
}

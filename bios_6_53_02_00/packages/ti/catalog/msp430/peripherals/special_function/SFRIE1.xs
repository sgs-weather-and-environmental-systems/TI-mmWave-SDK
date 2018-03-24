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
 *  ======== SFRIE1.xs ========
 */
var REGS;
var GetSet;
/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    REGS = this;
    GetSet = xdc.module("xdc.services.getset.GetSet");
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    // Activate getter/setter support on current instance
    GetSet.init(this);

    /* MSP430.xs defines all of the priority. JSON is not used because it overwrites the values from MSP430
     * instead of adding to the necessary name */
    this.interruptSource[0].registerName = "WDTIE";
    this.interruptSource[0].registerDescription = "WDT Interrupt Enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "OFIE";
    this.interruptSource[1].registerDescription = "Oscillator Fault Interrupt Enable";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "";
    this.interruptSource[2].registerDescription = "";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "VMAIE";
    this.interruptSource[3].registerDescription = "NMI Pin Interrupt Enable";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;

    this.interruptSource[4].registerName = "NMIIE";
    this.interruptSource[4].registerDescription = "NMI Pin Interrupt Enable";
    this.interruptSource[4].interruptEnable = false;
    this.interruptSource[4].interruptHandler = false;

    this.interruptSource[5].registerName = "ACCTEIE";
    this.interruptSource[5].registerDescription = "FRAM Access Time Error Interrupt Enable";
    this.interruptSource[5].interruptEnable = false;
    this.interruptSource[5].interruptHandler = false;

    this.interruptSource[6].registerName = "JMBINIE";
    this.interruptSource[6].registerDescription = "JTAG Mailbox Input Interrupt Enable";
    this.interruptSource[6].interruptEnable = false;
    this.interruptSource[6].interruptHandler = false;

    this.interruptSource[7].registerName = "JMBOUTIE";
    this.interruptSource[7].registerDescription = "JTAG Mailbox Output Interrupt Enable";
    this.interruptSource[7].interruptEnable = false;
    this.interruptSource[7].interruptHandler = false;
}



/*
 *  ======== getACCVIE ========
 */
function getSFRIE1(register)
{
    var REGS = this.$module;

    if(this.IE1.ACCVIE == REGS.ACCVIE)
    {
        return true;
    }
    else
    {
        return false;
    }
}

/*
 *  ======== setACCVIE ========
 */
function setSFRIE1(register, set)
{
    var REGS = this.$module;
    if(set)
    {
        this.IE1.ACCVIE = REGS.ACCVIE;
    }
    else
    {
        this.IE1.ACCVIE = REGS.ACCVIE_OFF;
    }

    return set;
}

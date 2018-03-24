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
 *  ======== IE2.xs ========
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
    GetSet.init(this.IE2);

    /* save "this" for use inside setter */
    var inst = this;
    var group = GetSet.createGroup();

    this.interruptSource[0].registerName = "UCA0RXIE for UART";
    this.interruptSource[0].registerDescription = "USCI_A0 UART receive interrupt enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "UCA0TXIE for UART";
    this.interruptSource[1].registerDescription = "USCI_A0 UART transmit interrupt enable";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "UCA0RXIE for SPI";
    this.interruptSource[2].registerDescription = "USCI_A0 SPI receive interrupt enable";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "UCA0TXIE for SPI";
    this.interruptSource[3].registerDescription = "USCI_A0 SPI transmit interrupt enable";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;

    this.interruptSource[4].registerName = "UCB0RXIE for SPI";
    this.interruptSource[4].registerDescription = "USCI_B0 SPI receive interrupt enable";
    this.interruptSource[4].interruptEnable = false;
    this.interruptSource[4].interruptHandler = false;

    this.interruptSource[5].registerName = "UCB0TXIE for SPI";
    this.interruptSource[5].registerDescription = "USCI_B0 SPI transmit interrupt enable";
    this.interruptSource[5].interruptEnable = false;
    this.interruptSource[5].interruptHandler = false;

    this.interruptSource[6].registerName = "UCB0RXIE for I2C";
    this.interruptSource[6].registerDescription = "USCI_B0 I2C receive interrupt enable";
    this.interruptSource[6].interruptEnable = false;
    this.interruptSource[6].interruptHandler = false;

    this.interruptSource[7].registerName = "UCB0TXIE for I2C";
    this.interruptSource[7].registerDescription = "USCI_B0 I2C transmit interrupt enable";
    this.interruptSource[7].interruptEnable = false;
    this.interruptSource[7].interruptHandler = false;

    function monitorUcb0TxIe() {
        if (inst.IE2.UCB0TXIE == REGS.UCB0TXIE) {
            inst.IFG2.UCB0TXIFG = REGS.UCB0TXIFG;
        }
        else {
            inst.IFG2.UCB0TXIFG = REGS.UCB0TXIFG_OFF;
        }
    }
    group.onSet(inst.IE2, "UCB0TXIE", monitorUcb0TxIe);

    function monitorUcb0RxIe() {
        if (inst.IE2.UCB0RXIE == REGS.UCB0RXIE) {
            inst.IFG2.UCB0RXIFG = REGS.UCB0RXIFG;
        }
        else {
            inst.IFG2.UCB0RXIFG = REGS.UCB0RXIFG_OFF;
        }
    }
    group.onSet(inst.IE2, "UCB0RXIE", monitorUcb0RxIe);

    function monitorUca0TxIe() {
        if (inst.IE2.UCA0TXIE == REGS.UCA0TXIE) {
            inst.IFG2.UCA0TXIFG = REGS.UCA0TXIFG;
        }
        else {
            inst.IFG2.UCA0TXIFG = REGS.UCA0TXIFG_OFF;
        }
    }
    group.onSet(inst.IE2, "UCA0TXIE", monitorUca0TxIe);

    function monitorUca0RxIe() {
        if (inst.IE2.UCA0RXIE == REGS.UCA0RXIE) {
            inst.IFG2.UCA0RXIFG = REGS.UCA0RXIFG;
        }
        else {
            inst.IFG2.UCA0RXIFG = REGS.UCA0RXIFG_OFF;
        }
    }
    group.onSet(inst.IE2, "UCA0RXIE", monitorUca0RxIe);
}

/*
 *  ======== getUCB0TXIE ========
 */
function getUCB0TXIE()
{
    var REGS = this.$module;
    if (this.IE2.UCB0TXIE == REGS.UCB0TXIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCB0TXIE ========
 */
function setUCB0TXIE(set)
{
    var REGS = this.$module;

    if (set) {
        this.IE2.UCB0TXIE = REGS.UCB0TXIE;
    }
    else {
        this.IE2.UCB0TXIE = REGS.UCB0TXIE_OFF;
    }

    return set;
}

/*
 *  ======== getUCB0RXIE ========
 */
function getUCB0RXIE()
{
    var REGS = this.$module;
    if (this.IE2.UCB0RXIE == REGS.UCB0RXIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCB0RXIE ========
 */
function setUCB0RXIE(set)
{
    var REGS = this.$module;

    if (set) {
        this.IE2.UCB0RXIE = REGS.UCB0RXIE;
    }
    else {
        this.IE2.UCB0RXIE = REGS.UCB0RXIE_OFF;
    }

    return set;
}

/*
 *  ======== getUCA0TXIE ========
 */
function getUCA0TXIE()
{
    var REGS = this.$module;
    if (this.IE2.UCA0TXIE == REGS.UCA0TXIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCA0TXIE ========
 */
function setUCA0TXIE(set)
{
    var REGS = this.$module;

    if (set) {
        this.IE2.UCA0TXIE = REGS.UCA0TXIE;
    }
    else {
        this.IE2.UCA0TXIE = REGS.UCA0TXIE_OFF;
    }

    return set;
}

/*
 *  ======== getUCA0RXIE ========
 */
function getUCA0RXIE()
{
    var REGS = this.$module;
    if (this.IE2.UCA0RXIE == REGS.UCA0RXIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCA0RXIE ========
 */
function setUCA0RXIE(set)
{
    var REGS = this.$module;

    if (set) {
        this.IE2.UCA0RXIE = REGS.UCA0RXIE;
    }
    else {
        this.IE2.UCA0RXIE = REGS.UCA0RXIE_OFF;
    }

    return set;
}

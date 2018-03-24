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
 *  ======== getMemoryMap ========
 *  Returns the memory map as seen by a program running on this device
 *  when the registers are set as specified by the regs hash.
 */
function getMemoryMap(regs)
{
    /* add common memory blocks to this device's memory map */
    for (var key in this.commonMap) {
        this.memMap[key] = this.commonMap[key];
    }
    return (this.memMap);
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
//    var Clock = xdc.useModule("ti.catalog.msp430.peripherals.clock.UCS");
    var Timer_A3 = xdc.useModule("ti.catalog.msp430.peripherals.timer.Timer1_A3");
    var TimerA5 = xdc.useModule("ti.catalog.msp430.peripherals.timer.Timer0_A5");
    var TimerB7 = xdc.useModule("ti.catalog.msp430.peripherals.timer.Timer0_B7");
    var IE1 = xdc.useModule("ti.catalog.msp430.peripherals.special_function.IE1");
    var IC = xdc.useModule("ti.catalog.msp430.peripherals.interrupt."
        + "Interrupt_Controller");
    var WdtPlus =
        xdc.useModule("ti.catalog.msp430.peripherals.watchdog.WDTplus");

    var ie1 = IE1.create({name: "interruptEnableRegister1"});
    var clock; // = Clock.create(ie1, {name: "clock", baseAddr: 0x160});
               // TODO: 5xx devices need the UCS clock system

    this.TA0 = TimerA5.create(
        clock, {name: "TA0", baseAddr: 0x340, intNum: 54}
    );
    this.TA1 = Timer_A3.create(
        clock, {name: "TA1", baseAddr: 0x380, intNum: 49}
    );
    this.TB0 = TimerB7.create(
        clock, {name: "TB0", baseAddr: 0x3C0, intNum: 60}
    );
    this.interruptController = IC.create(
        {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64});
    this.wdtPlus = WdtPlus.create(clock,
        {name: "watchdog", baseAddr: 0x15c});
}

/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
 *  ======== TimerSupport.xs ========
 *
 */

var Wugen = null;
var Timer = null;
var TimerSupport = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    TimerSupport = this;

    if ((Program.cpu.deviceName == "Vayu") ||
        (Program.cpu.deviceName == "DRA7XX")) {
        if (Program.build.target.name == "C66") {
            TimerSupport.availMask = 0x0030;
        }
        else if (Program.build.target.name == "M4") {
            TimerSupport.availMask = 0x050C;
        }
        else if (Program.build.target.name == "A15F") {
            TimerSupport.availMask = 0x0202;
        }
        else if ((Program.build.target.name == "ARP32") ||
                 (Program.build.target.name == "ARP32_far")) {
            TimerSupport.availMask = 0x00C0;
        }
    }
    else if (Program.cpu.deviceName == "TDA3XX") {
        if (Program.build.target.name == "C66") {
            TimerSupport.availMask = 0x03;
        }
        else if (Program.build.target.name == "M4") {
            TimerSupport.availMask = 0x0C;
        }
        else if ((Program.build.target.name == "ARP32") ||
                 (Program.build.target.name == "ARP32_far")) {
            TimerSupport.availMask = 0x00C0;
        }
    }

    if (Program.build.target.name == "M3") {
        TimerSupport.$logFatal("Target " + Program.build.target.name +
                               " is not supported!", this);
    }

    var GetSet = xdc.module("xdc.services.getset.GetSet");
    GetSet.onSet(this, "availMask", _setTimerAvailMask);

    /* set fxntab default */
    TimerSupport.common$.fxntab = false;
}


/*
 *  ======== module$use ========
 */
function module$use()
{
    if (((Program.build.target.name != "C66") &&
         (Program.build.target.name != "ARP32") &&
         (Program.build.target.name != "ARP32_far") &&
         (Program.build.target.name != "M4") &&
         (Program.build.target.name != "A15F")) ||
        ((Program.cpu.deviceName == "TDA3XX") &&
         (Program.build.target.name == "A15F"))) {
        TimerSupport.$logFatal("Target " + Program.build.target.name +
                               " is not supported!", this);
    }

    Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');

    if (Program.build.target.name == "M4") {
        Wugen = xdc.useModule('ti.sysbios.family.arm.ducati.Wugen');
    }

    if ((Program.build.target.name == "ARP32") ||
        (Program.build.target.name == "ARP32_far")) {
	var IntXbar = xdc.useModule('ti.sysbios.family.shared.vayu.IntXbar');
        IntXbar.connectIRQMeta(5, 38);
        IntXbar.connectIRQMeta(6, 39);
    }
}

/*
 *  ======== getAnyMask ========
 *  Return anyMask for this device.
 */
function getAnyMask()
{
    return (TimerSupport.availMask);
}

/*
 *  ======== getAvailMask ========
 *  Return availMask for this device.
 */
function getAvailMask()
{
    return (TimerSupport.availMask);
}


/*
 *  ======== _setTimerAvailMask ========
 *  The "real-time" setter setTimerAvailMask function
 *
 *  This function is called whenever a15TimerAvailMask,
 *  dspTimerAvailMask or ipuTimerAvailMask changes.
 */
function _setTimerAvailMask(field, val)
{
    var DMTimer = xdc.module('ti.sysbios.timers.dmtimer.Timer');
    var timerAvailMask = val;

    for (var realInst in DMTimer.$instances) {
        var inst = DMTimer.$instances[realInst];
        var mask = 0x1 << inst.$object.id;
        if (timerAvailMask & mask) {
            timerAvailMask = timerAvailMask & (~mask);
        }
        else {
            this.$logFatal("Timer device unavailable.", DMTimer);
        }
    }

    /* Update DMTimer availMask */
    DMTimer.$object.availMask = timerAvailMask;

    /*
     * If anyMask has not yet been configured by user, we
     * need to initialize it with the new availMask.
     */
    if (!DMTimer.$written("anyMask")) {
        DMTimer.anyMask = timerAvailMask;
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var TimerSupport = xdc.useModule('ti.sysbios.family.shared.vayu.TimerSupport');
    var TimerSupportConfig = Program.getModuleConfig(TimerSupport.$name);

    /*
     *  Construct 'availMask' ROV field
     *
     *  Convert Available Mask into a string.  Goal here is to display
     *  Available Mask in binary, showing bits in groups of four separated
     *  by spaces and ending with "b".  For example, the binary mask '1110'
     *  should be displayed as:
     *
     *      0000 0000 0000 1110b
     *
     */
    view.availMask =
        Number(TimerSupportConfig.availMask).toString(2);
}

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
 *  ======== Settings.xs ========
 *
 */

/*
 * All arp32 devices use the ARP32 settings
 */

var settings = {
    device: {
        "ARP32": {
            hwiDelegate : "ti.sysbios.family.arp32.Hwi",
            timerDelegate : "ti.sysbios.family.arp32.Timer",
            clockTimerDelegate : "ti.sysbios.family.arp32.Timer",
            benchDelegate : "ti.sysbios.family.arp32.TimestampProvider",
            taskSupportDelegate : "ti.sysbios.family.arp32.TaskSupport",
            intrinsicsSupportDelegate : "ti.sysbios.family.arp32.IntrinsicsSupport",
            cacheDelegate : "ti.sysbios.family.arp32.Cache",
            clockTickPeriod : 1000
        }
    }
}

/*
 *  ======== getDefaultCoreDelegate ========
 */
function getDefaultCoreDelegate()
{
    return (null);
}

/*
 *  ======== getDefaultHwiDelegate ========
 */
function getDefaultHwiDelegate()

{
    return ("ti.sysbios.family.arp32.Hwi");
}

/*
 *  ======== getDefaultTimerDelegate ========
 */
function getDefaultTimerDelegate()
{
    return("ti.sysbios.family.arp32.Timer");
}

/*
 *  ======== getDefaultTimerSupportDelegate ========
 */
function getDefaultTimerSupportDelegate()
{
    /*
     *  The default arp32 Timer does not use nor have a TimerSupport module.
     *  This TimerSupport module is needed when the user decides to use
     *  the dmtimer.
     */
    return("ti.sysbios.family.shared.vayu.TimerSupport");
}

/*
 *  ======== getDefaultClockTimerDelegate ========
 */
function getDefaultClockTimerDelegate()
{
    return("ti.sysbios.family.arp32.Timer");
}

/*
 *  ======== getDefaultTimestampDelegate ========
 */
function getDefaultTimestampDelegate()
{
    return("ti.sysbios.family.arp32.TimestampProvider");
}

/*
 *  ======== getDefaultTaskSupportDelegate ========
 */
function getDefaultTaskSupportDelegate()
{
    return("ti.sysbios.family.arp32.TaskSupport");
}

/*
 *  ======== getDefaultIntrinsicsSupportDelegate ========
 */
function getDefaultIntrinsicsSupportDelegate()
{
    return("ti.sysbios.family.arp32.IntrinsicsSupport");
}

/*
 *  ======== getDefaultCacheDelegate ========
 */
function getDefaultCacheDelegate()
{
    return ("ti.sysbios.hal.CacheNull");
}

/*
 *  ======== getDefaultPowerDelegate ========
 */
function getDefaultPowerDelegate()
{
    return ("ti.sysbios.hal.PowerNull");
}

/*
 *  ======== getDefaultSecondsDelegate ========
 */
function getDefaultSecondsDelegate()
{
    return (null);
}

/*
 *  ======== getDefaultBootModule ========
 */
function getDefaultBootModule()
{
    return (null);
}

/*
 *  ======== getDefaultMmuModule ========
 */
function getDefaultMmuModule()
{
    return (null);
}

/*
 *  ======== getDefaultClockTickPeriod ========
 */
function getDefaultClockTickPeriod()
{
    return(1000);
}

/*
 *  ======== getFamilySettingsXml ========
 */
function getFamilySettingsXml()
{
    return("family/arp32/Settings.xml");
}

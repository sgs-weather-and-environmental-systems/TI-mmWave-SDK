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
 */

var settings = {
    device: {
        "MSP430F5438": {
            hwiDelegate : "ti.sysbios.family.msp430.Hwi",
            timerDelegate : "ti.sysbios.family.msp430.Timer",
            clockTimerDelegate : "ti.sysbios.family.msp430.Timer",
            timestampDelegate : "ti.sysbios.family.msp430.TimestampProvider",
            taskSupportDelegate : "ti.sysbios.family.msp430.TaskSupport",
            intrinsicsSupportDelegate : "ti.sysbios.family.msp430.IntrinsicsSupport",
            cacheDelegate : null,
            powerDelegate : "ti.sysbios.family.msp430.Power",
            coreDelegate : null,
            clockTickPeriod : 1000,
            targets : [ "ti.targets.msp430.MSP430", "ti.targets.msp430.MSP430X",
                        "ti.targets.msp430.elf.MSP430",
                        "ti.targets.msp430.elf.MSP430X" ]
        },
/*
        "MSP430F2274": {
            hwiDelegate : "ti.sysbios.family.msp430.Hwi",
            timerDelegate : "ti.sysbios.family.msp430.Timer",
            clockTimerDelegate : "ti.sysbios.family.msp430.Timer",
            timestampDelegate : "ti.sysbios.family.msp430.TimestampProvider",
            taskSupportDelegate : "ti.sysbios.family.msp430.TaskSupport",
            intrinsicsSupportDelegate : "ti.sysbios.family.msp430.IntrinsicsSupport",
            cacheDelegate : null,
            coreDelegate : null,
            clockTickPeriod : 1000,
            targets : [ "ti.targets.msp430.MSP430" ]
        },
*/
    }

}

/*
settings.device["MSP430F2232"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2234"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2252"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2254"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2272"]   = settings.device["MSP430F2274"]; 

settings.device["MSP430F233"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2330"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F235"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2350"]   = settings.device["MSP430F2274"]; 
settings.device["MSP430F2370"]   = settings.device["MSP430F2274"]; 

settings.device["MSP430F435"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F4351"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F436"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F4361"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F437"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F4371"]   = settings.device["MSP430F5438"]; 
*/

settings.device["MSP430F5418"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5418a"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5419"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5419a"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5435"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5435a"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5436"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5436a"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5437"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5437a"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5438a"]   = settings.device["MSP430F5438"]; 

/*
settings.device["MSP430F5510"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5513"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5514"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5515"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5517"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5519"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5521"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5522"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5524"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5525"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5526"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5527"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5528"]   = settings.device["MSP430F5438"]; 
settings.device["MSP430F5529"]   = settings.device["MSP430F5438"]; 
*/

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
    return ("ti.sysbios.family.msp430.Hwi");
}

/*
 *  ======== getDefaultTimerDelegate ========
 */
function getDefaultTimerDelegate()
{
    return ("ti.sysbios.family.msp430.Timer");
}

/*
 *  ======== getDefaultClockTimerDelegate ========
 */
function getDefaultClockTimerDelegate()
{
    return ("ti.sysbios.family.msp430.Timer");
}

/*
 *  ======== getDefaultTimerSupportDelegate ========
 */
function getDefaultTimerSupportDelegate()
{
    return (null);
}

/*
 *  ======== getDefaultTimestampDelegate ========
 */
function getDefaultTimestampDelegate()
{
    return ("ti.sysbios.family.msp430.TimestampProvider");
}

/*
 *  ======== getDefaultTaskSupportDelegate ========
 */
function getDefaultTaskSupportDelegate()
{
    return ("ti.sysbios.family.msp430.TaskSupport");
}

/*
 *  ======== getDefaultIntrinsicsSupportDelegate ========
 */
function getDefaultIntrinsicsSupportDelegate()
{
    return ("ti.sysbios.family.msp430.IntrinsicsSupport");
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
    return ("ti.sysbios.family.msp430.Power");
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
    return ("ti.catalog.msp430.init.Boot");
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
    return (1000);
}

/*
 *  ======== getFamilySettingsXml ========
 */
function getFamilySettingsXml()
{
    return("family/msp430/Settings.xml");
}

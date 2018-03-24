/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 * functions referenced in the ROM but not in the ROM
 */

var ROM = xdc.useModule('ti.sysbios.rom.ROM');

ROM.generatedFuncs.$add("xdc_runtime_Startup_getState__I");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_Module__startupDone__S");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_abort__E");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_exit__E");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_flush__E");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_putch__E");
ROM.generatedFuncs.$add("xdc_runtime_System_SupportProxy_ready__E");

/* surgically excluded funcs */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_start__E"); /* calls driverlib inlined funcs */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_initDevice__I"); /* calls driverlib inlined funcs */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_setThreshold__I"); /* is always undergoing repairs */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_setNextTick__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_getMaxTicks__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_getCount64__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_dynamicStub__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_Timer_getCurrentTick__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_family_arm_cc26xx_TimestampProvider_get32__E"); /* calls rts lib uldiv */
ROM.excludedFuncs.$add("ti_sysbios_knl_Clock_workFuncDynamic__E"); /* not stable for ROM */

var CC26xx = xdc.module("ti.sysbios.rom.cortexm.cc26xx.CC26xx");
/* driverlib APIs */
CC26xx.otherLibFuncs.$add("NOROM_AONRTCChannelEnable");
CC26xx.otherLibFuncs.$add("NOROM_AONRTCCompareValueSet");
CC26xx.otherLibFuncs.$add("NOROM_AONRTCCurrentCompareValueGet");
CC26xx.otherLibFuncs.$add("NOROM_AONRTCEventClear");

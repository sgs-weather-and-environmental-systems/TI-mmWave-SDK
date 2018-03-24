/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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

/* proxy module APIs invoked from within ROM */
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_create");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_delete");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getCount__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getCurrentTick__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getExpiredCounts__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getExpiredTicks__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getFreq__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getFunc__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getMaxTicks__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getNumTimers__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getPeriod__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_getStatus__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_Module__startupDone__S");
ROM.generatedFuncs.$add("null"); /* was ti_sysbios_hal_Timer_TimerProxy_Object__create__S */
ROM.generatedFuncs.$add("null"); /* was ti_sysbios_hal_Timer_TimerProxy_Object__delete__S */
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_setFunc__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_setNextTick__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_setPeriod__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_setPeriodMicroSecs__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_start__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_startup__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_stop__E");
ROM.generatedFuncs.$add("ti_sysbios_hal_Timer_TimerProxy_trigger__E");

ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_getCurrentTick__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_getMaxTicks__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_getNumTimers__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_getPeriod__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_getStatus__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_Module__startupDone__S");
ROM.generatedFuncs.$add("null"); /* was ti_sysbios_knl_Clock_TimerProxy_Object__delete__S */
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_setNextTick__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_setPeriodMicroSecs__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_start__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_stop__E");
ROM.generatedFuncs.$add("ti_sysbios_knl_Clock_TimerProxy_startup__E");

/* c28 Hwi module generated APIs */
ROM.generatedFuncs.$add("ti_sysbios_family_c28_Hwi_startup__E");
ROM.generatedFuncs.$add("ti_sysbios_family_c28_Hwi_enableIER__E");
ROM.generatedFuncs.$add("ti_sysbios_family_c28_Hwi_disableIER__E");
ROM.generatedFuncs.$add("ti_sysbios_family_c28_Hwi_restoreIER__E");

/* xdc runtime APIs invoked within ROM */
ROM.generatedFuncs.$add("xdc_runtime_Error_check__E");
ROM.generatedFuncs.$add("xdc_runtime_Error_raiseX__E");
ROM.generatedFuncs.$add("xdc_runtime_Memory_alloc__E");
ROM.generatedFuncs.$add("xdc_runtime_Memory_calloc__E");
ROM.generatedFuncs.$add("xdc_runtime_Memory_free__E");
ROM.generatedFuncs.$add("xdc_runtime_Memory_getMaxDefaultTypeAlign__E");
ROM.generatedFuncs.$add("xdc_runtime_System_exit__E");
ROM.generatedFuncs.$add("xdc_runtime_Core_assignLabel__I"); 
ROM.generatedFuncs.$add("xdc_runtime_Core_assignParams__I"); 
ROM.generatedFuncs.$add("xdc_runtime_Core_constructObject__I"); 
ROM.generatedFuncs.$add("xdc_runtime_Core_createObject__I"); 
ROM.generatedFuncs.$add("xdc_runtime_Core_deleteObject__I");

/* surgically excluded funcs */
ROM.excludedFuncs.$add("ti_sysbios_family_c28_Timer_setPeriodMicroSecs__E"); /* calls rts lib uldiv */

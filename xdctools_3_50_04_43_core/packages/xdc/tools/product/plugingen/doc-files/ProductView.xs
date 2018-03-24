/* 
 * Copyright (c) 2010, Texas Instruments Incorporated
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
 * */
/*
 *  ======== ProductView.xs ========
 *
 */

/* Scheduling elements */

var ProdQuery;
function module$meta$init()
{
    
/* Modules */

/* System Providers Sub Group Modules */

    this.xdc_runtime_SysMin.elemName = "SysMin";
    this.xdc_runtime_SysMin.moduleName = "xdc.runtime.SysMin";
    this.xdc_runtime_SysMin.iconFileName = "icons/sys.ico";

    this.xdc_runtime_SysStd.elemName = "SysStd";
    this.xdc_runtime_SysStd.moduleName = "xdc.runtime.SysStd";
    this.xdc_runtime_SysStd.iconFileName = "icons/sys.ico";

/* System Group Modules */

    this.ti_sysbios_BIOS.elemName = "BIOS";
    this.ti_sysbios_BIOS.moduleName = "ti.sysbios.BIOS";
    this.ti_sysbios_BIOS.iconFileName = "icons/gbl.ico";

    this.xdc_cfg_Program.elemName = "Program";
    this.xdc_cfg_Program.moduleName = "xdc.cfg.Program";
    this.xdc_cfg_Program.iconFileName = "icons/cfg.ico";

    this.xdc_runtime_Main.elemName = "Main";
    this.xdc_runtime_Main.moduleName = "xdc.runtime.Main";
    this.xdc_runtime_Main.iconFileName = "icons/cfg.ico";

    this.xdc_runtime_Defaults.elemName = "Defaults";
    this.xdc_runtime_Defaults.moduleName = "xdc.runtime.Defaults";
    this.xdc_runtime_Defaults.iconFileName = "icons/prj.ico";
        
    this.xdc_runtime_System.elemName = "System";
    this.xdc_runtime_System.moduleName = "xdc.runtime.System";
    this.xdc_runtime_System.iconFileName = "icons/sys.ico";

    this.xdc_runtime_Startup.elemName = "Startup";
    this.xdc_runtime_Startup.moduleName = "xdc.runtime.Startup";
    this.xdc_runtime_Startup.iconFileName = "icons/ACCEL.ico";

/* Loggers Sub Group Modules */

    this.xdc_runtime_LoggerBuf.elemName = "LoggerBuf";
    this.xdc_runtime_LoggerBuf.moduleName = "xdc.runtime.LoggerBuf";
    this.xdc_runtime_LoggerBuf.iconFileName = "icons/log.ico";

    this.xdc_runtime_LoggerSys.elemName = "LoggerSys";
    this.xdc_runtime_LoggerSys.moduleName = "xdc.runtime.LoggerSys";
    this.xdc_runtime_LoggerSys.iconFileName = "icons/log.ico";

/* Diagnostics Group Modules */

    this.xdc_runtime_Log.elemName = "Log";
    this.xdc_runtime_Log.moduleName = "xdc.runtime.Log";
    this.xdc_runtime_Log.iconFileName = "icons/log.ico";
    
    this.ti_sysbios_rta_Agent.elemName = "RTA Agent";
    this.ti_sysbios_rta_Agent.moduleName = "ti.sysbios.rta.Agent";
    this.ti_sysbios_rta_Agent.iconFileName = "icons/log.ico";

    this.ti_rtdx_RtdxModule.elemName = "RTDX Module";             
    this.ti_rtdx_RtdxModule.moduleName = "ti.rtdx.RtdxModule";
    this.ti_rtdx_RtdxModule.iconFileName = "icons/log.ico";     

    this.ti_rtdx_driver_RtdxDvr.elemName = "RTDX Driver";             
    this.ti_rtdx_driver_RtdxDvr.moduleName = "ti.rtdx.driver.RtdxDvr";
    this.ti_rtdx_driver_RtdxDvr.iconFileName = "icons/log.ico";     

    this.xdc_runtime_Assert.elemName = "Assert";
    this.xdc_runtime_Assert.moduleName = "xdc.runtime.Assert";
    this.xdc_runtime_Assert.iconFileName = "icons/hwi.ico";

    this.xdc_runtime_Diags.elemName = "Diags";
    this.xdc_runtime_Diags.moduleName = "xdc.runtime.Diags";
    this.xdc_runtime_Diags.iconFileName = "icons/sts.ico";

    this.xdc_runtime_Error.elemName = "Error";
    this.xdc_runtime_Error.moduleName = "xdc.runtime.Error";
    this.xdc_runtime_Error.iconFileName = "icons/hwi.ico";

    this.xdc_runtime_Timestamp.elemName = "Timestamp";
    this.xdc_runtime_Timestamp.moduleName = "xdc.runtime.Timestamp";
    this.xdc_runtime_Timestamp.iconFileName = "icons/rtc.ico";

/* Heaps Sub Group Modules */

    this.xdc_runtime_HeapMin.elemName = "HeapMin";
    this.xdc_runtime_HeapMin.moduleName = "xdc.runtime.HeapMin";
    this.xdc_runtime_HeapMin.iconFileName = "icons/mem.ico";

    this.xdc_runtime_HeapStd.elemName = "HeapStd";
    this.xdc_runtime_HeapStd.moduleName = "xdc.runtime.HeapStd";
    this.xdc_runtime_HeapStd.iconFileName = "icons/mem.ico";

    this.ti_sysbios_heaps_HeapMem.elemName = "HeapMem";
    this.ti_sysbios_heaps_HeapMem.moduleName = "ti.sysbios.heaps.HeapMem";
    this.ti_sysbios_heaps_HeapMem.iconFileName = "icons/mem.ico";

    this.ti_sysbios_heaps_HeapBuf.elemName = "HeapBuf";
    this.ti_sysbios_heaps_HeapBuf.moduleName = "ti.sysbios.heaps.HeapBuf";
    this.ti_sysbios_heaps_HeapBuf.iconFileName = "icons/mem.ico";

    this.ti_sysbios_heaps_HeapMultiBuf.elemName = "HeapMultiBuf";
    this.ti_sysbios_heaps_HeapMultiBuf.moduleName =
        "ti.sysbios.heaps.HeapMultiBuf";
    this.ti_sysbios_heaps_HeapMultiBuf.iconFileName = "icons/mem.ico";

/* Memory Management Group Modules */

    this.ti_sysbios_hal_Cache.elemName = "Cache";
    this.ti_sysbios_hal_Cache.moduleName = "ti.sysbios.hal.Cache";
    this.ti_sysbios_hal_Cache.iconFileName = "icons/mem.ico";

    this.xdc_runtime_Memory.elemName = "Memory";
    this.xdc_runtime_Memory.moduleName = "xdc.runtime.Memory";
    this.xdc_runtime_Memory.iconFileName = "icons/mem.ico";

/* Scheduling Group Modules */

    this.ti_sysbios_knl_Task.elemName = "Task";
    this.ti_sysbios_knl_Task.moduleName = "ti.sysbios.knl.Task";
    this.ti_sysbios_knl_Task.iconFileName = "icons/tsk.ico";

    this.ti_sysbios_knl_Swi.elemName = "Swi";
    this.ti_sysbios_knl_Swi.moduleName = "ti.sysbios.knl.Swi";
    this.ti_sysbios_knl_Swi.iconFileName = "icons/swi.ico";

    this.ti_sysbios_hal_Hwi.elemName = "Hwi";
    this.ti_sysbios_hal_Hwi.moduleName = "ti.sysbios.hal.Hwi";
    this.ti_sysbios_hal_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_knl_Idle.elemName = "Idle";
    this.ti_sysbios_knl_Idle.moduleName = "ti.sysbios.knl.Idle";
    this.ti_sysbios_knl_Idle.iconFileName = "icons/idl.ico";

    this.ti_sysbios_knl_Clock.elemName = "Clock";
    this.ti_sysbios_knl_Clock.moduleName = "ti.sysbios.knl.Clock";
    this.ti_sysbios_knl_Clock.iconFileName = "icons/clk.ico";

    this.ti_sysbios_hal_Timer.elemName = "Timer";
    this.ti_sysbios_hal_Timer.moduleName = "ti.sysbios.hal.Timer";
    this.ti_sysbios_hal_Timer.iconFileName = "icons/rtc.ico";

/* Gates Sub Group Modules */

    this.ti_sysbios_gates_GateHwi.elemName = "GateHwi";
    this.ti_sysbios_gates_GateHwi.moduleName = "ti.sysbios.gates.GateHwi";
    this.ti_sysbios_gates_GateHwi.iconFileName = "icons/lck.ico";

    this.ti_sysbios_gates_GateSwi.elemName = "GateSwi";
    this.ti_sysbios_gates_GateSwi.moduleName = "ti.sysbios.gates.GateSwi";
    this.ti_sysbios_gates_GateSwi.iconFileName = "icons/lck.ico";

    this.ti_sysbios_gates_GateTask.elemName = "GateTask";
    this.ti_sysbios_gates_GateTask.moduleName = "ti.sysbios.gates.GateTask";
    this.ti_sysbios_gates_GateTask.iconFileName = "icons/lck.ico";

    this.ti_sysbios_gates_GateMutex.elemName = "GateMutex";
    this.ti_sysbios_gates_GateMutex.moduleName = "ti.sysbios.gates.GateMutex";
    this.ti_sysbios_gates_GateMutex.iconFileName = "icons/lck.ico";

    this.ti_sysbios_gates_GateMutexPri.elemName = "GateMutexPri";
    this.ti_sysbios_gates_GateMutexPri.moduleName =
        "ti.sysbios.gates.GateMutexPri";
    this.ti_sysbios_gates_GateMutexPri.iconFileName = "icons/lck.ico";

/* Synchronization Group Modules */

    this.ti_sysbios_knl_Semaphore.elemName = "Semaphore";
    this.ti_sysbios_knl_Semaphore.moduleName = "ti.sysbios.knl.Semaphore";
    this.ti_sysbios_knl_Semaphore.iconFileName = "icons/sem.ico";

    this.ti_sysbios_knl_Event.elemName = "Event";
    this.ti_sysbios_knl_Event.moduleName = "ti.sysbios.knl.Event";
    this.ti_sysbios_knl_Event.iconFileName = "icons/sem.ico";

/* Communication Group Modules */

    this.ti_sysbios_knl_Mailbox.elemName = "Mailbox";
    this.ti_sysbios_knl_Mailbox.moduleName = "ti.sysbios.knl.Mailbox";
    this.ti_sysbios_knl_Mailbox.iconFileName = "icons/mbx.ico";

/* Syncs Sub Group Modules */

    this.xdc_runtime_knl_SyncGeneric.elemName = "SyncGeneric";
    this.xdc_runtime_knl_SyncGeneric.moduleName = "xdc.runtime.knl.SyncGeneric";
    this.xdc_runtime_knl_SyncGeneric.iconFileName = "icons/sem.ico";

    this.ti_sysbios_syncs_SyncSem.elemName = "SyncSem";
    this.ti_sysbios_syncs_SyncSem.moduleName = "ti.sysbios.syncs.SyncSem";
    this.ti_sysbios_syncs_SyncSem.iconFileName = "icons/sem.ico";

    this.ti_sysbios_syncs_SyncEvent.elemName = "SyncEvent";
    this.ti_sysbios_syncs_SyncEvent.moduleName = "ti.sysbios.syncs.SyncEvent";
    this.ti_sysbios_syncs_SyncEvent.iconFileName = "icons/sem.ico";

    this.ti_sysbios_syncs_SyncSwi.elemName = "SyncSwi";
    this.ti_sysbios_syncs_SyncSwi.moduleName = "ti.sysbios.syncs.SyncSwi";
    this.ti_sysbios_syncs_SyncSwi.iconFileName = "icons/swi.ico";

/* Utilities Group Modules */

    this.ti_sysbios_utils_Load.elemName = "Load";
    this.ti_sysbios_utils_Load.moduleName = "ti.sysbios.utils.Load";
    this.ti_sysbios_utils_Load.iconFileName = "icons/timer.ico";

/* target unique modules */

    this.ti_sysbios_hal_unicache_Cache.elemName = "Unicache";
    this.ti_sysbios_hal_unicache_Cache.moduleName = "ti.sysbios.hal.unicache.Cache";
    this.ti_sysbios_hal_unicache_Cache.iconFileName = "icons/mem.ico";

    this.ti_sysbios_hal_ammu_AMMU.elemName = "AMMU";
    this.ti_sysbios_hal_ammu_AMMU.moduleName = "ti.sysbios.hal.ammu.AMMU";
    this.ti_sysbios_hal_ammu_AMMU.iconFileName = "icons/mem.ico";

    this.ti_sysbios_timers_dmtimer_Timer.elemName = "DM Timer";
    this.ti_sysbios_timers_dmtimer_Timer.moduleName = "ti.sysbios.timers.dmtimer.Timer";
    this.ti_sysbios_timers_dmtimer_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_timers_gptimer_Timer.elemName = "GP Timer";
    this.ti_sysbios_timers_gptimer_Timer.moduleName = "ti.sysbios.timers.gptimer.Timer";
    this.ti_sysbios_timers_gptimer_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_timers_timer64_Timer.elemName = "Timer64 Timer";
    this.ti_sysbios_timers_timer64_Timer.moduleName = "ti.sysbios.timers.timer64.Timer";
    this.ti_sysbios_timers_timer64_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_timers_timer64_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_timers_timer64_TimestampProvider.moduleName = "ti.sysbios.timers.timer64.TimestampProvider";
    this.ti_sysbios_timers_timer64_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_c28_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_c28_Hwi.moduleName = "ti.sysbios.family.c28.Hwi";
    this.ti_sysbios_family_c28_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_c28_Timer.elemName = "Timer";
    this.ti_sysbios_family_c28_Timer.moduleName = "ti.sysbios.family.c28.Timer";
    this.ti_sysbios_family_c28_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_c28_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_c28_TimestampProvider.moduleName = "ti.sysbios.family.c28.TimestampProvider";
    this.ti_sysbios_family_c28_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_c64p_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_c64p_Hwi.moduleName = "ti.sysbios.family.c64p.Hwi";
    this.ti_sysbios_family_c64p_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_c64p_Cache.elemName = "Cache";
    this.ti_sysbios_family_c64p_Cache.moduleName = "ti.sysbios.family.c64p.Cache";
    this.ti_sysbios_family_c64p_Cache.iconFileName = "icons/mem.ico";

    this.ti_sysbios_family_c64p_EventCombiner.elemName = "EventCombiner";
    this.ti_sysbios_family_c64p_EventCombiner.moduleName = "ti.sysbios.family.c64p.EventCombiner";
    this.ti_sysbios_family_c64p_EventCombiner.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_c64p_Exception.elemName = "Exception";
    this.ti_sysbios_family_c64p_Exception.moduleName = "ti.sysbios.family.c64p.Exception";
    this.ti_sysbios_family_c64p_Exception.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_c67p_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_c67p_Hwi.moduleName = "ti.sysbios.family.c67p.Hwi";
    this.ti_sysbios_family_c67p_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_c67p_Cache.elemName = "Cache";
    this.ti_sysbios_family_c67p_Cache.moduleName = "ti.sysbios.family.c67p.Cache";
    this.ti_sysbios_family_c67p_Cache.iconFileName = "icons/mem.ico";

    this.ti_sysbios_family_c67p_Timer.elemName = "Timer";
    this.ti_sysbios_family_c67p_Timer.moduleName = "ti.sysbios.family.c67p.Timer";
    this.ti_sysbios_family_c67p_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_c67p_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_c67p_TimestampProvider.moduleName = "ti.sysbios.family.c67p.TimestampProvider";
    this.ti_sysbios_family_c67p_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_msp430_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_msp430_Hwi.moduleName = "ti.sysbios.family.msp430.Hwi";
    this.ti_sysbios_family_msp430_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_msp430_Power.elemName = "Power";
    this.ti_sysbios_family_msp430_Power.moduleName = "ti.sysbios.family.msp430.Power";
    this.ti_sysbios_family_msp430_Power.iconFileName = "icons/pwr.ico";

    this.ti_sysbios_family_msp430_Timer.elemName = "Timer";
    this.ti_sysbios_family_msp430_Timer.moduleName = "ti.sysbios.family.msp430.Timer";
    this.ti_sysbios_family_msp430_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_msp430_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_msp430_TimestampProvider.moduleName = "ti.sysbios.family.msp430.TimestampProvider";
    this.ti_sysbios_family_msp430_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_arm_Cache.elemName = "Cache";
    this.ti_sysbios_family_arm_Cache.moduleName = "ti.sysbios.family.arm.Cache";
    this.ti_sysbios_family_arm_Cache.iconFileName = "icons/mem.ico";

    this.ti_sysbios_family_arm_arm9_Mmu.elemName = "Arm9 MMU";
    this.ti_sysbios_family_arm_arm9_Mmu.moduleName = "ti.sysbios.family.arm.Arm9.Mmu";
    this.ti_sysbios_family_arm_arm9_Mmu.iconFileName = "icons/mem.ico";

    this.ti_sysbios_family_arm_dm6446_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_arm_dm6446_Hwi.moduleName = "ti.sysbios.family.arm.dm6446.Hwi";
    this.ti_sysbios_family_arm_dm6446_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_arm_da830_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_arm_da830_Hwi.moduleName = "ti.sysbios.family.arm.da830.Hwi";
    this.ti_sysbios_family_arm_da830_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_arm_da830_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_arm_da830_TimestampProvider.moduleName = "ti.sysbios.family.arm.da830.TimestampProvider";
    this.ti_sysbios_family_arm_da830_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_arm_tms570_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_arm_tms570_Hwi.moduleName = "ti.sysbios.family.arm.tms570.Hwi";
    this.ti_sysbios_family_arm_tms570_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_arm_tms570_Timer.elemName = "Timer";
    this.ti_sysbios_family_arm_tms570_Timer.moduleName = "ti.sysbios.family.arm.tms570.Timer";
    this.ti_sysbios_family_arm_tms570_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_arm_tms570_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_arm_tms570_TimestampProvider.moduleName = "ti.sysbios.family.arm.tms570.TimestampProvider";
    this.ti_sysbios_family_arm_tms570_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_arm_m3_Hwi.elemName = "Hwi";
    this.ti_sysbios_family_arm_m3_Hwi.moduleName = "ti.sysbios.family.arm.m3.Hwi";
    this.ti_sysbios_family_arm_m3_Hwi.iconFileName = "icons/hwi.ico";

    this.ti_sysbios_family_arm_m3_Timer.elemName = "Timer";
    this.ti_sysbios_family_arm_m3_Timer.moduleName = "ti.sysbios.family.arm.m3.Timer";
    this.ti_sysbios_family_arm_m3_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_arm_m3_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_arm_m3_TimestampProvider.moduleName = "ti.sysbios.family.arm.m3.TimestampProvider";
    this.ti_sysbios_family_arm_m3_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_arm_lm3_Timer.elemName = "Timer";
    this.ti_sysbios_family_arm_lm3_Timer.moduleName = "ti.sysbios.family.arm.lm3.Timer";
    this.ti_sysbios_family_arm_lm3_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_arm_lm3_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_arm_lm3_TimestampProvider.moduleName = "ti.sysbios.family.arm.lm3.TimestampProvider";
    this.ti_sysbios_family_arm_lm3_TimestampProvider.iconFileName = "icons/clk.ico";

    this.ti_sysbios_family_arm_ducati_Core.elemName = "Core";
    this.ti_sysbios_family_arm_ducati_Core.moduleName = "ti.sysbios.family.arm.ducati.Core";
    this.ti_sysbios_family_arm_ducati_Core.iconFileName = "icons/prj.ico";

    this.ti_sysbios_family_arm_ducati_Timer.elemName = "Timer";
    this.ti_sysbios_family_arm_ducati_Timer.moduleName = "ti.sysbios.family.arm.ducati.Timer";
    this.ti_sysbios_family_arm_ducati_Timer.iconFileName = "icons/rtc.ico";

    this.ti_sysbios_family_arm_ducati_TimestampProvider.elemName = "TimestampProvider";
    this.ti_sysbios_family_arm_ducati_TimestampProvider.moduleName = "ti.sysbios.family.arm.ducati.TimestampProvider";
    this.ti_sysbios_family_arm_ducati_TimestampProvider.iconFileName = "icons/clk.ico";

/* Sub Groups */

    this.systemProvidersGroup.elemName = "System Providers";
    this.systemProvidersGroup.moduleName = null;
    this.systemProvidersGroup.iconFileName = "icons/hst_fldr.ico";
    this.systemProvidersGroup.elemArray = [
        this.xdc_runtime_SysMin,
        this.xdc_runtime_SysStd
    ];

    this.loggersGroup.elemName = "Loggers";
    this.loggersGroup.moduleName = null;
    this.loggersGroup.iconFileName = "icons/log_fldr.ico";
    this.loggersGroup.elemArray = [
        this.xdc_runtime_LoggerBuf,
        this.xdc_runtime_LoggerSys,
    ];

    this.rtaGroup.elemName = "RTA and RTDX";
    this.rtaGroup.moduleName = null;
    this.rtaGroup.iconFileName = "icons/log_fldr.ico";
    this.rtaGroup.elemArray = [
        this.ti_sysbios_rta_Agent,
        this.ti_rtdx_RtdxModule,
        this.ti_rtdx_driver_RtdxDvr
    ];

    this.heapsGroup.elemName = "Heaps";
    this.heapsGroup.moduleName = null;
    this.heapsGroup.iconFileName = "icons/mem_fldr.ico";
    this.heapsGroup.elemArray = [
        this.xdc_runtime_HeapMin,
        this.xdc_runtime_HeapStd,
        this.ti_sysbios_heaps_HeapMem,
        this.ti_sysbios_heaps_HeapBuf,
        this.ti_sysbios_heaps_HeapMultiBuf
    ];

    this.syncsGroup.elemName = "Syncs";
    this.syncsGroup.moduleName = null;
    this.syncsGroup.iconFileName = "icons/sem_fldr.ico";
    this.syncsGroup.elemArray = [
        this.xdc_runtime_knl_SyncGeneric,
        this.ti_sysbios_syncs_SyncEvent,
        this.ti_sysbios_syncs_SyncSem,
        this.ti_sysbios_syncs_SyncSwi
    ];

    this.gatesGroup.elemName = "Gates";
    this.gatesGroup.moduleName = null;
    this.gatesGroup.iconFileName = "icons/lck_fldr.ico";
    this.gatesGroup.elemArray = [
        this.ti_sysbios_gates_GateHwi,
        this.ti_sysbios_gates_GateMutex,
        this.ti_sysbios_gates_GateMutexPri,
        this.ti_sysbios_gates_GateSwi,
        this.ti_sysbios_gates_GateTask
    ];

/* Groups */

    this.systemGroup.elemName = "System";
    this.systemGroup.moduleName = null;
    this.systemGroup.iconFileName = "icons/gbl_fldr.ico";
    this.systemGroup.elemArray = [
        this.ti_sysbios_BIOS,
        this.xdc_cfg_Program,
        this.xdc_runtime_Main,
        this.xdc_runtime_Defaults,
        this.xdc_runtime_System,
        this.systemProvidersGroup,
        this.xdc_runtime_Startup
    ];

    this.diagnosticsGroup.elemName = "Diagnostics";
    this.diagnosticsGroup.moduleName = null;
    this.diagnosticsGroup.iconFileName = "icons/sdb.ico";
    this.diagnosticsGroup.elemArray = [
        this.xdc_runtime_Log,        
        this.loggersGroup,
        this.rtaGroup,
        this.xdc_runtime_Diags,
        this.xdc_runtime_Assert,
        this.xdc_runtime_Error,
        this.xdc_runtime_Timestamp
    ];

    this.memoryGroup.elemName = "Memory Management";
    this.memoryGroup.moduleName = null;
    this.memoryGroup.iconFileName = "icons/mem_fldr.ico";
    this.memoryGroup.elemArray = [
        this.ti_sysbios_hal_Cache,
        this.xdc_runtime_Memory,
        this.heapsGroup
    ];

    this.schedulingGroup.elemName = "Scheduling";
    this.schedulingGroup.moduleName = null;
    this.schedulingGroup.iconFileName = "icons/swi_fldr.ico";
    this.schedulingGroup.elemArray = [
        this.ti_sysbios_knl_Task,
        this.ti_sysbios_knl_Swi,
        this.ti_sysbios_hal_Hwi,
        this.ti_sysbios_knl_Idle,
        this.ti_sysbios_knl_Clock,
        this.ti_sysbios_hal_Timer

    ];

    this.synchronizationGroup.elemName = "Synchronization";
    this.synchronizationGroup.moduleName = null;
    this.synchronizationGroup.iconFileName = "icons/sem_fldr.ico";
    this.synchronizationGroup.elemArray = [
        this.ti_sysbios_knl_Semaphore,
        this.ti_sysbios_knl_Event,
        this.gatesGroup,
        this.syncsGroup
    ];

    this.knlGroup.elemName = "Communication";
    this.knlGroup.moduleName = null;
    this.knlGroup.iconFileName = "icons/rtdx.ico";
    this.knlGroup.elemArray = [
        this.ti_sysbios_knl_Mailbox
    ];

    this.utilsGroup.elemName = "Utilities";
    this.utilsGroup.moduleName = null;
    this.utilsGroup.iconFileName = "icons/rtdx.ico";
    this.utilsGroup.elemArray = [
        this.ti_sysbios_utils_Load
    ];

    this.timersGroup.elemName = "Timers";
    this.timersGroup.moduleName = null;
    this.timersGroup.iconFileName = "icons/rtc.ico";
    this.timersGroup.elemArray = [
        this.ti_sysbios_timers_dmtimer_Timer,
        this.ti_sysbios_timers_gptimer_Timer,
        this.ti_sysbios_timers_timer64_Timer,
    ];

    this.c28Group.elemName = "C28";
    this.c28Group.moduleName = null;
    this.c28Group.iconFileName = "icons/swi_fldr.ico";
    this.c28Group.elemArray = [
        this.ti_sysbios_family_c28_Hwi,
        this.ti_sysbios_family_c28_Timer,
        this.ti_sysbios_family_c28_TimestampProvider
    ];

    this.c64pGroup.elemName = "C64P";
    this.c64pGroup.moduleName = null;
    this.c64pGroup.iconFileName = "icons/swi_fldr.ico";
    this.c64pGroup.elemArray = [
        this.ti_sysbios_family_c64p_Hwi,
        this.ti_sysbios_family_c64p_Cache,
        this.timersGroup,
        this.ti_sysbios_family_c64p_EventCombiner,
        this.ti_sysbios_family_c64p_Exception
    ];

    this.c64tGroup.elemName = "C64T";
    this.c64tGroup.moduleName = null;
    this.c64tGroup.iconFileName = "icons/swi_fldr.ico";
    this.c64tGroup.elemArray = [
        this.ti_sysbios_family_c64p_Hwi,
        this.ti_sysbios_hal_unicache_Cache,
        this.ti_sysbios_timers_dmtimer_Timer,
        this.ti_sysbios_family_c64p_EventCombiner,
        this.ti_sysbios_family_c64p_Exception
    ];

    this.c674Group.elemName = "C674";
    this.c674Group.moduleName = null;
    this.c674Group.iconFileName = "icons/swi_fldr.ico";
    this.c674Group.elemArray = [
        this.ti_sysbios_family_c64p_Hwi,
        this.ti_sysbios_family_c64p_Cache,
        this.timersGroup,
        this.ti_sysbios_family_c64p_EventCombiner,
        this.ti_sysbios_family_c64p_Exception
    ];

    this.c67pGroup.elemName = "C67P";
    this.c67pGroup.moduleName = null;
    this.c67pGroup.iconFileName = "icons/swi_fldr.ico";
    this.c67pGroup.elemArray = [
        this.ti_sysbios_family_c67p_Hwi,
        this.ti_sysbios_family_c67p_Cache,
        this.ti_sysbios_family_c67p_Timer,
        this.ti_sysbios_family_c67p_TimestampProvider
    ];

    this.msp430Group.elemName = "MSP430";
    this.msp430Group.moduleName = null;
    this.msp430Group.iconFileName = "icons/swi_fldr.ico";
    this.msp430Group.elemArray = [
        this.ti_sysbios_family_msp430_Hwi,
        this.ti_sysbios_family_msp430_Power,
        this.ti_sysbios_family_msp430_Timer,
        this.ti_sysbios_family_msp430_TimestampProvider
    ];

    this.arm9davinciGroup.elemName = "Arm9 (daVinci)";
    this.arm9davinciGroup.moduleName = null;
    this.arm9davinciGroup.iconFileName = "icons/swi_fldr.ico";
    this.arm9davinciGroup.elemArray = [
        this.ti_sysbios_family_arm_Cache,
        this.ti_sysbios_family_arm_arm9_Mmu,
        this.ti_sysbios_family_arm_dm6446_Hwi,
        this.ti_sysbios_timers_timer64_Timer,
        this.ti_sysbios_timers_timer64_TimestampProvider
    ];

    this.arm9da830Group.elemName = "Arm9 (DA830)";
    this.arm9da830Group.moduleName = null;
    this.arm9da830Group.iconFileName = "icons/swi_fldr.ico";
    this.arm9da830Group.elemArray = [
        this.ti_sysbios_family_arm_Cache,
        this.ti_sysbios_family_arm_arm9_Mmu,
        this.ti_sysbios_family_arm_da830_Hwi,
        this.ti_sysbios_timers_timer64_Timer,
        this.ti_sysbios_family_arm_da830_TimestampProvider
    ];

    this.r4Group.elemName = "R4 (TMS570)";
    this.r4Group.moduleName = null;
    this.r4Group.iconFileName = "icons/swi_fldr.ico";
    this.r4Group.elemArray = [
        this.ti_sysbios_family_arm_Cache,
        this.ti_sysbios_family_arm_arm9_Mmu,
        this.ti_sysbios_family_arm_tms570_Hwi,
        this.ti_sysbios_family_arm_tms570_Timer,
        this.ti_sysbios_family_arm_tms570_TimestampProvider
    ];

    this.m3Group.elemName = "M3 (Native)";
    this.m3Group.moduleName = null;
    this.m3Group.iconFileName = "icons/swi_fldr.ico";
    this.m3Group.elemArray = [
        this.ti_sysbios_family_arm_m3_Hwi,
        this.ti_sysbios_family_arm_m3_Timer,
        this.ti_sysbios_family_arm_m3_TimestampProvider
    ];

    this.lm3Group.elemName = "M3 (Stellaris)";
    this.lm3Group.moduleName = null;
    this.lm3Group.iconFileName = "icons/swi_fldr.ico";
    this.lm3Group.elemArray = [
        this.ti_sysbios_family_arm_m3_Hwi,
        this.ti_sysbios_family_arm_lm3_Timer,
        this.ti_sysbios_family_arm_lm3_TimestampProvider
    ];

    this.ducatiGroup.elemName = "M3 (Ducati)";
    this.ducatiGroup.moduleName = null;
    this.ducatiGroup.iconFileName = "icons/swi_fldr.ico";
    this.ducatiGroup.elemArray = [
        this.ti_sysbios_family_arm_m3_Hwi,
        this.ti_sysbios_family_arm_ducati_Timer,
        this.ti_sysbios_family_arm_ducati_TimestampProvider,
        this.ti_sysbios_family_arm_ducati_Core,
        this.ti_sysbios_hal_unicache_Cache,
        this.ti_sysbios_hal_ammu_AMMU
    ];

    this.armGroup.elemName = "Arm";
    this.armGroup.moduleName = null;
    this.armGroup.iconFileName = "icons/swi_fldr.ico";
    this.armGroup.elemArray = [
        this.arm9davinciGroup,
        this.arm9da830Group,
        this.m3Group,
        this.lm3Group,
        this.ducatiGroup,
        this.r4Group
    ];

    this.targetGroup.elemName = "Target Specific Support";
    this.targetGroup.moduleName = null;
    this.targetGroup.iconFileName = "icons/swi_fldr.ico";
    this.targetGroup.elemArray = [
        this.armGroup,
        this.c28Group,
        this.c64pGroup,
        this.c674Group,
        this.c64tGroup,
        this.msp430Group,
    ];

/* product */

    this.biosProduct.elemName = "SYS/BIOS";
    this.biosProduct.moduleName = null;
    this.biosProduct.iconFileName = "icons/bios.gif";
    this.biosProduct.elemArray = [
        this.systemGroup,
        this.diagnosticsGroup,
        this.memoryGroup,
        this.schedulingGroup,
        this.synchronizationGroup,
        this.knlGroup,
        this.utilsGroup,
        this.targetGroup
    ]; 
}

/*
 *  ======== getProductDescriptor ========
 */
function getProductDescriptor() 
{
    return this.biosProduct;;
}



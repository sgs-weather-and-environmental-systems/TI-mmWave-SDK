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
 *  ======== Timer.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>

#include <ti/sysbios/family/arm/gicv3/Hwi.h>

#if (ti_sysbios_BIOS_smpEnabled__D)
#include <ti/sysbios/family/arm/a15/smp/Core.h>
#endif

#include "package/internal/Timer.xdc.h"

#define REG32(X)                *(volatile UInt32 *)(X)

/* CNTP_CTL, PL1 Physical Timer Control Register
 * Bit#     Name      Description
 * 31-3     RESERVED
 * 2        ISTATUS   Status of timer interrupt (RD Only)
 * 1        IMASK     Timer interrupt mask bit
 * 0        ENABLE    Enables the timer
 */

#define CNTP_CTL_ISTATUS        0x4
#define CNTP_CTL_IMASK          0x2
#define CNTP_CTL_ENABLE         0x1

/* CNTV_CTL, Virtual Timer Control Register
 * Bit#     Name      Description
 * 31-3     RESERVED
 * 2        ISTATUS   Status of timer interrupt (RD Only)
 * 1        IMASK     Timer interrupt mask bit
 * 0        ENABLE    Enables the timer
 */

#define CNTV_CTL_ISTATUS        0x4
#define CNTV_CTL_IMASK          0x2
#define CNTV_CTL_ENABLE         0x1

struct TimerInfo {
    Timer_Handle handle;
    UInt32 period;
};

/*
 *  ======== Timer_getNumTimers ========
 */
UInt Timer_getNumTimers()
{
    return (Timer_NUM_TIMER_DEVICES);
}

/*
 *  ======== Timer_getStatus ========
 */
Timer_Status Timer_getStatus(UInt timerId)
{
    Assert_isTrue(timerId < Timer_NUM_TIMER_DEVICES, NULL);

    if (Timer_module->availMask & (0x1 << timerId)) {
        return (Timer_Status_FREE);
    }
    else {
        return (Timer_Status_INUSE);
    }
}

/*
 *  ======== Timer_getMaxTicks ========
 */

UInt32 Timer_getMaxTicks(Timer_Object *obj)
{
    UInt64 maxTicks = Timer_MAX_PERIOD;

    maxTicks = maxTicks / (UInt64)obj->period;

    if (maxTicks >= 0xFFFFFFFF) {
        maxTicks = 0xFFFFFFFF;
    }

    return ((UInt32)maxTicks);
}

/*
 *  ======== Timer_setNextTick ========
 */
Void Timer_setNextTick(Timer_Object *obj, UInt32 ticks)
{
    UInt key;
    UInt64 newPeriodCounts = obj->period * ticks;

    /*
     * Timer interrupt may go off between updating the period and
     * restarting the timer making the prevThreshold value stale.
     *
     * Follow the below sequence to prevent this from happening:
     * 1. Disable global interrupts
     * 2. Set the new period and timeout
     * 3. Re-enable global interrupts
     */
    key = Hwi_disable();


    obj->nextThreshold = obj->savedCurrCount + newPeriodCounts;

    if (obj->id == 0) {
        /* Set new timeout threshold */
        Timer_writePhyCmpVal(&(obj->nextThreshold));
    }
    else {
        /* Set new timeout threshold */
        Timer_writeVirtCmpVal(&(obj->nextThreshold));
    }
    Hwi_restore(key);
}

/*
 *  ======== Timer_Module_startup ========
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(Int status)
{
    Int i;
    Timer_Object *obj;

    if (Hwi_Module_startupDone()) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            obj = Timer_module->handles[i];
            /* if timer was statically created/constructed */
            if ((obj != NULL) && (obj->staticInst)) {
                Timer_postInit(obj, NULL);
            }
        }

        if (Timer_setEnableBit) {
            /* Set enable bit in CNTCR */
            REG32(0x2A430000) |= 0x1;
        }

        return (Startup_DONE);
    }

    return (Startup_NOTDONE);
}

/*
 *  ======== Timer_startup ========
 *  Here after main(). Called from BIOS_start()
 *  Calls Timer_start for all statically-created & constructed
 *  timers with start mode AUTO.
 */
Void Timer_startup()
{
    Int i;
    Timer_Object *obj;

    if (Timer_startupNeeded) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            obj = Timer_module->handles[i];
            /* if timer was statically created/constructed */
            if ((obj != NULL) && (obj->staticInst)) {
                if (obj->startMode == Timer_StartMode_AUTO) {
                        Timer_start(obj);
                }
            }
        }
    }
}

/*
 *  ======== Timer_getHandle ========
 */
Timer_Handle Timer_getHandle(UInt id)
{
    Assert_isTrue((id < Timer_NUM_TIMER_DEVICES), NULL);

    if (id >= Timer_NUM_TIMER_DEVICES) {
        return (NULL);
    }
    else {
        return (Timer_module->handles[id]);
    }
}

/*
 *  ======== Timer_Instance_init ========
 * 1. Select timer based on id
 * 2. Mark timer as in use
 * 3. Save timer handle if necessary (needed by TimestampProvider on 64).
 * 4. Init obj using params
 * 5. Create Hwi if tickFxn !=NULL
 * 6. Timer_init()
 * 7. Timer configuration (wrt emulation, external frequency etc)
 * 8. Timer_setPeriod()
 * 9. Timer_start()
 */
Int Timer_Instance_init(Timer_Object *obj, Int id, Timer_FuncPtr tickFxn,
        const Timer_Params *params, Error_Block *eb)
{
    UInt key;
    Int i, status;
    Hwi_Params hwiParams;
    UInt tempId = 0xFFFF;

    if (id >= Timer_NUM_TIMER_DEVICES) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();

    if (id == Timer_ANY) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            if ((Timer_anyMask & (1 << i)) &&
                (Timer_module->availMask & (1 << i))) {
                Timer_module->availMask &= ~(1 << i);
                tempId = i;
                break;
            }
        }
    }
    else if (Timer_module->availMask & (1 << id)) {
        Timer_module->availMask &= ~(1 << id);
        tempId = id;
    }

    Hwi_restore(key);

    obj->staticInst = FALSE;

    if (tempId == 0xFFFF) {
        Error_raise(eb, Timer_E_notAvailable, id, 0);
        return (2);
    }
    else {
        obj->id = tempId;
    }

    Timer_module->handles[obj->id] = obj;

    obj->runMode       = params->runMode;
    obj->startMode     = params->startMode;
    obj->periodType    = params->periodType;
    obj->arg           = params->arg;
    obj->intNum        = Timer_intNumDef[obj->id];
    obj->tickFxn       = tickFxn;
    obj->prevThreshold = 0;
    obj->nextThreshold = 0;
    obj->savedCurrCount = 0;

    if (params->period64 == 0) {
        obj->period = params->period;
    }
    else {
        obj->period = params->period64;
    }

    if (params->extFreq.hi) {
        obj->extFreq.hi = params->extFreq.hi;
    }

    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        // TODO Do we need this ?
        if (obj->runMode == Timer_RunMode_ONESHOT) {
            if (hwiParams.maskSetting == Hwi_MaskingOption_NONE) {
                Error_raise(eb, Timer_E_invalidHwiMask, 0, 0);
                return (3);
            }
        }

        if (hwiParams.type == Hwi_Type_IRQ) {
            hwiParams.arg = (UArg)obj;
            if ((obj->runMode == Timer_RunMode_CONTINUOUS) ||
                (obj->runMode == Timer_RunMode_DYNAMIC)) {
                obj->hwi = Hwi_create (obj->intNum, Timer_periodicStub,
                        &hwiParams, eb);
            }
            else {
                obj->hwi = Hwi_create (obj->intNum, Timer_oneShotStub,
                        &hwiParams, eb);
            }
        }

        if (obj->hwi == NULL) {
            return (4);
        }
    }
    else {
        obj->hwi = NULL;
    }

    status = Timer_postInit(obj, eb);

    if (status) {
        return (status);
    }

    if (obj->startMode == Timer_StartMode_AUTO) {
        Timer_start(obj);
    }

    return (0);
}

/*
 *  ======== Timer_reconfig ========
 * 1. Init obj using params
 * 2. Reconfig Hwi
 * 3. Timer_init()
 * 4. Timer configuration (wrt emulation, external frequency etc)
 * 5. Timer_setPeriod()
 * 6. Timer_start()
 */
Void Timer_reconfig (Timer_Object *obj, Timer_FuncPtr tickFxn,
        const Timer_Params *params, Error_Block *eb)
{
    Int status;
    Hwi_Params hwiParams;

    obj->runMode       = params->runMode;
    obj->startMode     = params->startMode;
    obj->periodType    = params->periodType;
    obj->arg           = params->arg;
    obj->tickFxn       = tickFxn;
    obj->prevThreshold = 0;
    obj->nextThreshold = 0;

    if (params->period64 == 0) {
        obj->period = params->period;
    }
    else {
        obj->period = params->period64;
    }

    if (params->extFreq.hi) {
        obj->extFreq.hi = params->extFreq.hi;
    }

    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        hwiParams.arg = (UArg)obj;

        if ((obj->runMode == Timer_RunMode_CONTINUOUS) ||
            (obj->runMode == Timer_RunMode_DYNAMIC)) {
            Hwi_reconfig (obj->hwi, Timer_periodicStub, &hwiParams);
        }
        else {
            Hwi_reconfig (obj->hwi, Timer_oneShotStub, &hwiParams);
        }
    }

    status = Timer_postInit(obj, eb);

    if (!status) {
        if (obj->startMode == Timer_StartMode_AUTO) {
            Timer_start(obj);
        }
    }
}

/*
 *  ======== Timer_postInit ========
 *
 *  1. Initialize System-level counter control register (CNTCR)
 */
Int Timer_postInit (Timer_Object *obj, Error_Block *eb)
{
    UInt key;

    key = Hwi_disable();

    Timer_initDevice(obj);
    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs64(obj, obj->period)) {
            //TODO fixme - period is 64bit not 32bit. 64bit print not working
            Error_raise(eb, Timer_E_cannotSupport, (UInt32)(obj->period), 0);
            Hwi_restore(key);
            return (5);
        }
    }
    else {
        Timer_setPeriod64(obj, obj->period);
    }

    Hwi_restore(key);

    return (0);
}

/*
 *  ======== Timer_Instance_finalize ========
 */
Void Timer_Instance_finalize(Timer_Object *obj, Int status)
{
    UInt key;

    /* fall through in switch below is intentional */
    switch (status) {
        /* invalid timer id */
        case 1:

        /* timer not available */
        case 2:
            return;

        /* Timer_delete() */
        case 0:

        /* setPeriodMicroSecs failed */
        case 5:
            Timer_initDevice(obj);
            if (obj->hwi) {
                Hwi_delete(&obj->hwi);
            }

        /* Hwi create failed */
        case 4:

        /* hwiMask is wrong */
        case 3:

        default:
            break;
    };

    key = Hwi_disable();
    Timer_module->availMask |= (0x1 << obj->id);
    Timer_module->handles[obj->id] = NULL;
    Hwi_restore(key);
}

/*
 * ======== Timer_initDevice ========
 * 1. stop timer
 * 2. disable timer interrupt (IER and any timer specific interrupt enable)
 * 3. clear pending interrupt (IFR and any timer specific interrupt flags)
 *
 * Note: Disabling the timer also de-asserts the pend bit for the corresponding
 *       timer interrupt.
 */
Void Timer_initDevice(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    /*
     * Timer id0 -> PL1 Physical Timer
     * Timer id1 -> Virtual Timer with Offset 0
     */
    if (obj->id == 0) {
        /* Disable PL1 Physical Timer */
        Timer_writePhyCtrl(0);
        if (obj->hwi) {
            Hwi_disableInterrupt(obj->intNum);
            Hwi_clearInterrupt(obj->intNum);
        }
    }
    else {
        /* Disable Virtual Timer */
        Timer_writeVirtCtrl(0);
        if (obj->hwi) {
            Hwi_disableInterrupt(obj->intNum);
            Hwi_clearInterrupt(obj->intNum);
        }
    }

    Hwi_restore(key);
}

/*
 *  ======== Timer_start ========
 *  Follow the below sequence:
 *  1. Globally disable interrupts.
 *  2. Disable timer
 *  3. Enable timer interrupt
 *  2. Program timer with new timeout threshold
 *  3. Enable timer
 *  4. Globally enable interrupts.
 *
 *  Note: Disabling the timer also de-asserts the timer interrupt
 *        pending bit in GIC.
 */
Void Timer_start(Timer_Object *obj)
{
    UInt key;
    UInt64 timerCount;

    key = Hwi_disable();

#if (ti_sysbios_BIOS_smpEnabled__D)
    if (Core_getId() != 0) {
        /* Release inter-core lock */
        Hwi_restore(key);

        /* Notify core 0 to start timer */
        key = Core_notifySpinLock();
        Core_notify((Core_IpcFuncPtr)(&Timer_start), (UArg)obj, 0x1);
        Core_notifySpinUnlock(key);
        return;
    }
#endif

    if (obj->id == 0) {
        if (obj->hwi) {
            Hwi_enableInterrupt(obj->intNum);
        }
        /* Disable timer interrupt */
        Timer_writePhyCtrl(0);

        Timer_readPhyCnt(&timerCount);
        obj->prevThreshold = timerCount;
        obj->nextThreshold = (obj->prevThreshold) + (obj->period);
        Timer_writePhyCmpVal(&(obj->nextThreshold));

        /* Enable timer interrupt */
        Timer_writePhyCtrl(CNTP_CTL_ENABLE);
    }
    else {
        if (obj->hwi) {
            Hwi_enableInterrupt(obj->intNum);
        }
        /* Disable timer interrupt */
        Timer_writeVirtCtrl(0);

        Timer_readVirtCnt(&timerCount);
        obj->prevThreshold = timerCount;
        obj->nextThreshold = (obj->prevThreshold) + (obj->period);
        Timer_writeVirtCmpVal(&(obj->nextThreshold));

        /* Enable timer interrupt */
        Timer_writeVirtCtrl(CNTV_CTL_ENABLE);
    }

    Hwi_restore(key);
}

/*
 *  ======== Timer_stop ========
 * 1. stop timer
 * 2. disable timer interrupt
 */
Void Timer_stop(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

#if (ti_sysbios_BIOS_smpEnabled__D)
    if (Core_getId() != 0) {
        /* Release inter-core lock */
        Hwi_restore(key);

        /* Notify core 0 to stop timer */
        key = Core_notifySpinLock();
        Core_notify((Core_IpcFuncPtr)(&Timer_stop), (UArg)obj, 0x1);
        Core_notifySpinUnlock(key);
        return;
    }
#endif

    if (obj->id == 0) {
        /* Disable timer interrupt */
        Timer_writePhyCtrl(0);
    }
    else {
        /* Disable timer interrupt */
        Timer_writeVirtCtrl(0);
    }

    Hwi_restore(key);

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
    }
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 */
Bool Timer_setPeriodMicroSecs(Timer_Object *obj, UInt32 period)
{
#if (ti_sysbios_BIOS_smpEnabled__D)
    UInt key;
    UInt64 freqKHz;
    Types_FreqHz freqHz;
    struct TimerInfo timerInfo;

    key = Core_hwiDisable();

    if (Core_getId() != 0) {
        /* Re-enable interrupts */
        Core_hwiRestore(key);

        /* Store message */
        timerInfo.handle = (Timer_Handle)obj;
        timerInfo.period = period;

        /* Notify core 0 to change timer period */
        key = Core_notifySpinLock();
        Core_notify(&Timer_tickReconfigSmp, (UArg)&timerInfo, 0x1);
        Core_notifySpinUnlock(key);

        /*
         * Since Notify does not support return values,
         * check if the new timer period overflowed.
         */
        Timer_getFreq(obj, &freqHz);
        freqKHz = freqHz.lo/1000;
        if (Timer_checkOverflow(freqKHz, (UInt64)(period)/1000)) {
            return (FALSE);
        }
        else {
            return (TRUE);
        }
    }

    Core_hwiRestore(key);
#endif

    return Timer_setPeriodMicroSecs64(obj, (UInt64)period);
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 */
Bool Timer_setPeriodMicroSecs64(Timer_Object *obj, UInt64 period)
{
    Types_FreqHz freqHz;
    UInt64 freqKHz;

    /*
     * stop timer
     * compute counts
     * set period register
     */
    Timer_stop(obj);
    /* Today arm cortex-A15 support less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo/1000;
    if (Timer_checkOverflow(freqKHz, period/1000)) {
        return (FALSE);
    }
    else {
        obj->period = (freqKHz * period) / 1000;
        obj->periodType = Timer_PeriodType_COUNTS;
        return (TRUE);
    }
}

/*
 *  ======== Timer_setPeriod ========
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    Timer_stop(obj);
    obj->period = (UInt64)period;
}

/*
 *  ======== Timer_setPeriod64 ========
 */
Void Timer_setPeriod64(Timer_Object *obj, UInt64 period)
{
    Timer_stop(obj);
    obj->period = period;
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    return (UInt32)(obj->period);
}

/*
 *  ======== Timer_getPeriod64 ========
 */
UInt64 Timer_getPeriod64(Timer_Object *obj)
{
    return (obj->period);
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    UInt64 timerCount;

    if (obj->id == 0) {
        Timer_readPhyCnt(&timerCount);
    }
    else {
        Timer_readVirtCnt(&timerCount);
    }

    return (UInt32)(timerCount);
}

/*
 *  ======== Timer_getCount64 ========
 */
UInt64 Timer_getCount64(Timer_Object *obj)
{
    UInt64 timerCount;

    if (obj->id == 0) {
        Timer_readPhyCnt(&timerCount);
    }
    else {
        Timer_readVirtCnt(&timerCount);
    }

    return timerCount;
}

/*
 *  ======== Timer_oneShotStub ========
 */
Void Timer_oneShotStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;
    Timer_stop(obj);
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_periodicStub ========
 */
Void Timer_periodicStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;

    /* Re-program timer with new higher compare value */
    obj->prevThreshold = obj->nextThreshold;
    obj->nextThreshold = obj->prevThreshold + obj->period;

    /* do not reprogram Compare regs if in DYNAMIC mode  */
    if (obj->runMode != Timer_RunMode_DYNAMIC) {
        if (obj->id == 0) {
            Timer_writePhyCmpVal(&(obj->nextThreshold));
        }
        else {
            Timer_writeVirtCmpVal(&(obj->nextThreshold));
        }
    }

    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    UInt64 timerCount;

    if (obj->id == 0) {
        Timer_readPhyCnt(&timerCount);
    }
    else {
        Timer_readVirtCnt(&timerCount);
    }

    /*
     * prevThreshold has a value of 0 by default. This API
     * will return a meaningful value only after the first
     * timer ISR has been serviced.
     */
    return (UInt32)(timerCount - obj->prevThreshold);
}

/*
 *  ======== Timer_getExpiredTicks ========
 */
UInt32 Timer_getExpiredTicks(Timer_Object *obj, UInt32 tickPeriod)
{
    UInt32 ticks;

    ticks = Timer_getExpiredCounts(obj) / tickPeriod;

    return (ticks);
}

/*
 *  ======== Timer_getCurrentTick ========
 */
UInt32 Timer_getCurrentTick(Timer_Object *obj, Bool saveFlag)
{
    UInt32 tick;
    UInt64 currCount;

    currCount = Timer_getCount64(obj);

    tick = currCount / obj->period;

    if (saveFlag != 0) {
        obj->savedCurrCount = currCount;
    }

    return (tick);
}

/*
 *  ======== Timer_getFreq ========
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
    if (obj->extFreq.lo) {
        Assert_isTrue((obj->extFreq.hi == 0), NULL);
        freq->lo = obj->extFreq.lo;
        freq->hi = 0;
    }
    else {
        Assert_isTrue((Timer_intFreq.hi == 0), NULL);
        freq->lo = Timer_intFreq.lo;
        freq->hi = 0;
    }
}

/*
 *  ======== Timer_getFunc ========
 */
Timer_FuncPtr Timer_getFunc(Timer_Object *obj, UArg *arg)
{
    *arg = obj->arg;
    return (obj->tickFxn);
}

/*
 *  ======== Timer_setFunc ========
 */
Void Timer_setFunc(Timer_Object *obj, Timer_FuncPtr fxn, UArg arg)
{
    // TODO Dont we need to disable timer or interrupts ?
    obj->tickFxn = fxn;
    obj->arg = arg;
}

/*
 *  ======== Timer_checkOverflow ========
 */
Bool Timer_checkOverflow(UInt64 a, UInt64 b)
{
    return ((b > 0) && (a > Timer_MAX_PERIOD/b));
}

/*
 *  ======== Timer_trigger ========
 */
Void Timer_trigger(Timer_Object *obj, UInt32 cycles)
{
    UInt key;
    UInt64 period;
    UInt64 numCyclesPerTick;
    Types_FreqHz cpuFreq;
    Types_FreqHz timerFreq;

    BIOS_getCpuFreq(&cpuFreq);
    Timer_getFreq(obj, &timerFreq);

    /* The CPU and Timer frequency are less than 4.2 GHz */
    numCyclesPerTick = ((UInt64)(cpuFreq.lo)) / ((UInt64)timerFreq.lo);
    period = ((UInt64)cycles) / numCyclesPerTick;

    /* Account for division error */
    if (((cycles < numCyclesPerTick) && cycles) ||
         (cycles != (period * numCyclesPerTick))) {
        period = period + 1;
    }

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod64(obj, period);
    Timer_start(obj);
    Hwi_restore(key);
}

/*
 *  ======== Timer_tickReconfigSmp ========
 */
Void Timer_tickReconfigSmp(UArg arg)
{
    Timer_setPeriodMicroSecs(((struct TimerInfo *)arg)->handle,
        ((struct TimerInfo *)arg)->period);
}

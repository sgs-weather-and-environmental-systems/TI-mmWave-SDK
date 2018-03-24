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
 *  ======== Timer.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/family/arm/v7a/Pmu.h>
#include <ti/sysbios/hal/Hwi.h>

#include "package/internal/Timer.xdc.h"

#define PMU_CYCLE_EVENT 0x11    /* Event to count CPU cycles */

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
    Assert_isTrue((timerId < Timer_NUM_TIMER_DEVICES), NULL);

    if (Timer_module->availMask & 0x1) {
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
    return (0);
}

/*
 *  ======== Timer_setNextTick ========
 */
Void Timer_setNextTick(Timer_Object *obj, UInt32 ticks)
{
}

/*
 *  ======== Timer_Module_startup ========
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(Int status)
{
    Timer_Object *obj;

    if (Hwi_Module_startupDone() && Pmu_Module_startupDone()) {
        obj = Timer_module->handle;
        /* if timer was statically created/constructed */
        if ((obj != NULL) && (obj->staticInst)) {
            Timer_postInit(obj, NULL);
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
    Timer_Object *obj;

    if (Timer_startupNeeded) {
        obj = Timer_module->handle;
        /* if timer was statically created/constructed */
        if ((obj != NULL) && (obj->staticInst)) {
            if (obj->startMode == Timer_StartMode_AUTO) {
                Timer_start(obj);
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
        return (Timer_module->handle);
    }
}

/*
 *  ======== Timer_Instance_init ========
 * 1. Select timer based on id
 * 2. Mark timer as in use
 * 3. Save timer handle if necessary (needed by TimestampProvider on 64).
 * 4. Init obj using params
 * 5. Register tickFxn with PMU module
 * 6. Timer_init()
 * 7. Timer configuration (wrt emulation, external frequency etc)
 * 8. Timer_setPeriod()
 * 9. Timer_start()
 */
Int Timer_Instance_init(Timer_Object *obj, Int id, Timer_FuncPtr tickFxn,
        const Timer_Params *params, Error_Block *eb)
{
    UInt key;
    Int status;
    UInt tempId = 0xFFFF;
    Hwi_Params hwiParams;

    if (id >= Timer_NUM_TIMER_DEVICES) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();

    if (id == Timer_ANY) {
        if (Timer_anyMask && Timer_module->availMask) {
            Timer_module->availMask = 0;
            tempId = 0;
        }
    }
    else if (Timer_module->availMask) {
        Timer_module->availMask = 0;
        tempId = 0;
    }

    Hwi_restore(key);

    obj->staticInst = FALSE;

    if (tempId == 0xFFFF) {
        Error_raise(eb, Timer_E_notAvailable, id, 0);
        return (2);
    }

    Timer_module->handle = obj;

    obj->runMode       = params->runMode;
    obj->startMode     = params->startMode;
    obj->periodType    = params->periodType;
    obj->arg           = params->arg;
    obj->tickFxn       = tickFxn;
    obj->period        = params->period;

    /* Create the Hwi object */
    if(obj->tickFxn != NULL) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, params->hwiParams);
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        hwiParams.arg = (UArg)obj;
        /* Periodic/Dynamic Timer operation not tested */
        if ((obj->runMode == Timer_RunMode_CONTINUOUS) ||
            (obj->runMode == Timer_RunMode_DYNAMIC)) {

            obj->hwi = Hwi_create(Pmu_intNum, Timer_periodicStub,
                                  &hwiParams, eb);
        }
        else {
            obj->hwi = Hwi_create(Pmu_intNum, Timer_oneShotStub,
                                  &hwiParams, eb);
        }
    }
    else {
        obj->hwi = NULL;
    }

    if(obj->hwi == NULL) {
        return (4);
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
 *  ======== Timer_postInit ========
 *
 *  1. Initialize Timer device
 *  2. Set Period.
 */
Int Timer_postInit (Timer_Object *obj, Error_Block *eb)
{
    UInt key;

    key = Hwi_disable();

    Timer_initDevice(obj);
    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            Hwi_restore(key);

            return (3);
        }
    }
    else {
        Timer_setPeriod(obj, obj->period);
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
            if(obj->hwi) {
                Hwi_delete(&obj->hwi);
            }
        /* setPeriodMicroSecs failed */
        case 3:
            Timer_initDevice(obj);

        default:
            break;
    };

    Pmu_setInterruptFunc(NULL);

    key = Hwi_disable();
    Timer_module->availMask = 0x1;
    Timer_module->handle = NULL;
    Hwi_restore(key);
}

/*
 * ======== Timer_initDevice ========
 * 1. stop timer
 * 2. disable timer interrupt (Interrupt controller's interrupt and any timer
 *                             specific interrupt)
 * 3. clear pending interrupt (Interrupt controller's interrupt and any timer
 *                             specific interrupt flags)
 *
 */
Void Timer_initDevice(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    Pmu_stopCounterI(0);
    Pmu_disableInterruptI(0);
    Pmu_clearOverflowStatusI(0);
    Pmu_configureCounter(0, PMU_CYCLE_EVENT, FALSE);

    Hwi_restore(key);
}

/*
 *  ======== Timer_start ========
 *  Follow the below sequence:
 *  1. Globally disable interrupts.
 *  2. Clear timer interrupt
 *  3. Enable timer interrupt
 *  4. Start/Enable timer
 *  5. Globally enable interrupts.
 *
 */
Void Timer_start(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    Pmu_enableInterruptI(0);
    Pmu_startCounterI(0);

    Hwi_restore(key);
}



/*
 *  ======== Timer_stop ========
 */
Void Timer_stop(Timer_Object *obj)
{
    Pmu_stopCounterI(0);
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 */
Bool Timer_setPeriodMicroSecs(Timer_Object *obj, UInt32 period)
{
    Types_FreqHz freqHz;
    UInt64 counts;
    UInt32 freqKHz;

    /*
     * stop timer
     * compute counts
     * set period register
     */
    Timer_stop(obj);
    /* Today all cortex-A cores support less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo / 1000;
    if (Timer_checkOverflow(freqKHz, (period / 1000))) {
        return (FALSE);
    }
    else {
        counts = ((UInt64)freqKHz * (UInt64)period) / (UInt64)1000;
        obj->period = (UInt32)counts;
        obj->periodType = Timer_PeriodType_COUNTS;
        Pmu_setCountI(0, Timer_MAX_PERIOD - counts + 1);
        return(TRUE);
    }
}

/*
 *  ======== Timer_setPeriod ========
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    Timer_stop(obj);
    obj->period = period;
    Pmu_setCountI(0, Timer_MAX_PERIOD - period + 1);
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    return (obj->period);
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    return Pmu_getCountI(0);
}

/*
 *  ======== Timer_oneShotStub ========
 */
Void Timer_oneShotStub(UArg arg)
{
    /*
     * oneShotStub is registered with the PMU module and the argument
     * is the overflow status flag register value and not the Timer
     * object handle. Need to use Timer_getHandle() to determine the
     * timer object pointer. Since this module manages a single timer,
     * it is safe to call Timer_getHandle() with timer id argument 0.
     */
    Timer_Object *obj = Timer_getHandle(0);

    Timer_stop(obj);

    /* Acknowledge interrupt */
    Pmu_clearOverflowStatusI(0);

    /* Call the user's ISR */
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_periodicStub ========
 */
Void Timer_periodicStub(UArg arg)
{
    /*
     * periodicStub is registered with the PMU module and the argument
     * is the overflow status flag register value and not the Timer
     * object handle. Need to use Timer_getHandle() to determine the
     * timer object pointer. Since this module manages a single timer,
     * it is safe to call Timer_getHandle() with timer id argument 0.
     */
    Timer_Object *obj = Timer_getHandle(0);

    /* Acknowledge Interrupt */
    Pmu_clearOverflowStatusI(0);

    Pmu_setCountI(0, Timer_MAX_PERIOD - (obj->period) + Pmu_getCountI(0) + 1);

    /* Call the user's ISR */
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    return (Pmu_getCountI(0) - Timer_MAX_PERIOD + (obj->period) - 1);
}

/*
 *  ======== Timer_getExpiredTicks ========
 */
UInt32 Timer_getExpiredTicks(Timer_Object *obj, UInt32 tickPeriod)
{
    return (0);
}

/*
 *  ======== Timer_getCurrentTick ========
 */
UInt32 Timer_getCurrentTick(Timer_Object *obj, Bool saveFlag)
{
    return (0);
}

/*
 *  ======== Timer_getFreq ========
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
    /*
     * PMU counter uses CPU cycle as the event and hence is
     * clocked at CPU frequency.
     */
    BIOS_getCpuFreq(freq);
    Assert_isTrue((freq->hi == 0), NULL);
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
    obj->tickFxn = fxn;
    obj->arg = arg;
}

/*
 *  ======== Timer_checkOverflow ========
 */
Bool Timer_checkOverflow(UInt32 a, UInt32 b)
{
    return ((b > 0) && (a > Timer_MAX_PERIOD / b));
}

/*
 *  ======== Timer_trigger ========
 *  The timer frequency is same as CPU frequency, so just set the period
 *  to the cycle count.
 */
Void Timer_trigger(Timer_Object *obj, UInt32 cycles)
{
    UInt key;

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, cycles);
    Timer_start(obj);
    Hwi_restore(key);
}

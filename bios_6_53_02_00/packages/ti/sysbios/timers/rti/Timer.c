/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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
#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Timer.xdc.h"

/* Timer Global Control Register Description
 * Bit#         Name            Value
 * 31-20        RESERVED
 * 19-16        NTUSEL          0h NTU0
 *                              5h NTU1
 *                              Ah NTU2
 *                              Fh NTU3
 * 15           COS             0h Counters stopped during emulation halt
 *                              1h Counters running during emulation halt
 * 14-2         RESERVED
 * 1            CNT1EN          0h Counter block 1 is stopped (disabled)
 *                              1h Counter block 1 is running (enabled)
 * 0            CNT0EN          0h Counter block 0 is stopped (disabled)
 *                              1h Counter block 0 is running (enabled)
 */

#define TIMER_GCTRL_CNT1EN      0x2
#define TIMER_GCTRL_CNT0EN      0x1
#define TIMER_GCTRL_COS         0x8000
#define TIMER_GCTRL_NOCOS       0xFFFF7FFF

#define TIMER_SETINTENA_INT1    0x2
#define TIMER_SETINTENA_INT0    0x1

#define TIMER_INTFLAG_INT1      0x2
#define TIMER_INTFLAG_INT0      0x1

#define TIMER_COMPCTRL_SEL1     0x10            /* compare1 with FRC 1 */
#define TIMER_COMPCTRL_SEL0     0xFFFFFFFE      /* compare0 with FRC 0 */

#define TIMER_TBCTRL_TBEXT      0xFFFFFFFE

#define TIMER_MINPERIOD         0x1

/*
 *  ======== Timer_getNumTimers ========
 */
UInt Timer_getNumTimers()
{
    return (Timer_numTimerDevices);
}

/*
 *  ======== Timer_getStatus ========
 */
Timer_Status Timer_getStatus(UInt timerId)
{
    Assert_isTrue(timerId < (UInt)Timer_numTimerDevices, Timer_A_invalidTimer);

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
 *  ======== Timer_setNextTick ========
 */
Void Timer_setNextTick(Timer_Object *obj, UInt32 ticks){
}

/*
 *  ======== Timer_Module_startup ========
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(status)
{
    Int i;
    Timer_Object *obj;
    Timer_DeviceRegs *deviceRegs;

    if (Timer_startupNeeded) {
        for (i = 0; i < Timer_numTimerDevices; i++) {
            obj = Timer_module->handles[i];
            /* if timer was statically created/constructed */
            if ((obj != NULL) && (obj->staticInst)) {
                Timer_postInit(obj, NULL);
            }
        }
    }

    for (i = 0; i < Timer_numTimerDevices; i += 2) {
        deviceRegs = (Timer_DeviceRegs *)Timer_module->device[i].baseAddr;
        if (!Timer_continueOnSuspend) {
            deviceRegs->RTIGCTRL &= TIMER_GCTRL_NOCOS;
        }
        else {
            deviceRegs->RTIGCTRL |= TIMER_GCTRL_COS;
        }
    }

    return (Startup_DONE);
}

/*
 *  ======== Timer_startup ========
 *  Here after main(). Called from BIOS_start()
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Void Timer_startup()
{
    Int i;
    Timer_Object *obj;

    if (Timer_startupNeeded) {
        for (i = 0; i < Timer_numTimerDevices; i++) {
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
    Assert_isTrue((id < (UInt)Timer_numTimerDevices), NULL);
    return (Timer_module->handles[id]);
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
Int Timer_Instance_init(Timer_Object *obj, Int id, Timer_FuncPtr tickFxn, const Timer_Params *params, Error_Block *eb)
{
    UInt key;
    Int i, status;
    Hwi_Params hwiParams;
    UInt tempId = 0xffff;

    if (id >= Timer_numTimerDevices) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();
    if (id == -1) {
        for (i = 0; i < Timer_numTimerDevices; i++) {
            if ((Timer_anyMask & (1 << i))
                && (Timer_module->availMask & (1 << i))) {
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

    if (tempId == 0xffff) {
        Error_raise(eb, Timer_E_notAvailable, id, 0);
        return (2);
    }
    else {
        obj->id = tempId;
    }

    Timer_module->handles[obj->id] = obj;
    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->prescale = params->prescale;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->arg = params->arg;
    obj->intNum = Timer_module->device[obj->id].intNum;
    obj->tickFxn = tickFxn;
    obj->createHwi = params->createHwi;

    /* extFreq.hi is ignored */
    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }

    if (obj->tickFxn && obj->createHwi) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        if (Timer_module->device[obj->id].eventId != 0) {
            hwiParams.eventId = Timer_module->device[obj->id].eventId;
        }

        if (obj->runMode == Timer_RunMode_ONESHOT) {
            if (hwiParams.maskSetting == Hwi_MaskingOption_NONE) {
                Error_raise(eb, Timer_E_invalidHwiMask, 0, 0);
                return (3);
            }
        }

        hwiParams.arg = (UArg)obj;
        if (obj->runMode == Timer_RunMode_CONTINUOUS) {
            obj->hwi = Hwi_create (obj->intNum, Timer_periodicStub,
                &hwiParams, eb);
        }
        else {
            obj->hwi = Hwi_create (obj->intNum, Timer_oneShotStub,
                &hwiParams, eb);
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
    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->prescale = params->prescale;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->arg = params->arg;
    obj->tickFxn = tickFxn;
    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }

    /* Since timer requires a stub func, no Hwi reconfig is needed */

    Timer_postInit(obj, eb);

    if (obj->startMode == Timer_StartMode_AUTO) {
        Timer_start(obj);
    }
}

/*
 *  ======== Timer_postInit ========
 */
Int Timer_postInit (Timer_Object *obj, Error_Block *eb)
{
    UInt key;
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    key = Hwi_disable();

    Timer_initDevice(obj);

    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            Hwi_restore(key);
            return (5);
        }
    }
    else {
        Timer_setPeriod(obj, obj->period);
    }

    /* Set prescaler, enable interrupt and select counter for comparator */
    if (obj->id & 0x1) {
        deviceRegs->RTICPUC1 = obj->prescale;
        deviceRegs->RTISETINTENA |= TIMER_SETINTENA_INT1;
        deviceRegs->RTICOMPCTRL |= TIMER_COMPCTRL_SEL1;
    }
    else {
        /* Use internal up-counter to clock free-running counter 0 */
        deviceRegs->RTITBCTRL &= TIMER_TBCTRL_TBEXT;
        deviceRegs->RTICPUC0 = obj->prescale;
        deviceRegs->RTISETINTENA |= TIMER_SETINTENA_INT0;
        deviceRegs->RTICOMPCTRL &= TIMER_COMPCTRL_SEL0;
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

        /* timer not available */
        case 2:

        /* invalid timer id */
        case 1:

        default:
            break;
    };

    key = Hwi_disable();
    Timer_module->availMask |= (0x1 << obj->id);
    Timer_module->handles[obj->id] = NULL;
    Hwi_restore(key);
}

/* ======== Timer_initDevice ========
 * 1. stop timer
 * 2. disable timer interrupt. (IER and any timer specific interrupt enable)
 * 3. clear pending interrupt. (IFR and any timer specific interrupt flags)
 * 4. Set control registers back to reset value.
 * 5. clear counters
 * 6. clear period register.
 */
Void Timer_initDevice(Timer_Object *obj)
{
    UInt key;
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    key = Hwi_disable();
    if (obj->id & 0x1) {
        deviceRegs->RTIGCTRL &= (~TIMER_GCTRL_CNT1EN);
        if (obj->hwi) {
            Hwi_disableInterrupt(obj->intNum);
            Hwi_clearInterrupt(obj->intNum);
            deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT1;
        }
        deviceRegs->RTIUDCP1 = 0;
        deviceRegs->RTICOMP1 = 0;
        deviceRegs->RTICPUC1 = 0;
    }
    else {
        deviceRegs->RTIGCTRL &= (~TIMER_GCTRL_CNT0EN);
        if (obj->hwi) {
            Hwi_disableInterrupt(obj->intNum);
            Hwi_clearInterrupt(obj->intNum);
            deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT0;
        }
        deviceRegs->RTIUDCP0 = 0;
        deviceRegs->RTICOMP0 = 0;
        deviceRegs->RTICPUC0 = 0;
    }
    Hwi_restore(key);
}

/*
 *  ======== Timer_start ========
 * 1. Hwi_disable();
 * 2. Clear the counters
 * 3. Clear IFR
 * 4. Enable timer interrupt
 * 5. Start timer
 * 6. Hwi_restore()
 */
Void Timer_start(Timer_Object *obj)
{
    UInt key;
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    key = Hwi_disable();
    if (obj->id & 0x1) {
        deviceRegs->RTIUC1 = 0;
        deviceRegs->RTIFRC1 = 0;
        deviceRegs->RTICOMP1 = obj->period;
        if (obj->hwi) {
            deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT1;
            Hwi_enableInterrupt(obj->intNum);
        }
        deviceRegs->RTIGCTRL |= TIMER_GCTRL_CNT1EN;
    }
    else {
        deviceRegs->RTIUC0 = 0;
        deviceRegs->RTIFRC0 = 0;
        deviceRegs->RTICOMP0 = obj->period;
        if (obj->hwi) {
            deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT0;
            Hwi_enableInterrupt(obj->intNum);
        }
        deviceRegs->RTIGCTRL |= TIMER_GCTRL_CNT0EN;
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
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    key = Hwi_disable();
    if (obj->id & 0x1) {
        deviceRegs->RTIGCTRL &= (~TIMER_GCTRL_CNT1EN);
    }
    else {
        deviceRegs->RTIGCTRL &= (~TIMER_GCTRL_CNT0EN);
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
    Types_FreqHz freqHz;
    UInt64 counts;
    UInt32 freqKHz;

    /*
     * stop timer
     * compute counts
     * set period register
     */
    Timer_stop(obj);
    /* Today all targets that use this module support less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo / 1000;
    if (Timer_checkOverflow(freqKHz, period / 1000)) {
        return (FALSE);
    }
    else {
        /* Cast to UInt64 to prevent overflow during computation */
        counts = ((UInt64)freqKHz * (UInt64)period) / 1000;
        obj->period = (UInt32)counts;
        obj->periodType = Timer_PeriodType_COUNTS;
        Timer_setPeriod(obj, counts);
        return(TRUE);
    }
}

/*
 *  ======== Timer_setPeriod ========
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    UInt key;
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    Timer_stop(obj);

    obj->period = period;

    key = Hwi_disable();
    if (obj->id & 0x1) {
        deviceRegs->RTIUDCP1 = period;
    }
    else {
        deviceRegs->RTIUDCP0 = period;
    }
    Hwi_restore(key);
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    if (obj->id & 0x1) {
        return (deviceRegs->RTIUDCP1);
    }
    else {
        return (deviceRegs->RTIUDCP0);
    }
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    if (obj->id & 0x1) {
        return (deviceRegs->RTIFRC1);
    }
    else {
        return (deviceRegs->RTIFRC0);
    }
}

/*
 *  ======== Timer_ackInterrupt ========
 */
Void Timer_ackInterrupt(Timer_Object *obj)
{
    Timer_DeviceRegs *deviceRegs;

    deviceRegs = (Timer_DeviceRegs *)Timer_module->device[obj->id].baseAddr;

    if (obj->id & 0x1) {
        deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT1;
    }
    else {
        deviceRegs->RTIINTFLAG = TIMER_INTFLAG_INT0;
    }
}

/*
 *  ======== Timer_oneShotStub ========
 */
Void Timer_oneShotStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;
    Timer_stop(obj);
    Timer_ackInterrupt(obj);
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_periodicStub ========
 */
Void Timer_periodicStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;
    Timer_ackInterrupt(obj);
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    /*
     * This function is used by the timer based TimestampProvider only.
     * Since this device uses PMU for timestamping, this function is not
     * implemented.
     */
    return (0);
}

/*
 *  ======== Timer_getExpiredTicks ========
 */
UInt32 Timer_getExpiredTicks(Timer_Object *obj, UInt32 tickPeriod)
{
    return (0);
}

/*
 *  ======== Timer_getFreq ========
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
    if (obj->extFreq.lo) {
        Assert_isTrue((obj->extFreq.hi == 0), NULL);
        freq->lo = (obj->extFreq.lo) / (obj->prescale + 1);
        freq->hi = 0;
    }
    else {
        Assert_isTrue((Timer_module->intFreqs[obj->id].hi == 0), NULL);
        freq->lo = Timer_module->intFreqs[obj->id].lo / (obj->prescale + 1);
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
    obj->tickFxn = fxn;
    obj->arg = arg;
}

/*
 *  ======== Timer_checkOverflow ========
 */
Bool Timer_checkOverflow(UInt32 a, UInt32 b)
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
    UInt64 cpuCounts, timerCounts;
    Types_FreqHz timerfreq, cpufreq;

    /* get CPU frequency */
    BIOS_getCpuFreq(&cpufreq);
    cpuCounts = (UInt64)cpufreq.hi << 32;
    cpuCounts |=  cpufreq.lo;

    /* get Timer frequency */
    Timer_getFreq(obj, &timerfreq);
    timerCounts = (UInt64)timerfreq.hi << 32;
    timerCounts |= timerfreq.lo;

    numCyclesPerTick = cpuCounts / timerCounts;
    period = ((UInt64)cycles) / numCyclesPerTick;

    /* Account for division error */
    if (((cycles < numCyclesPerTick) && cycles) ||
         (cycles != (period * numCyclesPerTick))) {
        period = period + 1;
    }

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, (UInt32)period);
    Timer_start(obj);
    Hwi_restore(key);
}

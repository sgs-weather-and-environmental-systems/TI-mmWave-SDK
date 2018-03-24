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

#include <ti/sysbios/family/arp32/Hwi.h>
#include <ti/sysbios/family/arp32/CTM.h>

#include "package/internal/Timer.xdc.h"

/*
 *  ======== Timer_checkOverflow ========
 */
Bool Timer_checkOverflow(UInt32 a, UInt32 b)
{
    return ((b > 0) && (a > Timer_MAX_PERIOD/b));
}

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
 *  ======== Timer_Module_startup ========
 *  Calls Timer_postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(Int status)
{
    Int i;
    UInt hwiKey;
    Timer_Object *obj;

    hwiKey = Hwi_disable();

    /* enable the CTM timer */
    Timer_module->baseAddr[0] |= 1;     //CTM_ctm.CTCNTL |= 1; /* not wokring*/

    Hwi_restore(hwiKey);

    if (Timer_startupNeeded) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            obj = Timer_module->handles[i];

            /* if timer was statically created/constructed */
            if ((obj != NULL) && (obj->staticInst)) {
                Timer_postInit(obj, NULL);
            }
        }
    }
    return (Startup_DONE);
}

/*
 *  ======== Timer_startup ========
 *  Here after main(). Called from BIOS_start()
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
Int Timer_Instance_init(Timer_Object *obj, Int id, Timer_FuncPtr tickFxn, const Timer_Params *params, Error_Block *eb)
{
    UInt key;
    Int i, status;
    Hwi_Params hwiParams;
    UInt tempId = 0xffff;

    if (id >= Timer_NUM_TIMER_DEVICES) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();

    if (id == Timer_ANY) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
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

    /* if timer id == 0 */
    if (obj->id == 0) {
        obj->ctmid  = 0;
        obj->intNum = 17;
    }
    else if (obj->id == 1) {
        obj->ctmid  = 1;
        obj->intNum = 18;
    }

    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->extFreq.lo = params->extFreq.lo;
    obj->extFreq.hi = params->extFreq.hi;

    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            Hwi_restore(key);
            return (4);
        }
    }

    obj->arg = params->arg;
    obj->tickFxn = tickFxn;

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        /* CTM doesn't need to be acknowledged, no stub required */
        hwiParams.arg = obj->arg;
        obj->hwi = Hwi_create (obj->intNum, obj->tickFxn,
                               &hwiParams, eb);

        if (obj->hwi == NULL) {
            return (3);
        }
    }
    else {
        obj->hwi = NULL;
    }

    Timer_module->handles[obj->id] = obj;

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
 *  1. Init obj using params
 *  2. Reconfig Hwi
 *  3. Timer_init()
 *  4. Timer configuration (wrt emulation, external frequency etc)
 *  5. Timer_setPeriod()
 *  6. Timer_start()
 */
Void Timer_reconfig (Timer_Object *obj, Timer_FuncPtr tickFxn, const Timer_Params *params,
    Error_Block *eb)
{
    Hwi_Params hwiParams;

    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->period = params->period;
    obj->periodType = params->periodType;

    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
        }
    }

    obj->arg = params->arg;
    obj->tickFxn = tickFxn;

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        hwiParams.arg = obj->arg;
        Hwi_reconfig (obj->hwi, obj->tickFxn, &hwiParams);
    }

    Timer_postInit(obj, eb);

    if (obj->startMode == Timer_StartMode_AUTO) {
        Timer_start(obj);
    }
}

/*
 *  ======== Timer_postInit ========
 */
Int Timer_postInit(Timer_Object *obj, Error_Block *eb)
{
    UInt hwiKey;

    hwiKey = Hwi_disable();

    Timer_initDevice(obj);

    Timer_setPeriod(obj, obj->period);

    Hwi_restore(hwiKey);

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
        case 4:
            Timer_initDevice(obj);
            if (obj->hwi) {
                Hwi_delete(&obj->hwi);
            }

        /* Hwi create failed */
        case 3:

        /* timer not available */
        case 2:

        /* invalid timer id */
        case 1:

        default:
            break;
    }

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

    key = Hwi_disable();

    CTM_ctm.CTCR[obj->ctmid] = 2;       /* reset, stop, disable */

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
        Hwi_clearInterrupt(obj->intNum);
    }

    Hwi_restore(key);
}


/*
 *  ======== Timer_start ========
 *  1. Hwi_disable();
 *  2. Clear the counters
 *  3. Clear IFR
 *  4. Enable timer interrupt
 *  5. Start timer
 *  6. Hwi_restore()
 */
Void Timer_start(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    if (obj->hwi) {
        Hwi_clearInterrupt(obj->intNum);
        Hwi_enableInterrupt(obj->intNum);
    }

    if (obj->runMode == Timer_RunMode_CONTINUOUS) {
        /* RESTART=1, INT=1, ENBL=1 */
        CTM_ctm.CTCR[obj->ctmid] = 0x00000501;
    }
    else {
        /* RESTART=0, INT=1, ENBL=1 */
        CTM_ctm.CTCR[obj->ctmid] = 0x00000101;
    }

    Hwi_restore(key);
}

/*
 *  ======== Timer_trigger ========
 *  1. stop timer
 *  2. write the period with insts
 *  3. start the timer.
 */
Void Timer_trigger(Timer_Object *obj, UInt insts)
{
    UInt key;

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();

    /* RESET=1, ENBL=0 */
    CTM_ctm.CTCR[obj->ctmid] = 2;
    Hwi_clearInterrupt(obj->intNum);
    Hwi_enableInterrupt(obj->intNum);

    /* set interval to insts */
    CTM_ctm.TINTVLR[obj->ctmid] = insts;

    /* RESTART=0, INT=1, ENBL=1 */
    CTM_ctm.CTCR[obj->ctmid] = 0x00000101;

    Hwi_restore(key);
}

/*
 *  ======== Timer_stop ========
 *  1. stop timer
 *  2. disable timer interrupt
 */
Void Timer_stop(Timer_Object *obj)
{
    /* CTM Timer */
    CTM_ctm.CTCR[obj->ctmid] = 2;       /* reset, stop, disable */

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
    }
}

/*
 *  ======== Timer_setPeriod ========
 *  1. stop timer
 *  2. set period register
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    Timer_stop(obj);
    obj->period = period;

    /* CTM Timer */
    CTM_ctm.TINTVLR[obj->ctmid] = period;
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 *  1. stop timer
 *  2. compute counts
 *  3. set period register
 */
Bool Timer_setPeriodMicroSecs(Timer_Object *obj, UInt32 period)
{
    Types_FreqHz freqHz;
    UInt64 counts;
    UInt32 freqKHz;

    Timer_stop(obj);

    Timer_getFreq(obj, &freqHz);
    freqKHz = freqHz.lo / 1000;

    /* check if period overflows */
    if (Timer_checkOverflow(freqKHz, period/1000)) {
        return(FALSE);
    }

    counts = ((UInt64)freqKHz * (UInt64)period) / (UInt64)1000;

    obj->period = counts;
    obj->periodType = Timer_PeriodType_COUNTS;

    Timer_setPeriod(obj, counts);

    return(TRUE);
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
    return (CTM_ctm.CTCNTR[obj->ctmid]);
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    UInt key;
    UInt32 count1, count2;
    Bool countFlag;
    extern cregister volatile unsigned int IFR;

    key = Hwi_disable();
    count1 = Timer_getCount(obj);

    /* Test corresponding Int pending flag */
    countFlag = IFR & (1 << obj->intNum);

    count2 = Timer_getCount(obj);
    Hwi_restore(key);

    /* CTM Timer */
    if (count2 < count1 && countFlag) {
        return (count1 + Timer_getPeriod(obj));
    }
    else {
        return (count1) ;
    }
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
 *  get timer prd frequency in Hz.
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
    if (obj->extFreq.lo != NULL) {
        *freq = obj->extFreq;
    }
    else {
        BIOS_getCpuFreq(freq);
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

    Hwi_setFunc(obj->hwi, fxn, arg);
}

/*
 *  ======== Timer_getMaxTicks ========
 */
UInt32 Timer_getMaxTicks(Timer_Object *obj)
{
    return (0xFFFFFFFF / obj->period);
}

/*
 *  ======== Timer_setNextTick ========
 */
Void Timer_setNextTick(Timer_Object *obj, UInt32 ticks)
{
}



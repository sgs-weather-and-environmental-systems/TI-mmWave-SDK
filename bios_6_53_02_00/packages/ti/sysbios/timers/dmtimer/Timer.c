/*
 * Copyright (c) 2013-2016, Texas Instruments Incorporated
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

#include <string.h>

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Timestamp.h>

#ifdef xdc_target__isaCompatible_66
#define ti_sysbios_family_c64p_Hwi__nolocalnames
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/hal/Hwi.h>
#else
#include <ti/sysbios/hal/Hwi.h>
#endif

#include <ti/sysbios/BIOS.h>
#include "package/internal/Timer.xdc.h"


#define TIMER_TCLR_START_ONESHOT        0x1
#define TIMER_TCLR_START_CONTINUOUS     0x3
#define TIMER_TCLR_START_DYNAMIC        0x43
#define TIMER_TCLR_STOP_MASK            0xfffffffe
#define TIMER_TWPS_W_PEND_TMAR          0x10
#define TIMER_TWPS_W_PEND_TLDR          0x4
#define TIMER_TWPS_W_PEND_TCRR          0x2
#define TIMER_TWPS_W_PEND_TCLR          0x1
#define TIMER_IRQSTATUS_OVF_IT_FLAG     0x2
#define TIMER_IRQSTATUS_MAT_IT_FLAG     0x1
#define TIMER_TIOCP_CFG_SOFTRESET_FLAG  0x1
#define TIMER_TSICR_POSTED              0x4
#define TIMER_TSICR_READMODE            0x8

typedef volatile struct TimerRegs {
    UInt tidr;
    UInt empty[3];
    UInt tiocpCfg;
    UInt empty1[3];
    UInt irq_eoi;
    UInt irqstat_raw;
    UInt tisr;  /* irqstat */
    UInt tier;  /* irqen_set */
    UInt irqen_clr;
    UInt twer;  /* irqwaken; */
    UInt tclr;
    UInt tcrr;
    UInt tldr;
    UInt ttgr;
    UInt twps;
    UInt tmar;
    UInt tcar1;
    UInt tsicr;
    UInt tcar2;
} TimerRegs;

/*
 *  ======== Timer_checkOverflow ========
 */
Bool Timer_checkOverflow(UInt32 a, UInt32 b)
{
    return ((b > 0) && (a > Timer_MAX_PERIOD/b));
}

/*
 *  ======== Timer_initObj ========
 *  Initialize the instance state object
 */
Void Timer_initObj(Timer_Object *obj, Timer_FuncPtr tickFxn,
        const Timer_Params *params)
{
    obj->tickFxn = tickFxn;

    obj->tiocpCfg = (params->tiocpCfg.softreset << 0) |
                    (params->tiocpCfg.emufree   << 1) |
                    (params->tiocpCfg.idlemode  << 2);

    obj->tier = (params->tier.mat_it_ena) |
               (params->tier.ovf_it_ena << 1) |
               (params->tier.tcar_it_ena << 2);

    obj->twer = (params->twer.mat_wup_ena) |
                (params->twer.ovf_wup_ena << 1) |
                (params->twer.tcar_wup_ena << 2);

    obj->tclr = (params->tclr.ptv << 2) |
                (params->tclr.pre << 5) |
                (params->tclr.ce << 6) |
                (params->tclr.scpwm << 7) |
                (params->tclr.tcm << 8) |
                (params->tclr.trg << 10) |
                (params->tclr.pt << 12) |
                (params->tclr.captmode << 13) |
                (params->tclr.gpocfg << 14);

    obj->tsicr = (params->tsicr.sft << 1) |
                 (params->tsicr.posted << 2) |
                 (params->tsicr.readmode << 3);

    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->arg = params->arg;
    if (params->intNum == -1) {
        obj->intNum = (UInt) Timer_module->device[obj->id].intNum;
    }
    else {
        obj->intNum = params->intNum;
    }
    if (params->eventId == -1) {
        obj->eventId = Timer_module->device[obj->id].eventId;
    }
    else {
        obj->eventId = params->eventId;
    }
    obj->extFreq.lo = params->extFreq.lo;

}

/*
 *  ======== Timer_initDevice ========
 */
Void Timer_initDevice(Timer_Object *obj, Error_Block *eb)
{
    TimerRegs *timer;
    UInt hwiKey;

    Timer_TimerSupportProxy_enable(obj->id, eb);

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    hwiKey = Hwi_disable();

    timer->tclr = 0;
    while (timer->twps & TIMER_TWPS_W_PEND_TCLR)
        ;
    timer->tcrr = 0;
    while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
        ;
    timer->tldr = 0;
    while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
        ;

    if (obj->hwi) {
        /* clear any previously latched timer interrupts */
        Hwi_clearInterrupt(obj->intNum);
        Hwi_disableInterrupt(obj->intNum);
    }

    Hwi_restore(hwiKey);
}

/*
 *  ======== Timer_deviceConfig ========
 *  Configure the timer.
 */
Int Timer_deviceConfig(Timer_Object *obj, Error_Block *eb)
{
    TimerRegs *timer;
    UInt hwiKey;
    UInt32 tsicr;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    /* initialize the timer */
    Timer_initDevice(obj, eb);

    hwiKey = Hwi_disable();

    /* if doing SOFTRESET: do it first before setting other flags */
    if (obj->tiocpCfg & TIMER_TIOCP_CFG_SOFTRESET_FLAG) {
        timer->tiocpCfg = TIMER_TIOCP_CFG_SOFTRESET_FLAG;
        while (timer->tiocpCfg & TIMER_TIOCP_CFG_SOFTRESET_FLAG)
                ;
    }
    timer->tiocpCfg = obj->tiocpCfg & ~TIMER_TIOCP_CFG_SOFTRESET_FLAG;

    /* xfer 'posted' setting if not current */
    tsicr = timer->tsicr;

    if (obj->tsicr & TIMER_TSICR_POSTED) {
        if ((tsicr & TIMER_TSICR_POSTED) == 0) {
            timer->tsicr = (tsicr | TIMER_TSICR_POSTED);
        }
    }
    else {
        if ((tsicr & TIMER_TSICR_POSTED) != 0) {
            timer->tsicr = (tsicr & ~TIMER_TSICR_POSTED);
        }
    }

    /* xfer 'readmode' setting if not current */
    tsicr = timer->tsicr;

    if (obj->tsicr & TIMER_TSICR_READMODE) {
        if ((tsicr & TIMER_TSICR_READMODE) == 0) {
            timer->tsicr = (tsicr | TIMER_TSICR_READMODE);
        }
    }
    else {
        if ((tsicr & TIMER_TSICR_READMODE) != 0) {
            timer->tsicr = (tsicr & ~TIMER_TSICR_READMODE);
        }
    }

    /* set the period */
    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Hwi_restore(hwiKey);
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            return (3);
        }
    }
    else {
        if (obj->runMode != Timer_RunMode_DYNAMIC) {
            timer->tcrr = Timer_MAX_PERIOD - obj->period;
            while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
                ;
            timer->tldr = Timer_MAX_PERIOD - obj->period;
            while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
                ;
        }
        else {
            timer->tcrr = 0;
            while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
                ;
            timer->tmar = obj->period;
            while (timer->twps & TIMER_TWPS_W_PEND_TMAR)
                ;
        }
    }

    if (obj->runMode != Timer_RunMode_DYNAMIC) {
        timer->tmar = obj->tmar;
        while (timer->twps & TIMER_TWPS_W_PEND_TMAR)
            ;
    }

    timer->twer = obj->twer;
    timer->tier = obj->tier;
    timer->tclr = obj->tclr;
    while (timer->twps & TIMER_TWPS_W_PEND_TCLR)
        ;

    Hwi_restore(hwiKey);
    return (0);
}


/*
 *  ======== Timer_postInit ========
 */
Int Timer_postInit(Timer_Object *obj, Error_Block *eb)
{
    if (Timer_checkFrequency && Timer_module->firstInit) {
        /* Verify timer frequency */
        Timer_checkFreq(obj);
    }

    Timer_module->firstInit = FALSE;

    /* configure the timer */
    if (Timer_deviceConfig(obj, eb)) {
        return (3);     /* device config failure */
    }

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

        /* Hwi create failed */
        case 4:

        /* device config (setPeriodMicroSecs) failed */
        case 3:
            Timer_initDevice(obj, NULL);
            if (obj->hwi) {
                Hwi_delete(&obj->hwi);
            }
            break;

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

    /* make sure id is not greater than number of 32-bit timer devices */
    if (id >= Timer_numTimerDevices ) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();
    if (id == Timer_ANY) {
        for (i = 0; i < Timer_numTimerDevices; i++) {
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

    if (tempId == 0xffff) {
        Error_raise(eb, Timer_E_notAvailable, id, 0);
        return (2);
    }
    else {
        obj->id = tempId;
    }

    if (params->intNum == -1) {
        if (Timer_module->device[obj->id].intNum == -1) {
            Error_raise(eb, Timer_E_badIntNum, params->intNum, 0);
        }
    }

    Timer_module->handles[obj->id] = obj;

    /* initialize the timer state object */
    Timer_initObj(obj, tickFxn, params);

    /* create the Hwi object if function is specified */
    if (obj->tickFxn != NULL) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, params->hwiParams);
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        hwiParams.eventId = obj->eventId;

        hwiParams.arg = (UArg)obj;
        obj->hwi = Hwi_create(obj->intNum, Timer_stub, &hwiParams, eb);

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
 *  ======== Timer_Module_startup ========
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(Int status)
{
    Int i;
    Timer_Object *obj;

    if (Timer_TimerSupportProxy_Module_startupDone()) {
        if (Timer_startupNeeded) {
            for (i = 0; i < Timer_numTimerDevices; i++) {
                obj = Timer_module->handles[i];
                /* if timer was statically created/constructed */
                if ((obj != NULL) && (obj->staticInst)) {
                        Timer_postInit(obj, NULL);
                }
            }
        }
        return (Startup_DONE);
    }

    return (Startup_NOTDONE);
}

/*
 *  ======== Timer_dynStub ========
 */
Void Timer_dynStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;
    TimerRegs *timer;
    UInt irqStatus;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    /* get interrupt status flags */
    irqStatus = timer->tisr;

    /* if this is a rollover (overflow) interrupt ... */
    if (irqStatus & TIMER_IRQSTATUS_OVF_IT_FLAG) {

        /* acknowledge the interrupt */
        timer->tisr |= TIMER_IRQSTATUS_OVF_IT_FLAG;

        obj->rollovers++;
    }

    /* if this is a threshold match interrupt ... */
    if (irqStatus & TIMER_IRQSTATUS_MAT_IT_FLAG) {

        /* acknowledge the interrupt */
        timer->tisr |= TIMER_IRQSTATUS_MAT_IT_FLAG;

        /* save previous threshold value */
        obj->prevThreshold = timer->tmar;

        /* set compare threshold for next periodic interrupt */
        timer->tmar += obj->period;

        /* call the user's ISR */
        obj->tickFxn(obj->arg);
    }
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    UInt32 tcrr = ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcrr;

    if (obj->runMode != Timer_RunMode_DYNAMIC) {
        return (tcrr - (Timer_MAX_PERIOD - obj->period));
    }
    else {
        return (tcrr);
    }
}

/*
 *  ======== Timer_getRollovers ========
 */
UInt32 Timer_getRollovers(Timer_Object *obj)
{
    return (obj->rollovers);
}

/*
 *  ======== Timer_enableTimestamping ========
 */
Void Timer_enableTimestamping(Timer_Object *obj)
{
    obj->tier |= 0x2;   /* enable overflow interrupts from timer */
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    /* if timer running with RunMode_DYNAMIC ... */
    if (obj->runMode == Timer_RunMode_DYNAMIC) {
        TimerRegs *timer;
        UInt32 result;
        UInt32 count;
        UInt32 thresh;
        UInt32 period;
        UInt32 prev;
        Bool intrFlag1;
        Bool intrFlag2;

        timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

        intrFlag1 = timer->tisr & TIMER_IRQSTATUS_MAT_IT_FLAG;
        count = Timer_getCount(obj);
        intrFlag2 = timer->tisr & TIMER_IRQSTATUS_MAT_IT_FLAG;
        prev = obj->prevThreshold;

        /* was interrupt pending before read the count? */
        if (intrFlag1) {
            thresh = timer->tmar;               /* threshold for interrupt */
            period = Timer_getPeriod(obj);      /* period count */

            /* threshold reached; no wrap thru zero yet */
            if (count >= thresh) {
                result = (count - thresh) + period;
            }
            /* threshold reached; count has wrapped thru zero */
            else {
                result = (0xffffffff - thresh + 1) + count + period;
            }
        }

        /* new interrupt now pending, when wasn't before read the count */
        else if (intrFlag2) {
            result = Timer_getPeriod(obj);      /* return period count */
        }

        /* interrupt threshold not reached; check if wrapped thru zero */
        else if (count >= prev) {
            result = count - prev;
        }

        /* interrupt threshold not reached; count *has* wrapped thru zero */
        else {
            result = (0xffffffff - prev + 1) + count;
        }

        return (result);
    }

    /* else ... */
    else {
        return (Timer_getCount(obj));
    }
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
    UInt32 currCount;
    UInt64 longCount;

    currCount = Timer_getCount(obj);

    longCount = (UInt64)(obj->rollovers) << 32;
    longCount += currCount;

    tick = longCount / (UInt64)(obj->period);

    if (saveFlag != 0) {
        obj->savedCurrCount = currCount;
    }

    return ((UInt32) tick);
}

/*
 *  ======== Timer_getFreq ========
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
    if (obj->extFreq.lo != NULL) {
        *freq = obj->extFreq;
    }
    else {
        *freq = Timer_module->intFreqs[obj->id];
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
 *  ======== Timer_getNumTimers ========
 */
UInt Timer_getNumTimers()
{
    return (Timer_numTimerDevices);
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    UInt32 tldr = ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tldr;

    if (obj->runMode != Timer_RunMode_DYNAMIC) {
        return (Timer_MAX_PERIOD - tldr);
    }
    else {
        return (obj->period);
    }
}

/*
 *  ======== Timer_getStatus ========
 */
Timer_Status Timer_getStatus(UInt timerId)
{
    Assert_isTrue(timerId < (UInt)Timer_numTimerDevices, NULL);

    if (Timer_module->availMask & (0x1 << timerId)) {
        return (Timer_Status_FREE);
    }
    else {
        return (Timer_Status_INUSE);
    }
}

/*
 *  ======== Timer_getHandle ========
 */
Timer_Handle Timer_getHandle(UInt timerId)
{
    Assert_isTrue((timerId < (UInt)Timer_numTimerDevices), NULL);
    return (Timer_module->handles[timerId]);
}

/*
 *  ======== Timer_getIntNum ========
 */
Int Timer_getIntNum(Timer_Object *obj)
{
    return (obj->intNum);
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
    TimerRegs *timer;
    UInt32 now, next, prev;
    UInt32 countsPerTick = obj->period;
    UInt32 newPeriodCounts = countsPerTick * ticks;

    /* get timer base address */
    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    prev = obj->prevThreshold;
    next = obj->savedCurrCount + newPeriodCounts;

    /* set compare threshold for next interrupt */
    timer->tmar = next;

    /*
     * Must check to make sure that didn't just set the threshold too late and
     * missed an interrupt.  If did, assert the timer interrupt immediately.
     * Because we're doing tick suppression we need to be careful not to
     * inadvertently trigger an interrupt when the next threshold is set far
     * in the future.  The below checks will accomodate a delay of at least
     * one timer tick interval; any accomodation of more delay would require a
     * reduction in the maximum number of suppressible ticks.
     */

    /* get current timer count */
    now = Timer_getCount(obj);

    /* check for late setting of next interrupt threshold ... */

    /* for the next-threshold-is-greater-than-previous case */
    if (next > prev) {
        if (now >= next) {  /* if haven't wrapped thru zero */
            if ((now - next) < countsPerTick) {
                timer->irqstat_raw |= TIMER_IRQSTATUS_MAT_IT_FLAG;/* intr now */
            }
        }
        else {  /* now < next and now < previous so have wrapped thru zero */
            if ((now < prev) && (now < (next + countsPerTick))) {
                timer->irqstat_raw |= TIMER_IRQSTATUS_MAT_IT_FLAG;/* intr now */
            }
        }
    }
    /* else, the next-is-less-than-previous case expecting a wrap thru zero */
    else {
        if (now >= prev) {
        }
        else if ((now >= next) && (now < (next + countsPerTick)) ) {
            timer->irqstat_raw |= TIMER_IRQSTATUS_MAT_IT_FLAG;/* intr now */
        }
    }

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
Void Timer_reconfig(Timer_Object *obj, Timer_FuncPtr tickFxn,
        const Timer_Params *params, Error_Block *eb)
{
    Timer_initObj(obj, tickFxn, params);

    /* since timer requires a stub func, no Hwi reconfig is needed */

    /* leave it to caller to check eb */
    Timer_postInit(obj, eb);

    if (obj->startMode == Timer_StartMode_AUTO) {
        Timer_start(obj);
    }
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
 *  ======== Timer_setPeriod ========
 *  1. stop timer
 *  2. set period register
 *
 *  For Davinci, the timer needs to be stopped for the new value to
 *  be written (otherwise it gets dropped).
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    TimerRegs *timer;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;
    Timer_stop(obj);
    obj->period = period;

    if (obj->runMode == Timer_RunMode_DYNAMIC) {
        timer->tcrr = 0;
        while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
            ;
        timer->tmar = period;
        while (timer->twps & TIMER_TWPS_W_PEND_TMAR)
            ;
    }
    else {
        timer->tcrr = Timer_MAX_PERIOD - obj->period;
        while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
            ;
        timer->tldr = Timer_MAX_PERIOD - obj->period;
        while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
            ;
    }
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 *  1. stop timer
 *  2. compute counts
 *  3. set period register
 *
 *  For Davinci, the timer needs to be stopped for the new value to
 *  be written (otherwise it gets dropped).
 */
Bool Timer_setPeriodMicroSecs(Timer_Object *obj, UInt32 period)
{
    Types_FreqHz freqHz;
    UInt64 counts;
    UInt32 prdCounts;
    UInt32 freqKHz;
    TimerRegs *timer;
    UInt32 roundUp;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    Timer_stop(obj);

    /* Today c64 supports less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    roundUp = ((freqHz.lo % 1000) >= 500) ? 1 : 0;

    freqKHz = (freqHz.lo / 1000) + roundUp;
    if (Timer_checkOverflow(freqKHz, period/1000)) {
            return (FALSE);
    }

    counts = ((UInt64)freqKHz * (UInt64)period) / (UInt64)1000;
    if (counts > 0xffffffff) {
        return (FALSE);
    }
    else {
        prdCounts = counts - 1;
    }

    obj->period = prdCounts;
    obj->periodType = Timer_PeriodType_COUNTS;

    if (obj->runMode != Timer_RunMode_DYNAMIC) {
        timer->tcrr = Timer_MAX_PERIOD - prdCounts;
        while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
            ;

        timer->tldr = Timer_MAX_PERIOD - prdCounts;
        while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
            ;
    }
    else {
        timer->tcrr = 0;
        while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
            ;
        timer->tmar = prdCounts;
        while (timer->twps & TIMER_TWPS_W_PEND_TMAR)
            ;
    }

    return(TRUE);
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
    UInt runMode;
    TimerRegs *timer;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    key = Hwi_disable();

    Timer_stop(obj);

    if (obj->runMode == Timer_RunMode_DYNAMIC) {
        timer->tcrr = 0;           /* set timer count back to initial value */
        obj->prevThreshold = 0;    /* init previous threshold */
        timer->tmar = obj->period; /* set threshold for first interrupt */
        obj->rollovers = 0;        /* init total rollover count */
        obj->savedCurrCount = 0;
    }
    else {
        /* set timer count register back to period value */
        timer->tcrr = Timer_MAX_PERIOD - obj->period;
    }
    while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
        ;

    if (obj->hwi) {
        Hwi_clearInterrupt(obj->intNum);
        Hwi_enableInterrupt(obj->intNum);
    }

    if (obj->runMode == Timer_RunMode_CONTINUOUS) {
        runMode = TIMER_TCLR_START_CONTINUOUS;
    }
    else if (obj->runMode == Timer_RunMode_ONESHOT) {
        runMode = TIMER_TCLR_START_ONESHOT;
    }
    else {
        runMode = TIMER_TCLR_START_DYNAMIC;
    }

    timer->tclr = runMode | obj->tclr;
    while (timer->twps & TIMER_TWPS_W_PEND_TCLR)
        ;

    Hwi_restore(key);
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
 *  ======== Timer_stop ========
 *  1. stop timer
 *  2. disable timer interrupt
 */
Void Timer_stop(Timer_Object *obj)
{
    Bits32 tisr;
    TimerRegs *timer;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    timer->tclr &= TIMER_TCLR_STOP_MASK;
    while (timer->twps & TIMER_TWPS_W_PEND_TCLR)
        ;

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
    }

    tisr = timer->tisr;
    if (tisr) {
        timer->tisr = tisr;     /* clear all pending ints */
    }

}

/*
 *  ======== Timer_stub ========
 */
Void Timer_stub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;
    TimerRegs *timer;

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    /* acknowledge the interrupt */
    timer->tisr = obj->tier;

    /* call the user's ISR */
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_trigger ========
 */
Void Timer_trigger(Timer_Object *obj, UInt32 insts)
{
    UInt64 cpuCounts, timerCounts;
    Types_FreqHz timerfreq, cpufreq;
    UInt32 ratio;
    UInt32 period;
    UInt32 count;
    UInt key;

    /* get CPU frequency */
    BIOS_getCpuFreq(&cpufreq);
    cpuCounts = (UInt64)cpufreq.hi << 32;
    cpuCounts |=  cpufreq.lo;

    /* get Timer frequency */
    Timer_getFreq(obj, &timerfreq);
    timerCounts = (UInt64)timerfreq.hi << 32;
    timerCounts |= timerfreq.lo;

    ratio = cpuCounts/timerCounts;
    period = insts / ratio;
    count = ratio - (insts % ratio);

    if (period == 0) {
        period = 1;
    }

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, period);
    Timer_start(obj);
    Timer_spinLoop(count);
    Hwi_restore(key);
}


#define TIMERCOUNTS 100

/*
 *  ======== Timer_checkFreq ========
 */
Void Timer_checkFreq(Timer_Object *obj)
{
    UInt key;
    UInt32 timerCountStart, timerCountEnd, tsCountStart, tsCountEnd;
    UInt32 deltaTs, deltaCnt;
    Types_FreqHz timerFreq, timestampFreq;
    UInt freqRatio;
    UInt32 actualFrequency;
    Timer_Object tempObj;

    /*
     *  Make a temporary copy of 'obj' and modify it to be used for the timer
     *  frequency check.  Set the period to Timer_MAX_PERIOD to ensure that
     *  the timer does not roll over while performing the check.
     */
    memcpy((void *)&tempObj, (void *)obj, sizeof(Timer_Object));
    tempObj.period = Timer_MAX_PERIOD;
    tempObj.periodType = Timer_PeriodType_COUNTS;
    tempObj.runMode = Timer_RunMode_ONESHOT;
    tempObj.startMode = Timer_StartMode_USER;

    /* Initialize the timer registers */
    Timer_deviceConfig(&tempObj, NULL);

    /* Get the frequencies of the Timer and the Timestamp */
    Timer_getFreq(&tempObj, &timerFreq);
    Timestamp_getFreq(&timestampFreq);

    /* Assume that timer frequency is less than 2^32 Hz */
    Assert_isTrue(timestampFreq.hi == 0 && timerFreq.hi == 0, NULL);

    freqRatio = timestampFreq.lo / timerFreq.lo;

    key = Hwi_disable();

    /*
     *  Warning: halting the core between Timer_start and the point of
     *  code indicated below can cause the frequency check to fail.  This is
     *  is because the DMTimer will continue to run while this core is halted,
     *  this causing the ratio between timer counts to change
     */
    Timer_start(&tempObj);

    /* Record the initial timer & timestamp counts */
    timerCountStart = Timer_getCount(&tempObj);
    tsCountStart = Timestamp_get32();

    /* Wait for 'TIMERCOUNTS' timer counts to elapse */
    while (Timer_getCount(&tempObj) < timerCountStart + TIMERCOUNTS);

    timerCountEnd = Timer_getCount(&tempObj);

    /* Record the timestamp ticks that have elapsed during the above loop */
    tsCountEnd = Timestamp_get32();

    /* End of code segment where core should not be halted */

    Hwi_restore(key);

    deltaTs = tsCountEnd - tsCountStart;
    deltaCnt = timerCountEnd - timerCountStart;

    /* Check the timer frequency.  Allow a margin of error. */
    if (((deltaTs / deltaCnt) > freqRatio * 2) ||
        ((deltaTs / deltaCnt) < freqRatio / 2)) {
        actualFrequency = ((UInt64)timestampFreq.lo * (UInt64)deltaCnt) / (UInt64)deltaTs;
        Error_raise(NULL, Timer_E_freqMismatch,
                Timer_module->intFreqs[obj->id].lo, actualFrequency);
    }
}

/*
 *  ======== Timer_restoreRegisters ========
 */
Void Timer_restoreRegisters(Timer_Object *obj, Error_Block *eb)
{
    Timer_deviceConfig(obj, eb);
}



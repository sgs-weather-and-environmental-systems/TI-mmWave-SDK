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

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Timer.xdc.h"


#define TIMER_TCLR_START_ONESHOT        0x1
#define TIMER_TCLR_START_CONTINUOUS     0x3
#define TIMER_TCLR_STOP_MASK            0xfffffffe
#define TIMER_TWPS_W_PEND_TMAR          0x10
#define TIMER_TWPS_W_PEND_TLDR          0x4
#define TIMER_TWPS_W_PEND_TCRR          0x2
#define TIMER_TWPS_W_PEND_TCLR          0x1

typedef volatile struct TimerRegs {
    UInt tidr;
    UInt empty[3];
    UInt tiocpCfg;
    UInt tistat;
    UInt tisr;
    UInt tier;
    UInt twer;
    UInt tclr;
    UInt tcrr;
    UInt tldr;
    UInt ttgr;
    UInt twps;
    UInt tmar;
    UInt tcar1;
    UInt tsicr;
    UInt tcar2;
    UInt tpir;
    UInt tnir;
    UInt tcvr;
    UInt tocr;
    UInt towr;
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

    obj->tiocpCfg = (params->tiocpCfg.autoidle) |
                    (params->tiocpCfg.softreset << 1) |
                    (params->tiocpCfg.enawakeup << 2) |
                    (params->tiocpCfg.idlemode << 3) |
                    (params->tiocpCfg.emufree << 5) |
                    (params->tiocpCfg.clockactivity << 8);

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
                 (params->tsicr.posted << 2);

    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->arg = params->arg;
    obj->intNum = Timer_module->device[obj->id].intNum;
    obj->extFreq.lo = params->extFreq.lo;

}

/*
 *  ======== Timer_initDevice ========
 */
Void Timer_initDevice(Timer_Object *obj, Error_Block *eb)
{
    TimerRegs *timer;
    UInt hwiKey;
    volatile UInt tmp;

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

    /* disable timer interrupts */
    timer->tier = 0;

    /* clear any pending interrupts */
    tmp = timer->tisr;
    timer->tisr = tmp;

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

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    /* reset the timer */
    timer->tiocpCfg = obj->tiocpCfg | 0x2;

    /* wait for reset to finish */
    while(timer->tistat != 0x01) 
        ;

    /* initialize the timer */
    Timer_initDevice(obj, eb);

    hwiKey = Hwi_disable();

    /* set the period */
    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Hwi_restore(hwiKey);
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            return (3);
        }
    }
    else {
        timer->tcrr = Timer_MAX_PERIOD - obj->period;
        while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
            ;
        timer->tldr = Timer_MAX_PERIOD - obj->period;
        while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
            ;
    }

    timer->tmar = obj->tmar;
    while (timer->twps & TIMER_TWPS_W_PEND_TMAR)
        ;

    timer->twer = obj->twer;
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

        hwiParams.eventId = Timer_module->device[obj->id].eventId;

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

    /* must wait for these modules to initialize first */
    if (!Hwi_Module_startupDone()) {
        return Startup_NOTDONE;
    }

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
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    UInt32 tcrr = ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcrr;

    return (tcrr - (Timer_MAX_PERIOD - obj->period));
}

/*
 *  ======== Timer_getExpiredCounts ========
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    return (Timer_getCount(obj));
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
    if (obj->extFreq.lo != NULL) {
        *freq = obj->extFreq;
    }
    else {
        *freq = Timer_module->intFreq;
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

    return (Timer_MAX_PERIOD - tldr);
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

    timer->tcrr = Timer_MAX_PERIOD - obj->period;
    while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
        ;
    timer->tldr = Timer_MAX_PERIOD - obj->period;
    while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
        ;
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

    timer->tcrr = Timer_MAX_PERIOD - prdCounts;
    while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
        ;

    timer->tldr = Timer_MAX_PERIOD - prdCounts;
    while (timer->twps & TIMER_TWPS_W_PEND_TLDR)
        ;

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

    /* set timer count register back to period value */
    timer->tcrr = Timer_MAX_PERIOD - obj->period;
    while (timer->twps & TIMER_TWPS_W_PEND_TCRR)
        ;

    if (obj->hwi) {
        Hwi_clearInterrupt(obj->intNum);
        Hwi_enableInterrupt(obj->intNum);
        timer->tier = obj->tier; /* enable the interrupt at the timer */
    }

    if (obj->runMode == Timer_RunMode_CONTINUOUS) {
        runMode = TIMER_TCLR_START_CONTINUOUS;
    }
    else {
        runMode = TIMER_TCLR_START_ONESHOT;
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
        timer->tisr = tisr;
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
    cpuCounts = (cpufreq.hi * (1 < 0xffffffff)) + cpufreq.lo;

    /* get Timer frequency */
    Timer_getFreq(obj, &timerfreq);
    timerCounts = (timerfreq.hi * (1 < 0xffffffff)) + timerfreq.lo;

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



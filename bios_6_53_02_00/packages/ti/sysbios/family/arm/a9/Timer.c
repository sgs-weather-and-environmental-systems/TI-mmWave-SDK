/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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

#include <ti/sysbios/family/arm/gic/Hwi.h>

#include "package/internal/Timer.xdc.h"

/* Private Timer Control Register
 * Bit#     Name       Description
 * 31-16    RESERVED
 * 15-8     PRESCALER  Modifies the clock period for the decrementing
 *                     event for the Counter register.
 * 7-3      RESERVED
 * 2        IRQENABLE  If set, interrupt Id 29 is set as pending when
 *                     the event flag is set in the Timer Interrupt
 *                     status register.
 * 1        AUTORELOAD 0 - Single Shot Mode. Counter decrements to 0,
 *                         sets the event flag & stops.
 *                     1 - Auto-reload Mode. Each time Counter reaches 0,
 *                         it is reloaded with the value contained in
 *                         Timer Load Register.
 * 0        ENABLE     0 - Timer is disabled and the counter does not
 *                         decrement.
 *                     1 - Timer is enabled and the counter decrements
 *                         normally.
 */

#define PRIVATE_TIMER_IRQENABLE   0x4
#define PRIVATE_TIMER_AUTORELOAD  0x2
#define PRIVATE_TIMER_ENABLE      0x1

/* Private Timer Interrupt Status Register
 * Bit#     Name      Description
 * 31-1     RESERVED
 * 0        EVENTFLAG Automatically set when Counter Register reaches
 *                    zero. Event flag can be cleared by writing 1 to it.
 */

#define PRIVATE_TIMER_EVENTFLAG   0x1

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
Void Timer_setNextTick(Timer_Object *obj, UInt32 ticks){
}

/*
 *  ======== Timer_Module_startup ========
 *  Calls postInit for all statically-created & constructed
 *  timers to initialize them.
 */
Int Timer_Module_startup(Int status)
{
    Timer_Object *obj;

    if (Hwi_Module_startupDone()) {
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
    Int status;
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
    obj->intNum        = Timer_intNumDef;
    obj->tickFxn       = tickFxn;
    obj->period        = params->period;
    obj->prescale      = params->prescale;
    obj->extFreq.hi    = params->extFreq.hi;
    obj->extFreq.lo    = params->extFreq.lo;

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        if (hwiParams.type == Hwi_Type_IRQ) {
            hwiParams.arg = (UArg)obj;
            obj->hwi = Hwi_create (obj->intNum, Timer_stub, &hwiParams, eb);
        }

        if (obj->hwi == NULL) {
            return (3);
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
    obj->period        = params->period;
    obj->prescale      = params->prescale;
    obj->extFreq.hi    = params->extFreq.hi;
    obj->extFreq.lo    = params->extFreq.lo;

    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, params->hwiParams);
        }
        else {
            Hwi_Params_init(&hwiParams);
        }

        hwiParams.arg = (UArg)obj;
        Hwi_reconfig (obj->hwi, Timer_stub, &hwiParams);
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
 *  1. Initialize Timer device
 *  2. Set Period.
 *  3. Set Prescale.
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

            return (4);
        }
    }
    else {
        Timer_setPeriod(obj, obj->period);
    }
    Timer_setPrescale(obj, obj->prescale);

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
        case 4:
            Timer_initDevice(obj);
            if (obj->hwi) {
                Hwi_delete(&obj->hwi);
            }

        /* Hwi create failed */
        case 3:

        default:
            break;
    };

    key = Hwi_disable();
    Timer_module->availMask = 0x1;
    Timer_module->handle = NULL;
    Hwi_restore(key);
}

/* 
 * ======== Timer_initDevice ========
 * 1. stop timer
 * 2. disable timer interrupt (GIC interrupt and any timer specific interrupt)
 * 3. clear pending interrupt (GIC interrupt and any timer specific interrupt
 *                             flags)
 *
 */
Void Timer_initDevice(Timer_Object *obj)
{
    UInt key;

    key = Hwi_disable();

    /* Disable timer counter and timer IRQ*/
    Timer_deviceRegs.CONTROL &= ~(PRIVATE_TIMER_IRQENABLE &
                                 PRIVATE_TIMER_ENABLE);

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
        Hwi_clearInterrupt(obj->intNum);
    }

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

    if (obj->hwi) {
        Hwi_clearInterrupt(obj->intNum);
        Hwi_enableInterrupt(obj->intNum);
    }

    /* Set timer mode */
    if (obj->runMode == Timer_RunMode_ONESHOT) {
        Timer_deviceRegs.CONTROL &= ~(PRIVATE_TIMER_AUTORELOAD);
    }
    else {
        Timer_deviceRegs.CONTROL |= PRIVATE_TIMER_AUTORELOAD;
    }

    /* Enable Timer IRQ */
    Timer_deviceRegs.CONTROL |= PRIVATE_TIMER_IRQENABLE;

    /* Enable Timer */
    Timer_deviceRegs.CONTROL |= PRIVATE_TIMER_ENABLE;

    Hwi_restore(key);
}



/*
 *  ======== Timer_stop ========
 * 1. stop timer
 * 2. disable timer interrupt
 */
Void Timer_stop(Timer_Object *obj)
{
    Timer_deviceRegs.CONTROL &= ~(PRIVATE_TIMER_ENABLE);

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
    /* Today arm cortex-A9 supports less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo / 1000;
    if (Timer_checkOverflow(freqKHz, (period / 1000))) {
        return (FALSE);
    }
    else {
        counts = ((UInt64)freqKHz * (UInt64)period) / (UInt64)1000;
        obj->period = (UInt32)counts;
        obj->periodType = Timer_PeriodType_COUNTS;
        Timer_deviceRegs.LOAD = counts;
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
    Timer_deviceRegs.LOAD = period;
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    return (Timer_deviceRegs.LOAD);
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    return (UInt32)(Timer_deviceRegs.LOAD - Timer_deviceRegs.COUNTER);
}

/*
 *  ======== Timer_setPrescale ========
 */
Void Timer_setPrescale(Timer_Object *obj, UInt8 prescale)
{
    UInt32 loadValue;

    /* The prescale value scales the timer period */
    obj->prescale = prescale;

    //TODO Do I need to disable the timer or disable interrupts ?
    /* Set prescaler value */
    Timer_deviceRegs.CONTROL &= ~(0xFF << 8);
    Timer_deviceRegs.CONTROL |= (prescale << 8);

    /*
     * Force a timer re-load by copying the contents of
     * Timer LOAD register into itself.
     */
    loadValue = Timer_deviceRegs.LOAD;
    Timer_deviceRegs.LOAD = loadValue;
}

/*
 *  ======== Timer_getPrescale ========
 */
UInt8 Timer_getPrescale(Timer_Object *obj)
{
    return (UInt8)((Timer_deviceRegs.CONTROL & 0xFF00) >> 8);
}

/*
 *  ======== Timer_stub ========
 */
Void Timer_stub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *)arg;

    /* Acknowledge Timer Interrupt */
    Timer_deviceRegs.INTSTATUS = PRIVATE_TIMER_EVENTFLAG;

    /* Call the user's ISR */
    obj->tickFxn(obj->arg);
}

/*
 *  ======== Timer_getExpiredCounts ========
 *  This API is used by the TimestampProvider as part of retrieving a timestamp
 *  using a timer and a tick counter. It returns the timer's count but also
 *  accounts for timer rollover.
 *
 *  This API must be called with interrupts disabled (the TimestampProvider
 *  should disable interrupts while retrieving the tick count and calling this
 *  API).
 *
 *  The TimestampProvider uses a 32-bit timer and 32-bit tick count to track
 *  the timestamp. The tick count either comes from the Clock module or is
 *  stored in the TimestampProvider's module state and incremented by an ISR
 *  when the timer expires.
 *
 *  This approach has a difficult edge case which this API addresses.
 *  Timestamp_get64 may be called while interrupts are disabled, and while they
 *  are disabled, the timer may expire and reset to its initial period. Because
 *  interrupts are disabled, the tick count isr has not run yet to increment
 *  the tick count. This can result in the occassional timestamp value going
 *  backwards in time because the upper bits are out of date.
 *
 *  To work around this, we need to detect the timer "rollover" and account for
 *  it by adding the timer period to the count returned.
 *
 *  To detect the rollover, we retrieve the count, check the GIC interrupt
 *  status flag for the timer interrupt, then check the count again, all with
 *  interrupts disabled (the caller should disable interrupts).
 *
 *    Hwi_disable();
 *
 *    count1 = timer.TIM;
 *    ifrFlag = getIFRFlag();
 *    count2 = timer.TIM;
 *
 *    Hwi_restore();
 *
 *  For the most efficient implementation, we access the Timer register value
 *  directly, which means the count value is going *down* on the A9. This
 *  means that most of the time count1 > count2.
 *
 *  The following table lists the possible values of count1, count2, and
 *  ifrFlag. The third column states whether we would need to add the timer
 *  period to the result if we return count1. The fourth column states the
 *  same for count2. Count1 and count2 will be very close together, so either
 *  is acceptable to return.
 *
 *                                       Add prd to     Add prd to
 *         compare           IFR flag      count1         count2
 *  1. (count1 > count2)        0            NO             NO
 *  2. (count1 > count2)        1            YES            YES
 *  3. (count1 < count2)        0            NO             YES
 *  4. (count1 < count2)        1            NO             YES
 *
 *  1. Case 1 is by far the typical case. We're "in the middle" of the count,
 *     not close to a counter rollover, and we just return the count.
 *  2. Case 2 means that the timer rolled over before we retrieved count1, but
 *     that interrupts were disabled, so the tick isr hasn't run yet. When an
 *     isr is serviced, the hardware clears the IFR bit immediately, so it is
 *     not possible that we are in the middle of servicing the tick isr.
 *  3. Case 3 is rare. This means that the timer rolled over after checking
 *     the IFR flag but before retrieving count2.
 *  4. Case 4 is rare. This means that the timer rolled over after retrieving
 *     count1, but before we check the IFR flag.
 *
 *  Case 3 is the reason it's not sufficient to simply check the IFR flag, and
 *  case 2 is the reason it's not sufficient to simply compare count1 and
 *  count2.
 *
 *  Returning count1 appears to mean less additions, so why return count2?
 *    - The intent of the logic is more apparent in the if statement.
 *      "If an interrupt occurred OR count2 is out of sequence with count1,
 *      a rollover occurred, so add the period".
 *    - Case 2 is the most common rollover case, and the performance for case 2
 *      is the same whether we return count1 or count2.
 */
UInt32 Timer_getExpiredCounts(Timer_Object *obj)
{
    UInt32 count1, count2, period;
    Bits16 irqFlag;

    /* Get the timer count. */
    count1 = Timer_deviceRegs.COUNTER;

    /*
     * Check if a timer interrupt has occurred.
     */
    irqFlag = (Timer_deviceRegs.INTSTATUS & PRIVATE_TIMER_EVENTFLAG);

    /* Get the timer count a second time. */
    count2 = Timer_deviceRegs.COUNTER;

    /* Get the period value to use to invert the count. */
    period = Timer_deviceRegs.LOAD;

    /* Check if the counter has wrapped. See function comment. */
    if (irqFlag || (count1 < count2)) {
        /*
         * Invert count2 so we count upward, then add an additional period
         * worth of counts to account for the rollover.
         * Do the invert first, since 2 * period may overflow.
         */
        return ((period - count2) + period);
    }
    else {
        /* No rollover to account for. Invert count2 and return. */
        return (period - count2);
    }
}

/*
 *  ======== Timer_getCurrentTick ========
 */
UInt32 Timer_getCurrentTick(Timer_Object *obj, Bool saveFlag)
{
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
        freq->lo = obj->extFreq.lo;
        freq->hi = 0;
    }
    else {
        BIOS_getCpuFreq(freq);
        Assert_isTrue((freq->hi == 0), NULL);
        /*
         * The private timer on A9 uses PERIPHCLK which is
         * clocked at half the CPU freq (or System freq).
         */
        freq->lo = (freq->lo) / 2;
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
    return ((b > 0) && (a > Timer_MAX_PERIOD / b));
}

/*
 *  ======== Timer_trigger ========
 *  For Cortex-A9 private timers, the timer frequency is half the
 *  CPU frequency, so just set the period to half the cycle count.
 */
Void Timer_trigger(Timer_Object *obj, UInt32 cycles)
{
    UInt key;

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, (cycles / 2));
    Timer_start(obj);
    Hwi_restore(key);
}

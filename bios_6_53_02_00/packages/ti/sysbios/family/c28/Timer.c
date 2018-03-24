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
#include <ti/sysbios/family/c28/Hwi.h>
#include "package/internal/Timer.xdc.h"

/* TCR: Control register bit definitions */
typedef struct TCR_BITS {    /* bits  description */
   UInt    rsvd1:4;          /* 3:0   reserved */
   UInt    TSS:1;            /* 4     Timer Start/Stop */
   UInt    TRB:1;            /* 5     Timer reload */
   UInt    rsvd2:4;          /* 9:6   reserved */
   UInt    SOFT:1;           /* 10    Emulation mode */
   UInt    FREE:1;           /* 11    Emulation mode */
   UInt    rsvd3:2;          /* 12:13 reserved */
   UInt    TIE:1;            /* 14    Interrupt enable */
   UInt    TIF:1;            /* 15    Interrupt flag */
} TCR_BITS;

/* TPR: Timer Prescale Register (lower 16 bits) */
typedef struct TPR_BITS {
    UInt    TDDR:8;          /* 7:0  Timer divide-down register (psc period) */
    UInt    PSC:8;           /* 15:8 Prescale Counter */
} TPR_BITS;

/* TPRH: Timer Prescale Register (upper 16 bits) */
typedef struct TPRH_BITS {
    UInt    TDDRH:8;         /* 7:0  Timer divide-down register (psc period) */
    UInt    PSCH:8;          /* 15:8 Prescale Counter */
} TPRH_BITS;

/* Timer registers */
typedef struct TimerRegs {
    UInt32      TIM;        /* Counter Register */
    UInt32      PRD;        /* Period Register */
    TCR_BITS    TCR;        /* Control Register */
    UInt16      Reserved;   /* reserved space */
    TPR_BITS    TPR;        /* Prescale Register */
    TPRH_BITS   TPRH;       /* Prescale Register */
} TimerRegs;

/*
 * The timer registers are layed out consecutively in memory
 * from 0x0C00 to 0x0C3F:
 *   Timer 0: 0x0C00
 *   Timer 1: 0x0C08
 *   Timer 2: 0x0C10
 */
#define TimerDevices ((volatile TimerRegs *)(0x0c00))

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
 *  timers to stop and initialize them.
 *
 *  At reset, the period and count for each timer is 0. Also, the timer control
 *  register's interrupt flag and interrupt enable bits are cleared.
 *  The timer is "running" at reset (the stop bit, TSS, is 0), but since the
 *  period is 0, this doesn't mean anything.
 */
Int Timer_Module_startup(Int status)
{
    Int i;
    Timer_Object *obj;

    if (Timer_startupNeeded) {
        /* Run post init on all statically created or constructed Timers. */
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            obj = Timer_module->staticTimers[i];
            if (obj != NULL) {
                Timer_postInit(obj, NULL);
            }
        }
    }
    return (Startup_DONE);
}

/*
 *  ======== Timer_startup ========
 *  Here after main(), called from BIOS_start().
 */
Void Timer_startup()
{
    Int i;
    Timer_Object *obj;

    if (Timer_startupNeeded) {
        for (i = 0; i < Timer_NUM_TIMER_DEVICES; i++) {
            obj = Timer_module->staticTimers[i];
            /* if timer was statically created/constructed */
            if ((obj != NULL) && (obj->startMode == Timer_StartMode_AUTO)) {
                Timer_start(obj);
            }
        }
    }
}

/*
 *  ======== Timer_Instance_init ========
 *  1. Select timer based on id
 *  2. Mark timer as in use
 *  3. Save timer handle if necessary (needed by TimestampProvider on 64).
 *  4. Init obj using params
 *  5. Create Hwi if tickFxn !=NULL
 *  6. Timer_init()
 *  7. Timer configuration (wrt emulation, external frequency etc)
 *  8. Timer_setPeriod()
 *  9. Timer_start()
 */
Int Timer_Instance_init(Timer_Object *obj, Int id, Timer_FuncPtr tickFxn,
                        const Timer_Params *params, Error_Block *eb)
{
    UInt key;
    Int i, status;
    Hwi_Params hwiParams;

    UInt tempId = 0xffff;

    /* Make sure id is a valid timer id. */
    Assert_isTrue((id == Timer_ANY) ||
                  ((id >= 0) && (id < Timer_NUM_TIMER_DEVICES)),
                  Timer_A_invalidTimer);

    /*
     * Disable interrupts while modifying part of the Timer module state which
     * may be accessed by other creates.
     */
    key = Hwi_disable();

    /* If timer id is "any timer" (-1) */
    if (id == Timer_ANY) {
        for (i = Timer_NUM_TIMER_DEVICES - 1; i >= 0; i--) {
            if ((Timer_anyMask & (1 << i))
                && (Timer_module->availMask & (1 << i))) {
                Timer_module->availMask &= ~(1 << i);

                /* Assign the timer */
                tempId = i;
                break;
            }
        }
    }

    /* Otherwise, if the requested timer is available... */
    else if (Timer_module->availMask & (1 << id)) {
        Timer_module->availMask &= ~(1 << id);

        /* Assign the timer */
        tempId = id;
    }

    Hwi_restore(key);

    /*
     * If a timer has not been assigned because either the requested timer was
     * unavailable or 'any timer' was requested and none were available...
     */
    if (tempId == 0xffff) {
        Error_raise(eb, Timer_E_notAvailable, id, 0);
        return (2);
    }
    else {
        obj->id = tempId;
    }

    /* Fill in the instance fields */
    obj->emulationModeInit.free = params->emulationModeInit.free;
    obj->emulationModeInit.soft = params->emulationModeInit.soft;
    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->prescale = params->prescale;
    obj->period = params->period;
    obj->periodType = params->periodType;

    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
            Hwi_restore(key);
            return (4);
        }
    }

    obj->intNum = Timer_intNumDef[obj->id];
    obj->arg = params->arg; // Save arg to pass it to the tickFxn in the stubs.
    obj->tickFxn = tickFxn;

    /* Create the hwi object if an isr function was specified */
    /* extFreq.hi is ignored */
    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }

    if (obj->tickFxn != NULL) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            /* Default mask setting is SELF */
            Hwi_Params_init(&hwiParams);
        }

        /* If run mode is continuous, just create a Hwi with their isr */
        if (obj->runMode == Timer_RunMode_CONTINUOUS) {
            hwiParams.arg = obj->arg;
            obj->hwi = Hwi_create(obj->intNum, obj->tickFxn,
                                  &hwiParams, eb);
        }
        /*
         * If the run mode is one shot, create a Hwi with a oneShotStub
         * which will call the user's isr and disable the hwi
         */
        else if (obj->runMode == Timer_RunMode_ONESHOT) {
            /*
             * Perform error checking on the hwiParams. If the RunMode is ONESHOT
             * the hwi mask must mask itself so that the stub is not interrupted
             * by another timer interrupt.
             */
            Assert_isTrue(hwiParams.maskSetting != Hwi_MaskingOption_NONE,
                          Timer_A_invalidHwiMask);

            if (hwiParams.maskSetting == Hwi_MaskingOption_BITMASK) {
                if (obj->intNum < 15) {
                    /* confirm self bit is set in disableMask */
                    Assert_isTrue(hwiParams.disableMask & (1 << (obj->intNum - 1)),
                              Timer_A_invalidHwiMask);

                    /* oneShotStub disables the IER bit, do not restore it */
                    Assert_isTrue(!(hwiParams.restoreMask & (1 << (obj->intNum - 1))),
                              Timer_A_invalidHwiMask);
                }
            }

            hwiParams.arg = (UArg) obj;
            obj->hwi = Hwi_create(obj->intNum,
                                  (Hwi_FuncPtr) Timer_oneShotStub,
                                  &hwiParams, eb);
        }
        else {
            Assert_isTrue(FALSE, Timer_A_invalidRunMode);
        }

        if (obj->hwi == NULL) {
            return (4);
        }
    }
    else {
        /*
         * If there is no function specified, we don't create a Hwi instance
         * and we won't enable the Timer interrupt.
         */
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
 *  1. Init obj using params
 *  2. Reconfig Hwi
 *  3. Timer_init()
 *  4. Timer configuration (wrt emulation, external frequency etc)
 *  5. Timer_setPeriod()
 *  6. Timer_start()
 */
Void Timer_reconfig (Timer_Object *obj, Timer_FuncPtr tickFxn,
                     const Timer_Params *params, Error_Block *eb)
{
    Hwi_Params hwiParams;

    /* Fill in the instance fields */
    obj->emulationModeInit.free = params->emulationModeInit.free;
    obj->emulationModeInit.soft = params->emulationModeInit.soft;
    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->prescale = params->prescale;
    obj->period = params->period;
    obj->periodType = params->periodType;

    if (obj->periodType == Timer_PeriodType_MICROSECS) {
        if (!Timer_setPeriodMicroSecs(obj, obj->period)) {
            Error_raise(eb, Timer_E_cannotSupport, obj->period, 0);
        }
    }

    obj->intNum = Timer_intNumDef[obj->id];
    /* Save arg to pass it to the tickFxn in the stubs. */
    obj->arg = params->arg;
    obj->tickFxn = tickFxn;
    if (params->extFreq.lo) {
        obj->extFreq.lo = params->extFreq.lo;
    }
    /* Create the hwi object if an isr function was specified */
    if (obj->tickFxn) {
        if (params->hwiParams) {
            Hwi_Params_copy(&hwiParams, (params->hwiParams));
        }
        else {
            /* Default mask setting is SELF */
            Hwi_Params_init(&hwiParams);
        }

        if (obj->runMode == Timer_RunMode_CONTINUOUS) {
            hwiParams.arg = obj->arg;
            Hwi_reconfig (obj->hwi, obj->tickFxn, &hwiParams);
        }
        /*
         * If the run mode is one shot, create a Hwi with an oneShotStub
         * which will call the user's isr and disable the hwi
         */
        else if (obj->runMode == Timer_RunMode_ONESHOT) {
            /*
             * Perform error checking on the hwiParams. If the RunMode is ONESHOT
             * the hwi mask must mask itself so that the stub is not interrupted
             * by another timer interrupt.
             */
            Assert_isTrue(hwiParams.maskSetting != Hwi_MaskingOption_NONE,
                          Timer_A_invalidHwiMask);

            if (hwiParams.maskSetting == Hwi_MaskingOption_BITMASK) {
                Assert_isTrue(hwiParams.disableMask & (1 << obj->intNum),
                              Timer_A_invalidHwiMask);
            }

            hwiParams.arg = (UArg) obj;
            Hwi_reconfig(obj->hwi, Timer_oneShotStub, &hwiParams);
        }
        else {
            Assert_isTrue(FALSE, Timer_A_invalidRunMode);
        }
    }

    Timer_postInit(obj, eb);

    if (obj->startMode == Timer_StartMode_AUTO) {
        Timer_start(obj);
    }
}

/*
 *  ======== Timer_postInit ========
 *  The postInit function contains Timer startup code common to both statically
 *  and dynamically created Timer instances. It contains the code which
 *  actually initializes the Timer devices.
 */
Int Timer_postInit(Timer_Object *obj, Error_Block *eb)
{
    UInt key;

    key = Hwi_disable();

    Timer_stopAndClear(obj);

    /* Set the emulation mode */
    TimerDevices[obj->id].TCR.SOFT = obj->emulationModeInit.soft;
    TimerDevices[obj->id].TCR.FREE = obj->emulationModeInit.free;

    Timer_setPeriod(obj, obj->period);
    Timer_setPrescale(obj, obj->prescale);

    Hwi_restore(key);

    return (0);
}

/*
 *  ======== Timer_Instance_finalize ========
 *  Timer_delete is not supported for timer0 since this function does not
 *  clear the PIEIFR.
 */
Void Timer_Instance_finalize(Timer_Object *obj, Int status)
{
    UInt key;

    /* NOTE: switch contains intentional fall-throughs */
    switch (status) {
        /* Timer_delete() */
        case 0:
            // fall through

        /* setPeriodMicroSecs failed */
        case 5:
            Timer_stopAndClear(obj);
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
    Hwi_restore(key);
}

/*
 *  ======== Timer_stopAndClear ========
 *  This helper function clears and disables a timer device. It is used
 *  by postInit in itializing a timer, as well as in instance finalize
 *  to clear the device for later use.
 *
 *  It takes the following steps:
 *    1. stop timer
 *    2. disable timer interrupt. (IER and any timer specific interrupt enable)
 *    3. clear pending interrupt. (IFR and any timer specific interrupt flags)
 *    4. Set control registers back to reset value.
 *    5. clear counters
 *    6. clear period register.
 */
Void Timer_stopAndClear(Timer_Object *obj)
{
   /* Disable interrupts while working on Timer device. */
    UInt key;
    key = Hwi_disable();

    /* Stop the timer. The timer starts immediately at reset. */
    TimerDevices[obj->id].TCR.TSS = 1;

    /* Clear the Timer device's interrupt enable and interrupt flag bits. */
    TimerDevices[obj->id].TCR.TIE = 0;
    TimerDevices[obj->id].TCR.TIF = 0;

    /* Clear CPU's Timer IER and IFR bits */
    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
        Hwi_clearInterrupt(obj->intNum);
    }

    /* Set other TCR bits back to reset value */
    TimerDevices[obj->id].TCR.SOFT = 0;
    TimerDevices[obj->id].TCR.FREE = 0;

    /* Clear counter */
    TimerDevices[obj->id].TIM = 0;

    /* Clear period */
    TimerDevices[obj->id].PRD = 0;

    /* Clear prescale period and counter */
    TimerDevices[obj->id].TPR.TDDR = 0;
    TimerDevices[obj->id].TPR.PSC = 0;
    TimerDevices[obj->id].TPRH.TDDRH = 0;
    TimerDevices[obj->id].TPRH.PSCH = 0;

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

    TimerDevices[obj->id].TCR.TIE = 1;

    /*
     * Reload the timer counter register with the period.
     * Also reloads the prescale counter.
     */
    TimerDevices[obj->id].TCR.TRB = 1;

    /* Start the timer. (stop = 0)*/
    TimerDevices[obj->id].TCR.TSS = 0;

    Hwi_restore(key);
}

/*
 *  ======== Timer_stop ========
 */
Void Timer_stop(Timer_Object *obj)
{
    TimerDevices[obj->id].TCR.TSS = 1;
    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
    }
}

/*
 *  ======== Timer_setPeriod ========
 *  1. Stop timer
 *  2. Set period register
 */
Void Timer_setPeriod(Timer_Object *obj, UInt32 period)
{
    Timer_stop(obj);
    obj->period = period;
    TimerDevices[obj->id].PRD = period;
}

/*
 *  ======== Timer_setPeriodMicroSecs ========
 */
Bool Timer_setPeriodMicroSecs(Timer_Object *obj, UInt32 period)
{
    Types_FreqHz freqHz;
    UInt64 counts;
    UInt32 prdCounts;
    UInt32 freqKHz;

    /*
     * stop timer
     * compute counts
     * set period register
     */
    Timer_stop(obj);
    /* Today c64 supports less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo / 1000;

    /*
     * checkOverflow is given counts/ms and period in ms, and will return true
     * if the result of multiplying the two would overflow (if the result is
     * larger than Timer_MAX_PERIOD).
     */
    if (Timer_checkOverflow(freqKHz, period / 1000)) {
        return (FALSE);
    }
    else {
        /*
         * counts = (counts/ms) * (period in ms)
         * This must be done as a 64-bit calculation. We cannot divide by 1000
         * first because the resulting value might be truncated. So, we must do
         * the multiplication first, and the result of this multiplication may
         * require 64-bits to hold.
         */
        counts = ((UInt64) freqKHz * (UInt64) period) / (UInt64) 1000;
        prdCounts = counts / ((UInt64)obj->prescale+1);
        TimerDevices[obj->id].PRD = prdCounts;
        obj->period = prdCounts;
        obj->periodType = Timer_PeriodType_COUNTS;
        return (TRUE);
    }
}

/*
 *  ======== Timer_getPeriod ========
 */
UInt32 Timer_getPeriod(Timer_Object *obj)
{
    return (TimerDevices[obj->id].PRD);
}

/*
 *  ======== Timer_getCount ========
 *  The 28x timer counts downard from PRD to 0, but getCount
 *  should return the number of counts that have passed, so
 *  the counter register is subtracted from the period.
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    return (TimerDevices[obj->id].PRD - TimerDevices[obj->id].TIM);
}

/*
 *  ======== Timer_setPrescale ========
 *  The prescaler is comprised of two registers: PSC and TDDR. The Timer
 *  Divide-Down Register (TDDR) stores the prescale factor; it essentially
 *  establishes the period of the timer. The Prescale Counter (PSC) decrements
 *  on every timer clock source. Once the PSC reaches 0, the timer is
 *  decremented.
 *
 *  The PSC and TDDR registers are divided across two registers, TPR and TPRH.
 *  TPR contains the lower halves of PSC and TDDR, and TPRH contains the upper
 *  halves of PSC and TDDR.
 *
 *  TPR: Timer Prescale Register
 *    PSC  (Bits 15-8): Prescale Counter
 *    TDDR  (Bits 7-0): Timer Divide Down Register
 *
 *  PSCH:PSC = TPRH(15:8):TPR(15:8)
 *  TDDRH:TDDR = TPRH(7:0):TPR(7:0)
 *
 *  To set the prescale, we load the prescale value into TDDR and set PSC to 0.
 */
Void Timer_setPrescale(Timer_Object *obj, UInt16 prescale)
{
    /* The prescale value determines the period of the timer ticks */
    obj->prescale = prescale;

    /* Load the prescale value into TDDR */
    TimerDevices[obj->id].TPR.TDDR = (prescale & 0x00ff);
    TimerDevices[obj->id].TPRH.TDDRH = (prescale >> 8);

    /* Reload the timer */
    TimerDevices[obj->id].TCR.TRB = 1;
}

/*
 *  ======== Timer_getPrescale ========
 */
UInt16 Timer_getPrescale(Timer_Object *obj)
{
    UInt16 prescale;

    /* Load the TDDR into prescale */
    prescale = TimerDevices[obj->id].TPRH.TDDRH;
    prescale = prescale << 8;
    prescale |= TimerDevices[obj->id].TPR.TDDR;

    return (prescale);
}

/*
 *  ======== Timer_getPrescaleCount ========
 */
UInt16 Timer_getPrescaleCount(Timer_Object *obj)
{
    UInt16 count;

    /* Load the PSC into count */
    count = TimerDevices[obj->id].TPRH.PSCH;
    count = count << 8;
    count |= TimerDevices[obj->id].TPR.PSC;

    return (count);
}

/*
 *  ======== Timer_oneShotStub ========
 */
Void Timer_oneShotStub(UArg arg)
{
    Timer_Object *obj = (Timer_Object *) arg;

    /* Stop the timer */
    Timer_stop(obj);
    /*
     * Clear the IFR registers in case another interrupt occurred.
     * Clearing the PIEIFR is difficult and only timer0 is a PIE int,
     * so timer0 does not support one-shot mode.
     */
    Hwi_clearInterrupt(obj->intNum);

    /* Clear the Timer Interrupt flag by writing 1 to it. */
    TimerDevices[obj->id].TCR.TIF = 1;

    /* Call the user's isr. */
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
 *  To detect the rollover, we retrieve the count, check the IFR flag for the
 *  timer interrupt, then check the count again, all with interrupts disabled
 *  (the caller should disable interrupts).
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
 *  directly, which means the count value is going *down* on the 28x. This
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
    Bits16 ifrFlag;

    /* Get the timer count. */
    count1 = TimerDevices[obj->id].TIM;

    /*
     * Check if a timer interrupt has occurred. We don't clear the TIF bit in
     * the Timer control register, so we have to check the IFR.
     */
    ifrFlag = Hwi_getInterruptFlag(obj->intNum);

    /* Get the timer count a second time. */
    count2 = TimerDevices[obj->id].TIM;

    /* Get the period value to use to invert the count. */
    period = TimerDevices[obj->id].PRD;

    /* Check if the counter has wrapped. See function comment. */
    if (ifrFlag || (count1 < count2)) {
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
 *  ======== getExpiredCounts64 ========
 *  This API is used by the TimestampProvider as part of retrieving a timestamp
 *  using a timer and a tick counter. It returns the timer's count but also
 *  accounts for timer rollover.
 *
 *  The logic in this API is equivalent to 'getExpiredCounts', however, this
 *  API is used by the TimestampProvider as part of retrieving a 64-bit
 *  timestamp when the TimestampProvider is using a dedicated timer. If it's
 *  sharing the Clock timer, it calls 'getExpiredCounts' instead.
 *
 *  This function takes a pointer to a Types_Timestamp64 which is passed in
 *  from TimestampProvider_get64. The 'hi' field of the result should already
 *  be initialized before this API is called.
 *
 *  This API must be called with interrupts disabled.
 *
 *  Refer to 'getExpiredCounts' for an explanation of the hi/lo coherence
 *  logic.
 */
Void Timer_getExpiredCounts64(Timer_Object *obj, Types_Timestamp64 *result)
{
    UInt32 count1, count2;
    Bits16 ifrFlag;

    /* Get the timer count. */
    count1 = TimerDevices[obj->id].TIM;

    /*
     * Check if a timer interrupt has occurred. We don't clear the TIF bit in
     * the Timer control register, so we have to check the IFR.
     */
    ifrFlag = Hwi_getInterruptFlag(obj->intNum);

    /* Get the timer count a second time. */
    count2 = TimerDevices[obj->id].TIM;

    /* Invert the count so we count upward. */
    result->lo = TimerDevices[obj->id].PRD - count2;

    /* Check if the counter has wrapped. See function comment. */
    if (ifrFlag || (count1 < count2)) {
        result->hi++;
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
 */
Void Timer_getFreq(Timer_Object *obj, Types_FreqHz *freq)
{
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

    if (obj->runMode == Timer_RunMode_CONTINUOUS) {
        Hwi_setFunc(obj->hwi, obj->tickFxn, obj->arg);
    }
    else {
        Hwi_setFunc(obj->hwi, Timer_oneShotStub, (UArg)obj);
    }
}

/*
 *  ======== Timer_checkOverflow ========
 *  Parameter 'a' is counts per ms, and parameter 'b' is the desired
 *  period in ms.
 *  Returns true if a * b is greater than MAX_PERIOD (overflow).
 */
Bool Timer_checkOverflow(UInt32 a, UInt32 b)
{
    return ((b > 0) && (a > (Timer_MAX_PERIOD / b)));
}

/*
 *  ======== Timer_trigger ========
 *  For the 28x, the timer frequency is equal to the CPU frequency, so
 *  just set the period to the number of instructions.
 */
Void Timer_trigger(Timer_Object *obj, UInt32 instructions)
{
    UInt key;

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, instructions);
    Timer_start(obj);
    Hwi_restore(key);
}



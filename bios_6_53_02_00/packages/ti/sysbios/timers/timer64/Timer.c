/*
 * Copyright (c) 2014-2016, Texas Instruments Incorporated
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
#include <ti/sysbios/knl/Intrinsics.h>
#ifdef xdc_target__isaCompatible_64P
#define ti_sysbios_family_c64p_Hwi__nolocalnames
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/hal/Hwi.h>
#else
#include <ti/sysbios/hal/Hwi.h>
#endif
#include "package/internal/Timer.xdc.h"

/*
 * Timer Control Register 12 (TCR12) Description
 * Bit#         Name            Value
 * 15-10        RESERVED        0
 * 09           TIEN            0
 * 08           CLKSRC          1 Timer Input pin
 * 07-06        ENAMODE         10 continuous operation
 * 05-04        PWID            0
 * 03           C/P_            1
 * 02           INVINP          0
 * 01           INVOUTP         0
 * 00           TSTAT           n/a value of timer output
 */
#define TIMER_TCR_START_CONTINUOUS      0x0080 
#define TIMER_TCR_START_ONESHOT         0x0040 
#define TIMER_TCR_RESUME                0x0080
#define TIMER_TCR_DEFAULT               0x0000
#define TIMER_TCR12_DISABLE_MASK        0xffffff3f
#define TIMER_TCR34_DISABLE_MASK        0xff3fffff
#define TCR_TSTAT_MASK                  0x0001

typedef volatile struct TimerRegs {
    UInt pid12;
    UInt emumgt;
    UInt gpint;
    UInt gpdir;
    UInt cnt;
    UInt cnt34;
    UInt prd;
    UInt prd34;
    union {
        struct {
            UInt16 s_tcr12;
            UInt16 s_tcr34;
        } tcrHalf;
        UInt tcrWhole;
    } u_tcr;
    union {
        struct {
            UInt16 s_gtcr1;
            UInt16 s_gtcr2;
        } gtcrHalf;
        UInt gtcrWhole;
    } u_gtcr;
    UInt wdtcr;
    UInt pad[2];
    UInt rello;
    UInt relhi;
    UInt caplo;
    UInt caphi;
    UInt intctlstat;
    Char buf[0x400 - (14 * 4)];
} TimerRegs;

#define tcr u_tcr.tcrWhole
#define tcr12 u_tcr.tcrHalf.s_tcr12
#define tcr34 u_tcr.tcrHalf.s_tcr34
#define gtcr u_gtcr.gtcrWhole
#define gtcr1 u_gtcr.gtcrHalf.s_gtcr1
#define gtcr2 u_gtcr.gtcrHalf.s_gtcr2

#define chained(obj) (Timer_module->gctrl[((obj)->id >> 1)].mode == Timer_Mode_CHAINED)

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
    Int clkSrc;

    obj->tickFxn = tickFxn;

    clkSrc = (params->extFreq.lo) ? 1 : 0;

    obj->tcrInit = (params->controlInit.invout << 1) |
                   (params->controlInit.invin << 2) |
                   (params->controlInit.cp << 3) |
                   (params->controlInit.pwid << 4) |
                   (clkSrc << 8) |
                   (params->controlInit.tien << 9);

    obj->emumgtInit = (params->emuMgtInit.free << 0) |
                      (params->emuMgtInit.soft << 1);

    obj->gpioIntEn = (params->gpioIntEn.gpint12_eni << 0) |
                     (params->gpioIntEn.gpint12_eno << 1) |
                     (params->gpioIntEn.gpint12_invi << 4) |
                     (params->gpioIntEn.gpint12_invo << 5) |
                     (params->gpioIntEn.gpint34_eni << 8) |
                     (params->gpioIntEn.gpint34_eno << 9) |
                     (params->gpioIntEn.gpint34_invi << 12) |
                     (params->gpioIntEn.gpint34_invo << 13) |
                     (params->gpioIntEn.gpio_eni12 << 16) |
                     (params->gpioIntEn.gpio_eno12 << 17) |
                     (params->gpioIntEn.gpio_eni34 << 24) |
                     (params->gpioIntEn.gpio_eno34 << 25);

    obj->gpioDatDir = (params->gpioDatDir.gpio_dati12 << 0) |
                      (params->gpioDatDir.gpio_dato12 << 1) |
                      (params->gpioDatDir.gpio_dati34 << 8) |
                      (params->gpioDatDir.gpio_dato34 << 9) |
                      (params->gpioDatDir.gpio_diri12 << 16) |
                      (params->gpioDatDir.gpio_diro12 << 17) |
                      (params->gpioDatDir.gpio_diri34 << 24) |
                      (params->gpioDatDir.gpio_diro34 << 25);

    obj->intCtl     = (params->intCtl.prdinten_lo << 0) |
                      (params->intCtl.prdinten_hi << 16);

    obj->runMode = params->runMode;
    obj->startMode = params->startMode;
    obj->period = params->period;
    obj->periodType = params->periodType;
    obj->prescalar = params->prescalar;
    if (params->intNum == -1) {
        obj->intNum = Timer_module->device[obj->id].intNum;
    }
    else {
        obj->intNum = params->intNum;
    }
    obj->arg = params->arg;
    obj->extFreq.lo = params->extFreq.lo;
}

/*
 *  ======== Timer_initDevice ========
 */
Void Timer_initDevice(Timer_Object *obj, Error_Block *eb)
{
    UInt hwiKey;
    TimerRegs *timer;
   
    Timer_TimerSupportProxy_enable(obj->id >> 1, eb);

    hwiKey = Hwi_disable();
    
    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        timer->tcr12 = 0;               /* disable lower half of timer */
        timer->prd = 0;
        timer->cnt = 0;
    }
    if (chained(obj) || (obj->half == Timer_Half_UPPER)) {
        timer->tcr34 = 0;               /* disable upper half of timer */
        timer->prd34 = 0;
        timer->cnt34 = 0;
    }

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
    UInt tcrInit;
    UInt gtcrInit;
    UInt intCtlInit;
    TimerRegs *timer;
    UInt hwiKey;
#ifdef xdc_target__isaCompatible_64P
    extern cregister volatile UInt DNUM;
#endif

#ifdef xdc_target__isaCompatible_64P
    /* This is done for shared timers on homogeneous multicore devices */
    if ((Timer_numLocalTimers) &&
        ((obj->id >> 1) >= Timer_numLocalTimers) &&
        (Timer_module->gctrl[obj->id >> 1].ownerCoreId != DNUM)) {
        /* if shared timer and not owner then return */
        return (0);
    }
#endif

    timer = (TimerRegs *)Timer_module->device[obj->id].baseAddr;

    /* initialize the timer */
    Timer_initDevice(obj, eb);
    
    hwiKey = Hwi_disable();

    /* set the timer control register */
    if (chained(obj)) {
        timer->tcr = obj->tcrInit;
    }
    else {
        tcrInit = timer->tcr;
        if (obj->half == Timer_Half_LOWER) {
            tcrInit = (tcrInit & 0xffff0000) | obj->tcrInit;
        }
        else {
            tcrInit = (tcrInit & 0x0000ffff) |  (obj->tcrInit << 16);
        }
        timer->tcr = tcrInit;
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
        if (chained(obj)) {
            timer->prd34 = obj->prescalar;
            timer->prd = obj->period;
        }
        else if (obj->half == Timer_Half_LOWER) {
            timer->prd = obj->period;
        }
        else {
            timer->prd34 = obj->period;
        }
    }

    /* if 'chained' mode, the timer mode must be set release and reset */
    if (chained(obj)) {
        timer->emumgt = obj->emumgtInit;

        if (Timer_useTimer64pRegMap) {
            intCtlInit = timer->intctlstat;
            intCtlInit &= ~(0x10001);
            intCtlInit |= (obj->intCtl & 0x10001);
            timer->intctlstat = intCtlInit;
        }
        else {
            timer->gpint = obj->gpioIntEn;
            timer->gpdir = obj->gpioDatDir;
        }

        timer->gtcr = 0xF;
    }
    else {
        /* if 'master', configure the mode and release timer from reset */
        if (Timer_module->gctrl[obj->id >> 1].master) {
            timer->emumgt = obj->emumgtInit;

            if (Timer_useTimer64pRegMap) {
                intCtlInit = timer->intctlstat;
                if (obj->id % 2) {
                    intCtlInit &= ~(0x10000);
                    intCtlInit |= (obj->intCtl & 0x10000);
                }
                else {
                    intCtlInit &= ~(0x1);
                    intCtlInit |= (obj->intCtl & 0x1);
                }
                timer->intctlstat = intCtlInit;
            }
            else {
                timer->gpint = obj->gpioIntEn;
                timer->gpdir = obj->gpioDatDir;
            }

            /* read gtcr, clear old mode, and set to unchained mode */
            gtcrInit = timer->gtcr;
            gtcrInit &= ~(0xC);
            gtcrInit |= 0x4 |  (1 << (obj->id % 2)); 
            timer->gtcr = gtcrInit;
        }
    }

    Hwi_restore(hwiKey);
    return (0);
}

/*
 *  ======== Timer_getNextAvailableTimerId ========
 *  Returns the next available logical Timer id.
 *  Returns Timer_ANY if none is available.
 */
UInt Timer_getNextAvailableTimerId(Timer_Object *obj)
{
    Int i, j;
    UInt timerId = Timer_ANY;
    
    for (i = Timer_localTimerBaseId; i < Timer_numTimerDevices; i++) {
        if (i < 32) {
           if ((Timer_anyMask & (1 << i)) &&
               (Timer_module->availMask & (1 << i))) {
               /* make sure we're not trying to get a shared timer */
               if ((Timer_numLocalTimers) &&
                   ((i >> 1) >= (Timer_localTimerBaseId + Timer_numLocalTimers))) {
                   /* return with timerId = Timer_ANY if shared timer */
                   break;
               }

               /* if 'chained' both halves need to be free */
               if (Timer_module->gctrl[i >> 1].mode == Timer_Mode_CHAINED) {
                   Timer_module->availMask &= ~(3 << (i >> 1));
               }
               else {
                    /* if 'unchained' determine which half is free */
                    Timer_module->availMask &= ~(1 << i);
                    if ((i % 2) == 0) {
                        obj->half = Timer_Half_LOWER;
                    }
                    else {
                        obj->half = Timer_Half_UPPER;
                    }
                }

                timerId = i;
                break;
            }
        }
        else { /* i >= 32 */
            j = i - 32;
            if ((Timer_anyMaskHigh & (1 << j)) &&
               (Timer_module->availMaskHigh & (1 << j))) {
               /* make sure we're not trying to get a shared timer */
               if ((Timer_numLocalTimers) &&
                   ((i >> 1) >= (Timer_localTimerBaseId + Timer_numLocalTimers))) {
                   /* return with timerId = Timer_ANY if shared timer */
                   break;
               }
            
               /* if 'chained' both halves need to be free */
               if (Timer_module->gctrl[i >> 1].mode == Timer_Mode_CHAINED) {
                   Timer_module->availMaskHigh &= ~(3 << (j >> 1));
               }
               else {
                    /* if 'unchained' determine which half is free */
                    Timer_module->availMaskHigh &= ~(1 << j);
                    if ((i % 2) == 0) {
                        obj->half = Timer_Half_LOWER;
                    }
                    else {
                        obj->half = Timer_Half_UPPER;
                    }
                }

                timerId = i;
                break;
            }
        }
    }
    
    return (timerId);
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
    if ((obj->id) < 32) {
        Timer_module->availMask |= (0x1 << obj->id);
    }
    else {
        Timer_module->availMaskHigh |= (0x1 << ((obj->id) - 32));
    }
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
    Int status;
    Int timerId;
    UInt32 mask;
    Hwi_Params hwiParams;
    UInt tempId = Timer_ANY;

    /* if user doesn't specify which half, the Timer_defaultHalf will be used */
    if (params->half == Timer_Half_DEFAULT) {
        obj->half = Timer_defaultHalf;
    }
    else {
        obj->half = params->half;
    }

    /*
     *  The 'id' is based upon physical 64-bit timers.
     *  Timer_numTimerDevices is the number of logical 32-bit halves.
     *  Therefore the shift left by 1 to get the # of 64-bit timers.
     */
    if (id >= (Timer_numTimerDevices >> 1)) {
        if (id != Timer_ANY) {
            Error_raise(eb, Timer_E_invalidTimer, id, 0);
            return (1);
        }
    }

    key = Hwi_disable();
    if (id == Timer_ANY) {
        tempId = Timer_getNextAvailableTimerId(obj);
    }
    else if (Timer_module->gctrl[id].mode == Timer_Mode_CHAINED) {
        if (id < 16) {
            if (((Timer_module->availMask >> (id << 1)) & 0x3) == 3) {
                Timer_module->availMask &= ~(3 << (id << 1));
                tempId = id << 1;
            }
        }
        else {
            if (((Timer_module->availMaskHigh >> ((id - 16) << 1)) & 0x3) == 3) {
                Timer_module->availMaskHigh &= ~(3 << ((id - 16) << 1));
                tempId = id << 1;
            }
        }
    }
    else {
        if (obj->half == Timer_Half_LOWER) {
            mask = 0x1;
            timerId = id << 1;
        }
        else {
            mask = 0x2;
            timerId = (id << 1) + 1;
        }

        if (id < 16) {
            if (Timer_module->availMask & (mask << (id << 1))) {
                Timer_module->availMask &= ~(mask << (id << 1));
                tempId = timerId;
            }
        }
        else {
            if (Timer_module->availMaskHigh & (mask << ((id - 16) << 1))) {
                Timer_module->availMaskHigh &= ~(mask << ((id - 16) << 1));
                tempId = timerId;
            }
        }
    }

    Hwi_restore(key);

    obj->staticInst = FALSE;

    /* obj->id is used internally and is set to the logical id */
    if (tempId == Timer_ANY) {
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
        hwiParams.arg = (UArg)obj->arg;

        /* create Hwi */
        obj->hwi = Hwi_create(obj->intNum, obj->tickFxn, &hwiParams, eb);
        
        if (!obj->hwi) {
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
#ifdef xdc_target__isaCompatible_64P
    UInt timerId;
    extern cregister volatile UInt DNUM;
#endif

#ifdef xdc_target__isaCompatible_64P
    for (i = 0; i < Timer_numTimerDevices; i++) {
        if ((Timer_numLocalTimers) &&
            ((i >> 1) < Timer_numLocalTimers) &&
            ((i >> 1) != DNUM)) {
            /* remove unsupported local timers from each core */
            Timer_module->availMask &= ~(1 << i);
        }
    }
#endif

    for (i = 0; i < Timer_numTimerDevices; i++) {
        /* get the instance handles */
        obj = Timer_module->handles[i];
        
        /* if timer was statically created/constructed */
        if ((obj != NULL) && (obj->staticInst)) {
#ifdef xdc_target__isaCompatible_64P
            if (obj->id == Timer_ANY) {
                timerId = Timer_getNextAvailableTimerId(obj);
                /* Assert that a valid timer id is found */
                Assert_isTrue(timerId != Timer_ANY,
                              Timer_A_notAvailable);
                
                /* Update the obj and hwi event */
                obj->id = timerId;
                Timer_module->handles[i] = NULL;
                Timer_module->handles[obj->id] = obj;
                ti_sysbios_family_c64p_Hwi_eventMap(
                    Timer_module->device[obj->id].intNum,
                    Timer_module->device[obj->id].eventId);
            }
            else if (Timer_numLocalTimers) {
                /*
                 *  for devices with local timers (e.g., c6472), make sure
                 *  that the selected timer is a valid timer for the given core.
                 */
                Assert_isTrue((((obj->id >> 1) >= Timer_numLocalTimers) ||
                    ((obj->id >> 1) == DNUM)), Timer_A_notAvailable);
            }
#endif /* isaCompatible_64p */

            if (Timer_startupNeeded) { 
                Timer_postInit(obj, NULL);
            }
        }
    }
    
    return (Startup_DONE);
}

/*
 *  ======== Timer_getCount ========
 */
UInt32 Timer_getCount(Timer_Object *obj)
{
    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        return (((TimerRegs *)Timer_module->device[obj->id].baseAddr)->cnt);
    }
    else {
        return (((TimerRegs *)Timer_module->device[obj->id].baseAddr)->cnt34);
    }
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
    Types_FreqHz cpufreq;

    /* re-calculate timer freq if dependent on cpu freq */
    if (Timer_freqDivisor) {
        BIOS_getCpuFreq(&cpufreq);
        
        /* not supporting cpu frequencies over 4 Ghz */
        Assert_isTrue((cpufreq.hi == 0), NULL);
        
        cpufreq.lo = cpufreq.lo / Timer_freqDivisor;
        
        if (obj->extFreq.lo != 0) {
            obj->extFreq = cpufreq;
        }
        else {
            Timer_module->intFreqs[obj->id >> 1] = cpufreq;
        }
    }

    /* get the timer frequency */
    if (obj->extFreq.lo != 0) {
        *freq = obj->extFreq;
    }
    else {
        *freq = Timer_module->intFreqs[obj->id >> 1];
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
    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        return (((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd);
    }
    else {
        return (((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd34);
    }
}

/*
 *  ======== Timer_getStatus ========
 */
Timer_Status Timer_getStatus(UInt timerId)
{
    Assert_isTrue(timerId < (UInt)(Timer_numTimerDevices >> 1), NULL);

    /* both halves must be FREE to return FREE */
    if (timerId < 16) {
        if (((Timer_module->availMask >> (timerId << 1)) & 0x3) == 0x3) {
            return (Timer_Status_FREE);
        }
        /* returns INUSE if either or both halves are INUSE */
        else {
            return (Timer_Status_INUSE);
        }
    }
    else {
        if (((Timer_module->availMaskHigh >> ((timerId - 16) << 1)) & 0x3)
                == 0x3) {
            return (Timer_Status_FREE);
        }
        /* returns INUSE if either or both halves are INUSE */
        else {
            return (Timer_Status_INUSE);
        }
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

    if (obj->tickFxn != NULL) {
        Hwi_setFunc(obj->hwi, obj->tickFxn, obj->arg);
    }
   
    // leave it to caller to check eb
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
    Hwi_setFunc(obj->hwi, obj->tickFxn, obj->arg);
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
    Timer_stop(obj);
    obj->period = period;
    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd = period;
    }
    else {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd34 = period;
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
    UInt32 prdCounts, pscCounts;
    UInt32 freqKHz;
    UInt32 shift = 0;

    Timer_stop(obj);
                
    /* Today c64 supports less than 4.2GHz */
    Timer_getFreq(obj, &freqHz);

    freqKHz = freqHz.lo / 1000;
    if (!chained(obj) && Timer_checkOverflow(freqKHz, period/1000)) {
        return (FALSE);
    }

    counts = ((UInt64)freqKHz * (UInt64)period) / (UInt64)1000;
    if (counts > 0xffffffff) {
        pscCounts = counts >> 32;
        if (pscCounts) {
            shift = Intrinsics_maxbit(pscCounts) + 1;
            pscCounts = (1 << shift) - 1;
        }
        prdCounts = (counts >> shift);
    }
    else {
        prdCounts = counts;
        pscCounts = 0;
    }

    obj->period = prdCounts;
    obj->periodType = Timer_PeriodType_COUNTS;
    obj->prescalar = pscCounts;

    if (chained(obj)) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd = prdCounts;
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd34 =
            pscCounts;
    }
    else {
        if (pscCounts != 0) {
            return(FALSE);
        }
        if (obj->half == Timer_Half_LOWER) {
            ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd =
                prdCounts;
        }
        else {
            ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->prd34 =
                prdCounts;
        }
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
    UInt tcrInit;
    UInt runMode;

    key = Hwi_disable();

    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->cnt = 0;
    }
    if (chained(obj) || (obj->half == Timer_Half_UPPER)) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->cnt34 = 0;
    }

    if (obj->hwi) {
        Hwi_clearInterrupt(obj->intNum);
        Hwi_enableInterrupt(obj->intNum);
    }

    if (obj->runMode == Timer_RunMode_CONTINUOUS) {
        runMode = TIMER_TCR_START_CONTINUOUS;
    }
    else {
        runMode = TIMER_TCR_START_ONESHOT;
    }

    if ((chained(obj))) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcr = 
            runMode | obj->tcrInit;
    }
    else {
        /* read/write full TCR */
        tcrInit = ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcr;

        if (obj->half == Timer_Half_LOWER) {
            tcrInit = (tcrInit & 0xffff0000) | runMode | obj->tcrInit;
        }
        else {
            tcrInit = (tcrInit & 0x0000ffff) | ((runMode | obj->tcrInit) << 16);
        }
        
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcr = tcrInit;
    }

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
    if (chained(obj) || (obj->half == Timer_Half_LOWER)) {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcr &=
            TIMER_TCR12_DISABLE_MASK;
    }
    else {
        ((TimerRegs *)Timer_module->device[obj->id].baseAddr)->tcr &=
            TIMER_TCR34_DISABLE_MASK;
    }

    if (obj->hwi) {
        Hwi_disableInterrupt(obj->intNum);
    }
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

    /* calculate the CPU and timer frequency ratio */
    ratio = (cpuCounts * 10) / timerCounts;

    /* calculate the number of timer cycles to trigger after */
    period = (UInt64)((UInt64)insts * (UInt64)10) / ratio;

    /*
     *  calculate the number of cycles to delay, based on the frequency
     *  ratio
     */
    count = insts - (UInt64)((UInt64)period * (UInt64)ratio) / 10;

    if (period == 0) {
        period = 1;
    }

    /* follow proper procedure for dynamic period change */
    key = Hwi_disable();
    Timer_setPeriod(obj, period);
    Timer_spinLoop(count);
    Timer_start(obj);
    Hwi_restore(key);
}

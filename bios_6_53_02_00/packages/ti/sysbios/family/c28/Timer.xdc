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
 *  ======== Timer.xdc ========
 *
 *
 */

package ti.sysbios.family.c28;

import xdc.rov.ViewInfo;

import xdc.runtime.Error;
import xdc.runtime.Assert;
import xdc.runtime.Types;
import ti.sysbios.interfaces.ITimer;

/*!
 *  ======== Timer ========
 *  Timer peripherals manager for the c28 family.
 *
 *  @p(html)
 *  <h3> 28x Timers </h3>
 *  @p(blist)
 *  - The 28x has three 32-bit timers.
 *  - The 28x timer counts downward from 'period' to 0; however, Timer_getCount
 *    will count upward.
 *  - The 28x timer supports an optional 16-bit prescalar. The prescalar
 *    effectively sets the period of the timer tick; the prescalar counts down
 *    from the prescale factor to 0, then a timer tick occurs. So, with a
 *    prescale set, the actual timer period is (prescale * period).
 *  @p
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #getNumTimers}            </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getStatus}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #construct}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #create}                  </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delete}                  </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #destruct}                </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getCount}                </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getFreq}                 </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getPeriod}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getPrescale}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getPrescaleCount}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #reconfig}                </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriod}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriodMicroSecs}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPrescale}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #start}                   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #stop}                    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Timer_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Timer_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *  </table>
 *  @p
 */

@ModuleStartup          /* To configure static timers */
@InstanceInitStatic

module Timer inherits ti.sysbios.interfaces.ITimer
{
    /*! Max value of Timer period for PeriodType_COUNTS*/
    const UInt MAX_PERIOD = 0xffffffff;

    /*! Number of timer peripherals on chip */
    const Int NUM_TIMER_DEVICES = 3;

    /*! Timer Emulation Mode. */
    struct EmulationMode {
        UInt free;      /*! At sw breakpoint, stop or free-run the timer. */
        UInt soft;      /*! At sw breakpoint, hard stop or run down timer. */
    };

    /*! @_nodoc */
    metaonly struct BasicView {
        Ptr         halTimerHandle;
        String      label;
        UInt        id;
        String      startMode;
        String      runMode;
        UInt        period;
        String      periodType;
        UInt        prescalar;
        UInt        intNum;
        UArg        arg;
        String      tickFxn[];
        String      hwiHandle;
    };

    /*! @_nodoc */
    metaonly struct DeviceView {
        UInt        id;
        String      deviceAddr;
        UInt        intNum;
        UInt        period;
        UInt        currCount;
        UInt        remainingCount;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic', structName: 'BasicView'}],
                ['Device', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitDevice', structName: 'DeviceView'}],
            ]
        });

    /*!
     *  Assert raised in Timer_create when timer id specified is not supported.
     */
    config Assert.Id A_invalidTimer = {
        msg: "A_invalidTimer: Timer id must be 0-2"
    };

    /*!
     *  Error raised in Timer_create when timer requested is in use.
     */
    config Error.Id E_notAvailable = {
        msg: "E_notAvailable: Timer not available %d"
    };

    /*!
     *  Assert raised in Timer_create if an invalid RunMode is requested.
     */
    config Assert.Id A_invalidRunMode = {
        msg: "A_invalidRunMode: Invalid RunMode"
    };

    /*!
     *  Assert raised in Timer_create when Hwi Params does not mask 'self'.
     *
     *  This is not allowed because the timers on this platform do not
     *  inherently support one-shot mode. Instead, a stub is used to stop the
     *  timer, so it is important that the timer interrupt not occur again
     *  before the stub has stopped the timer.
     */
    config Assert.Id A_invalidHwiMask = {
        msg: "A_InvalidMask: Mask in hwiParams cannot enable self"
    };

    /*!
     *  Assert raised when period requested is not supported.
     */
    config Assert.Id E_cannotSupport = {
        msg: "E_cannotSupport: Timer cannot support requested period"
    };

    /*!
     *  ======== anyMask ========
     *  Available mask to be used when select = Timer_ANY
     */
    config UInt anyMask = 0x7;

instance:

    /*!
     *  ======== emulationModeInit ========
     *  Initial timer emulation mode. Default hard stop.
     *
     *  Determines timer state at a software breakpoint. If 'free' is 1, the
     *  timer will continue to run, and the value of 'soft' doesn't matter.
     *  When 'free' is 0 and 'soft' is 1, the timer runs down to 0 then stops.
     *  When 'free' is 0 and 'soft' is 0, the timer halts.
     *
     *  @p(html)
     *  <pre>
     *  FREE   SOFT
     *  0      0      Stop after next timer decrement. (Hard stop)
     *  0      1      Stop after timer runs down to 0. (Soft stop)
     *  1      x      Continue running the timer.
     *  </pre>
     */
    config EmulationMode emulationModeInit = {free: 0, soft: 0};

    /*!
     *  ======== prescale ========
     *  Prescale factor.
     *
     *  The prescale factor determines the length of a timer tick.
     *  If a prescale of 10 is specified, a timer tick will occur
     *  every 11 cycles.
     *
     *  If the timer is used as a counter, the prescale factor determines
     *  the period between counts. Otherwise, the prescale factor can be used
     *  to achieve longer timer periods: with a prescale specified, the actual
     *  period is (period * prescale+1).
     */
    config UInt16 prescale = 0;

    /*!
     *  ======== hwiParams ========
     *  Parameters for the Hwi object created for the Timer ISR.
     *
     *  The mask setting for the Hwi object should include SELF to prevent
     *  nested timer interrupts.
     */
    config Hwi.Params *hwiParams = null;

    /*!
     *  ======== getCount ========
     *  Returns the number of counts that have passed.
     *
     *  The 28x timer counts downward from the period to 0, but getCount
     *  subtracts the timer counter value from the period so that getCount
     *  counts upward instead of downward.
     *
     *  @b(returns) timer counts, counting upward from 0
     */
    override UInt32 getCount();

    /*!
     *  ======== setPreScale ========
     *  Set timer prescale value.
     *
     *  This function sets the value of the prescalar, and will also reload
     *  the timer counter and prescale registers.
     *
     *  The prescalar decrements with each timer clock source cycle until it
     *  reaches zero, then the timer's count is decremented by one. The
     *  prescalar has the effect of setting the rate of the timer tick.
     *
     *  @param(preScalar) The value to set the prescale period to.
     */
    Void setPrescale(UInt16 preScalar);

    /*!
     *  ======== getPrescale ========
     *  Get timer prescale value.
     *
     *  This is not the prescale count, but the period of the prescalar.
     *
     *  @b(returns) prescale value
     */
    UInt16 getPrescale();

    /*!
     *  ======== getPrescaleCount ========
     *  Reads timer prescale counter.
     *
     *  The prescale counter counts down from prescale to 0, but
     *  getPrescaleCount subtracts the counter value from the period so that
     *  this function counts upward instead of downward.
     *
     *  @b(returns) prescale counter, counting upward from 0
     */
    UInt16 getPrescaleCount();

    /*!
     *  ======== getExpiredCounts64 ========
     *  @_nodoc
     *  Called by TimestampProvider to read the timer counter, accounting
     *  for counter rollover.
     *
     *  This version of the API returns a 64-bit count and is only used when
     *  the TimestampProvider is using a dedicated timer.
     *
     *  This function must be called with interrupts disabled.
     *
     *  @b(returns) Timer counts, accounting for counter rollover.
     */
    Void getExpiredCounts64(Types.Timestamp64 *result);

    /*!
     *  ======== reconfig ========
     *  Used to modify timer instances at runtime.
     *
     *  @param(timerParams)     timer Params
     *  @param(tickFxn)         functions that runs when timer expires
     */
    Void reconfig(FuncPtr tickFxn, const Params *timerParams, Error.Block *eb);

internal:   /* not for client use */

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Timers
     */
    Int postInit(Object *timer, Error.Block *eb);

    /*
     *  ======== stopAndClear ========
     */
    Void stopAndClear(Object *timer);

    /*
     *  ======== checkOverflow ========
     */
    Bool checkOverflow(UInt32 a, UInt32 b);

    /*!
     *  ======== oneShotStub ========
     *  This stub implements oneShot mode by stopping the timer and clearing
     *  the CPU IFR bit. It does not clear the PIEIFR bit, so timer 0 does
     *  not support one shot mode.
     *
     *  @param(arg) The timer object
     */
    Void oneShotStub(UArg arg);

    /*!
     *  ======== startupNeeded ========
     *  Flag used to prevent Module_startup and Timer_startup code from being
     *  brought in unnecessarily. Flag is set if there are any static Timer
     *  instances.
     */
    config UInt startupNeeded = false;

    config UInt8 intNumDef[3];

    struct Instance_State {
        Int                id;             /* timer id. */
        EmulationMode      emulationModeInit; /* initial emu mode */
        ITimer.RunMode     runMode;        /* timer mode */
        ITimer.StartMode   startMode;      /* timer mode */
        UInt32             period;         /* period */
        ITimer.PeriodType  periodType;
        UInt16             prescale;       /* prescale */
        UInt               intNum;         /* intr num */
        UArg               arg;            /* tickFxn arg*/
        Hwi.FuncPtr        tickFxn;        /* tickFxn */
        Types.FreqHz       extFreq;
        Hwi.Handle         hwi;
    }

    struct Module_State {
        Char   availMask;                       /* Available peripherals */
        Handle staticTimers[NUM_TIMER_DEVICES]; /* Array of statically created
                                                 * timer handles based on id */
    }
}

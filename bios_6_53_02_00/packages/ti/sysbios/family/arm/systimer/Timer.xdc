/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 */

package ti.sysbios.family.arm.systimer;

import xdc.rov.ViewInfo;

import xdc.runtime.Error;
import xdc.runtime.Types;

import ti.sysbios.family.arm.gic.Hwi;
import ti.sysbios.interfaces.ITimer;

/*!
 *  ======== Timer ========
 *  Generic Timer Peripheral Manager for Arm v7A family prcoessors
 *
 *  Generic Timer is an optional extension to an ARM v7A or v7R processor
 *  implementation. Generic Timer provides a system counter that measures
 *  the passing of time in real-time. This system counter is in a always-on
 *  power domain. The system counter is guaranteed to be atleast 56-bits
 *  wide. The timer increments at a frequency typically in the range 1-50MHz.
 *  On OMAP5, the Generic Timers increment at a frequency of 6.144 MHz.
 *  This timer is guaranteed to have a roll-over time of no less than 
 *  40 years.
 *
 *  This module supports non-secure PL1 physical counter and virtual counter
 *  operating as 64-bit upcounters. The timer triggers when the appropriate
 *  counter reaches the programmed threshold value.
 *      Timer Triggered = ((Counter[63:0] - Threshold[63:0]) >= 0)
 *
 *  For more information please refer the Generic Timer section on pg. B8-1929
 *  of ARM Architecture TRM for v7-AR.
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
 *    <tr><td> {@link #getCount64}              </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getFreq}                 </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getPeriod}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getPeriod64}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #reconfig}                </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriod}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriod64}             </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriodMicroSecs}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriodMicroSecs64}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
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
 *
 *  </table>
 *  @p
 *
 */
@ModuleStartup          /* to configure static timers */
@InstanceInitStatic

module Timer inherits ti.sysbios.interfaces.ITimer
{
    /*! 
     *  Max value of Timer period for PeriodType_COUNTS
     *
     *  The architecture guarantees the system counter is atleast
     *  56-bits wide. Therefore, this module limits the maximum
     *  count to the largest 56 bit number.
     */
    const UInt64 MAX_PERIOD = 0x00FFFFFFFFFFFFFF;

    /*! Number of timer peripherals on chip */
    const Int NUM_TIMER_DEVICES = 2;

    /*! override supportsDynamic - this Timer does support RunMode_DYNAMIC */
    override metaonly config Bool supportsDynamic = true;

    /*! @_nodoc */
    @XmlDtd
    metaonly struct BasicView {
        Ptr         halTimerHandle;
        String      label;
        UInt        id;
        String      startMode;
        String      runMode;
        String      period;
        String      periodType;
        UInt        intNum;
        String      tickFxn[];
        UArg        arg;  
        String      extFreq;
        String      hwiHandle;
        String      prevThreshold;
        String      nextThreshold;
    };

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      availMask;      /* available 32-bit timer halves */
    }

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
            [
                'Basic',
                {
                    type: ViewInfo.INSTANCE,
                    viewInitFxn: 'viewInitBasic',
                    structName: 'BasicView'
                }
            ],
            [
                'Module',
                {
                    type: ViewInfo.MODULE,
                    viewInitFxn: 'viewInitModule',
                    structName: 'ModuleView'
                }
            ],
            ]
        });

    /*! 
     *  Error raised when timer id specified is not supported.
     */
    config Error.Id E_invalidTimer  = 
        {msg: "E_invalidTimer: Invalid Timer Id %d"}; 

    /*! 
     *  Error raised when timer requested is in use
     */
    config Error.Id E_notAvailable  = 
        {msg: "E_notAvailable: Timer not available %d"}; 

    /*! 
     *  Error raised when Hwi Params has mask where self is turned on.
     *  
     *  This is not allowed because the timers on this platform do not 
     *  support one-shot mode and a stub is used to stop it.
     *  Another timer interrupt cannot go off when the ISR is running.
     */
    config Error.Id E_invalidHwiMask  = 
        {msg: "E_InvalidMask: Mask in hwiParams cannot enable self"}; 

    /*! 
     *  Error raised when period requested is not supported
     */
    config Error.Id E_cannotSupport  = 
        {msg: "E_cannotSupport: Timer cannot support requested period %d"}; 

    /*!
     *  ======== intNumDef ========
     *  A15 Generic Timer interrupt numbers
     * 
     *  Generic Timer Interrupts are forwarded to GIC's private peripheral 
     *  interrupts and have a architecture defined fixed mapping that should
     *  be same across all A15 variants.
     *
     *  Non-secure physical timer -> PPI2 or Interrupt #30
     *  Virtual timer             -> PPI4 or Interrupt #27
     */
    config UInt intNumDef[2];

    /*!
     *  ======== anyMask ========
     *  Available mask to be used when select = Timer_ANY
     */
    config UInt anyMask = 0x3;

    /*!
     *  ======== availMask ========
     *  Available mask tracks the available/free timer peripherals
     */
    config UInt availMask = 0x3;

    /*!
     *  ======== intFreq ========
     *  Default internal timer input clock frequency.
     *
     *  @a(NOTE)
     *  On OMAP5x, DRA7x and ADAS devices, the Generic Timer
     *  operates at a fixed frequency of 6144000 Hz.
     *
     *  On Keystone 2 devices, the Genric Timer operates at
     *  Main PLL frequency /6. The default internal timer
     *  input frequency for Keystone 2 devices is 20480000 Hz
     *  which is derived from the Main PLL bypass clock fequency
     *  of 122.88 MHz. If the Main PLL is initialized to a different
     *  frequency then this config param should be updated accordigly.
     *
     *  For instance, if Main PLL frequency is configured to be 614.4 MHz,
     *  the Timer operates at 102.4 MHz and Timer.intFreq should be set to
     *  this value.
     *
     *  @p(code)
     *  var Timer = xdc.useModule('ti.sysbios.family.arm.systimer.Timer');
     *  Timer.intFreq.lo = 102400000; // = (Main PLL freq / 6)
     *  Timer.intFreq.hi = 0;
     *  @p
     */
    config Types.FreqHz intFreq;

    /*!
     *  ======== oneShotStub ========
     *  @_nodoc
     *  This stub stops timer and disables its interrupt.
     *
     *  @param(arg)     Timer Handle.
     */
    Void oneShotStub(UArg arg);

    /*!
     *  ======== periodicStub ========
     *  @_nodoc
     *  Cortex-A15 Generic timer does not support periodic mode. This
     *  function re-loads the timer with the desired period.
     *
     *  @param(arg)     Timer Handle.
     */
    Void periodicStub(UArg arg);

    /*!
     *  ======== getHandle ========
     *  @_nodoc
     *  Used by TimestampProvider module to get hold of timer handle used by 
     *  Clock.
     *
     *  @param(id)      timer Id.
     */
    Handle getHandle(UInt id);

instance:

    /*! Hwi Params for Hwi Object. Default is null.*/
    config Hwi.Params *hwiParams = null;

    /*!
     *  ======== period64 ========
     *  Period of a tick
     *
     *  The period can be specified in timer counts or microseconds and its
     *  default value is 0.
     *
     *  This timer implementation supports a max period of UInt64 timer
     *  counts.
     */
    config UInt64 period64 = 0;

    /*!
     *  ======== reconfig ========
     *  Used to modify static timer instances at runtime.
     *
     *  @param(timerParams)     timer Params
     *  @param(tickFxn)         functions that runs when timer expires.
     */
    Void reconfig(FuncPtr tickFxn, const Params *timerParams, Error.Block *eb);

    /*!
     *  ======== setPeriod64 ========
     *  Set timer period specified in timer counts
     *
     *  Timer_setPeriod64() invokes Timer_stop() prior to setting the period
     *  and leaves the timer in the stopped state.
     *
     *  A15 architecture guarantees a minimum timer counter width of 56 bits.
     *  Therefore, the period should be limited to a value no greater than 
     *  0xFFFFFFFFFFFFFF.
     *
     *  To dynamically change the period of a timer you must
     *  protect against re-entrancy by disabling interrupts.
     *  Use the following call sequence to guarantee proper results:
     *
     *  @p(code)
     *  // disable interrupts if an interrupt could lead to
     *  // another call to Timer_start().
     *  key = Hwi_disable();
     *  Timer_setPeriod64(period);
     *  Timer_start();
     *  Hwi_restore(key);
     *  @p
     *
     *
     *  @a(side effects)
     *  Calls Timer_stop(), and disables the timer's interrupt.
     *
     *  @param(period)          64 bit period in timer counts
     */
     Void setPeriod64(UInt64 period);

    /*! 
     *  ======== setPeriodMicroSecs64 ========
     *  Set timer period specified in microseconds.
     *
     *  A best-effort method will be used to set the period register. 
     *  There might be a slight rounding error based on resolution of timer 
     *  period register. If the timer frequency cannot support the requested 
     *  period, i.e. the timer period register cannot support the requested 
     *  period, then this function returns false.
     *
     *  Timer_setPeriodMicroSecs() invokes Timer_stop() prior to setting 
     *  the period and leaves the timer in the stopped state. 
     *
     *  To dynamically change the period of a timer you must
     *  protect against re-entrancy by disabling interrupts.
     *  Use the following call sequence to guarantee proper results:
     *
     *  @p(code)
     *  // disable interrupts if an interrupt could lead to
     *  // another call to Timer_start().
     *  key = Hwi_disable();
     *  Timer_setPeriodMicroSecs(period);
     *  Timer_start();
     *  Hwi_restore(key);
     *  @p
     *
     *  @param(period)          period in microseconds
     */
    Bool setPeriodMicroSecs64(UInt64 microsecs);

    /*! 
     *  ======== getPeriod64 ========
     *  Get timer period in timer counts
     *
     *  @b(returns)     64 bit period in timer counts
     */
    UInt64 getPeriod64();

    /*!
     *  ======== getCount64 ========
     *  Read timer counter register
     *  
     *  @b(returns)     64 bit timer counter value
     */
    UInt64 getCount64();


internal:   /* not for client use */
   
    /*!
     *  ======== startupNeeded ========
     *  Flag used to prevent misc code from being brought in
     *  un-necessarily
     */
    config UInt startupNeeded = false;

    /*
     *  ======== initDevice ========
     *  reset timer to its resting state
     */
    Void initDevice(Object *timer);

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Timers
     */
    Int postInit(Object *timer, Error.Block *eb);

    /*
     *  ======== checkOverflow ========
     */
    Bool checkOverflow(UInt64 a, UInt64 b);

    /*!
     *  ======== readPhyCtrl ========
     *  @_nodoc
     *  Return PL1 Physical Timer Control register contents
     */
    UInt32 readPhyCtrl();

    /*!
     *  ======== readPhyCnt ========
     *  @_nodoc
     *  Return PL1 Physical Timer Count
     */
    Void readPhyCnt(UInt64 *timerCount);

    /*!
     *  ======== writePhyCtrl ========
     *  @_nodoc
     *  Write argument to PL1 Physical Timer Control register
     */
    Void writePhyCtrl(UInt32 arg0);

    /*!
     *  ======== writePhyCmpVal ========
     *  @_nodoc
     *  Write argument to PL1 Physical Timer CompareValue register
     */
    Void writePhyCmpVal(UInt64 *compareVal);

    /*!
     *  ======== readVirtCtrl ========
     *  @_nodoc
     *  Return Virtual Timer Control register contents
     */
    UInt32 readVirtCtrl();

    /*!
     *  ======== readVirtCnt ========
     *  @_nodoc
     *  Return Virtual Timer Count
     */
    Void readVirtCnt(UInt64 *timerCount);

    /*!
     *  ======== tickReconfigSmp ========
     */
    Void tickReconfigSmp(UArg arg);

    /*!
     *  ======== writeVirtCtrl ========
     *  @_nodoc
     *  Write argument to Virtual Timer Control register
     */
    Void writeVirtCtrl(UInt32 arg0);

    /*!
     *  ======== writeVirtCmpVal ========
     *  @_nodoc
     *  Write argument to Virtual Timer CompareValue register
     */
    Void writeVirtCmpVal(UInt64 *compareVal);

    struct Instance_State {
        Bool                staticInst;
        Int                 id;            
        ITimer.RunMode      runMode;    
        ITimer.StartMode    startMode;
        UInt64              period;     
        ITimer.PeriodType   periodType;    
        UInt                intNum;
        UArg                arg;  
        Hwi.FuncPtr         tickFxn;
        Types.FreqHz        extFreq;
        Hwi.Handle          hwi;
        UInt64              prevThreshold;
        UInt64              nextThreshold;
        UInt64              savedCurrCount;
    }

    struct Module_State {
        UInt                availMask;  /* available peripherals */
        Handle              handles[];  /* array of handles based on id */
    }
}

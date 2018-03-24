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
 *  ======== Timer.xdc ========
 */

package ti.sysbios.timers.rti;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;
import xdc.runtime.Error;
import xdc.runtime.Types;
import ti.sysbios.interfaces.ITimer;
import ti.sysbios.hal.Hwi;

/*!
 *  ======== Timer ========
 *  RTI Timer Peripheral Manager.
 *
 *  This Timer module manages the RTI timer peripheral(s) available on the ARM
 *  and C6000 devices (see {@link ./doc-files/TimerTables.html Timer Mapping Tables}
 *  for supported device information).
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
 *    <tr><td> {@link #reconfig}                </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriod}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setPeriodMicroSecs}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
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

module Timer inherits ti.sysbios.interfaces.ITimer
{
    /*! Max value of Timer period for PeriodType_COUNTS*/
    const UInt MAX_PERIOD = 0xffffffff;

    /*! @_nodoc
     *  Min instructions to use in trigger().
     */
    const Int MIN_SWEEP_PERIOD = 8;

    /*! Timer Settings. */
    metaonly struct TimerSetting {
        Ptr baseAddr;   /*! specify the base address  */
        Int intNum;     /*! specify which interrupt vector */
        Int eventId;    /*! specify which event number to use */
        String name;    /*! specify the timer name */
    };

    /*! @_nodoc */
    @XmlDtd
    metaonly struct BasicView {
        Ptr         halTimerHandle;
        String      label;
        UInt        id;
        String      name;
        String      startMode;
        String      runMode;
        UInt        periodInCounts;
        UInt        periodInMicroSecs;
        UInt        intNum;
        Int         eventId;
        String      tickFxn[];
        UArg        arg;
        String      extFreq;
        String      hwiHandle;
    };

    /*! @_nodoc */
    metaonly struct DeviceView {
        UInt        id;
        String      device;
        String      devAddr;
        UInt        intNum;
        String      runMode;
        UInt        period;
        String      state;
    };

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      availMask;      /* available 32-bit timer halves */
        String      intFrequency[]; /* internal frequency in Hz */
    }

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
            [
                'Basic',
                {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewInitBasic',
                    structName: 'BasicView'
                }
            ],
            [
                'Device',
                {
                    type: ViewInfo.INSTANCE,
                    viewInitFxn: 'viewInitDevice',
                    structName: 'DeviceView'
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
     *  ======== A_invalidTimer ========
     *  Assert raised when timer id specified is not supported.
     */
    config xdc.runtime.Assert.Id A_invalidTimer  = {
        msg: "A_invalidTimer: Invalid Timer Id."
    };

    /*!
     *  Error raised when timer id specified is not supported.
     */
    config Error.Id E_invalidTimer =
        {msg: "E_invalidTimer: Invalid Timer Id %d"};

    /*!
     *  Error raised when timer requested is in use
     */
    config Error.Id E_notAvailable =
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
     *  ======== anyMask ========
     *  Available mask to be used when select = Timer_ANY
     */
    config UInt anyMask;

    /*!
     *  ======== continueOnSuspend ========
     *  Continue counting during emulation halt. Default is false.
     *
     *  When false, timer stops counting during emulation halt. When true,
     *  timer continues to count during emulation halt.
     */
    config Bool continueOnSuspend = false;

    /*!
     *  ======== intFreqs ========
     *  Default internal timer input clock frequency array.
     *
     *  This array can be used to change the input clock frequency
     *  for a particular timer.
     *
     *  For example, if it is required to change the input clock frequency
     *  for timer id 1 to 200MHz on a device that has 2 timers, the
     *  intFreqs[1] config param can be set to {hi:0, lo:200000000} in the
     *  config script.
     *
     *  @p(code)
     *  var Timer = xdc.useModule('ti.sysbios.timers.rti.Timer');
     *  Timer.intFreqs[1].lo = 200000000; // = CPU freq
     *  Timer.intFreqs[1].hi = 0;
     *  @p
     */
    metaonly config Types.FreqHz intFreqs[];

    /*!
     *  ======== timerSettings ========
     *  Global Control configuration for each physical timer.
     */
    metaonly config TimerSetting timerSettings[] = [];

    /*!
     *  @_nodoc
     *  RTI timer registers.
     */
    struct DeviceRegs {
        UInt32 RTIGCTRL;        /*! 0x00h */
        UInt32 RTITBCTRL;       /*! 0x04h */
        UInt32 RTICAPCTRL;      /*! 0x08h */
        UInt32 RTICOMPCTRL;     /*! 0x0Ch */
        UInt32 RTIFRC0;         /*! 0x10h */
        UInt32 RTIUC0;          /*! 0x14h */
        UInt32 RTICPUC0;        /*! 0x18h */
        UInt32 RESERVED0;       /*! 0x1Ch */
        UInt32 RTICAFRC0;       /*! 0x20h */
        UInt32 RTICAUC0;        /*! 0x24h */
        UInt32 RESERVED1;       /*! 0x28h */
        UInt32 RESERVED2;       /*! 0x2Ch */
        UInt32 RTIFRC1;         /*! 0x30h */
        UInt32 RTIUC1;          /*! 0x34h */
        UInt32 RTICPUC1;        /*! 0x38h */
        UInt32 RESERVED3;       /*! 0x3Ch */
        UInt32 RTICAFRC1;       /*! 0x40h */
        UInt32 RTICAUC1;        /*! 0x44h */
        UInt32 RESERVED4;       /*! 0x48h */
        UInt32 RESERVED5;       /*! 0x4Ch */
        UInt32 RTICOMP0;        /*! 0x50h */
        UInt32 RTIUDCP0;        /*! 0x54h */
        UInt32 RTICOMP1;        /*! 0x58h */
        UInt32 RTIUDCP1;        /*! 0x5Ch */
        UInt32 RTICOMP2;        /*! 0x60h */
        UInt32 RTIUDCP2;        /*! 0x64h */
        UInt32 RTICOMP3;        /*! 0x68h */
        UInt32 RTIUDCP3;        /*! 0x6Ch */
        UInt32 RTITBLCOMP;      /*! 0x70h */
        UInt32 RTITBLHCOMP;     /*! 0x74h */
        UInt32 RESERVED6;       /*! 0x78h */
        UInt32 RESERVED7;       /*! 0x7Ch */
        UInt32 RTISETINTENA;    /*! 0x80h */
        UInt32 RTICLEARINTENA;  /*! 0x84h */
        UInt32 RTIINTFLAG;      /*! 0x88h */
        UInt32 RESERVED8;       /*! 0x8Ch */
        UInt32 RTIDWDCTRL;      /*! 0x90h */
        UInt32 RTIDWDPRLD;      /*! 0x94h */
        UInt32 RTIWDSTATUS;     /*! 0x98h */
        UInt32 RTIWDKEY;        /*! 0x9Ch */
        UInt32 RTIDWDCNTR;      /*! 0xA0h */
        UInt32 RTIWWDRXNCTRL;   /*! 0xA4h */
        UInt32 RTIWWDSIZECTRL;  /*! 0xA8h */
        UInt32 RTIINTCLRENABLE; /*! 0xACh */
        UInt32 RTICOMP0CLR;     /*! 0xB0h */
        UInt32 RTICOMP1CLR;     /*! 0xB4h */
        UInt32 RTICOMP2CLR;     /*! 0xB8h */
        UInt32 RTICOMP3CLR;     /*! 0xBCh */
    };

    /*!
     *  ======== oneShotStub ========
     *  @_nodoc
     *  RTI timer does not support one shot mode. This stub stops timer
     *  and disables its interrupt.
     *
     *  @param(arg)     Timer Handle.
     */
    Void oneShotStub(UArg arg);

    /*!
     *  ======== periodicStub ========
     *  @_nodoc
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

    /*!
     *  ======== createHwi ========
     *  Controls whether the timer module creates a Hwi. Default is true.
     *
     *  If an application needs to create a Hwi for the timer, it is possible
     *  to indicate to the timer module to not create a Hwi by setting this
     *  param to false. This feature may be useful if the application needs to
     *  create a Hwi using the family specific Hwi module or on certain ARM
     *  targets create a Hwi of FIQ type to minimize latency.
     *
     *  If the application creates its own Hwi, it needs to select an interrupt
     *  number corresponding to the timer Id (see
     *  {@link ./doc-files/TimerTables.html Timer Mapping Tables}).
     *
     *  Here's an example for the Cortex-R4 target that creates a custom
     *  Hwi of FIQ type and sets "Timer.createHwi" param to false when
     *  creating a Timer object, in order to prevent the Timer module from
     *  creating a Hwi.
     *
     *  @p(code)
     *  *.cfg:
     *  xdc.useModule('ti.sysbios.timers.rti.Timer');
     *  xdc.useModule('ti.sysbios.family.arm.v7r.vim.Hwi');
     *
     *  *.c:
     *  #include <xdc/std.h>
     *  #include <xdc/runtime/Error.h>
     *
     *  #include <ti/sysbios/timers/rti/Timer.h>
     *  #include <ti/sysbios/family/arm/v7r/vim/Hwi.h>
     *  ...
     *
     *  Timer_Struct timer0;
     *  Timer_Handle handle0;
     *
     *  interrupt Void myIsr()
     *  {
     *      // Timer needs to be stopped only if run mode is One shot.
     *      // For periodic run mode, this function needs to only ack
     *      // the timer interrupt.
     *      Timer_stop(handle0);
     *      Timer_ackInterrupt(handle0);
     *      ...
     *  }
     *
     *  Int main(Int argc, char* argv[])
     *  {
     *      Timer_Params timerParams;
     *      Hwi_Params hwiParams;
     *      Error_Block eb;
     *
     *      Error_init(&eb);
     *
     *      // The interrupt number corresponding to a given Timer Id
     *      // can be determined from the Timer Mapping table. A link
     *      // to the table can be found in this document.
     *      Hwi_Params_init(&hwiParams);
     *      hwiParams.type = Hwi_Type_FIQ;
     *      Hwi_create(2, (Hwi_FuncPtr)(&myIsr), &hwiParams, &eb);
     *
     *      Timer_Params_init(&timerParams);
     *      timerParams.period = 60000;
     *      timerParams.runMode = Timer_RunMode_ONESHOT;
     *      timerParams.periodType = Timer_PeriodType_MICROSECS;
     *      timerParams.createHwi = FALSE;
     *      Timer_construct(&timer0, 0, NULL, &timerParams, &eb);
     *
     *      handle0 = Timer_handle(&timer0);
     *      ...
     *
     *      BIOS_start();
     *      return(0);
     *  }
     *  @p
     */
    config Bool createHwi = true;

    /*!
     *  ======== hwiParams ========
     *  Hwi Params for Hwi Object. Default is null.
     */
    config Hwi.Params *hwiParams = null;

    /*!
     *  ======== prescale ========
     *  Prescale factor. Default is 1 (0 is not recommended).
     *
     *  The Prescale factor can be used to achieve longer timer periods.
     *  With a prescale factor specified, the actual timer period is
     *  period * (prescale + 1).
     */
    config UInt8 prescale = 1;

    /*!
     *  ======== reconfig ========
     *  Used to modify static timer instances at runtime.
     *
     *  @param(timerParams)     timer Params
     *  @param(tickFxn)         functions that runs when timer expires.
     */
    Void reconfig(FuncPtr tickFxn, const Params *timerParams, Error.Block *eb);

    /*!
     *  ======== ackInterrupt ========
     *  clear the current timer interrupt flag
     */
    Void ackInterrupt();

internal:   /* not for client use */

    /*! Information about timer */
    struct TimerDevice {
        Int  intNum;
        Int  eventId;
        Ptr  baseAddr;
    };

    /*!
     *  ======== startupNeeded ========
     *  Flag used to prevent misc code from being brought in
     *  un-necessarily
     */
    config UInt startupNeeded = false;

    /*!
     *  ======== numTimerDevices ========
     *  The number of logical timers on a device.
     */
    config Int numTimerDevices;

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
    Bool checkOverflow(UInt32 a, UInt32 b);

    struct Instance_State {
        Bool                    staticInst;
        Int                     id;
        ITimer.RunMode          runMode;
        ITimer.StartMode        startMode;
        UInt                    prescale;
        UInt                    period;
        ITimer.PeriodType       periodType;
        UInt                    intNum;
        UArg                    arg;
        Hwi.FuncPtr             tickFxn;
        Types.FreqHz            extFreq;
        Hwi.Handle              hwi;
        Bool                    createHwi;
    }

    struct Module_State {
        UInt            availMask;      /* available peripherals */
        TimerDevice     device[];       /* timer device information */
        Types.FreqHz    intFreqs[];     /* internal frequency in Hz */
        Handle          handles[];      /* array of handles based on id */
    }
}

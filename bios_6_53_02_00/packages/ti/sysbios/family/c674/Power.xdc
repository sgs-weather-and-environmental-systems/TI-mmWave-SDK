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
 *  ======== Power.xdc ========
 *
 *
 */

package ti.sysbios.family.c674;

import xdc.rov.ViewInfo;

import ti.sysbios.knl.Queue;

/*!
 *  ======== Power ========
 *  Power management support for C6748 and OMAP-L138 devices.
 *
 *  The SYS/BIOS Power Manager, (Power module) provides APIs that allow you to
 *  reduce power consumption of C6748 and OMAP-L138 applications.  It provides
 *  the following core functionality:
 *
 *  Resource tracking.  You can set and release program dependencies upon power
 *  manageable resources.  For example, when a dependency is set on a UART, if
 *  it is the first dependency upon the UART, then Power will automatically
 *  enable the clock to the UART module.  And when the last dependency on the
 *  UART is released, Power will automatically disable the clock to the UART.
 *
 *  Voltage and frequency scaling.  You can dynamically change the voltage and
 *  frequency for the CPU domain, or the peripheral domain.  Since power
 *  consumption is linearly proportional to frequency and quadratically
 *  proportional to voltage, this can significantly reduce power consumption
 *  of the device.
 *
 *  CPU idling.  You can configure Power to automatically idle (i.e., clock
 *  gate) the CPU while waiting for the next interrupt, at which time new
 *  processing is required.  This is a "lightweight" sleep mechanism and has
 *  negligible CPU wakeup latency.
 *
 *  Activate sleep modes.  You can dynamically activate processor sleep modes
 *  that will perform clock gating and in some cases voltage reduction.  These
 *  sleep modes are "heavier weight" compared to idling, with longer wakeup
 *  latency, but provide significant savings during application standby times.
 *
 *  Coordinate scaling and sleep modes.  You can register application functions
 *  to be called upon specific power events, for example, before activating a
 *  particular sleep mode.  The Power module will call these functions at the
 *  appropriate times, allowing coordination between affected software
 *  components, and power saving actions of the Power module.
 *
 *  For further overview of the Power module, please see:
 *  @p(html)
 *  <a href=http://processors.wiki.ti.com/index.php/Power_Module_for_C6748_and_OMAP-L138><i>Power Module for C6748 and OMAP-L138</i></a>
 *  @p
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!-- -->
 *    <tr><td> {@link #changeSetpoint} </td><td>   N    </td><td>   Y*    </td><td>   Y </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #configure} </td><td>   Y    </td><td>   Y    </td><td>   Y </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getCapabilities}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getConstraintInfo}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getCurrentSetpoint}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getDependencyCount}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getNumSetpoints}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getSepointInfo}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getTransitionLatency}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #registerConstraint}  </td><td>   N    </td><td>   N    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #registerNotify}  </td><td>   N    </td><td>   N    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #releaseDependency}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setDependency}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #signalEvent}  </td><td>   Y*    </td><td>   Y*    </td><td>   Y   </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #sleepDSP}  </td><td>   N    </td><td>   Y*    </td><td>   Y   </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #unregisterConstraint}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #unregisterNotify}  </td><td>   Y    </td><td>   Y    </td><td>   Y   </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread </li>
 *         <li> <b>Task</b>: API is callable from a Task thread </li>
 *         <li> <b>Main</b>: API is callable from main() </li>
 *         <li> <b>Startup</b>: API is callable during any module startup </li>
 *         <li> <b>Y</b>: Yes </li>
 *         <li> <b>Y*</b>: Yes, but see API description for restrictions </li>
 *         <li> <b>N</b>: No </li>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */
@ModuleStartup            /* Initialize Power */
@Template("./Power.xdt")  /* Template for contitional initiatialization calls */

module Power inherits ti.sysbios.interfaces.IPower
{
    /*! Power attributes structure. */
    struct Attrs {
        Bool scaleVoltage;          /*! Scale voltage along with frequency */
        Bool waitForVoltageScale;   /*! Wait during down voltage ramp */
    };

    /*! Scaling configuration structure. */
    struct Config {
        Bool scaleVoltage;              /*! Scale voltage with frequency? */
        Bool waitForVoltageScale;       /*! Wait for down ramp? */
    };

    /*! Setpoint info structure. */
    struct SetpointInfo {
        UInt frequency;                 /*! Clock frequency */
        UInt voltage;                   /*! Voltage */
    };

    /*! Sleep attributes override structure. */
    struct SleepOverride {
        UInt sleepVoltage; /*! override sleep voltage (millivolts) for Power_SLEEP */
        UInt bypassedPLLs; /*! override PLLs to bypass for Power_SLEEP */
    };

    typedef UArg * ConstraintHandle; /*! Handle for a registered constraint */

    typedef Void * NotifyHandle; /*! Handle for a registered notification */

    /*! Idle function prototype */
    typedef Void (*FuncPtr)();

    /*!
     *  ======== Constraint ========
     *  Constraints that can be registered with Power
     */
    enum Constraint {
        DISALLOWED_CPU_SETPOINT_MASK = 1, /*! Disallowed CPU domain setpoints */
        DISALLOWED_PER_SETPOINT_MASK = 2, /*! Disallowed peripheral domain setpoints */
        DISALLOWEDSLEEPSTATE_MASK = 3     /*! Disallowed sleep states */
    };

    /*!
     *  ======== Domain ========
     *  Scaling domains
     */
    enum Domain {
        CPU = 0, /*! CPU domain */
        PER      /*! Peripheral domain */
    };

    /*!
     *  ======== Event ========
     *  Power Event enumerations
     */
    enum Event {
        GOINGTOSTANDBY = 0, /*! Going to Power_STANDBY */
        AWAKEFROMSTANDBY,   /*! Awake from Power_STANDBY */
        GOINGTOSLEEP,       /*! Going to Power_SLEEP */
        AWAKEFROMSLEEP,     /*! Awake from Power_SLEEP */
        GOINGTODEEPSLEEP,   /*! Going to Power_DEEPSLEEP */
        AWAKEFROMDEEPSLEEP, /*! Awake from Power_DEEPSLEEP */
        PENDING_CPU_SETPOINTCHANGE, /*! A CPU setpoint change is about to occur */
        PENDING_PER_SETPOINTCHANGE, /*! A peripheral setpoint change is about to occur */
        DONE_CPU_SETPOINTCHANGE, /*! A CPU setpoint change has just completed */
        DONE_PER_SETPOINTCHANGE, /*! A peripheral setpoint change has just completed */
        INVALIDEVENT
    };

    /*!
     *  ======== NUMEVENTS ========
     *  @_nodoc
     */
    metaonly const UInt NUMEVENTS = INVALIDEVENT;

    /*!
     *  ======== NotifyResponse ========
     *  Return values from a notify function.
     */
    enum NotifyResponse {
        NOTIFYDONE = 0,  /*! Client has finished processing the notification */
        NOTIFYNOTDONE, /*! Client needs to wait (delayed completion) to finish processing the notification */
        NOTIFYERROR /*! An error occurred while processing the notification */
    };

    const UInt EXTERNAL = 0x8; /*! Used to specify external controller wakeup source for Power_DEEPSLEEP */
    const UInt RTC_ALARM = 0x10; /*! Used to specify an RTC alarm wakeup source for Power_DEEPSLEEP */

    const UInt PLL0 = 0x1; /*! Used to specify bypass PLL0 during Power_SLEEP */
    const UInt PLL1 = 0x2; /*! Used to specify bypass PLL1 during Power_SLEEP */

    const UInt CVFSCALING = 0x8; /*! Bitmask for V/F scaling capability */
    const UInt CRESOURCETRACKING = 0x200; /*! Bitmask for resource tracking capability */

    /*!
     *  ======== Resource ========
     *  Resource enumerations.  Some of these are not applicable for C6746 and
     *  C6742 derivative devices.
     */
    enum Resource {
        RSRC_EDMA3_CC_0   = 0, /*! EDMA3_0 Channel Controller 0 */
        RSRC_EDMA3_TC_0   = 1, /*! EDMA3_0 Transfer Controller 0 */
        RSRC_EDMA3_TC_1   = 2, /*! EDMA3_0 Transfer Controller 1 */
        RSRC_EMIFA        = 3, /*! EMIFA */
        RSRC_SPI_0        = 4, /*! SPI0 */
        RSRC_MMCSD_0      = 5, /*! MMC/SD0 */
        RSRC_AINTC        = 6, /*! ARM Interrupt Controller */
        RSRC_RSVD1        = 7, /*! RESERVED */
        RSRC_UART_0       = 8, /*! UART0 */
        RSRC_RSVD2        = 9, /*! RESERVED */
        RSRC_EDMA3_CC_1   = 10, /*! EDMA3_1 Channel Controller 0 */
        RSRC_USB0         = 11, /*! USB0 */
        RSRC_USB1         = 12, /*! USB1 */
        RSRC_GPIO         = 13, /*! GPIO */
        RSRC_UHPI         = 14, /*! HPI */
        RSRC_EMAC         = 15, /*! EMAC */
        RSRC_DDR2         = 16, /*! DDR2/mDDR */
        RSRC_MCASP_0      = 17, /*! McASP0 */
        RSRC_SATA         = 18, /*! SATA */
        RSRC_VPIF         = 19, /*! VPIF */
        RSRC_SPI_1        = 20, /*! SPI1 */
        RSRC_I2C_1        = 21, /*! I2C1 */
        RSRC_UART_1       = 22, /*! UART1 */
        RSRC_UART_2       = 23, /*! UART2 */
        RSRC_MCBSP_0      = 24, /*! McBSP0 */
        RSRC_MCBSP_1      = 25, /*! McBSP1 */
        RSRC_LCDC         = 26, /*! LCDC */
        RSRC_EHRPWM       = 27, /*! eHRPWM0/1 */
        RSRC_MMCSD_1      = 28, /*! MMC/SD1 */
        RSRC_UPP          = 29, /*! uPP */
        RSRC_ECAP         = 30, /*! eCAP0/1/2 */
        RSRC_EDMA3_TC_2   = 31, /*! EDMA3_1 Transfer Controller 0 */
        RSRC_END          = 32
    };

    /*!
     *  ======== SleepCode ========
     *  Sleep modes
     */
    enum SleepCode {
        STANDBY = 0x1,
        SLEEP = 0x2,
        DEEPSLEEP = 0x4
    };

    /*!
     *  ======== Status ========
     *  Function return codes
     */
    enum Status {
        SOK = 0,
        EFAIL = 1,
        EINVALIDEVENT = 2,
        EINVALIDHANDLE = 3,
        EINVALIDPOINTER = 4,
        EINVALIDVALUE = 5,
        ENOTIMPLEMENTED = 6,
        ENOTSUPPORTED = 7,
        EOUTOFRANGE = 8,
        ETIMEOUT = 9,
        EBUSY = 10,
        EINITFAILURE = 11,
        ETOOMANYCALLS = 12
    };

    /*! Power Management Interface (PMI) control library options */
    enum pmiLib {
        pmiLib_evm6748,       /*! evm6748 with dedicated I2C control of PMIC */
        pmiLib_shared_evm6748,/*! evm6748 with shared I2C control of PMIC */
        pmiLib_lcdk,          /*! LCDK with no voltage scaling */
        pmiLib_null,          /*! evm6748 with no voltage scaling */
        pmiLib_user           /*! user will provide custom PMI library */
    };

    /*! Power Scaling Library (PSCL) configuration library options */
    enum psclLib {
        psclLib_evm6748,     /*! evm6748 with 300MHz device */
        psclLib_evm6748_372, /*! evm6748 with 372MHz device */
        psclLib_evm6748_408, /*! evm6748 with 408MHz device */
        psclLib_evm6748_456, /*! evm6748 with 456MHz device */
        psclLib_lcdk,        /*! LCDK with 456MHz device */
        psclLib_null,        /*! evm6748 with 300MHz device, no scaling */
        psclLib_user         /*! user will provide custom PSCL library */
    };

    /*!
     * On-chip memory region.  The memory region for placing Power's code and
     * data that must reside on-chip.  Default is IRAM.
     */
    metaonly config String onChipRegion = "IRAM";

    /*!
     *  ======== idle ========
     *  Idle the CPU during idle time?
     */
    override config Bool idle = false;

    /*!
     *  ======== idleCpu ========
     *  This configuration parameter has been deprecated. Use {@link #idle}
     *  instead.
     */
    /*! Idle the CPU during idle time?  Default is false. */
    metaonly config Bool idleCpu = false;

    /*! Idle function.  Default is Power_idleStopClock. */
    metaonly config FuncPtr idleFunc = Power.idleStopClock;

    /*! Enable resource tracking?  Default is false. */
    config Bool trackResources = false;

    /*! Enable voltage and frequency (V/F) scaling?  Default is false. */
    config Bool enableScaling = false;

    /*! Initial CPU domain setpoint.  Default is 2. */
    config UInt initialSetpointCPU = 2;

    /*! Initial peripheral (PER) domain setpoint.  Default is 0. */
    config UInt initialSetpointPER = 0;

    /*!
     *  Move to initial setpoints during program initialization?
     *  Default is false.
     */
    metaonly config Bool moveToSetpoints = false;

    /*! Scale voltage along with frequency?  Default is true. */
    metaonly config Bool scaleVoltage = true;

    /*! Wait while voltage is scaling downward?  Default is true. */
    metaonly config Bool waitVoltage = true;

    /*! Select the PMI control library */
    metaonly config pmiLib pmiControlLib = pmiLib_evm6748;

    /*! Select the PSCL configuration library */
    metaonly config psclLib psclConfigLib = psclLib_evm6748;

    /*!
     *  ======== changeSetpoint ========
     *  Initiate a change to the V/F setpoint of the CPU, or the peripheral
     *  domain.
     *
     *  Power_changeSetpoint() changes the voltage and frequency of a
     *  scalable domain.
     *
     *  The domain parameter indicates the relevant scaling domain. The
     *  domains that can be scaled vary by platform, and are enumerated as
     *  Power_Domain. For example, for the TMS320C6748, there are two
     *  scalable domains: the CPU domain (Power_CPU) and the peripheral
     *  domain (Power_PER).
     *
     *  The newSetpoint parameter is a numeric value that indexes into a table
     *  of frequency/voltage pairs, as defined by the underlying scaling
     *  configuration library.
     *
     *  The notifyTimeout parameter is the maximum amount of time (in system
     *  Clock ticks) to wait for registered notification functions (set by
     *  Power_registerNotify()) to respond to a delayed completion, before
     *  declaring failure and returning Power_ETIMEOUT.
     *
     *  For example, if notifyTimeout is set to 200, Power_changeSetpoint()
     *  waits up to 200 ticks (typically 200 milliseconds) before declaring
     *  that function has failed to respond. Power uses notifyTimeout for each
     *  type of notification. For example, if notification functions are
     *  registered for both before and after setpoint changes,
     *  Power_changeSetpoint() waits up to notifyTimeout on each type of
     *  notification.
     *
     *  All registered notification functions are called from the context of
     *  Power_changeSetpoint().
     *
     *  The application should treat return values of Power_ETIMEOUT or
     *  Power_EFAIL as critical system failures. These values indicate the
     *  notification client is taking too long or is unresponsive, and the
     *  system is in an unknown state.
     *
     *  Power_changeSetpoint() disables Swi and Task scheduling when it
     *  begins making a change. However, Hwis may run during the notification
     *  process. After the setpoint has been changed, Swi and Task scheduling
     *  are re-enabled, and a context switch occurs only if some other thread
     *  has since been made ready to run.
     *
     *  @param(domain)  The relevant scaling domain (Power_CPU or Power_PER)
     *
     *  @param(newSetpoint)  The new V/F setpoint to be scaled to
     *
     *  @param(notifyTimeout)  The maximum time (in Clock ticks) to wait for
     *                  client notifications to complete
     *
     *  @b(returns)     Power_SOK if the operation succeeded and the new
     *                  setpoint is in effect
     *
     *  @b(returns)     Power_EFAIL if a general failure occurred; the
     *                  requested transition did not occur
     *
     *  @b(returns)     Power_ENOTIMPLEMENTED if V/F scaling is not implemented
     *                  on this platform
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  a client registered a constraint with Power indicating
     *                  that it cannot support the requested setpoint
     *
     *  @b(returns)     Power_EOUTOFRANGE if the operation failed because
     *                  the domain or newSetpoint parameter is not a valid value
     *                  for the platform
     *
     *  @b(returns)     Power_ETIMEOUT if the operation failed because
     *                  a registered notification function did not complete its
     *                  processing within the specified notifyTimeout
     *
     *  @b(returns)     Power_EBUSY if the operation failed because the
     *                  operation cannot be performed at this time; Power is
     *                  busy processing a previous request
     *
     *  @b(returns)     Power_EINITFAILURE if there was a previous failure when
     *                  V/F scaling support was being initialized; V/F scaling
     *                  is unavailable
     *
     *  @a(constraints)
     *  Power_changeSetpoint() cannot be called from a Hwi or main()
     *
     *  Power_changeSetpoint() can be called from a Swi only if notifyTimeout
     *  is zero
     */
    Status changeSetpoint(Domain domain, UInt newSetpoint, UInt notifyTimeout);

    /*!
     *  ======== configure ========
     *  Set new configuration parameters for Power.
     *
     *  Power_configure() specifies new configuration properties for the Power
     *  module. It overrides those specified in the static configuration.
     *
     *  Configuration parameters are specified via a Power_Attrs structure.
     *  In this structure, 'scaleVoltage' indicates whether Power should scale
     *  voltages during setpoint changes, and when switching to sleep modes that
     *  support voltage reduction. It corresponds to the {@link #scaleVoltage}
     *  configuration property. If 'scaleVoltage' is TRUE, the voltage is
     *  scaled down if possible when going to a lower frequency or activating
     *  sleep modes. If 'scaleVoltage' is FALSE, the voltage is not scaled
     *  lower. The voltage is always scaled up if the new (destination)
     *  setpoint frequency is higher than that supported at the current voltage.
     *
     *  In the Power_attrs structure, the 'waitForVoltageScale' flag indicates
     *  whether Power should wait for a down-voltage transition to complete
     *  before returning from Power_changeSetpoint(). It corresponds to the
     *  {@link #waitVoltage} configuration property. (Such transition times can
     *  be long, and they typically depend upon power supply load.) Currently,
     *  it is recommended that this property always be TRUE. Note that the
     *  Power module always waits during up-voltage transitions; this is
     *  required to avoid overclocking the device.
     *
     *  @param(attrs)   An {@link #Attrs} structure defining new
     *                  configuration parameters
     *
     *  @b(returns)     Power_SOK if the configuration was changed
     *
     *  @b(returns)     Power_EINVALIDVALUE if the change failed because one of
     *                  the attributes is invalid
     */
    Status configure(Attrs attrs);

    /*!
     *  ======== getCapabilities ========
     *  Get info on Power's capabilities on the current platform.
     *
     *  The capsMask parameter should point to the location where
     *  Power_getCapabilities() should write a bitmask that defines the
     *  capabilities.
     *
     *  You can use the following constants to check for capabilities
     *  in the bitmask:
     *
     *    Power_CRESOURCETRACKING  -  Power supports dynamic resource tracking
     *
     *    Power_CVFSCALING  -  Power supports voltage and frequency scaling
     *
     *  @param(capsMask)  Location of a bitmask to be written with capabilities
     *                    flags
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  capsMask was NULL
     */
    Status getCapabilities(UInt * capsMask);

    /*!
     *  ======== getConstraintInfo ========
     *  Get info on the aggregate of constraints that have been registered with
     *  Power.
     *
     *  Power_getConstraintInfo() returns information about constraints that are
     *  currently registered with the Power module, via previous calls to
     *  Power_registerConstraint().
     *
     *  The type parameter identifies the type of constraint being queried. The
     *  constraint types vary by platform, and are enumerated as
     *  Power_Constraint.  Currently the following are supported:
     *
     *    Power_DISALLOWEDSLEEPSTATE_MASK  -   Sleep states that should
     *        not be activated.
     *
     *    Power_DISALLOWED_CPU_SETPOINT_MASK  -  CPU setpoints that should not
     *        be activated.
     *
     *    Power_DISALLOWED_PER_SETPOINT_MASK  -  Peripheral setpoints that
     *        should not be activated.
     *
     *  Power_getContraintInfo() returns a value that is the aggregate of all
     *  constraints that are currently registered. For example, if one Power
     *  client disallowed the sleep state Power_SLEEP, and a different client
     *  disallowed the sleep state Power_DEEPSLEEP, the returned value will
     *  be (Power_SLEEP | Power_DEEPSLEEP).
     *
     *  @param(type)  Type of constraint
     *
     *  @param(value)  Location to be written with aggregate of constraints
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because
     *                  type does not correspond to a supported constraint type
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the value parameter was NULL
     *
     */
    Status getConstraintInfo(Constraint type, UArg *value);

    /*!
     *  ======== getCurrentSetpoint ========
     *  Get the current setpoint in effect.
     *
     *  Power_getCurrentSetpoint() returns the V/F scaling setpoint currently in
     *  use for the specified scaling domain.
     *
     *  The domain parameter indicates the relevant scaling domain. The
     *  domains that can be scaled vary by platform, and are enumerated as
     *  Power_Domain.
     *
     *  The setpoint parameter should point to the location where
     *  Power_getCurrentSetpoint() should write the current setpoint.
     *
     *  @param(domain)  The scaling domain being queried (Power_CPU or
     *                  Power_PER)
     *
     *  @param(setpoint)  Location to write the current setpoint
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the setpoint parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because the
     *                  domain parameter was invalid
     *
     *  @b(returns)     Power_EINITFAILURE if there was a previous failure when
     *                  V/F scaling support was being initialized; V/F scaling
     *                  is unavailable
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  V/F scaling support is not enabled
     *
     *  @a(constraints)
     *  If a call to Power_getCurrentSetpoint() is made during a change to the
     *  current setpoint, the value Power_getCurrentSetpoint() returns may
     *  be the old setpoint and not the new setpoint
     *
     */
    Status getCurrentSetpoint(Domain domain, UInt * setpoint);

    /*!
     *  ======== getDependencyCount ========
     *  Get the count of dependencies that are currently declared on a resource.
     *
     *  Power_getDependencyCount() returns the number of dependencies that
     *  are currently declared on a resource. Normally this corresponds to the
     *  number of times Power_setDependency() has been called for the
     *  resource, minus the number of times Power_releaseDependency() has
     *  been called for the same resource.
     *
     *  On some platforms, early boot code may enable individual resources
     *  before Power initializes. To ensure proper state synchronization in
     *  this case, Power queries individual resource states as the Power module
     *  initializes. So, it is possible for the returned "count" value to be 1,
     *  even if Power_setDependency() has not been called by the application.
     *
     *  Resources are enumerated as Power_Resource.
     *
     *  @param(resourceID)  The resource identifier
     *
     *  @param(count)  Location to write the resource's dependency count
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the count parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because
     *                  Power cannot control this resource
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  resource tracking is not enabled
     *
     *  @b(returns)     Power_EOUTOFRANGE if the specified resourceID is
     *                  outside the range of valid resource IDs
     */
    Status getDependencyCount(Resource resourceID, UInt * count);

    /*!
     *  ======== getNumSetpoints ========
     *  Get the number of setpoints supported on the platform.
     *
     *  Power_getNumSetpoints() returns the number of setpoints supported for
     *  a specified domain.
     *
     *  The domain parameter indicates the relevant scaling domain. The
     *  domains that can be scaled vary by platform, and are enumerated as
     *  Power_Domain.
     *
     *  @param(domain)  The scaling domain being queried (Power_CPU or
     *                  Power_PER)
     *
     *  @param(numberSetpoints)  Location to write the number of supported
     *                  setpoints
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the numberSetpoints parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because the
     *                  domain parameter was invalid
     *
     *  @b(returns)     Power_EINITFAILURE if there was a previous failure when
     *                  V/F scaling support was being initialized; V/F scaling
     *                  is unavailable
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  V/F scaling support is not enabled
     *
     */
    Status getNumSetpoints(Domain domain, UInt * numberSetpoints);

    /*!
     *  ======== getSetpointInfo ========
     *  Get the frequency and core voltage for a setpoint.
     *
     *  Power_getSetpointInfo() returns the frequency and voltage for a given
     *  setpoint.
     *
     *  The domain parameter indicates the relevant scaling domain for which
     *  the setpoint information is to be retrieved. The domains that can be
     *  scaled vary by platform, and are enumerated as Power_Domain.
     *
     *  @param(domain)  The scaling domain being queried (Power_CPU or
     *                  Power_PER)
     *
     *  @param(setpoint)  The setpoint to be queried
     *
     *  @param(frequency)  Location to write the frequency (in kHz) of the
     *                  specified setpoint
     *
     *  @param(voltage)  Location to write the voltage (in millivolts) of the
     *                  specified setpoint
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the frequency or votage parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because the
     *                  domain parameter was invalid
     *
     *  @b(returns)     Power_EINITFAILURE if there was a previous failure when
     *                  V/F scaling support was being initialized; V/F scaling
     *                  is unavailable
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  V/F scaling support is not enabled
     *
     *  @b(returns)     Power_EOUTOFRANGE if the operation failed because
     *                  the setpoint parameter is out of range of valid
     *                  setpoints for the specified domain
     */
    Status getSetpointInfo(Domain domain, UInt setpoint, UInt *frequency,
        UInt *voltage);

    /*!
     *  ======== getTransitionLatency ========
     *  Get the latency to scale from one setpoint to another setpoint.
     *
     *  Power_getTransitionLatency() retrieves the latencies (times required)
     *  in microseconds to scale from a specific setpoint to another specific
     *  setpoint.
     *
     *  The domain parameter should indicate the relevant scaling domain.
     *  The initialSetpoint parameter should specify the setpoint from which the
     *  transition would start. The finalSetpoint parameter should specify the
     *  setpoint at which the transition would end.
     *
     *  The frequencyLatency parameter should point to the location where
     *  Power_getTransitionLatency() should write the time required to change
     *  the frequency from that of the initialSetpoint to that of the
     *  finalSetpoint, in microseconds.
     *
     *  Similarly, the voltageLatency should point to the location where
     *  Power_getTransitionLatency() should write the time required to change
     *  the voltage from that of the initialSetpoint to that of the
     *  finalSetpoint, in microseconds.
     *
     *  When frequency and voltage are scaled together, the total latency is the
     *  sum of the frequency scaling latency and the voltage scaling latency.
     *
     *  Note that the time required to change a setpoint may not be
     *  deterministic (depending upon the hardware characteristics, the
     *  underlying software implementation, and the specific V/F swing), but it
     *  is bounded by the value returned by Power_getTransitionLatency().
     *
     *  @param(domain)  The relevant scaling domain (Power_CPU or Power_PER)
     *
     *  @param(initialSetpoint)  The setpoint to be scaled from
     *
     *  @param(finalSetpoint)  The setpoint to be scaled to
     *
     *  @param(frequencyLatency)  Location to write the frequency transition
     *                  latency (in microseconds) from that of the
     *                  initialSetpoint to that of the finalSetpoint
     *
     *  @param(voltageLatency)  Location to write the voltage transition
     *                  latency (in microseconds) from that of the
     *                  initialSetpoint to that of the finalSetpoint
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EFAIL if a general failure occurred
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the frequencyLatency or votageLatency parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because the
     *                  domain, initialSetpoint, or finalSetpoint value was
     *                  invalid
     *
     *  @b(returns)     Power_EINITFAILURE if there was a previous failure when
     *                  V/F scaling support was being initialized; V/F scaling
     *                  is unavailable
     *
     *  @b(returns)     Power_ENOTIMPLEMENTED if the operation failed because
     *                  V/F scaling is not supported
     */
    Status getTransitionLatency(Domain domain, UInt initialSetpoint,
        UInt finalSetpoint, UInt *frequencyLatency, UInt *voltageLatency);

    /*!
     *  ======== registerConstraint ========
     *  Register an operational constraint with Power.
     *
     *  Before taking certain actions, Power checks to see if the requested
     *  action would conflict with a client-registered constraint. If the
     *  action does conflict, Power will not proceed with the request.
     *  Power_registerConstraint() is the API that allows clients to register
     *  their constraints with Power.
     *
     *  The type parameter identifies the type of constraint being registered.
     *  The constraint types vary by platform, and are enumerated as
     *  Power_Constraint.  Currently the following are supported:
     *
     *    Power_DISALLOWEDSLEEPSTATE_MASK  -   Sleep states that should
     *        not be activated.
     *
     *    Power_DISALLOWED_CPU_SETPOINT_MASK  -  CPU setpoints that should not
     *        be activated.
     *
     *    Power_DISALLOWED_PER_SETPOINT_MASK  -  Peripheral setpoints that
     *        should not be activated.
     *
     *  The Power_DISALLOWEDSLEEPSTATE_MASK is a bitmask of the
     *  sleep states that can be activated via Power_sleepDSP(). For the
     *  TMS320C6748, the states are identified via a combination of the
     *  following bitmask values: Power_STANDBY, Power_SLEEP, and
     *  Power_DEEPSLEEP.
     *
     *  The Power_DISALLOWED_CPU_SETPOINT_MASK is a bitmask of
     *  setpoints that the CPU should not be transitioned to. For example, if a
     *  driver won't operate properly below a specific CPU performance level, it
     *  can register the lower performance levels via the setpoint mask.
     *  Setpoint IDs are zero-based, with a lower index representing a lower
     *  performance level. They are represented right-justified in the bitmask.
     *
     *  For example, to disallow setpoint "0", the mask is "0x1". To disallow
     *  the lowest five setpoints the mask value is "0x1F".
     *
     *  The Power_DISALLOWED_PER_SETPOINT_MASK performs the
     *  same function as the Power_DISALLOWED_CPU_SETPOINT_MASK,
     *  but corresponds to scaling of the peripheral domain. The bitmask follows
     *  the same format; setpoints are zero-based and have right-justified bit
     *  positions, starting with "0x1".
     *
     *  It is important that clients call Power_unregisterConstraint() when the
     *  operational constraint no longer exists. Otherwise, Power may be left
     *  unnecessarily restricted from activating power savings.
     *
     *  @param(type)  Type of constraint
     *
     *  @param(value)  A constraint type-specific mask
     *
     *  @param(handle)  Location to write the resulting constraint handle
     *                  (which is used for unregistering the constraint)
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EFAIL if the registration failed due to a memory
     *                  allocation failure
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because
     *                  type does not correspond to a supported constraint type
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the handle parameter was NULL
     *
     *  @a(constraints)
     *  Power_registerConstraint() cannot be called from a Swi or Hwi, because
     *  it allocates memory, and this may incur a context switch.
     *
     */
    Status registerConstraint(Constraint type, UArg value,
        ConstraintHandle *handle);

    /*!
     *  ======== registerNotify ========
     *  Register a function to be called on a specific power event.
     *
     *  Power_registerNotify() registers a function to be called when a specific
     *  Power event occurs. Registrations and the corresponding notifications
     *  are processed in first-in-first-out (FIFO) order. The function
     *  registered must behave as described below.
     *
     *  The eventType parameter identifies the type of power event for which the
     *  notify function being registered is to be called. The eventType
     *  parameter can vary by platform, and is enumerated as Power_Event. For
     *  example, on the TMS320C6748 this parameter may have one of the
     *  following values:
     *
     *    Power_PENDING_CPU_SETPOINTCHANGE  -  The CPU domain V/F setpoint is
     *        about to change
     *
     *    Power_DONE_CPU_SETPOINTCHANGE  -  The pending CPU setpoint change has
     *        now completed
     *
     *    Power_PENDING_PER_SETPOINTCHANGE  -  The peripheral domain V/F
     *        setpoint is about to change
     *
     *    Power_DONE_PER_SETPOINTCHANGE  -  The pending peripheral setpoint
     *        change has now completed
     *
     *    Power_GOINGTOSTANDBY  -   The DSP is going to STANDBY state
     *
     *    Power_AWAKEFROMSTANDBY  -   The DSP has awoken from STANDBY
     *
     *    Power_GOINGTOSLEEP  -   The DSP is going to SLEEP state
     *
     *    Power_AWAKEFROMSLEEP  -   The DSP has awoken from SLEEP
     *
     *    Power_GOINGTODEEPSLEEP  -   The DSP is going to DEEPSLEEP state
     *
     *    Power_AWAKEFROMDEEPSLEEP  -   The DSP has awoken from DEEPSLEEP
     *
     *
     *  The eventMask parameter is an event-specific mask. Currently the
     *  eventMask is not used by Power.
     *
     *  The notifyFxn parameter specifies the function to call when the
     *  specified Power event occurs. The notifyFxn must implement the
     *  following signature:
     *
     *  status = notifyFxn(eventType, eventArg1, eventArg2, clientArg);
     *
     *  Where: eventType (of type Power_Event) is the type of Power event of
     *  the notification; eventArg1 (of type UArg) is an event-specific
     *  argument; eventArg2 (of type UArg) is a second event-specific argument;
     *  and clientArg (of type UArg) is an abitrary argument.
     *
     *  Currently, eventArg1 and eventArg2 are used only for V/F scaling events:
     *  for a 'pending' setpoint change, eventArg1 holds the current setpoint,
     *  and eventArg2 holds the pending setpoint; for a 'done' sepoint change
     *  event, eventArg1 holds the previous setpoint, and eventArg2 holds the
     *  new setpoint.
     *
     *  The notification function must return one of the following constants
     *  as a status value of type Power_NotifyResponse: Power_NOTIFYDONE if the
     *  the client processed the notification function successfully;
     *  Power_NOTIFYNOTDONE if the client must wait for interrupt processing
     *  to occur before it can proceed (the client must later call the
     *  delayedCompletionFxn specified when this function was registered); or
     *  Power_NOTIFYERROR if the notification cannot be processed (either an
     *  internal client error occurred or the client was notified of an event
     *  it could not process).
     *
     *  The clientArg parameter is an arbitrary argument to be passed to the
     *  client upon notification. This argument may allow one notify function
     *  to be used by multiple instances of a driver (that is, the clientArg
     *  can be used to identify the instance of the driver that is being
     *  notified).
     *
     *  For Power_regsiterNotify(), notifyHandle should point to the location
     *  where Power_registerNotify() should write a notification handle. If the
     *  application later needs to unregister the notification function, the
     *  application should pass this handle to Power_unregisterNotify().
     *
     *  The delayedCompletionFxn is a pointer to a function provided by the
     *  Power module to the client at registration time. If a client cannot act
     *  immediately upon notification, its notify function should return
     *  Power_NOTIFYNOTDONE. Later, when the action is complete, the
     *  client should call the delayedCompletionFxn to signal Power that it has
     *  finished. The delayedCompletionFxn is a void function, taking no
     *  arguments, and having no return value. If a client can and does act
     *  immediately on the notification, it should return Power_NOTIFYDONE in
     *  response to notification, and should not call the delayedCompletionFxn.
     *
     *  For example, if a DMA driver is to prepare for a setpoint change, it may
     *  need to wait for the current DMA transfer to complete. When the driver's
     *  DMA completes (for example, on the next hardware interrupt), it calls
     *  the delayedCompletionFxn function provided when it registered for
     *  notification. This completion function tells the Power module that the
     *  driver is finished. Meanwhile, the Power module was able to continue
     *  notifying other clients, and was waiting for all clients to signal
     *  completion.
     *
     *  @param(eventType)  The type of Power event to be notified of
     *
     *  @param(eventMask)  A Power event type-specific mask
     *
     *  @param(notifyFxn)  The function Power should call to notify the client
     *                     of the event
     *
     *  @param(clientArg)  A client-defined argument to pass with the notifyFxn
     *                     call
     *
     *  @param(notifyHandle)  Location to write the resulting notification
     *                  handle (which is used for unregistering for the event)
     *
     *  @param(delayedCompletionFxn) Location for the pointer to the delayed
     *                     completion function the client should call if it
     *                     requires more time to process an event (the client
     *                     calls this function once its processing is complete)
     *
     *  @b(returns)     Power_SOK if the registration succeeded
     *
     *  @b(returns)     Power_EFAIL if the registration failed due to a memory
     *                  allocation failure
     *
     *  @b(returns)     Power_EINVALIDPOINTER if the operation failed because
     *                  the notifyFxn, notifyHandle, or delayedCompletionFxn
     *                  parameter was NULL
     *
     *  @b(returns)     Power_EINVALIDEVENT if the operation failed because
     *                  eventType is invalid
     *
     *  @a(constraints)
     *  Power_registerNotify() cannot be called from a Swi or Hwi, because
     *  it allocates memory, and this may incur a context switch.
     */
    Status registerNotify(Event eventType, UInt eventMask, Fxn notifyFxn,
        UArg clientArg, NotifyHandle * notifyHandle, Fxn *delayedCompletionFxn);

    /*!
     *  ======== releaseDependency ========
     *  Release a dependency that has been previously declared by
     *  Power_setDependency.
     *
     *  This function is the companion to Power_setDependency().  It releases
     *  a resource dependency that was previously set. Resources are enumerated
     *  by Power_Resource.
     *
     *  Power_ETOOMANYCALLS is returned if you call Power_releaseDependency()
     *  when there are no dependencies currently declared for the specified
     *  resource (either because all have been released or because none were
     *  set).
     *
     *  @param(resourceID)  The resource identifier
     *
     *  @b(returns)     Power_SOK if the operation succeeded and the dependency
     *                  has been released
     *
     *  @b(returns)     Power_EFAIL if the operation failed while attempting
     *                  to release the resource
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because
     *                  Power cannot control this resource
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  resource tracking is not enabled
     *
     *  @b(returns)     Power_EOUTOFRANGE if the specified resourceID is
     *                  outside the range of valid resource IDs
     *
     *  @b(returns)     Power_ETOOMANYCALLS if a dependency was not previously
     *                  set for the resource, and was therefore not released
     */
    Status releaseDependency(Resource resourceID);

    /*!
     *  ======== setDependency ========
     *  Declare a dependency upon a power-manageable resource.
     *
     *  Power_setDependency() declares a dependency upon a resource.  Resources
     *  are enumerated by Power_Resource.
     *
     *  If the resource had been inactive, it will be activated during this
     *  function call.
     *
     *  This function is the companion to Power_releaseDependency().
     *
     *  @param(resourceID)  The resource identifier
     *
     *  @b(returns)     Power_SOK if the operation succeeded and the dependency
     *                  has been set
     *
     *  @b(returns)     Power_EFAIL if the operation failed while attempting
     *                  to activate the resource
     *
     *  @b(returns)     Power_EINVALIDVALUE if the operation failed because
     *                  Power cannot control this resource
     *
     *  @b(returns)     Power_ENOTSUPPORTED if the operation failed because
     *                  resource tracking is not enabled
     *
     *  @b(returns)     Power_EOUTOFRANGE if the specified resourceID is
     *                  outside the range of valid resource IDs
     */
    Status setDependency(Resource resourceID);

    /*!
     *  ======== signalEvent ========
     *  Signal a Power event to registered clients.
     *
     *  Power_signalEvent() provides a mechanism for an application to signal
     *  Power events. Power_signalEvent() only signals the event occurrence; it
     *  does not implement the actual processing associated with the Power
     *  event.
     *
     *  For example, on a platform where V/F scaling is accomplished on a
     *  separate processor, Power_signalEvent() can be called by the DSP
     *  application before the scaling to notify registered clients on this
     *  processor of the pending setpoint change event. Similarly, after the
     *  scaling, Power_signalEvent() can be called to signal the done setpoint
     *  change event. Here Power is not orchestrating the change to the
     *  V/F setpoint, but its registration, notification, and signaling
     *  capabilities allow synchronization between scaling by the other
     *  processor and the affected software on this processor.
     *
     *  The parameters eventArg1 and eventArg2 should correspond to the type
     *  of event being signaled.  For example, for a pending setpoint
     *  change event, the current and pending setpoints should be specified as
     *  eventArg1 and eventArg2.
     *
     *  The notifyTimeout parameter is the maximum amount of time (in system
     *  Clock ticks) to wait for all registered notification functions (set by
     *  Power_registerNotify()) to respond to a delayed completion, before
     *  declaring failure and returning Power_ETIMEOUT.
     *
     *  Power_signalEvent() is intended only for signaling power events that are
     *  outside the full control of the Power implementation on the current
     *  processor. It can be used for V/F scaling notification as described
     *  avove when Power does not implement the actual scaling. For events where
     *  Power does orchestrate the processing, for example, on platforms
     *  where Power performs the actual V/F scaling, or activates a processor
     *  sleep mode, Power handles the notifications automatically, and
     *  Power_signalEvent() must not be used for these events. In other words,
     *  Power_signalEvent() only validates that the indicated eventType is
     *  within the range of valid events for the platform; it does not validate
     *  whether it makes sense for the application to trigger the signaling of
     *  the indicated event, and it does not implement the actual power
     *  transition indicated by the event.
     *
     *  @param(eventType)  The Power event to be signaled
     *
     *  @param(eventArg1)  The event-specific first argument
     *
     *  @param(eventArg2)  The event-specific second argument
     *
     *  @param(notifyTimeout)  The maximum time (in Clock ticks) to wait for
     *                  client notifications to complete
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EFAIL if a notification failure occurred
     *
     *  @b(returns)     Power_EINVALIDEVENT if the operation failed because
     *                  eventType is invalid
     *
     *  @b(returns)     Power_ETIMEOUT if the operation failed because
     *                  a registered notification client did not complete its
     *                  processing within the specified notifyTimeout
     *
     *  @a(constraints)
     *  Power_signalEvent can be called from a Hwi or Swi only if notifyTimeout
     *  is zero
     */
    Status signalEvent(Event eventType, UArg eventArg1, UArg eventArg2,
        UInt notifyTimeout);

    /*!
     *  ======== sleepDSP ========
     *  Put the DSP into a sleep state.
     *
     *  Power_sleepDSP() transitions the DSP to a new sleep state.  A successful
     *  call to Power_sleepDSP() returns when the DSP has awoken from the
     *  specified sleep state.
     *
     *  The sleepCode parameter indicates the new sleep state for the DSP. The
     *  sleep states supported by Power usually vary by device.  For example,
     *  the following constants may be used to activate sleep states on the
     *  TMS320C6748:
     *
     *    Power_STANDBY  -  The GEM is put into a power-saving standby mode,
     *    with its clock turned off at the GEM boundary. This mode has a low
     *    latency for wakeup.
     *
     *    Power_SLEEP  -  In addition to putting the GEM into standby, the core
     *    voltage is reduced, and the PLLs are slowed down or bypassed.
     *
     *    Power_DEEPSLEEP  -  In addition to the actions for Power_SLEEP, the
     *    GEM clock is gated up-stream at the power sleep controller, memories
     *    are put into retention, and PLLs are powered down.
     *
     *  The sleepArg parameter is a sleepCode-specific argument. For example,
     *  for the TMS320C6748, this parameter is not used for Power_STANDBY,
     *  but is used for Power_SLEEP and Power_DEEPSLEEP (see below).
     *
     *  For Power_SLEEP: the sleepArg can be used to override Power's
     *  default behavior. If sleepArg is NULL, then Power reduces the core
     *  voltage to 1.0 volts during sleep, and bypasses both PLLs. If sleepArg
     *  is non-NULL, it is interpreted as a pointer to a {@link #SleepOverride}
     *  structure. In this structure, the sleepVoltage is in millivolts, and
     *  must correspond to a voltage level defined by the scaling configuration
     *  library. The bypassedPLLs value is treated as a bitmask to indicate
     *  which PLLs get bypassed during sleep: Power_PLL0 and/or Power_PLL1.
     *  This override mechanism can be used to ensure operation within the
     *  TMS320C6748 device constraints. For example, if the minimum supported
     *  voltage when DDR2 is used is 1.1 volts, and no DDR2 accesses can be
     *  made when PLL1 is bypassed. These constraints could be violated in some
     *  use cases, for example, when DDR2 memory is used, and there is a
     *  possibility that the wakeup interrupt service routine triggers some
     *  off-chip code or data accesses. The override mechanism allows the sleep
     *  voltage to be increased to 1.1 volts and PLL1 to not be bypassed during
     *  sleep.
     *
     *  For Power_DEEPSLEEP: sleepArg defines the DEEPSLEEP signal source that
     *  Power should configure for wakeup. This must be either Power_RTC_ALARM
     *  or Power_EXTERNAL.
     *
     *  The notifyTimeout parameter is the maximum amount of time (in system
     *  Clock ticks) to wait for registered notification functions (set by
     *  Power_registerNotify()) to respond to a delayed completion, before
     *  declaring failure and returning Power_ETIMEOUT. If the notifyTimeout
     *  parameter is zero, then all notification functions must return
     *  Power_NOTIFYDONE-they cannot request a delayed completion. If a
     *  notification function does not return, the system will hang. The
     *  notifyTimeout is not used to abandon a notification function; rather it
     *  indicates the amount of time Power_sleepDSP waits for all delayed
     *  completion requests to complete. The wait-loop is entered after all
     *  notification functions have been invoked.
     *
     *  The application should treat return values of Power_ETIMEOUT or
     *  Power_EFAIL as critical system failures. These values indicate the
     *  notification client is unresponsive, and the system is in an unknown
     *  state.
     *
     *  Due to the critical system nature of sleep commands, clients that
     *  register for sleep notification should make every effort to respond
     *  immediately to the sleep event.
     *
     *  @param(sleepCode)  The sleep state for the DSP
     *
     *  @param(sleepArg)  A sleepCode-specific argument structure (see below)
     *
     *  @param(notifyTimeout)  The maximum time (in Clock ticks) to wait for
     *                  client notifications to complete
     *
     *  @b(returns)     Power_SOK if the operation succeeded and a successful
     *                  sleep and wake occurred
     *
     *  @b(returns)     Power_EFAIL if a general failure occurred and the DSP
     *                  could not be put to sleep
     *
     *  @b(returns)     Power_ENOTIMPLEMENTED if the requested sleep state
     *                  is not implemented on this platform
     *
     *  @b(returns)     Power_ETIMEOUT if the operation failed because
     *                  a registered notification function did not complete its
     *                  (delayed completion) processing within the specified
     *                  notifyTimeout
     *
     *  @b(returns)     Power_EBUSY if the operation failed because Power
     *                  is still busy processing a previous request
     *
     *  @a(constraints)
     *  Power_sleepDSP() cannot be called from an Hwi
     *
     *  Power_sleepDSP() cannot be called from a program's main() function
     *
     *  Power_sleepDSP() can be called from a Swi only if notifyTimeout is 0
     *
     *  For Power_SLEEP: no DDR memory accesses (code, data, or stack) can
     *  occur while the PLL1 is bypassed, otherwise DDR corruption may occur
     *
     *  For Power_SLEEP: if DDR2 memories are used, then no DDR2 accesses can
     *  occur with a sleep voltage of 1.0 volts, otherwise DDR2 corruption
     *  may occur
     *
     *  For Power_DEEPSLEEP: this state must be invoked from an on-chip
     *  context; no code, data, or stack access can occur during
     *  Power_sleepDSP, otherwise DDR corruption may occur
     */
    Status sleepDSP(UInt sleepCode, UInt sleepArg, UInt notifyTimeout);

    /*!
     *  ======== unregisterConstraint ========
     *  Unregister a constraint that was previously registered with Power.
     *
     *  Power_unregisterConstraint() unregisters a constraint that was
     *  registered with Power_registerConstraint(). For example, when a device
     *  driver is closed, any constraints it registered with Power must be
     *  unregistered with this function, otherwise Power may be left
     *  unnecessarily restricted from activating power savings.
     *
     *  The handle parameter is the handle that was provided by
     *  Power_registerConstraint() when the constraint was registered.
     *
     *  @param(handle)  The handle to the previously-registered constraint
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDHANDLE if the operation failed because
     *                  handle is invalid
     *
     *  @a(constraints)
     *  This function cannot be called from a program's main() function.
     */
    Status unregisterConstraint(ConstraintHandle handle);

    /*!
     *  ======== unregisterNotify ========
     *  Unregister for a Power event notification.
     *
     *  Power_unregisterNotify() unregisters an event notification that was
     *  registered with Power_registerNotify(). For example, when an audio codec
     *  device is closed, and it no longer needs event notifications, it must
     *  unregister by calling this function.
     *
     *  The notifyHandle parameter is the handle that was provided by
     *  Power_registerNotify() when registering for an event notification.
     *
     *  @param(notifyHandle)  The event notification handle
     *
     *  @b(returns)     Power_SOK if the operation succeeded
     *
     *  @b(returns)     Power_EINVALIDHANDLE if the operation failed because
     *                  notifyHandle is invalid
     *
     *  @a(constraints)
     *  This function cannot be called from a program's main() function.
     */
    Status unregisterNotify(NotifyHandle notifyHandle);

    /*! @_nodoc */
    @XmlDtd
    metaonly struct ModuleView {
        UInt      setpointCPU;
        UInt      setpointPER;
        String    maskDisallowedSetpointsCPU;
        String    maskDisallowedSetpointsPER;
        String    maskDisallowedSleepModes;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
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

internal:

    config UInt CAPSMASK;

    /* Internal constants */
    const UInt CWAITFORV     = 0x20;
    const UInt CSCALEVWITHF  = 0x10;
    const UInt CMOVEINITSPS  = 0x1000;

    const UInt RELEASE = 0;
    const UInt SET = 1;
    const UInt QUERY = 2;

    enum SigType {
        SigType_INTERNAL = 0,
        SigType_EXTERNAL
    };

    /*
     *  ======== delayCompletion0 ========
     */
    Void delayCompletion0();

    /*
     *  ======== delayCompletion1 ========
     */
    Void delayCompletion1();

    /*
     *  ======== delayCompletion2 ========
     */
    Void delayCompletion2();

    /*
     *  ======== delayCompletion3 ========
     */
    Void delayCompletion3();

    /*
     *  ======== delayCompletion4 ========
     */
    Void delayCompletion4();

    /*
     *  ======== delayCompletion5 ========
     */
    Void delayCompletion5();

    /*
     *  ======== delayCompletion6 ========
     */
    Void delayCompletion6();

    /*
     *  ======== delayCompletion7 ========
     */
    Void delayCompletion7();

    /*
     *  ======== delayCompletion8 ========
     */
    Void delayCompletion8();

    /*
     *  ======== delayCompletion9 ========
     */
    Void delayCompletion9();

    /*
     *  ======== idleStopClock ========
     */
    Void idleStopClock();

    /*
     *  ======== init ========
     */
    Void init();

    /*
     *  ======== initRefCounts ========
     */
    Void initRefCounts();

    /*
     *  ======== notify ========
     */
    Status notify(Event eventType, UInt timeout, SigType sigType,
        UArg extArg1, UArg extArg2);

    /*
     *  ======== rebuildConstraint ========
     */
    Void rebuildConstraint(Constraint type);

    /*
     *  ======== updateConstraints ========
     */
    Void updateConstraints(Constraint type, UArg value);

    /*
     *  ======== Module_State ========
     */
    struct Module_State {
        UInt32 currentSetpointCPU;        /* current CPU domain setpoint */
        UInt32 currentSetpointPER;        /* current PER domain setpoint */
        UInt32 disallowedSetpointsCPU;    /* disallowed CPU domain setpoints */
        UInt32 disallowedSetpointsPER;    /* disallowed PER domain setpoints */
        UInt32 disallowedSleepModes;      /* disallowed CPU sleep modes */
        Queue.Object constraintsQ;        /* queue for registered constraints */
        Queue.Object notifyQ[];           /* event notification queues */
        UInt32 nextSP;                    /* destination CPU setpoint */
        UInt32 previousSP;                /* previous CPU setpoint */
        UInt32 nextSPPER;                 /* destination PER setpoint */
        UInt32 previousSPPER;             /* previous PER setpoint */
        UInt32 numSPCPU;                  /* number of CPU domain setpoints */
        UInt32 numSPPER;                  /* number of PER domain setpoints */
        Config currentConfig;             /* current configuration flags */
        Bool PSCLinitOK;                  /* PSCL initialized OK? */
        Bool busy;                        /* Power is busy with previous cmd? */
    }
}


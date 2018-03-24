/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
 * */

/*
 *  ======== Boot.xdc ========
 */

package ti.sysbios.family.arm.msp432.init;

import xdc.rov.ViewInfo;
import xdc.runtime.Assert;

/*!
 *  ======== Boot ========
 *  MSP432 device Boot Support.
 *
 *  The Boot module supports boot initialization for MSP432 devices.
 *  A special boot init function is created based on the configuration
 *  settings for this module.  This function is hooked into the
 *  xdc.runtime.Reset.fxns[] array and called very early at boot time.
 *
 *  The code to support the boot module is placed in a separate section
 *  named `".text:.bootCodeSection"` to allow placement of this section in
 *  the linker .cmd file if necessary. This section is a subsection of the
 *  `".text"` section so this code will be placed into the .text section unless
 *  explicitly placed, either through
 *  `{@link xdc.cfg.Program#sectMap Program.sectMap}` or through a linker
 *  command file.
 */
@Template("./Boot.xdt")
module Boot
{
   /*! clock speed setting */
    enum SpeedOpt {
        SpeedOpt_Low = 0,
        SpeedOpt_Medium = 1,
        SpeedOpt_High = 2
    };

    metaonly struct ModuleView {
        Bool    configureClocks;
        Bool    disableWatchdog;
    }

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

    /*!
     *  Clock configuration flag, default is true.
     *
     *  Set to false to disable clock configuration.
     *
     *  Clock configuration will setup the clock system (CS), VCORE, and
     *  Flash wait states appropriately, for one of three different device
     *  speed options, as selected by `{@link #speedSelect}`.
     *
     *  Clock configuration by the Boot module is only supported for
     *  MSP432P401x devices.  If an attempt is made to enable this feature for
     *  newer MSP432 devices a build error will be thrown.
     */
    metaonly config Bool configureClocks;

    /*!
     *  Clock speed selection, default is SpeedOpt_High.
     *
     *  This enumeration is used to select one of three different speed options
     *  that will be configured when `{@link #configureClocks}` is set to
     *  "true".
     *
     *   @p(code)
     *   SpeedOpt_High will configure:
     *      MCLK =   48MHz from DCO, HFXT, or external clock
     *      HSMCLK = 24MHz from DCO, HFXT, or external clock
     *      SMCLK =  12MHz from DCO, HFXT, or external clock
     *      ACLK =   32KHz from REFOCLK, LFXT, or external clock
     *      BCLK =   32KHz from REFOCLK, LFXT, or external clock
     *      VCORE = 1 (AM1_LDO mode)
     *      Flash BNK0 and BNK1 read wait states = 1
     *
     *   SpeedOpt_Medium will configure:
     *      MCLK =   24MHz from DCO, HFXT, or external clock
     *      HSMCLK =  6MHz from DCO, HFXT, or external clock
     *      SMCLK =   6MHz from DCO, HFXT, or external clock
     *      ACLK =   32KHz from REFOCLK, LFXT, or external clock
     *      BCLK =   32KHz from REFOCLK, LFXT, or external clock
     *      VCORE = 1 (AM1_LDO mode)
     *      Flash BNK0 and BNK1 read wait states = 1
     *
     *   SpeedOpt_Low will configure:
     *      MCLK =   12MHz from DCO, HFXT, or external clock
     *      HSMCLK =  3MHz from DCO, HFXT, or external clock
     *      SMCLK =   3MHz from DCO, HFXT, or external clock
     *      ACLK =   32KHz from REFOCLK, LFXT, or external clock
     *      BCLK =   32KHz from REFOCLK, LFXT, or external clock
     *      VCORE = 0 (AM0_LDO mode)
     *      Flash BNK0 and BNK1 read wait states = 0
     *   @p
     */
    metaonly config SpeedOpt speedSelect = SpeedOpt_High;

    /*!
     *  Enable LF crystal (LFXT) flag, default is false.
     *
     *  If an external 32768-Hz LF crystal is available, set this flag to
     *  true to startup and enable the LFXT, for use as the ACLK and BCLK
     *  clock sources.
     */
    config Bool enableLFXT = false;

    /*!
     *  LF crystal bypass flag, default is false.
     *
     *  As an alternative to LFXT-sourced clocks, an external 32768-Hz square
     *  wave can be applied to LFXIN, to be used as the ACLK and BCLK clock
     *  sources.
     *
     *  To enable this mode, set Boot.enableLFXT to true to enable the LFXT
     *  pins, and set Boot.bypassLFXT to true to disable the LFXT oscillator.
     */
    config Bool bypassLFXT = false;

    /*!
     *  Enable HF crystal (HFXT) flag, default is false.
     *
     *  If an external 48-MHz HFXT crystal is available, set this flag to
     *  true to startup and enable the HFXT, for use as the MCLK, HSMCLK, and
     *  SMCLK clock sources.
     */
    config Bool enableHFXT = false;

    /*!
     *  HF crystal bypass flag, default is false.
     *
     *  As an alternative to HFXT-sourced clocks, an external 48-MHz square
     *  wave can be applied to HFXIN, to be used as the MCLK, HSMCLK, and SMCLK
     *  clock sources.
     *
     *  To enable this bypass mode, set Boot.enableHFXT to true to enable the
     *  HFXT pins, and set Boot.bypassHFXT to true to disable the HFXT
     *  oscillator.
     */
    config Bool bypassHFXT = false;

    /*!
     *  Watchdog disable configuration flag, default is true.
     *
     *  Set to false to disable the disabling of the watchdog.
     */
    metaonly config Bool disableWatchdog = true;

    /*!
     *  @_nodoc
     *  ======== registerFreqListener ========
     *  Register a module to be notified whenever the frequency changes.
     *
     *  The registered module must have a function named 'fireFrequencyUpdate'
     *  which takes the new frequency as an argument.
     */
    function registerFreqListener();

internal:

    /*
     *  ======== init ========
     *  Generated entry point for clock and watchdog initialization.
     *
     *  Installed as a Startup.firstFxn.
     */
    Void init();

    /*!
     *  computed cpu frequency based on clock settings
     */
    metaonly config UInt computedCpuFrequency;

};

/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
 *  ======== Boot.xdc ========
 */

package ti.sysbios.family.arm.v7r.tms570;

import xdc.rov.ViewInfo;

/*!
 *  ======== Boot ========
 *  TMS570DCxx/RM57Dxx Boot Support.
 *
 *  //TODO Document this module
 *
 *  This Boot module supports boot initialization for the Cortex-R5F cores.
 *  A special boot init function is created based on the configuration
 *  settings for this module.  This function is hooked into the
 *  xdc.runtime.Reset.fxns[] array and called very early at boot time (prior
 *  to cinit processing).
 *
 *  The code to support the boot module is placed in a separate section
 *  named `".text:.bootCodeSection"` to allow placement of this section in
 *  the linker .cmd file if necessary. This section is a subsection of the
 *  `".text"` section so this code will be placed into the .text section unless
 *  explicitly placed, either through
 *  `{@link xdc.cfg.Program#sectMap Program.sectMap}` or through a linker
 *  command file.
 *
 *  @a(Clock configuration)
 *  Using this Boot module will automatically enable clock configuration. As
 *  part of the clock configuration, this module will setup the PLL based
 *  on the multiplier and divider values configured. Once the PLL is setup,
 *  the CPU clock source (GCLK) is changed from OSCIN to PLL1. In addition,
 *  this module also sets up the VCLK to equal GCLK/2 and selects the VCLK
 *  as the source for the RTI timer.
 *
 *  The formula for PLL output frequency is shown below. The multiplier
 *  and the various dividers can be configured to achieve different CPU
 *  frequencies. By default, this module will configure the PLL to run the
 *  CPU at 100MHz and the RTI Timer is clocked at 50MHz.
 *
 *  @p(code)
 *  Formula for PLL output frequency:
 *
 *          Foscin       NF
 *  Fpll = -------- X --------
 *            NR       OD x R
 *
 *  where, Foscin is frequency of PLL input clock from oscillator
 *         NR     is prescale divider for the input clock
 *         NF     is multiplier
 *         OD,R   is postscale divider
 *
 *  NF = PLLMUL + 1
 *  NR = REFCLKDIV + 1 (max 62)
 *  R  = PLLDIV + 1
 *  OD = ODPLL + 1
 *  @p
 *
 *  @a(Flash configuration)
 *  If flash configuration is enabled, this module will compute the number
 *  of flash wait states required at the current CPU frequency and will
 *  program the respective flash registers. This module also allows the
 *  user to enable/disable flash prefetching on flash ports A and B.
 */
@Template("./Boot.xdt")
@DirectCall
module Boot
{
    metaonly struct ModuleView {
        Bool configureClocks;
        Bool frequencyModulationEnable;
        UInt OSCIN;
        UInt PLLMUL;
        UInt PLLDIV;
        UInt REFCLKDIV;
        UInt ODPLL;
        UInt SPREADINGRATE;
        UInt MULMOD;
        UInt SPR_AMOUNT;
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
     *  ======== configureClocks ========
     *  Clock configuration flag, default is true.
     *
     *  Set to false to disable clock configuration.
     *
     *  Clock configuration will setup the CPU (and RTI) clock source,
     *  configure the PLL and system clock dividers.
     */
    config Bool configureClocks = true;

    /*!
     *  ======== OSCIN ========
     *  Input frequency to PLL, in MHz. Default is 16 MHz.
     *
     *  This is the frequency of the oscillator clock (OSCIN) input to the
     *  PLL.
     */
    metaonly config UInt OSCIN = 16;

    /*!
     *  ======== PLLMUL ========
     *  PLL Multiplication factor value (valid range from 0 to 255)
     *
     *  PLL Multiplier, NF = PLLMUL + 1
     */
    metaonly config UInt PLLMUL = 0x4A;

    /*!
     *  ======== REFCLKDIV ========
     *  PLL Reference clock divider value (valid range from 0 to 62)
     *
     *  PLL Prescale divider, NR = REFCLKDIV + 1 (max 62)
     */
    metaonly config UInt REFCLKDIV = 0x5;

    /*!
     *  ======== PLLDIV ========
     *  PLL Output clock divider (valid range from 0 to 31)
     *
     *  PLL postscale divider, R = PLLDIV + 1
     */
    metaonly config UInt PLLDIV = 0;

    /*!
     *  ======== ODPLL ========
     *  Internal PLL Output divider (valid range from 0 to 7)
     *
     *  PLL postscale divider, OD = ODPLL + 1
     */
    metaonly config UInt ODPLL = 1;

    /*!
     *  ======== SPREADINGRATE ========
     *  Spreading rate (valid range from 0 to 511)
     */
    metaonly config UInt SPREADINGRATE = 0x1FF;

    /*!
     *  ======== MULMOD ========
     *  Multiplier correction when modulation enabled (valid range
     *  from 0 to 511)
     */
    metaonly config UInt MULMOD = 0;

    /*!
     *  ======== SPR_AMOUNT ========
     *  Spreading amount (valid range from 0 to 511)
     */
    metaonly config UInt SPR_AMOUNT = 0;

    /*!
     *  ======== frequencyModulationEnable ========
     *  Enable frequency modulation. Default is false.
     */
    metaonly config Bool frequencyModulationEnable = false;

    /*!
     *  ======== configureFlashController ========
     *  Flash controller configuration flag, default is true.
     *
     *  Set to true to enable the configuration of the Flash controller
     *  wait states and prefetch mode.
     */
    metaonly config Bool configureFlashController = true;

    /*!
     *  ======== configureFlashWaitStates ========
     *  Flash controller wait states configuration flag, default is true.
     *
     *  Set to true to configure the Flash controller wait states.  The number
     *  of wait states is computed based upon the CPU frequency.
     */
    metaonly config Bool configureFlashWaitStates = true;

    /*!
     *  ======== flashPortAPrefetchEnable ========
     *  Flash controller port A prefetch enable flag, default is true.
     */
    metaonly config Bool flashPortAPrefetchEnable = true;

    /*!
     *  ======== flashPortBPrefetchEnable ========
     *  Flash controller port B prefetch enable flag, default is true.
     */
    metaonly config Bool flashPortBPrefetchEnable = true;

    /*!
     *  @_nodoc
     *  ======== getFrequency ========
     *  Gets the resulting CPU frequency (in Hz) given the Clock
     *  configuration parameters.
     *
     */
    UInt32 getFrequency();

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

    /* Used to display the computed CPU frequency value in the Grace page. */
    metaonly config String displayFrequency;

    /* The computed Flash wait states */
    metaonly config UInt flashWaitStates = 3;

};

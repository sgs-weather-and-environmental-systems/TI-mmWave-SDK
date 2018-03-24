/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *
 */

package ti.catalog.c2800.init;

import xdc.rov.ViewInfo;

/*!
 *  ======== Boot ========
 *  28x Boot Support.
 *
 *  The Boot module supports boot initialization for the 28x devices.
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
 */
@Template("./Boot.xdt")
@NoRuntime
module Boot
{
    /*! PLL type */
    metaonly enum Type {
        Type_280x,   /*! 280x (PLL configuration not supported for this type) */
        Type_281x,   /*! 281x (PLL configuration not supported for this type) */
        Type_282xx_283xx,         /*! 282xx or 283xx */
        Type_2802x_2803x_2806x,   /*! 2802x or 2803x or 2806x */
        Type_2834x                /*! 2834x */
    };

    metaonly struct ModuleView {
        Bool         disableWatchdog;
        Bool         configurePll;
        UInt         pllcrDIV;
        UInt         pllstsDIVSEL;
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
     *  Watchdog disable flag, default is false.
     *
     *  Set to true to disable the watchdog timer.
     */
    metaonly config Bool disableWatchdog = false;

    /*!
     *  PLL type.
     *
     *  The default will be determined by platform specification, or by the
     *  device ID for the generic (tms320c28) platform.
     */
    metaonly config Type pllType;

    /*!
     *  PLL configuration flag, default is false.
     *
     *  Set to true to configure the PLL.
     */
    metaonly config Bool configurePll = false;

    /*!
     *  OSCCLK input frequency to PLL, in MHz. Default is 10 MHz.
     *
     *  This is the frequency of the oscillator clock (OSCCLK) input to the
     *  PLL.  On some devices (e.g., TMS320C28346) this will correspond to the
     *  frequency of an external crystal or clock input.  On others
     *  (e.g., TMS320F28069) this will correspond to the frequency of an
     *  internal oscillator which is the default OSCCLK coming out of reset.
     */
    metaonly config UInt pllOSCCLK = 10;

    /*!
     *  PLLCR[DIV] clocking ratio value. Default is 10.
     *
     *  This is the actual value written to the DIV bits in
     *  the PLL Control Register (PLLCR)
     */
    metaonly config UInt pllcrDIV = 10;

    /*!
     *  PLLSTS[DIVSEL] divide select value. Default is 2.
     *
     *  This is the actual value written to the DIVSEL bits in
     *  the PLL Status Register (PLLSTS).
     *
     *  This configuration parameter applies for all of the
     *  enumerated PLL types, except for "Type_280x".
     */
    metaonly config UInt pllstsDIVSEL = 2;

    /*!
     *  Function to be called when Limp mode is detected.
     *
     *  This function is called when the Boot module is about to configure
     *  the PLL, but finds the device operating in Limp mode (i.e., the mode
     *  when a missing OSCCLK input has been detected).
     *
     *  If this function is not specified by the application, a default
     *  function will be used, which does an ESTOP0 and then enters an
     *  infinite loop.
     */
    metaonly config Fxn limpAbortFunction;

    /*!
     *  Boot from FLASH flag, default is false.
     *
     *  Set to true to enable booting from FLASH.  When set to true,
     *  a long branch (LB) to the c_int00 entry point will be placed at
     *  the BEGIN section address defined in the linker command file.
     */
    metaonly config Bool bootFromFlash = false;

    /*!
     * Configure the external memory interface (XINTF) for eZdsp283xx
     * boards.
     *
     * This external memory interface configuration is applicable only for
     * eZdsp283xx boards; it should not be enabled for any other boards.
     */
    metaonly config Bool enableEzdspXintfConfig = false;

    /*!
     * @_nodoc
     *  Default abort function to be called when PLL Limp mode is detected
     */
    metaonly Void defaultLimpAbort();

    /*!
     *  ======== getFrequency ========
     *  Gets the resulting output frequency (in Hz) given the PLL configuration
     *  parameters.
     */
    metaonly UInt32 getFrequency();

    /*!
     *  ======== registerFreqListener ========
     *  Register a module to be notified whenever the frequency changes.
     *
     *  The registered module must have a function named 'fireFrequencyUpdate'
     *  which takes the new frequency as an argument.
     */
    metaonly function registerFreqListener(listener);

internal:

    /* Used to display the computed frequency value in the Grace page. */
    metaonly config String displayFrequency;

    /* Used to indicate if using on a Concerto device */
    metaonly config Bool concertoDevice = false;

};

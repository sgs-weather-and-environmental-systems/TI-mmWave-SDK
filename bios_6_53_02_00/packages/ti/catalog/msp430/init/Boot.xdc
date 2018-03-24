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

package ti.catalog.msp430.init;

import xdc.rov.ViewInfo;

/*!
 *  ======== Boot ========
 *  Boot time initialization code manager
 *
 *  The Boot module supports boot initialization for the MSP430 devices.
 *  A special boot init function is created based on the configuration
 *  settings for this module.  This function is hooked into the
 *  `{@link xdc.runtime.Reset#fxns xdc.runtime.Reset.fxns[]}` array and
 *  is called very early at boot time (prior to C runtime initialization).
 *
 *  The code to support the boot module is placed in a separate section
 *  named `".text:bootCodeSection"` to allow placement of this section in
 *  the linker .cmd file if necessary. This section is a subsection of the
 *  `".text"` section so this code will be placed into the .text section
 *  unless explicitly placed, either through
 *  `{@link xdc.cfg.Program#sectMap Program.sectMap}` or through a linker
 *  command file.
 */
@Template("./Boot.xdt")
metaonly module Boot
{
    metaonly struct ModuleView {
        Bool         disableWatchdog;
        UInt         watchdogAddress;
        Bool         configureDCO;
        Bool         useLFXT;
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
     *  ======== disableWatchdog ========
     *  Watchdog disable flag
     *
     *  The default is `true`.  Set to `false` to not automatically disable the
     *  watchdog timer.
     */
    config Bool disableWatchdog = true;

    /*!
     *  ======== watchdogAddress ========
     *  Watchdog control register address
     *
     *  The default (0x15c) is set for MSP430F54xx and MSP430F552x devices.
     *  Change for other devices.
     */
    config UInt watchdogAddress = 0x15c;

    /*!
     *  ======== configureDCO ========
     *  Configure DCO flag
     *
     *  The default is `false`.  Set to `true` to initialize the DCO at boot.
     *
     */
    config Bool configureDCO = false;

    /*!
     *  ======== useLFXT ========
     *  Use a low frequency crystal (LFXT) reference
     *
     *  The default is `false`.  Set to `true` to indicate a 32768Hz low
     *  frequency crystal is present, and available for configuring the clock
     *  system.
     *
     *  This configuration parameter is utilized for only a subset of MSP430
     *  device types, and only when `configureDCO` is set to `true`.
     *
     *  For FR58xx/FR59xx devices: if `useLFXT` is set to `true`, an LFXT
     *  will be used as reference, for generating more accurate clock
     *  frequencies.  Othewise, and by default, MODOSC will be used as
     *  reference.
     *
     *  For all other MSP430 device types: at present, the `useLFXT` parameter
     *  will be ignored, and an internal reference will be used instead.
     */
    config Bool useLFXT = false;
};

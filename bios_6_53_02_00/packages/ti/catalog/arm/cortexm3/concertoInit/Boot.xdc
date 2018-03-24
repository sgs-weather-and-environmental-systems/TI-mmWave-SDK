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

package ti.catalog.arm.cortexm3.concertoInit;

import xdc.rov.ViewInfo;

/*!
 *  ======== Boot ========
 *  Concerto M3 Boot Support.
 *
 *  The Boot module supports boot initialization for the Concerto M3 core.
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
    /*! System PLL Fractional Multiplier (SPLLFMULT) value */
    metaonly enum FractMult {
        Fract_0  = 0x000,       /*! Fractional multiplier is 0 */
        Fract_25 = 0x100,       /*! Fractional multiplier is 0.25 */
        Fract_50 = 0x200,       /*! Fractional multiplier is 0.5 */
        Fract_75 = 0x300        /*! Fractional multiplier is 0.75 */
    }

    /*! System Clock Divider (SYSDIVSEL) value */
    metaonly enum SysDiv {
        Div_1 = 0x0,            /*! Divide by 1 */
        Div_2 = 0x1,            /*! Divide by 2 */
        Div_4 = 0x2,            /*! Divide by 4 */
        Div_8 = 0x3             /*! Divide by 8 */
    };

    /*! M3 Subsystem Clock Divider (M3SSDIVSEL) value */
    metaonly enum M3Div {
        M3Div_1 = 0x0,          /*! Divide by 1 */
        M3Div_2 = 0x1,          /*! Divide by 2 */
        M3Div_4 = 0x2           /*! Divide by 4 */
    };

    metaonly struct ModuleView {
        Bool configureClocks;
        UInt OSCCLK;
        UInt SPLLIMULT;
        String SPLLFMULT;
        String SYSDIVSEL;
        String M3SSDIVSEL;
        Bool bootC28;
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
     *  Flash controller configuration flag, default is true.
     *
     *  Set to true to enable the configuration of the Flash controller
     *  wait states, program and data cache.
     */
    metaonly config Bool configureFlashController = true;

    /*!
     *  Clock configuration flag, default is false.
     *
     *  Set to true to configure the PLL and system and M3 subsystem clock
     *  dividers.
     */
    config Bool configureClocks = false;

    /*!
     *  ======== sharedMemoryEnable ========
     *  Shared RAM memory enable mask.
     *
     *  This parameter is used for writing the MEMCNF register.
     *  By default, all shared RAM segments will be enabled at runtime.
     *  To disable a shared RAM segment, set the corresponding bit to 0.
     *  If any data is loaded to a shared RAM segment, the segment must
     *  be enabled prior to loading the program through other means.
     */
    config Bits32 sharedMemoryEnable = 0xffffffff;

    /*!
     *  ======== sharedMemoryOwnerMask ========
     *  Shared RAM owner select mask.
     *
     *  This parameter is used for writing the MSxMSEL register.
     *  By default, each value of each shared RAM select bit is '0'.
     *  This means the M3 is the owner and has write access based upon
     *  the sharedMemoryAccess bits.  Setting a '1' in any bit position
     *  makes the C28 the owner of that shared RAM segment.
     */
    config Bits32 sharedMemoryOwnerMask = 0;

    /*!
     *  ======== sharedMemoryAccess ========
     *  Shared RAM M3 write access.
     *
     *  This parameter is used for writing the MSxSRCR registers.
     *  It determines the M3 write access for each shared RAM segment only
     *  when the M3 is the owner of the shared RAM segment.
     *  By default, the M3 is allowed to CPU fetch, DMA write, and CPU write.
     *
     *  Bit 0 is for CPU fetch. 0 - fetch allowed, 1 - fetch not allowed
     *  Bit 1 is for DMA write. 0 - write allowed, 1 - write not allowed
     *  Bit 2 is for CPU write. 0 - write allowed, 1 - write not allowed
     */
    config Bits32 sharedMemoryAccess[8];

    /*!
     *  OSCCLK input frequency to PLL, in MHz. Default is 20 MHz.
     *
     *  This is the frequency of the oscillator clock (OSCCLK) input to the
     *  PLL.
     */
    metaonly config UInt OSCCLK = 20;

    /*! System PLL Integer Multiplier (SPLLIMULT) value */
    metaonly config UInt SPLLIMULT = 1;

    /*! System PLL Fractional Multiplier (SPLLFMULT) value */
    metaonly config FractMult SPLLFMULT = Fract_0;

    /*! System Clock Divider (SYSDIVSEL) value */
    metaonly config SysDiv SYSDIVSEL = Div_8;

    /*! M3 Subsystem Clock Divider (M3SSDIVSEL) value */
    metaonly config M3Div M3SSDIVSEL = M3Div_4;

    /*!
     *  Flash controller wait states configuration flag, default is true.
     *
     *  Set to true to configure the Flash controller wait states.  The number
     *  of wait states is computed based upon the CPU frequency.
     */
    metaonly config Bool configureFlashWaitStates = true;

    /*!
     *  Flash controller program cache enable flag, default is true.
     *
     *  Set to true to enable the Flash controller's program cache.
     */
    metaonly config Bool enableFlashProgramCache = true;

    /*!
     *  Flash controller data cache enable flag, default is true.
     *
     *  Set to true to enable the Flash controller's data cache.
     */
    metaonly config Bool enableFlashDataCache = true;

    /*!
     *  Function to be called when Limp mode is detected.
     *
     *  This function is called when the Boot module is about to configure
     *  the PLL, but finds the device operating in Limp mode (i.e., the mode
     *  when a missing OSCCLK input has been detected).
     *
     *  If this function is not specified by the application, a default
     *  function will be used, which spins in an infinite loop.
     */
    metaonly config Fxn limpAbortFunction;

    /*!
     *  Boot from Flash flag.  Default is true.
     *
     *  Set to true to enable booting the M3 from Flash.
     */
    metaonly config Bool bootFromFlash = true;

    /*!
     *  Initiate booting of the C28 processor.  Default is false.
     *
     *  Set to true to enable the M3 to initiate boot of the C28.
     *
     *  If enabled, this will occur after the optional clock configuration
     *  step, enabled by `{@link #configureClocks}`.
     */
    metaonly config Bool bootC28 = false;

    /*!
     *  Initialize C28 RAM regions before booting the C28 processor.
     *  Default is true.
     *
     *  Set to true to enable initialization of these C28 RAM regions: M1,
     *  CtoM, LO, L1, L2, and L3.  RAM locations will be zeroed, and the ECC or
     *  parity bits will be initialized.
     */
    metaonly config Bool initC28RAMs = true;

    /*!
     *  Configure Shared RAM regions before booting the C28 processor.
     *  Default is true.
     *
     *  Set to true to enable Shared RAM regions S0-S7, to set the
     *  owner of each region and the write access permissions for the onwer.
     */
    metaonly config Bool configSharedRAMs = true;

    /*!
     *  ======== loadSegment ========
     *  Specifies where to load the flash function
     *
     *  If 'configureFlashWaitStates' is true, then this parameter
     *  determines where the ".ti_catalog_c2800_initF2837x_flashfuncs"
     *  section gets loaded.
     */
    metaonly config String loadSegment;

    /*!
     *  ======== runSegment ========
     *  Specifies where to run the flash function
     *
     *  If 'configureFlashWaitStates' is true then this parameter
     *  determines where the ".ti_catalog_c2800_initF2837x_flashfuncs"
     *  section gets executed at runtime.
     */
    metaonly config String runSegment;

    /*!
     *  @_nodoc
     *  ======== getFrequency ========
     *  Gets the resulting M3 CPU frequency (in Hz) given the Clock
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

    /* The computed timestamp frequency */
    metaonly config UInt timestampFreq;

    /* Used to display the computed M3 frequency value in the Grace page. */
    metaonly config String displayFrequency;

    /* Used to display the computed C28 frequency value in the Grace page. */
    metaonly config String displayFrequency28;

    /* The computed Flash wait states */
    metaonly config UInt flashWaitStates = 3;

    /* The computed values to write the MSxSRCR registers */
    metaonly config Bits32 MSxSRCR[2];

};

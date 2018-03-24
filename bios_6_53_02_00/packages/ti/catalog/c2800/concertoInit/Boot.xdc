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

package ti.catalog.c2800.concertoInit;

/*!
 *  ======== Boot ========
 *  Concerto C28 Boot Support.
 *
 *  This Boot module can be used to generate a small section that supports
 *  booting the C28 processor from Flash.  It consists of a single
 *  "LB _c_int00" instruction.
 *
 *  When `{@link #bootFromFlash}` is true, the instruction will be placed
 *  at "BEGIN", as defined in the linker command file.
 *
 *  Boot also supports initializing Flash controller wait states, enabling
 *  program prefetches, and data caching within the Flash controller.
 */
@Template("./Boot.xdt")
@NoRuntime
module Boot
{
    /*!
     *  Boot from Flash flag.  Default is true.
     *
     *  Set to true to enable booting the C28 from Flash.
     */
    metaonly config Bool bootFromFlash = true;

    /*!
     *  Flash controller configuration flag, default is true.
     *
     *  Set to true to enable the configuration of the Flash controller
     *  wait states, program and data cache.
     */
    metaonly config Bool configureFlashController = true;

    /*!
     *  Flash controller wait states configuration flag, default is true.
     *
     *  Set to true to configure the Flash controller wait states.  The number
     *  of wait states is computed based upon the CPU frequency.
     */
    metaonly config Bool configureFlashWaitStates = true;

    /*!
     *  Flash controller program prefetch enable flag, default is false.
     *
     *  Set to true to enable the Flash controller's program prefetch.
     *
     *  WARNING: Program prefetch must not be enabled on pre Revision A devices
     *  if there are any fast branch instructions in the program image.  See
     *  the device errata for more information.
     */
    metaonly config Bool enableFlashProgramPrefetch = false;

    /*!
     *  Flash controller data cache enable flag, default is true.
     *
     *  Set to true to enable the Flash controller's data cache.
     */
    metaonly config Bool enableFlashDataCache = true;

    /*!
     *  ======== loadSegment ========
     *  Specifies where to load the flash function (include the 'PAGE' number)
     *
     *  If 'configureFlashWaitStates' is true, then this parameter
     *  determines where the ".ti_catalog_c2800_initF2837x_flashfuncs"
     *  section gets loaded.
     */
    metaonly config String loadSegment;

    /*!
     *  ======== runSegment ========
     *  Specifies where to run the flash function (include the 'PAGE' number)
     *
     *  If 'configureFlashWaitStates' is true then this parameter
     *  determines where the ".ti_catalog_c2800_initF2837x_flashfuncs"
     *  section gets executed at runtime.
     */
    metaonly config String runSegment;

internal:

    /* The computed Flash wait states */
    metaonly config UInt flashWaitStates = 3;
};

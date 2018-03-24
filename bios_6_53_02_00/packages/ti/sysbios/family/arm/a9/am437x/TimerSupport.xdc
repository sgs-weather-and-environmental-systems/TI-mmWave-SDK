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
 *  ======== TimerSupport.xdc ========
 */

package ti.sysbios.family.arm.a9.am437x;

import xdc.rov.ViewInfo;

/*!
 *  ======== TimerSupport ========
 *  AM437X Timer Support.
 *
 *  The AM437X Timer Support module works in conjunction with the DMTimer
 *  module to manage the usage of the various DMTimers by the A9 core.
 *
 *  This module provides a timer available mask for the DMTimers. The
 *  application can modify this available mask in the .cfg script
 *  to control which timers are available for use by the A9 core.
 *  Any timer whose coreesponding mask bit is cleared will be unavailable
 *  when creating DMTimer instances.
 *
 */

@ModuleStartup

module TimerSupport inherits ti.sysbios.interfaces.ITimerSupport
{
    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String availMask;
    }

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
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
     *  ======== availMask ========
     *  Default available mask for dmtimers
     *
     *  Used to set Timer module's availMask.
     */
     config Bits32 availMask = 0xFFD;

internal:

    /*
     *  ======== getAnyMask ========
     *  Return the anyMask for this device.
     */
    metaonly Bits32 getAnyMask();

    /*
     *  ======== getAvailMask ========
     *  Return the availMask for this device.
     */
    metaonly Bits32 getAvailMask();
}

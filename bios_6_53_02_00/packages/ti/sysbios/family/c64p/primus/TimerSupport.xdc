/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *
 *
 */

package ti.sysbios.family.c64p.primus;

/*!
 *  ======== TimerSupport ========
 *  @_nodoc
 *  TimerSupport Manager for family of primus devices.
 */

module TimerSupport inherits ti.sysbios.interfaces.ITimerSupport
{
    /*! Suspend Source enumerations */
    enum SuspSrc {
        SuspSrc_ARM = 0, /*! ARM's suspend signal is routed to the timer */
        SuspSrc_DSP = 1  /*! DSP's suspend signal is routed to the timer */
    }

    struct Emulation {
        SuspSrc suspSrc;
    };

    /*!
     *  ======== suspSrc ========
     *  Emulation suspend source - controls timer instance's bit in the
     *  SUSPSRC register, which determines from which CPU's perspective
     *  an emulation suspend applies.  This setting has an effect only
     *  when the timer instance's EMUMGT.FREE bit is set to 0 (by way of
     *  the emuMgtInit instance parameter).
     *  Default is SuspSrc_DSP.
     */
    config Emulation timer[] = [];
    
internal:

    struct Module_State {
        SuspSrc         suspSrc[];      /* array of suspSrc values */
    }
}

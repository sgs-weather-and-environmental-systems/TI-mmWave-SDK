/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== Wugen.xdc ========
 *
 *
 */

package ti.sysbios.family.c64p.omap3430;

/*!
 *  ======== Wugen ========
 *  Wugen Module
 *
 *  Unconstrained Functions
 *  All functions
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #applyMasks}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableDma}     </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableEvent}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enableDma}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enableEvent}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getMasks}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #ierToMasks} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Mod_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Mod_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@DirectCall
@ModuleStartup

module Wugen
{
    /*!
     *  ======== applyMasks ========
     *  This function takes an array of 3 integers and applies the specified
     *  mask to the WUGEN interrupt mask registers. If the bit in the mask is
     *  enabled, the corresponding interrupt in the WUGEN will be blocked.
     *  
     *  @param(mask)    array of three integers for applying to the WUGEN
     *                  interrupt mask register.
     *                  First mask consists of IRQ 0-31
     *                  Second mask consists of IRQ 32-47
     *                  Third mask consists of DMA requests
     */
    Void applyMasks(UInt32 mask[]);

    /*!
     *  ======== disableDma ========
     *  Disables the specified DMA source in the WUGEN
     *
     *  @param(dmaid)   the DMA id for a particular EDMA source.
     */
    Void disableDma(UInt dmaid);

    /*!
     *  ======== disableEvent ========
     *  Disables the specified interrupt event source in the WUGEN
     *
     *  @param(eventid) the event number of an interrupt source
     */
    Void disableEvent(UInt eventid);

    /*!
     *  ======== enableDma ========
     *  Enables the specified DMA source in the WUGEN
     *
     *  @param(dmaid)   the DMA id for a particular EDMA source.
     */
    Void enableDma(UInt dmaid);

    /*!
     *  ======== enableEvent ========
     *  Enables the specified interrupt event source in the WUGEN
     *
     *  @param(eventid) the event number of an interrupt source
     */
    Void enableEvent(UInt eventid);

    /*!
     *  ======== getMasks ========
     *  This function returns the WUGEN interrupt mask registers
     *
     *  @param(mask)    array of three integers used to return the WUGEN
     *                  interrupt mask registers
     *                  First mask consists of IRQ 0-31
     *                  Second mask consists of IRQ 32-47
     *                  Third mask consists of DMA requests
     */
    Void getMasks(UInt32 mask[]);

    /*!
     *  ======== ierToMasks ========
     *  Compute the WUGEN masks needed to allow the interrupts set in the IER
     *  register to propagate through the WUGEN.  This function does not enable
     *  external DMA requests.  You must set these explicitly to configure a
     *  DMA request as a wakeup event.
     *
     *  @param(mask)    array of three integers for returning WUGEN masks.
     *                  First mask consists of IRQ 0-31
     *                  Second mask consists of IRQ 32-47
     *                  Third mask consists of DMA requests
     */
    Void ierToMasks(UInt32 mask[]);


internal:

}

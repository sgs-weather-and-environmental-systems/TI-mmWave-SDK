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
 *  ======== ClockFreqs.xdc ========
 *
 *
 */

package ti.sysbios.family.msp430;

/*!
 *  ======== ClockFreqs ========
 *  ClockFreqs Module.
 *
 *  This module is used to define the ACLK and SMCLK frequencies in effect when
 *  BIOS_start() is called at the end of main().  It also provides a function 
 *  that can be called by the application at runtime to query individual 
 *  clock frequencies.
 *
 *  If the application configuration defines values for these two clocks, it 
 *  (the application) is responsible for setting up the clocks to the
 *  corresponding frequencies.  This module will simply hold the values 
 *  specified, for reference by other SYS/BIOS modules, or for query by the 
 *  application.
 * 
 *  If the application configuration specifies a value for one of these 
 *  two clock frequencies, it must specify values for both clock frequencies;
 *  if it does not, a build error will be thrown.
 *
 *  If the application does not define values for one of these clocks, the
 *  values will default either to the device reset values, or the boost values
 *  setup by the Boot module (ti.catalog.msp430.init.Boot).  For example, if 
 *  the application does not configure values for ClockFreq, and does not turn 
 *  off the Boot module's default frequency boost, then the Boot module boost 
 *  frequencies are used.  
 *
 *  If the application does not configure values for ClockFreq, and *does* turn
 *  off the Boot module's frequency boost (see snippet below), then the default
 *  reset frequency values will be used. 
 *
 *  @p(code)
 *      var Boot = xdc.module('ti.catalog.msp430.init.Boot');
 *      Boot.configureDCO = false;
 *  @p
 *
 *  Currently the reset and Boot module boost values are fixed, as shown below.
 *  In future releases these values may made changeable.
 *
 *  The default reset values for UCS-based 5xx/6xx devices are:
 *
 *  @p(code)
 *      ACLK  = 32768 Hz
 *      SMCLK = 1000000 Hz
 *  @p
 *
 *  The default reset values for CS-based FR58xx/FR59xx devices are:
 *
 *  @p(code)
 *      ACLK  = 39063 Hz
 *      SMCLK = 1000000 Hz
 *  @p
 *
 *  The default Boot module boost values for UCS-based 5xx/6xx devices are:
 *
 *  @p(code)
 *      ACLK  = 32768 Hz
 *      SMCLK = 8192000 Hz
 *  @p
 *
 *  The default Boot module boost values for CS-based FR58x/FR59x devices are:
 *
 *  @p(code)
 *      ACLK  = 39063 Hz
 *      SMCLK = 8000000 Hz
 *  @p
 *
 *
 *  Note: This module allows query of the CPU clock (MCLK) frequency via the 
 *  ClockFreqs_getFrequency() API.  But MCLK cannot be configured with this 
 *  module.  Since MCLK is the CPU frequency, it is configured in the BIOS 
 *  module.  For example:
 *
 *  @p(code)
 *      var BIOS = xdc.useModule('ti.sysbios.BIOS');
 *      BIOS.cpuFreq.lo = 25000000;
 *      BIOS.cpuFreq.hi = 0;
 *  @p
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!-- -->
 *    <tr><td> {@link #getFrequency} </td><td>   Y    </td><td>   Y    </td><td>   Y </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable from main(). </li>
 *         <li> <b>Startup</b>: API is callable during any module startup. </li>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@DirectCall
module ClockFreqs 
{
    /*! Clocks */
    enum Clock {
        Clock_ACLK,             /* ACLK */
        Clock_SMCLK,            /* SMCLK */
        Clock_MCLK              /* MCLK */
    };

    /*! ACLK frequency (Hz) */
    config UInt32 ACLK;

    /*! SMCLK frequency (Hz) */
    config UInt32 SMCLK;

    /*! 
     *  ======== getFrequency ========
     *  Get the frequency for a clock.
     *
     */
    UInt32 getFrequency(Clock clock);

}

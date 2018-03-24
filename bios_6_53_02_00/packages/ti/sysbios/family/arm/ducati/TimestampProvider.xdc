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
 *  ======== TimestampProvider.xdc ========
 */

package ti.sysbios.family.arm.ducati;

import xdc.rov.ViewInfo;

/*!
 *  ======== TimestampProvider ========
 *  Ducati Cortex M3 TimestampProvider delegate for use 
 *  with {@link xdc.runtime.Timestamp}
 *
 *  The timestamp counters used in Ducati are CTM counters 2,3,4,5.
 *  Each core uses two counters in chained mode to achieve 64 bits.
 *  Core 0 uses counters 2,3.
 *  Core 1 uses counters 4,5.
 *  Which ever core is started first will start both sets of counters 
 *  synchronously so that both cores effectively share a common timestamp.
 *  By default, the CTM counters are clocked at 2 times the CPU clock.
 *
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main**  </th><th>  Startup***  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #get32}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #get64}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getFreq}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *
 *  </table>
 *  @p
 */

@ModuleStartup          /* To get Clock Timer Handle */

module TimestampProvider inherits ti.sysbios.interfaces.ITimestamp
{

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      timestamp;
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
     * Counter Input Select. The default value of 0 selects the 
     * 2x CPU clock as the clock source for the timestamp counters.
     *
     * See Table 28-22 of the OMAP4430 TRM for details of the
     * various events that can be counted.
     * 1 Cache locks
     * 2 Cache line replacements
     * 3 Cache evictions
     * 4 Cache maintenance operations (slave 0)
     * 5 Cache maintenance operations (slave 1)
     * 6 Cache maintenance operations (slave 2)
     * 7 Cache maintenance operations (slave 3)
     * 8 Cache OCP access (slave 0)
     * 9 Cache OCP access (slave 1)
     * 10 Cache OCP access (slave 2)
     * 11 Cache OCP access (slave 3)
     * 12 Cacheable access (slave 0)
     * 13 Cacheable access (slave 1)
     * 14 Cacheable access (slave 2)
     * 15 Cacheable access (slave 3)
     * 16 Cache bank conflicts (slave 0)
     * 17 Cache bank conflicts (slave 1)
     * 18 Cache bank conflicts (slave 2)
     * 19 Cache bank conflicts (slave 3)
     * 20 Cache allocations
     * 21 Cache write buffer accesses (slave 0)
     * 22 Cache write buffer accesses (slave 1)
     * 23 Cache write buffer accesses (slave 2)
     * 24 Cache write buffer accesses (slave 3)
     * 25 Cache line fills (slave 0)
     * 26 Cache line fills (slave 1)
     * 27 Cache line fills (slave 2)
     * 28 Cache line fills (slave 3)
     * 29 Cache write fills (slave 0)
     * 30 Cache write fills (slave 1)
     * 31 Cache write fills (slave 2)
     * 32 Cache write fills (slave 3)
     * 33 Cache read fills (slave 0)
     * 34 Cache read fills (slave 1)
     * 35 Cache read fills (slave 2)
     * 36 Cache read fills (slave 3)
     * 37 Cache misses (slave 0)
     * 38 Cache misses (slave 1)
     * 39 Cache misses (slave 2)
     * 40 Cache misses (slave 3)
     * 41 Cache hits (slave 0)
     * 42 Cache hits (slave 1)
     * 43 Cache hits (slave 2)
     * 44 Cache hits (slave 3)
     * 45 Cortex-M3 ISS CTL deep sleep
     * 46 Cortex-M3 ISS CTL sleep
     * 47 Cortex-M3 RTOS deep sleep
     * 48 Cortex-M3 RTOS sleep
     */
    config UInt8 inpsel = 0;
}

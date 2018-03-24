/*
 * Copyright (c) 2012-2014, Texas Instruments Incorporated
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
 *
 *
 */

package ti.sysbios.family.msp430;

/*!
 *  ======== TimestampProvider ========
 *  MSP430 Timestamp Provider
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main**  </th><th>  Startup***  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #get16}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
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
    // -------- Module Types --------

    /*! Input clock sources for dedicated Timestamp timer */
    enum Source {
        Source_ACLK,                    /*! ACLK */
        Source_SMCLK                    /*! SMCLK */
    };

    /*!
     *  ======== timerId ========
     *  Id of the timer to use for creating timestamps
     *
     *  A value of {@link Timer#ANY Timer.ANY} (-1) indicates any timer
     *  supported by {@link Timer} is ok.
     */
    config UInt timerId = Timer.ANY;

    /*!
     *  
     *  ======== useClockTimer ========
     *  Use the same timer as Clock
     *
     *  Set this parameter when you want TimestampProvider to use the same
     *  timer as the BIOS {@link ti.sysbios.knl.Clock Clock} module.
     *
     *  This parameter overrides the {@link #timerId timeId} setting.
     */
    config Bool useClockTimer;

    /*!
     *  
     *  ======== clockSource ========
     *  Input clock source for dedicated timer
     *
     *  If the TimestampProvider is to use a different timer than the one
     *  used by the {@link ti.sysbios.knl.Clock Clock} module, this
     *  parameter specifies the input clock source for that dedicated timer.
     *
     *  For example, to use a dedicated timer for Timestamps, and to have it
     *  run off of SMCLK, add the following to the application config script:
     *  
     *  @p(code)
     *  var Timestamp = xdc.useModule('ti.sysbios.family.msp430.TimestampProvider');
     *  Timestamp.useClockTimer = false;
     *  Timestamp.clockSource = Timestamp.Source_SMCLK;
     *  @p
     */
    config Source clockSource = Source_ACLK;

    /*!
     *
     *  ======== synchronize ========
     *  Selected clock source is synchronous to CPU clock
     *
     *  If the TimestampProvider is to use a different timer than the one
     *  used by the {@link ti.sysbios.knl.Clock Clock} module, this
     *  parameter specifies if the clock source is synchronous to CPU clock.
     */
    config Bool synchronize = false;

    /*!
     *  ======== get16 ========
     *  Return a 16-bit timestamp
     *
     *  @a(returns)
     *  Returns a 16-bit timestamp value.
     *  Use `{@link #getFreq}` to convert this value into units of real time.
     */
    Bits16 get16();

    /*!
     *  ======== startTimer ========
     *  Function that starts timer before main
     *
     *  @_nodoc Internal use. 
     */
    Void startTimer();

    /*!
     *  ======== rolloverFunc ========
     *  Timer rollover interrupt handler
     *
     *  @_nodoc Internal use. 
     */
    Void rolloverFunc(UArg unused);

internal:   /* not for client use */

    /*
     *  ======== Module_State ========
     */
    struct Module_State {
        Timer.Handle    timer;          /* timer instance used */
        volatile UInt32 rollovers;      /* timer rollover counts */
    }
}

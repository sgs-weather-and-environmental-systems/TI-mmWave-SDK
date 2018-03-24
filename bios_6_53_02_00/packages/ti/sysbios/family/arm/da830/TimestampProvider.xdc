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
 *
 *
 */

package ti.sysbios.family.arm.da830;

import xdc.runtime.Assert;

/*!
 *  ======== TimestampProvider ========
 *  Provides.da830 specific timestamp APIs to xdc.runtime.Timestamp
 *
 *  Uses the iceCrusher Benchmark counters.
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #get32}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #get64}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getFreq}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. TimestampProvider_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. TimestampProvider_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *
 *  </table>
 *  @p
 */

@ModuleStartup          /* To get Clock Timer Handle */

module TimestampProvider inherits ti.sysbios.interfaces.ITimestamp
{

    /*!
     *  CountType
     *
     *  @c(CountType_CYCLES)
     *  Timestamp is in cycles.
     *
     *  @c(CountType_INSTRUCTIONS)
     *  Timestamp is in instructions.
     */

    enum CountType {
        CountType_CYCLES,       /*! count cycles */
        CountType_INSTRUCTIONS  /*! count instructions */
    };

    struct IceCrusherRegs {
        UInt32  VER;            /*! 0x00 Revision */
        UInt32  DBGCFG;         /*! 0x04 Debug Config */
        UInt32  DBGCNTL;        /*! 0x08 Debug Control & Status */
        UInt32  RES_0C;         /*! 0x0C Reserved */
        UInt32  TRIGCNTL;       /*! 0x10 Trigger Control */
        UInt32  RSTCNTL;        /*! 0x14 Reset Control */
        UInt32  THRDIDCLM;      /*! 0x18 Thread ID Claim */
        UInt32  THRDID;         /*! 0x1c Thread ID */
        UInt32  INTCNTL;        /*! 0x20 Interrupt Control */
        UInt32  ETMCNTL;        /*! 0x24 ETM Control */
        UInt32  ETMPID;         /*! 0x28 ETM Process ID */
        UInt32  TEST;           /*! 0x2C Test */
        UInt32  SWBRKCTL;       /*! 0x30 Software Breakpoint Control */
        UInt32  SWBRKVAL;       /*! 0x34 Software Breakpoint Value */
        UInt32  RES_38;         /*! 0x38 Reserved */
        UInt32  RES_3C;         /*! 0x3C Reserved */
        UInt32  BCNT0CTRL;      /*! 0x40 Benchmark Counter 0 Control */
        UInt32  BCNT0;          /*! 0x44 Benchmark Counter 0 */
        UInt32  RES_48;         /*! 0x48 Reserved */
        UInt32  RES_4C;         /*! 0x4C Reserved */
        UInt32  BCNT1CTRL;      /*! 0x50 Benchmark Counter 1 Control */
        UInt32  BCNT1;          /*! 0x54 Benchmark Counter 1 */
        UInt32  RES_58[10];     /*! 0x58 - 0x7C Reserved */
        UInt32  HWBRK0CTL;      /*! 0x80 Hardware Breakpoint 0 Control */
        UInt32  HWBRK0ADR;      /*! 0x84 Hardware Breakpoint 0 Address */
        UInt32  HWBRK0ADRMASK;  /*! 0x88 Hardware Breakpoint 0 Address Mask */
        UInt32  RES_8C;         /*! 0x8C Reserved */
        UInt32  HWBRK1CTL;      /*! 0x90 Hardware Breakpoint 1 Control */
        UInt32  HWBRK1ADR;      /*! 0x94 Hardware Breakpoint 1 Address */
        UInt32  HWBRK1ADRMASK;  /*! 0x98 Hardware Breakpoint 1 Address Mask */
        UInt32  RES_9C;         /*! 0x9C Reserved */
        UInt32  HWBRK2CTL;      /*! 0xA0 Hardware Breakpoint 2 Control */
        UInt32  HWBRK2ADR;      /*! 0xA4 Hardware Breakpoint 2 Address */
        UInt32  HWBRK2ADRMASK;  /*! 0xA8 Hardware Breakpoint 2 Address Mask */
        UInt32  RES_AC;         /*! 0xAC Reserved */
        UInt32  HWBRK3CTL;      /*! 0xB0 Hardware Breakpoint 3 Control */
        UInt32  HWBRK3ADR;      /*! 0xB4 Hardware Breakpoint 3 Address */
        UInt32  HWBRK3ADRMASK;  /*! 0xB8 Hardware Breakpoint 3 Address Mask */
        UInt32  RES_BC[14];     /*! 0xBC - 0xF0 Reserved */
        UInt32  OS_LOCKSTS;     /*! 0xF4 OS Lock Status */
        UInt32  OS_LOCK;        /*! 0xF8 OS Lock */
        UInt32  DCON;           /*! 0xFC DCON Register */
    }

    extern volatile IceCrusherRegs iceRegs;

    /*! @_nodoc */
    @XmlDtd
    metaonly struct Module_View {
        UInt32  upper32Bits;
    };

    /*! Assert when configured benchmark counter is owned by CCS */
    config Assert.Id A_counterInUse = {
        msg: "A_counterInUse: Benchmark counter already claimed."
    };

    /*! Assert if interrupt control register is owned by CCS */
    config Assert.Id A_intControlInUse = {
        msg: "A_intCOntrolInUse: iceCrusher Int Control Register already claimed."
    };

    /*! ICECrusher Benchmark Counter id. 0 or 1. Default is 1 */
    config UInt benchmarkCounterId = 1;

    /*! 
     *  Timestamp count type. Default is CYCLES. 
     *  CountType_INSTRUCTIONS only supported on benchmarkCounterId 1!!!
     */
    config CountType countType = CountType_CYCLES;

internal:   /* not for client use */

    /*
     * iceCrusher Benchmark Counter Overflow Interrupt Handler
     */
    Void overflowHandler(UArg arg);
    
    /*
     * release the iceCrusher Benchmark Counters on exit so CCS can use them again
     */
    Void releaseCounters();

    struct Module_State {
        UInt32          upper32Bits;    /* upper 32 bits of counter */
        Hwi.Handle      hwi;            /* counter overflow Hwi object */
    }
}

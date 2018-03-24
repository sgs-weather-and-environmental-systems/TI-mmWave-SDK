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
 *  ======== IntMux.xdc ========
 *
 */

package ti.sysbios.family.arm.ducati.dm8148;

import xdc.runtime.Assert;
import xdc.runtime.Error;

import ti.sysbios.interfaces.IHwi;

/*!
 *  ======== IntMux ========
 *  IntMux Module
 *
 *  Below is an example of how to override the default mapping of 
 *  interrupt 42 so that it is sourced by I2CINT2 rather than its 
 *  default mapping to I2CINT1:
 *
 *  @p(code)
 *  #include <ti/sysbios/family/arm/m3/Hwi.h>
 *  #include <ti/sysbios/family/arm/ducati/dm8148/IntMux.h>
 *  
 *  Void myI2CINT2Handler(UArg arg)
 *  {
 *      System_printf("I2CINT2 arg = %d\n", (UInt)arg);
 *  }
 *  
 *  Int main(Int argc, Char* argv[])
 *  {
 *      Hwi_Params params;
 *  
 *      Hwi_Params_init(&params);
 *
 *      // set IntMux 19 to event number 4 (I2CINT2)
 *      IntMux_setEvent(19, 4);
 *  
 *      // create a corresponding interrupt handler
 *      // notice that Ducati interrupt number 42 corresponds to IntMux 19
 *
 *      params.arg = 42; // pass the Int number to the handler for demo 
 *
 *      Hwi_create(42, myI2CINT2Handler, &params, NULL);
 *  
 *      BIOS_start();
 *  
 *      return (0);
 *  }
 *  @p
 *  
 *  Here is how you would define the same interrupt handler statically 
 *  in a configuration script:
 *  
 *  @p(code)
 *  var Hwi = xdc.useModule('ti.sysbios.family.arm.m3.Hwi');
 *  var IntMux = xdc.useModule('ti.sysbios.family.arm.ducati.dm8148.IntMux');
 *  
 *  IntMux.setEventMeta(19, 4);
 *  
 *  var hwiParams = new Hwi.Params();
 *  hwiParams.arg = 42;
 *  Program.global.staticHwi = Hwi.create(42, '&myI2CINT2Handler', hwiParams);
 *  @p
 *  
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #setEvent}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
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
module IntMux
{

    /*!
     *  Assert if interrupt number > 56
     */
    config Assert.Id A_badIntNum = {
        msg: "A_badIntNum: intNum must be <= 56"
    };

    /*!
     *  Assert if event number > 47
     */
    config Assert.Id A_badEventNum = {
        msg: "A_badIntNum: eventNum must be <= 47"
    };

    /*!
     *  Address of "DUCATI_INTMUX_0_3" register
     */
    config Ptr intMuxBaseAddr = 0x48140F54;


    /*!
     *  ======== setEventMeta ========
     *  Set the event number associated with an interrupt.
     *
     *  Statically sets the event number associated with 
     *  an interrupt in the Ducati Interrupt Mux as described
     *  in section 5.9.2 of the Centaurus Architecture Spec.
     *
     *  @param(intNum)    The intMux number (0-56)
     *  @param(eventNum)  The event number (0-47) 
     */
    metaonly Void setEventMeta(UInt intMuxNum, UInt eventNum);

    /*!
     *  ======== setEvent ========
     *  Set the event number associated with an interrupt.
     *
     *  Dynamically sets the event number associated with 
     *  an interrupt in the Ducati Interrupt Mux as described
     *  in section 5.9.2 of the Centaurus Architecture Spec.
     *
     *  @param(intNum)    The intMux number (0-56)
     *  @param(eventNum)  The event number (0-47) 
     */
    Void setEvent(UInt intMuxNum, UInt eventNum);

internal:

    /*
     *  ======== initIntMux ========
     */
    Void initIntMux();

    config UInt8 intMux[57];   // table of INTMUX events
}

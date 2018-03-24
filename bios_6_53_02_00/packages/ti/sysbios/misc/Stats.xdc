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
 *  ======== Stats.xdc ========
 *
 */

package ti.sysbios.misc;

/*!
 *  ======== Stats ========
 *  Statistics Manager
 *
 *  The Stats module manages objects called statistics accumulators. Each
 *  Stats object accumulates the following statistical information about an
 *  arbitrary 32-bit wide data series:
 *
 *      count -- the number of values in an application-supplied data series
 *
 *      total -- the sum of the individual data values in this series
 *
 *      maximum -- the largest value already encountered in this series
 *
 *  Using the count and total, the Statistics View analysis tool calculates
 *  the average on the host.
 *
 *  Statistics are accumulated in 32-bit variables on the target and in 
 *  64-bit variables on the host. When the host polls the target for real-time
 *  statistics, it resets the variables on the target. This minimizes space
 *  requirements on the target while allowing you to keep statistics for long
 *  test runs.
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center">
 *  </colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th>
 *  <th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                       -->
 *    <tr><td> {@link #create}          </td><td>   N    </td><td>   N    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}     </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #add}             </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #construct}       </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delete}          </td><td>   N    </td><td>   N    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delta}           </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #destruct}        </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #reset}           </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #set}             </td><td>   Y    </td><td>   Y    </td>
 *  <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started 
 *  (e.g. Stats_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started 
 *  (e.g. Stats_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@DirectCall
module Stats
{

instance:

    // Handle Parameters

    /*! Type a comment to identify this Stats object */
    metaonly config String      comment         = "<add comments here>";

    /*!
     *  Choose the type of time base units.
     *
     *  Not time based. When you select this unit type, the values are
     *  displayed in the Statistics View without applying any conversion.
     *
     *  High-resolution time based. When you select this unit type, the
     *  Statistics View, by default, presents the results in units of
     *  instruction cycles.
     *
     *  Low-resolution time based. When you select this unit type, the
     *  Statistics View, by default, presents the results in units of timer
     *  interrupts.
     *
     *  Options: "Not time based", "High resolution time based", 
     *  "Low resolution time based"
     *
     *  Default type is "Not time based"
     */
    metaonly config String      unitType        = "Not time based";

    /*!
     *  Host operation. 
     * 
     *  The expression evaluated (by the host) on the data for this object
     *  before it is displayed by the Statistics View real-time
     *  analysis tool. 
     *
     *  The operation can be:
     *
     *  A x X
     *
     *  A x X + B
     *
     *  (A x X + B) / C
     *
     *  Options: "Nothing", "A * x", "A * x + B", "(A * x + B) / C"
     *
     *  Default operation is "Nothing"
     */
    metaonly config String      operation       = "Nothing";

    /*! 
     *  An integer parameter.
     *
     *  used in the expression specified by  the host "operation" 
     *  configuration parameter.
     *
     *  Default numA is  1
     */
    metaonly config Int32       numA            = 1;

    /*! 
     *  An integer parameter.
     *
     *  used in the expression specified by the host "operation" 
     *  configuration parameter.
     *
     *  Default numB is  0
     */
    metaonly config Int32       numB            = 0;

    /*! 
     *  An integer parameter.
     *  
     *  used in the expression specified by the host "operation" 
     *  configuration parameter.
     *
     *  Default numC is  1
     */
    metaonly config Int32       numC            = 1;

    /*! Default previous value is 0 */
    config Int32 previousVal    = 0;

    // Instance Functions 

    /*!
     *  ======== add ========
     *  Update statistics using the provided value.
     *
     *  Stats_add updates a custom Stats object's total, count, and max fields
     *  using the data value you provide.
     *
     *  For example, suppose your program passes 32-bit amplitude values to
     *  Stats_add. The Count field tracks how many times your program calls
     *  Stats_add for this Stats object. The Total field tracks the total of
     *  all the amplitudes. The Max field holds the largest value passed to
     *  this point. The Statistics View analysis tool calculates the average
     *  amplitude.
     *
     *  You can count the occurrences of an event by passing a dummy value
     *  (such as 0) to Stats_add and watching the Count field.
     *
     *  @param(value)     value to be added to the statistics 
     */
    Void add(Int32 value);

    /*!
     *  ======== delta ========
     *  Update statistics using difference between provided value & setpoint.
     *
     *  Each Stats object contains a previous value that can be initialized with
     *  Tconf or with a call to Stats_set. A call to Stats_delta subtracts the 
     *  previous value from the value it is passed and then invokes Stats_add 
     *  with the result to update the statistics. Stats_delta also updates the 
     *  previous value with the value it is passed.
     *
     *  Stats_delta can be used in conjunction with Stats_set to monitor the
     *  difference between a variable and a desired value or to benchmark
     *  program performance. You can benchmark code by using paired calls to
     *  Stats_set and Stats_delta that pass the value provided by CLK_gethtime.
     *
     *  @param(value)     value to be subtracted 
     */
    Void delta(Int32 value);

    /*!
     *  ======== set ========
     *  Save a value for Stats_delta
     *
     *  Stats_set can be used in conjunction with Stats_delta to monitor the
     *  difference between a variable and a desired value or to benchmark
     *  program performance. Stats_set saves a value as the previous value in
     *  an Stats object. Stats_delta subtracts this saved value from the 
     *  value it is
     *  passed and invokes Stats_add with the result.
     *
     *  Stats_delta also updates the previous value with the value it was 
     *  passed.
     *  Depending on what you are measuring, you can need to use Stats_set to
     *  reset the previous value before the next call to Stats_delta.
     *
     *  You can also set a previous value for an Stats object in the 
     *  configuration. Stats_set changes this value.
     *
     *  See Stats_delta for details on how to use the value you set 
     *  with Stats_set.
     *
     *  @param(value)   value to be saved as previous value
     */
    Void set(Int32 value);

    /*!
     *  ======== reset ========
     *  Reset the values stored in an Stats object
     *
     *  Stats_reset resets the values stored in an Stats object. The Count and
     *  Total fields are set to 0 and the Max field is set to the largest 
     *  negative number. Stats_reset does not modify the value set by Stats_set.
     *
     *  After the Statistics View analysis tool polls statistics data on the 
     *  target, it performs Stats_reset internally. This keeps the 32-bit total 
     *  and count values from wrapping back to 0 on the target. The host 
     *  accumulates these values as 64-bit numbers to allow a much larger 
     *  range than can be stored on the target.
     */
    Void reset();

    /*!
     *  ======== getPrev ========
     *  @_nodoc 
     */
    Int32 getPrev();

    /*!
     *  ======== getCount ========
     *  @_nodoc 
     */
    Int32 getCount();

    /*!
     *  ======== getTotal ========
     *  @_nodoc 
     */
    Int32 getTotal();

    /*!
     *  ======== getMax ========
     *  @_nodoc 
     */
    Int32 getMax();

    /*!
     *  ======== print ========
     *  @_nodoc 
     */
    Void print();

internal:

    // instance object
    struct Instance_State {
        Int32   prev;   // previous value
        Int32   count;  // count
        Int32   total;  // total value
        Int32   max;    // maximum value
    };
}

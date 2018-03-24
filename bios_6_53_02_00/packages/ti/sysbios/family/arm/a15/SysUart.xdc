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
 *  ======== SysUart.xdc ========
 *
 */

package ti.sysbios.family.arm.a15;

/*! @_nodoc
 *  ======== SysUart ========
 *  System UART driver
 *
 *  This driver is provided as an alternative to SysMin and SysStd.
 *  SysUart can be plugged as the default System support proxy to
 *  direct all standard I/O to the UART.
 *
 *  @p(code)
 *  var System  = xdc.useModule('xdc.runtime.System');
 *  var SysUart = xdc.useModule('ti.sysbios.family.arm.a15.SysUart');
 *  System.SupportProxy = SysUart;
 *  @p
 */

@ModuleStartup

module SysUart inherits xdc.runtime.ISystemSupport {

    /*
     *  @_nodoc
     *  ======== abort ========
     *  Backend for `{@link System#abort()}`
     *
     *  This abort function writes the string via `putchar()`
     *  and flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#abort
     */
    /*override Void abort(String str);*/
    
    /*! @_nodoc
     *  ======== exit ========
     *  Backend for `{@link System#exit()}`
     *
     *  This exit function flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#exit
     */
    override Void exit(Int stat);
    
    /*! @_nodoc
     *  ======== flush ========
     *  Backend for `{@link System#flush()}`
     *
     *  This flush function flushes via `fflush()` to `stdout`.
     *
     *  @see ISystemSupport#flush
     */
    override Void flush();
    
    /*! @_nodoc
     *  ======== putch ========
     *  Backend for `{@link System#printf()}` and `{@link System#putch()}`
     *
     *  This function outputs the character via `putchar()`.
     *
     *  @see ISystemSupport#putch
     */
    override Void putch(Char ch);
    
    /*! @_nodoc
     *  ======== ready ========
     *  Test if character output can proceed
     *
     *  This always returns TRUE.
     *
     *  @see ISystemSupport#ready
     */
    override Bool ready();
}


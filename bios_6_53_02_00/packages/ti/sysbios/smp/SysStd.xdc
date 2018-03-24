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
 *  ======== SysStd.xdc ========
 *  SMP aware SysStd replacement
 */

package ti.sysbios.smp;

/*!
 *  ======== SysStd ========
 *  Implementation of `{@link xdc.runtime.ISystemSupport}` using ANSI C Standard Library
 *
 *  This implementation provides a fully functional implementation of
 *  all methods specified by `ISystemSupport`. As with all
 *  `ISystemSupport` modules, this module is the back-end for the
 *  `{@link xdc.runtime.System}` module.
 *
 *  This implementation relies on the target's runtime support libraries
 *  (i.e. `fflush()` and `putchar()`). Therefore the  functions are re-entrant
 *  (thread-safe) if the underlying rts library is re-entrant.
 */
@CustomHeader
module SysStd inherits xdc.runtime.ISystemSupport {
    /*!
     *  ======== abort ========
     *  Backend for `{@link xdc.runtime.System#abort()}`
     *
     *  This abort function writes the string via `putchar()`
     *  and flushes via `fflush()` to `stdout`.
     *
     *  @see xdc.runtime.ISystemSupport#abort
     */
    override Void abort(CString str);

    /*!
     *  ======== exit ========
     *  Backend for `{@link xdc.runtime.System#exit()}`
     *
     *  This exit function flushes via `fflush()` to `stdout`.
     *
     *  @see xdc.runtime.ISystemSupport#exit
     */
    override Void exit(Int stat);

    /*!
     *  ======== flush ========
     *  Backend for `{@link xdc.runtime.System#flush()}`
     *
     *  This flush function flushes via `fflush()` to `stdout`.
     *
     *  @see xdc.runtime.ISystemSupport#flush
     */
    override Void flush();

    /*!
     *  ======== putch ========
     *  Backend for `{@link xdc.runtime.System#printf()}` and `{@link xdc.runtime.System#putch()}`
     *
     *  This function outputs the character via `putchar()`.
     *
     *  @see xdc.runtime.ISystemSupport#putch
     */
    override Void putch(Char ch);

    /*!
     *  ======== ready ========
     *  Test if character output can proceed
     *
     *  This always returns TRUE.
     *
     *  @see xdc.runtime.ISystemSupport#ready
     */
    override Bool ready();

internal:

    struct LineBuffer {
        UInt outidx;    /* index within outbuf to next Char to write */
        Char outbuf[256];
    }

    struct Module_State {
        LineBuffer lineBuffers[];
    };

}

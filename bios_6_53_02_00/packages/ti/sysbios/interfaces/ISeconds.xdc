/*
 * Copyright (c) 2014-2015, Texas Instruments Incorporated
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
 *  ======== ISeconds.xdc ========
 */

/*!
 *  ======== ISeconds ========
 *  Seconds interface.
 */

@DirectCall
interface ISeconds
{
    /*!
     *  ======== get ========
     *  Returns number of seconds since 1970 (the Unix epoch).
     *
     *  The user must call Seconds_set() before making any calls to Seconds_get(),
     *  otherwise the value returned by Seconds_get() will be meaningless.
     */
    UInt32 get();

    /*!
     *  ======== Time ========
     *  Structure to hold a time value in seconds plus nanoseconds.
     */
    struct Time {
        UInt32 secs;    /*! Seconds */
        UInt32 nsecs;   /*! Nanoseconds */
    };

    /*!
     *  ======== getTime ========
     *  Fills in a Seconds_Time structure with seconds and nanoseconds
     *  elapsed since 1970 (the Unix epoch).
     *
     *  Seconds_set() must have been called before making any calls to
     *  Seconds_getTime(), otherwise the value returned by Seconds_getTime()
     *  will be meaningless.
     */
    UInt32 getTime(ISeconds.Time *ts);

    /*!
     *  ======== set ========
     *  Update the real time clock with number of seconds since 1970.
     *
     *  Note: This function is non-reentrant.
     */
    Void set(UInt32 seconds);
}

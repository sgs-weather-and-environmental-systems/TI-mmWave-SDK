/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved.
 *  This program and the accompanying materials are made available under the
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== ITimestampClient.xdc ========
 */
package xdc.runtime;

/*!
 *  ======== ITimestampClient ========
 *  Timestamp Client Interface
 *
 *  This interface defines the methods used by client applications to
 *  get timestamp values.  It is implemented by the
 *  `{@link xdc.runtime.Timestamp Timestamp}` module.
 */
@DirectCall
interface ITimestampClient {

    /*!
     *  ======== get32 ========
     *  Return a 32-bit timestamp
     *
     *  @a(returns)
     *  Returns a 32-bit timestamp value.  
     *  Use `{@link #getFreq}` to convert this value into units of real time.
     *
     *  @see #get64
     */
    Bits32 get32();

    /*!
     *  ======== get64 ========
     *  Return a 64-bit timestamp
     *
     *  @param(result)  pointer to 64-bit result
     *
     *      This parameter is a pointer to a structure representing a 64-bit
     *      wide timestamp value where the current timestamp is written.
     *
     *      If the underlying hardware does not support 64-bit resolution, the
     *      `hi` field of `result` is always set to 0; see
     *      `{@link xdc.runtime.Types#Timestamp64}`.  So, it is possible for 
     *      the `lo` field to wrap around without any change to the `hi` field.
     *      Use `{@link #getFreq}` to convert this value into units of real 
     *      time.
     *
     *  @see #get32
     */
    Void get64(Types.Timestamp64 *result);
    
    /*!
     *  ======== getFreq ========
     *  Get the timestamp timer's frequency (in Hz)
     *
     *  @param(freq)  pointer to a 64-bit result
     *
     *      This parameter is a pointer to a structure representing a 64-bit
     *      wide frequency value where the timer's frequency (in Hz)
     *      is written; see `{@link xdc.runtime.Types#FreqHz}`.
     *      This function provides a way of converting timestamp 
     *      values into units of real time.
     *
     *  @see #get32
     *  @see #get64
     */
    Void getFreq(Types.FreqHz *freq);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */


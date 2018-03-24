/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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


/*!
 *  ======== Clock ========
 *  MSP430 Master Clock
 */
metaonly interface IClock inherits xdc.platform.IPeripheral {

    /*!
    *  ======== ForceSetDefaultRegister_t ========
    *  Force Set Default Register
    *
    *  Type to store if each register needs to be forced initialized
    *  even if the register is in default state.
    *
    *  @see #ForceSetDefaultRegister_t
    */
    struct ForceSetDefaultRegister_t {
        String     register;
        Bool       regForceSet;
    }

    /*!
    *  ======== AvailableClockVariations_t ========
    *  Available variations of clock in a device
    *
    *  Stores true/false if any of the clock variations are
    *  available.
    *
    *  @see #AvailableClockVariations_t
    */
    struct AvailableClockVariations_t {
        String     clockType;
        Bool       hasClock;
    }

instance:

    /*!
     *  ======== baseAddr ========
     *  Address of the peripheral's control register.
     *
     *  A peripheral's registers are commonly accessed through a structure
     *  that defines the offsets of a particular register from the lowest
     *  address mapped to a peripheral. That lowest address is specified by
     *  this parameter.
     */
    config UInt baseAddr;

    /*!
     *  ======== hasHFXT1 ========
     *  Specify if HFXT1 is available on the device.
     *
     *  Not all devices have high frequency clock. This specifies if
     *  it is available for a particular device.
     */
    config Bool hasHFXT1 = false;

    /*!
     *  ======== hasXT2 ========
     *  Specify if XT2 is available on the device.
     *
     *  Not all devices have XT2 clock available. This specifies if
     *  it is available for a particular device.
     */
    config Bool hasXT2 = false;

    /*!
     *  ======== hasRosc ========
     *  Specify if Rosc is available on the device.
     *
     *  Not all devices have Rosc circuitry. This specifies if
     *  it is available for a particular device.
     */
    config Bool hasRosc = false;

    /*!
     *  ======== hasVLO ========
     *  Specify if VLO is available on the device.
     *
     *  Not all devices have very low frequency clock VLO. This specifies if
     *  it is available for a particular device.
     */
    config Bool hasVLO = false;

    /*!
     *  ======== hasAllCal ========
     *  Specify if device has all calibration constants.
     *
     *  G1 devices do not.
     */
    config Bool hasAllCal = false;

    /*!
     *  ======== maxCpuFrequency ========
     *  Maximum CPU frequency in Hertz
     */
    config Float maxCpuFrequency = 0;

    /*!
     *  ======== DCOCLKHz ========
     *  DCO clock frequency in Hertz
     */
    readonly config Float DCOCLKHz = 1000000;

    /*!
     *  ======== ACLKHz ========
     *  ACLK frequency in Hertz
     */
    readonly config Float ACLKHz;

    /*!
     *  ======== MCLKHz ========
     *  MCLK frequency in Hertz
     */
    readonly config Float MCLKHz;

    /*!
     *  ======== SMCLKHz ========
     *  SMCLK frequency in Hertz
     */
    readonly config Float SMCLKHz;

    /*!
     *  ======== computeDCOCLKHz ========
     *  Initialize to the nearest available DCO clock frequency
     */
    void computeDCOCLKHz(Float DCOCLKHz);
}

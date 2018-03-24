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
 *  ======== DAC12 ========
 *  MSP430 12-bit Digital to Analog Converter
 */
metaonly module DAC12 inherits IDAC {

    struct DAC12_xCTL_t {
        DAC12OPS_t DAC12OPS;       /*! DAC12 output select
                                    * 0 DAC12_0 output on P6.6, DAC12_1 output on P6.7
                                    * 1 DAC12_0 output on VeREF+, DAC12_1 output on P6.5 */
        DAC12SREF_t DAC12SREF;     /*! DAC12 select reference voltage
                                    * 00 VREF+
                                    * 01 VREF+
                                    * 10 VeREF+
                                    * 11 VeREF+ */
        DAC12RES_t DAC12RES;       /*! DAC12 resolution select
                                    * 0 12-bit resolution
                                    * 1 8-bit resolution */
        DAC12LSEL_t DAC12LSEL;     /*! DAC12 load select. Selects the load trigger for the DAC12 latch. DAC12ENC
                                    * must be set for the DAC to update, except when DAC12LSELx = 0.
                                    * 00 DAC12 latch loads when DAC12_xDATwritten (DAC12ENCis ignored)
                                    * 01 DAC12 latch loads when DAC12_xDAT written, or, when grouped,
                                    * when all DAC12_xDAT registers in the group have been written.
                                    * 10 Rising edge of Timer_A.OUT1 (TA1)
                                    * 11 Rising edge of Timer_B.OUT2 (TB2) */
        DAC12CALON_t DAC12CALON;   /*! DAC12 calibration on. This bit initiates the DAC12 offset calibration sequence
                                    * and is automatically reset when the calibration completes.
                                    * 0 Calibration is not active
                                    * 1 Initiate calibration/calibration in progress */
        DAC12IR_t DAC12IR;         /*! DAC12 input range. This bit sets the reference input and voltage output range.
                                    * 0 DAC12 full-scale output = 3x reference voltage
                                    * 1 DAC12 full-scale output = 1x reference voltage */
        DAC12AMP_t DAC12AMP;       /*! DAC12 amplifier setting. These bits select settling time vs current
                                    * consumption for the DAC12 input and output amplifiers.
                                    * DAC12AMPx        Input Buffer        Output Buffer
                                    *    000       Off                    DAC12 off, output high Z
                                    *    001       Off                    DAC12 off, output 0 V
                                    *    010       Low speed/current      Low speed/current
                                    *    011       Low speed/current      Medium speed/current
                                    *    100       Low speed/current      High speed/current
                                    *    101       Medium speed/current   Medium speed/current
                                    *    110       Medium speed/current   High speed/current
                                    *    111       High speed/current     High speed/current */
        DAC12DF_t DAC12DF;         /*! DAC12 data format
                                    * 0 Straight binary
                                    * 1 2s complement */
        DAC12IE_t DAC12IE;         /*! DAC12 interrupt enable
                                    * 0 Disabled
                                    * 1 Enabled */
        DAC12IFG_t DAC12IFG;       /*! DAC12 Interrupt flag
                                    * 0 No interrupt pending
                                    * 1 Interrupt pending */
        DAC12ENC_t DAC12ENC;       /*! DAC12 enable conversion. This bit enables the DAC12 module when
                                    * DAC12LSELx > 0. when DAC12LSELx = 0, DAC12ENC is ignored.
                                    * 0 DAC12 disabled
                                    * 1 DAC12 enabled */
        DAC12GRP_t DAC12GRP;       /*! DAC12 group. Groups DAC12_x with the next higher DAC12_x.
                                    * 0 Not grouped
                                    * 1 Grouped */
    };

    /*!
     *  ======== create ========
     *  Create an instance of this peripheral.
     */
    create();

  instance:

    /*! DAC12_0CTL Register */
    config DAC12_xCTL_t DAC12_0CTL = {
        DAC12OPS    : DAC12OPS_OFF,
        DAC12SREF   : DAC12SREF_0,
        DAC12RES    : DAC12RES_OFF,
        DAC12LSEL   : DAC12LSEL_0,
        DAC12CALON  : DAC12CALON_OFF,
        DAC12IR     : DAC12IR_OFF,
        DAC12AMP    : DAC12AMP_0,
        DAC12DF     : DAC12DF_OFF,
        DAC12IE     : DAC12IE_OFF,
        DAC12IFG    : DAC12IFG_OFF,
        DAC12ENC    : DAC12ENC_OFF,
        DAC12GRP    : DAC12GRP_OFF
    };

    /*! DAC12_1CTL Register */
    config DAC12_xCTL_t DAC12_1CTL = {
        DAC12OPS    : DAC12OPS_OFF,
        DAC12SREF   : DAC12SREF_0,
        DAC12RES    : DAC12RES_OFF,
        DAC12LSEL   : DAC12LSEL_0,
        DAC12CALON  : DAC12CALON_OFF,
        DAC12IR     : DAC12IR_OFF,
        DAC12AMP    : DAC12AMP_0,
        DAC12DF     : DAC12DF_OFF,
        DAC12IE     : DAC12IE_OFF,
        DAC12IFG    : DAC12IFG_OFF,
        DAC12ENC    : DAC12ENC_OFF,
        DAC12GRP    : DAC12GRP_OFF
    };

    /*! DAC12_0DAT Register */
    config Bits16 DAC12_0DAT = 0;

    /*! DAC12_1DAT Register */
    config Bits16 DAC12_1DAT = 0;

    /*! DAC12 has 2 interrupt enables */
    config regIntVect_t interruptSource[2];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "DAC12_0CTL" , regForceSet : false },
        { register : "DAC12_1CTL" , regForceSet : false },
        { register : "DAC12_0DAT" , regForceSet : false },
        { register : "DAC12_1DAT" , regForceSet : false }
    ];
}

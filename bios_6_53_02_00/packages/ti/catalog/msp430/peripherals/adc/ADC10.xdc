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
 *  ======== ADC10 ========
 *  MSP430 10-bit Analog to Digital Converter
 */
metaonly module ADC10 inherits IADC {

    /*! ADC10 Start Conversion */
    enum ADC10SC_t {
        ADC10SC_OFF     = 0x000,        /*! No conversion. */
        ADC10SC         = 0x001         /*! Start ADC conversion manually. */
    };

    /*! ADC10 Enable Conversion */
    enum ENC_t {
        ENC_OFF         = 0x000,        /*! Disable ADC. */
        ENC             = 0x002         /*! Enable ADC. */
    };

    /*! ADC10 Interrupt Flag */
    enum ADC10IFG_t {
        ADC10IFG_OFF    = 0x000,        /*! Clear ADC interrupt flag. */
        ADC10IFG        = 0x004         /*! Set ADC interrupt flag. */
    };

    /*! ADC10 Interrupt Enable */
    enum ADC10IE_t {
        ADC10IE_OFF = 0x000,            /*! Disable ADC interrupt. */
        ADC10IE     = 0x008             /*! Enable ADC interrupt. */
    };

    /*! ADC10 On/Enable */
    enum ADC10ON_t {
        ADC10ON_OFF = 0x000,            /*! Switch Off ADC10. */
        ADC10ON     = 0x010             /*! Switch On ADC10. */
    };

    /*! ADC10 Reference on */
    enum REFON_t {
        REFON_OFF   = 0x000,            /*! Disable ADC reference generator. */
        REFON       = 0x020             /*! Enable ADC reference generator. */
    };

    /*! ADC10 Ref 0:1.5V / 1:2.5V */
    enum REF2_5V_t {
        REF2_5V_OFF = 0x000,            /*! Set reference voltage generator = 1.5V. */
        REF2_5V     = 0x040             /*! Set reference voltage generator = 2.5V. */
    };

    /*! ADC10 Multiple SampleConversion */
    enum MSC_t {
        MSC_OFF = 0x000,                /*! Disable multiple sample and conversion. */
        MSC     = 0x080                 /*! Enable multiple sample and conversion. */
    };

    /*! ADC10 Reference Burst Mode */
    enum REFBURST_t {
        REFBURST_OFF = 0x000,           /*! Reference buffer on continuously. */
        REFBURST     = 0x100            /*! Reference buffer on only during sample-and-conversion. */
    };

    /*! ADC10 Enable output of Ref. */
    enum REFOUT_t {
        REFOUT_OFF      = 0x000,        /*! Reference output off. */
        REFOUT          = 0x200         /*! Reference output on. */
    };

    /*! ADC10 Sampling Rate 0:200ksps / 1:50ksps */
    enum ADC10SR_t {
        ADC10SR_OFF = 0x000,            /*! Reference buffer supports up to ~200 ksps. */
        ADC10SR     = 0x400             /*! Reference buffer supports up to ~50 ksps. */
    };

    /*! ADC10 Sample Hold Select 0 */
    enum ADC10SHT_t {
        ADC10SHT_0      = (0*0x800u),   /*! 4 x ADC10CLKs. */
        ADC10SHT_1      = (1*0x800u),   /*! 8 x ADC10CLKs. */
        ADC10SHT_2      = (2*0x800u),   /*! 16 x ADC10CLKs. */
        ADC10SHT_3      = 3*0x800u      /*! 64 x ADC10CLKs. */
    };

    /*! ADC10 Reference Select 0 */
    enum SREF_t {
        SREF_0 = (0*0x2000u),           /*! VR+ = VCC and VR- = VSS. */
        SREF_1 = (1*0x2000u),           /*! VR+ = VREF+ and VR- = VSS. */
        SREF_2 = (2*0x2000u),           /*! VR+ = VeREF+ and VR- = VSS. */
        SREF_3 = (3*0x2000u),           /*! VR+ = Buffered VeREF+ and VR- = VSS. */
        SREF_4 = (4*0x2000u),           /*! VR+ = VCC and VR- = VREF-/ VeREF-. */
        SREF_5 = (5*0x2000u),           /*! VR+ = VREF+ and VR- = VREF-/ VeREF-. */
        SREF_6 = (6*0x2000u),           /*! VR+ = VeREF+ and VR- = VREF-/ VeREF-. */
        SREF_7 = 7*0x2000u              /*! VR+ = Buffered VeREF+ and VR- = VREF-/ VeREF-. */
    };

    enum ADC10BUSY_t {
        ADC10BUSY_OFF = 0x0000,         /*! No operation is active. */
        ADC10BUSY     = 0x0001          /*! A sequence, sample, or conversion is active. */
    };

    /*! Types of conversion */
    enum CONSEQ_t {
        CONSEQ_0 = (0*2u),              /*! Single channel single conversion. */
        CONSEQ_1 = (1*2u),              /*! Sequence of channels. */
        CONSEQ_2 = (2*2u),              /*! Repeat single channel. */
        CONSEQ_3 = 3*2u                 /*! Repeat sequence of channels. */
    };

    /*! ADC10 Clock Source */
    enum ADC10SSEL_t {
        ADC10SSEL_0 = (0*8u),           /*! ADC10OSC. */
        ADC10SSEL_1 = (1*8u),           /*! ACLK. */
        ADC10SSEL_2 = (2*8u),           /*! MCLK.*/
        ADC10SSEL_3 = 3*8u              /*! SMCLK. */
    };

    /*! ADC10 Clock Divider */
    enum ADC10DIV_t {
        ADC10DIV_0 = (0*0x20u),         /*! Divide by 1. */
        ADC10DIV_1 = (1*0x20u),         /*! Divide by 2. */
        ADC10DIV_2 = (2*0x20u),         /*! Divide by 3. */
        ADC10DIV_3 = (3*0x20u),         /*! Divide by 4. */
        ADC10DIV_4 = (4*0x20u),         /*! Divide by 5. */
        ADC10DIV_5 = (5*0x20u),         /*! Divide by 6. */
        ADC10DIV_6 = (6*0x20u),         /*! Divide by 7. */
        ADC10DIV_7 = 7*0x20u            /*! Divide by 8. */
    };

    /*! ADC10 input signal inversion */
    enum ISSH_t {
        ISSH_OFF = 0x0000,              /*! Input signal not inverted. */
        ISSH     = 0x0100               /*! Input signal inverted. */
    };

    /*! ADC10 output as 2's complement */
    enum ADC10DF_t {
        ADC10DF_OFF = 0x0000,           /*! ADC10 Data Format as binary. */
        ADC10DF     = 0x0200            /*! ADC10 Data Format as 2's complement */
    };

    /*! ADC10 trigger */
    enum SHS_t {
        SHS_0 = (0*0x400u),             /*! ADC10SC. */
        SHS_1 = (1*0x400u),             /*! Timer_A OUT1. */
        SHS_2 = (2*0x400u),             /*! Timer_A OUT0. */
        SHS_3 = 3*0x400u                /*! Timer_A OUT2. */
    };

    /*! ADC10 Channel Selection */
    enum INCH_t {
        INCH_0 = (0*0x1000u),           /*! ADC Channel 0. */
        INCH_1 = (1*0x1000u),           /*! ADC Channel 1. */
        INCH_2 = (2*0x1000u),           /*! ADC Channel 2. */
        INCH_3 = (3*0x1000u),           /*! ADC Channel 3. */
        INCH_4 = (4*0x1000u),           /*! ADC Channel 4. */
        INCH_5 = (5*0x1000u),           /*! ADC Channel 5. */
        INCH_6 = (6*0x1000u),           /*! ADC Channel 6. */
        INCH_7 = (7*0x1000u),           /*! ADC Channel 7. */
        INCH_8 = (8*0x1000u),           /*! ADC VeRef+. */
        INCH_9 = (9*0x1000u),           /*! ADC VeRef-. */
        INCH_10 = (10*0x1000u),         /*! Temperature Sensor. */
        INCH_11 = (11*0x1000u),         /*! ADC convert VCC. */
        INCH_12 = (12*0x1000u),         /*! ADC Channel 12. */
        INCH_13 = (13*0x1000u),         /*! ADC Channel 13. */
        INCH_14 = (14*0x1000u),         /*! ADC Channel 14. */
        INCH_15 = 15*0x1000u            /*! ADC Channel 15. */
    };

    /*!
     *  ======== ADC10CT_t ========
     *  Data transfer modes
     *
     *  @see #ADC10DTC0
     */
    enum ADC10CT_t {
        ADC10CT_OFF = 0x000,            /*! Data is transferred is stopped after every conversion. */
        ADC10CT     = 0x004             /*! Data is transferred continuously after every conversion. */
    }

    /*!
     *  ======== ADC10TB_t ========
     *  Block data transfer modes
     *
     *  @see #ADC10DTC0
     */
    enum ADC10TB_t {
        ADC10TB_OFF = 0x000,            /*! One-block transfer mode. */
        ADC10TB     = 0x008             /*! Two-block transfer mode. */
    }
    /* End of ADC10DTC0 Register Definitions */

    /*!
     *  ======== ADC10CTL0_t ========
     *  ADC10 Control Register 0
     *
     *  @see #ADC10CTL0
     */
    struct ADC10CTL0_t {
        ADC10SC_t   ADC10SC;        /*! Start conversion. Software-controlled sample-and-conversion start.
                                      * ADC10SC and ENC may be set together with one instruction. ADC10SC is
                                      * reset automatically.
                                      *  0  No sample-and-conversion start
                                      *  1  Start sample-and-conversion */
        ENC_t       ENC;            /*! Enable conversion
                                      *  0  ADC10 disabled
                                      *  1  ADC10 enabled */
        ADC10IFG_t  ADC10IFG;       /*! ADC10 interrupt flag. This bit is set if ADC10MEM is loaded with a conversion
                                      * result. It is automatically reset when the interrupt request is accepted, or it may
                                      * be reset by software. When using the DTC this flag is set when a block of
                                      * transfers is completed.
                                      *  0  No interrupt pending
                                      *  1  Interrupt pending */
        ADC10IE_t   ADC10IE;        /*! ADC10 interrupt enable
                                      *  0  Interrupt disabled
                                      *  1  Interrupt enabled */
        ADC10ON_t   ADC10ON;        /*! ADC10 on
                                      *  0  ADC10 off
                                      *  1  ADC10 on */
        REFON_t     REFON;          /*! Reference generator on
                                      *  0  Reference off
                                      *  1  Reference on */
        REF2_5V_t   REF2_5V;        /*! Reference-generator voltage. REFON must also be set.
                                      *  0  1.5 V
                                      *  1  2.5 V */
        MSC_t       MSC;            /*! Multiple sample and conversion. Valid only for sequence or repeated modes.
                                      *  0  The sampling requires a rising edge of the SHI signal to trigger each
                                      *     sample-and-conversion.
                                      *  1  The first rising edge of the SHI signal triggers the sampling timer, but
                                      *     further sample-and-conversions are performed automatically as soon
                                      *     as the prior conversion is completed */
        REFBURST_t  REFBURST;       /*! Reference burst.
                                      *  0  Reference buffer on continuously
                                      *  1  Reference buffer on only during sample-and-conversion */
        REFOUT_t    REFOUT;         /*! Reference output
                                      *  0  Reference output off
                                      *  1  Reference output on, use internal reference
                                            voltage externally on pin VREF+ */
        ADC10SR_t   ADC10SR;        /*! ADC10 sampling rate. This bit selects the reference buffer drive capability for
                                      * the maximum sampling rate. Setting ADC10SR reduces the current
                                      * consumption of the reference buffer.
                                      *  0  Reference buffer supports up to ~200 ksps
                                      *  1  Reference buffer supports up to ~50 ksps */
        ADC10SHT_t  ADC10SHT;       /*! ADC10 sample-and-hold time
                                      *  00  4 x ADC10CLKs
                                      *  01  8 x ADC10CLKs
                                      *  10  16 x ADC10CLKs
                                      *  11  64 x ADC10CLKs */
        SREF_t      SREF;           /*! Select reference
                                      *  000  VR+ = VCC and VR- = VSS
                                      *  001  VR+ = VREF+ and VR- = VSS
                                      *  010  VR+ = VeREF+ and VR- = VSS
                                      *  011  VR+ = Buffered VeREF+ and VR- = VSS
                                      *  100  VR+ = VCC and VR- = VREF-/ VeREF-
                                      *  101  VR+ = VREF+ and VR- = VREF-/ VeREF-
                                      *  110  VR+ = VeREF+ and VR- = VREF-/ VeREF-
                                      *  111  VR+ = Buffered VeREF+ and VR- = VREF-/ VeREF- */
    }

    /*!
     *  ======== ADC10CTL1_t ========
     *  ADC10 Control Register 1
     *
     *  @see #ADC10CTL1
     */
    struct ADC10CTL1_t {
        ADC10BUSY_t ADC10BUSY;      /*! ADC10 busy. This bit indicates an active sample or conversion operation
                                      *  0  No operation is active.
                                      *  1  A sequence, sample, or conversion is active. */
        CONSEQ_t    CONSEQ;         /*! Conversion sequence mode select
                                      *  00  Single-channel-single-conversion
                                      *  01  Sequence-of-channels
                                      *  10  Repeat-single-channel
                                      *  11  Repeat-sequence-of-channels */
        ADC10SSEL_t ADC10SSEL;      /*! ADC10 clock source select
                                      *  00  ADC10OSC
                                      *  01  ACLK
                                      *  10  MCLK
                                      *  11  SMCLK */
        ADC10DIV_t  ADC10DIV;       /*! ADC10 clock divider
                                      *  000  /1
                                      *  001  /2
                                      *  010  /3
                                      *  011  /4
                                      *  100  /5
                                      *  101  /6
                                      *  110  /7
                                      *  111  /8 */
        ISSH_t      ISSH;           /*! Invert signal sample-and-hold
                                      *  0  The sample-input signal is not inverted.
                                      *  1  The sample-input signal is inverted. */
        ADC10DF_t   ADC10DF;        /*! ADC10 data format
                                      *  0  Straight binary
                                      *  1  2s complement */
        SHS_t       SHS;            /*! Sample-and-hold source select
                                      *  00  ADC10SC bit
                                      *  01  Timer_A.OUT1
                                      *  10  Timer_A.OUT0
                                      *  11  Timer_A.OUT2 (Timer_A.OUT1 on MSP430x20x2 devices) */
        INCH_t      INCH;           /*! Input channel select. These bits select the channel for a single-conversion or
                                      * the highest channel for a sequence of conversions.
                                      *  0000  A0
                                      *  0001  A1
                                      *  0010  A2
                                      *  0011  A3
                                      *  0100  A4
                                      *  0101  A5
                                      *  0110  A6
                                      *  0111  A7
                                      *  1000  VeREF+
                                      *  1001  VREF-/VeREF-
                                      *  1010  Temperature sensor
                                      *  1011  (VCC � VSS) /
                                      *  1100  A12
                                      *  1101  A13
                                      *  1110  A14
                                      *  1111  A15 */
    }

    /*!
     *  ======== ADC10DTC0_t ========
     *  Data Transfer Control Register 0
     *
     *  @see #ADC10DTC0
     */
    struct ADC10DTC0_t {
        ADC10TB_t   ADC10TB;        /*! ADC10 two-block mode
                                      *  0  One-block transfer mode
                                      *  1  Two-block transfer mode */
        ADC10CT_t   ADC10CT;        /*! ADC10 continuous transfer
                                      *  0  Data transfer stops when one block (one-block mode) or two blocks
                                      *     (two-block mode) have completed.
                                      *  1  Data is transferred continuously. DTC operation is stopped only if
                                      *     ADC10CT cleared, or ADC10SA is written to. */
    }

instance:
    /*! Control Register 0 */
    config ADC10CTL0_t  ADC10CTL0 = {
        ADC10SC :   ADC10SC_OFF,
        ENC     :   ENC_OFF,
        ADC10IFG:   ADC10IFG_OFF,
        ADC10IE :   ADC10IE_OFF,
        ADC10ON :   ADC10ON_OFF,
        REFON   :   REFON_OFF,
        REF2_5V :   REF2_5V_OFF,
        MSC     :   MSC_OFF,
        REFBURST:   REFBURST_OFF,
        REFOUT  :   REFOUT_OFF,
        ADC10SR :   ADC10SR_OFF,
        ADC10SHT:   ADC10SHT_0,
        SREF    :   SREF_0
    };

    /*! Control Register 1 */
    config ADC10CTL1_t  ADC10CTL1 = {
        ADC10BUSY   :   ADC10BUSY_OFF,
        CONSEQ      :   CONSEQ_0,
        ADC10SSEL   :   ADC10SSEL_0,
        ADC10DIV    :   ADC10DIV_0,
        ISSH        :   ISSH_OFF,
        ADC10DF     :   ADC10DF_OFF,
        SHS         :   SHS_0,
        INCH        :   INCH_0
    };

    /*!
     *  Analog (Input) Enable Control Register 0
     *
     *  Bit n enables the corresponding pin for analog
     *  input. Bit 0 corresponds to A0, bit 1 corresponds to A1, ...
     */
    config Bits16 ADC10AE0 = 0;

    /*!
     *  Analog (Input) Enable Control Register 1
     *
     *  Bits 0, 1, 2, and 3 are reserved.
     *
     *  Starting with bit 4, bit n enables pin n+8 for analog
     *  input: Bit 4 corresponds to A12, bit 5 corresponds to A13, ...
     */
    config Bits16 ADC10AE1 = 0;

    /*! Data Transfer Control Register 0 */
    config ADC10DTC0_t ADC10DTC0 = {
        ADC10TB : ADC10TB_OFF,
        ADC10CT : ADC10CT_OFF
    };

    /*!
     *  Data Transfer Control Register 1
     *
     *  This register defines the number of transfers in each block: 0
     *  implies DTC is disabled, 1 through 0xff are valid transfer counts.
     */
    config Bits8  ADC10DTC1 = 0;

    /*! Data Transfer Start Address */
    config Bits16 *ADC10SA = 0x200;

    /*! ADC10 has 1 interrupt enable */
    config regIntVect_t interruptSource[1];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "ADC10CTL0" , regForceSet : false },
        { register : "ADC10CTL1" , regForceSet : false },
        { register : "ADC10AE0"  , regForceSet : false },
        { register : "ADC10AE1"  , regForceSet : false },
        { register : "ADC10DTC0" , regForceSet : false },
        { register : "ADC10DTC1" , regForceSet : false },
        { register : "ADC10SA"   , regForceSet : true }
    ];
}

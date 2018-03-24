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
 *  ======== BSCplus ========
 *  MSP430 Basic Clock System
 */
metaonly module BCSplus inherits IClock
{
    /*! MOD0 Bit */
    enum MOD0_t {
        MOD0_OFF = 0x00,    /*! Disable MOD0 bit */
        MOD0 = 0x01         /*! Enable MOD0 bit */
    };

    /*! MOD1 Bit */
    enum MOD1_t {
        MOD1_OFF = 0x00,    /*! Disable MOD1 bit */
        MOD1 = 0x02         /*! Enable MOD1 bit */
    };

    /*! MOD2 Bit */
    enum MOD2_t {
        MOD2_OFF = 0x00,    /*! Disable MOD2 bit */
        MOD2 = 0x04         /*! Enable MOD2 bit */
    };

    /*! MOD3 Bit */
    enum MOD3_t {
        MOD3_OFF = 0x00,    /*! Disable MOD3 bit */
        MOD3 = 0x08         /*! Enable MOD3 bit */
    };

    /*! MOD4 Bit */
    enum MOD4_t {
        MOD4_OFF = 0x00,    /*! Disable MOD4 bit */
        MOD4 = 0x10         /*! Enable MOD4 bit */
    };

    /*! DCO0 Bit */
    enum DCO0_t {
        DCO0_OFF = 0x00,    /*! Disable DCO0 bit */
        DCO0 = 0x20         /*! Enable DCO0 bit */
    };

    /*! DCO1 Bit */
    enum DCO1_t {
        DCO1_OFF = 0x00,    /*! Disable DCO1 bit */
        DCO1 = 0x40         /*! Enable DCO1 bit */
    };

    /*! DCO2 Bit */
    enum DCO2_t {
        DCO2_OFF = 0x00,    /*! Disable DCO2 bit */
        DCO2 = 0x80         /*! Enable DCO2 bit */
    };

    enum XT2OFF_t {
        XT2OFF_OFF = 0x00,  /*! Enable XT2CLK */
        XT2OFF = 0x80       /*! Disable XT2CLK */
    };

    enum XTS_t {
        XTS_OFF = 0x00,     /*! Low Frequency */
        XTS = 0x40          /*! High Frequency */
    };

    enum RSEL0_t {
        RSEL0_OFF = 0x00,   /*! Disable RSEL0 bit */
        RSEL0 = 0x01        /*! Enable RSEL0 bit */
    };

    enum RSEL1_t {
        RSEL1_OFF = 0x00,   /*! Disable RSEL1 bit */
        RSEL1 = 0x02        /*! Enable RSEL1 bit */
    };

    enum RSEL2_t {
        RSEL2_OFF = 0x00,   /*! Disable RSEL2 bit */
        RSEL2 = 0x04        /*! Enable RSEL2 bit */
    };

    enum RSEL3_t {
        RSEL3_OFF = 0x00,   /*! Disable RSEL3 bit */
        RSEL3 = 0x08        /*! Enable RSEL3 bit */
    };

    /*! MCLK Source Select */
    enum SELM_t {
        SELM_0 = 0x00,      /*! DCOCLK */
/*        SELM_1 = 0x40,       DCOCLK */
        SELM_2 = 0x80,      /*! XT2CLK/LFXTCLK */
        SELM_3 = 0xC0       /*! LFXTCLK */
    };

    /*! ACLK Divider values */
    enum DIVA_t {
        DIVA_0 = 0x00,      /*! Divide by 1 */
        DIVA_1 = 0x10,      /*! Divide by 2 */
        DIVA_2 = 0x20,      /*! Divide by 4 */
        DIVA_3 = 0x30       /*! Divide by 8 */
    };

    /*! MCLK Divider values */
    enum DIVM_t {
        DIVM_0 = 0x00,      /*! Divide by 1 */
        DIVM_1 = 0x10,      /*! Divide by 2 */
        DIVM_2 = 0x20,      /*! Divide by 4 */
        DIVM_3 = 0x30       /*! Divide by 8 */
    };

    /*! SMCLK Divider values */
    enum DIVS_t {
        DIVS_0 = 0x00,      /*! Divide by 1 */
        DIVS_1 = 0x02,      /*! Divide by 2 */
        DIVS_2 = 0x04,      /*! Divide by 4 */
        DIVS_3 = 0x06       /*! Divide by 8 */
    };

    enum SELS_t {
        SELS_OFF = 0x00,    /*! DCOCLK */
        SELS = 0x08         /*! XT2CLK when XT2 oscillator present. LFXT1CLK or VLOCLK when XT2 oscillator not present */
    };

    enum DCOR_t {
        DCOR_OFF = 0x00,    /*! DCO uses internal resistor */
        DCOR = 0x01         /*! DCO uses external resistor */
    };

    /*! XT2 frequency range select */
    enum XT2S_t {
        XT2S_0 = 0x00,      /*! 0.4 - 1 MHz */
        XT2S_1 = 0x40,      /*! 1 - 3 MHz */
        XT2S_2 = 0x80,      /*! 3 - 16 MHz */
        XT2S_3 = 0xC0       /*! Digital input signal */
    };

    enum LFXT1S_t {
        LFXT1S_0 = 0x00,    /*! If XTS = 0, XT1 = 32768kHz Crystal ; If XTS = 1, XT1 = 0.4 - 1-MHz crystal or resonator */
        LFXT1S_1 = 0x10,    /*! If XTS = 0, XT1 = Reserved ; If XTS = 1, XT1 = 1 - 3-MHz crystal or resonator */
        LFXT1S_2 = 0x20,    /*! If XTS = 0, XT1 = VLOCLK ; If XTS = 1, XT1 = 3 - 16-MHz crystal or resonator */
        LFXT1S_3 = 0x30     /*! If XTS = 0, XT1 = Digital External ; If XTS = 1, XT1 = 0.4 - 16-MHz Digital External */
    };

    enum XCAP_t {
        XCAP_0 = 0x00,      /*! ~1 pF */
        XCAP_1 = 0x04,      /*! ~6 pF */
        XCAP_2 = 0x08,      /*! ~10 pF */
        XCAP_3 = 0x0C       /*! ~12.5 pF */
    };

    enum XT2OF_t {
        XT2OF_OFF = 0x00,   /*! No fault condition present */
        XT2OF = 0x02        /*! XT2 fault condition present */
    };

    enum LFXT1OF_t {
        LFXT1OF_OFF = 0x00, /*! No fault condition present */
        LFXT1OF = 0x01      /*! LFXT1 fault condition present */
    };

    struct DCOCTL_t {
        MOD0_t    MOD0;     /*! Modulation Bit 0 */
        MOD1_t    MOD1;     /*! Modulation Bit 1 */
        MOD2_t    MOD2;     /*! Modulation Bit 2 */
        MOD3_t    MOD3;     /*! Modulation Bit 3 */
        MOD4_t    MOD4;     /*! Modulation Bit 4 */
        DCO0_t    DCO0;     /*! DCO Select Bit 0 */
        DCO1_t    DCO1;     /*! DCO Select Bit 1 */
        DCO2_t    DCO2;     /*! DCO Select Bit 2 */
    }

    /*!
     *  ======== BCSCTL1_t ========
     *  BCS Control Register 1
     *
     *  @field(XT2OFF)  This bit turns off the XT2 oscillator: 0 - XT2 is on,
     *                  1 - XT2 is off if it is not used for MCLK or SMCLK
     *
     *  @field(XTS)     0 - Low frequency mode; 1 - High frequency mode
     */
    struct BCSCTL1_t {
        XT2OFF_t  XT2OFF;       /*! XT2 off. This bit turns off the XT2 oscillator
                                  *  0  XT2 is on
                                  *  1  XT2 is off if it is not used for MCLK or SMCLK. */
        XTS_t     XTS;          /*! LFXT1 mode select.
                                   *  0  Low frequency mode
                                   *  1  High frequency mode */
        DIVA_t    DIVA;         /*! Divider for ACLK
                                  *  00  /1
                                  *  01  /2
                                  *  10  /4
                                  *  11  /8 */
        RSEL0_t   RSEL0;        /*! Range select bit 0 */
        RSEL1_t   RSEL1;        /*! Range select bit 1 */
        RSEL2_t   RSEL2;        /*! Range select bit 2 */
        RSEL3_t   RSEL3;        /*! Range select bit 3 */
    }

    /*!
     *  ======== BCSCTL2_t ========
     *  BCS Control Register 2
     *
     *  @field(SELM) These bits select the MCLK source.
     *  @field(SELS) These bits select the SMCLK source. When
     *               XT2 oscillator present, 0 selects DCOCLK and
     *               1 selects XT2CLK; otherwise 0 selects LFXT1CLK and
     *               1 selects VLOCLK.
     *  @field(DCOR) 0 - Internal resistor, 1 - external resistor
     */
    struct BCSCTL2_t {
        SELM_t    SELM;         /*! Select MCLK. These bits select the MCLK source.
                                  *  00  DCOCLK
                                  *  01  DCOCLK
                                  *  10  XT2CLK when XT2 oscillator present on-chip. LFXT1CLK or VLOCLK
                                  *      when XT2 oscillator not present on-chip.
                                  *  11  LFXT1CLK or VLOCLK */
        DIVM_t    DIVM;         /*! Divider for MCLK
                                  *  00  /1
                                  *  01  /2
                                  *  10  /4
                                  *  11  /8 */
        SELS_t    SELS;         /*! Select SMCLK. This bit selects the SMCLK source.
                                  *  0  DCOCLK
                                  *  1  XT2CLK when XT2 oscillator present. LFXT1CLK or VLOCLK when
                                  *     XT2 oscillator not present */
        DIVS_t    DIVS;         /*! Divider for SMCLK
                                  *  00  /1
                                  *  01  /2
                                  *  10  /4
                                  *  11  /8 */
        DCOR_t    DCOR;         /*! DCO resistor select
                                  *  0  Internal resistor
                                  *  1  External resistor */
    }

    /*!
     *  ======== BCSCTL3_t ========
     *  BCS Control register 3
     *
     *  @field(LFXT1S)  These bits select between LFXT1 and VLO and XTS = 0,
     *                  and select the frequency range for LFXT1 when XTS = 1
     *  @field(XCAP)    These bits select the effective capacitance seen by
     *                  the LFXT1 crystal when XTS = 0. If XTS = 1 or if
     *                  LFCT1Sx = 11, then XCAPx should be 00.
     */
    struct BCSCTL3_t {
        XT2S_t    XT2S;         /*! XT2 range select. These bits select the frequency range for XT2.
                                  *  00  0.4 - 1-MHz crystal or resonator
                                  *  01  1 - 3-MHz crystal or resonator
                                  *  10  3 - 16-MHz crystal or resonator
                                  *  11  Digital external 0.4 - 16-MHz clock source */
        LFXT1S_t  LFXT1S;       /*! Low-frequency clock select and LFXT1 range select. These bits select
                                  * between LFXT1 and VLO when XTS = 0, and select the frequency range
                                  * for LFXT1 when XTS = 1
                                  *
                                  *  When XTS = 0:
                                  *  00  32768 Hz Crystal on LFXT1
                                  *  01  Reserved
                                  *  10  VLOCLK (Reserved in MSP430x21x1 devices)
                                  *  11  Digital external clock source
                                  *
                                  *  When XTS = 1 (Not applicable for MSP430x20xx devices)
                                  *  00  0.4 - 1-MHz crystal or resonator
                                  *  01  1 - 3-MHz crystal or resonator
                                  *  10  3 - 16-MHz crystal or resonator
                                  *  11  Digital external 0.4 - 16-MHz clock source */
        XCAP_t    XCAP;         /*! Oscillator capacitor selection. These bits select the effective capacitance
                                  * seen by the LFXT1 crystal when XTS = 0. If XTS = 1 or if LFCT1Sx = 11
                                  * XCAPx should be 00.
                                  *  00  ~1 pF
                                  *  01  ~6 pF
                                  *  10  ~10 pF
                                  *  11  ~12.5 pF */
        XT2OF_t   XT2OF;        /*! XT2 oscillator fault
                                  *  0  No fault condition present
                                  *  1  Fault condition present */
        LFXT1OF_t LFXT1OF;      /*! LFXT1 oscillator fault
                                  *  0  No fault condition present
                                  *  1  Fault condition present */
    }

instance:

    /*! DCO Clock Frequency Control */
    config DCOCTL_t DCOCTL = {
        MOD0        : MOD0_OFF,
        MOD1        : MOD1_OFF,
        MOD2        : MOD2_OFF,
        MOD3        : MOD3_OFF,
        MOD4        : MOD4_OFF,
        DCO0        : DCO0,
        DCO1        : DCO1,
        DCO2        : DCO2_OFF,
    };

    /*! Basic Clock System Control 1 */
    config BCSCTL1_t  BCSCTL1 = {
        XT2OFF      : XT2OFF,
        XTS         : XTS_OFF,
        DIVA        : DIVA_0,
        RSEL0       : RSEL0,
        RSEL1       : RSEL1,
        RSEL2       : RSEL2,
        RSEL3       : RSEL3_OFF
    };

    /*! Basic Clock System Control 2 */
    config BCSCTL2_t  BCSCTL2 = {
        SELM        : SELM_0,
        DIVM        : DIVM_0,
        SELS        : SELS_OFF,
        DIVS        : DIVS_0,
        DCOR        : DCOR_OFF
    };

    /*! Basic Clock System Control 3 */
    config BCSCTL3_t  BCSCTL3 = {
        XT2S        : XT2S_0,
        LFXT1S      : LFXT1S_0,
        XCAP        : XCAP_1
    };

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "DCOCTL"  , regForceSet : false },
        { register : "BCSCTL1" , regForceSet : false },
        { register : "BCSCTL2" , regForceSet : false },
        { register : "BCSCTL3" , regForceSet : false }
    ];

    /*! Basic Clock System + pre-calibrated system frequency */
    config UInt preCalibratedValues = 0;

    /*!
     *  ======== preCalibratedValues truth table ========
     *
     *  hasAllCal = false
     *    UInt - Description
     *       0 - 1 MHz
     *       1 - Custom
     *
     *  hasAllCal = true
     *    UInt - Description
     *       0 - 1 MHz
     *       1 - 8 MHz
     *       2 - 12 MHz
     *       3 - 16 MHz
     *       4 - Custom
     */
    config String preCalibratedValuesItems[length];

    config float VLOCLKHz = 12000;
    config float WATCHCRYSTALCLKHz = 32768;
    config float LFXT1CLKHz = 0;
    config float XT2CLKHz = 0;

    /*!
     *  ======== enableXT2 ========
     *  Set whether XT2 is used on the device. This is different than hasXT2
     *  variable.
     */
    config Bool enableXT2 = false;
}

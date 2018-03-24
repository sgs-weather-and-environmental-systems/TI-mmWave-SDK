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
 *  ======== SD16_A ========
 *  MSP430F2xx Family SD16_A Module
 */
metaonly module SD16_A inherits IADC {

     /*! SD16XDIVx Bits */
     enum SD16XDIV_t {
         SD16XDIV_0 = 0x000,  /*! Divide by 1 */
         SD16XDIV_1 = 0x200,  /*! Divide by 3 */
         SD16XDIV_2 = 0x400,  /*! Divide by 16 */
         SD16XDIV_3 = 0x800   /*! Divide by 48 */
     };

     /*! SD16LP Bit */
     enum SD16LP_t {
         SD16LP_OFF = 0x000,  /*! Low-power mode is disabled */
         SD16LP = 0x100       /*! Low-power mode is enabled. The maximum clock frequency for the SD16_A is reduced */
     };

     /*! SD16DIVx Bits */
     enum SD16DIV_t {
         SD16DIV_0 = 0x00,  /*! Divide by 1 */
         SD16DIV_1 = 0x40,  /*! Divide by 2 */
         SD16DIV_2 = 0x80,  /*! Divide by 4 */
         SD16DIV_3 = 0xC0   /*! Divide by 8 */
     };

     /*! SD16SSELx Bits */
     enum SD16SSEL_t {
         SD16SSEL_0 = 0x00,  /*! MCLK */
         SD16SSEL_1 = 0x10,  /*! SMCLK */
         SD16SSEL_2 = 0x20,  /*! ACLK */
         SD16SSEL_3 = 0x30   /*! External TACLK */
     };

     /*! SD16VMIDON Bit */
     enum SD16VMIDON_t {
         SD16VMIDON_OFF = 0x00,  /*! Off */
         SD16VMIDON = 0x08       /*! On */
     };

     /*! SD16REFON Bit */
     enum SD16REFON_t {
         SD16REFON_OFF = 0x00,  /*! Reference off */
         SD16REFON = 0x04       /*! Reference on */
     };

     /*! SD16OVIE Bit */
     enum SD16OVIE_t {
         SD16OVIE_OFF = 0x00,  /*! Overflow interrupt disabled */
         SD16OVIE = 0x02       /*! Overflow interrupt enabled */
     };

     /*! SD16BUFx Bits */
     enum SD16BUF_t {
         SD16BUF_0 = 0x0000,  /*! Buffer disabled */
         SD16BUF_1 = 0x2000,  /*! Slow speed/current */
         SD16BUF_2 = 0x4000,  /*! Medium speed/current */
         SD16BUF_3 = 0x6000   /*! High speed/current */
     };

     /*! SD16UNI Bit */
     enum SD16UNI_t {
         SD16UNI_OFF = 0x0000,  /*! Bipolar mode */
         SD16UNI = 0x10000      /*! Unipolar mode */
     };

     /*! SD16XOSR Bit */
     enum SD16XOSR_t {
         SD16XOSR_OFF = 0x000,  /*! Extended oversampling ratio. This bit, along with the SD16OSRx bits,
                                 * select the oversampling ratio. See SD16OSRx bit description for settings */
         SD16XOSR = 0x800       /*! Extended oversampling ratio. This bit, along with the SD16OSRx bits,
                                 * select the oversampling ratio. See SD16OSRx bit description for settings */
     };

     /*! SD16SNGL Bit */
     enum SD16SNGL_t {
         SD16SNGL_OFF = 0x000,  /*! Continuous conversion mode */
         SD16SNGL = 0x400       /*! Single conversion mode */
     };

     /*! SD16OSRx Bits */
     enum SD16OSR_t {
         SD16OSR_256 = 0x000, /*! SD16XOSR = 0 */
         SD16OSR_128 = 0x100, /*! SD16XOSR = 0 */
         SD16OSR_64 = 0x200,  /*! SD16XOSR = 0 */
         SD16OSR_32 = 0x300,  /*! SD16XOSR = 0 */
         SD16OSR_512 = 0x800, /*! SD16XOSR = 1 */
         SD16OSR_1024 = 0x900 /*! SD16XOSR = 1 */
     };

     /*! SD16LSBTOG Bit */
     enum SD16LSBTOG_t {
         SD16LSBTOG_OFF = 0x00,  /*! SD16LSBACC does not toggle with each SD16MEM0 read */
         SD16LSBTOG = 0x80       /*! SD16LSBACC toggles with each SD16MEM0 read */
     };

     /*! SD16LSBACC Bit */
     enum SD16LSBACC_t {
         SD16LSBACC_OFF = 0x00,  /*! SD16MEMx contains the most significant 16-bits of the conversion */
         SD16LSBACC = 0x40       /*! SD16MEMx contains the least significant 16-bits of the conversion */
     };

     /*! SD16OVIFG Bit */
     enum SD16OVIFG_t {
         SD16OVIFG_OFF = 0x00,  /*! No overflow interrupt pending */
         SD16OVIFG = 0x20       /*! Overflow interrupt pending */
     };

     /*! SD16DF Bit */
     enum SD16DF_t {
         SD16DF_OFF = 0x00,  /*! Offset binary */
         SD16DF = 0x10       /*! 2's complement */
     };

     /*! SD16IE Bit */
     enum SD16IE_t {
         SD16IE_OFF = 0x00,  /*! Disabled */
         SD16IE = 0x08       /*! Enabled */
     };

     /*! SD16IFG Bit */
     enum SD16IFG_t {
         SD16IFG_OFF = 0x00,  /*! No interrupt pending */
         SD16IFG = 0x04       /*! Interrupt pending */
     };

     /*! SD16SC Bit */
     enum SD16SC_t {
         SD16SC_OFF = 0x00,  /*! No conversino start */
         SD16SC = 0x02       /*! Start conversion */
     };

     /*! SD16INTDLYx Bits */
     enum SD16INTDLY_t {
         SD16INTDLY_0 = 0x00,  /*! Fourth sample causes interrupt */
         SD16INTDLY_1 = 0x40,  /*! Third sample causes interrupt */
         SD16INTDLY_2 = 0x80,  /*! Second sample causes interrupt */
         SD16INTDLY_3 = 0xC0   /*! First sample causes interrupt */
     };

     /*! SD16GAINx Bits */
     enum SD16GAIN_t {
         SD16GAIN_1 = 0x00,  /*! Multiply by 1 */
         SD16GAIN_2 = 0x08,  /*! Multiply by 2 */
         SD16GAIN_4 = 0x10,  /*! Multiply by 4 */
         SD16GAIN_8 = 0x18,  /*! Multiply by 8 */
         SD16GAIN_16 = 0x20,  /*! Multiply by 16 */
         SD16GAIN_32 = 0x28   /*! Multiply by 32 */
     };

     /*! SD16INCHx Bits */
     enum SD16INCH_t {
         SD16INCH_0 = 0x000,  /*! A0 */
         SD16INCH_1 = 0x001,  /*! A1 */
         SD16INCH_2 = 0x010,  /*! A2 */
         SD16INCH_3 = 0x011,  /*! A3 */
         SD16INCH_4 = 0x100,  /*! A4 */
         SD16INCH_5 = 0x101,  /*! A5 - (AVcc - AVss)/11 */
         SD16INCH_6 = 0x110,  /*! A6 - Temperature Sensor */
         SD16INCH_7 = 0x111   /*! A7 - Short PGA offset measurement */
     };


    /*! SD16_A Analog Enable Bit 7 */
    enum SD16AE7_t {
        SD16AE7_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE7     = 0x0080   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 6 */
    enum SD16AE6_t {
        SD16AE6_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE6     = 0x0040   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 5 */
    enum SD16AE5_t {
        SD16AE5_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE5     = 0x0020   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 4 */
    enum SD16AE4_t {
        SD16AE4_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE4     = 0x0010   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 3 */
    enum SD16AE3_t {
        SD16AE3_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE3     = 0x0008   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 2 */
    enum SD16AE2_t {
        SD16AE2_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE2     = 0x0004   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 1 */
    enum SD16AE1_t {
        SD16AE1_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE1     = 0x0002   /*! External input enabled */
    };

    /*! SD16_A Analog Enable Bit 0 */
    enum SD16AE0_t {
        SD16AE0_OFF = 0x0000,  /*! External input disabled. Negative inputs are internally connected to VSS. */
        SD16AE0     = 0x0001   /*! External input enabled */
    };

    /*! SD16_A Interrupt */
    enum SD16IV_SD16OVIFG_t {
        SD16IV_SD16OVIFG_OFF = 0x0000,  /*! No Interrupt pending */
        SD16IV_SD16OVIFG     = 0x0002   /*! SD16OVIFG */
    };

    /*! SD16_A SD16MEMx overflow */
    enum SD16IV_SD16MEM0_t {
        SD16IV_SD16MEM0_OFF = 0x0000,  /*! No Interrupt pending */
        SD16IV_SD16MEM0     = 0x0004   /*! SD16MEM0 SD16IFG */
    };

    /*! SD16CTL Register */
    struct SD16CTL_t {
        SD16XDIV_t SD16XDIV;     /*! SD16_A clock divider
                                  * 000 Divide by 1
                                  * 001 Divide by 3
                                  * 010 Divide by 16
                                  * 011 Divide by 48
                                  * 1xx Reserved */
        SD16LP_t SD16LP;         /*! Low power mode. This bit selects a reduced speed, reduced power mode
                                  * 0 Low-power mode is disabled
                                  * 1 Low-power mode is enabled. The maximum clock frequency for the
                                  *  SD16_A is reduced. */
        SD16DIV_t SD16DIV;       /*! SD16_A clock divider
                                  * 00 Divide by 1
                                  * 01 Divide by 2
                                  * 10 Divide by 4
                                  * 11 Divide by 8 */
        SD16SSEL_t SD16SSEL;     /*! SD16_A clock source select
                                  * 00 MCLK
                                  * 01 SMCLK
                                  * 10 ACLK
                                  * External TACLK */
        SD16VMIDON_t SD16VMIDON; /*! VMID buffer on
                                  * 0 Off
                                  * 1 On */
        SD16REFON_t SD16REFON;   /*! Reference generator on
                                  * 0 Reference off
                                  * 1 Reference on */
        SD16OVIE_t SD16OVIE;     /*! SD16_A overflow interrupt enable. The GIE bit must also be set to enable the
                                  * interrupt.
                                  * 0 Overflow interrupt disabled
                                  * 1 Overflow interrupt enabled */
    };

    /*! SD16CCTL0 Register */
    struct SD16CCTL0_t {
        SD16UNI_t SD16UNI;       /*! Unipolar mode select
                                  * 0 Bipolar mode
                                  * 1 Unipolar mode */
        SD16XOSR_t SD16XOSR;     /*! Extended oversampling ratio. This bit, along with the SD16OSRx bits,
                                  * select the oversampling ratio. See SD16OSRx bit description for settings. */
        SD16SNGL_t SD16SNGL;     /*! Single conversion mode select
                                  * 0 Continuous conversion mode
                                  * 1 Single conversion mode */
        SD16OSR_t SD16OSR;       /*! Oversampling ratio
                                  * When SD16XOSR = 0
                                  * 00 256
                                  * 01 128
                                  * 10 64
                                  * 11 32
                                  * When SD16XOSR = 1
                                  * 00 512
                                  * 01 1024
                                  * 10 Reserved
                                  * 11 Reserved */
        SD16LSBTOG_t SD16LSBTOG; /*! LSB toggle. This bit, when set, causes SD16LSBACC to toggle each time
                                  * the SD16MEM0 register is read.
                                  * 0 SD16LSBACC does not toggle with each SD16MEM0 read
                                  * 1 SD16LSBACC toggles with each SD16MEM0 read */
        SD16LSBACC_t SD16LSBACC; /*! LSB access. This bit allows access to the upper or lower 16-bits of the
                                  * SD16_A conversion result.
                                  * 0 SD16MEMx contains the most significant 16-bits of the conversion.
                                  * 1 SD16MEMx contains the least significant 16-bits of the conversion. */
        SD16OVIFG_t SD16OVIFG;   /*! SD16_A overflow interrupt flag
                                  * 0 No overflow interrupt pending
                                  * 1 Overflow interrupt pending */
        SD16DF_t SD16DF;         /*! SD16_A data format
                                  * 0 Offset binary
                                  * 1 2's complement */
        SD16IE_t SD16IE;         /*! SD16_A interrupt enable
                                  * 0 Disabled
                                  * 1 Enabled */
        SD16IFG_t SD16IFG;       /*! SD16_A interrupt flag. SD16IFG is set when new conversion results are
                                  * available. SD16IFG is automatically reset when the corresponding
                                  * SD16MEMx register is read, or may be cleared with software.
                                  * 0 No interrupt pending
                                  * 1 Interrupt pending */
        SD16SC_t SD16SC;         /*! SD16_A start conversion
                                  * 0 No conversion start
                                  * 1 Start conversion */
    };

    /*! SD16INCTL0 Register */
    struct SD16INCTL0_t {
        SD16INTDLY_t SD16INTDLY;  /*! Interrupt delay generation after conversion start. These bits select the
                                   * delay for the first interrupt after conversion start.
                                   * 00 Fourth sample causes interrupt
                                   * 01 Third sample causes interrupt
                                   * 10 Second sample causes interrupt
                                   * 11 First sample causes interrupt */

        SD16GAIN_t SD16GAIN;      /*! SD16_A preamplifier gain
                                   * 000 Multiply by 1
                                   * 001 Multiply by 2
                                   * 010 Multiply by 4
                                   * 011 Multiply by 8
                                   * 100 Multiply by 16
                                   * 101 Multiply by 32
                                   * 110 Reserved
                                   * 111 Reserved */

        SD16INCH_t SD16INCH;      /*! SD16_A channel differential pair input
                                   * 000 A0
                                   * 001 A1
                                   * 010 A2
                                   * 011 A3
                                   * 100 A4
                                   * 101 A5-- (AVCC -- AVSS) / 11
                                   * 110 A6 -- Temperature Sensor
                                   * 111 A7 -- Short for PGA offset measurement */
    };

    /*! SD16_A Analog Input Enable Register */
    struct SD16AE_t {
         SD16AE0_t SD16AE0; /*! SD16_A analog enable
                             * 0 External input disabled. Negative inputs are internally connected to
                             *   VSS.
                             * 1 External input enabled */
         SD16AE1_t SD16AE1; /*! SD16_A analog enable
                             * 0 External input disabled. Negative inputs are internally connected to
                             *   VSS.
                             * 1 External input enabled */
        SD16AE2_t SD16AE2; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
        SD16AE3_t SD16AE3; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
        SD16AE4_t SD16AE4; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
        SD16AE5_t SD16AE5; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
        SD16AE6_t SD16AE6; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
        SD16AE7_t SD16AE7; /*! SD16_A analog enable
                            * 0 External input disabled. Negative inputs are internally connected to
                            *   VSS.
                            * 1 External input enabled */
    };

instance:

    /*! SD16CTL Register */
    config SD16CTL_t SD16CTL = {
        SD16XDIV    : SD16XDIV_0,
        SD16LP      : SD16LP_OFF,
        SD16DIV     : SD16DIV_0,
        SD16SSEL    : SD16SSEL_0,
        SD16VMIDON  : SD16VMIDON_OFF,
        SD16REFON   : SD16REFON_OFF,
        SD16OVIE    : SD16OVIE_OFF
    };

    /*! SD16CCTL0 Register */
    config SD16CCTL0_t SD16CCTL0 = {
        SD16UNI     : SD16UNI_OFF,
        SD16XOSR    : SD16XOSR_OFF,
        SD16SNGL    : SD16SNGL_OFF,
        SD16OSR     : SD16OSR_256,
        SD16LSBTOG  : SD16LSBTOG_OFF,
        SD16LSBACC  : SD16LSBACC_OFF,
        SD16OVIFG   : SD16OVIFG_OFF,
        SD16DF      : SD16DF_OFF,
        SD16IE      : SD16IE_OFF,
        SD16IFG     : SD16IFG_OFF,
        SD16SC      : SD16SC_OFF
    };

    /*! SD16INCTL0 Register */
    config SD16INCTL0_t SD16INCTL0 = {
        SD16INTDLY  : SD16INTDLY_0,
        SD16GAIN    : SD16GAIN_1,
        SD16INCH    : SD16INCH_0
    };

    /*! SD16AE Register */
    config SD16AE_t SD16AE = {
        SD16AE0 : SD16AE0_OFF,
        SD16AE1 : SD16AE1_OFF,
        SD16AE2 : SD16AE2_OFF,
        SD16AE3 : SD16AE3_OFF,
        SD16AE4 : SD16AE4_OFF,
        SD16AE5 : SD16AE5_OFF,
        SD16AE6 : SD16AE6_OFF,
        SD16AE7 : SD16AE7_OFF
    };

    /*! SD16IV Register */
    config Bits16 SD16IV = SD16IV_SD16OVIFG_OFF;

    /*! SD16MEM0 Register */
    config Bits16 SD16MEM0 = SD16IV_SD16MEM0_OFF;

    /*! ADC10 has 1 interrupt enable */
    config regIntVect_t interruptSource[2];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "SD16CTL" , regForceSet : false },
        { register : "SD16CCTL0" , regForceSet : false },
        { register : "SD16INCTL0" , regForceSet : false },
        { register : "SD16AE" , regForceSet : false },
        { register : "SD16IV" , regForceSet : false },
        { register : "SD16MEM0" , regForceSet : false }
    ];
}

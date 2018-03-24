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
 *  ======== ADC12 ========
 *  MSP430 12-bit Analog to Digital Converter
 */
metaonly module ADC12 inherits IADC {

    /*! SHT1 Bits */
    enum ADC12SHT1_t {
        SHT1_0  = (0*0x1000u), /*! 4 ADC12CLK cycles */
        SHT1_1  = (1*0x1000u), /*! 8 ADC12CLK cycles */
        SHT1_2  = (2*0x1000u), /*! 16 ADC12CLK cycles */
        SHT1_3  = (3*0x1000u), /*! 32 ADC12CLK cycles */
        SHT1_4  = (4*0x1000u), /*! 64 ADC12CLK cycles */
        SHT1_5  = (5*0x1000u), /*! 96 ADC12CLK cycles */
        SHT1_6  = (6*0x1000u), /*! 128 ADC12CLK cycles */
        SHT1_7  = (7*0x1000u), /*! 192 ADC12CLK cycles */
        SHT1_8  = (8*0x1000u), /*! 256 ADC12CLK cycles */
        SHT1_9  = (9*0x1000u), /*! 384 ADC12CLK cycles */
        SHT1_10 = (10*0x1000u), /*! 512  ADC12CLK cycles */
        SHT1_11 = (11*0x1000u), /*! 768 ADC12CLK cycles */
        SHT1_12 = 12*0x1000u    /*! 1024 ADC12CLK cycles */
    };

    /*! SHT0 Bits */
    enum ADC12SHT0_t {
        SHT0_0  = (0*0x1000u), /*! 4 ADC12CLK cycles */
        SHT0_1  = (1*0x1000u), /*! 8 ADC12CLK cycles */
        SHT0_2  = (2*0x1000u), /*! 16 ADC12CLK cycles */
        SHT0_3  = (3*0x1000u), /*! 32 ADC12CLK cycles */
        SHT0_4  = (4*0x1000u), /*! 64 ADC12CLK cycles */
        SHT0_5  = (5*0x1000u), /*! 96 ADC12CLK cycles */
        SHT0_6  = (6*0x1000u), /*! 128 ADC12CLK cycles */
        SHT0_7  = (7*0x1000u), /*! 192 ADC12CLK cycles */
        SHT0_8  = (8*0x1000u), /*! 256 ADC12CLK cycles */
        SHT0_9  = (9*0x1000u), /*! 384 ADC12CLK cycles */
        SHT0_10 = (10*0x1000u), /*! 512  ADC12CLK cycles */
        SHT0_11 = (11*0x1000u), /*! 768 ADC12CLK cycles */
        SHT0_12 = 12*0x1000u    /*! 1024 ADC12CLK cycles */
    };

    /*! MSC Bit */
    enum MSC_t {
        MSC_OFF = 0x000,       /*! The sampling timer requires a rising edge of the SHI
                                *  signal to trigger each sample-and-conversion */
        MSC     = 0x080        /*! The first rising edge of the SHI signal triggers
                                *  the sampling timer, but further sample-and-conversions
                                *  are performed automatically as soon as the prior conversion
                                *  is completed */
    };

    /*! REF2_5V Bit */
    enum REF2_5V_t {
        REF2_5V_OFF = 0x000,   /*! 1.5V */
        REF2_5V     = 0x040    /*! 2.5V */
    };

    /*! REFON Bit */
    enum REFON_t {
        REFON_OFF   = 0x000,   /*! Reference off */
        REFON       = 0x020    /*! Reference on */
    };

    /*! ADC12ON Bit */
    enum ADC12ON_t {
        ADC12ON_OFF = 0x000,   /*! ADC12 off */
        ADC12ON     = 0x010    /*! ADC12 on */
    };

    /*! ADC12OVIE Bit */
    enum ADC12OVIE_t {
        ADC12OVIE_OFF = 0x000,   /*! Overflow interrupt disabled */
        ADC12OVIE     = 0x008    /*! Overflow interrupt enabled */
    };

    /*! ADC12TOVIE Bit */
    enum ADC12TOVIE_t {
        ADC12TOVIE_OFF = 0x000,   /*! Conversion time overflow interrupt disabled */
        ADC12TOVIE     = 0x004    /*! Conversion time overflow interrupt disabled */
    };

    /*! ENC Bit */
    enum ENC_t {
        ENC_OFF = 0x000,  /*! ADC12 disabled */
        ENC     = 0x002   /*! ADC12 enabled */
    };

    /*! ADC12SC Bit */
    enum ADC12SC_t {
        ADC12SC_OFF = 0x000,  /*! No sample-and-conversion-start */
        ADC12SC     = 0x001   /*! Start sample-and-conversion */
    };

    /*! CSTARTADD Bits */
    enum CSTARTADD_t {
        CSTARTADD_0  = (0*0x1000u), /*! ADC12MEM0 */
        CSTARTADD_1  = (1*0x1000u), /*! ADC12MEM1 */
        CSTARTADD_2  = (2*0x1000u), /*! ADC12MEM2 */
        CSTARTADD_3  = (3*0x1000u), /*! ADC12MEM3 */
        CSTARTADD_4  = (4*0x1000u), /*! ADC12MEM4 */
        CSTARTADD_5  = (5*0x1000u), /*! ADC12MEM5 */
        CSTARTADD_6  = (6*0x1000u), /*! ADC12MEM6 */
        CSTARTADD_7  = (7*0x1000u), /*! ADC12MEM7 */
        CSTARTADD_8  = (8*0x1000u), /*! ADC12MEM8 */
        CSTARTADD_9  = (9*0x1000u), /*! ADC12MEM9 */
        CSTARTADD_10 = (10*0x1000u), /*! ADC12MEM10 */
        CSTARTADD_11 = (11*0x1000u), /*! ADC12MEM11 */
        CSTARTADD_12 = (12*0x1000u), /*! ADC12MEM12 */
        CSTARTADD_13 = (13*0x1000u), /*! ADC12MEM13 */
        CSTARTADD_14 = (14*0x1000u), /*! ADC12MEM14 */
        CSTARTADD_15 = 15*0x1000u    /*! ADC12MEM15 */
    };

    /*! SHS Bits */
    enum SHS_t {
        SHS_0 = (0*0x400u),    /*! ADC12SC bit */
        SHS_1 = (1*0x400u),    /*! Timer_A.OUT1 */
        SHS_2 = (2*0x400u),    /*! Timer_B.OUT0 */
        SHS_3 = 3*0x400u       /*! Timer_B.OUT1 */
    };

    /*! SHP Bits */
    enum SHP_t {
        SHP_OFF = 0x0000,  /*! SAMPCON signal is sourced from the sample-input signal */
        SHP     = 0x0200   /*! SAMPCON signal is sourced from the sampling timer. */
    };

    /*! ISSH Bits */
    enum ISSH_t {
        ISSH_OFF = 0x0000,  /*! The sample-input signal is not inverted */
        ISSH     = 0x0100   /*! The sample-input signal is inverted */
    };


    /*! ADC12DIV Bits */
    enum ADC12DIV_t {
        ADC12DIV_0 = (0*0x20u),    /*! Divide by 1 */
        ADC12DIV_1 = (1*0x20u),    /*! Divide by 2 */
        ADC12DIV_2 = (2*0x20u),    /*! Divide by 3 */
        ADC12DIV_3 = (3*0x20u),    /*! Divide by 4 */
        ADC12DIV_4 = (4*0x20u),    /*! Divide by 5 */
        ADC12DIV_5 = (5*0x20u),    /*! Divide by 6 */
        ADC12DIV_6 = (6*0x20u),    /*! Divide by 7 */
        ADC12DIV_7 = 7*0x20u       /*! Divide by 8 */
    };

    /*! ADC12SSEL Bits */
    enum ADC12SSEL_t {
        ADC12SSEL_0 = (0*8u),   /*! ADC12OSC */
        ADC12SSEL_1 = (1*8u),   /*! ACLK */
        ADC12SSEL_2 = (2*8u),   /*! MCLK */
        ADC12SSEL_3 = 3*8u      /*! SMCLK */
    };

    /*! CONSEQ Bits */
    enum CONSEQ_t {
        CONSEQ_0 = (0*2u),       /*! Single channel single conversion */
        CONSEQ_1 = (1*2u),       /*! Sequence of channels */
        CONSEQ_2 = (2*2u),       /*! Repeat single channel */
        CONSEQ_3 = 3*2u          /*! Repeat sequence of channels */
    };

    /*! ADC12 Busy Bit */
    enum ADC12BUSY_t {
        ADC12BUSY_OFF = 0x0000,
        ADC12BUSY     = 0x0001
    };

    /*! EOS Bit */
    enum EOS_t {
        EOS_OFF = 0x0000,  /*! Not end of sequence */
        EOS     = 0x0080   /*! End of sequence */
    };

    /*! SREF Bits */
    enum SREF_t {
        SREF_0 = (0*0x10u),    /*! VR+ = AVcc and VR-- = AVss */
        SREF_1 = (1*0x10u),    /*! VR+ = VREF+ and VR-- = AVss */
        SREF_2 = (2*0x10u),    /*! VR+ = VeREF+ and VR-- = AVss */
        SREF_3 = (3*0x10u),    /*! VR+ = VeREF+ and VR-- = AVss */
        SREF_4 = (4*0x10u),    /*! VR+ = AVcc and VR-- = VREF--/ VeREF-- */
        SREF_5 = (5*0x10u),    /*! VR+ = VREF+ and VR-- = VREF--/ VeREF-- */
        SREF_6 = (6*0x10u),    /*! VR+ = VeREF+ and VR-- = VREF--/ VeREF-- */
        SREF_7 = 7*0x10u       /*! VR+ = VeREF+ and VR-- = VREF--/ VeREF-- */
    };

    /*! ADC12 Interrupt Enable Bit 15 */
    enum ADC12IE15_t {
        ADC12IE15_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG15 bit */
        ADC12IE15     = 0x8000   /*! Enable the interrupt request for the ADC12IFG15 bit */
    };

    /*! ADC12 Interrupt Enable Bit 14 */
    enum ADC12IE14_t {
        ADC12IE14_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG14 bit */
        ADC12IE14     = 0x4000   /*! Enable the interrupt request for the ADC12IFG14 bit */
    };

    /*! ADC12 Interrupt Enable Bit 13 */
    enum ADC12IE13_t {
        ADC12IE13_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG13 bit */
        ADC12IE13     = 0x2000   /*! Enable the interrupt request for the ADC12IFG13 bit */
    };

    /*! ADC12 Interrupt Enable Bit 12 */
    enum ADC12IE12_t {
        ADC12IE12_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG12 bit */
        ADC12IE12     = 0x1000   /*! Enable the interrupt request for the ADC12IFG12 bit */
    };

    /*! ADC12 Interrupt Enable Bit 11 */
    enum ADC12IE11_t {
        ADC12IE11_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG11 bit */
        ADC12IE11     = 0x0800   /*! Enable the interrupt request for the ADC12IFG11 bit */
    };

    /*! ADC12 Interrupt Enable Bit 10 */
    enum ADC12IE10_t {
        ADC12IE10_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG10 bit */
        ADC12IE10     = 0x0400   /*! Enable the interrupt request for the ADC12IFG10 bit */
    };

    /*! ADC12 Interrupt Enable Bit 9 */
    enum ADC12IE9_t {
        ADC12IE9_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG9 bit */
        ADC12IE9     = 0x0200   /*! Enable the interrupt request for the ADC12IFG9 bit */
    };

    /*! ADC12 Interrupt Enable Bit 8 */
    enum ADC12IE8_t {
        ADC12IE8_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG8 bit */
        ADC12IE8     = 0x0100   /*! Enable the interrupt request for the ADC12IFG8 bit */
    };

    /*! ADC12 Interrupt Enable Bit 7 */
    enum ADC12IE7_t {
        ADC12IE7_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG7 bit */
        ADC12IE7     = 0x0080   /*! Enable the interrupt request for the ADC12IFG7 bit */
    };

    /*! ADC12 Interrupt Enable Bit 6 */
    enum ADC12IE6_t {
        ADC12IE6_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG6 bit */
        ADC12IE6     = 0x0040   /*! Enable the interrupt request for the ADC12IFG6 bit */
    };

    /*! ADC12 Interrupt Enable Bit 5 */
    enum ADC12IE5_t {
        ADC12IE5_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG5 bit */
        ADC12IE5     = 0x0020   /*! Enable the interrupt request for the ADC12IFG5 bit */
    };

    /*! ADC12 Interrupt Enable Bit 4 */
    enum ADC12IE4_t {
        ADC12IE4_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG4 bit */
        ADC12IE4     = 0x0010   /*! Enable the interrupt request for the ADC12IFG4 bit */
    };

    /*! ADC12 Interrupt Enable Bit 3 */
    enum ADC12IE3_t {
        ADC12IE3_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG3 bit */
        ADC12IE3     = 0x0008   /*! Enable the interrupt request for the ADC12IFG3 bit */
    };

    /*! ADC12 Interrupt Enable Bit 2 */
    enum ADC12IE2_t {
        ADC12IE2_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG2 bit */
        ADC12IE2     = 0x0004   /*! Enable the interrupt request for the ADC12IFG2 bit */
    };

    /*! ADC12 Interrupt Enable Bit 1 */
    enum ADC12IE1_t {
        ADC12IE1_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG1 bit */
        ADC12IE1     = 0x0002   /*! Enable the interrupt request for the ADC12IFG1 bit */
    };

    /*! ADC12 Interrupt Enable Bit 0 */
    enum ADC12IE0_t {
        ADC12IE0_OFF = 0x0000,  /*! Disable the interrupt request for the ADC12IFG0 bit */
        ADC12IE0     = 0x0001   /*! Enable the interrupt request for the ADC12IFG0 bit */
    };

    /*! INCH Bits */
    enum INCH_t {
        INCH_0 = (0),       /*! A0 */
        INCH_1 = (1),       /*! A1 */
        INCH_2 = (2),       /*! A2 */
        INCH_3 = (3),       /*! A3 */
        INCH_4 = (4),       /*! A4 */
        INCH_5 = (5),       /*! A5 */
        INCH_6 = (6),       /*! A6 */
        INCH_7 = (7),       /*! A7 */
        INCH_8 = (8),       /*! VeREF+ */
        INCH_9 = (9),       /*! VREF--/VeREF- */
        INCH_10 = (10),     /*! Temperature diode */
        INCH_11 = (11),     /*! (AVcc - AVss) / 2 */
        INCH_12 = (12),     /*! GND */
        INCH_13 = (13),     /*! GND */
        INCH_14 = (14),     /*! GND */
        INCH_15 = 15        /*! GND */
    };


    /*! ADC12IV Definitions */
    enum ADC12IV_t {
        ADC12IV_NONE        =  (0x0000),  /*! No Interrupt pending */
        ADC12IV_ADC12OVIFG  =  (0x0002),  /*! ADC12OVIFG */
        ADC12IV_ADC12TOVIFG =  (0x0004),  /*! ADC12TOVIFG */
        ADC12IV_ADC12IFG0   =  (0x0006),  /*! ADC12IFG0 */
        ADC12IV_ADC12IFG1   =  (0x0008),  /*! ADC12IFG1 */
        ADC12IV_ADC12IFG2   =  (0x000A),  /*! ADC12IFG2 */
        ADC12IV_ADC12IFG3   =  (0x000C),  /*! ADC12IFG3 */
        ADC12IV_ADC12IFG4   =  (0x000E),  /*! ADC12IFG4 */
        ADC12IV_ADC12IFG5   =  (0x0010),  /*! ADC12IFG5 */
        ADC12IV_ADC12IFG6   =  (0x0012),  /*! ADC12IFG6 */
        ADC12IV_ADC12IFG7   =  (0x0014),  /*! ADC12IFG7 */
        ADC12IV_ADC12IFG8   =  (0x0016),  /*! ADC12IFG8 */
        ADC12IV_ADC12IFG9   =  (0x0018),  /*! ADC12IFG9 */
        ADC12IV_ADC12IFG10  =  (0x001A),  /*! ADC12IFG10 */
        ADC12IV_ADC12IFG11  =  (0x001C),  /*! ADC12IFG11 */
        ADC12IV_ADC12IFG12  =  (0x001E),  /*! ADC12IFG12 */
        ADC12IV_ADC12IFG13  =  (0x0020),  /*! ADC12IFG13 */
        ADC12IV_ADC12IFG14  =  (0x0022),  /*! ADC12IFG14 */
        ADC12IV_ADC12IFG15  =  0x0024     /*! ADC12IFG15 */
    };

    /*! ADC12 Control Register 0 */
    struct ADC12CTL0_t {
        ADC12SHT1_t ADC12SHT1;  /*! Sample-and-hold time. These bits define the number
                                 * of ADC12CLK cycles in the sampling period for registers
                                 * ADC12MEM8 to ADC12MEM15. */
        ADC12SHT0_t ADC12SHT0;  /*! Sample-and-hold time. These bits define the number
                                 * of ADC12CLK cycles in the sampling period for registers
                                 * ADC12MEM0 to ADC12MEM7. */
        MSC_t MSC;              /*! Multiple sample and conversion. Valid only for sequence
                                 * or repeated modes.
                                 * 0 The sampling timer requires a rising edge of the SHI signal
                                 *   to trigger each sample-and-conversion.
                                 * 1 The first rising edge of the SHI signal triggers the sampling
                                 *   timer, but further sample-and-conversions are performed
                                 *   automatically as soon as the prior conversion is completed. */
        REF2_5V_t REF2_5V;      /*! Reference generator voltage. REFON must also be set.
                                 * 0 1.5V
                                 * 1 2.5V */
        REFON_t REFON;          /*! Reference generator on
                                 * 0 Reference off
                                 * 1 Reference on */
        ADC12ON_t ADC12ON;      /*! ADC12 on
                                 * 0 ADC12 off
                                 * 1 ADC12 on */
        ADC12OVIE_t ADC12OVIE;  /*! ADC12MEMx overflow-interrupt enable. The GIE bit must also be
                                 * set to enable the interrupt.
                                 * 0 Overflow interrupt disabled
                                 * 1 Overflow interrupt enabled */
        ADC12TOVIE_t ADC12TOVIE;  /*! ADC12 conversion-time-overflow interrupt enable.
                                   * The GIE bit must also be set to enable the interrupt.
                                   * 0 Conversion time overflow interrupt disabled
                                   * 1 Conversion time overflow interrupt enabled */
        ENC_t ENC;               /*! Enable conversion
                                  * 0 ADC12 disabled
                                  * 1 ADC12 enabled */
        ADC12SC_t ADC12SC;       /*! Start conversion. Software-controlled sample-and-conversion start.
                                  * ADC12SC and ENC may be set together with one instruction. ADC12SC is
                                  * reset automatically.
                                  * 0 No sample-and-conversion-start
                                  * 1 Start sample-and-conversion */
    };

    /*! ADC12 Control Register 1 */
    struct ADC12CTL1_t {
        CSTARTADD_t CSTARTADD;  /*! Conversion start address. These bits select which ADC12
                                 * conversion-memory register is used for a single conversion or for the first
                                 * conversion in a sequence. The value of CSTARTADDx is 0 to 0Fh,
                                 * corresponding to ADC12MEM0 to ADC12MEM15. */
        SHS_t SHS;              /*! Sample-and-hold source select
                                 * 00 ADC12SC bit
                                 * 01 Timer_A.OUT1
                                 * 10 Timer_B.OUT0
                                 * 11 Timer_B.OUT1 */
        SHP_t SHP;              /*! Sample-and-hold pulse-mode select. This bit selects the source of the
                                 * sampling signal (SAMPCON) to be either the output of the sampling timer or
                                 * the sample-input signal directly.
                                 * 0 SAMPCON signal is sourced from the sample-input signal.
                                 * 1 SAMPCON signal is sourced from the sampling timer. */
        ISSH_t ISSH;            /*! Invert signal sample-and-hold
                                 * 0 The sample-input signal is not inverted.
                                 * 1 The sample-input signal is inverted. */
        ADC12DIV_t ADC12DIV;    /*! ADC12 clock divider
                                 * 000 /1
                                 * 001 /2
                                 * 010 /3
                                 * 011 /4
                                 * 100 /5
                                 * 101 /6
                                 * 110 /7
                                 * 111 /8 */
        ADC12SSEL_t ADC12SSEL;  /*! ADC12 clock source select
                                 * 00 ADC12OSC
                                 * 01 ACLK
                                 * 10 MCLK
                                 * 11 SMCLK */
        CONSEQ_t CONSEQ;        /*! Conversion sequence mode select
                                 * 00 Single-channel, single-conversion
                                 * 01 Sequence-of-channels
                                 * 10 Repeat-single-channel
                                 * 11 Repeat-sequence-of-channels */
        ADC12BUSY_t ADC12BUSY;  /*! ADC12 busy. This bit indicates an active sample or conversion operation.
                                 * 0 No operation is active.
                                 * 1 A sequence, sample, or conversion is active. */
    };

    /*! ADC12 Conversion Memory Control Registers */
    struct ADC12MCTL_t {
        EOS_t EOS;              /*! End of sequence. Indicates the last conversion in a sequence.
                                 * 0 Not end of sequence
                                 * 1 End of sequence */
        SREF_t SREF;            /*! Select reference
                                 * 000 VR+ = AVCC and VR-- = AVSS
                                 * 001 VR+ = VREF+ and VR-- = AVSS
                                 * 010 VR+ = VeREF+ and VR-- = AVSS
                                 * 011 VR+ = VeREF+ and VR-- = AVSS
                                 * 100 VR+ = AVCC and VR-- = VREF--/ VeREF--
                                 * 101 VR+ = VREF+ and VR-- = VREF--/ VeREF--
                                 * 110 VR+ = VeREF+ and VR-- = VREF--/ VeREF--
                                 * 111 VR+ = VeREF+ and VR-- = VREF--/ VeREF-- */
        INCH_t INCH;            /*! Input channel select
                                 * 0000 A0
                                 * 0001 A1
                                 * 0010 A2
                                 * 0011 A3
                                 * 0100 A4
                                 * 0101 A5
                                 * 0110 A6
                                 * 0111 A7
                                 * 1000 VeREF+
                                 * 1001 VREF--/VeREF--
                                 * 1010 Temperature diode
                                 * 1011 (AVCC � AVSS) /
                                 * 1100 GND
                                 * 1101 GND
                                 * 1110 GND
                                 * 1111 GND */
    };

    /*! ADC12 Interrupt Enable Register */
    struct ADC12IE_t {
        ADC12IE15_t ADC12IE15;  /*! Enable or disable the interrupt request for the ADC12IFG15 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE14_t ADC12IE14;  /*! Enable or disable the interrupt request for the ADC12IFG14 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE13_t ADC12IE13;  /*! Enable or disable the interrupt request for the ADC12IFG13 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE12_t ADC12IE12;  /*! Enable or disable the interrupt request for the ADC12IFG12 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE11_t ADC12IE11;  /*! Enable or disable the interrupt request for the ADC12IFG11 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE10_t ADC12IE10;  /*! Enable or disable the interrupt request for the ADC12IFG10 bit.
                                 * 0 Interrupt disabled
                                 * 1 Interrupt enabled */
        ADC12IE9_t ADC12IE9;  /*! Enable or disable the interrupt request for the ADC12IFG9 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE8_t ADC12IE8;  /*! Enable or disable the interrupt request for the ADC12IFG8 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE7_t ADC12IE7;  /*! Enable or disable the interrupt request for the ADC12IFG7 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE6_t ADC12IE6;  /*! Enable or disable the interrupt request for the ADC12IFG6 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE5_t ADC12IE5;  /*! Enable or disable the interrupt request for the ADC12IFG5 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE4_t ADC12IE4;  /*! Enable or disable the interrupt request for the ADC12IFG4 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE3_t ADC12IE3;  /*! Enable or disable the interrupt request for the ADC12IFG3 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE2_t ADC12IE2;  /*! Enable or disable the interrupt request for the ADC12IFG2 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE1_t ADC12IE1;  /*! Enable or disable the interrupt request for the ADC12IFG1 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
        ADC12IE0_t ADC12IE0;  /*! Enable or disable the interrupt request for the ADC12IFG0 bit.
                               * 0 Interrupt disabled
                               * 1 Interrupt enabled */
    };

instance:
    /*! ADC12CTL0 Register  */
    config ADC12CTL0_t  ADC12CTL0 = {
        ADC12SHT1 : SHT1_0,
        ADC12SHT0 : SHT0_0,
        MSC       : MSC_OFF,
        REF2_5V   : REF2_5V_OFF,
        REFON     : REFON_OFF,
        ADC12ON   : ADC12ON_OFF,
        ADC12OVIE : ADC12OVIE_OFF,
        ADC12TOVIE : ADC12TOVIE_OFF,
        ENC        : ENC_OFF,
        ADC12SC    : ADC12SC_OFF
    };

    /*! ADC12CTL1 Register */
    config ADC12CTL1_t  ADC12CTL1 = {
        CSTARTADD   : CSTARTADD_0,
        SHS         : SHS_0,
        SHP         : SHP_OFF,
        ISSH        : ISSH_OFF,
        ADC12DIV    : ADC12DIV_0,
        ADC12SSEL   : ADC12SSEL_0,
        CONSEQ      : CONSEQ_0,
        ADC12BUSY   : ADC12BUSY_OFF
    };

    /*! ADC12MCTL0 Register */
    config ADC12MCTL_t ADC12MCTL0 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL1 Register */
    config ADC12MCTL_t ADC12MCTL1 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL2 Register */
    config ADC12MCTL_t ADC12MCTL2 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL3 Register */
    config ADC12MCTL_t ADC12MCTL3 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL4 Register */
    config ADC12MCTL_t ADC12MCTL4 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL5 Register */
    config ADC12MCTL_t ADC12MCTL5 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL6 Register */
    config ADC12MCTL_t ADC12MCTL6 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL7 Register */
    config ADC12MCTL_t ADC12MCTL7 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL8 Register */
    config ADC12MCTL_t ADC12MCTL8 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL9 Register */
    config ADC12MCTL_t ADC12MCTL9 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL10 Register */
    config ADC12MCTL_t ADC12MCTL10 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL11 Register */
    config ADC12MCTL_t ADC12MCTL11 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL12 Register */
    config ADC12MCTL_t ADC12MCTL12 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL13 Register */
    config ADC12MCTL_t ADC12MCTL13 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL14 Register */
    config ADC12MCTL_t ADC12MCTL14 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12MCTL15 Register */
    config ADC12MCTL_t ADC12MCTL15 = {
        EOS    : EOS_OFF,
        SREF   : SREF_0,
        INCH   : INCH_0
    };

    /*! ADC12 Interrupt Enable Register */
    config ADC12IE_t ADC12IE = {
        ADC12IE15  : ADC12IE15_OFF,
        ADC12IE14  : ADC12IE14_OFF,
        ADC12IE13  : ADC12IE13_OFF,
        ADC12IE12  : ADC12IE12_OFF,
        ADC12IE11  : ADC12IE11_OFF,
        ADC12IE10  : ADC12IE10_OFF,
        ADC12IE9  : ADC12IE9_OFF,
        ADC12IE8  : ADC12IE8_OFF,
        ADC12IE7  : ADC12IE7_OFF,
        ADC12IE6  : ADC12IE6_OFF,
        ADC12IE5  : ADC12IE5_OFF,
        ADC12IE4  : ADC12IE4_OFF,
        ADC12IE3  : ADC12IE3_OFF,
        ADC12IE2  : ADC12IE2_OFF,
        ADC12IE1  : ADC12IE1_OFF,
        ADC12IE0  : ADC12IE0_OFF
    };


    /*! ADC12MEM0 Register */
    config Bits16 ADC12MEM0 = 0;

    /*! ADC12MEM1 Register */
    config Bits16 ADC12MEM1 = 0;

    /*! ADC12MEM2 Register */
    config Bits16 ADC12MEM2 = 0;

    /*! ADC12MEM3 Register */
    config Bits16 ADC12MEM3 = 0;

    /*! ADC12MEM4 Register */
    config Bits16 ADC12MEM4 = 0;

    /*! ADC12MEM5 Register */
    config Bits16 ADC12MEM5 = 0;

    /*! ADC12MEM6 Register */
    config Bits16 ADC12MEM6 = 0;

    /*! ADC12MEM7 Register */
    config Bits16 ADC12MEM7 = 0;

    /*! ADC12MEM8 Register */
    config Bits16 ADC12MEM8 = 0;

    /*! ADC12MEM9 Register */
    config Bits16 ADC12MEM9 = 0;

    /*! ADC12MEM10 Register */
    config Bits16 ADC12MEM10 = 0;

    /*! ADC12MEM11 Register */
    config Bits16 ADC12MEM11 = 0;

    /*! ADC12MEM12 Register */
    config Bits16 ADC12MEM12 = 0;

    /*! ADC12MEM13 Register */
    config Bits16 ADC12MEM13 = 0;

    /*! ADC12MEM14 Register */
    config Bits16 ADC12MEM14 = 0;

    /*! ADC12MEM15 Register */
    config Bits16 ADC12MEM15 = 0;

    /*! ADC12IV Register */
    config Bits16 ADC12IV = ADC12IV_NONE;

    /*! ADC12IFG Register */
    config Bits16 ADC12IFG = 0;

    /*! ADC12 has 16 interrupt enable */
    config regIntVect_t interruptSource[16];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "ADC12CTL0" , regForceSet : false },
        { register : "ADC12CTL1" , regForceSet : false },
        { register : "ADC12IFG" , regForceSet : false },
        { register : "ADC12IV" , regForceSet : false },
        { register : "ADC12IE" , regForceSet : false },
        { register : "ADC12MCTL0" , regForceSet : false },
        { register : "ADC12MCTL1" , regForceSet : false },
        { register : "ADC12MCTL2" , regForceSet : false },
        { register : "ADC12MCTL3" , regForceSet : false },
        { register : "ADC12MCTL4" , regForceSet : false },
        { register : "ADC12MCTL5" , regForceSet : false },
        { register : "ADC12MCTL6" , regForceSet : false },
        { register : "ADC12MCTL7" , regForceSet : false },
        { register : "ADC12MCTL8" , regForceSet : false },
        { register : "ADC12MCTL9" , regForceSet : false },
        { register : "ADC12MCTL10" , regForceSet : false },
        { register : "ADC12MCTL11" , regForceSet : false },
        { register : "ADC12MCTL12" , regForceSet : false },
        { register : "ADC12MCTL13" , regForceSet : false },
        { register : "ADC12MCTL14" , regForceSet : false },
        { register : "ADC12MCTL15" , regForceSet : false },
        { register : "ADC12MEM0" , regForceSet : false },
        { register : "ADC12MEM1" , regForceSet : false },
        { register : "ADC12MEM2" , regForceSet : false },
        { register : "ADC12MEM3" , regForceSet : false },
        { register : "ADC12MEM4" , regForceSet : false },
        { register : "ADC12MEM5" , regForceSet : false },
        { register : "ADC12MEM6" , regForceSet : false },
        { register : "ADC12MEM7" , regForceSet : false },
        { register : "ADC12MEM8" , regForceSet : false },
        { register : "ADC12MEM9" , regForceSet : false },
        { register : "ADC12MEM10" , regForceSet : false },
        { register : "ADC12MEM11" , regForceSet : false },
        { register : "ADC12MEM12" , regForceSet : false },
        { register : "ADC12MEM13" , regForceSet : false },
        { register : "ADC12MEM14" , regForceSet : false },
        { register : "ADC12MEM15" , regForceSet : false },
    ];
}

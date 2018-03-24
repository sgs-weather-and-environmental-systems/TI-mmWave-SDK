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

import ti.catalog.msp430.peripherals.adc.ADC12 as ADC12;
import ti.catalog.msp430.peripherals.comparator.IComparator as Comparator;
import ti.catalog.msp430.peripherals.svs.ISVS as SVS;
import ti.catalog.msp430.peripherals.dac.DAC12 as DAC12;
import ti.catalog.msp430.peripherals.clock.BCSplus as BCSplus;

/*!
 *  ======== GPIO for MSP430F261x ========
 *  MSP430 General Purpose Input Output Ports
 */
metaonly module GPIO_MSP430F261x inherits IGPIO {
    /*!
     *  ======== create ========
     *  Create an instance of this peripheral. Use a customized
     *  init function so that we can get access to the ADC12,
     *  Comparator_A, SVS, DAC12 and BCS+ instances.
     */
    create(ADC12.Instance adc12, Comparator.Instance comparator, SVS.Instance svs, DAC12.Instance dac12,
        BCSplus.Instance clock);

instance:
    /*! @_nodoc */
    config ADC12.Instance adc12;

    /*! @_nodoc */
    config Comparator.Instance comparator;

    /*! @_nodoc */
    config SVS.Instance svs;

    /*! @_nodoc */
    config DAC12.Instance dac12;

    /*! @_nodoc */
    config BCSplus.Instance clock;

   /*! Define an array to describe all device pins. The 1st dimension
    *  denotes the port, the second the pin on that port. On an
    *  MSP430F261x device, there are 8 x 8 = 64 pins total.
    */

    /* TODO: This here should really be a module-wide feature, rather than an instance feature,
     * however due to limitations in XDCtools 3.21.0.0 the data is located here */
    /* TODO: For this device the config variable definition has been moved into the
     * corresponding XS file due to its size. This needs a more consistent solution. */
    config DevicePin_t devicePins[8][8];

    /*! Implementation of Device Pin Functional Configuration */
    override config DevicePinFunctionSetting_t devicePinSetting[8][8];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "P1OUT" , regForceSet : true  },
        { register : "P1SEL" , regForceSet : false },
        { register : "P1DIR" , regForceSet : true  },
        { register : "P1REN" , regForceSet : false },
        { register : "P1IES" , regForceSet : true },
        { register : "P1IFG" , regForceSet : true },
        { register : "P1IE"  , regForceSet : false },
        { register : "P2OUT" , regForceSet : true  },
        { register : "P2SEL" , regForceSet : false },
        { register : "P2DIR" , regForceSet : true  },
        { register : "P2REN" , regForceSet : false },
        { register : "P2IES" , regForceSet : true },
        { register : "P2IFG" , regForceSet : true },
        { register : "P2IE"  , regForceSet : false },
        { register : "P3OUT" , regForceSet : true  },
        { register : "P3SEL" , regForceSet : false },
        { register : "P3DIR" , regForceSet : true  },
        { register : "P3REN" , regForceSet : false },
        { register : "P4OUT" , regForceSet : true  },
        { register : "P4SEL" , regForceSet : false },
        { register : "P4DIR" , regForceSet : true  },
        { register : "P4REN" , regForceSet : false },
        { register : "P5OUT" , regForceSet : true  },
        { register : "P5SEL" , regForceSet : false },
        { register : "P5DIR" , regForceSet : true  },
        { register : "P5REN" , regForceSet : false },
        { register : "P6OUT" , regForceSet : true  },
        { register : "P6SEL" , regForceSet : false },
        { register : "P6DIR" , regForceSet : true  },
        { register : "P6REN" , regForceSet : false },
        { register : "P7OUT" , regForceSet : true  },
        { register : "P7SEL" , regForceSet : false },
        { register : "P7DIR" , regForceSet : true  },
        { register : "P7REN" , regForceSet : false },
        { register : "P8OUT" , regForceSet : true  },
        { register : "P8SEL" , regForceSet : false },
        { register : "P8DIR" , regForceSet : true  },
        { register : "P8REN" , regForceSet : false }
    ];

    /*
     *  GPIO Digital I/O Registers
     *
     *  One GIPO instance defines the configuration of an entire,
     *  8-bit wide digital I/O port.
     */

    /*! Port 1 Output Register */
    config GpioBits8PxOut_t P1OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 1 Port Select Register */
    config GpioBits8PxSel_t P1SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 1 Direction Register */
    config GpioBits8PxDir_t P1DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 1 Resistor Enable Register */
    config GpioBits8PxRen_t P1REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Output Register */
    config GpioBits8PxOut_t P2OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Port Select Register */
    config GpioBits8PxSel_t P2SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Direction Register */
    config GpioBits8PxDir_t P2DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Resistor Enable Register */
    config GpioBits8PxRen_t P2REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Output Register */
    config GpioBits8PxOut_t P3OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Port Select Register */
    config GpioBits8PxSel_t P3SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Direction Register */
    config GpioBits8PxDir_t P3DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Resistor Enable Register */
    config GpioBits8PxRen_t P3REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Output Register */
    config GpioBits8PxOut_t P4OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Port Select Register */
    config GpioBits8PxSel_t P4SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Direction Register */
    config GpioBits8PxDir_t P4DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Resistor Enable Register */
    config GpioBits8PxRen_t P4REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

        /*! Port 5 Output Register */
    config GpioBits8PxOut_t P5OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 5 Port Select Register */
    config GpioBits8PxSel_t P5SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 5 Direction Register */
    config GpioBits8PxDir_t P5DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 5 Resistor Enable Register */
    config GpioBits8PxRen_t P5REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 6 Output Register */
    config GpioBits8PxOut_t P6OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 6 Port Select Register */
    config GpioBits8PxSel_t P6SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 6 Direction Register */
    config GpioBits8PxDir_t P6DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 6 Resistor Enable Register */
    config GpioBits8PxRen_t P6REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 7 Output Register */
    config GpioBits8PxOut_t P7OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 7 Port Select Register */
    config GpioBits8PxSel_t P7SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 7 Direction Register */
    config GpioBits8PxDir_t P7DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 7 Resistor Enable Register */
    config GpioBits8PxRen_t P7REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 8 Output Register */
    config GpioBits8PxOut_t P8OUT = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 8 Port Select Register */
    config GpioBits8PxSel_t P8SEL = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 8 Direction Register */
    config GpioBits8PxDir_t P8DIR = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 8 Resistor Enable Register */
    config GpioBits8PxRen_t P8REN = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };
}

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
 *  ======== IGPIO ========
 *  MSP430 General Purpose Input Output Ports
 */
metaonly interface IGPIO inherits xdc.platform.IPeripheral {

    /*! Pull-up/down resistor enables drop down list */
    enum ResEnable_t {
        PUDRE_OFF  = 0x00u,                  /*! Disabled */
        PUDRE_UP   = 0x01u,                  /*! Pull-Up Resistor */
        PUDRE_DOWN = 0x02u                   /*! Pull-Down Resistor */
    }

    /*! Interrupt enables drop down list */
    enum InterruptEnable_t {
        IE_OFF     = 0x00u,                 /*! Disabled */
        IE_FALLING = 0x01u,                 /*! Interrupt Enabled Falling Edge */
        IE_RISING  = 0x02u                  /*! Interrupt Enabled Rising Edge  */
    }

    /*! Output high or low drop down list */
    enum OutputState_t {
        OUTSTATE_LOW   = 0x00u,             /*! Output Set Low (Default) */
        OUTSTATE_HIGH  = 0x01u              /*! Output Set High */
    }

    /*! GPIO Bit 0 Definitions */
    enum Bit0_t {
        BIT0_OFF = 0x00u,
        BIT0 = 0x01u
    };

    enum Bit1_t {
        BIT1_OFF = 0x00u,
        BIT1 = 0x02u
    };

    enum Bit2_t {
        BIT2_OFF = 0x00u,
        BIT2 = 0x04u
    };

    enum Bit3_t {
        BIT3_OFF = 0x00u,
        BIT3 = 0x08u
    };

    enum Bit4_t {
        BIT4_OFF = 0x00u,
        BIT4 = 0x10u
    };

    enum Bit5_t {
        BIT5_OFF = 0x00u,
        BIT5 = 0x20u
    };

    enum Bit6_t {
        BIT6_OFF = 0x00u,
        BIT6 = 0x20u
    };

    enum Bit7_t {
        BIT7_OFF = 0x00u,
        BIT7 = 0x80u
    };

    /*!
    *  ======== GpioBits8_t ========
    *  Generic GPIO 8-bit Register
    *
    *  @see #GpioBits8_t
    */
    struct GpioBits8PxIn_t {
        Bit0_t    Bit0;     /*! GPIO Input Signal Bit 0 */
        Bit1_t    Bit1;     /*! GPIO Input Signal Bit 1 */
        Bit2_t    Bit2;     /*! GPIO Input Signal Bit 2 */
        Bit3_t    Bit3;     /*! GPIO Input Signal Bit 3 */
        Bit4_t    Bit4;     /*! GPIO Input Signal Bit 4 */
        Bit5_t    Bit5;     /*! GPIO Input Signal Bit 5 */
        Bit6_t    Bit6;     /*! GPIO Input Signal Bit 6 */
        Bit7_t    Bit7;     /*! GPIO Input Signal Bit 7 */
    }

    /*!
    *  ======== GpioBits8PxOut_t ========
    *  Generic GPIO 8-bit PxOUT Register
    *
    *  @see #GpioBits8PxOut_t
    */
    struct GpioBits8PxOut_t {
        Bit0_t    Bit0;     /*! GPIO Output Signal Bit 0 */
        Bit1_t    Bit1;     /*! GPIO Output Signal Bit 1 */
        Bit2_t    Bit2;     /*! GPIO Output Signal Bit 2 */
        Bit3_t    Bit3;     /*! GPIO Output Signal Bit 3 */
        Bit4_t    Bit4;     /*! GPIO Output Signal Bit 4 */
        Bit5_t    Bit5;     /*! GPIO Output Signal Bit 5 */
        Bit6_t    Bit6;     /*! GPIO Output Signal Bit 6 */
        Bit7_t    Bit7;     /*! GPIO Output Signal Bit 7 */
    }

    /*!
    *  ======== GpioBits8PxDir_t ========
    *  Generic GPIO 8-bit PxDIR Register
    *
    *  @see #GpioBits8PxDir_t
    */
    struct GpioBits8PxDir_t {
        Bit0_t    Bit0;     /*! GPIO Select Direction Bit 0
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit1_t    Bit1;     /*! GPIO Select Direction Bit 1
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit2_t    Bit2;     /*! GPIO Select Direction Bit 2
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit3_t    Bit3;     /*! GPIO Select Direction Bit 3
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit4_t    Bit4;     /*! GPIO Select Direction Bit 4
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit5_t    Bit5;     /*! GPIO Select Direction Bit 5
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit6_t    Bit6;     /*! GPIO Select Direction Bit 6
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
        Bit7_t    Bit7;     /*! GPIO Select Direction Bit 7
                               *  Bit = 0: The port pin is switched to input direction
                               *  Bit = 1: The port pin is switched to output direction */
    }

    /*!
    *  ======== GpioBits8PxRen_t ========
    *  Generic GPIO 8-bit PxREN Register
    *
    *  @see #GpioBits8PxRen_t
    */
    struct GpioBits8PxRen_t {
        Bit0_t    Bit0;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 0
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit1_t    Bit1;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 1
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit2_t    Bit2;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 2
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit3_t    Bit3;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 3
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit4_t    Bit4;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 4
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit5_t    Bit5;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 5
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit6_t    Bit6;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 6
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
        Bit7_t    Bit7;     /*! GPIO Enables or Disables Pullup/Pulldown Bit 7
                               *  Bit = 0: Pullup/pulldown resistor disabled
                               *  Bit = 1: Pullup/pulldown resistor enabled
                               *           Set Pullup/down via PxOUT 0 = Down; 1 = Up */
    }

    /*!
    *  ======== GpioBits8PxSel_t ========
    *  Generic GPIO 8-bit PxSEL Register
    *
    *  @see #GpioBits8PxSel_t
    */
    struct GpioBits8PxSel_t {
        Bit0_t    Bit0;     /*! GPIO Select Pin Function Bit 0
                               *See the device-specific data sheet to determine pin functions. */
        Bit1_t    Bit1;     /*! GPIO Select Pin Function Bit 1
                               *See the device-specific data sheet to determine pin functions. */
        Bit2_t    Bit2;     /*! GPIO Select Pin Function Bit 2
                               *See the device-specific data sheet to determine pin functions. */
        Bit3_t    Bit3;     /*! GPIO Select Pin Function Bit 3
                               *See the device-specific data sheet to determine pin functions. */
        Bit4_t    Bit4;     /*! GPIO Select Pin Function Bit 4
                               *See the device-specific data sheet to determine pin functions. */
        Bit5_t    Bit5;     /*! GPIO Select Pin Function Bit 5
                               *See the device-specific data sheet to determine pin functions. */
        Bit6_t    Bit6;     /*! GPIO Select Pin Function Bit 6
                               *See the device-specific data sheet to determine pin functions. */
        Bit7_t    Bit7;     /*! GPIO Select Pin Function Bit 7
                               *See the device-specific data sheet to determine pin functions. */
    }

    /*!
    *  ======== GpioBits8PxSel2_t ========
    *  Generic GPIO 8-bit PxSEL2 Register
    *
    *  @see #GpioBits8PxSel2_t
    */
    struct GpioBits8PxSel2_t {
        Bit0_t    Bit0;     /*! GPIO Select Pin Function Bit 0
                               *See the device-specific data sheet to determine pin functions. */
        Bit1_t    Bit1;     /*! GPIO Select Pin Function Bit 1
                               *See the device-specific data sheet to determine pin functions. */
        Bit2_t    Bit2;     /*! GPIO Select Pin Function Bit 2
                               *See the device-specific data sheet to determine pin functions. */
        Bit3_t    Bit3;     /*! GPIO Select Pin Function Bit 3
                               *See the device-specific data sheet to determine pin functions. */
        Bit4_t    Bit4;     /*! GPIO Select Pin Function Bit 4
                               *See the device-specific data sheet to determine pin functions. */
        Bit5_t    Bit5;     /*! GPIO Select Pin Function Bit 5
                               *See the device-specific data sheet to determine pin functions. */
        Bit6_t    Bit6;     /*! GPIO Select Pin Function Bit 6
                               *See the device-specific data sheet to determine pin functions. */
        Bit7_t    Bit7;     /*! GPIO Select Pin Function Bit 7
                               *See the device-specific data sheet to determine pin functions. */
    }

    /*!
    *  ======== GpioBits8PxIe_t ========
    *  Generic GPIO 8-bit PxIE Register
    *
    *  @see #GpioBits8PxIe_t
    */
    struct GpioBits8PxIe_t {
        Bit0_t    Bit0;     /*! GPIO Interrupt Enable Bit 0
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit1_t    Bit1;     /*! GPIO Interrupt Enable Bit 1
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit2_t    Bit2;     /*! GPIO Interrupt Enable Bit 2
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit3_t    Bit3;     /*! GPIO Interrupt Enable Bit 3
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit4_t    Bit4;     /*! GPIO Interrupt Enable Bit 4
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit5_t    Bit5;     /*! GPIO Interrupt Enable Bit 5
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit6_t    Bit6;     /*! GPIO Interrupt Enable Bit 6
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
        Bit7_t    Bit7;     /*! GPIO Interrupt Enable Bit 7
                               *  Bit = 0: The interrupt is disabled.
                               *  Bit = 1: The interrupt is enabled. */
    }

    /*!
    *  ======== GpioBits8PxIes_t ========
    *  Generic GPIO 8-bit PxIES Register
    *
    *  @see #GpioBits8PxIes_t
    */
    struct GpioBits8PxIes_t {
        Bit0_t    Bit0;     /*! GPIO Select Interrupt Edge Bit 0
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit1_t    Bit1;     /*! GPIO Select Interrupt Edge Bit 1
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit2_t    Bit2;     /*! GPIO Select Interrupt Edge Bit 2
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit3_t    Bit3;     /*! GPIO Select Interrupt Edge Bit 3
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit4_t    Bit4;     /*! GPIO Select Interrupt Edge Bit 4
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit5_t    Bit5;     /*! GPIO Select Interrupt Edge Bit 5
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit6_t    Bit6;     /*! GPIO Select Interrupt Edge Bit 6
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
        Bit7_t    Bit7;     /*! GPIO Select Interrupt Edge Bit 7
                               *  Bit = 0: The PxIFGx flag is set with a low-to-high transition
                               *  Bit = 1: The PxIFGx flag is set with a high-to-low transition */
    }

    /*!
    *  ======== GpioBits8PxIfg_t ========
    *  Generic GPIO 8-bit PxIFG Register
    *
    *  @see #GpioBits8PxIfg_t
    */
    struct GpioBits8PxIfg_t {
        Bit0_t    Bit0;     /*! GPIO Interrupt Flag Bit 0
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit1_t    Bit1;     /*! GPIO Interrupt Flag Bit 1
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit2_t    Bit2;     /*! GPIO Interrupt Flag Bit 2
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit3_t    Bit3;     /*! GPIO Interrupt Flag Bit 3
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit4_t    Bit4;     /*! GPIO Interrupt Flag Bit 4
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit5_t    Bit5;     /*! GPIO Interrupt Flag Bit 5
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit6_t    Bit6;     /*! GPIO Interrupt Flag Bit 6
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
        Bit7_t    Bit7;     /*! GPIO Interrupt Flag Bit 7
                               *  Bit = 0: No interrupt is pending
                               *  Bit = 1: An interrupt is pending */
    }

    /*!
    *  ======== DeviceRegisterConfig_t ========
    *  Device Register Configuration Descriptor
    *
    *  Type to describe how a register is configured for a particular
    *  use. The type allows setting and clearing of an arbitrary bit
    *  pattern inside the specified register.
    *
    *  @see #DeviceRegisterConfig_t
    */
    struct DeviceRegisterConfig_t {
        String              register;
        UInt                bitSetMask;
        UInt                bitClearMask;
    }

    /*!
    *  ======== DevicePinFunction_t ========
    *  Device Pin Functional Descriptor
    *
    *  Type to describe how a device pin is configured for all its
    *  different uses that are possible. The function names are consolidated
    *  in one String array rather than located together with the function-
    *  specific data to allow easier access by Grace widgets. The functionConfig
    *  member contains an arbitrary-length array describing all register
    *  settings that need to be performed to configure a certain function.
    *
    *  @see #DevicePinFunction_t
    */
    struct DevicePinFunction_t {
        String                    functionName[];
        DeviceRegisterConfig_t    functionConfig[][];
    }

    /*!
    *  ======== DevicePin_t ========
    *  Device Pin Descriptor
    *
    *  Type to describe a single device pin and all its possible
    *  configurations.
    *
    *  @see #DevicePin_t
    */
    struct DevicePin_t {
        String                    pinName;
        DevicePinFunction_t       pinFunction;
    }

    /*!
    *  ======== MatchedPortFunction_t ========
    *  Port Function Enumeration Type
    *
    *  This type is used to store a list of applicable pins based on the
    *  search criteria when using the function findPinsForFunction().
    *
    *  @see #MatchedPortFunction_t
    */
    struct MatchedPortFunction_t {
        UInt      port[];
        UInt      pin[];
        String    pinName[];
        UInt      functionIndex[];
        String    functionName[];
    }

    /*!
    *  ======== DevicePinFunctionSetting_t ========
    *  Device Pin Functional Setting Descriptor
    *
    *  Type to store the selected pin configuration and a reference
    *  to the object that last modified the configuration.
    *
    *  @see #DevicePinFunctionSetting_t
    */
    struct DevicePinFunctionSetting_t {
        UInt               functionIndex;       /*! Device Pin Functional Selection */
        Any                owner;               /*! Current Device Pin Owner */
        ResEnable_t        resistorEnable;      /*! Pull-up/down Resistor Enable Selection */
        OutputState_t      outputDirState;      /*! Output Direction State Selection */
        InterruptEnable_t  interruptEnable;     /*! Interrupt Enable State Selection */
        Bool               outputDirStateEnabled;/*! Enable state for output direction state selection */
        Bool               inputDirStateEnabled;/*! Enable state for input direction state selection */
    }

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
    *  ======== regIntVect_t ========
    *  Interrupt vector description
    *
    *  Type to describe a single interrupt vector pin and all its possible
    *  configurations.
    *
    *  @see #regIntVect_t
    */
    struct regIntVect_t {
        String                    registerName;
        String                    registerDescription;
        String                    isrToggleString;
        String                    priorityName;
        Bool                      interruptEnable;
        Bool                      interruptHandler;
        Int                       priority;
    }

instance:
    /*! Port 1 Interrupt Edge Select Register */
    config GpioBits8PxIes_t P1IES = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 1 Interrupt Flag Register */
    config GpioBits8PxIfg_t P1IFG = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 1 Interrupt Enable Register */
    config GpioBits8PxIe_t P1IE = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Interrupt Edge Select Register */
    config GpioBits8PxIes_t P2IES = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Interrupt Flag Register */
    config GpioBits8PxIfg_t P2IFG = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 2 Interrupt Enable Register */
    config GpioBits8PxIe_t P2IE = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Interrupt Edge Select Register */
    config GpioBits8PxIes_t P3IES = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Interrupt Flag Register */
    config GpioBits8PxIfg_t P3IFG = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 3 Interrupt Enable Register */
    config GpioBits8PxIe_t P3IE = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Interrupt Edge Select Register */
    config GpioBits8PxIes_t P4IES = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Interrupt Flag Register */
    config GpioBits8PxIfg_t P4IFG = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! Port 4 Interrupt Enable Register */
    config GpioBits8PxIe_t P4IE = {
        Bit0        : BIT0_OFF,
        Bit1        : BIT1_OFF,
        Bit2        : BIT2_OFF,
        Bit3        : BIT3_OFF,
        Bit4        : BIT4_OFF,
        Bit5        : BIT5_OFF,
        Bit6        : BIT6_OFF,
        Bit7        : BIT7_OFF
    };

    /*! GPIO interrupt source */
    config regIntVect_t interruptSource[32];

    /*! Forward Declaration of Device Pin Functional Configuration */
    config DevicePinFunctionSetting_t devicePinSetting[][];

    /*!
     *  ======== findPinsForFunction ========
     *    Identify all device pins that can be used to serve a certain purpose
     *
     *  Function to scan through the pin configuration database to identify
     *    a list of device pins matching a regular expression.
     */
    MatchedPortFunction_t findPinsForFunction(String regExp);

    /*!
     *  ======== pinFunctionIsActive ========
     *  Check if a pin is enabled for a certain function
     *
     *    This function is used to check if a certain functionality is enabled
     *    on a given device pins (returns 'true' in that case).
     */
    Bool pinFunctionIsActive(UInt port, UInt pin, String regExp);

    /*!
     *  ======== getPinFunctionIndex ========
     *  Get a pin's current functional configuration
     *
     *  This function is used to obtain the current configuration of a given
     *    device pin. The returned value can be used as an index to obtain further
     *  information from the pin configuration database.
     */
    UInt getPinFunctionIndex(UInt port, UInt pin);

    /*!
     *  ======== getPinOwner ========
     *    This function returns the current owner of the specified device pin.
     */
    Any getPinOwner(UInt port, UInt pin);

    /*!
     *  ======== setPinFunctionUsingIndex ========
     *     Configure a device pin to a specific peripheral function
     *
     *  This function is used to configure a device pin to a specific peripheral
     *    function that is identified by an index. The index corresponds to an
     *    associated set of configuration parameters stored in the pin configuration
     *    database. The owner parameter can be used to protect a pin from being
     *    used by somebody else. A pin configuration can only be changed if the
     *    current owner is undefined, or of the current owner matches the
     *    owner specified as function parameter.
     */
    Void setPinFunctionUsingIndex(UInt port, UInt pin, UInt index, Any owner);

    /*!
     *  ======== setDefaultPinFunction ========
     *     Configure a device pin to its default state
     *
     *  This function is used to configure a device pin to its default state
     *    and is typically used when a peripheral module relinquishes ownership
     *    of a pin so that it can be used by other peripheral modules.
     */
    Void setDefaultPinFunction(UInt port, UInt pin, Any owner);
}

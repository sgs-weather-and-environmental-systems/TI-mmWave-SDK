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
 *  ======== IOA ========
 *  MSP430 General Purpose Operational Amplifier
 */
metaonly interface IOA inherits xdc.platform.IPeripheral {

    /*! Inverting input selection */
    enum OAN_t {
      OAN_0 = (0*0x400u),       /*! OAxI0 */
      OAN_1 = (1*0x400u),       /*! OAxI1 */
      OAN_2 = (2*0x400u),       /*! OAxI2 */
      OAN_3 = 3*0x400u          /*! OAxI3 */
    };

    /*! Non-inverting input selection */
    enum OAP_t {
      OAP_0 = (0*0x400u),       /*! OAxI0 */
      OAP_1 = (1*0x400u),       /*! OAxI1 */
      OAP_2 = (2*0x400u),       /*! OAxI2 */
      OAP_3 = 3*0x400u          /*! OAxI3 */
    };

    /*! Slew rate select */
    enum OAPM_t {
      OAPM_0 = (0*0x400u),      /*! Off, output high Z */
      OAPM_1 = (1*0x400u),      /*! Slow */
      OAPM_2 = (2*0x400u),      /*! Medium */
      OAPM_3 = 3*0x400u         /*! Fast */
    };

    enum OAADC0_t {
      OAADC0_OFF = (0x00),      /*! OAx output to ADC12 input channel select 0 */
      OAADC0 = 0x01             /*! OAx output to ADC12 input channel select 0 */
    };

    enum OAADC1_t {
      OAADC1_OFF = (0x00),      /*! OAx output to ADC12 input channel select 1 */
      OAADC1 = 0x02             /*! OAx output to ADC12 input channel select 1 */
    };

    /*! OAx feedback resistor select */
    enum OAFBR_t {
      OAFBR_0 = (0*0x100u),     /*! OAx Feedback resistor: Tap 0 */
      OAFBR_1 = (1*0x100u),     /*! OAx Feedback resistor: Tap 1 */
      OAFBR_2 = (2*0x100u),     /*! OAx Feedback resistor: Tap 2 */
      OAFBR_3 = (3*0x100u),     /*! OAx Feedback resistor: Tap 3 */
      OAFBR_4 = (4*0x100u),     /*! OAx Feedback resistor: Tap 4 */
      OAFBR_5 = (5*0x100u),     /*! OAx Feedback resistor: Tap 5 */
      OAFBR_6 = (6*0x100u),     /*! OAx Feedback resistor: Tap 6 */
      OAFBR_7 = 7*0x100u        /*! OAx Feedback resistor: Tap 7 */
    };

    /*! OAx function control */
    enum OAFC_t {
      OAFC_0 = (0*0x100u),      /*! General Purpose */
      OAFC_1 = (1*0x100u),      /*! Unity gain buffer for three-opamp differential amplifier */
      OAFC_2 = (2*0x100u),      /*! Unity gain buffer */
      OAFC_3 = (3*0x100u),      /*! Comparator */
      OAFC_4 = (4*0x100u),      /*! Non-inverting PGA */
      OAFC_5 = (5*0x100u),      /*! Cascaded non-inverting PGA */
      OAFC_6 = (6*0x100u),      /*! Inverting PGA */
      OAFC_7 = 7*0x100u         /*! Differential amplifier */
    };

    enum OARRIP_t {
      OARRIP_OFF = 0x00,        /*! Rtop = AVss, Rbottom = AVcc */
      OARRIP     = 0x01         /*! Rtop = AVcc, Rbottom = AVss */
    };

    enum OANEXT_t {
      OANEXT_OFF = 0x00,        /*! OAx inverting input not externally available */
      OANEXT     = 0x02         /*! OAx inverting input externally available */
    };

   /*!
    *  ======== OAxCTL0_t ========
    *  Opamp Control Register 0 Definition
    *
    *  @see #OAxCTL0_t
    */
    struct OAxCTL0_t {
      OAN_t     OAN;            /*! Inverting input select. These bits select the input signal for the OA inverting
                                  * input.
                                  *  00  OAxI0
                                  *  01  OAxI1
                                  *  10  OAxIA (see the device-specific data sheet for connected signal)
                                  *  11  OAxIB (see the device-specific data sheet for connected signal) */
      OAP_t     OAP;            /*! Non-inverting input select. These bits select the input signal for the OA
                                  * non-inverting input.
                                  *  00  OAxI0
                                  *  01  OA0I1
                                  *  10  OAxIA (see the device-specific data sheet for connected signal)
                                  *  11  OAxIB (see the device-specific data sheet for connected signal) */
      OAPM_t    OAPM;           /*! Slew rate select. These bits select the slew rate vs. current consumption
                                  * for the OA.
                                  *  00  Off, output high Z
                                  *  01  Slow
                                  *  10  Medium
                                  *  11  Fast */
      OAADC0_t  OAADC0;         /*! OA output select. These bits, together with the OAFCx bits, control the
                                  * routing of the OAx output when OAPMx > 0.
                                  * When OAFCx = 0:
                                  *  00  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  01  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  *  10  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  11  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  * When OAFCx > 0:
                                  *  00  OAxOUT used for internal routing only
                                  *  01  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  *  10  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  11  OAxOUT connected internally to ADC input A12, A13 , or A14.
                                  * External A12, A13, or A14 pin connections are disconnected from the
                                  * ADC. */
      OAADC1_t  OAADC1;         /*! OA output select. These bits, together with the OAFCx bits, control the
                                  * routing of the OAx output when OAPMx > 0.
                                  * When OAFCx = 0:
                                  *  00  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  01  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  *  10  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  11  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  * When OAFCx > 0:
                                  *  00  OAxOUT used for internal routing only
                                  *  01  OAxOUT connected to external pins and ADC input A12, A13, or A14
                                  *  10  OAxOUT connected to external pins and ADC input A1, A3, or A5
                                  *  11  OAxOUT connected internally to ADC input A12, A13 , or A14.
                                  * External A12, A13, or A14 pin connections are disconnected from the
                                  * ADC. */
    }

    /*!
    *  ======== OAxCTL1_t ========
    *  Opamp Control Register 1 Definition
    *
    *  @see #OAxCTL1_t
    */
    struct OAxCTL1_t {
      OAFBR_t   OAFBR;          /*! OAx feedback resistor select
                                  *  000  Tap 0 - 0R/16R
                                  *  001  Tap 1 - 4R/12R
                                  *  010  Tap 2 - 8R/8R
                                  *  011  Tap 3 - 10R/6R
                                  *  100  Tap 4 - 12R/4R
                                  *  101  Tap 5 - 13R/3R
                                  *  110  Tap 6 - 14R/2R
                                  *  111  Tap 7 - 15R/1R */
      OAFC_t    OAFC;           /*! OAx function control. This bit selects the function of OAx
                                  *  000  General purpose opamp
                                  *  001  Unity gain buffer for three-opamp differential amplifier
                                  *  010  Unity gain buffer
                                  *  011  Comparator
                                  *  100  Non-inverting PGA amplifier
                                  *  101  Cascaded non-inverting PGA amplifier
                                  *  110  Inverting PGA amplifier
                                  *  111  Differential amplifier */
      OANEXT_t  OANEXT;         /*! OAx inverting input externally available. This bit, when set, connects the
                                  * inverting OAx input to the external pin when the integrated resistor network
                                  * is used.
                                  *  0  OAx inverting input not externally available
                                  *  1  OAx inverting input externally available */
      OARRIP_t  OARRIP;         /*! OAx reverse resistor connection in comparator mode
                                  *  0  RTOP is connected to AVSS and RBOTTOM is connected to AVCC when
                                  *     OAFCx = 3
                                  *  1  RTOP is connected to AVCC and RBOTTOM is connected to AVSS when
                                  *     OAFCx = 3. */
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

instance:

    /*! Returns the number of available OA */
    UChar getNumberOfOA();
}

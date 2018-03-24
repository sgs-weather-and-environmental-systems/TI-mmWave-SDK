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
 *  ======== IDAC ========
 *  MSP430 Digital to Analog Converter Interface
 */
metaonly interface IDAC inherits xdc.platform.IPeripheral {


    /*! DAC12OPS Bit */
    enum DAC12OPS_t {
        DAC12OPS_OFF = 0x0000,
        DAC12OPS = 0x8000
    };

    /*! DAC12SREFx Bits */
    enum DAC12SREF_t {
        DAC12SREF_0 = (0*0x2000u),
        DAC12SREF_1 = (1*0x2000u),
        DAC12SREF_2 = (2*0x2000u),
        DAC12SREF_3 = (3*0x2000u)
    };

    /*! DAC12RES Bit */
    enum DAC12RES_t {
        DAC12RES_OFF = 0x0000,
        DAC12RES = 0x1000
    };

    /*! DAC12LSELx Bits */
    enum DAC12LSEL_t {
        DAC12LSEL_0 = (0*0x0400u),
        DAC12LSEL_1 = (1*0x0400u),
        DAC12LSEL_2 = (2*0x0400u),
        DAC12LSEL_3 = (3*0x0400u)
    };

    /*! DAC12CALON Bit */
    enum DAC12CALON_t {
        DAC12CALON_OFF = 0x0000,
        DAC12CALON = 0x0200
    };

    /*! DAC12IR Bit */
    enum DAC12IR_t {
        DAC12IR_OFF = 0x0000,
        DAC12IR = 0x0100
    };

     /*! DAC12AMPx Bits */
    enum DAC12AMP_t {
        DAC12AMP_0 = (0*0x0020u),
        DAC12AMP_1 = (1*0x0020u),
        DAC12AMP_2 = (2*0x0020u),
        DAC12AMP_3 = (3*0x0020u),
        DAC12AMP_4 = (4*0x0020u),
        DAC12AMP_5 = (5*0x0020u),
        DAC12AMP_6 = (6*0x0020u),
        DAC12AMP_7 = (7*0x0020u)
    };

    /*! DAC12DF Bit */
    enum DAC12DF_t {
        DAC12DF_OFF = 0x0000,
        DAC12DF = 0x0010
    };

    /*! DAC12IE Bit */
    enum DAC12IE_t {
        DAC12IE_OFF = 0x0000,
        DAC12IE = 0x0008
    };

    /*! DAC12IFG Bit */
    enum DAC12IFG_t {
        DAC12IFG_OFF = 0x0000,
        DAC12IFG = 0x0004
    };

    /*! DAC12ENC Bit */
    enum DAC12ENC_t {
        DAC12ENC_OFF = 0x0000,
        DAC12ENC = 0x0002
    };

    /*! DAC12GRP Bit */
    enum DAC12GRP_t {
        DAC12GRP_OFF = 0x0000,
        DAC12GRP = 0x0001
    };

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

}

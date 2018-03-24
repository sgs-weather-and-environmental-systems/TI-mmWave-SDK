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
 *  ======== Timer0_B7 ========
 *  MSP430 Timer0_B7 timer
 */
metaonly module Timer0_B7 inherits ITimer_B {

    /*! TB07IV Definitions */
    enum IVValues {
        TB0IV_NONE = 0x0000,                 /*! No Interrupt pending */
        TB0IV_TBCCR1 = 0x0002,               /*! TBCCR1_CCIFG */
        TB0IV_TBCCR2 = 0x0004,               /*! TBCCR2_CCIFG */
        TB0IV_TBCCR3 = 0x0006,               /*! TBCCR3_CCIFG */
        TB0IV_TBCCR4 = 0x0008,               /*! TBCCR4_CCIFG */
        TB0IV_TBCCR5 = 0x000A,               /*! TBCCR5_CCIFG */
        TB0IV_TBCCR6 = 0x000C,               /*! TBCCR6_CCIFG */
        TB0IV_TBIFG = 0x000E                 /*! TBIFG */
    };

instance:
    /*! TB0CTL, Timer_B7 Control Register */
    config TBCTL_t TB0CTL = {
        TBCLGRP : TBCLGRP_0,
        CNTL : CNTL_0,
        TBSSEL : TBSSEL_0,
        ID : ID_0,
        MC : MC_0,
        TBCLR : TBCLR_OFF,
        TBIE : TBIE_OFF,
        TBIFG : TBIFG_OFF
    };

    /*! TB0CCTL0, Capture/Compare Control Register 0 */
    config TBCCTLx_t TB0CCTL0 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL1, Capture/Compare Control Register 1 */
    config TBCCTLx_t TB0CCTL1 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL2, Capture/Compare Control Register 2 */
    config TBCCTLx_t TB0CCTL2 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL3, Capture/Compare Control Register 3 */
    config TBCCTLx_t TB0CCTL3 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL4, Capture/Compare Control Register 4 */
    config TBCCTLx_t TB0CCTL4 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL5, Capture/Compare Control Register 5 */
    config TBCCTLx_t TB0CCTL5 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCTL6, Capture/Compare Control Register 6 */
    config TBCCTLx_t TB0CCTL6 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        CLLD : CLLD_0,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! TB0CCR0, Timer_B Capture/Compare Register 0 */
    config Bits16 TB0CCR0 = 0;
    /*! TB0CCR1, Timer_B Capture/Compare Register 1 */
    config Bits16 TB0CCR1 = 0;
    /*! TB0CCR2, Timer_B Capture/Compare Register 2 */
    config Bits16 TB0CCR2 = 0;
    /*! TB0CCR3, Timer_B Capture/Compare Register 3 */
    config Bits16 TB0CCR3 = 0;
    /*! TB0CCR4, Timer_B Capture/Compare Register 4 */
    config Bits16 TB0CCR4 = 0;
    /*! TB0CCR5, Timer_B Capture/Compare Register 5 */
    config Bits16 TB0CCR5 = 0;
    /*! TB0CCR6, Timer_B Capture/Compare Register 6 */
    config Bits16 TB0CCR6 = 0;

    /*! Timer interrupt enables */
    config regIntVect_t interruptSource[8];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "TB0CTL"   , regForceSet : false },
        { register : "TB0CCTL0" , regForceSet : false },
        { register : "TB0CCTL1" , regForceSet : false },
        { register : "TB0CCTL2" , regForceSet : false },
        { register : "TB0CCTL3" , regForceSet : false },
        { register : "TB0CCTL4" , regForceSet : false },
        { register : "TB0CCTL5" , regForceSet : false },
        { register : "TB0CCTL6" , regForceSet : false },
        { register : "TB0CCR0"  , regForceSet : false },
        { register : "TB0CCR1"  , regForceSet : false },
        { register : "TB0CCR2"  , regForceSet : false },
        { register : "TB0CCR3"  , regForceSet : false },
        { register : "TB0CCR4"  , regForceSet : false },
        { register : "TB0CCR5"  , regForceSet : false },
        { register : "TB0CCR6"  , regForceSet : false }
    ];
}

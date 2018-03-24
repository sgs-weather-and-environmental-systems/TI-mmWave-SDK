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
 *  ======== Timer_B7 ========
 *  MSP430 Timer_B7 timer
 */
metaonly module Timer_B7 inherits ITimer_B {

    /*! TBIV Definitions */
    enum IVValues {
        TBIV_NONE = 0x0000,                 /*! No Interrupt pending */
        TBIV_TBCCR1 = 0x0002,               /*! TBCCR1_CCIFG */
        TBIV_TBCCR2 = 0x0004,               /*! TBCCR2_CCIFG */
        TBIV_TBCCR3 = 0x0006,               /*! TBCCR3_CCIFG */
        TBIV_TBCCR4 = 0x0008,               /*! TBCCR4_CCIFG */
        TBIV_TBCCR5 = 0x000A,               /*! TBCCR5_CCIFG */
        TBIV_TBCCR6 = 0x000C,               /*! TBCCR6_CCIFG */
        TBIV_TBIFG = 0x000E                 /*! TBIFG */
    };

instance:
    /*! TBCTL, Timer_B7 Control Register */
    config TBCTL_t TBCTL = {
        TBCLGRP : TBCLGRP_0,
        CNTL : CNTL_0,
        TBSSEL : TBSSEL_0,
        ID : ID_0,
        MC : MC_0,
        TBCLR : TBCLR_OFF,
        TBIE : TBIE_OFF,
        TBIFG : TBIFG_OFF
    };

    /*! TBCCTL0, Capture/Compare Control Register 0 */
    config TBCCTLx_t TBCCTL0 = {
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

    /*! TBCCTL1, Capture/Compare Control Register 1 */
    config TBCCTLx_t TBCCTL1 = {
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

    /*! TBCCTL2, Capture/Compare Control Register 2 */
    config TBCCTLx_t TBCCTL2 = {
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

    /*! TBCCTL3, Capture/Compare Control Register 3 */
    config TBCCTLx_t TBCCTL3 = {
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

    /*! TBCCTL4, Capture/Compare Control Register 4 */
    config TBCCTLx_t TBCCTL4 = {
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

    /*! TBCCTL5, Capture/Compare Control Register 5 */
    config TBCCTLx_t TBCCTL5 = {
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

    /*! TBCCTL6, Capture/Compare Control Register 6 */
    config TBCCTLx_t TBCCTL6 = {
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

    /*! TBCCR0, Timer_B Capture/Compare Register 0 */
    config Bits16 TBCCR0 = 0;
    /*! TBCCR1, Timer_B Capture/Compare Register 1 */
    config Bits16 TBCCR1 = 0;
    /*! TBCCR2, Timer_B Capture/Compare Register 2 */
    config Bits16 TBCCR2 = 0;
    /*! TBCCR3, Timer_B Capture/Compare Register 3 */
    config Bits16 TBCCR3 = 0;
    /*! TBCCR4, Timer_B Capture/Compare Register 4 */
    config Bits16 TBCCR4 = 0;
    /*! TBCCR5, Timer_B Capture/Compare Register 5 */
    config Bits16 TBCCR5 = 0;
    /*! TBCCR6, Timer_B Capture/Compare Register 6 */
    config Bits16 TBCCR6 = 0;

    /*! Timer interrupt enables */
    config regIntVect_t interruptSource[8];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "TBCTL"   , regForceSet : false },
        { register : "TBCCTL0" , regForceSet : false },
        { register : "TBCCTL1" , regForceSet : false },
        { register : "TBCCTL2" , regForceSet : false },
        { register : "TBCCTL3" , regForceSet : false },
        { register : "TBCCTL4" , regForceSet : false },
        { register : "TBCCTL5" , regForceSet : false },
        { register : "TBCCTL6" , regForceSet : false },
        { register : "TBCCR0"  , regForceSet : false },
        { register : "TBCCR1"  , regForceSet : false },
        { register : "TBCCR2"  , regForceSet : false },
        { register : "TBCCR3"  , regForceSet : false },
        { register : "TBCCR4"  , regForceSet : false },
        { register : "TBCCR5"  , regForceSet : false },
        { register : "TBCCR6"  , regForceSet : false }
    ];
}

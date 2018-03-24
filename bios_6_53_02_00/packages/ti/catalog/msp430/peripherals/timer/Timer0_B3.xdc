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
 *  ======== Timer0_B3 ========
 *  MSP430 Timer0_B3 timer
 */
metaonly module Timer0_B3 inherits ITimer_B {

instance:
    /*! TB0CTL, Timer_B3 Control Register */
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

    /*! TB0CCR0, Timer_B Capture/Compare Register 0 */
    config Bits16 TB0CCR0 = 0;
    /*! TB0CCR1, Timer_B Capture/Compare Register 1 */
    config Bits16 TB0CCR1 = 0;
    /*! TB0CCR2, Timer_B Capture/Compare Register 2 */
    config Bits16 TB0CCR2 = 0;

    /*! Timer interrupt enables */
    config regIntVect_t interruptSource[4];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "TB0CTL"   , regForceSet : false },
        { register : "TB0CCTL0" , regForceSet : false },
        { register : "TB0CCTL1" , regForceSet : false },
        { register : "TB0CCTL2" , regForceSet : false },
        { register : "TB0CCR0"  , regForceSet : false },
        { register : "TB0CCR1"  , regForceSet : false },
        { register : "TB0CCR2"  , regForceSet : false }
    ];
}

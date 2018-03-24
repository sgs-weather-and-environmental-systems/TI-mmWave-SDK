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
 *  ======== Timer_A5 ========
 *  MSP430 Timer_A5 timer
 */
metaonly module Timer_A5 inherits ITimer_A {

instance:

    override config string name = "TimerA5";

    /*! Timer A5 Control Register */
    config TACTL_t TAxCTL = {
        TASSEL : TASSEL_0,
        ID : ID_0,
        MC : MC_0,
        TACLR : TACLR_OFF,
        TAIE : TAIE_OFF,
        TAIFG : TAIFG_OFF
    };

    /*! Capture/Compare Control 0 */
    config TACCTLx_t TACCTL0 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 1 */
    config TACCTLx_t TACCTL1 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 2 */
    config TACCTLx_t TACCTL2 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 3 */
    config TACCTLx_t TACCTL3 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 4 */
    config TACCTLx_t TACCTL4 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    config Bits16 TACCR0 = 0;                         /*! Capture/Compare 0 */
    config Bits16 TACCR1 = 0;                         /*! Capture/Compare 1 */
    config Bits16 TACCR2 = 0;                         /*! Capture/Compare 2 */
    config Bits16 TACCR3 = 0;                         /*! Capture/Compare 3 */
    config Bits16 TACCR4 = 0;                         /*! Capture/Compare 4 */

    /*! Timer interrupt enables */
    config regIntVect_t interruptSource[6];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "TACTL"   , regForceSet : false },
        { register : "TACCTL0" , regForceSet : false },
        { register : "TACCTL1" , regForceSet : false },
        { register : "TACCTL2" , regForceSet : false },
        { register : "TACCTL3" , regForceSet : false },
        { register : "TACCTL4" , regForceSet : false },
        { register : "TACCR0"  , regForceSet : false },
        { register : "TACCR1"  , regForceSet : false },
        { register : "TACCR2"  , regForceSet : false },
        { register : "TACCR3"  , regForceSet : false },
        { register : "TACCR4"  , regForceSet : false }
    ];
}

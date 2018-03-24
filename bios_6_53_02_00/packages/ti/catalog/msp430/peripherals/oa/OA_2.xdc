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
 *  ======== OA_2 ========
 *  MSP430 General Purpose Operational Amplifier
 *
 *  The module is named OA_2 because it only supports two OAs. A device
 *  containing three op-amps would require a separate module.
 */
metaonly module OA_2 inherits IOA {
    /*!
     *  ======== create ========
     *  Create an instance of this peripheral
     */
    create();

instance:
    /*! OA0 control register 0 */
    config OAxCTL0_t OA0CTL0 = {
      OAN : OAN_0,
      OAP : OAP_0,
      OAPM : OAPM_0,
      OAADC0 : OAADC0_OFF,
      OAADC1 : OAADC1_OFF
    };

    /*! OA0 control register 1 */
    config OAxCTL1_t OA0CTL1 = {
      OAFBR : OAFBR_0,
      OAFC : OAFC_0,
      OANEXT : OANEXT_OFF,
      OARRIP : OARRIP_OFF,
    };

    /*! OA1 control register 0 */
    config OAxCTL0_t OA1CTL0 = {
      OAN : OAN_0,
      OAP : OAP_0,
      OAPM : OAPM_0,
      OAADC0 : OAADC0_OFF,
      OAADC1 : OAADC1_OFF
    };

    /*! OA1 control register 1 */
    config OAxCTL1_t OA1CTL1 = {
      OAFBR : OAFBR_0,
      OAFC : OAFC_0,
      OANEXT : OANEXT_OFF,
      OARRIP : OARRIP_OFF,
    };

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "OA0CTL0" , regForceSet : false },
        { register : "OA0CTL1" , regForceSet : false },
        { register : "OA1CTL0" , regForceSet : false },
        { register : "OA1CTL1" , regForceSet : false }
    ];
}

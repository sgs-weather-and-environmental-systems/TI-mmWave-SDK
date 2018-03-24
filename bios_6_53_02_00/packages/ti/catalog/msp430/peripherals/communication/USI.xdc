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

import ti.catalog.msp430.peripherals.clock.IClock;

/*!
 * Universal Serial Interface
 */
metaonly module USI inherits IUSI {
    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

instance:
    /*! @_nodoc */
    config IClock.Instance clock;

    /*! USI Control Register 0 */
    config USICTL0_t USICTL0 = {
        USIPE7      : USIPE7_OFF,
        USIPE6      : USIPE6_OFF,
        USIPE5      : USIPE5_OFF,
        USILSB      : USILSB_OFF,
        USIMST      : USIMST_OFF,
        USIGE       : USIGE_OFF,
        USIOE       : USIOE_OFF,
        USISWRST    : USISWRST,
    };

    /*! USI Control Register 1 */
    config USICTL1_t USICTL1 = {
        USICKPH     : USICKPH_OFF,
        USII2C      : USII2C_OFF,
        USISTTIE    : USISTTIE_OFF,
        USIIE       : USIIE_OFF,
        USIAL       : USIAL_OFF,
        USISTP      : USISTP_OFF,
        USISTTIFG   : USISTTIFG_OFF,
        USIIFG      : USIIFG,
    };

    /*! USI Clock Control Register */
    config USICKCTL_t USICKCTL = {
        USIDIV      : USIDIV_0,
        USISSEL     : USISSEL_0,
        USICKPL     : USICKPL_OFF,
        USISWCLK    : USISWCLK_OFF,
    };

    /*! USI Bit Counter Register */
    config USICNT_t USICNT = {
        USISCLREL   : USISCLREL_OFF,
        USI16B      : USI16B_OFF,
        USIIFGCC    : USIIFGCC_OFF,
        USICNT4     : USICNT4_OFF,
        USICNT3     : USICNT3_OFF,
        USICNT2     : USICNT2_OFF,
        USICNT1     : USICNT1_OFF,
        USICNT0     : USICNT0_OFF,
    };

    /*! USI interrupt enables */
    config regIntVect_t interruptSource[2];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "USICTL0"    , regForceSet : false },
        { register : "USICTL1"    , regForceSet : false },
        { register : "USICKCTL"   , regForceSet : false },
        { register : "USICNT"     , regForceSet : false }
    ];
}

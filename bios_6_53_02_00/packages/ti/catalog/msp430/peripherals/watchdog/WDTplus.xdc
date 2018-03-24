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
 *  ======== WDT+ ========
 *  MSP430 Watchdog Timer+
 */
metaonly module WDTplus inherits IWDT
{
    enum WDTPW_t {
        WDTPW_OFF = 0x0000,         /*! no Watchdog password value */
        WDTPW     = 0x5A00          /*! Watchdog password */
    };

    enum WDTHOLD_t {
        WDTHOLD_OFF = 0x0000,       /*! Watchdog timer+ is not stopped */
        WDTHOLD     = 0x0080        /*! Watchdog timer+ is stopped */
    };

    enum WDTNMIES_t {
        WDTNMIES_OFF = 0x0000,      /*! NMI on rising edge */
        WDTNMIES     = 0x0040       /*! NMI on falling edge */
    };

    enum WDTNMI_t {
        WDTNMI_OFF = 0x0000,        /*! Reset function */
        WDTNMI     = 0x0020         /*! NMI function */
    };

    enum WDTTMSEL_t {
        WDTTMSEL_OFF = 0x0000,      /*! Watchdog mode */
        WDTTMSEL     = 0x0010       /*! Interval timer mode */
    };

    enum WDTCNTCL_t {
        WDTCNTCL_OFF = 0x0000,      /*! No action */
        WDTCNTCL     = 0x0008       /*! WDTCNT = 0000h */
    };

    enum WDTSSEL_t {
        WDTSSEL_OFF = 0x0000,       /*! SMCLK */
        WDTSSEL     = 0x0004        /*! ACLK */
    };

    enum WDTIS1_t {
        WDTIS1_OFF = 0x0000,        /*! Watchdog clock source bit1 disabled */
        WDTIS1     = 0x0002         /*! Watchdog clock source bit1 enabled */
    };

    enum WDTIS0_t {
        WDTIS0_OFF = 0x0000,        /*! Watchdog clock source bit0 disabled */
        WDTIS0     = 0x0001         /*! Watchdog clock source bit0 enabled */
    };

    /* WDTCTL Register */
    struct WDTCTL_t {
        WDTPW_t     WDTPW;          /*! WDT+ password */
        WDTHOLD_t   WDTHOLD;        /*! Watchdog timer+ hold. This bit stops the watchdog timer+. Setting
                                     *WDTHOLD = 1 when the WDT+ is not in use conserves power.
                                     *  0    Watchdog timer+ is not stopped
                                     *  1    Watchdog timer+ is stopped
                                     */
        WDTNMIES_t  WDTNMIES;       /*! Watchdog timer+ NMI edge select. This bit selects the interrupt edge for the
                                     *NMI interrupt when WDTNMI = 1. Modifying this bit can trigger an NMI. Modify
                                     *this bit when WDTIE = 0 to avoid triggering an accidental NMI.
                                     *  0    NMI on rising edge
                                     *  1    NMI on falling edge
                                     */
        WDTNMI_t    WDTNMI;         /*! Watchdog timer+ NMI select. This bit selects the function for the RST/NMI pin.
                                     *  0    Reset function
                                     *  1    NMI function
                                     */
        WDTTMSEL_t  WDTTMSEL;       /*! Watchdog timer+ mode select
                                     *  0    Watchdog mode
                                     *  1    Interval timer mode
                                     */
        WDTCNTCL_t  WDTCNTCL;       /*! Watchdog timer+ counter clear. Setting WDTCNTCL = 1 clears the count
                                     *value to 0000h. WDTCNTCL is automatically reset.
                                     *  0    No action
                                     *  1    WDTCNT = 0000h
                                     */
        WDTSSEL_t   WDTSSEL;        /*! Watchdog timer+ clock source select
                                     *  0    SMCLK
                                     *  1    ACLK
                                     */
        WDTIS0_t    WDTIS0;         /*! Watchdog timer+ interval select. These bits select the watchdog timer+
                                     *interval to set the WDTIFG flag and/or generate a PUC.
                                     *  00   Watchdog clock source /32768
                                     *  01   Watchdog clock source /8192
                                     *  10   Watchdog clock source /512
                                     *  11   Watchdog clock source /64
                                     */
        WDTIS1_t    WDTIS1;          /*! Watchdog timer+ interval select. These bits select the watchdog timer+
                                      *interval to set the WDTIFG flag and/or generate a PUC.
                                      *  00   Watchdog clock source /32768
                                      *  01   Watchdog clock source /8192
                                      *  10   Watchdog clock source /512
                                      *  11   Watchdog clock source /64
                                      */
    }

    create(IClock.Instance clock);

instance:
    /*! WDTCTL, Watchdog Timer+ Register */
    config WDTCTL_t WDTCTL = {
        WDTPW       : WDTPW,
        WDTHOLD     : WDTHOLD_OFF,
        WDTNMIES    : WDTNMIES_OFF,
        WDTNMI      : WDTNMI_OFF,
        WDTTMSEL    : WDTTMSEL_OFF,
        WDTCNTCL    : WDTCNTCL_OFF,
        WDTSSEL     : WDTSSEL_OFF,
        WDTIS0      : WDTIS0_OFF,
        WDTIS1      : WDTIS1_OFF,
    };

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "WDTCTL" , regForceSet : true }
    ];

    /*!
     *  ======== baseAddr ========
     *  Address of the peripheral's control register.
     *
     *  A peripheral's registers are commonly accessed through a structure
     *  that defines the offsets of a particular register from the lowest
     *  address mapped to a peripheral. That lowest address is specified by
     *  this parameter.
     */
    config UInt baseAddr;

    /*! @_nodoc */
    config IClock.Instance clock;
}

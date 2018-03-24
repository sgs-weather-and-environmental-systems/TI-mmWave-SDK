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
 * Universal Serial Communication Interface A0 UART 2xx
 */
metaonly module USCI_A0_UART_2xx inherits IUSCI_A0_UART {
    /* Add 2xx-specific stuff here */

    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

instance:
    /*! @_nodoc */
    config IClock.Instance clock;

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "UCA0CTL0"   , regForceSet : false },
        { register : "UCA0CTL1"   , regForceSet : false },
        { register : "UCA0BR0"    , regForceSet : false },
        { register : "UCA0BR1"    , regForceSet : false },
        { register : "UCA0MCTL"   , regForceSet : false },
        { register : "UCA0STAT"   , regForceSet : false },
        { register : "UCA0RXBUF"  , regForceSet : false },
        { register : "UCA0TXBUF"  , regForceSet : false },
        { register : "UCA0ABCTL"  , regForceSet : false },
        { register : "UCA0IRTCTL" , regForceSet : false },
        { register : "UCA0IRRCTL" , regForceSet : false }
    ];
}

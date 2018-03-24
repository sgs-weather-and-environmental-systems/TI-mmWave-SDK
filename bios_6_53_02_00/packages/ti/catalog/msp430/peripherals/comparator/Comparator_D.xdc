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
 *  ======== Comparator_D ========
 *  MSP430FR5xx Family Comparator_D Module
 */
metaonly module Comparator_D inherits IComparator {

    enum CDIE_t{
        CDIE_OFF    = 0x0000,       /*! Interrupt not enabled */
        CDIE        = 0x0100        /*! Interrupt enabled */
    };

    enum CDIIE_t{
        CDIIE_OFF   = 0x0000,       /*! Interrupt not enabled inverted polarity*/
        CDIIE       = 0x0200        /*! Interrupt enabled inverted polarity */
    };

    enum CDIFG_t{
        CDIFG_OFF   = 0x00,         /*! No interrupt pending */
        CDIFG       = 0x01          /*! Interrupt pending */
    };

    enum CDIIFG_t{
        CDIIFG_OFF  = 0x00,         /*! No inverted interrupt pending */
        CDIIFG      = 0x02          /*! Inverted interrupt pending */
    };

    struct CDIEALL_t {
        CDIE_t      CDIE;          /*!  Comparator D interrupt enable. This
                                    *   bit enables the CDIFG interrupt for
                                    *   comparator mode.
                                    *   0  Interrupt disabled
                                    *   1  Interrupt enabled */

        CDIIE_t      CDIIE;         /*! Comparator D interrupt enable inverted polarity. This
                                    *   bit enables the CDIIFG interrupt for
                                    *   comparator mode.
                                    *   0  Interrupt disabled
                                    *   1  Interrupt enabled */
    }

    struct CDIFGALL_t {
        CDIFG_t      CDIFG;         /*! Comparator D interrupt flag.
                                     *  0  No interrupt pending
                                     *  1  Interrupt pending */

        CDIIFG_t     CDIIFG;         /*! Comparator D interrupt flag.
                                     *  0  No inverted interrupt pending
                                     *  1  Inverted interrupt pending */
    }
instance:
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

     /*!
     *  ======== interruptSource ========
     *  Comparator_D has own interrupt enables
     *  thus interruptSource is defined here
     */
    config regIntVect_t interruptSource[2];

    /*!
     *  ======== CDIEALL ========
     * All the Interrupt Enables in Comparator_D
     */
    config CDIEALL_t CDIEALL = {
        CDIE        : CDIE_OFF,
        CDIIE       : CDIIE_OFF
    };

    /*!
     *  ======== CDIFGALL ========
     * All the Interrupt Flags in Comparator_D
     */
    config CDIFGALL_t CDIFGALL = {
        CDIFG       : CDIFG_OFF,
        CDIIFG      : CDIIFG_OFF
    };

    /*!
    *   ======== forceSetDefaultRegister ========
    * Determine if each Register needs to be forced set or not
    */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "CDIEALL" , regForceSet : false },
        { register : "CDIFGALL" , regForceSet : false },
    ];
}

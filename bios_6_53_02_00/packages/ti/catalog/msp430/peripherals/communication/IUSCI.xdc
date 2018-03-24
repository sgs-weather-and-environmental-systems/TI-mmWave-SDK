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
 *  ======== IUSCI ========
 *  Universal Serial Communication Interface
 */
metaonly interface IUSCI inherits xdc.platform.IPeripheral {
    /*****************************************************************
     * REGISTER BIT DEFINITIONS                                      *
     *****************************************************************/

    /*! MSB first select. Controls the direction of the receive and transmit shift register. */
    enum UCMSB_t {
        UCMSB_OFF = 0x00,       /*! LSB first */
        UCMSB = 0x02            /*! MSB first */
    };

    /*! Character length. Selects 7-bit or 8-bit character length. */
    enum UC7BIT_t {
        UC7BIT_OFF = 0x00,      /*! 8-bit */
        UC7BIT = 0x02           /*! 7-bit */
    };

    /*! Synchronous mode enable */
    enum UCSYNC_t {
        UCSYNC_OFF = 0x00,      /*! Asynchronous mode */
        UCSYNC = 0x02           /*! Synchronous Mode */
    };

    /*! Receive erroneous-character interrupt-enable */
    enum UCRXEIE_t {
        UCRXEIE_OFF = 0x00,     /*! Erroneous characters rejected and UCAxRXIFG is not set */
        UCRXEIE = 0x02          /*! Erroneous characters received will set UCAxRXIFG */
    };

    /*! Receive break character interrupt-enable */
    enum UCBRKIE_t {
        UCBRKIE_OFF = 0x00,     /*! Received break characters do not set UCAxRXIFG. */
        UCBRKIE = 0x02          /*! Received break characters set UCAxRXIFG. */
    };

    /*! Dormant. Puts USCI into sleep mode. */
    enum UCDORM_t {
        UCDORM_OFF = 0x00,      /*! Not dormant. All received characters will set UCAxRXIFG. */
        UCDORM = 0x02           /*! Dormant. Only characters that are preceded by an idle-line or with
                                 * address bit set will set UCAxRXIFG. In UART mode with automatic baud
                                 * rate detection only the combination of a break and synch field will set
                                 * UCAxRXIFG. */
    };

    /*! Transmit address. Next frame to be transmitted will be marked as address depending on the selected multiprocessor mode. */
    enum UCTXADDR_t {
        UCTXADDR_OFF = 0x00,    /*! Next frame transmitted is data */
        UCTXADDR = 0x02         /*! Next frame transmitted is an address */
    };

    /*! Transmit break. Transmits a break with the next write to the transmit buffer.
     * In UART mode with automatic baud rate detection 055h must be written
     * into UCAxTXBUF to generate the required break/synch fields. Otherwise
     * 0h must be written into the transmit buffer. */
    enum UCTXBRK_t {
        UCTXBRK_OFF = 0x00,     /*! Next frame transmitted is not a break */
        UCTXBRK = 0x02          /*! Next frame transmitted is a break or a break/synch */
    };

    /*! Software reset enable */
    enum UCSWRST_t {
        UCSWRST_OFF = 0x00,     /*! Disabled. USCI reset released for operation. */
        UCSWRST = 0x02          /*! Enabled. USCI logic held in reset state. */
    };

    /*! Listen enable. The UCLISTEN bit selects loopback mode. */
    enum UCLISTEN_t {
        UCLISTEN_OFF = 0x00,   /*! Disabled. */
        UCLISTEN = 0x02        /*! Enabled. UCAxTXD is internally fed back to the receiver. */
    };

    /*! Framing error flag */
    enum UCFE_t {
        UCFE_OFF = 0x00,        /*! 0 No error */
        UCFE = 0x02             /*! Character received with low stop bit */
    };

    /*! Overrun error flag. */
    enum UCOE_t {
        UCOE_OFF = 0x00,        /*! No error. */
        UCOE = 0x02             /*! Overrun error occurred. */
    };

    /*! Parity error flag. When UCPEN = 0, UCPE is read as 0. */
    enum UCPE_t {
        UCPE_OFF = 0x00,        /*! No error. */
        UCPE = 0x02             /*! Character received with parity error. */
    };

    /*! Break detect flag */
    enum UCBRK_t {
        UCBRK_OFF = 0x00,       /*! No break condition */
        UCBRK = 0x02            /*! Break condition occurred */
    };

    /*!  Bit 2 Receive error flag. This bit indicates a character was received with error(s).
     * When UCRXERR = 1, on or more error flags (UCFE, UCPE, UCOE) is also
     * set. UCRXERR is cleared when UCAxRXBUF is read. */
    enum UCRXERR_t {
        UCRXERR_OFF = 0x00,     /*! No receive errors detected */
        UCRXERR = 0x02          /*! Receive error detected */
    };

    /*! Address received in address-bit multiprocessor mode. */
    enum UCADDR_t {
        UCADDR_OFF = 0x00,      /*! Received character is data */
        UCADDR = 0x02           /*! Received character is an address */
    };

    /*!  Idle line detected in idle-line multiprocessor mode. */
    enum UCIDLE_t {
        UCIDLE_OFF = 0x00,      /*! No idle line detected */
        UCIDLE = 0x02           /*! Idle line detected */
    };

    /*! USCI busy. This bit indicates if a transmit or receive operation is in progress. */
    enum UCBUSY_t {
        UCBUSY_OFF = 0x00,      /*! USCI inactive */
        UCBUSY = 0x01           /*! USCI transmitting or receiving */
    };

    /*! USCI mode. The UCMODEx bits select the synchronous mode when UCSYNC = 1. */
    enum UCMODE_SYNC_t {
        UCMODE_0 = 0x00,        /*! 3-Pin SPI */
        UCMODE_1 = 0x01,        /*! 4-Pin SPI with UCxSTE active high: slave enabled when UCxSTE = 1 */
        UCMODE_2 = 0x02,        /*! 4-Pin SPI with UCxSTE active low: slave enabled when UCxSTE = 0 */
        UCMODE_3 = 0x04         /*! I2C Mode */
    };

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

instance:
    /*!
     * Stores the UCLK external clock frequency in float
     */
    config float UCLKHz = 1000000;

    /*!
    *  ======== setUCxxBR0 ========
    *  Sets UCxxBR0 register value based on which module
    *
    *  @see #setUCxxBR0
    */
    void setUCxxBR0(Bits8 value);

    /*!
    *  ======== getUCxxBR0 ========
    *  Returns UCxxBR0 register value based on which module
    *
    *  @see #getUCxxBR0
    */
    Bits8 getUCxxBR0();

    /*!
    *  ======== setUCxxBR1 ========
    *  Sets UCxxBR1 register value based on which module
    *
    *  @see #setUCxxBR1
    */
    void setUCxxBR1(Bits8 value);

    /*!
    *  ======== getUCxxBR1 ========
    *  Returns UCxxBR1 register value based on which module
    *
    *  @see #getUCxxBR1
    */
    Bits8 getUCxxBR1();

    /*!
     *  ======== getUCxxTXIE ========
     *  Gets UCxxTXIE bit
     *
     *  @see #getUCxxTXIE
     */
    Bool    getUCxxTXIE();

    /*!
     *  ======== setUCxxTXIE ========
     *  Sets UCxxTXIE bit
     *
     *  @see #setUCxxTXIE
     */
    Bool    setUCxxTXIE(Bool set);

    /*!
     *  ======== getUCxxRXIE ========
     *  Gets UCxxRXIE bit
     *
     *  @see #getUCxxRXIE
     */
    Bool    getUCxxRXIE();

    /*!
     *  ======== setUCxxRXIE ========
     *  Sets UCxxRXIE bit
     *
     *  @see #setUCxxRXIE
     */
    Bool    setUCxxRXIE(Bool set);
}

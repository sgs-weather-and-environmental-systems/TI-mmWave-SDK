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
 * Universal Serial Communication Interface
 */
metaonly interface IUSCI_UART inherits IUSCI {

    //*****************************************************************
    //* REGISTER BIT DEFINITIONS                                      *
    //*****************************************************************

    /*! Parity enable */
    enum UCPEN_t {
        UCPEN_OFF = 0x00,       /*! Parity Disabled */
        UCPEN = 0x02            /*! Parity Enabled */
    };

    /*! Parity select. UCPAR is not used when parity is disabled. */
    enum UCPAR_t {
        UCPAR_OFF = 0x00,       /*! Odd parity */
        UCPAR = 0x02            /*! Even parity */
    };

    /*! Stop bit select. Number of stop bits. */
    enum UCSPB_t {
        UCSPB_OFF = 0x00,       /*! One stop bit */
        UCSPB = 0x02            /*! Two stop bits */
    };

    /*! First modulation stage select */
    enum UCBRF_t {
        UCBRF_0 = 0x00,         /*! First stage 0 */
        UCBRF_1 = 0x10,         /*! First stage 1 */
        UCBRF_2 = 0x20,         /*! First stage 2 */
        UCBRF_3 = 0x30,         /*! First stage 3 */
        UCBRF_4 = 0x40,         /*! First stage 4 */
        UCBRF_5 = 0x50,         /*! First stage 5 */
        UCBRF_6 = 0x60,         /*! First stage 6 */
        UCBRF_7 = 0x70,         /*! First stage 7 */
        UCBRF_8 = 0x80,         /*! First stage 8 */
        UCBRF_9 = 0x90,         /*! First stage 9 */
        UCBRF_10 = 0xA0,        /*! First stage 10 */
        UCBRF_11 = 0xB0,        /*! First stage 11 */
        UCBRF_12 = 0xC0,        /*! First stage 12 */
        UCBRF_13 = 0xD0,        /*! First stage 13 */
        UCBRF_14 = 0xE0,        /*! First stage 14 */
        UCBRF_15 = 0xF0         /*! First stage 15 */
    };

    /*! Second modulation stage select */
    enum UCBRS_t {
        UCBRS_0 = 0x00,         /*! Second stage 0 */
        UCBRS_1 = 0x02,         /*! Second stage 1 */
        UCBRS_2 = 0x04,         /*! Second stage 2 */
        UCBRS_3 = 0x06,         /*! Second stage 3 */
        UCBRS_4 = 0x08,         /*! Second stage 4 */
        UCBRS_5 = 0x0A,         /*! Second stage 5 */
        UCBRS_6 = 0x0C,         /*! Second stage 6 */
        UCBRS_7 = 0x0E          /*! Second stage 7 */
    };

    /*! Oversampling mode enabled */
    enum UCOS16_t {
        UCOS16_OFF = 0x00,      /*! Disabled. */
        UCOS16 = 0x02           /*! Enabled. */
    };


        /*! IRDA Transmit Pulse Length Bit 5 */
    enum UCIRTXPL5_t {
        UCIRTXPL5_OFF = 0x00,   /*! Bit 5 OFF */
        UCIRTXPL5 = 0x80        /*! Bit 5 ON */
    };

    /*! IRDA Transmit Pulse Length Bit 4 */
    enum UCIRTXPL4_t {
        UCIRTXPL4_OFF = 0x00,   /*! Bit 4 OFF */
        UCIRTXPL4 = 0x40        /*! Bit 4 ON */
    };

    /*! IRDA Transmit Pulse Length Bit 3 */
    enum UCIRTXPL3_t {
        UCIRTXPL3_OFF = 0x00,   /*! Bit 3 OFF */
        UCIRTXPL3 = 0x20        /*! Bit 3 ON */
    };

    /*! IRDA Transmit Pulse Length Bit 2 */
    enum UCIRTXPL2_t {
        UCIRTXPL2_OFF = 0x00,   /*! Bit 2 OFF */
        UCIRTXPL2 = 0x10        /*! Bit 2 ON */
    };

    /*! IRDA Transmit Pulse Length Bit 1 */
    enum UCIRTXPL1_t {
        UCIRTXPL1_OFF = 0x00,   /*! Bit 1 OFF */
        UCIRTXPL1 = 0x08        /*! Bit 1 ON */
    };

    /*! IRDA Transmit Pulse Length Bit 0 */
    enum UCIRTXPL0_t {
        UCIRTXPL0_OFF = 0x00,   /*! Bit 0 OFF */
        UCIRTXPL0 = 0x04        /*! Bit 0 ON */
    };

    /*! IrDA transmit pulse clock select. */
    enum UCIRTXCLK_t {
        UCIRTXCLK_OFF = 0x00,   /*! BRCLK. */
        UCIRTXCLK = 0x02        /*! BITCLK16 when UCOS16 = 1. Otherwise, BRCLK. */
    };

    /*! IrDA encoder/decoder enable. */
    enum UCIREN_t {
        UCIREN_OFF = 0x00,      /*! IrDA encoder/decoder disabled. */
        UCIREN = 0x02           /*! IrDA encoder/decoder enabled. */
    };

    /*! IRDA Receive Filter Length Bit 5 */
    enum UCIRRXFL5_t {
        UCIRRXFL5_OFF = 0x00,   /*! Bit 5 OFF */
        UCIRRXFL5 = 0x80        /*! Bit 5 ON */
    };

    /*! IRDA Receive Filter Length Bit 4 */
    enum UCIRRXFL4_t {
        UCIRRXFL4_OFF = 0x00,   /*! Bit 4 OFF */
        UCIRRXFL4 = 0x40        /*! Bit 4 ON */
    };

    /*! IRDA Receive Filter Length Bit 3 */
    enum UCIRRXFL3_t {
        UCIRRXFL3_OFF = 0x00,   /*! Bit 3 OFF */
        UCIRRXFL3 = 0x20        /*! Bit 3 ON */
    };

    /*! IRDA Receive Filter Length Bit 2 */
    enum UCIRRXFL2_t {
        UCIRRXFL2_OFF = 0x00,   /*! Bit 2 OFF */
        UCIRRXFL2 = 0x10        /*! Bit 2 ON */
    };

    /*! IRDA Receive Filter Length Bit 1 */
    enum UCIRRXFL1_t {
        UCIRRXFL1_OFF = 0x00,   /*! Bit 1 OFF */
        UCIRRXFL1 = 0x08        /*! Bit 1 ON */
    };

    /*! IRDA Receive Filter Length Bit 0 */
    enum UCIRRXFL0_t {
        UCIRRXFL0_OFF = 0x00,   /*! Bit 0 OFF */
        UCIRRXFL0 = 0x04        /*! Bit 0 ON */
    };

    /*! IrDA receive input UCAxRXD polarity. */
    enum UCIRRXPL_t {
        UCIRRXPL_OFF = 0x00,    /*! IrDA transceiver delivers a high pulse when a light pulse is seen. */
        UCIRRXPL = 0x02         /*! IrDA transceiver delivers a low pulse when a light pulse is seen. */
    };

    /*! IrDA receive filter enabled. */
    enum UCIRRXFE_t {
        UCIRRXFE_OFF = 0x00,    /*! Receive filter disabled. */
        UCIRRXFE = 0x02         /*! Receive filter enabled. */
    };

    /*! Break/synch delimiter length bit 0 */
    enum UCDELIM0_t {
        UCDELIM0_OFF = 0x00,    /*! Break Sync Delimiter bit 0 Off */
        UCDELIM0 = 0x02         /*! Break Sync Delimiter bit 0 On */
    };

    /*! Break/synch delimiter length bit 1 */
    enum UCDELIM1_t {
        UCDELIM1_OFF = 0x00,    /*! Break Sync Delimiter bit 1 Off */
        UCDELIM1 = 0x02         /*! Break Sync Delimiter bit 1 On */
    };

    /*! Synch field time out error. */
    enum UCSTOE_t {
        UCSTOE_OFF = 0x00,      /*! No error. */
        UCSTOE = 0x02           /*! Length of synch field exceeded measurable time. */
    };

    /*! Break time out error. */
    enum UCBTOE_t {
        UCBTOE_OFF = 0x00,      /*! No error. */
        UCBTOE = 0x02           /*! Length of break field exceeded 22 bit times. */
    };

    /*! Automatic baud rate detect enable. */
    enum UCABDEN_t {
        UCABDEN_OFF = 0x00,     /*! Baud rate detection disabled. Length of break and synch field is not
                                 * measured. */
        UCABDEN = 0x02          /*! Baud rate detection enabled. Length of break and synch field is
                                 * measured and baud rate settings are changed accordingly. */
    };

    /*! USCI mode. The UCMODEx bits select the asynchronous mode when UCSYNC = 0. */
    enum UCMODE_ASYNC_t {
        UCMODE_0 = 0x00,        /*! UART Mode. */
        UCMODE_1 = 0x01,        /*! Idle-Line Multiprocessor Mode. */
        UCMODE_2 = 0x02,        /*! Address-Bit Multiprocessor Mode. */
        UCMODE_3 = 0x04         /*! UART Mode with automatic baud rate detection. */
    };

    /*! USCI clock source select. These bits select the BRCLK source clock. */
    enum UCSSEL_UART_t {
        UCSSEL_0 = 0x00,        /*! UCLK */
        UCSSEL_1 = 0x01,        /*! ACLK */
        UCSSEL_2 = 0x02         /*! SMCLK */
/*        UCSSEL_3 = 0x04         /*! SMCLK */
    };

    struct UCxCTL0_t {
        UCPEN_t     UCPEN;      /*! Parity enable
                                 *  0  Parity disabled.
                                 *  1  Parity enabled. Parity bit is generated (UCAxTXD) and expected
                                 *     (UCAxRXD). In address-bit multiprocessor mode, the address bit is
                                 *     included in the parity calculation. */
        UCPAR_t     UCPAR;      /*! Parity select. UCPAR is not used when parity is disabled.
                                 *  0  Odd parity
                                 *  1  Even parity */
        UCMSB_t     UCMSB;      /*! MSB first select. Controls the direction of the receive and transmit shift
                                 *register.
                                 *  0  LSB first
                                 *  1  MSB first */
        UC7BIT_t    UC7BIT;     /*! Character length. Selects 7-bit or 8-bit character length.
                                 *  0  8-bit data
                                 *  1  7-bit data */
        UCSPB_t     UCSPB;      /*! Stop bit select. Number of stop bits.
                                 *  0  One stop bit
                                 *  1  Two stop bits */
        UCMODE_ASYNC_t UCMODE;  /*! USCI mode. The UCMODEx bits select the asynchronous mode when
                                 *UCSYNC = 0.
                                 *  00  UART Mode.
                                 *  01  Idle-Line Multiprocessor Mode.
                                 *  10  Address-Bit Multiprocessor Mode.
                                 *  11  UART Mode with automatic baud rate detection. */
        UCSYNC_t    UCSYNC;     /*!Synchronous mode enable
                                 *  0  Asynchronous mode
                                 *  1  Synchronous Mode */
    }

    struct UCxCTL1_t {
        UCSSEL_UART_t UCSSEL;   /*! USCI clock source select. These bits select the BRCLK source clock.
                                 *  00  UCLK
                                 *  01  ACLK
                                 *  10  SMCLK
                                 *  11  SMCLK */
        UCRXEIE_t   UCRXEIE;    /*! Receive erroneous-character interrupt-enable
                                 *  0  Erroneous characters rejected and UCAxRXIFG is not set
                                 *  1  Erroneous characters received will set UCAxRXIFG */
        UCBRKIE_t   UCBRKIE;    /*! Receive break character interrupt-enable
                                 *  0  Received break characters do not set UCAxRXIFG.
                                 *  1  Received break characters set UCAxRXIFG. */
        UCDORM_t    UCDORM;     /*! Dormant. Puts USCI into sleep mode.
                                 *  0  Not dormant. All received characters will set UCAxRXIFG.
                                 *  1  Dormant. Only characters that are preceded by an idle-line or with
                                 *     address bit set will set UCAxRXIFG. In UART mode with automatic baud
                                 *     rate detection only the combination of a break and synch field will set
                                 *     UCAxRXIFG. */
        UCTXADDR_t  UCTXADDR;   /*! Transmit address. Next frame to be transmitted will be marked as address
                                 *depending on the selected multiprocessor mode.
                                 *  0  Next frame transmitted is data
                                 *  1  Next frame transmitted is an address */
        UCTXBRK_t   UCTXBRK;    /*! Transmit break. Transmits a break with the next write to the transmit buffer.
                                 *In UART mode with automatic baud rate detection 055h must be written
                                 *into UCAxTXBUF to generate the required break/synch fields. Otherwise
                                 *0h must be written into the transmit buffer.
                                 *   0  Next frame transmitted is not a break
                                 *   1  Next frame transmitted is a break or a break/synch */
        UCSWRST_t   UCSWRST;    /*! Software reset enable
                                 *   0  Disabled. USCI reset released for operation.
                                 *   1  Enabled. USCI logic held in reset state. */
    }

    struct UCxMCTL_t {
        UCBRF_t     UCBRF;      /*! First modulation stage select. These bits determine the modulation pattern
                                 *for BITCLK16 when UCOS16 = 1. Ignored with UCOS16 = 0. */
        UCBRS_t     UCBRS;      /*! Second modulation stage select. These bits determine the modulation
                                 *pattern for BITCLK. */
        UCOS16_t    UCOS16;     /*! Oversampling mode enabled
                                 *  0  Disabled
                                 *  1  Enabled */
    }

    struct UCxSTAT_t {
        UCLISTEN_t  UCLISTEN;   /*! Listen enable. The UCLISTEN bit selects loopback mode.
                                 *  0  Disabled
                                 *  1  Enabled. UCAxTXD is internally fed back to the receiver. */
        UCFE_t      UCFE;       /*! Framing error flag
                                 *  0  No error
                                 *  1  Character received with low stop bit */
        UCOE_t      UCOE;       /*! Overrun error flag. This bit is set when a character is transferred into
                                 *UCAxRXBUF before the previous character was read. UCOE is cleared
                                 *automatically when UCxRXBUF is read, and must not be cleared by
                                 *software. Otherwise, it will not function correctly.
                                 *  0  No error
                                 *  1  Overrun error occurred */
        UCPE_t      UCPE;       /*! Parity error flag. When UCPEN = 0, UCPE is read as 0.
                                 *  0  No error
                                 *  1  Character received with parity error */
        UCBRK_t     UCBRK;      /*! Break detect flag
                                 *  0  No break condition
                                 *  1  Break condition occurred */
        UCRXERR_t   UCRXERR;    /*! Receive error flag. This bit indicates a character was received with error(s).
                                 *When UCRXERR = 1, on or more error flags (UCFE, UCPE, UCOE) is also
                                 *set. UCRXERR is cleared when UCAxRXBUF is read.
                                 *  0  No receive errors detected
                                 *  1  Receive error detected */
        UCADDR_t    UCADDR;     /*! Address received in address-bit multiprocessor mode.
                                 *  0  Received character is data
                                 *  1  Received character is an address */
        UCIDLE_t    UCIDLE;     /*! Idle line detected in idle-line multiprocessor mode.
                                 *  0  No idle line detected
                                 *  1  Idle line detected */
        UCBUSY_t    UCBUSY;     /*! USCI busy. This bit indicates if a transmit or receive operation is in
                                 *progress.
                                 *  0  USCI inactive
                                 *  1  USCI transmitting or receiving */
    }

    struct UCxIRTCTL_t {
        UCIRTXPL5_t  UCIRTXPL5; /*! IRDA Transmit Pulse Length Bit 5 */
        UCIRTXPL4_t  UCIRTXPL4; /*! IRDA Transmit Pulse Length Bit 4 */
        UCIRTXPL3_t  UCIRTXPL3; /*! IRDA Transmit Pulse Length Bit 3 */
        UCIRTXPL2_t  UCIRTXPL2; /*! IRDA Transmit Pulse Length Bit 2 */
        UCIRTXPL1_t  UCIRTXPL1; /*! IRDA Transmit Pulse Length Bit 1 */
        UCIRTXPL0_t  UCIRTXPL0; /*! IRDA Transmit Pulse Length Bit 0 */
        UCIRTXCLK_t  UCIRTXCLK; /*! IrDA transmit pulse clock select
                                 *  0  BRCLK
                                 *  1  BITCLK16 when UCOS16 = 1. Otherwise, BRCLK */
        UCIREN_t     UCIREN;    /*! IrDA encoder/decoder enable.
                                 *  0  IrDA encoder/decoder disabled
                                 *  1  IrDA encoder/decoder enabled */
    }

    struct UCxIRRCTL_t {
        UCIRRXFL5_t  UCIRRXFL5; /*! IRDA Receive Filter Length Bit 5 */
        UCIRRXFL4_t  UCIRRXFL4; /*! IRDA Receive Filter Length Bit 4 */
        UCIRRXFL3_t  UCIRRXFL3; /*! IRDA Receive Filter Length Bit 3 */
        UCIRRXFL2_t  UCIRRXFL2; /*! IRDA Receive Filter Length Bit 2 */
        UCIRRXFL1_t  UCIRRXFL1; /*! IRDA Receive Filter Length Bit 1 */
        UCIRRXFL0_t  UCIRRXFL0; /*! IRDA Receive Filter Length Bit 0 */
        UCIRRXPL_t   UCIRRXPL;  /*! IrDA receive input UCAxRXD polarity
                                 *  0  IrDA transceiver delivers a high pulse when a light pulse is seen
                                 *  1  IrDA transceiver delivers a low pulse when a light pulse is seen */
        UCIRRXFE_t   UCIRRXFE;  /*! IrDA receive filter enabled
                                 *  0  Receive filter disabled
                                 *  1  Receive filter enabled */
    }

    struct UCxABCTL_t {
        UCDELIM1_t   UCDELIM1;  /*! Break/synch delimiter length
                                 *  00  1 bit time
                                 *  01  2 bit times
                                 *  10  3 bit times
                                 *  11  4 bit times */
        UCDELIM0_t   UCDELIM0;  /*! Break/synch delimiter length
                                 *  00  1 bit time
                                 *  01  2 bit times
                                 *  10  3 bit times
                                 *  11  4 bit times */
        UCSTOE_t     UCSTOE;    /*! Synch field time out error
                                 *  0  No error
                                 *  1  Length of synch field exceeded measurable time */
        UCBTOE_t     UCBTOE;    /*! Break time out error
                                 *  0  No error
                                 *  1  Length of break field exceeded 22 bit times */
        UCABDEN_t    UCABDEN;   /*! Automatic baud rate detect enable
                                 *  0  Baud rate detection disabled. Length of break and synch field is not
                                 *     measured.
                                 *  1  Baud rate detection enabled. Length of break and synch field is
                                 *     measured and baud rate settings are changed accordingly. */
    }
}

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
metaonly interface IUSCI_SPI inherits IUSCI {

    //*****************************************************************
    //* REGISTER BIT DEFINITIONS                                      *
    //*****************************************************************

    /*! Clock phase select. */
    enum UCCKPH_t {
        UCCKPH_OFF = 0x00,      /*! Data is changed on the first UCLK edge and captured on the following edge. */
        UCCKPH = 0x80           /*! Data is captured on the first UCLK edge and changed on the following edge. */
    };

    /*! Clock polarity select. */
    enum UCCKPL_t {
        UCCKPL_OFF = 0x00,      /*! Inactive state is low */
        UCCKPL = 0x40           /*! Inactive state is high */
    };

    /*! Master mode select */
    enum UCMST_t {
        UCMST_OFF = 0x00,       /*! Slave mode */
        UCMST = 0x40            /*! Master mode */
    };

    /*! USCI clock source select. These bits select the BRCLK source clock. */
    enum UCSSEL_SPI_t {
        UCSSEL_0 = 0x00,        /*! NA */
        UCSSEL_1 = 0x01,        /*! ACLK */
        UCSSEL_2 = 0x02         /*! SMCLK */
/*        UCSSEL_3 = 0x04      /*! SMCLK */
    };

    struct UCxCTL0_t {
        UCCKPH_t    UCCKPH;     /*! Clock phase select.
                                 *  0  Data is changed on the first UCLK edge and captured on the
                                 *     following edge.
                                 *  1  Data is captured on the first UCLK edge and changed on the
                                 *     following edge. */
        UCCKPL_t    UCCKPL;     /*! Clock polarity select
                                 *  0  The inactive state is low
                                 *  1  The inactive state is high */
        UCMSB_t     UCMSB;      /*! MSB first select. Controls the direction of the receive and transmit shift
                                 *register.
                                 *  0  LSB first
                                 *  1  MSB first */
        UC7BIT_t    UC7BIT;     /*! Character length. Selects 7-bit or 8-bit character length.
                                 *  0  8-bit data
                                 *  1  7-bit data */
        UCMST_t     UCMST;      /*! Master mode select
                                 *  0  Slave mode
                                 *  1  Master mode */
        UCMODE_SYNC_t UCMODE;   /*! USCI mode. The UCMODEx bits select the synchronous mode when
                                 *UCSYNC = 1.
                                 *  00  3-Pin SPI
                                 *  01  4-Pin SPI with UCxSTE active high: slave enabled when UCxSTE = 1
                                 *  10  4-Pin SPI with UCxSTE active low: slave enabled when UCxSTE = 0
                                 *  11  I2C Mode */
        UCSYNC_t    UCSYNC;     /*! Synchronous mode enable
                                 *  0  Asynchronous mode
                                 *  1  Synchronous Mode */
    }

    struct UCxCTL1_t {
        UCSSEL_SPI_t UCSSEL;    /*! USCI clock source select. These bits select the BRCLK source clock in
                                 *master mode. UCxCLK is always used in slave mode.
                                 *  00  NA
                                 *  01  ACLK
                                 *  10  SMCLK
                                 *  11  SMCLK */
        UCSWRST_t    UCSWRST;   /*! Software reset enable
                                 *  0  Disabled. USCI reset released for operation.
                                 *  1  Enabled. USCI logic held in reset state. */
    }

    struct UCxSTAT_t {
        UCLISTEN_t  UCLISTEN;   /*! Listen enable. The UCLISTEN bit selects loopback mode.
                                 *  0  Disabled
                                 *  1  Enabled. UCAxTXD is internally fed back to the receiver. */
        UCFE_t      UCFE;       /*! Framing error flag. This bit indicates a bus conflict in 4-wire master mode.
                                 *UCFE is not used in 3-wire master or any slave mode.
                                 *  0  No error
                                 *  1  Bus conflict occurred */
        UCOE_t      UCOE;       /*! Overrun error flag. This bit is set when a character is transferred into
                                 *UCAxRXBUF before the previous character was read. UCOE is cleared
                                 *automatically when UCxRXBUF is read, and must not be cleared by
                                 *software. Otherwise, it will not function correctly.
                                 *  0  No error
                                 *  1  Overrun error occurred */
        UCBUSY_t    UCBUSY;     /*! USCI busy. This bit indicates if a transmit or receive operation is in
                                 *progress.
                                 *  0  USCI inactive
                                 *  1  USCI transmitting or receiving */
    }
}

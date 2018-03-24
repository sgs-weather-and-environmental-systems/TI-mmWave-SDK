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
 *  ======== IUSI ========
 *  Universal Serial Interface
 */
metaonly interface IUSI inherits xdc.platform.IPeripheral {
    /*****************************************************************
     * REGISTER BIT DEFINITIONS                                      *
     *****************************************************************/

    /*! USI SDI/SDA port enable.
     *Input in SPI mode, input or open drain output in I2C mode. */
    enum USIPE7_t {
        USIPE7_OFF = 0x00,      /*! USI function disabled */
        USIPE7 = 0x80           /*! USI function enabled */
    };

    /*! USI SDO/SCL port enable.
     *Output in SPI mode, input or open drain output in I2C mode. */
    enum USIPE6_t {
        USIPE6_OFF = 0x00,      /*! USI function disabled */
        USIPE6 = 0x40           /*! USI function enabled */
    };

    /*! USI SCLK port enable.
     *Input in SPI slave mode, or I2C mode, output in SPI master mode. */
    enum USIPE5_t {
        USIPE5_OFF = 0x00,      /*! USI function disabled */
        USIPE5 = 0x20           /*! USI function enabled */
    };

    /*! LSB first select. This bit controls the direction of the receive and transmit shift register. */
    enum USILSB_t {
        USILSB_OFF = 0x00,      /*! MSB first */
        USILSB = 0x10           /*! LSB first */
    };

    /*! Master select */
    enum USIMST_t {
        USIMST_OFF = 0x00,      /*! Slave mode */
        USIMST = 0x08           /*! Master mode */
    };

    /*! Output latch control */
    enum USIGE_t {
        USIGE_OFF = 0x00,       /*! Output latch enable depends on shift clock */
        USIGE = 0x04            /*! Output latch always enabled and transparent */
    };

    /*! Data output enable */
    enum USIOE_t {
        USIOE_OFF = 0x00,       /*! Output disabled */
        USIOE = 0x02            /*! Output enabled */
    };

    /*! USI software reset */
    enum USISWRST_t {
        USISWRST_OFF = 0x00,    /*! USI released for operation. */
        USISWRST = 0x01         /*! USI logic held in reset state. */
    };

    /*! Clock phase select */
    enum USICKPH_t {
        USICKPH_OFF = 0x00,     /*! Data is changed on the first SCLK edge and captured on the following edge. */
        USICKPH = 0x80          /*! Data is captured on the first SCLK edge and changed on the following edge. */
    };

    /*! I2C mode enable */
    enum USII2C_t {
        USII2C_OFF = 0x00,      /*! I2C mode disabled */
        USII2C = 0x40           /*! I2C mode enabled */
    };

    /*! START condition interrupt-enable */
    enum USISTTIE_t {
        USISTTIE_OFF = 0x00,    /*! Interrupt on START condition disabled */
        USISTTIE = 0x20         /*! Interrupt on START condition enabled */
    };

    /*! USI counter interrupt enable */
    enum USIIE_t {
        USIIE_OFF = 0x00,       /*! Interrupt disabled */
        USIIE = 0x10            /*! Interrupt enabled */
    };

    /*! Arbitration lost */
    enum USIAL_t {
        USIAL_OFF = 0x00,       /*! No arbitration lost condition */
        USIAL = 0x08            /*! Arbitration lost */
    };

    /*! STOP condition received. USISTP is automatically cleared if USICNTx is
       *loaded with a value > 0 when USIIFGCC = 0. */
    enum USISTP_t {
        USISTP_OFF = 0x00,     /*! No STOP condition received */
        USISTP = 0x04          /*! STOP condition received */
    };

    /*! START condition interrupt flag */
    enum USISTTIFG_t {
        USISTTIFG_OFF = 0x00,  /*! No START condition received. No interrupt pending. */
        USISTTIFG = 0x02       /*! START condition received. Interrupt pending. */
    };

    /*! USI counter interrupt flag. Set when the USICNTx = 0. Automatically
       *cleared if USICNTx is loaded with a value > 0 when USIIFGCC = 0. */
    enum USIIFG_t {
        USIIFG_OFF = 0x00,     /*! No interrupt pending */
        USIIFG = 0x01          /*! Interrupt pending */
    };

    /*! Clock divider select */
    enum USIDIV_t {
        USIDIV_0 = 0x00,       /*! Divide by 1 */
        USIDIV_1 = 0x20,       /*! Divide by 2 */
        USIDIV_2 = 0x40,       /*! Divide by 4 */
        USIDIV_3 = 0x60,       /*! Divide by 8 */
        USIDIV_4 = 0x80,       /*! Divide by 16 */
        USIDIV_5 = 0xA0,       /*! Divide by 32 */
        USIDIV_6 = 0xC0,       /*! Divide by 64 */
        USIDIV_7 = 0xE0        /*! Divide by 128 */
    };

    /*! Clock source select. Not used in slave mode. */
    enum USISSEL_t {
        USISSEL_0 = 0x00,      /*! SCLK (Not used in SPI mode) */
        USISSEL_1 = 0x04,      /*! ACLK */
        USISSEL_2 = 0x08,      /*! SMCLK */
        USISSEL_3 = 0x0C,      /*! SMCLK */
        USISSEL_4 = 0x10,      /*! USISWCLK bit */
        USISSEL_5 = 0x14,      /*! TACCR0 */
        USISSEL_6 = 0x18,      /*! TACCR1 */
        USISSEL_7 = 0x1C       /*! TACCR2 (Reserved on MSP430F20xx devices) */
    };

    /*! Clock polarity select */
    enum USICKPL_t {
        USICKPL_OFF = 0x00,     /*! Inactive state is low */
        USICKPL = 0x02          /*! Inactive state is high */
    };

    /*! Software clock */
    enum USISWCLK_t {
        USISWCLK_OFF = 0x00,    /*! Input clock is low */
        USISWCLK = 0x01         /*! Input clock is high */
    };

    /*! SCL release. The SCL line is released from low to idle. USISCLREL is
       *cleared if a START condition is detected. */
    enum USISCLREL_t {
        USISCLREL_OFF = 0x00,   /*! SCL line is held low if USIIFG is set */
        USISCLREL = 0x80        /*! SCL line is released */
    };

    /*! 16-bit shift register enable */
    enum USI16B_t {
        USI16B_OFF = 0x00,      /*! 8-bit shift register mode. Low byte register USISRL is used. */
        USI16B = 0x40           /*! 16-bit shift register mode. Both high and low byte registers USISRL
                                   *and USISRH are used. USISR addresses all 16 bits simultaneously. */
    };

    /*! USI interrupt flag clear control. When USIIFGCC = 1 the USIIFG will not be
       *cleared automatically when USICNTx is written with a value > 0. */
    enum USIIFGCC_t {
        USIIFGCC_OFF = 0x00,    /*! USIIFG automatically cleared on USICNTx update */
        USIIFGCC = 0x20         /*! USIIFG is not cleared automatically */
    };

    /*! USI bit count - Bit4 */
    enum USICNT4_t {
        USICNT4_OFF = 0x00,     /*! USI bit count */
        USICNT4 = 0x10          /*! USI bit count */
    };

    /*! USI bit count - Bit3 */
    enum USICNT3_t {
        USICNT3_OFF = 0x00,     /*! USI bit count */
        USICNT3 = 0x08          /*! USI bit count */
    };

    /*! USI bit count - Bit2 */
    enum USICNT2_t {
        USICNT2_OFF = 0x00,     /*! USI bit count */
        USICNT2 = 0x04          /*! USI bit count */
    };

    /*! USI bit count - Bit1 */
    enum USICNT1_t {
        USICNT1_OFF = 0x00,     /*! USI bit count */
        USICNT1 = 0x02          /*! USI bit count */
    };

    /*! USI bit count - Bit0 */
    enum USICNT0_t {
        USICNT0_OFF = 0x00,     /*! USI bit count */
        USICNT0 = 0x01          /*! USI bit count */
    };

    struct USICTL0_t {
        USIPE7_t    USIPE7;     /*! USI SDI/SDA port enable.
                                 *Input in SPI mode, input or open drain output in I2C mode.
                                 *  0  USI function disabled
                                 *  1  USI function enabled */
        USIPE6_t    USIPE6;     /*! USI SDO/SCL port enable.
                                 *Output in SPI mode, input or open drain output in I2C mode.
                                 *  0  USI function disabled
                                 *  1  USI function enabled */
        USIPE5_t    USIPE5;     /*! USI SCLK port enable.
                                 *Input in SPI slave mode, or I2C mode, output in SPI master mode.
                                 *  0  USI function disabled
                                 *  1  USI function enabled */
        USILSB_t    USILSB;     /*! LSB first select. This bit controls the direction of the receive and transmit shift register.
                                 *  0  MSB first
                                 *  1  LSB first */
        USIMST_t    USIMST;     /*! Master select
                                 *  0  Slave mode
                                 *  1  Master mode */
        USIGE_t     USIGE;      /*! Output latch control
                                 *  0  Output latch enable depends on shift clock
                                 *  1  Output latch always enabled and transparent */
        USIOE_t     USIOE;      /*! Data output enable
                                 *  0  Output disabled
                                 *  1  Output enabled */
        USISWRST_t  USISWRST;   /*! USI software reset
                                 *  0  USI released for operation.
                                 *  1  USI logic held in reset state. */
    }

    struct USICTL1_t {
        USICKPH_t   USICKPH;    /*! Clock phase select
                                 *  0  Data is changed on the first SCLK edge and captured on the
                                 *     following edge.
                                 *  1  Data is captured on the first SCLK edge and changed on the
                                 *     following edge. */
        USII2C_t    USII2C;     /*! I2C mode enable
                                 *  0  I2C mode disabled
                                 *  1  I2C mode enabled*/
        USISTTIE_t  USISTTIE;   /*! START condition interrupt-enable
                                 *  0  Interrupt on START condition disabled
                                 *  1  Interrupt on START condition enabled */
        USIIE_t     USIIE;      /*! USI counter interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        USIAL_t     USIAL;      /*! Arbitration lost
                                 *  0  No arbitration lost condition
                                 *  1  Arbitration lost */
        USISTP_t    USISTP;     /*! STOP condition received. USISTP is automatically cleared if USICNTx is
                                 *loaded with a value > 0 when USIIFGCC = 0.
                                 *  0  No STOP condition received
                                 *  1  STOP condition received */
        USISTTIFG_t USISTTIFG;  /*! START condition interrupt flag
                                 *  0  No START condition received. No interrupt pending.
                                 *  1  START condition received. Interrupt pending. */
        USIIFG_t    USIIFG;     /*! USI counter interrupt flag. Set when the USICNTx = 0. Automatically
                                 *cleared if USICNTx is loaded with a value > 0 when USIIFGCC = 0.
                                 *  0  No interrupt pending
                                 *  1  Interrupt pending */
    }

    struct USICKCTL_t {
        USIDIV_t    USIDIV;     /*! Clock divider select
                                 *  000  Divide by 1
                                 *  001  Divide by 2
                                 *  010  Divide by 4
                                 *  011  Divide by 8
                                 *  100  Divide by 16
                                 *  101  Divide by 32
                                 *  110  Divide by 64
                                 *  111  Divide by 128 */
        USISSEL_t   USISSEL;    /*! Clock source select. Not used in slave mode.
                                 *  000  SCLK (Not used in SPI mode)
                                 *  001  ACLK
                                 *  010  SMCLK
                                 *  011  SMCLK
                                 *  100  USISWCLK bit
                                 *  101  TACCR0
                                 *  110  TACCR1
                                 *  111  TACCR2 (Reserved on MSP430F20xx devices) */
        USICKPL_t   USICKPL;    /*! Clock polarity select
                                 *  0  Inactive state is low
                                 *  1  Inactive state is high */
        USISWCLK_t  USISWCLK;   /*! Software clock
                                 *  0  Input clock is low
                                 *  1  Input clock is high */
    }

    struct USICNT_t {
        USISCLREL_t USISCLREL;  /*! SCL release. The SCL line is released from low to idle. USISCLREL is
                                 *  cleared if a START condition is detected.
                                 *  0  SCL line is held low if USIIFG is set
                                 *  1  SCL line is released */
        USI16B_t    USI16B;     /*! 16-bit shift register enable
                                 *  0  8-bit shift register mode. Low byte register USISRL is used.
                                 *  1  16-bit shift register mode. Both high and low byte registers USISRL
                                 *  and USISRH are used. USISR addresses all 16 bits simultaneously.*/
        USIIFGCC_t  USIIFGCC;   /*! USI interrupt flag clear control. When USIIFGCC = 1 the USIIFG will not be
                                 *cleared automatically when USICNTx is written with a value > 0.
                                 *  0  USIIFG automatically cleared on USICNTx update
                                 *  1  USIIFG is not cleared automatically */
        USICNT4_t   USICNT4;    /*! USI bit count bit 4
                                 *The USICNTx bits set the number of bits to be received or transmitted. */
        USICNT3_t   USICNT3;    /*! USI bit count bit 3
                                 *The USICNTx bits set the number of bits to be received or transmitted. */
        USICNT2_t   USICNT2;    /*! USI bit count bit 2
                                 *The USICNTx bits set the number of bits to be received or transmitted. */
        USICNT1_t   USICNT1;    /*! USI bit count bit 1
                                 *The USICNTx bits set the number of bits to be received or transmitted. */
        USICNT0_t   USICNT0;    /*! USI bit count bit 0
                                 *The USICNTx bits set the number of bits to be received or transmitted. */
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

instance:

    /*!
    *  ======== setUSIIE ========
    *  Sets USIIE register
    *
    *  @see #setUSIIE
    */
    Bool setUSIIE(Bool set);

    /*!
    *  ======== setUSIIE ========
    *  Gets USIIE register
    *
    *  @see #setUSIIE
    */
    Bool getUSIIE();

    /*!
    *  ======== setUSISTTIE ========
    *  Sets USISTTIE register
    *
    *  @see #setUSISTTIE
    */
    Bool setUSISTTIE(Bool set);

    /*!
    *  ======== getUSISTTIE ========
    *  Gets USISTTIE register
    *
    *  @see #getUSISTTIE
    */
    Bool getUSISTTIE();
}

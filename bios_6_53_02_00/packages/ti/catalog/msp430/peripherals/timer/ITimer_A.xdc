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
 *  ======== ITimer_A ========
 *  MSP430 ITimer_A interface
 */
metaonly interface ITimer_A inherits ITimer {

    enum TASSEL_t {
        TASSEL_0 = (0*0x100u),              /*! TACLK */
        TASSEL_1 = (1*0x100u),              /*! ACLK  */
        TASSEL_2 = (2*0x100u),              /*! SMCLK */
        TASSEL_3 = 3*0x100u                 /*! INCLK */
    };

    enum TACLR_t {
        TACLR_OFF = (0x0000),               /* Timer A counter clear */
        TACLR = 0x0004                      /* Timer A counter clear */
    };

    enum TAIE_t {
        TAIE_OFF = (0x0000),                /* Timer A counter interrupt enable */
        TAIE     = 0x0002                   /* Timer A counter interrupt enable */
    };

    enum TAIFG_t {
        TAIFG_OFF = (0x000),                /* Timer A counter interrupt flag */
        TAIFG     = (0x0001)                /* Timer A counter interrupt flag */
    };

    enum MC_t {
        MC_0 = (0*0x10u),                   /*! Stop Mode */
        MC_1 = (1*0x10u),                   /*! Up Mode */
        MC_2 = (2*0x10u),                   /*! Continuous Mode */
        MC_3 = 3*0x10u                      /*! Up/Down Mode */
    };

    enum ID_t {
        ID_0 = (0*0x40u),                   /*! Divider - /1 */
        ID_1 = (1*0x40u),                   /*! Divider - /2 */
        ID_2 = (2*0x40u),                   /*! Divider - /4 */
        ID_3 = 3*0x40u                      /*! Divider - /8 */
    };

    enum CM_t {
        CM_0 = (0*0x4000u),                 /*! No Capture */
        CM_1 = (1*0x4000u),                 /*! Rising Edge */
        CM_2 = (2*0x4000u),                 /*! Falling Edge */
        CM_3 = 3*0x4000u                    /*! Both Edges */
    };

    enum CCIS_t {
        CCIS_0 = (0*0x1000u),               /*! CCIxA */
        CCIS_1 = (1*0x1000u),               /*! CCIxB */
        CCIS_2 = (2*0x1000u),               /*! GND */
        CCIS_3 = 3*0x1000u                  /*! Vcc */
    };

    enum SCS_t {
        SCS_OFF = (0x0000),                 /*! Asynchronous Capture */
        SCS = 0x0800                        /*! Sychronous Capture  */
    };

    enum SCCI_t {
        SCCI_OFF = (0x0000),                /*! Latched capture signal (read) */
        SCCI = 0x0400                       /*! Latched capture signal (read) */
    };

    enum CAP_t {
        CAP_OFF = (0x0000),                 /*! Compare mode */
        CAP = 0x0100                        /*! Capture mode */
    };

    enum CCIE_t {
        CCIE_OFF = (0x0000),                /* Capture/compare interrupt disable */
        CCIE = (0x0010)                     /* Capture/compare interrupt enable */
    };

    enum CCI_t {
        CCI_OFF = (0x0008),                 /* Capture input signal (read) */
        CCI = (0x0008)                      /* Capture input signal (read) */
    };

    enum OUT_t {
        OUT_OFF = (0x0000),                 /* PWM Output signal if output mode 0 */
        OUT = (0x0004)                      /* PWM Output signal if output mode 0 */
    };

    enum COV_t {
        COV_OFF = (0x0000),                 /* Capture/compare overflow flag */
        COV = (0x0002)                      /* Capture/compare overflow flag */
    };

    enum CCIFG_t {
        CCIFG_OFF = (0x0000),               /* Capture/compare interrupt flag */
        CCIFG = (0x0001)                    /* Capture/compare interrupt flag */
    };

    enum OUTMOD_t {
        OUTMOD_0 = (0*0x20u),               /*! PWM output mode: 0 - OUT bit value */
        OUTMOD_1 = (1*0x20u),               /*! PWM output mode: 1 - Set */
        OUTMOD_2 = (2*0x20u),               /*! PWM output mode: 2 - PWM toggle/reset */
        OUTMOD_3 = (3*0x20u),               /*! PWM output mode: 3 - PWM set/reset */
        OUTMOD_4 = (4*0x20u),               /*! PWM output mode: 4 - Toggle */
        OUTMOD_5 = (5*0x20u),               /*! PWM output mode: 5 - Reset */
        OUTMOD_6 = (6*0x20u),               /*! PWM output mode: 6 - PWM toggle/set */
        OUTMOD_7 = 7*0x20u                  /*! PWM output mode: 7 - PWM reset/set */
    };

    /*! TA3IV Definitions */
    enum IVValues {
        TAIV_NONE = 0x0000,                 /*! No Interrupt pending */
        TAIV_TACCR1 = 0x0002,               /*! TACCR1_CCIFG */
        TAIV_TACCR2 = 0x0004,               /*! TACCR2_CCIFG */
        TAIV_6 = 0x0006,                    /*! Reserved */
        TAIV_8 = 0x0008,                    /*! Reserved */
        TAIV_TAIFG = 0x000A                 /*! TAIFG */
    };

   /*!
    *  ======== TACTL_t ========
    *  Timer_A Control Register
    *
    *  @see #TACTL_t
    */
    struct TACTL_t {
        TASSEL_t    TASSEL;     /*! Timer_A clock source select
                                  *  00  TACLK
                                  *  01  ACLK
                                  *  10  SMCLK
                                  *  11  INCLK */
        ID_t        ID;         /*! Input divider. These bits select the divider for the input clock.
                                  *  00 /1
                                  *  01 /2
                                  *  10 /4
                                  *  11 /8 */
        MC_t        MC;         /*! Mode control. Setting MCx = 00h when Timer_A is not in use conserves
                                  * power.
                                  *  00  Stop mode: the timer is halted.
                                  *  01  Up mode: the timer counts up to TACCR0.
                                  *  10  Continuous mode: the timer counts up to 0FFFFh.
                                  *  11  Up/down mode: the timer counts up to TACCR0 then down to 0000h. */
        TACLR_t     TACLR;      /*! Timer_A clear. Setting this bit resets TAR, the clock divider, and the count
                                  * direction. The TACLR bit is automatically reset and is always read as zero. */
        TAIE_t      TAIE;       /*! Timer_A interrupt enable. This bit enables the TAIFG interrupt request.
                                  *  0  Interrupt disabled
                                  *  1  Interrupt enabled */
        TAIFG_t     TAIFG;      /*! Timer_A interrupt flag
                                  *  0  No interrupt pending
                                  *  1  Interrupt pending */
    }

   /*!
    *  ======== TACCTLx_t ========
    *  Capture/Compare Control Register
    *
    *  @see #TACCTLx_t
    */
    struct TACCTLx_t {
        CM_t       CM;          /*! Capture mode
                                  *  00 No capture
                                  *  01 Capture on rising edge
                                  *  10 Capture on falling edge
                                  *  11 Capture on both rising and falling edges */
        CCIS_t     CCIS;        /*! Capture/compare input select. These bits select the TACCRx input signal.
                                  * See the device-specific data sheet for specific signal connections.
                                  *  00  CCIxA
                                  *  01  CCIxB
                                  *  10  GND
                                  *  11  VCC */
        SCS_t      SCS;         /*! Synchronize capture source. This bit is used to synchronize the capture input
                                  * signal with the timer clock.
                                  *  0  Asynchronous capture
                                  *  1  Synchronous capture */
        SCCI_t     SCCI;        /*! Synchronized capture/compare input. The selected CCI input signal is
                                  * latched with the EQUx signal and can be read via this bit */
        CAP_t      CAP;         /*! Capture mode
                                  *  0  Compare mode
                                  *  1  Capture mode */
        OUTMOD_t   OUTMOD;      /*! Output mode. Modes 2, 3, 6, and 7 are not useful for TACCR0 because
                                  * EQUx = EQU0.
                                  *  000  OUT bit value
                                  *  001  Set
                                  *  010  Toggle/reset
                                  *  011  Set/reset
                                  *  100  Toggle
                                  *  101  Reset
                                  *  110  Toggle/set
                                  *  111  Reset/set */
        CCIE_t     CCIE;        /*! Capture/compare interrupt enable. This bit enables the interrupt request of
                                  * the corresponding CCIFG flag.
                                  *  0  Interrupt disabled
                                  *  1  Interrupt enabled */
        CCI_t      CCI;         /*! Capture/compare input. The selected input signal can be read by this bit. */
        OUT_t      OUT;         /*! Output. For output mode 0, this bit directly controls the state of the output.
                                  *  0   Output low
                                  *  1   Output high */
        COV_t      COV;         /*! Capture overflow. This bit indicates a capture overflow occurred. COV must
                                  *  be reset with software.
                                  *  0  No capture overflow occurred
                                  *  1  Capture overflow occurred */
        CCIFG_t    CCIFG;       /*! Capture/compare interrupt flag
                                  *  0  No interrupt pending
                                  *  1  Interrupt pending */
    }

instance:
    /*! Timer_A TACLK */
    config float TACLK = 0;

    /*! Timer_A INCLK */
    config float INCLK = 0;
}

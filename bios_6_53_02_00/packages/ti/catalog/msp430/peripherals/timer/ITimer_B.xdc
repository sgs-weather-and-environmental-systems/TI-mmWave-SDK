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
 *  ======== ITimer_B ========
 *  MSP430 ITimer_B interface
 */
metaonly interface ITimer_B inherits ITimer {

    enum TBCLGRP_t {
        TBCLGRP_0 = (0*0x100u),             /* */
        TBCLGRP_1 = (1*0x100u),             /* */
        TBCLGRP_2 = (2*0x100u),             /* */
        TBCLGRP_3 = 3*0x100u                /* */
    };

    enum CNTL_t {
        CNTL_0 = (0*0x100u),                /*! 16-bit, TBR(max) = 0FFFFh */
        CNTL_1 = (1*0x100u),                /*! 12-bit, TBR(max) = 0FFFh  */
        CNTL_2 = (2*0x100u),                /*! 10-bit, TBR(max) = 03FFh */
        CNTL_3 = 3*0x100u                   /*!  8-bit, TBR(max) = 0FFh */
    };

    enum TBSSEL_t {
        TBSSEL_0 = (0*0x100u),              /*! TBCLK */
        TBSSEL_1 = (1*0x100u),              /*! ACLK  */
        TBSSEL_2 = (2*0x100u),              /*! SMCLK */
        TBSSEL_3 = 3*0x100u                 /*! INCLK */
    };

    enum TBCLR_t {
        TBCLR_OFF = (0x0000),               /* Timer A counter clear */
        TBCLR = 0x0004                      /* Timer A counter clear */
    };

    enum TBIE_t {
        TBIE_OFF = (0x0000),                /* Timer A counter interrupt enable */
        TBIE     = 0x0002                   /* Timer A counter interrupt enable */
    };

    enum TBIFG_t {
        TBIFG_OFF = (0x000),                /* Timer A counter interrupt flag */
        TBIFG     = (0x0001)                /* Timer A counter interrupt flag */
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
        SCS_OFF = (0x0000),                 /* Asynchronous Capture */
        SCS = 0x0800                        /* Sychronous Capture  */
    };

    enum CLLD_t {
        CLLD_0 = (0*0x1000u),               /* TBCLx loads on write to TBCCRx */
        CLLD_1 = (1*0x1000u),               /* TBCLx loads when TBR counts to 0 */
        CLLD_2 = (2*0x1000u),               /* TBCLx loads when TBR counts to 0 (up or continuous mode) */
        CLLD_3 = 3*0x1000u                  /* TBCLx loads when TBR counts to TBCLx */
    };

    enum SCCI_t {
        SCCI_OFF = (0x0000),                /* Latched capture signal (read) */
        SCCI = 0x0400                       /* Latched capture signal (read) */
    };

    enum CAP_t {
        CAP_OFF = (0x0000),                 /* Compare mode */
        CAP = 0x0100                        /* Capture mode */
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

   /*!
    *  ======== TBCTL_t ========
    *  Timer_B Control Register
    *
    *  @see #TBCTL_t
    */
    struct TBCTL_t {
        TBCLGRP_t   TBCLGRP;    /*! TBCLx group
                                  *  00  Each TBCLx latch loads independently
                                  *  01  TBCL1+TBCL2 (TBCCR1 CLLDx bits control the update)
                                  *      TBCL3+TBCL4 (TBCCR3 CLLDx bits control the update)
                                  *      TBCL5+TBCL6 (TBCCR5 CLLDx bits control the update)
                                  *      TBCL0 independent
                                  *  10  TBCL1+TBCL2+TBCL3 (TBCCR1 CLLDx bits control the update)
                                  *      TBCL4+TBCL5+TBCL6 (TBCCR4 CLLDx bits control the update)
                                  *      TBCL0 independent
                                  *  11  TBCL0+TBCL1+TBCL2+TBCL3+TBCL4+TBCL5+TBCL6
                                  *      (TBCCR1 CLLDx bits control the update) */
        CNTL_t      CNTL;       /*! Counter Length
                                  *  00  16-bit, TBR(max) = 0FFFFh
                                  *  01  12-bit, TBR(max) = 0FFFh
                                  *  10  10-bit, TBR(max) = 03FFh
                                  *  11  8-bit, TBR(max) = 0FFh */
        TBSSEL_t    TBSSEL;     /*! Timer_B clock source select.
                                  *  00  TBCLK
                                  *  01  ACLK
                                  *  10  SMCLK
                                  *  11  Inverted TBCLK */
        ID_t        ID;         /*! Input divider. These bits select the divider for the input clock.
                                  *  00  /1
                                  *  01  /2
                                  *  10  /4
                                  *  11  /8 */
        MC_t        MC;         /*! Mode control. Setting MCx = 00h when Timer_B is not in use conserves
                                  * power.
                                  *  00  Stop mode: the timer is halted
                                  *  01  Up mode: the timer counts up to TBCL0
                                  *  10  Continuous mode: the timer counts up to the value set by CNTLx
                                  *  11  Up/down mode: the timer counts up to TBCL0 and down to 0000h */
        TBCLR_t     TBCLR;      /*! Timer_B clear. Setting this bit resets TBR, the clock divider, and the count
                                  * direction. The TBCLR bit is automatically reset and is always read as zero. */
        TBIE_t      TBIE;       /*! Timer_B interrupt enable. This bit enables the TBIFG interrupt request.
                                  *  0 Interrupt disabled
                                  *  1 Interrupt enabled */
        TBIFG_t     TBIFG;      /*! Timer_B interrupt flag.
                                  *  0 No interrupt pending
                                  *  1 Interrupt pending */
    }

    /* TBCCTLx */
    struct TBCCTLx_t {
        CM_t       CM;          /*! Capture mode
                                  *  00  No capture
                                  *  01  Capture on rising edge
                                  *  10  Capture on falling edge
                                  *  11  Capture on both rising and falling edges */
        CCIS_t     CCIS;        /*! Capture/compare input select. These bits select the TBCCRx input signal.
                                  * See the device-specific data sheet for specific signal connections.
                                  *  00  CCIxA
                                  *  01  CCIxB
                                  *  10  GND
                                  *  11  VCC */
        SCS_t      SCS;         /*! Synchronize capture source. This bit is used to synchronize the capture input
                                  * signal with the timer clock.
                                  *  0  Asynchronous capture
                                  *  1  Synchronous capture */
        CLLD_t     CLLD;        /*! Compare latch load. These bits select the compare latch load event.
                                  *  00  TBCLx loads on write to TBCCRx
                                  *  01  TBCLx loads when TBR counts to 0
                                  *  10  TBCLx loads when TBR counts to 0 (up or continuous mode)
                                  *      TBCLx loads when TBR counts to TBCL0 or to 0 (up/down mode)
                                  *  11  TBCLx loads when TBR counts to TBCLx */
        CAP_t      CAP;         /*! Capture mode
                                  *  0  Compare mode
                                  *  1  Capture mode */
        OUTMOD_t   OUTMOD;      /*! Output mode. Modes 2, 3, 6, and 7 are not useful for TBCL0 because EQUx
                                  * = EQU0.
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
                                  *  0  Output low
                                  *  1  Output high */
        COV_t      COV;         /*! Capture overflow. This bit indicates a capture overflow occurred. COV must
                                  * be reset with software.
                                  *  0  No capture overflow occurred
                                  *  1  Capture overflow occurred */
        CCIFG_t    CCIFG;       /*! Capture/compare interrupt flag
                                  *  0  No interrupt pending
                                  *  1  Interrupt pending */
    }

instance:

    /*! Timer_B TBCLK */
    config float TBCLK = 0;

    /*! Timer_B INCLK */
    config float INCLK = 0;
}

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
 *  ======== UCS ========
 *  MSP430 Unified Clock System
 */
metaonly module UCS inherits IClock
{
    /*! DCO4 Bit */
    enum DCO4_t {
        DCO4_OFF = 0x0000,                  /*! Disable DCO4 bit */
        DCO4 = 0x1000                       /*! Enable DCO4 bit */
    };

    /*! DCO3 Bit */
    enum DCO3_t {
        DCO3_OFF = 0x0000,                  /*! Disable DCO3 bit */
        DCO3 = 0x0800                       /*! Enable DCO3 bit */
    };

    /*! DCO2 Bit */
    enum DCO2_t {
        DCO2_OFF = 0x0000,                  /*! Disable DCO2 bit */
        DCO2 = 0x0400                       /*! Enable DCO2 bit */
    };

    /*! DCO1 Bit */
    enum DCO1_t {
        DCO1_OFF = 0x0000,                  /*! Disable DCO1 bit */
        DCO1 = 0x0200                       /*! Enable DCO1 bit */
    };

    /*! DCO0 Bit */
    enum DCO0_t {
        DCO0_OFF = 0x0000,                  /*! Disable DCO0 bit */
        DCO0 = 0x0100                       /*! Enable DCO0 bit */
    };

    /*! MOD4 Bit */
    enum MOD4_t {
        MOD4_OFF = 0x0000,                  /*! Disable MOD4 bit */
        MOD4 = 0x0080                       /*! Enable MOD4 bit */
    };

    /*! MOD3 Bit */
    enum MOD3_t {
        MOD3_OFF = 0x0000,                  /*! Disable MOD3 bit */
        MOD3 = 0x0040                       /*! Enable MOD3 bit */
    };

    /*! MOD2 Bit */
    enum MOD2_t {
        MOD2_OFF = 0x0000,                  /*! Disable MOD2 bit */
        MOD2 = 0x0020                       /*! Enable MOD2 bit */
    };

    /*! MOD1 Bit */
    enum MOD1_t {
        MOD1_OFF = 0x0000,                  /*! Disable MOD1 bit */
        MOD1 = 0x0010                       /*! Enable MOD1 bit */
    };

    /*! MOD0 Bit */
    enum MOD0_t {
        MOD0_OFF = 0x0000,                  /*! Disable MOD0 bit */
        MOD0 = 0x0080                       /*! Enable MOD0 bit */
    };

    /*! DCO frequency range select */
    enum DCORSEL_t {
        DCORSEL_0 = 0x0000,                 /*! DCORSEL_0 */
        DCORSEL_1 = 0x0010,                 /*! DCORSEL_1 */
        DCORSEL_2 = 0x0020,                 /*! DCORSEL_2 */
        DCORSEL_3 = 0x0030,                 /*! DCORSEL_3 */
        DCORSEL_4 = 0x0040,                 /*! DCORSEL_4 */
        DCORSEL_5 = 0x0050,                 /*! DCORSEL_5 */
        DCORSEL_6 = 0x0060,                 /*! DCORSEL_6 */
        DCORSEL_7 = 0x0070                  /*! DCORSEL_7 */
    };

    /*! DISMOD Bit */
    enum DISMOD_t {
        DISMOD_OFF = 0x0000,                /*! Modulation enabled */
        DISMOD = 0x0001                     /*! Modulation disabled */
    };

    /*! FLL Loop Divider */
    enum FLLD_t {
        FLLD_0 = 0x0000,                    /*! Multiply Selected Loop Freq. 1 */
        FLLD_1 = 0x1000,                    /*! Multiply Selected Loop Freq. 2 */
        FLLD_2 = 0x2000,                    /*! Multiply Selected Loop Freq. 4 */
        FLLD_3 = 0x3000,                    /*! Multiply Selected Loop Freq. 8 */
        FLLD_4 = 0x4000,                    /*! Multiply Selected Loop Freq. 16 */
        FLLD_5 = 0x5000,                    /*! Multiply Selected Loop Freq. 32 */
        FLLD_6 = 0x6000,                    /*! Multiply Selected Loop Freq. 32 */
        FLLD_7 = 0x7000                     /*! Multiply Selected Loop Freq. 32 */
    };

    /*! FLL Multiplier Bit 0 */
    enum FLLN0_t {
        FLLN0_OFF = 0x0000,                 /*! Disable FLLN bit 0 */
        FLLN0 = 0x0001                      /*! Enable FLLN bit 0 */
    };

    /*! FLL Multiplier Bit 1 */
    enum FLLN1_t {
        FLLN1_OFF = 0x0000,                 /*! Disable FLLN bit 1 */
        FLLN1 = 0x0002                      /*! Enable FLLN bit 1 */
    };

    /*! FLL Multiplier Bit 2 */
    enum FLLN2_t {
        FLLN2_OFF = 0x0000,                 /*! Disable FLLN bit 2 */
        FLLN2 = 0x0004                      /*! Enable FLLN bit 2 */
    };

    /*! FLL Multiplier Bit 3 */
    enum FLLN3_t {
        FLLN3_OFF = 0x0000,                 /*! Disable FLLN bit 3 */
        FLLN3 = 0x0008                      /*! Enable FLLN bit 3 */
    };

    /*! FLL Multiplier Bit 4 */
    enum FLLN4_t {
        FLLN4_OFF = 0x0000,                 /*! Disable FLLN bit 4 */
        FLLN4 = 0x0010                      /*! Enable FLLN bit 4 */
    };

    /*! FLL Multiplier Bit 5 */
    enum FLLN5_t {
        FLLN5_OFF = 0x0000,                 /*! Disable FLLN bit 5 */
        FLLN5 = 0x0020                      /*! Enable FLLN bit 5 */
    };

    /*! FLL Multiplier Bit 6 */
    enum FLLN6_t {
        FLLN6_OFF = 0x0000,                 /*! Disable FLLN bit 6 */
        FLLN6 = 0x0040                      /*! Enable FLLN bit 6 */
    };

    /*! FLL Multiplier Bit 7 */
    enum FLLN7_t {
        FLLN7_OFF = 0x0000,                 /*! Disable FLLN bit 7 */
        FLLN7 = 0x0080                      /*! Enable FLLN bit 7 */
    };

    /*! FLL Multiplier Bit 8 */
    enum FLLN8_t {
        FLLN8_OFF = 0x0000,                 /*! Disable FLLN bit 8 */
        FLLN8 = 0x0100                      /*! Enable FLLN bit 8 */
    };

    /*! FLL Multiplier Bit 9 */
    enum FLLN9_t {
        FLLN9_OFF = 0x0000,                 /*! Disable FLLN bit 9 */
        FLLN9 = 0x0200                      /*! Enable FLLN bit 9 */
    };

    /*! FLL Reference Select */
    enum SELREF_t {
        SELREF_0 = 0x0000,                  /*! FLL Reference by XT1CLK */
        SELREF_1 = 0x0010,                  /*! Reserved */
        SELREF_2 = 0x0020,                  /*! FLL Reference by REFOCLK */
        SELREF_3 = 0x0030,                  /*! Reserved */
        SELREF_4 = 0x0040,                  /*! Reserved */
        SELREF_5 = 0x0050,                  /*! FLL Reference by XT2CLK */
        SELREF_6 = 0x0060,                  /*! Reserved */
        SELREF_7 = 0x0070                   /*! Reserved */
    };

    /*! FLL Reference Divider */
    enum FLLREFDIV_t {
        FLLREFDIV_0 = 0x0000,               /*! f(FLLREFCLK) / 1 */
        FLLREFDIV_1 = 0x0001,               /*! f(FLLREFCLK) / 2 */
        FLLREFDIV_2 = 0x0002,               /*! f(FLLREFCLK) / 4 */
        FLLREFDIV_3 = 0x0003,               /*! f(FLLREFCLK) / 8 */
        FLLREFDIV_4 = 0x0004,               /*! f(FLLREFCLK) / 12 */
        FLLREFDIV_5 = 0x0005,               /*! f(FLLREFCLK) / 16 */
        FLLREFDIV_6 = 0x0006,               /*! Reserved */
        FLLREFDIV_7 = 0x0007                /*! Reserved */
    };

    /*! Select the ACLK source */
    enum SELA_t {
        SELA_0 = 0x0000,                    /*! XT1CLK */
        SELA_1 = 0x0100,                    /*! VLOCLK */
        SELA_2 = 0x0200,                    /*! REFOCLK */
        SELA_3 = 0x0300,                    /*! DCOCLK */
        SELA_4 = 0x0400,                    /*! DCOCLKDIV */
        SELA_5 = 0x0500,                    /*! XT2CLK */
        SELA_6 = 0x0600,                    /*! Reserved */
        SELA_7 = 0x0700                     /*! Reserved */
    };

    /*! Select the SMCLK source */
    enum SELS_t {
        SELS_0 = 0x0000,                    /*! XT1CLK */
        SELS_1 = 0x0010,                    /*! VLOCLK */
        SELS_2 = 0x0020,                    /*! REFOCLK */
        SELS_3 = 0x0030,                    /*! DCOCLK */
        SELS_4 = 0x0040,                    /*! DCOCLKDIV */
        SELS_5 = 0x0050,                    /*! XT2CLK */
        SELS_6 = 0x0060,                    /*! Reserved */
        SELS_7 = 0x0070                     /*! Reserved */
    };

    /*! Select the MCLK source */
    enum SELM_t {
        SELM_0 = 0x0000,                    /*! XT1CLK */
        SELM_1 = 0x0001,                    /*! VLOCLK */
        SELM_2 = 0x0002,                    /*! REFOCLK */
        SELM_3 = 0x0003,                    /*! DCOCLK */
        SELM_4 = 0x0004,                    /*! DCOCLKDIV */
        SELM_5 = 0x0005,                    /*! XT2CLK */
        SELM_6 = 0x0006,                    /*! Reserved */
        SELM_7 = 0x0007                     /*! Reserved */
    };

    /*! ACLK source divider available at external pin */
    enum DIVPA_t {
        DIVPA_0 = 0x0000,                   /*! Divide by 1 */
        DIVPA_1 = 0x1000,                   /*! Divide by 2 */
        DIVPA_2 = 0x2000,                   /*! Divide by 4 */
        DIVPA_3 = 0x3000,                   /*! Divide by 8 */
        DIVPA_4 = 0x4000,                   /*! Divide by 16 */
        DIVPA_5 = 0x5000,                   /*! Divide by 32 */
        DIVPA_6 = 0x6000,                   /*! Reserved */
        DIVPA_7 = 0x7000                    /*! Reserved */
    };

    /*! ACLK source divider */
    enum DIVA_t {
        DIVA_0 = 0x0000,                    /*! Divide by 1 */
        DIVA_1 = 0x0100,                    /*! Divide by 2 */
        DIVA_2 = 0x0200,                    /*! Divide by 4 */
        DIVA_3 = 0x0300,                    /*! Divide by 8 */
        DIVA_4 = 0x0400,                    /*! Divide by 16 */
        DIVA_5 = 0x0500,                    /*! Divide by 32 */
        DIVA_6 = 0x0600,                    /*! Reserved */
        DIVA_7 = 0x0700                     /*! Reserved */
    };

    /*! SMCLK source divider */
    enum DIVS_t {
        DIVS_0 = 0x0000,                    /*! Divide by 1 */
        DIVS_1 = 0x0010,                    /*! Divide by 2 */
        DIVS_2 = 0x0020,                    /*! Divide by 4 */
        DIVS_3 = 0x0030,                    /*! Divide by 8 */
        DIVS_4 = 0x0040,                    /*! Divide by 16 */
        DIVS_5 = 0x0050,                    /*! Divide by 32 */
        DIVS_6 = 0x0060,                    /*! Reserved */
        DIVS_7 = 0x0070                     /*! Reserved */
    };

    /*! MCLK source divider */
    enum DIVM_t {
        DIVM_0 = 0x0000,                    /*! Divide by 1 */
        DIVM_1 = 0x0010,                    /*! Divide by 2 */
        DIVM_2 = 0x0020,                    /*! Divide by 4 */
        DIVM_3 = 0x0030,                    /*! Divide by 8 */
        DIVM_4 = 0x0040,                    /*! Divide by 16 */
        DIVM_5 = 0x0050,                    /*! Divide by 32 */
        DIVM_6 = 0x0060,                    /*! Reserved */
        DIVM_7 = 0x0070                     /*! Reserved */
    };

    /*! XT2 oscillator current */
    enum XT2DRIVE_t {
        XT2DRIVE_0 = 0x0000,                /*! 4 MHz to 8 MHz */
        XT2DRIVE_1 = 0x4000,                /*! 8 MHz to 16 MHz */
        XT2DRIVE_2 = 0x8000,                /*! 16 MHz to 24 MHz */
        XT2DRIVE_3 = 0xC000                 /*! 24 MHz to 32 MHz */
    };

    /*! XT2 bypass select */
    enum XT2BYPASS_t {
        XT2BYPASS_OFF = 0x0000,             /*! XT2 sourced internally */
        XT2BYPASS = 0x1000                  /*! XT2 sourced externally from pin */
    };

    /*! Turns off the XT2 oscillator */
    enum XT2OFF_t {
        XT2OFF_OFF = 0x0000,                /*! Enable XT2 */
        XT2OFF = 0x0100                     /*! Disable XT2*/
    };

    /*! XT1 oscillator current */
    enum XT1DRIVE_t {
        XT1DRIVE_0 = 0x0000,                /*! XT1 drive 0 */
        XT1DRIVE_1 = 0x0040,                /*! XT1 drive 1 */
        XT1DRIVE_2 = 0x0080,                /*! XT1 drive 2 */
        XT1DRIVE_3 = 0x00C0                 /*! XT1 drive 3 */
    };

    /*! XTS mode select */
    enum XTS_t {
        XTS_OFF = 0x0000,                   /*! Low Frequency */
        XTS = 0x0020                        /*! High Frequency */
    };

    /*! XT1 bypass select */
    enum XT1BYPASS_t {
        XT1BYPASS_OFF = 0x0000,             /*! XT1 sourced internally */
        XT1BYPASS = 0x0010                  /*! XT1 sourced externally from pin */
    };

    /*! XT1 oscillator capacitor select */
    enum XCAP_t {
        XCAP_0 = 0x0000,                    /*! XT1 Cap 0 */
        XCAP_1 = 0x0004,                    /*! XT1 Cap 1 */
        XCAP_2 = 0x0008,                    /*! XT1 Cap 2 */
        XCAP_3 = 0x000C                     /*! XT1 Cap 3 */
    };

    /*! SMCLK off */
    enum SMCLKOFF_t {
        SMCLKOFF_OFF = 0x0000,              /*! SMCLK on */
        SMCLKOFF = 0x0002                   /*! SMCLK off */
    };

    /*! Turns off the XT1 oscillator */
    enum XT1OFF_t {
        XT1OFF_OFF = 0x0000,                /*! Enable XT1 */
        XT1OFF = 0x0001                     /*! Disable XT1 */
    };

    /*! XT2 oscillator fault flag */
    enum XT2OFFG_t {
        XT2OFFG_OFF = 0x0000,               /*! No fault condition present */
        XT2OFFG = 0x0008                    /*! XT2 fault condition present */
    };

    /*! XT1 high frequency oscillator fault flag */
    enum XT1HFOFFG_t {
        XT1HFOFFG_OFF = 0x0000,             /*! No fault condition present */
        XT1HFOFFG = 0x0004                  /*! XT1 HF fault condition present */
    };

    /*! XT1 low frequency oscillator fault flag */
    enum XT1LFOFFG_t {
        XT1LFOFFG_OFF = 0x0000,             /*! No fault condition present */
        XT1LFOFFG = 0x0002                  /*! XT1 LF fault condition present */
    };

    /*! DCO fault flag */
    enum DCOFFG_t {
        DCOFFG_OFF = 0x0000,                /*! No fault condition present */
        DCOFFG = 0x0001                     /*! DCO fault condition present */
    };

    /*! MODOSC clock request enable */
    enum MODOSCREQEN_t {
        MODOSCREQEN_OFF = 0x0000,           /*! MODOSC conditional requests are disabled */
        MODOSCREQEN = 0x0008                /*! MODOSC conditional requests are enabled */
    };

    /*! SMCLK clock request enable */
    enum SMCLKREQEN_t {
        SMCLKREQEN_OFF = 0x0000,            /*! SMCLK conditional requests are disabled */
        SMCLKREQEN = 0x0004                 /*! SMCLK conditional requests are enabled */
    };

    /*! MCLK clock request enable */
    enum MCLKREQEN_t {
        MCLKREQEN_OFF = 0x0000,             /*! MCLK conditional requests are disabled */
        MCLKREQEN = 0x0002                  /*! MCLK conditional requests are enabled */
    };

    /*! ACLK clock request enable */
    enum ACLKREQEN_t {
        ACLKREQEN_OFF = 0x0000,             /*! ACLK conditional requests are disabled */
        ACLKREQEN = 0x0001                  /*! ACLK conditional requests are enabled */
    };

    /*! Selects XT2 bypass input swing level */
    enum XT2BYPASSLV_t {
        XT2BYPASSLV_OFF = 0x0000,           /*! Input range from 0 to DVCC */
        XT2BYPASSLV = 0x0002                /*! Input range from 0 to DVIO */
    };

    /*! Selects XT1 bypass input swing level */
    enum XT1BYPASSLV_t {
        XT1BYPASSLV_OFF = 0x0000,           /*! Input range from 0 to DVCC */
        XT1BYPASSLV = 0x0001                /*! Input range from 0 to DVIO */
    };

    /*!
     *  ======== UCSCTL0_t ========
     *  Unified Clock System Control 0 Register
     *
     *  @field(DCO) DCO tap selection.
     *  @field(MOD) Modulation bit counter.
     */
    struct UCSCTL0_t {
        DCO0_t   DCO0;                      /*! DCO tap selection bit 0 */
        DCO1_t   DCO1;                      /*! DCO tap selection bit 1 */
        DCO2_t   DCO2;                      /*! DCO tap selection bit 2 */
        DCO3_t   DCO3;                      /*! DCO tap selection bit 3 */
        DCO4_t   DCO4;                      /*! DCO tap selection bit 4 */
        MOD0_t   MOD0;                      /*! Modulation bit counter bit 0 */
        MOD1_t   MOD1;                      /*! Modulation bit counter bit 1 */
        MOD2_t   MOD2;                      /*! Modulation bit counter bit 2 */
        MOD3_t   MOD3;                      /*! Modulation bit counter bit 3 */
        MOD4_t   MOD4;                      /*! Modulation bit counter bit 4 */
    }

    /*!
     *  ======== UCSCTL1_t ========
     *  Unified Clock System Control 1 Register
     *
     *  @field(DCORSEL) DCO frequency range select. These bits select the DCO frequency range of operation defined in the
     *                  device-specific datasheet.
     *  @field(DISMOD)  0 Modulation enabled, 1 Modulation disabled.
     */
    struct UCSCTL1_t {
        DCORSEL_t   DCORSEL;                /*! DCO frequency range select. These bits select the DCO frequency range of operation defined in the
                                             * device-specific datasheet. */
        DISMOD_t    DISMOD;                 /*! Modulation. This bit enables/disables the modulation.
                                             *  0  Modulation enabled
                                             *  1  Modulation disabled */
    }

    /*!
     *  ======== UCSCTL2_t ========
     *  Unified Clock System Control 2 Register
     *
     *  @field(FLLD) FLL loop divider. These bits divide fDCOCLK in the FLL feedback loop. This results in an additional multiplier
     *               for the multiplier bits.
     *  @field(FLLN) Multiplier bits. These bits set the multiplier value N of the DCO. N must be greater than 0. Writing zero to
     *               FLLN causes N to be set to 1.
     */
    struct UCSCTL2_t {
        FLLD_t      FLLD;                   /*! FLL loop divider. These bits divide fDCOCLK in the FLL feedback loop. This results in an additional multiplier
                                             * for the multiplier bits. See also multiplier bits.
                                             *  000  fDCOCLK/1
                                             *  001  fDCOCLK/2
                                             *  010  fDCOCLK/4
                                             *  011  fDCOCLK/8
                                             *  100  fDCOCLK/16
                                             *  101  fDCOCLK/32
                                             *  110  Reserved for future use. Defaults to fDCOCLK/32
                                             *  111  Reserved for future use. Defaults to fDCOCLK/32 */
        FLLN0_t     FLLN0;                  /*! Multiplier bit 0 */
        FLLN1_t     FLLN1;                  /*! Multiplier bit 1 */
        FLLN2_t     FLLN2;                  /*! Multiplier bit 2 */
        FLLN3_t     FLLN3;                  /*! Multiplier bit 3 */
        FLLN4_t     FLLN4;                  /*! Multiplier bit 4 */
        FLLN5_t     FLLN5;                  /*! Multiplier bit 5 */
        FLLN6_t     FLLN6;                  /*! Multiplier bit 6 */
        FLLN7_t     FLLN7;                  /*! Multiplier bit 7 */
        FLLN8_t     FLLN8;                  /*! Multiplier bit 8 */
        FLLN9_t     FLLN9;                  /*! Multiplier bit 9 */
    }

    /*!
     *  ======== UCSCTL3_t ========
     *  Unified Clock System Control 3 Register
     *
     *  @field(SELREF) FLL reference select. These bits select the FLL reference clock source.
     *  @field(FLLREFDIV) FLL reference divider. These bits define the divide factor for fFLLREFCLK. The divided frequency is used as the
     *                    FLL reference frequency.
     */
    struct UCSCTL3_t {
        SELREF_t    SELREF;                 /*! FLL reference select. These bits select the FLL reference clock source.
                                             *  000  XT1CLK
                                             *  001  Reserved for future use. Defaults to XT1CLK.
                                             *  010  REFOCLK
                                             *  011  Reserved for future use. Defaults to REFOCLK.
                                             *  100  Reserved for future use. Defaults to REFOCLK.
                                             *  101  XT2CLK when available, otherwise REFOCLK.
                                             *  110  Reserved for future use. XT2CLK when available, otherwise REFOCLK.
                                             *  111  No selection. For the 'F543x and 'F541x non-A versions only, this defaults to XT2CLK. Reserved for
                                             *       future use. XT2CLK when available, otherwise REFOCLK. */
        FLLREFDIV_t FLLREFDIV;              /*! FLL reference divider. These bits define the divide factor for fFLLREFCLK. The divided frequency is used as the
                                             *  FLL reference frequency.
                                             *  000  fFLLREFCLK/1
                                             *  001  fFLLREFCLK/2
                                             *  010  fFLLREFCLK/4
                                             *  011  fFLLREFCLK/8
                                             *  100  fFLLREFCLK/12
                                             *  101  fFLLREFCLK/16
                                             *  110  Reserved for future use. Defaults to fFLLREFCLK/16.
                                             *  111  Reserved for future use. Defaults to fFLLREFCLK/16. */
    }

    /*!
     *  ======== UCSCTL4_t ========
     *  Unified Clock System Control 4 Register
     *
     *  @field(SELA) Selects the ACLK source
     *  @field(SELS) Selects the SMCLK source
     *  @field(SELM) Selects the MCLK source
     */
     struct UCSCTL4_t {
       SELA_t       SELA;                   /*! Selects the ACLK source
                                             *  000  XT1CLK
                                             *  001  VLOCLK
                                             *  010  REFOCLK
                                             *  011  DCOCLK
                                             *  100  DCOCLKDIV
                                             *  101  XT2CLK when available, otherwise DCOCLKDIV
                                             *  110  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV.
                                             *  111  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV. */
       SELS_t       SELS;                   /*! Selects the SMCLK source
                                             *  000  XT1CLK
                                             *  001  VLOCLK
                                             *  010  REFOCLK
                                             *  011  DCOCLK
                                             *  100  DCOCLKDIV
                                             *  101  XT2CLK when available, otherwise DCOCLKDIV
                                             *  110  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV.
                                             *  111  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV. */
       SELM_t       SELM;                   /*! Selects the MCLK source
                                             *  000  XT1CLK
                                             *  001  VLOCLK
                                             *  010  REFOCLK
                                             *  011  DCOCLK
                                             *  100  DCOCLKDIV
                                             *  101  XT2CLK when available, otherwise DCOCLKDIV
                                             *  110  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV.
                                             *  111  Reserved for future use. Defaults to XT2CLK when available, otherwise DCOCLKDIV. */
    }

    /*!
     *  ======== UCSCTL5_t ========
     *  Unified Clock System Control 5 Register
     *
     *  @field(SELA) Selects the ACLK source
     *  @field(SELS) Selects the SMCLK source
     *  @field(SELM) Selects the MCLK source
     */
    struct UCSCTL5_t {
        DIVPA_t     DIVPA;                  /*! ACLK source divider available at external pin. Divides the frequency of ACLK and presents it to an external pin.
                                             *  000  fACLK/1
                                             *  001  fACLK/2
                                             *  010  fACLK/4
                                             *  011  fACLK/8
                                             *  100  fACLK/16
                                             *  101  fACLK/32
                                             *  110  Reserved for future use. Defaults to fACLK/32.
                                             *  111  Reserved for future use. Defaults to fACLK/32. */
        DIVA_t      DIVA;                   /*! ACLK source divider. Divides the frequency of the ACLK clock source.
                                             *  000  fACLK/1
                                             *  001  fACLK/2
                                             *  010  fACLK/4
                                             *  011  fACLK/8
                                             *  100  fACLK/16
                                             *  101  fACLK/32
                                             *  110  Reserved for future use. Defaults to fACLK/32.
                                             *  111  Reserved for future use. Defaults to fACLK/32. */
        DIVS_t      DIVS;                   /*! SMCLK source divider
                                             *  000  fSMCLK/1
                                             *  001  fSMCLK/2
                                             *  010  fSMCLK/4
                                             *  011  fSMCLK/8
                                             *  100  fSMCLK/16
                                             *  101  fSMCLK/32
                                             *  110  Reserved for future use. Defaults to fSMCLK/32.
                                             *  111  Reserved for future use. Defaults to fSMCLK/32. */
        DIVM_t      DIVM;                   /*! MCLK source divider
                                             *  000  fMCLK/1
                                             *  001  fMCLK/2
                                             *  010  fMCLK/4
                                             *  011  fMCLK/8
                                             *  100  fMCLK/16
                                             *  101  fMCLK/32
                                             *  110  Reserved for future use. Defaults to fMCLK/32.
                                             *  111  Reserved for future use. Defaults to fMCLK/32.*/
    }

    /*!
     *  ======== UCSCTL6_t ========
     *  Unified Clock System Control 6 Register
     *
     *  @field(SELA) Selects the ACLK source
     *  @field(SELS) Selects the SMCLK source
     *  @field(SELM) Selects the MCLK source
     */
    struct UCSCTL6_t {
        XT2DRIVE_t  XT2DRIVE;               /*! The XT2 oscillator current can be adjusted to its drive needs. Initially, it starts with the highest supply current
                                             *  for reliable and quick startup. If needed, user software can reduce the drive strength.
                                             *  00  Lowest current consumption. XT2 oscillator operating range is 4 MHz to 8 MHz.
                                             *  01  Increased drive strength XT2 oscillator. XT2 oscillator operating range is 8 MHz to 16 MHz.
                                             *  10  Increased drive capability XT2 oscillator. XT2 oscillator operating range is 16 MHz to 24 MHz.
                                             *  11  Maximum drive capability and maximum current consumption for both XT2 oscillator. XT2 oscillator
                                             *      operating range is 24 MHz to 32 MHz. */
        XT2BYPASS_t XT2BYPASS;              /*! XT2 bypass select
                                             *  0  XT2 sourced internally
                                             *  1  XT2 sourced externally from pin */
        XT2OFF_t    XT2OFF;                 /*! Turns off the XT2 oscillator
                                             *  0  XT2 is on if XT2 is selected via the port selection and XT2 is not in bypass mode of operation.
                                             *  1  XT2 is off if it is not used as a source for ACLK, MCLK, or SMCLK or is not used as a reference source
                                             *     required for FLL operation. */
        XT1DRIVE_t  XT1DRIVE;               /*! The XT1 oscillator current can be adjusted to its drive needs. Initially, it starts with the highest supply current
                                             *  for reliable and quick startup. If needed, user software can reduce the drive strength.
                                             *  00  Lowest current consumption for XT1 LF mode. XT1 oscillator operating range in HF mode is 4 MHz to
                                             *      8 MHz.
                                             *  01  Increased drive strength for XT1 LF mode. XT1 oscillator operating range in HF mode is 8 MHz to
                                             *      16 MHz.
                                             *  10  Increased drive capability for XT1 LF mode. XT1 oscillator operating range in HF mode is 16 MHz to
                                             *      24 MHz.
                                             *  11  Maximum drive capability and maximum current consumption for XT1 LF mode. XT1 oscillator operating
                                             *      range in HF mode is 24 MHz to 32 MHz. */
        XTS_t       XTS;                    /*! XT1 mode select
                                             *  0  Low-frequency mode. XCAP bits define the capacitance at the XIN and XOUT pins.
                                             *  1  High-frequency mode. XCAP bits are not used. */
        XT1BYPASS_t XT1BYPASS;              /*! XT1 bypass select
                                             *  0  XT1 sourced internally
                                             *  1  XT1 sourced externally from pin */
        XCAP_t      XCAP;                   /*! Oscillator capacitor selection. These bits select the capacitors applied to the LF crystal or resonator in the LF
                                             * mode (XTS = 0). The effective capacitance (seen by the crystal) is Ceff (CXIN + 2 pF)/2. It is assumed that
                                             * CXIN = CXOUT and that a parasitic capacitance of 2 pF is added by the package and the printed circuit board. For
                                             * details about the typical internal and the effective capacitors, refer to the device-specific data sheet. */
        SMCLKOFF_t  SMCLKOFF;               /*! SMCLK off. This bit turns off the SMCLK.
                                             *  0  SMCLK on
                                             *  1  SMCLK off */
        XT1OFF_t    XT1OFF;                 /*! XT1 off. This bit turns off the XT1.
                                             *  0  XT1 is on if XT1 is selected via the port selection and XT1 is not in bypass mode of operation.
                                             *  1  XT1 is off if it is not used as a source for ACLK, MCLK, or SMCLK or is not used as a reference source
                                             *     required for FLL operation. */
    }

    /*!
     *  ======== UCSCTL7_t ========
     *  Unified Clock System Control 7 Register
     *
     *  @field(XT2OFFG) 0 No fault condition, 1 XT2 fault
     *  @field(XT1HFOFFG) 0 No fault condition, 1 XT1 HF fault
     *  @field(XT1LFOFFG) 0 No fault condition, 1 XT1 LF fault
     *  @field(DCOFFG) 0 No fault condition, 1 DCO fault
     */
    struct UCSCTL7_t {
        XT2OFFG_t   XT2OFFG;                /*! XT2 oscillator fault flag. If this bit is set, the OFIFG flag is also set. XT2OFFG is set if a XT2 fault
                                             * condition exists. XT2OFFG can be cleared via software. If the XT2 fault condition still remains,
                                             * XT2OFFG is set.
                                             *  0  No fault condition occurred after the last reset.
                                             *  1  XT2 fault. An XT2 fault occurred after the last reset. */
        XT1HFOFFG_t XT1HFOFFG;              /*! XT1 oscillator fault flag (HF mode). If this bit is set, the OFIFG flag is also set. XT1HFOFFG is set if a
                                             * XT1 fault condition exists. XT1HFOFFG can be cleared via software. If the XT1 fault condition still
                                             * remains, XT1HFOFFG is set.
                                             *  0  No fault condition occurred after the last reset.
                                             *  1  XT1 fault. An XT1 fault occurred after the last reset. */
        XT1LFOFFG_t XT1LFOFFG;              /*! XT1 oscillator fault flag (LF mode). If this bit is set, the OFIFG flag is also set. XT1LFOFFG is set if a
                                             * XT1 fault condition exists. XT1LFOFFG can be cleared via software. If the XT1 fault condition still
                                             * remains, XT1LFOFFG is set.
                                             *  0  No fault condition occurred after the last reset.
                                             *  1  XT1 fault (LF mode). A XT1 fault occurred after the last reset. */
        DCOFFG_t    DCOFFG;                 /*! DCO fault flag. If this bit is set, the OFIFG flag is also set. The DCOFFG bit is set if DCO = {0} or
                                             * DCO = {31}. DCOFFG can be cleared via software. If the DCO fault condition still remains, DCOFFG is
                                             * set.
                                             *  0  No fault condition occurred after the last reset.
                                             *  1  DCO fault. A DCO fault occurred after the last reset. */
    }

    /*!
     *  ======== UCSCTL8_t ========
     *  Unified Clock System Control 8 Register
     *
     *  @field(MODOSCREQEN) 0  MODOSC conditional requests are disabled
     *                      1  MODOSC conditional requests are enabled
     *  @field(SMCLKREQEN)  0  SMCLK conditional requests are disabled
     *                      1  SMCLK conditional requests are enabled
     *  @field(MCLKREQEN)   0  MCLK conditional requests are disabled
     *                      1  MCLK conditional requests are enabled
     *  @field(ACLKREQEN)   0  ACLK conditional requests are disabled
     *                      1  ACLK conditional requests are enabled
     */
    struct UCSCTL8_t {
        MODOSCREQEN_t   MODOSCREQEN;        /*! MODOSC clock request enable. Setting this enables conditional module requests for MODOSC.
                                             *  0  MODOSC conditional requests are disabled.
                                             *  1  MODOSC conditional requests are enabled. */
        SMCLKREQEN_t    SMCLKREQEN;         /*! SMCLK clock request enable. Setting this enables conditional module requests for SMCLK.
                                             *  0  SMCLK conditional requests are disabled.
                                             *  1  SMCLK conditional requests are enabled. */
        MCLKREQEN_t     MCLKREQEN;          /*! MCLK clock request enable. Setting this enables conditional module requests for MCLK
                                             *  0  MCLK conditional requests are disabled.
                                             *  1  MCLK conditional requests are enabled. */
        ACLKREQEN_t     ACLKREQEN;          /*! ACLK clock request enable. Setting this enables conditional module requests for ACLK
                                             *  0  ACLK conditional requests are disabled.
                                             *  1  ACLK conditional requests are enabled. */
    }

    /*!
     *  ======== UCSCTL9_t ========
     *  Unified Clock System Control 9 Register
     *
     *  @field(XT2BYPASSLV) 0  Input range from 0 to DVCC
     *                      1  Input range from 0 to DVIO
     *  @field(XT1BYPASSLV) 0  Input range from 0 to DVCC
     *                      1  Input range from 0 to DVIO
     */
    struct UCSCTL9_t {
        XT2BYPASSLV_t   XT2BYPASSLV;        /*! Selects XT2 bypass input swing level. Must be set for reduced swing operation.
                                             *  0  Input range from 0 to DVCC
                                             *  1  Input range from 0 to DVIO */
        XT1BYPASSLV_t   XT1BYPASSLV;        /*! Selects XT1 bypass input swing level. Must be set for reduced swing operation.
                                             *  0  Input range from 0 to DVCC
                                             *  1  Input range from 0 to DVIO */
    }

/*
 * Driverlib definitions
 */
    /*! Select the clock source */
    enum UCS_CLK_SOURCE_t {
        UCS_XT1CLK_SELECT = 0x0000,         /*! XT1CLK */
        UCS_VLOCLK_SELECT = 0x0010,         /*! VLOCLK */
        UCS_REFOCLK_SELECT = 0x0020,        /*! REFOCLK */
        UCS_DCOCLK_SELECT = 0x0030,         /*! DCOCLK */
        UCS_DCOCLKDIV_SELECT = 0x0040,      /*! DCOCLKDIV */
        UCS_XT2CLK_SELECT = 0x0050          /*! XT2CLK */
    };

    /*! Select clock source divider */
    enum UCS_CLK_SRC_DIVIDER_t {
        UCS_CLOCK_DIVIDER_1 = 0x0000,       /*! Divide by 1 */
        UCS_CLOCK_DIVIDER_2 = 0x0010,       /*! Divide by 2 */
        UCS_CLOCK_DIVIDER_4 = 0x0020,       /*! Divide by 4 */
        UCS_CLOCK_DIVIDER_8 = 0x0030,       /*! Divide by 8 */
        UCS_CLOCK_DIVIDER_12 = 0x0040,      /*! Divide by 12 */
        UCS_CLOCK_DIVIDER_16 = 0x0050,      /*! Divide by 16 */
        UCS_CLOCK_DIVIDER_32 = 0x0060       /*! Divide by 32 */
    };

    /*! XT1 oscillator capacitor select */
    enum UCS_XCAP_t {
        UCS_XCAP_0 = 0x0000,                /*! ~ 2 pF */
        UCS_XCAP_1 = 0x0004,                /*! ~ 5.5 pF */
        UCS_XCAP_2 = 0x0008,                /*! ~ 8.5 pF */
        UCS_XCAP_3 = 0x000C                 /*! ~ 12 pF */
    };

instance:

    /*! Unified Clock System Control 0 Register */
    config UCSCTL0_t UCSCTL0 = {
        DCO0        : DCO0_OFF,
        DCO1        : DCO1_OFF,
        DCO2        : DCO2_OFF,
        DCO3        : DCO3_OFF,
        DCO4        : DCO4_OFF,
        MOD0        : MOD0_OFF,
        MOD1        : MOD1_OFF,
        MOD2        : MOD2_OFF,
        MOD3        : MOD3_OFF,
        MOD4        : MOD4_OFF,
    };

    /*! Unified Clock System Control 1 Register */
    config UCSCTL1_t UCSCTL1 = {
        DCORSEL     : DCORSEL_2,
        DISMOD      : DISMOD_OFF,
    };

    /*! Unified Clock System Control 2 Register */
    config UCSCTL2_t UCSCTL2 = {
        FLLD        : FLLD_1,
        FLLN0       : FLLN0,
        FLLN1       : FLLN1,
        FLLN2       : FLLN2,
        FLLN3       : FLLN3,
        FLLN4       : FLLN4,
        FLLN5       : FLLN5_OFF,
        FLLN6       : FLLN6_OFF,
        FLLN7       : FLLN7_OFF,
        FLLN8       : FLLN8_OFF,
        FLLN9       : FLLN9_OFF,
    };

    /*! Unified Clock System Control 3 Register */
    config UCSCTL3_t UCSCTL3 = {
        SELREF      : SELREF_0,
        FLLREFDIV   : FLLREFDIV_0,
    };

    /*! Unified Clock System Control 4 Register */
    config UCSCTL4_t UCSCTL4 = {
        SELA        : SELA_0,
        SELS        : SELS_4,
        SELM        : SELM_4,
    };

    /*! Unified Clock System Control 5 Register */
    config UCSCTL5_t UCSCTL5 = {
        DIVPA       : DIVPA_0,
        DIVA        : DIVA_0,
        DIVS        : DIVS_0,
        DIVM        : DIVM_0,
    };

    /*! Unified Clock System Control 6 Register */
    config UCSCTL6_t UCSCTL6 = {
        XT2DRIVE    : XT2DRIVE_3,
        XT2BYPASS   : XT2BYPASS_OFF,
        XT2OFF      : XT2OFF,
        XT1DRIVE    : XT1DRIVE_3,
        XTS         : XTS,
        XT1BYPASS   : XT1BYPASS,
        XCAP        : XCAP_3,
        SMCLKOFF    : SMCLKOFF_OFF,
        XT1OFF      : XT1OFF,
    };

    /*! Unified Clock System Control 7 Register */
    config UCSCTL7_t UCSCTL7 = {
        XT2OFFG     : XT2OFFG_OFF,
        XT1HFOFFG   : XT1HFOFFG_OFF,
        XT1LFOFFG   : XT1LFOFFG,
        DCOFFG      : DCOFFG,
    };

    /*! Unified Clock System Control 8 Register */
    config UCSCTL8_t UCSCTL8 = {
        MODOSCREQEN : MODOSCREQEN_OFF,
        SMCLKREQEN  : SMCLKREQEN,
        MCLKREQEN   : MCLKREQEN,
        ACLKREQEN   : ACLKREQEN,
    };

    /*! Unified Clock System Control 9 Register */
    config UCSCTL9_t UCSCTL9 = {
        XT2BYPASSLV : XT2BYPASSLV_OFF,
        XT1BYPASSLV : XT1BYPASSLV_OFF,
    };

    /*! MCLK clock source select */
    config UCS_CLK_SOURCE_t UCS_MCLK_SOURCE = UCS_DCOCLKDIV_SELECT;

    /*! SMCLK clock source select */
    config UCS_CLK_SOURCE_t UCS_SMCLK_SOURCE = UCS_DCOCLKDIV_SELECT;

    /*! ACLK clock source select */
    config UCS_CLK_SOURCE_t UCS_ACLK_SOURCE = UCS_XT1CLK_SELECT;

    /*! FLL reference clock source select */
    config UCS_CLK_SOURCE_t UCS_FLL_REF_CLK_SOURCE = UCS_XT1CLK_SELECT;

    /*! MCLK clock source divider select */
    config UCS_CLK_SRC_DIVIDER_t UCS_MCLK_SRC_DIVIDER = UCS_CLOCK_DIVIDER_1;

    /*! SMCLK clock source divider select */
    config UCS_CLK_SRC_DIVIDER_t UCS_SMCLK_SRC_DIVIDER = UCS_CLOCK_DIVIDER_1;

    /*! ACLK clock source divider select */
    config UCS_CLK_SRC_DIVIDER_t UCS_ACLK_SRC_DIVIDER = UCS_CLOCK_DIVIDER_1;

    /*! External pin ACLK clock source divider select */
    config UCS_CLK_SRC_DIVIDER_t UCS_PACLK_SRC_DIVIDER = UCS_CLOCK_DIVIDER_1;

    /*! FLL reference clock source divider select */
    config UCS_CLK_SRC_DIVIDER_t UCS_FLL_REF_SRC_DIVIDER = UCS_CLOCK_DIVIDER_1;

    /*! FLLN value */
    config UInt UCS_FLL_RATIO = 31;

    /*! Set FLL target frequency */
    config Float UCS_FLL_FREQ = 0;

    /*! Set XT1 drive strength */
    config XT1DRIVE_t UCS_XT1_DRIVE = XT1DRIVE_3;

    /*! Set XT2 drive strength */
    config XT2DRIVE_t UCS_XT2_DRIVE = XT2DRIVE_3;

    /*! Set oscillator capacitor. Available only in LF mode. See device-specific datasheet for actual values. */
    config UCS_XCAP_t UCS_XCAP = UCS_XCAP_3;

    /*! Set XT1 in bypass mode. The frequency input at XIN1 pin requires 0 to VCC. */
    config Bool UCS_XT1BYPASS = false;

    /*! Set XT2 in bypass mode. The frequency input at XIN2 pin requires 0 to VCC. */
    config Bool UCS_XT2BYPASS = false;

    /*! MODOSC clock request enable. Setting this enables conditional module requests for MODOSC.
     *  0  MODOSC conditional requests are disabled.
     *  1  MODOSC conditional requests are enabled. */
    config MODOSCREQEN_t UCS_MODOSCREQEN = MODOSCREQEN_OFF;

    /*! SMCLK clock request enable. Setting this enables conditional module requests for SMCLK.
     *  0  SMCLK conditional requests are disabled.
     *  1  SMCLK conditional requests are enabled. */
    config SMCLKREQEN_t UCS_SMCLKREQEN = SMCLKREQEN;

    /*! MCLK clock request enable. Setting this enables conditional module requests for MCLK
     *  0  MCLK conditional requests are disabled.
     *  1  MCLK conditional requests are enabled. */
    config MCLKREQEN_t UCS_MCLKREQEN = MCLKREQEN;

    /*! ACLK clock request enable. Setting this enables conditional module requests for ACLK
     *  0  ACLK conditional requests are disabled.
     *  1  ACLK conditional requests are enabled. */
    config ACLKREQEN_t UCS_ACLKREQEN = ACLKREQEN;

    /*! Turns OFF SMCLK using the SMCLKOFF bit
     *  0  SMCLK On
     *  1  SMCLK Off */
    config Bool UCS_SMCLKOFF = false;

    config Float VLOCLKHz = 12000;
    config Float WATCHCRYSTALCLKHz = 32768;
    config Float REFOCLKHz = 32768;
    config Float XT1CLKHz = 0;
    config Float XT2CLKHz = 0;

    /*!
     *  ======== DCOCLKDIVHz ========
     *  Divided DCO clock frequency in Hertz
     */
    readonly config Float DCOCLKDIVHz;

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "UCS_SMCLKREQEN"  , regForceSet : false },
        { register : "UCS_MCLKREQEN" , regForceSet : false },
        { register : "UCS_ACLKREQEN" , regForceSet : false },
        { register : "UCS_MODOSCREQEN" , regForceSet : false }
    ];
}

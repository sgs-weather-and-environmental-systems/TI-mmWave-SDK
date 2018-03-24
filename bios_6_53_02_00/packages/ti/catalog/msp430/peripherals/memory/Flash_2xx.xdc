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
 *  ======== Flash_2xx ========
 *  MSP430F2xx Family Flash Module
 */
metaonly module Flash_2xx inherits IFlash
{
    /* FCTL1 Register */
    struct FCTL1_t {
        FWKEY_t     FWKEY;                  /*! FCTLx password Always read as 096h. Must be written as 0A5h or a PUC
                                             *  will be generated. */
        BLKWRT_t    BLKWRT;                 /*! Block write mode */
        WRT_t       WRT;                    /*! Write */
        EEIEX_t     EEIEX;                  /*! Enable Emergency Interrupt Exit */
        EEI_t       EEI;                    /*! Enable Erase Interrupts */
        MERAS_t     MERAS;                  /*! Mass erase */
        ERASE_t     ERASE;                  /*! Erase */
    }

    /* FCTL2 Register */
    struct FCTL2_t {
        FWKEY_t     FWKEY;                  /*! FCTLx password Always read as 096h. Must be written as 0A5h or a PUC
                                             *  will be generated. */
         FSSEL_t     FSSEL;                 /*! Flash controller clock source select
                                             *   00  ACLK
                                             *   01  MCLK
                                             *   10  SMCLK
                                             *   11  SMCLK */
        FN5_t    FN5;                       /*! Flash Controller Clock Divider Bit 5 */
        FN4_t    FN4;                       /*! Flash Controller Clock Divider Bit 4 */
        FN3_t    FN3;                       /*! Flash Controller Clock Divider Bit 3 */
        FN2_t    FN2;                       /*! Flash Controller Clock Divider Bit 2 */
        FN1_t    FN1;                       /*! Flash Controller Clock Divider Bit 1 */
        FN0_t    FN0;                       /*! Flash Controller Clock Divider Bit 0 */
    }

    /* FCTL3 Register */
    struct FCTL3_t {
        FWKEY_t     FWKEY;                  /*! FCTLx password. Always read as 096h. Must be written as 0A5h or a PUC
                                             *  will be generated. */
        FAIL_t      FAIL;                   /*!  FAIL Bit 7 Operation failure. This bit is set if the fFTG clock source fails, or a flash
                                             *  operation is aborted from an interrupt when EEIEX = 1. FAIL must be reset
                                             *  with software.
                                             *  0  No failure
                                             *  1  Failure */
        LOCKA_t     LOCKA;                  /*! SegmentA and Info lock. Write a 1 to this bit to change its state. Writing 0 has
                                             *  no effect.
                                             *  0  Segment A unlocked and all information memory is erased during a
                                             *     mass erase.
                                             *  1  Segment A locked and all information memory is protected from erasure
                                             *     during a mass erase. */
        EMEX_t      EMEX;                   /*! Emergency exit
                                             *  0  No emergency exit
                                             *  1  Emergency exit */
        LOCK_t      LOCK;                   /*! Lock. This bit unlocks the flash memory for writing or erasing. The LOCK bit
                                             *  can be set anytime during a byte/word write or erase operation and the
                                             *  operation will complete normally. In the block write mode if the LOCK bit is set
                                             *  while BLKWRT=WAIT=1, then BLKWRT and WAIT are reset and the mode
                                             *  ends normally.
                                             *  0  Unlocked
                                             *  1  Locked */
        WAIT_t      WAIT;                   /*! Wait. Indicates the flash memory is being written to.
                                             *  0  The flash memory is not ready for the next byte/word write
                                             *  1  The flash memory is ready for the next byte/word write */
        ACCVIFG_t   ACCVIFG;                /*! Access violation interrupt flag
                                             *  0 No interrupt pending
                                             *  1 Interrupt pending */
        KEYV_t      KEYV;                   /*! Flash security key violation. This bit indicates an incorrect FCTLx password
                                             *  was written to any flash control register and generates a PUC when set. KEYV
                                             *  must be reset with software.
                                             *  0  FCTLx password was written correctly
                                             *  1  FCTLx password was written incorrectly */
        BUSY_t      BUSY;                   /*! Busy. This bit indicates the status of the flash timing generator.
                                             *  0  Not Busy
                                             *  1  Busy */
    }

    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

instance:
    /*! Flash Memory Control Register 1 */
    config FCTL1_t FCTL1 = {
        FWKEY   : FWKEY,
        BLKWRT  : BLKWRT_OFF,
        WRT     : WRT_OFF,
        EEIEX   : EEIEX_OFF,
        EEI     : EEI_OFF,
        MERAS   : MERAS_OFF,
        ERASE   : ERASE_OFF
    };

    /*! Flash Memory Control Register 2 */
    config FCTL2_t FCTL2 = {
        FWKEY       : FWKEY,
        FSSEL       : FSSEL_1,
        FN5         : FN5_OFF,
        FN4         : FN4_OFF,
        FN3         : FN3_OFF,
        FN2         : FN2_OFF,
        FN1         : FN1,
        FN0         : FN0_OFF
    };

    /*! Flash Memory Control Register 3 */
    config FCTL3_t FCTL3 = {
        FAIL        : FAIL_OFF,
        LOCKA       : LOCKA_OFF,
        EMEX        : EMEX_OFF,
        LOCK        : LOCK,
        WAIT        : WAIT,
        ACCVIFG     : ACCVIFG_OFF,
        KEYV        : KEYV_OFF,
        BUSY        : BUSY_OFF
    };

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] = [
        { register : "FCTL1" , regForceSet : false },
        { register : "FCTL2" , regForceSet : false },
        { register : "FCTL3" , regForceSet : false }
    ];

    config IClock.Instance clock;
}

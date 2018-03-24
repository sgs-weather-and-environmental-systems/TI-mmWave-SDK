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
 *  ======== IFlash ========
 *  MSP430 IFlash interface
 */
metaonly interface IFlash inherits xdc.platform.IPeripheral {

    enum FWKEY_t {
        FWKEY_OFF = 0x00,
        FWKEY = 0xA500
    };

    /*! Block write mode */
    enum BLKWRT_t {
        BLKWRT_OFF = (0x0000),              /*! Block-write mode is off */
        BLKWRT = 0x0080                     /*! Block-write mode is on */
    };

    /*! Write */
    enum WRT_t {
        WRT_OFF = (0x0000),                 /*! Write mode is off */
        WRT = 0x0040                        /*! Write mode is on */
    };

    /*! Enable Emergency Interrupt Exit */
    enum EEIEX_t {
        EEIEX_OFF = (0x0000),               /*! Exit interrupt disabled */
        EEIEX = 0x0010                      /*! Exit interrupt enabled */
    };

    /*! Enable Erase Interrupts */
    enum EEI_t {
        EEI_OFF = (0x0000),                 /*! Interrupts during segment erase disabled */
        EEI = 0x0008                        /*! Interrupts during segment erase enabled */
    };

    /*! Mass erase */
    enum MERAS_t {
        MERAS_OFF = (0x0000),               /*! Mass erase disabled */
        MERAS = 0x0004                      /*! Mass erase enabled */
    };

    /*! Erase */
    enum ERASE_t {
        ERASE_OFF = (0x0000),               /*! Erase disabled */
        ERASE = 0x0002                      /*! Erase enabled */
    };

    enum FSSEL_t {
        FSSEL_0 = 0x0000,                   /*! ACLK */
        FSSEL_1 = 0x0040,                   /*! MCLK  */
        FSSEL_2 = 0x0080                    /*! SMCLK */
     };

     /*! Flash controller clock divider bit 0 */
    enum FN0_t {
        FN0_OFF = (0x0000),                 /*! Flash controller clock divider bit 0 */
        FN0 = 0x0001                        /*! Flash controller clock divider bit 0 */
    };

    /*! Flash controller clock divider bit 1 */
    enum FN1_t {
        FN1_OFF = (0x0000),                 /*! Flash controller clock divider bit 1 */
        FN1 = 0x0002                        /*! Flash controller clock divider bit 1 */
    };

    /*! Flash controller clock divider bit 2 */
    enum FN2_t {
        FN2_OFF = (0x0000),                 /*! Flash controller clock divider bit 2 */
        FN2 = 0x0004                        /*! Flash controller clock divider bit 2 */
    };

    /*! Flash controller clock divider bit 3 */
    enum FN3_t {
        FN3_OFF = (0x0000),                 /*! Flash controller clock divider bit 3 */
        FN3 = 0x0008                        /*! Flash controller clock divider bit 3 */
    };

    /*! Flash controller clock divider bit 4 */
    enum FN4_t {
        FN4_OFF = (0x0000),                 /*! Flash controller clock divider bit 4 */
        FN4 = 0x0010                        /*! Flash controller clock divider bit 4 */
    };

    /*! Flash controller clock divider bit 5 */
    enum FN5_t {
        FN5_OFF = (0x0000),                 /*! Flash controller clock divider bit 5 */
        FN5 = 0x0020                        /*! Flash controller clock divider bit 5 */
    };

    /*! Operation failure */
    enum FAIL_t {
        FAIL_OFF = (0x0000),                /*! No failure */
        FAIL = 0x0080                       /*! Failure */
    };

    /*! SegmentA and Info lock */
    enum LOCKA_t {
        LOCKA_OFF = (0x0000),               /*! Segment A unlocked and all information memory is erased during a mass erase */
        LOCKA = 0x0040                      /*! Segment A locked and all information memory is protected from erasure during a mass erase */
    };

    /*! Emergency exit */
    enum EMEX_t {
        EMEX_OFF = (0x0000),                /*! No emergency exit */
        EMEX = 0x0020                       /*! Emergency exit */
    };

    /*! Lock */
    enum LOCK_t {
        LOCK_OFF = (0x0000),                /*! Unlocked */
        LOCK = 0x0010                       /*! Locked */
    };

    /*! Wait */
    enum WAIT_t {
        WAIT_OFF = (0x0000),                /*! The flash memory is not ready for the next byte/word write */
        WAIT = 0x0008                       /*! The flash memory is ready for the next byte/word write */
    };

    /*! Access violation interrupt flag */
    enum ACCVIFG_t {
        ACCVIFG_OFF = (0x0000),             /*! No interrupt pending */
        ACCVIFG = 0x0004                    /*! Interrupt pending */
    };

    /*! Flash security key violation */
    enum KEYV_t {
        KEYV_OFF = (0x0000),                /*! FCTLx password was written correctly */
        KEYV = 0x0002                       /*! FCTLx password was written incorrectly */
    };

    /*! Busy */
    enum BUSY_t {
        BUSY_OFF = (0x0000),                /*! Not Busy */
        BUSY = 0x0001                       /*! Busy */
    };

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
    /*! Max Flash Timing Generator Value from Datasheet */
    config UInt8 uMaxFtg;

    /*! Min Flash Timing Generator Value from Datasheet */
    config UInt8 uMinFtg;

}

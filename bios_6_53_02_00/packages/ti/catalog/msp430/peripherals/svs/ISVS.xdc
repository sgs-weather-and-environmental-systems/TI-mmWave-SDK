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
 *  ======== ISVS ========
 *  MSP430 ISVS interface
 */
metaonly interface ISVS inherits xdc.platform.IPeripheral {

     /*! VLD3 Bit */
     enum VLD3_t {
        VLD3_OFF = 0x00,
        VLD3 = 0x80
     };
     /*! VLD2 Bit */
     enum VLD2_t {
        VLD2_OFF = 0x00,
        VLD2 = 0x40
     };
     /*! VLD1 Bit */
     enum VLD1_t {
         VLD1_OFF = 0x00,
         VLD1 = 0x20
     };
     /*! VLD0 Bit */
     enum VLD0_t {
        VLD0_OFF = 0x00,
        VLD0 = 0x10
     };
     /*! PORON Bit */
     enum PORON_t {
         PORON_OFF = 0x00,   /*! SVSFG does not cause a POR */
         PORON = 0x08        /*! SVSFG causes a POR */
      };
     /*! SVSON Bit */
     enum SVSON_t {
        SVSON_OFF = 0x00,
        SVSON = 0x04
     };
     /*! SVSOP Bit */
     enum SVSOP_t {
        SVSOP_OFF = 0x00,
        SVSOP = 0x02
     };
     /*! SVSFG Bit */
     enum SVSFG_t {
        SVSFG_OFF = 0x00,
        SVSFG = 0x01
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

}

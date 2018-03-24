/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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
/*
 *  ======== Mmu.xdc ========
 */

package ti.sysbios.family.arm.v8a;

/*!
 *  ======== Mmu ========
 *  Memory Management Unit Manager.
 */

@DirectCall
module Mmu
{
    const UInt8 NUM_LEVEL1_ENTRIES = 512;

    /*!
     *  ======== DescriptorType ========
     *
     *  Different descriptor type encodings:
     *  @p(blist)
     *  - Invalid or Fault entry (0b00 or 0b10)
     *  - Block descriptor entry (0b01)
     *  - Table descriptor entry (0b11)
     *  @p
     */
    enum DescriptorType {
        DescriptorType_INVALID0 = 0,   /*! Virtual address is unmapped     */
        DescriptorType_BLOCK = 1,      /*! Block descriptor                */
        DescriptorType_INVALID1 = 2,   /*! Virtual address is unmapped     */
        DescriptorType_TABLE = 3       /*! Next-level table address        */
    };

    /*!
     *  ======== DescriptorAttrs ========
     *  Structure containing attributes for descriptor entries
     *
     *  nsTable, apTable, xnTable and pxnTable fields are used only for
     *  DescriptorType.TABLE
     *
     *  noExecute, privNoExecute, contiguous, notGlobal, accessFlag, shareable,
     *  accPerm, nonSecure and attrIndx fields are used only for
     *  DescriptorType.BLOCK
     */
    struct DescriptorAttrs {
        DescriptorType type;    /*! descriptor type                         */
        Bool  nsTable;          /*! security level for subsequent levels    */
        UInt8 apTable;          /*! access perm limit for subsequent levels */
        Bool  xnTable;          /*! XN limit for subsequent levels          */
        Bool  pxnTable;         /*! PXN limit for subsequent levels         */
        Bool  noExecute;        /*! execute-never bit                       */
        Bool  privNoExecute;    /*! privileged execute-never bit            */
        Bool  contiguous;       /*! hint bit indicating 16 adjacent table
                                    entries point to contiguos memory       */
        Bool  notGlobal;        /*! not global bit                          */
        Bool  accessFlag;       /*! access flag                             */
        UInt8 shareable;        /*! shareability field value 0-3            */
        UInt8 accPerm;          /*! access permission bits value 0-3        */
        Bool  nonSecure;        /*! non-secure bit                          */
        UInt8 attrIndx;         /*! stage 1 memory attributes index field for
                                    the indicated MAIRn register value 0-7  */
        UInt8 reserved;         /*! Bits[58:55] reserved for software use   */
    };

    /*! default descriptor attributes structure */
    config DescriptorAttrs defaultAttrs = {
        type: DescriptorType_TABLE, /* TABLE descriptor */
        nsTable: false,         /* security level for subsequent levels    */
        apTable: 0,             /* access perm limit for subsequent levels */
        xnTable: false,         /* XN limit for subsequent levels          */
        pxnTable: false,        /* PXN limit for subsequent levels         */
        noExecute: false,       /* execute-never bit                       */
        privNoExecute: false,   /* privileged execute-never bit            */
        contiguous: false,      /* hint bit indicating 16 adjacent table
                                   entries point to contiguos memory       */
        notGlobal: false,       /* not global bit                          */
        accessFlag: true,       /* access flag                             */
        shareable: 0,           /* shareability field                      */
        accPerm: 0,             /* access permission bits                  */
        nonSecure: false,       /* non-secure bit                          */
        attrIndx: 0,            /* stage 1 memory attributes index field
                                   for the indicated MAIRn register        */
        reserved: 0             /* Bits[58:55] reserved for software use   */
    };

    /*!
     *  ======== enableMMU ========
     *  Configuration parameter to enable MMU.
     */
    config Bool enableMMU = true;

    /*!
     *  ======== enable ========
     *  Enables the MMU.
     *
     *  If the MMU is already enabled, then simply return.
     *  Otherwise this function does the following:
     *  @p(blist)
     *  If the L1 program cache is enabled, invalidate all of L1
     *  program cache.
     *  @p
     *
     *  This function enables the MMU on the core it is called from.
     *
     *  @a(Note)
     *  This function does not change the L1 data/program cache settings.
     */
    Void enable();

    /*!
     *  ======== initDescAttrs() ========
     *  Initializes the descriptor attribute structure
     *
     *  @param(attrs)      Pointer to descriptor attribute struct
     */
    Void initDescAttrs(DescriptorAttrs *descAttrs);

    /*!
     *  ======== setMAIR() ========
     */
    Void setMAIR(UInt8 idx, UInt16 val);

    /*!
     *  @_nodoc
     *  ======== startup ========
     *  startup function to initialize MMU module
     */
    Void startup();

internal:

    /*
     *  ======== init ========
     */
    Void init(Ptr tableAddr);

    /*
     *  ======== initLevel1Desc ========
     */
    UInt64 initLevel1Desc(UInt64 phyAddr, DescriptorAttrs *attrs);

    /*
     *  ======== initLevel2Desc ========
     */
    UInt64 initLevel2Desc(UInt64 phyAddr, DescriptorAttrs *attrs);

    /*
     *  ======== setTCR ========
     */
    Void setTCR(UInt64 regVal);

    /*! Module state */
    struct Module_State {
        UInt64 level1Table[];
        UInt64 level2Table[];
    }
}

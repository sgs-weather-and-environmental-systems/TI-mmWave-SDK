/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== AMMU.xdc ========
 */

package ti.sysbios.hal.ammu;

import xdc.rov.ViewInfo;

/*! 
 *  ======== AMMU ========
 *  Attribute MMU configuration module
 *
 *  Responsible for initializing the Attribute MMU
 *
 *  @a(Restrictions)
 *  When used within a dual M3 core (Ducati) arrangement, care must be
 *  taken when initializing this shared resource. 
 *  The "Shared Resources" note provided
 *  in the {@link ti.sysbios.family.arm.ducati ducati} package discusses
 *  the management of the various hardware and software resources
 *  shared by the two M3 cores.
 *
 *  As the AMMU is shared between the two M3 cores, it should only
 *  be initialized and enabled once.
 *  It is intended that Core 0 will {@link #configureAmmu configure} 
 *  the AMMU at startup.
 *  @a
 */

@DirectCall
module AMMU
{
    // -------- xgconf config filters --------

    /*! @_nodoc */
    metaonly readonly config xdc.runtime.Types.ViewInfo filteredNameMap$[string] = [
        ["Filtered Variables", {viewType: "module", viewFxn: "pageSizeFilter",
        fields: [
            "largePages", "mediumPages", "smallPages"
        ]}],
    ];

    /*! @_nodoc */
    metaonly any pageSizeFilter(int op, string paramName, string value);

    // -------- ROV views --------
    
    /*! @_nodoc */
    metaonly struct PageView {
        String      Page;
        Ptr         AddrVirtual;
        String      AddrPhysical;
        Bool        Enabled;
        Bool        L1Cacheable;
        String      L1WrPolicy;
        String      L1AllocPolicy;
        Bool        L1Posted;
        Bool        L2Cacheable;
        String      L2WrPolicy;
        String      L2AllocPolicy;
        Bool        L2Posted;
        Bool        ReadOnly;
        Bool        ExecOnly;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
                ['PageView',  {type: ViewInfo.MODULE_DATA, 
                  viewInitFxn: 'viewPages',
                  structName: 'PageView'}]
           ]
       });

    /* 
     * Policy register field definitions
     */

    metaonly enum Small {
        Small_4K,
        Small_8K,
        Small_16K,
        Small_32K
    };

    metaonly enum Medium {
        Medium_128K,
        Medium_256K,
        Medium_512K,
        Medium_1M
    };

    metaonly enum Large {
        Large_2M,
        Large_4M,
        Large_8M,
        Large_16M,
        Large_32M,
        Large_64M,
        Large_128M,
        Large_256M,
        Large_512M
    };

    metaonly enum Volatile {
        Volatile_DO_NOT_FOLLOW,
        Volatile_FOLLOW
    };

    metaonly enum CachePolicy {
        CachePolicy_NON_CACHEABLE,
        CachePolicy_CACHEABLE
    };

    metaonly enum PostedPolicy {
        PostedPolicy_NON_POSTED,
        PostedPolicy_POSTED
    };

    metaonly enum AllocatePolicy {
        AllocatePolicy_NON_ALLOCATE,
        AllocatePolicy_ALLOCATE
    };

    metaonly enum WritePolicy {
        WritePolicy_WRITE_THROUGH,
        WritePolicy_WRITE_BACK
    };

    metaonly enum Enable {
        Enable_NO,
        Enable_YES
    };

    /* 
     * Page Descriptor Definitions
     */

    metaonly struct LargePage {
        Enable          pageEnabled;
        Ptr             logicalAddress;

        Enable          translationEnabled;
        Ptr             translatedAddress;

        Large           size;
        Volatile        volatileQualifier;
        Enable          executeOnly;
        Enable          readOnly;
        Enable          prefetch;
        Enable          exclusion;
        CachePolicy     L1_cacheable;
        PostedPolicy    L1_posted;
        AllocatePolicy  L1_allocate;
        WritePolicy     L1_writePolicy;
        CachePolicy     L2_cacheable;
        PostedPolicy    L2_posted;
        AllocatePolicy  L2_allocate;
        WritePolicy     L2_writePolicy;
    };

    metaonly struct MediumPage {
        Enable          pageEnabled;
        Ptr             logicalAddress;

        Enable          translationEnabled;
        Ptr             translatedAddress;

        Medium          size;
        Volatile        volatileQualifier;
        Enable          executeOnly;
        Enable          readOnly;
        Enable          prefetch;
        Enable          exclusion;
        CachePolicy     L1_cacheable;
        PostedPolicy    L1_posted;
        AllocatePolicy  L1_allocate;
        WritePolicy     L1_writePolicy;
        CachePolicy     L2_cacheable;
        PostedPolicy    L2_posted;
        AllocatePolicy  L2_allocate;
        WritePolicy     L2_writePolicy;
    };

    metaonly struct SmallPage {
        Enable          pageEnabled;
        Ptr             logicalAddress;

        Enable          translationEnabled;
        Ptr             translatedAddress;

        Small           size;
        Volatile        volatileQualifier;
        Enable          executeOnly;
        Enable          readOnly;
        Enable          prefetch;
        Enable          exclusion;
        CachePolicy     L1_cacheable;
        PostedPolicy    L1_posted;
        AllocatePolicy  L1_allocate;
        WritePolicy     L1_writePolicy;
        CachePolicy     L2_cacheable;
        PostedPolicy    L2_posted;
        AllocatePolicy  L2_allocate;
        WritePolicy     L2_writePolicy;
    }

    metaonly enum Maintenance {
        DO_NOT_PERFORM,
        PERFORM
    };

    metaonly enum Invalidate {
        DO_NOT_INVALIDATE,
        INVALIDATE
    };

    metaonly enum Unlock {
        DO_NOT_UNLOCK,
        UNLOCK
    };

    metaonly enum Lock {
        DO_NOT_LOCK,
        LOCK
    };

    metaonly enum Clean {
        DO_NOT_CLEAN,
        CLEAN
    };

    metaonly struct SmallPageMaintenance {
        Maintenance     maintL2Cache;
        Maintenance     maintL1Cache2;
        Maintenance     maintL1Cache1;
        Enable          cpuInterrupt;
        Enable          hostInterrupt;
        Invalidate      invalidate;
        Clean           clean;
        Unlock          unlock;
        Lock            lock;
        Enable          preload;
    };

    metaonly struct LinePage {
        Enable          pageEnabled;
        Ptr             logicalAddress;

        Enable          translationEnabled;
        Ptr             translatedAddress;
    };

    metaonly struct DebugPage {
        Enable          pageEnabled;
        Enable          translationEnabled;
        Ptr             translatedAddress;
    };

    /*! The number of Large Page Desciptors is target/device specific */
    metaonly config LargePage largePages[] = [];

    /*! The number of Medium Page Desciptors is target/device specific */
    metaonly config MediumPage mediumPages[] = [];

    /*! The number of Small Page Desciptors is target/device specific */
    metaonly config SmallPage smallPages[] = [];

    /*! The number of Line Page Desciptors is target/device specific */
    metaonly config LinePage linePages[] = [];

    metaonly config DebugPage debugPage;

    /*
     * Runtime representation of the MMU registers
     */
    struct MMU {
        Char *LARGE_ADDR[8];    /* 0800 - 001C */
        Char *LARGE_XLTE[8];    /* 0820 - 003C */
        UInt32 LARGE_POLICY[8]; /* 0840 - 005C */

        Char *MEDIUM_ADDR[16];  /* 0860 - 009C */
        Char *MEDIUM_XLTE[16];  /* 08A0 - 00DC */
        UInt32 MEDIUM_POLICY[16]; /* 08E0 - 011C */

        Char *SMALL_ADDR[32];   /* 0920 - 019C */
        Char *SMALL_XLTE[32];   /* 09A0 - 021C */
        UInt32 SMALL_POLICY[32];/* 0A20 - 029C */
        UInt32 SMALL_MAINT[32]; /* 0AA0 - 031c */

        Char *LINE_ADDR[32];    /* 0B20 - 0B9C */
        Char *LINE_XLTE[32];    /* 0BA0 - 041C */
        UInt32 LINE_POLICY[32]; /* 0C20 - 049C */

        Char *DEBUG_XLTE;               /* 0CA0 */
        UInt32 DEBUG_POLICY;    /* 0CA4 */

        UInt32 MAINT;           /* 0CA8 */
        Char *MSTART;           /* 0CAC */
        Char *MEND;             /* 0CB0 */
        UInt32 MSTAT;           /* 0CB4 */
    };

    /*! 
     *  This device's AMMU register set address.
     *  Initialized internally according to build target/device.
     */
    extern volatile MMU mmu;

    /*! 
     * By default the AMMU module will configure the AMMU at startup.
     *
     * By setting this flag to false (ie for Ducati core1), the AMMU
     * module APIs are available but the initialization step is suppressed.
     */
    config Bool configureAmmu = true;

    /*!
     *  ======== invAll ========
     *  Invalidate entire L1 and L2 caches
     *  Waits for completion.
     */
    Void invAll();

    /*!
     *  @_nodoc
     *  ======== dumpAmmu ========
     *  formatted dump of the contents of the AMMU registers
     */
    Void dumpAmmu();

    /*!
     *  @_nodoc
     *  ======== init ========
     *  MMU initialization function called at startup
     */
    Void init();

internal:

    config UInt numLargePages;
    config UInt numMediumPages;
    config UInt numSmallPages;
    config UInt numLinePages;

    /* base address of mmu registers */
    metaonly config Ptr baseAddr;

    /* const image of intial mmu register values */
    config MMU mmuInitConfig;
    
    /* String names of page sizes */
    metaonly config String largePageSizeStrings[];
    metaonly config String mediumPageSizeStrings[];
    metaonly config String smallPageSizeStrings[];
}

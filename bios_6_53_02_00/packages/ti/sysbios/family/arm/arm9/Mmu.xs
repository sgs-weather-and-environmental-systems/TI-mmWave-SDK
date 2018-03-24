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
 *  ======== Mmu.xs ========
 */

var Mmu = null;
var Memory = null;
var deviceName = null;
var SECTION_DESC_SHIFT = 20;
var Cache = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.Arm9":
            return (["Mmu_asm.asm"]);
            break;

        default:
            return (null);
    }
}

/*
 *  This table is needed to map the physical base addresses
 *  to a virtual address so that no MMU fault is generated when
 *  the addresses are accessed. Only the 12 MSBs are important
 *  here for doing a 1-to-1 mapping between virtual and physical.
 */
if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "TMS320CDM6446": {
            timer0BaseAddr: 0x01c21400,
            vectorTableBaseAddr: 0x02000000,
            bufferable: true,
        },
        "TMS320CDM510": {
            timer0BaseAddr: 0x01c21400,
            vectorTableBaseAddr: 0x00000000,
            bufferable: true,
        },
        "TMS320DA830": {
            timestampProviderBaseAddr: 0x01bc1800,
            timer0BaseAddr:  0x01c20000,
            vectorTableBaseAddr: 0xffff0000,
            bufferable: false,
        },
        "TMS320DA850": {
            timestampProviderBaseAddr: 0x01bc1800,
            timer0BaseAddr:  0x01c20000,
            timer2BaseAddr:  0x01f0c000,
            vectorTableBaseAddr: 0xffff0000, 
            bufferable: true,
        },
    }
    
    deviceTable["TMS320DM355"]   = deviceTable["TMS320CDM510"];
    deviceTable["TMS320DM365"]   = deviceTable["TMS320CDM510"];
    deviceTable["TMS320CDM6467"] = deviceTable["TMS320CDM510"];
    
    deviceTable["TMS320DA805"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA807"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA808"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA810"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA828"]   = deviceTable["TMS320DA830"];
    deviceTable["OMAPL137"]      = deviceTable["TMS320DA830"];
    deviceTable["AM1705"]        = deviceTable["TMS320DA830"];
    deviceTable["AM1707"]        = deviceTable["TMS320DA830"];
    
    deviceTable["OMAPL108"]      = deviceTable["TMS320DA850"];
    deviceTable["OMAPL118"]      = deviceTable["TMS320DA850"];
    deviceTable["OMAPL138"]      = deviceTable["TMS320DA850"];
    deviceTable["AM1806"]        = deviceTable["TMS320DA850"];
    deviceTable["AM1808"]        = deviceTable["TMS320DA850"];
}
    
/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    this.$private.getAsmFiles = getAsmFiles;

    Mmu = this;

    /* set fxntab default */
    Mmu.common$.fxntab = false;
    
    var deviceSupported = false;
    
    /* loop through the device table */
    for (deviceName in deviceTable) {
        if (deviceName == Program.cpu.deviceName) {
            deviceSupported = true;
            break;
        }
    }

    if (!(deviceSupported)) {
        print("Mmu is not supported for the specified device (" +
              Program.cpu.deviceName + ")");

        throw new Error ("Mmu unsupported on device!");
    }
    
    /* set the tableBuf size to 16KB or 4K words */
    Mmu.tableBuf.length = 0x1000;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Memory = xdc.useModule('xdc.runtime.Memory');
    Cache  = xdc.useModule('ti.sysbios.family.arm.arm9.Cache');
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* The MMU first level table descriptor needs to be 16KB or 4K words */
    mod.tableBuf.length = Mmu.tableBuf.length;
    
    /* The section name of the MMU table (documented in Mmu.xdc) */
    var tableSectionName = "ti.sysbios.family.arm.arm9.mmuTableSection";

    /*
     *  Place the table buffer into the specified section name.
     *  The table buffer must be aligned on a 16KB boundary.
     */
    Memory.staticPlace(mod.tableBuf, 0x4000, tableSectionName);
 
    /* Place tableSection into default dataMemory section if not specified. */
    if (Program.sectMap[tableSectionName] === undefined) {
        Program.sectMap[tableSectionName] = new Program.SectionSpec();
        Program.sectMap[tableSectionName].type = "NOINIT";
        Program.sectMap[tableSectionName].loadSegment =
            Program.platform.dataMemory;
    }
    
    /* Make a 1-to-1 mapping of virtual to physical address for memory map */
    var map = Program.cpu.memoryMap;
    for (var i=0; i < map.length; i++) {
        /* Get base address and length and unsigned right shift to get index */
        var start = map[i].base >>> SECTION_DESC_SHIFT;
        var end = (map[i].base + map[i].len - 1) >>> SECTION_DESC_SHIFT;
        var index = start;
        var attrs =
            {
                type       : Mmu.FirstLevelDesc_SECTION,  // SECTION descriptor
                bufferable : deviceTable[deviceName].bufferable, // bufferable
                cacheable  : true,                        // cacheable
            };
        
        do {
            /* only set if table descriptor has not been set */
            if (Mmu.tableBuf[index] == undefined) {
                if (Mmu.cachePlatformMemory == true) {
                    setFirstLevelDescMeta(index << SECTION_DESC_SHIFT,
                                      index << SECTION_DESC_SHIFT,
                                      attrs);
                }
                else {
                    setFirstLevelDescMeta(index << SECTION_DESC_SHIFT,
                                      index << SECTION_DESC_SHIFT,
                                      Mmu.defaultAttrs);
                }
            }
            
            index++;
        } while (index <= end);
    }
    
    /* Force peripheral sections to be NON cacheable */    
    var peripheralAttrs =
            {
                type       : Mmu.FirstLevelDesc_SECTION,  // SECTION descriptor
                bufferable : false,                       // bufferable
                cacheable  : false,                       // cacheable
            };

    /* 1-to-1 mapping of virtual to physical address from the table above */
    for each (var addr in deviceTable[deviceName]) {
        setFirstLevelDescMeta(addr, addr, peripheralAttrs);
    }
}

/*
 *  ======== setFirstLevelDescMeta ========
 */
function setFirstLevelDescMeta(virtualAddr, phyAddr, attrs)
{
    var index = virtualAddr >>> SECTION_DESC_SHIFT;
    var desc = 0;
    
    /* Set type field to default if undefined */
    if (attrs.type === undefined) {
        attrs.type = Mmu.defaultAttrs.type;
    }

    /* Set bufferable field to default if undefined */
    if (attrs.bufferable === undefined) {
        attrs.bufferable = Mmu.defaultAttrs.bufferable;
    }

    /* Set cacheable field to default if undefined */
    if (attrs.cacheable === undefined) {
        attrs.cacheable = Mmu.defaultAttrs.cacheable;
    }

    /* Set imp field to default if undefined */
    if (attrs.imp === undefined) {
        attrs.imp = Mmu.defaultAttrs.imp;
    }

    /* Set domain field to default if undefined */
    if (attrs.domain === undefined) {
        attrs.domain = Mmu.defaultAttrs.domain;
    }

    /* Set accPerm field to default if undefined */
    if (attrs.accPerm === undefined) {
        attrs.accPerm = Mmu.defaultAttrs.accPerm;
    }
    
    switch (attrs.type) {
        /* Coarse page table descriptor */
        case Mmu.FirstLevelDesc_COARSE:
            desc = (attrs.type) |
                   (attrs.imp << 4) |
                   (attrs.domain << 5) |
                   (phyAddr & 0xFFFFFC00);
            break;
        
        /* Section descriptor */
        case Mmu.FirstLevelDesc_SECTION:
            desc = (attrs.type) |
                   (attrs.bufferable << 2) |
                   (attrs.cacheable << 3) |
                   (attrs.imp << 4) |
                   (attrs.domain << 5) |
                   (attrs.accPerm << 10) |
                   (phyAddr & 0xFFF00000);
            break;
        
        /* Fine page table descriptor */
        case Mmu.FirstLevelDesc_FINE:
            desc = (attrs.type) |
                   (attrs.imp << 4) |
                   (attrs.domain << 5) |
                   (phyAddr & 0xFFFF0000);
            break;
        
        default:
            Mmu.$logError("Mmu.setFirstLevelDescMeta: the type " +
                "(" + attrs.type + ")" + " is not recognized.", Mmu);
            break;
    }

    Mmu.tableBuf[index] = convertToUInt32(desc);
}

/*
 *  ======== convertToUInt32 ========
 */
function convertToUInt32(value)
{
    /*
     *  Provide this workaround here due to javascript.
     *  Note: Javascript converts numbers to 32-bit signed numbers before
     *        evaluating bitwise operators.
     */
    if (value < 0) {
        value = value + 0xffffffff + 1;
    }
    
    return (value);
}

/*
 *  ======== viewGetPolicy ========
 *  Used as a helper function for the viewPages function
 */
function viewGetPolicy(elem, policyVal) 
{
    /* Determine the type of level 1 descriptor */
    if (policyVal & 0x1) {
        if (policyVal & (0x1 << 1)) {
            /* Case its a "Fine Page" */
            elem.Type = "Fine Page";
            
            /* Set the level 2 table pointer */
            elem.Level2TablePtr =
                utils.toHex(convertToUInt32(
                            Number(policyVal & 0xFFFFFC00)));
        }
        else {
            /* Case its a "Coarse Page" */
            elem.Type = "Coarse Page";
            
            /* Set the level 2 table pointer */
            elem.Level2TablePtr =
                utils.toHex(convertToUInt32(
                            Number(policyVal & 0xFFFF0000)));
        }
        
        /*
         *  The elem.AddrPhysical, elem.Bufferable, and elem.Cacheable
         *  are left blank because they are determined by the level 2
         *  descriptor.  Also elem.L1DWritePolicy and elemAccess are
         *  "unknown" because they are determine by level 2 descriptor.
         */
        elem.IMP = (policyVal & (0x1 << 4)) >>> 4;
        elem.Domain = (policyVal & (0xF << 5)) >>> 5;
        elem.L1DWritePolicy = "Unknown";
        elem.Access = "Unknown";
    }
    else {
        /* Case its a "Secion" */
        elem.Type = "Section";
        
        /* Set the bufferability and cacheability fields */
        elem.Bufferable = policyVal & (0x1 << 2);
        elem.Cacheable = policyVal & (0x1 << 3);
        
        /* Determine the cacheability policy */
        if (elem.Cacheable) {
            if (elem.Bufferable) {
                elem.L1DWritePolicy = "Write Back";
            }
            else {
                elem.L1DWritePolicy = "Write Through";
            }
        }
        else {
            elem.L1DWritePolicy = "Non cacheable";
        }
        
        /* Set the IMP and Domain fields */
        elem.IMP = (policyVal & (0x1 << 4)) >>> 4;
        elem.Domain = (policyVal & (0xF << 5)) >>> 5;
        
        /* Determine the Access policy */
        if (policyVal & (0x3 << 10)) {
            elem.Access = "read/write";
        }
        else {
            /* This state is dependent on "S and R bits" in c1 register */
            elem.Access = "Unknown";
        }
        
        /* Set the physical address */
        elem.AddrPhysical =
            utils.toHex(convertToUInt32(
                        Number(policyVal & 0xFFF00000)));
    }
}

/*
 *  ======== viewPages ========
 */
function viewPages(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Mmu = xdc.useModule('ti.sysbios.family.arm.arm9.Mmu');
    var mmuTableSize = 0x1000;             /* 4K words = 16KB */

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.arm.arm9.Mmu');
    }
    catch (e) {
        // TODO - report problem.
        print("Caught exception while retrieving raw view: " + e);
    }
    
    /* Get the module state */
    var mod = rawView.modState;

    /* Retrieve the MMU descriptor table */
    try {
        var mmuDescTable = Program.fetchArray(mod.tableBuf$fetchDesc,
                                              mod.tableBuf,
                                              mmuTableSize);
    }
    catch (e) {
        // TODO - Report problem
        print("Caught exception while trying to retrieve dispatch table: " +
              e);
    }

    /* Walk through the level 1 descriptor table */
    for (var i = 0; i < mmuTableSize; i++) {
        /* Only display mapped entries */
        if ((mmuDescTable[i] & 0x3) != 0) {
            var elem = Program.newViewStruct('ti.sysbios.family.arm.arm9.Mmu',
                'PageView');

            /* Virtual address is the index shifted left by 20 */
            elem.AddrVirtual = utils.toHex(convertToUInt32(Number(i << 20)));
            
            /* Set the other descriptor properties */
            viewGetPolicy(elem, mmuDescTable[i]);

            /* Add the element to the list. */
            view.elements.$add(elem);
        }
    }
}

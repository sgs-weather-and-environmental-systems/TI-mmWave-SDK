/* 
 * Copyright (c) 2015, Texas Instruments Incorporated
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

var BigEndian;
var Mmu = null;
var BIOS = null;
var Cache = null;
var device = null;
var Memory = null;
var LEVEL2_BLOCK_DESC_SHIFT = 21;
var LEVEL1_TABLE_DESC_SHIFT = 30;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "gnu.targets.arm.A15F":
            return (["Mmu_asm_gnu.asm"]);
            break;

        default:
            return (null);
	    break;
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
        "Vayu": {
            intcBaseAddr   : 0x48210000,
            timer0BaseAddr : 0x48032000,
            timer2BaseAddr : 0x48086000,
            intXbarBaseAddr: 0x4A002000,
        },
        "OMAP5430": {
            intcBaseAddr   : 0x48210000,
            timer0BaseAddr : 0x48032000,
            timer2BaseAddr : 0x48086000,
            prcmBaseAddr   : 0x4A009000,
            wugenBaseAddr  : 0x48281000,
        },
        "C66AK2E05": {
            intcBaseAddr   : 0x02560000,
            timerBaseAddr  : 0x02200000,
            cpIntcBaseAddr : 0x02608000,
            bootRamBaseAddr: 0x0C1AD000
        },
        "TCI6630K2L": {
            intcBaseAddr   : 0x02560000,
            timerBaseAddr  : 0x02200000,
            cpIntcBaseAddr : 0x02608000,
            bootRamBaseAddr: 0x0C1D2500
        },
        "TCI6636K2H": {
            intcBaseAddr   : 0x02560000,
            timerBaseAddr  : 0x02200000,
            cpIntcBaseAddr : 0x02608000,
            bootRamBaseAddr: 0x0C5AD000
        },
        "TCI66AK2G02": {
            intcBaseAddr   : 0x02560000,
            timerBaseAddr  : 0x02200000,
            cpIntcBaseAddr : 0x02600000,
        },
    };

    deviceTable["DRA7XX"] = deviceTable["Vayu"];
    deviceTable["TCI6638K2K"] = deviceTable["TCI6636K2H"];
}
    
/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck() 
{
    /* look for exact match first */
    for (device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            return (device);
        }
    }

    /* now look for a wildcard match */
    for (device in deviceTable) {
        if (Program.cpu.deviceName.match(device)) {
            return (device);
        }
    }

    /* 
     * no match, print all catalog devices supported 
     * and then raise an error 
     */
    var catalog = xdc.loadPackage(Program.cpu.catalogName);

    /* build associative array of supported devices */
    var supportedDevices = new Object();

    for (var i = 0; i < catalog.$modules.length; i++) {
        catalogName = catalog.$modules[i].$name.substring(
                Program.cpu.catalogName.length + 1);

        for (device in deviceTable) {
            if (catalogName.match(device)) {
                supportedDevices[catalogName] = catalogName;
            }
        }
    }

    /* copy it into a sortable array */
    var sd = new Array();

    for (var i in supportedDevices) {
        sd[sd.length++] = i;
    }

    /* sort it for a nicer report */
    sd.sort();

    print("The " + Program.cpu.deviceName +
          " device is not currently supported.");
    print("The following devices are supported for the " +
          Program.build.target.name + " target:");

    for (var i=0; i<sd.length; i++) {
        print("\t" + sd[i]);
    }

    throw new Error ("Unsupported device!");
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
    
    /* Initialize MAIRnAttr array */
    for (var i=0; i<8; i++) {
        Mmu.mairRegAttr[i] = 0;
    }

    /* set the firstLevelTableBuf size to 4 quad words or 32 Bytes */
    Mmu.firstLevelTableBuf.length = Mmu.NUM_LEVEL1_ENTRIES*2;

    for (var i=0; i<Mmu.NUM_LEVEL1_ENTRIES; i++) {
        /* set the secondLevelTableBuf size to 512 quad words or 4KB */
        Mmu.secondLevelTableBuf[i].length = 512*2;
    }

    /* Set MAIRn Attr0 */
    Mmu.mairRegAttr[0] = 0x44;          // Mark memory region as Non-cacheable
                                        // Normal Memory

    /* Set MAIRn Attr1 */
    Mmu.mairRegAttr[1] = 0x0;           // Mark memory region as
                                        // Strongly-ordered Memory

    /* Set MAIRn Attr1 */
    Mmu.mairRegAttr[2] = 0xFF;          // Mark memory regions as Read-Write
                                        // cacheable and Read-Write allocate

}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.module('ti.sysbios.BIOS');
    Memory = xdc.useModule('xdc.runtime.Memory');

    if (BIOS.smpEnabled) {
        Cache  = xdc.useModule('ti.sysbios.family.arm.a15.smp.Cache');
    }
    else {
        Cache  = xdc.useModule('ti.sysbios.family.arm.a15.Cache');
    }

    device = deviceSupportCheck();
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* The MMU first level table descriptor needs to be 4 quad words or 32B */
    mod.firstLevelTableBuf.length = Mmu.firstLevelTableBuf.length / 2;

    for (var i=0; i<Mmu.NUM_LEVEL1_ENTRIES; i++) {
        /* The MMU second level table descriptor needs to be 4 KBytes */
        mod.secondLevelTableBuf[i].length =
            Mmu.secondLevelTableBuf[i].length / 2;
    }
    
    /* Generate first Level descriptor table */

    /* The section name of the MMU table (documented in Mmu.xdc) */
    var firstLevelTableSectionName =
                    "ti.sysbios.family.arm.a15.mmuFirstLevelTableSection";

    /*
     *  Place the first level table buffer into the specified section
     *  name. The table buffer must be aligned on a 32 Byte boundary.
     */
    Memory.staticPlace(
                        mod.firstLevelTableBuf,
                        32,
                        firstLevelTableSectionName
                      );

    /* Place tableSection into default dataMemory section if not specified. */
    if (Program.sectMap[firstLevelTableSectionName] === undefined) {
        Program.sectMap[firstLevelTableSectionName] =
            new Program.SectionSpec();
        Program.sectMap[firstLevelTableSectionName].type = "NOLOAD";
        Program.sectMap[firstLevelTableSectionName].loadSegment =
            Program.platform.dataMemory;
    }

    /* Make a 1-to-1 mapping of virtual to physical address for memory map */
    var map = Program.cpu.memoryMap;
    for (var i=0; i < map.length; i++) {
        /* Get base address and length and unsigned right shift to get index */
        var start = map[i].base >>> LEVEL1_TABLE_DESC_SHIFT;
        var end = (map[i].base + map[i].len - 1) >>> LEVEL1_TABLE_DESC_SHIFT;
        var index = start;

        do {
            /* only set if table descriptor has not been set */
            if ((Mmu.firstLevelTableBuf[2*index] == undefined) &&
                (Mmu.firstLevelTableBuf[2*index + 1] == undefined)) {
                    setFirstLevelDescMeta(
                            convertToUInt32(index << LEVEL1_TABLE_DESC_SHIFT),
                            convertToUInt32(index << LEVEL1_TABLE_DESC_SHIFT),
                            Mmu.defaultAttrs);
            }
            index++;
        } while (index <= end);
    }

    /* 1-to-1 mapping of virtual to physical address from the table above */
    for each (var addr in deviceTable[device]) {
        var index = addr >>> LEVEL1_TABLE_DESC_SHIFT;
        /* only set if table descriptor has not been set */
        if (Mmu.firstLevelTableBuf[2*index] == undefined) {
                setFirstLevelDescMeta(
                            convertToUInt32(index << LEVEL1_TABLE_DESC_SHIFT),
                            convertToUInt32(index << LEVEL1_TABLE_DESC_SHIFT),
                            Mmu.defaultAttrs);
        }
    }

    /* Generate second Level descriptor tables */

    for (var i=0; i<Mmu.NUM_LEVEL1_ENTRIES; i++) {
        /* The section name of the MMU table (documented in Mmu.xdc) */
        var secondLevelTableSectionName =
                    "ti.sysbios.family.arm.a15.mmuSecondLevelTableSection" + i;

        /*
         *  Place the first level table buffer into the specified section
         *  name. The table buffer must be aligned on a 32 Byte boundary.
         */
        Memory.staticPlace(
                            mod.secondLevelTableBuf[i],
                            0x1000,
                            secondLevelTableSectionName
                          );

        /* Place tableSection into default dataMemory section if not specified*/
        if (Program.sectMap[secondLevelTableSectionName] === undefined) {
            Program.sectMap[secondLevelTableSectionName] =
                                                    new Program.SectionSpec();
            Program.sectMap[secondLevelTableSectionName].type = "NOLOAD";
            Program.sectMap[secondLevelTableSectionName].loadSegment =
                                                    Program.platform.dataMemory;
        }
    }

    /* Make a 1-to-1 mapping of virtual to physical address for memory map */
    var map = Program.cpu.memoryMap;
    for (var i=0; i < map.length; i++) {
        /* Get base address and length and unsigned right shift to get index */
        var start = map[i].base >>> LEVEL2_BLOCK_DESC_SHIFT;
        var end = (map[i].base + map[i].len - 1) >>> LEVEL2_BLOCK_DESC_SHIFT;
        var index = start;
        var attrs = new Mmu.DescriptorAttrs();

        initDescAttrsMeta(attrs);
        attrs.type = Mmu.DescriptorType_BLOCK;    // BLOCK descriptor
        attrs.accPerm = 0;                        // access permissions
        attrs.attrIndx = 2;                       // MAIR0 Byte 1 defines
                                                  // memory region attributes
        attrs.shareable = 3;                      // inner-sharerable

        do {
            /* only set if table descriptor has not been set */
            if ((Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF)] ==
                        undefined) &&
                (Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF)+1] ==
                        undefined)) {

                if (Mmu.cachePlatformMemory == true) {
                    setSecondLevelDescMeta(
                            convertToUInt32(index << LEVEL2_BLOCK_DESC_SHIFT),
                            convertToUInt32(index << LEVEL2_BLOCK_DESC_SHIFT),
                            attrs);
                }
                else {
                    setSecondLevelDescMeta(
                            convertToUInt32(index << LEVEL2_BLOCK_DESC_SHIFT),
                            convertToUInt32(index << LEVEL2_BLOCK_DESC_SHIFT),
                            Mmu.defaultAttrs);
                }
            }
            index++;
        } while (index <= end);
    }

    /* Force peripheral sections to be NON cacheable */    
    var peripheralAttrs = new Mmu.DescriptorAttrs();

    initDescAttrsMeta(peripheralAttrs);
    peripheralAttrs.type = Mmu.DescriptorType_BLOCK;    // BLOCK descriptor
    peripheralAttrs.noExecute = true;                   // not executable
    peripheralAttrs.accPerm = 0;                        // read/write at PL1
    peripheralAttrs.attrIndx = 1;                       // MAIR0 Byte 2

    /* 1-to-1 mapping of virtual to physical address from the table above */
    for each (var addr in deviceTable[device]) {
        setSecondLevelDescMeta(addr, addr, peripheralAttrs);
    }

    /* Initialize mairRegAttr array */
    for (var i=0; i<8; i++) {
        mod.mairRegAttr[i] = Mmu.mairRegAttr[i];
    }
}

/*
 *  ======== setMAIRMeta ========
 */
function setMAIRMeta(attrIndx, value)
{
    Mmu.mairRegAttr[attrIndx] = value;
}

/*
 *  ======== initDescAttrsMeta ========
 */
function initDescAttrsMeta(attrs)
{
    /* Set all field to their default value */
    attrs.type = Mmu.defaultAttrs.type;
    attrs.nsTable = Mmu.defaultAttrs.nsTable;
    attrs.apTable = Mmu.defaultAttrs.apTable;
    attrs.xnTable = Mmu.defaultAttrs.xnTable;
    attrs.pxnTable = Mmu.defaultAttrs.pxnTable;
    attrs.noExecute = Mmu.defaultAttrs.noExecute;
    attrs.privNoExecute = Mmu.defaultAttrs.privNoExecute;
    attrs.contiguous = Mmu.defaultAttrs.contiguous;
    attrs.notGlobal = Mmu.defaultAttrs.notGlobal;
    attrs.accessFlag = Mmu.defaultAttrs.accessFlag;
    attrs.shareable = Mmu.defaultAttrs.shareable;
    attrs.accPerm = Mmu.defaultAttrs.accPerm;
    attrs.nonSecure = Mmu.defaultAttrs.nonSecure;
    attrs.attrIndx = Mmu.defaultAttrs.attrIndx;
    attrs.reserved = Mmu.defaultAttrs.reserved;
}

/*
 *  ======== setFirstLevelDescMeta ========
 */
function setFirstLevelDescMeta(virtualAddr, phyAddr, attrs)
{
    var index = virtualAddr >>> LEVEL1_TABLE_DESC_SHIFT;
    var desc = 0;
    
    /* Set type field to default if undefined */
    if (attrs.type === undefined) {
        attrs.type = Mmu.defaultAttrs.type;
    }

    /* Set nsTable field to default if undefined */
    if (attrs.nsTable === undefined) {
        attrs.nsTable = Mmu.defaultAttrs.nsTable;
    }

    /* Set apTable field to default if undefined */
    if (attrs.apTable === undefined) {
        attrs.apTable = Mmu.defaultAttrs.apTable;
    }

    /* Set xnTable field to default if undefined */
    if (attrs.xnTable === undefined) {
        attrs.xnTable = Mmu.defaultAttrs.xnTable;
    }

    /* Set pxnTable field to default if undefined */
    if (attrs.pxnTable === undefined) {
        attrs.pxnTable = Mmu.defaultAttrs.pxnTable;
    }

    /* Set noexecute field to default if undefined */
    if (attrs.noExecute === undefined) {
        attrs.noExecute = Mmu.defaultAttrs.noExecute;
    }

    /* Set privNoexecute field to default if undefined */
    if (attrs.privNoExecute === undefined) {
        attrs.privNoExecute = Mmu.defaultAttrs.privNoExecute;
    }

    /* Set contiguous field to default if undefined */
    if (attrs.contiguous === undefined) {
        attrs.contiguous = Mmu.defaultAttrs.contiguous;
    }

    /* Set notGlobal field to default if undefined */
    if (attrs.notGlobal === undefined) {
        attrs.notGlobal = Mmu.defaultAttrs.notGlobal;
    }

    /* Set accessFlag field to default if undefined */
    if (attrs.accessFlag === undefined) {
        attrs.accessFlag = Mmu.defaultAttrs.accessFlag;
    }

    /* Set shareable field to default if undefined */
    if (attrs.shareable === undefined) {
        attrs.shareable = Mmu.defaultAttrs.shareable;
    }

    /* Set accPerm field to default if undefined */
    if (attrs.accPerm === undefined) {
        attrs.accPerm = Mmu.defaultAttrs.accPerm;
    }
    
    /* Set nonSecure field to default if undefined */
    if (attrs.nonSecure === undefined) {
        attrs.nonSecure = Mmu.defaultAttrs.nonSecure;
    }

    /* Set attrIndx field to default if undefined */
    if (attrs.attrIndx === undefined) {
        attrs.attrIndx = Mmu.defaultAttrs.attrIndx;
    }

    /* Set reserved field to default if undefined */
    if (attrs.reserved === undefined) {
        attrs.reserved = Mmu.defaultAttrs.reserved;
    }

    switch (attrs.type) {
        /* Page table descriptor */
        case Mmu.DescriptorType_TABLE:
            /*
             * For TABLE descriptors use virtual address as
             * physical address. Mmu_initFirstLevelTableBuf()
             * function will determine second level table
             * address using virtual address.
             */
            phyAddr = virtualAddr;
            desc = (attrs.type & 0x3) |
                   (phyAddr & 0xFFFFF000);
            Mmu.firstLevelTableBuf[2*index] = convertToUInt32(desc);
            desc = ((phyAddr/256) >>> 24) |
                   ((attrs.pxnTable & 0x1) << 27) |
                   ((attrs.xnTable & 0x1) << 28) |
                   ((attrs.apTable & 0x3) << 29) |
                   ((attrs.nsTable & 0x1) << 31);
            Mmu.firstLevelTableBuf[2*index+1] = convertToUInt32(desc);
            break;
        
        /* Section descriptor */
        case Mmu.DescriptorType_BLOCK:
            desc = (attrs.type & 0x3) |
                   ((attrs.attrIndx & 0x7) << 2) |
                   ((attrs.nonSecure & 0x1) << 5) |
                   ((attrs.accPerm & 0x3) << 6) |
                   ((attrs.shareable & 0x3) << 8) |
                   ((attrs.accessFlag & 0x1) << 10) |
                   ((attrs.notGlobal & 0x1) << 11) |
                   (phyAddr & 0xC0000000);
            Mmu.firstLevelTableBuf[2*index] = convertToUInt32(desc);
            desc = ((phyAddr/256) >>> 24) |
                   ((attrs.contiguous & 0x1) << 20) |
                   ((attrs.privNoExecute & 0x1) << 21) |
                   ((attrs.noExecute & 0x1) << 22) |
                   ((attrs.reserved & 0xF) << 23);
            Mmu.firstLevelTableBuf[2*index+1] = convertToUInt32(desc);
            break;
        
        default:
            Mmu.$logError("Mmu.setFirstLevelDescMeta: the type " +
                "(" + attrs.type + ")" + " is not recognized.", Mmu);
            break;
    }
}

/*
 *  ======== setSecondLevelDescMeta ========
 */
function setSecondLevelDescMeta(virtualAddr, phyAddr, attrs)
{
    var index = virtualAddr >>> LEVEL2_BLOCK_DESC_SHIFT;
    var desc = 0;

    /* Set type field to default if undefined */
    if (attrs.type === undefined) {
        attrs.type = Mmu.defaultAttrs.type;
    }

    /* Set nsTable field to default if undefined */
    if (attrs.nsTable === undefined) {
        attrs.nsTable = Mmu.defaultAttrs.nsTable;
    }

    /* Set apTable field to default if undefined */
    if (attrs.apTable === undefined) {
        attrs.apTable = Mmu.defaultAttrs.apTable;
    }

    /* Set xnTable field to default if undefined */
    if (attrs.xnTable === undefined) {
        attrs.xnTable = Mmu.defaultAttrs.xnTable;
    }

    /* Set pxnTable field to default if undefined */
    if (attrs.pxnTable === undefined) {
        attrs.pxnTable = Mmu.defaultAttrs.pxnTable;
    }

    /* Set noExecute field to default if undefined */
    if (attrs.noExecute === undefined) {
        attrs.noExecute = Mmu.defaultAttrs.noExecute;
    }

    /* Set privNoExecute field to default if undefined */
    if (attrs.privNoExecute === undefined) {
        attrs.privNoExecute = Mmu.defaultAttrs.privNoExecute;
    }

    /* Set contiguous field to default if undefined */
    if (attrs.contiguous === undefined) {
        attrs.contiguous = Mmu.defaultAttrs.contiguous;
    }

    /* Set notGlobal field to default if undefined */
    if (attrs.notGlobal === undefined) {
        attrs.notGlobal = Mmu.defaultAttrs.notGlobal;
    }

    /* Set accessFlag field to default if undefined */
    if (attrs.accessFlag === undefined) {
        attrs.accessFlag = Mmu.defaultAttrs.accessFlag;
    }

    /* Set shareable field to default if undefined */
    if (attrs.shareable === undefined) {
        attrs.shareable = Mmu.defaultAttrs.shareable;
    }

    /* Set accPerm field to default if undefined */
    if (attrs.accPerm === undefined) {
        attrs.accPerm = Mmu.defaultAttrs.accPerm;
    }

    /* Set nonSecure field to default if undefined */
    if (attrs.nonSecure === undefined) {
        attrs.nonSecure = Mmu.defaultAttrs.nonSecure;
    }

    /* Set attrIndx field to default if undefined */
    if (attrs.attrIndx === undefined) {
        attrs.attrIndx = Mmu.defaultAttrs.attrIndx;
    }

    /* Set reserved field to default if undefined */
    if (attrs.reserved === undefined) {
        attrs.reserved = Mmu.defaultAttrs.reserved;
    }

    switch (attrs.type) {
        /* Page table descriptor */
        case Mmu.DescriptorType_TABLE:
            desc = (attrs.type & 0x3) |
                   (phyAddr & 0xFFFFF000);
            Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF)] =
                                                        convertToUInt32(desc);
            desc = ((phyAddr/256) >>> 24) |
                   ((attrs.pxnTable & 0x1) << 27) |
                   ((attrs.xnTable & 0x1) << 28) |
                   ((attrs.apTable & 0x3) << 29) |
                   ((attrs.nsTable & 0x1) << 31);
            Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF) + 1] =
                                                        convertToUInt32(desc);
            break;

        /* Section descriptor */
        case Mmu.DescriptorType_BLOCK:
            desc = (attrs.type & 0x3) |
                   ((attrs.attrIndx & 0x7) << 2) |
                   ((attrs.nonSecure & 0x1) << 5) |
                   ((attrs.accPerm & 0x3) << 6) |
                   ((attrs.shareable & 0x3) << 8) |
                   ((attrs.accessFlag & 0x1) << 10) |
                   ((attrs.notGlobal & 0x1) << 11) |
                   (phyAddr & 0xFFE00000);
            Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF)] =
                                                        convertToUInt32(desc);
            desc = ((phyAddr/256) >>> 24) |
                   ((attrs.contiguous & 0x1) << 20) |
                   ((attrs.privNoExecute & 0x1) << 21) |
                   ((attrs.noExecute & 0x1) << 22) |
                   ((attrs.reserved & 0xF) << 23);
            Mmu.secondLevelTableBuf[index >>> 9][2*(index & 0x1FF) + 1] =
                                                        convertToUInt32(desc);
            break;

        default:
            Mmu.$logError("Mmu.setSecondLevelDescMeta: the type " +
                "(" + attrs.type + ")" + " is not recognized.", Mmu);
            break;
    }
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
function viewGetPolicy(level, elem, policyValLo, policyValHi)
{
    /* Determine the type of level 1 descriptor */
    if (convertToUInt32(policyValLo & 0x3) == 0x3) {
        /* Case its a "Page Table Address" */
        elem.Type = "Page Table Address";
        
        /* Set the level 2 table pointer */
        var tablePtr = ((policyValHi & 0xFF) * (1 << 24) * 256) +
            convertToUInt32(policyValLo & 0xFFFFF000);
        elem.NextLevelTablePtr = "0x" + tablePtr.toString(16);

        elem.NSTable  = (policyValHi >>> 31) & 0x1;
        elem.XNTable  = (policyValHi >>> 28) & 0x1;
        elem.PXNTable = (policyValHi >>> 27) & 0x1;

        switch ((policyValHi >>> 29) & 0x3)
        {
            case 0:
                    elem.APTable = "No effect";
                    break;
            case 1:
                    elem.APTable = "No RD/WR at PL0";
                    break;
            case 2:
                    elem.APTable = "No WR at any PL";
                    break;
            case 3:
                    elem.APTable = "No WR at any PL. No RD at PL0"
        }
        /*
         *  All remaining elem attributes are left blank because they are
         *  determined by the block descriptor.
         */
    }
    else {
        var Program = xdc.useModule('xdc.rov.Program');

        /* Scan the raw view in order to obtain the module state. */
        var rawView;
        try {
            rawView = Program.scanRawView('ti.sysbios.family.arm.a15.Mmu');
        }
        catch (e) {
            print("Caught exception while retrieving raw view: " + e);
        }

        /* Get the module state */
        var mod = rawView.modState;

        /* Case its a "Block" descriptor */
        elem.Type = "Block/Section";

        /* Set the memory-region attributes type extension (TEX) field */
        //elem.Tex = Number((policyVal >> 12) & 0x7).toString(2) + 'b';

        elem.NoExecute      = (policyValHi >>> 22) & 0x1;
        elem.PrivNoExecute  = (policyValHi >>> 21) & 0x1;
        elem.Contiguous     = (policyValHi >>> 20) & 0x1;
        elem.NotGlobal      = (policyValLo >>> 11) & 0x1;
        elem.AccessFlag     = (policyValLo >>> 10) & 0x1;
        elem.NonSecure      = (policyValLo >>> 5) & 0x1;

        /* Determine Shareability  */
        switch ((policyValLo >>> 8) & 0x3)
        {
            case 0:
                    elem.Shareable = "Non-shareable";
                    break;
            case 1:
                    elem.Shareable = "UNPREDICTABLE";
                    break;
            case 2:
                    elem.Shareable = "Outer-shareable";
                    break;
            case 3:
                    elem.Shareable = "Inner-shareable";
        }

        /* Determine the Access policy */
        switch ((policyValLo >>> 6) & 0x3)
        {
            case 0:
                    elem.AccessPerm = "RW only at PL1";
                    break;
            case 1:
                    elem.AccessPerm = "RW at any PL";
                    break;
            case 2:
                    elem.AccessPerm = "R-only at PL1";
                    break;
            case 3:
                    elem.AccessPerm = "R-only at any PL";
        }

        /* Determine memory region attributes */
        elem.MemAttr = "0x" +
            mod.mairRegAttr[(policyValLo >>> 2) & 0x7].toString(16);
        
        /* Set the physical address */
        if (level == 1) {
            var phyAddr = ((policyValHi & 0xFF) * (1 << 24) * 256) +
                convertToUInt32(policyValLo & 0xC0000000);
        }
        else if (level == 2) {
            var phyAddr = ((policyValHi & 0xFF) * (1 << 24) * 256) +
                convertToUInt32(policyValLo & 0xFFE00000);
        }

        elem.AttrIndx = "0x" + ((policyValLo >>> 2) & 0x7).toString(16);

        elem.AddrPhysical = "0x" + phyAddr.toString(16);
    }
}

/*
 *  ======== viewLevel1Page ========
 */
function viewLevel1Page(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Mmu = xdc.useModule('ti.sysbios.family.arm.a15.Mmu');
    var mmuTableSize = Mmu.NUM_LEVEL1_ENTRIES * 2; /* 32 Bytes */
    /* Used by ROV view to determine endianess */
    BigEndian = (Program.build.target.model.endian == "big");

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.arm.a15.Mmu');
    }
    catch (e) {
        this.$logWarning("Caught exception while retrieving raw view: " + e,
                this);
    }
    
    /* Get the module state */
    var mod = rawView.modState;

    /* Retrieve the MMU descriptor table */
    try {
        var mmuDescTable = Program.fetchArray(
            {
                type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                isScalar: true
            },
            mod.firstLevelTableBuf,
            mmuTableSize,
            false);
    }
    catch (e) {
        this.$logWarning(
                "Caught exception while trying to retrieve descriptor table: " +
                e, this);
    }

    /* Walk through the level 1 descriptor table */
    for (var i = 0; i < Mmu.NUM_LEVEL1_ENTRIES; i++) {
        var elem = Program.newViewStruct('ti.sysbios.family.arm.a15.Mmu',
                'Level1View');

        /* Virtual address is the index shifted left by 30 */
        elem.AddrVirtual = "0x" + convertToUInt32(Number(i << 30)).toString(16);
            
        /* Only display mapped entries */
        if (((mmuDescTable[2*i] & 0x3) != 0) &&
            ((mmuDescTable[2*i] & 0x3) != 2)) {
            /* Set the other descriptor properties */
            viewGetPolicy(1, elem, 
                    mmuDescTable[2 * i + (0 ^ BigEndian)],
                    mmuDescTable[2 * i + (1 ^ BigEndian)]);
        }
        else {
            elem.Type = "Not Mapped";
        }

        /* Add the element to the list. */
        view.elements.$add(elem);
    }
}

/*
 *  ======== viewLevel2Page ========
 */
function viewLevel2Page()
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Mmu = xdc.useModule('ti.sysbios.family.arm.a15.Mmu');
    var mmuTableSizeLevel1 = Mmu.NUM_LEVEL1_ENTRIES * 2; /* 32 Bytes */
    var mmuTableSizeLevel2 = Mmu.NUM_LEVEL2_ENTRIES * 2; /* 4 KBytes */
    /* Used by ROV view to determine endianess */
    BigEndian = (Program.build.target.model.endian == "big");

    var viewNode = new Program.TreeNode();

    viewNode.label = "Level2 Table View";

    viewNode.children = new Array();

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.arm.a15.Mmu');
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
    }

    /* Get the module state */
    var mod = rawView.modState;

    /* Retrieve the MMU descriptor table */
    try {
        var mmuDescTableLevel1 = Program.fetchArray(
            {
                type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                isScalar: true
            },
            mod.firstLevelTableBuf,
            mmuTableSizeLevel1,
            false);
    }
    catch (e) {
        this.$logWarning(
            "Caught exception while trying to retrieve descriptor table: " +
            e, this);
    }

    for (var tableIdx = 0; tableIdx < Mmu.NUM_LEVEL1_ENTRIES; tableIdx++) {
        /* Only display mapped entries */
        if ((mmuDescTableLevel1[2*tableIdx] & 0x3) != 3) {
            continue;
        }

        /* Retrieve the MMU descriptor table */
        try {
            var mmuDescTableLevel2 = Program.fetchArray(
                {
                    type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                    isScalar: true
                },
                mod.secondLevelTableBuf[tableIdx],
                mmuTableSizeLevel2,
                false);
        }
        catch (e) {
            print("Caught exception while trying to retrieve dispatch table: " +
                    e);
        }

        var tableNum = viewNode.children.length++;
        viewNode.children[tableNum].label = "Level2 Table " + tableIdx;
        viewNode.children[tableNum].properties = new Array();
        var tables = new Array();

        /* Walk through the level 2 descriptor table */
        for (var i = 0; i < Mmu.NUM_LEVEL2_ENTRIES; i++) {
            var elem = Program.newViewStruct('ti.sysbios.family.arm.a15.Mmu',
                    'Level2View');

            /* Virtual address is the index shifted left by 21 */
            elem.AddrVirtual = "0x" +
            convertToUInt32(Number((i + (tableIdx << 9)) << 21)).toString(16);

            /* Only display mapped entries */
            if ((mmuDescTableLevel2[2*i] & 0x3) != 0) {
                /* Set the other descriptor properties */
                viewGetPolicy(2, elem, 
                        mmuDescTableLevel2[2 * i + (0 ^ BigEndian)],
                        mmuDescTableLevel2[2 * i + (1 ^ BigEndian)]);
            }
            else {
                elem.Type = "Not Mapped";
            }

            tables[tables.length++] = elem;
        }

        viewNode.children[tableNum].properties = tables;
    }

    return (viewNode.children);
}

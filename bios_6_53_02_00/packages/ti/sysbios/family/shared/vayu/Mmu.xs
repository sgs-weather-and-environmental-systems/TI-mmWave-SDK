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

var device = null;
var catalogName;
var Mmu = null;
var Memory = null;
var Cache = null;
var SECTION_DESC_SHIFT = 20;

/*
 *  This table is needed to map the physical base addresses
 *  to a virtual address so that no MMU fault is generated when
 *  the addresses are accessed. Only the 12 MSBs are important
 *  here for doing a 1-to-1 mapping between virtual and physical.
 */
if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "ti.catalog.c6000": {
            "Vayu": {
                timer1BaseAddr  : 0x4AE18000,
                timer2BaseAddr  : 0x48032000,
                timer13BaseAddr : 0x48828000,
                eventCombiner   : 0x01800000,
                cacheConfigRegs : 0x01840000,
                dspSystemRegs   : 0x01D00000
            }
        }
    };

    deviceTable["ti.catalog.c6000"]["DRA7XX"] =
        deviceTable["ti.catalog.c6000"]["Vayu"];
    deviceTable["ti.catalog.c6000"]["TDA3XX"] =
        deviceTable["ti.catalog.c6000"]["Vayu"];
}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    catalogName = Program.cpu.catalogName;

    /* look for exact match first */
    for (device in deviceTable[catalogName]) {
        if (device == Program.cpu.deviceName) {
            return deviceTable[catalogName][Program.cpu.deviceName];
        }
    }

    /* now look for a wildcard match */
    for (device in deviceTable[catalogName]) {
        if (Program.cpu.deviceName.match(device)) {
            return deviceTable[catalogName][Program.cpu.deviceName];
        }
    }

    /* falls thru on failure */

    print("Mmu is not supported for the specified device (" +
        Program.cpu.deviceName + ").");

    for (device in deviceTable[catalogName]) {
        print("\t" + device);
    }

    throw new Error ("Mmu unsupported on device!");
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

    Mmu = this;

    /* set fxntab default */
    Mmu.common$.fxntab = false;

    /* set the tableBuf size to 16KB or 4K words */
    Mmu.tableBuf.length = 0x1000;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Memory = xdc.useModule('xdc.runtime.Memory');

    device = deviceSupportCheck();

    if (Program.build.target.name == "C66") {
        Cache  = xdc.useModule('ti.sysbios.family.c66.Cache');
    }
    else {
       Mmu.$logError("Target " + Program.build.target.name + " is not " +
              "supported. ", Mmu);
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.regs = null;

    /* The MMU first level table descriptor needs to be 16KB or 4K words */
    mod.tableBuf.length = Mmu.tableBuf.length;

    /* The section name of the MMU table (documented in Mmu.xdc) */
    var tableSectionName = "ti.sysbios.family.shared.vayu.mmuTableSection";

    /*
     *  Place the table buffer into the specified section name.
     *  The table buffer must be aligned on a 16KB boundary.
     */
    Memory.staticPlace(mod.tableBuf, 0x4000, tableSectionName);

    /* Place tableSection into default dataMemory section if not specified. */
    if (Program.sectMap[tableSectionName] === undefined) {
        Program.sectMap[tableSectionName] = new Program.SectionSpec();
        if (Program.build.target.$name.match(/gnu/)) {
            Program.sectMap[tableSectionName].type = "NOLOAD";
        }
        else {
            Program.sectMap[tableSectionName].type = "NOINIT";
        }
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

        do {
            /* only set if table descriptor has not been set */
            if (Mmu.tableBuf[index] == undefined) {
                setFirstLevelDescMeta(index << SECTION_DESC_SHIFT,
                                      index << SECTION_DESC_SHIFT,
                                      Mmu.defaultAttrs);
            }
            index++;
        } while (index <= end);
    }

    /* Map peripheral memory */

    /* 1-to-1 mapping of virtual to physical address from the table above */
    for each (var addr in device) {
        setFirstLevelDescMeta(addr, addr, Mmu.defaultAttrs);
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

    /* Set supersection field to default if undefined */
    if (attrs.supersection === undefined) {
        attrs.supersection = Mmu.defaultAttrs.supersection;
    }

    switch (attrs.type) {
        /* Page table descriptor */
        case Mmu.FirstLevelDesc_PAGE_TABLE:
            desc = (attrs.type & 0x3) |
                   (phyAddr & 0xFFFFFC00);
            break;

        /* Section descriptor */
        case Mmu.FirstLevelDesc_SECTION:
            var sectionAddrMask;
            if (attrs.supersection) {
                sectionAddrMask = 0xFF000000;
            }
            else {
                sectionAddrMask = 0xFFF00000;
            }
            desc = (attrs.type & 0x3) |
                   ((attrs.supersection & 0x1) << 18) |
                   (phyAddr & sectionAddrMask);
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
    var Mmu = xdc.useModule('ti.sysbios.family.shared.vayu.Mmu');

    /* Determine the type of level 1 descriptor */
    if (convertToUInt32(Number(policyVal & 0x3)) ==
            Mmu.FirstLevelDesc_PAGE_TABLE) {
        /* Case its a "Page Table Address" */
        elem.Type = "Page Table Address";

        /* Set the level 2 table pointer */
        elem.Level2TablePtr = utils.toHex(convertToUInt32(
                              Number(policyVal & 0xFFFFFC00)));
    }
    else {
        /* Case its a "Section" */
        elem.Type = "Section";

        /* Set the supersection field */
        elem.SuperSection = policyVal & (0x1 << 18);

        /* Set the physical address */
        if (elem.SuperSection) {
            elem.AddrPhysical = utils.toHex(convertToUInt32(
                                Number(policyVal & 0xFF000000)));
        }
        else {
            elem.AddrPhysical = utils.toHex(convertToUInt32(
                                Number(policyVal & 0xFFF00000)));
        }
    }
}

/*
 *  ======== viewPagesCommon ========
 */
function viewPagesCommon(view, viewName, viewId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Mmu = xdc.useModule('ti.sysbios.family.shared.vayu.Mmu');
    var mmuTableSize = 0x1000;             /* 4K words = 16KB */

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.shared.vayu.Mmu');
    }
    catch (e) {
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
        print("Caught exception while trying to retrieve dispatch table: " + e);
    }

    var startAddr, endAddr;
    if (viewId == 1) {
        startAddr = 0;
        endAddr = 0x800;
    }
    else if (viewId == 2) {
        startAddr = 0x800;
        endAddr = 0xA00;
    }
    else if (viewId == 3) {
        startAddr = 0xA00;
        endAddr = 0xC00;
    }
    else if (viewId == 4) {
        startAddr = 0xC00;
        endAddr = 0xE00;
    }
    else {
        startAddr = 0xE00;
        endAddr = 0x1000;
    }

    /* Walk through the level 1 descriptor table */
    for (var i = startAddr; i < endAddr; i++) {
        /* Only display mapped entries */
        if ((mmuDescTable[i] & 0x3) != 0) {
            var elem =
                Program.newViewStruct('ti.sysbios.family.shared.vayu.Mmu',
                viewName);

            /* Virtual address is the index shifted left by 20 */
            elem.AddrVirtual =
                utils.toHex(convertToUInt32(Number(i << 20)));

            /* Set the other descriptor properties */
            viewGetPolicy(elem, mmuDescTable[i]);

            /* Add the element to the list. */
            view.elements.$add(elem);
        }
    }
}

/*
 *  ======== viewPages1 ========
 */
function viewPages1(view)
{
    viewPagesCommon(view, '0x0-0x7FFFFFFF', 1);
}

/*
 *  ======== viewPages2 ========
 */
function viewPages2(view)
{
    viewPagesCommon(view, '0x80000000-0x9FFFFFFF', 2);
}

/*
 *  ======== viewPages3 ========
 */
function viewPages3(view)
{
    viewPagesCommon(view, '0xA0000000-0xBFFFFFFF', 3);
}

/*
 *  ======== viewPages4 ========
 */
function viewPages4(view)
{
    viewPagesCommon(view, '0xC0000000-0xDFFFFFFF', 4);
}

/*
 *  ======== viewPages5 ========
 */
function viewPages5(view)
{
    viewPagesCommon(view, '0xE0000000-0xFFFFFFFF', 5);
}

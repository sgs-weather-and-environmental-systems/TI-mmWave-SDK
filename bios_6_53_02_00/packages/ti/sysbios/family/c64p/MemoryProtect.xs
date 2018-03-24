/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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
 *  ======== MemoryProtect.xs ========
 */

var MemoryProtect;
var Exception;
var Hwi;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.elf.C674":
        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
            return (["MemoryProtect_asm.s64P"]);
            break;

        default:
            return (null);
	    break;
    }
}

/*
 * BADDR - "Megabyte" #, e.g., 0x0000000E -> 0x00E00000
 *
 * Each MemoryProtect controls a megabyte range, starting on a megabyte boundary.
 * All current C64+ implementations use these same base addresses.
 */
var PMC_BADDR    = 0x0000000E;
var DMC_BADDR    = 0x0000000F;
var UMC_P0_BADDR = 0x00000008;
var UMC_P1_BADDR = 0x00000001;

/*
 *  The constants (*_RGN_*) are fixed based on the GEM architecture spec.
 *  They are based on the minimum theoretical page size (lower constant)
 *  and the number of pages (higher constant minus lower constant).
 *  However, in reality, the actual minimum page size
 *  is floored at some minimum (i.e., the "size" parameter can't, per the
 *  HW design spec, be lower than some minimum (2 for DMC/PMC, 6 for UMC).
 */
var UMC_RGN_MSB = 9;
var UMC_RGN_LSB = 5;
var DMC_RGN_MSB = 11;
var DMC_RGN_LSB = 8;
var PMC_RGN_MSB = 11;
var PMC_RGN_LSB = 8;

/* Calculated values */
var PMC_R0_START;
var PMC_R1_START;
var PMC_R0_END;
var PMC_R1_END;
var PMC_R0_PS;
var PMC_R1_PS;

var DMC_R0_START;
var DMC_R1_START;
var DMC_R0_END;
var DMC_R1_END;
var DMC_R0_PS;
var DMC_R1_PS;

var UMC_R0_START;
var UMC_R1_START;
var UMC_R0_END;
var UMC_R1_END;
var UMC_R0_PS;
var UMC_R1_PS;

/*  This information should be placed and obtained from catalog files */
if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "TMS320C6670": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x0,
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0xA,    // 1024KB
            UMC_P1_SIZE:    0x0,
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "TMS320C66AK2E02": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x0,
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x9,    // 512KB
            UMC_P1_SIZE:    0x0,
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "TMS320DA830": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x0,
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x8,    // 256KB
            UMC_P1_SIZE:    0xA,    // 1024KB ROM
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "TMS320C3430": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x4,    // 64KB
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x6,    // 64KB
            UMC_P1_SIZE:    0x7,    // 128KB
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "TMS320CDRA442": {
            PMC_R0_SIZE:    0x3,    // 32KB
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x4,    // 64KB
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x7,    // 128KB
            UMC_P1_SIZE:    0x8,    // 256KB ROM
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "TMS320TI816X": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x0,
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x8,    // 256KB
            UMC_P1_SIZE:    0x0,    //
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
        "DRA7XX": {
            PMC_R0_SIZE:    0x0,
            PMC_R1_SIZE:    0x3,    // 32KB
            PMC_R0_ADJ:     0x0,
            PMC_R1_ADJ:     0x0,
            DMC_R0_SIZE:    0x0,
            DMC_R1_SIZE:    0x3,    // 32KB
            DMC_R0_ADJ:     0x0,
            DMC_R1_ADJ:     0x0,
            UMC_P0_SIZE:    0x9,    // 512KB
            UMC_P1_SIZE:    0x0,
            UMC_P0_ADJ:     0x0,
            UMC_P1_ADJ:     0x0,
        },
    };

    deviceTable["Kepler"]          = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6634"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6636"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6638"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6630K2L"] = deviceTable["TMS320C6670"];
    deviceTable["TMS320C66AK2H06"] = deviceTable["TMS320C6670"];
    deviceTable["TMS320C66AK2H12"] = deviceTable["TMS320C6670"];
    deviceTable["TCI66AK2G02"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6608"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6614"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6616"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320TCI6618"]   = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6654"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6655"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6657"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6671"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6672"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6674"]     = deviceTable["TMS320C6670"];
    deviceTable["TMS320C6678"]     = deviceTable["TMS320C6670"];

    deviceTable["TMS320C66AK2E05"] = deviceTable["TMS320C66AK2E02"];

    deviceTable["TMS320C2430"]   = deviceTable["TMS320C3430"];
    deviceTable["OMAP2431"]      = deviceTable["TMS320C3430"];
    deviceTable["OMAP2530"]      = deviceTable["TMS320C3430"];
    deviceTable["OMAP2531"]      = deviceTable["TMS320C3430"];
    deviceTable["OMAP3425"]      = deviceTable["TMS320C3430"];
    deviceTable["OMAP3525"]      = deviceTable["TMS320C3430"];
    deviceTable["OMAP3530"]      = deviceTable["TMS320C3430"];

    deviceTable["TMS320DA802"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA803"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA804"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA805"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA807"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA808"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA810"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA828"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6747"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6745"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6743"]   = deviceTable["TMS320DA830"];
    deviceTable["OMAPL137"]      = deviceTable["TMS320DA830"];

    deviceTable["OMAPL108"]      = deviceTable["TMS320DA830"];
    deviceTable["OMAPL118"]      = deviceTable["TMS320DA830"];
    deviceTable["OMAPL138"]      = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA840"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320DA850"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6742"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6746"]   = deviceTable["TMS320DA830"];
    deviceTable["TMS320C6748"]   = deviceTable["TMS320DA830"];
    deviceTable["Arctic"]        = deviceTable["TMS320DA830"];

    deviceTable["TMS320CDRA402"]   = deviceTable["TMS320CDRA442"];
    deviceTable["TMS320CDRA404"]   = deviceTable["TMS320CDRA442"];
    deviceTable["TMS320CDRA414"]   = deviceTable["TMS320CDRA442"];
    deviceTable["TMS320CDRA416"]   = deviceTable["TMS320CDRA442"];
    deviceTable["TMS320CDRA444"]   = deviceTable["TMS320CDRA442"];
    deviceTable["TMS320CDRA446"]   = deviceTable["TMS320CDRA442"];

    deviceTable["TMS320CDM740"]   = deviceTable["TMS320TI816X"];
    deviceTable["TMS320C6A8168"]  = deviceTable["TMS320TI816X"];
    deviceTable["TMS320TI811X"]   = deviceTable["TMS320TI816X"];
    deviceTable["TMS320TI814X"]   = deviceTable["TMS320TI816X"];
    deviceTable["TMS320DM8148"]   = deviceTable["TMS320TI816X"];
    deviceTable["TMS320DM8168"]   = deviceTable["TMS320TI816X"];
    deviceTable["TMS320C6A8149"]  = deviceTable["TMS320TI816X"];

    deviceTable["Vayu"]           = deviceTable["DRA7XX"];
    deviceTable["TDA3XX"]         = deviceTable["DRA7XX"];
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

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    MemoryProtect = this;

    /* set fxntab default */
    MemoryProtect.common$.fxntab = false;

    Hwi = xdc.useModule("ti.sysbios.hal.Hwi");
    Exception = xdc.useModule("ti.sysbios.family.c64p.Exception");

    /* enable external exception processing */
    Exception.enableExternalMPC = true;

    var device = deviceTable[Program.cpu.deviceName];

    if (device == null) {
        print("Cache is not supported for the specified device (" +
            Program.cpu.deviceName + ").");
        print("Cache is only supported for the following devices on the " +
            Program.build.target.name + " target:");
        for (device in deviceTable) {
            print("\t" + device);
        }
        throw new Error ("Cache unsupported on device!");
    }

    /*
     *  update UMC_P0_BADDR for devices that have a different base address.
     *  For example DM647 and DM648 have UMC base address at 0x00A00000.
     */
    if (device.UMC_P0_BADDR != undefined) {
        UMC_P0_BADDR = device.UMC_P0_BADDR;
    }
}

/*
 *  ======== mb2mpcIndex ========
 *  Determine the megabyte to mpc index
 */
function mb2mpcIndex(mb)
{
    var device = deviceTable[Program.cpu.deviceName];

    if ((mb >= UMC_P0_BADDR) &&
        (mb <= ((UMC_P0_END - 1) >>> 20))) {
        return (MemoryProtect.UMAP0);
    }
    else if ((mb >= UMC_P1_BADDR) &&
             (mb <= ((UMC_P1_END - 1) >>> 20))) {
        return (MemoryProtect.UMAP1);
    }
    else if (mb == DMC_BADDR) {
        return (MemoryProtect.DMC);
    }
    else if (mb == PMC_BADDR) {
        return (MemoryProtect.PMC);
    }
    else {
        return (MemoryProtect.NONE);
    }
}

/*
 *  ======== setControllerValues ========
 *  Set the 'start' and 'end' values for each controller
 */
function setControllerValues()
{
    var device = deviceTable[Program.cpu.deviceName];

    /* set PMC variables */
    PMC_R0_START = (PMC_BADDR << 20);
    if (device.PMC_R0_SIZE == 0) {
        PMC_R1_START = PMC_R0_START;
    }
    else {
        PMC_R1_START = (PMC_R0_START + (0x1000 << device.PMC_R0_SIZE));
    }

    PMC_R0_END = (PMC_R1_START - (device.PMC_R0_ADJ << 14));
    PMC_R1_END = (PMC_R1_START + (0x1000 << device.PMC_R1_SIZE) -
                 (device.PMC_R1_ADJ << 14));

    if (device.PMC_R0_SIZE == 0) {
        PMC_R0_PS = 0;
    }
    else {
        PMC_R0_PS = (0x0100 << device.PMC_R0_SIZE);
    }

    PMC_R1_PS = (0x0100 << device.PMC_R1_SIZE);

    /* set DMC variables */
    DMC_R0_START = (DMC_BADDR << 20);
    if (device.DMC_R0_SIZE == 0) {
        DMC_R1_START = DMC_R0_START;
    }
    else {
        DMC_R1_START = (DMC_R0_START + (0x1000 << device.DMC_R0_SIZE));
    }

    DMC_R0_END = (DMC_R1_START - (device.DMC_R0_ADJ << 14));
    DMC_R1_END = (DMC_R1_START + (0x1000 << device.DMC_R1_SIZE) -
                 (device.DMC_R1_ADJ << 14));

    if (device.DMC_R0_SIZE == 0) {
        DMC_R0_PS = 0;
    }
    else {
        DMC_R0_PS = (0x0100 << device.DMC_R0_SIZE);
    }

    DMC_R1_PS = (0x0100 << device.DMC_R1_SIZE);

    /* set UMC variables */
    UMC_P0_START = (UMC_P0_BADDR << 20);
    UMC_P0_END = (UMC_P0_START + (0x0400 << device.UMC_P0_SIZE) -
                 (device.UMC_P0_ADJ << 14));
    UMC_P0_PS = (0x0020 << device.UMC_P0_SIZE);

    /* adjust start to top or bottom of UMAP0's 1MB address range */
    UMC_P1_START = ((UMC_P1_BADDR << 20) + ((0x00100000 -
                   (0x0400 << device.UMC_P1_SIZE)) * device.UMC_P1_ADJ));

    UMC_P1_END = (UMC_P1_START + (0x0400 << device.UMC_P1_SIZE));
    UMC_P1_PS = (0x0020 << device.UMC_P1_SIZE);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var device = deviceTable[Program.cpu.deviceName];

    /* call to set controller values */
    setControllerValues();

    /* set the regionCompare values */
    MemoryProtect.regionCompare[0] = 0xffffffff;
    MemoryProtect.regionCompare[1] = 0xffffffff;
    MemoryProtect.regionCompare[2] = (device.DMC_R0_SIZE == 0) ? 0 :
                               ((device.DMC_R1_START >>> 15) & 31) - 1;
    MemoryProtect.regionCompare[3] = (device.PMC_R0_SIZE == 0) ? 0 :
                               ((device.PMC_R1_START >>> 15) & 31) - 1;

    /* set the regionEnd values */
    MemoryProtect.regionEnd[0] = (device.UMC_P0_SIZE > 9) ? 0xffffffff :
                           ((device.UMC_P0_END >>> 15) & 31) - 1;
    MemoryProtect.regionEnd[1] = (device.UMC_P1_SIZE > 9) ? 0xffffffff :
                           ((device.UMC_P1_END >>> 15) & 31) - 1;
    MemoryProtect.regionEnd[2] = ((device.DMC_R1_END >>> 15) & 31) - 1;
    MemoryProtect.regionEnd[3] = ((device.PMC_R1_END >>> 15) & 31) - 1;

    /* set the region extract masks */
    MemoryProtect.regExtMasks[0][0].msb = device.UMC_P0_SIZE + UMC_RGN_MSB;
    MemoryProtect.regExtMasks[0][0].lsb = device.UMC_P0_SIZE + UMC_RGN_LSB;
    MemoryProtect.regExtMasks[1][0].msb = device.UMC_P1_SIZE + UMC_RGN_MSB;
    MemoryProtect.regExtMasks[1][0].lsb = device.UMC_P1_SIZE + UMC_RGN_LSB;
    MemoryProtect.regExtMasks[2][0].msb = device.DMC_R0_SIZE + DMC_RGN_MSB;
    MemoryProtect.regExtMasks[2][0].lsb = device.DMC_R0_SIZE + DMC_RGN_LSB;
    MemoryProtect.regExtMasks[3][0].msb = device.PMC_R0_SIZE + PMC_RGN_MSB;
    MemoryProtect.regExtMasks[3][0].lsb = device.PMC_R0_SIZE + PMC_RGN_LSB;
    MemoryProtect.regExtMasks[0][1].msb = device.UMC_P0_SIZE + UMC_RGN_MSB;
    MemoryProtect.regExtMasks[0][1].lsb = device.UMC_P0_SIZE + UMC_RGN_LSB;
    MemoryProtect.regExtMasks[1][1].msb = device.UMC_P1_SIZE + UMC_RGN_MSB;
    MemoryProtect.regExtMasks[1][1].lsb = device.UMC_P1_SIZE + UMC_RGN_LSB;
    MemoryProtect.regExtMasks[2][1].msb = device.DMC_R1_SIZE + DMC_RGN_MSB;
    MemoryProtect.regExtMasks[2][1].lsb = device.DMC_R1_SIZE + DMC_RGN_LSB;
    MemoryProtect.regExtMasks[3][1].msb = device.PMC_R1_SIZE + PMC_RGN_MSB;
    MemoryProtect.regExtMasks[3][1].lsb = device.PMC_R1_SIZE + PMC_RGN_LSB;

    /* set the MegaByte to MemoryProtect array */
    for (var i = 0; i < 16; i++) {
        MemoryProtect.megaByte2MPC[i] = mb2mpcIndex(i);
    }

    /* set the control struct for PMC */
    MemoryProtect.pmcCtrl.mpFault = $addr(0x0184A400);
    MemoryProtect.pmcCtrl.mpLck = $addr(0x0184A500);
    MemoryProtect.pmcCtrl.mppaTab = $addr(0x0184A600);
    MemoryProtect.pmcCtrl.mpCfg = null;                 /* no cfg for internal MemoryProtects */
    MemoryProtect.pmcCtrl.nPages = 32;
    MemoryProtect.pmcCtrl.evtNum = Exception.EVTPMCCMPA;

    /* set the control struct for DMC */
    MemoryProtect.dmcCtrl.mpFault = $addr(0x0184AC00);
    MemoryProtect.dmcCtrl.mpLck = $addr(0x0184AD00);
    MemoryProtect.dmcCtrl.mppaTab = $addr(0x0184AE00);
    MemoryProtect.dmcCtrl.mpCfg = null;                 /* no cfg for internal MemoryProtects */
    MemoryProtect.dmcCtrl.nPages = 32;
    MemoryProtect.dmcCtrl.evtNum = Exception.EVTDMCCMPA;

    /* set the control struct for UMC */
    MemoryProtect.umcCtrl.mpFault = $addr(0x0184A000);
    MemoryProtect.umcCtrl.mpLck = $addr(0x0184A100);
    MemoryProtect.umcCtrl.mppaTab = $addr(0x0184A200);
    MemoryProtect.umcCtrl.mpCfg = null;                 /* no cfg for internal MemoryProtects */
    MemoryProtect.umcCtrl.nPages = 64;
    MemoryProtect.umcCtrl.evtNum = Exception.EVTUMCCMPA;

    /* On C66 devices there is only one common set of Lock registers */
    if ((Program.cpu.deviceName.match(/TCI66/)) ||
        (Program.cpu.deviceName.match(/C66/))   ||
        (Program.cpu.deviceName.match(/Vayu/))   ||
        (Program.cpu.deviceName.match(/DRA7XX/))   ||
        (Program.cpu.deviceName.match(/TDA3XX/))   ||
        (Program.cpu.deviceName.match(/Kepler/))) {
        MemoryProtect.pmcCtrl.mpLck = $addr(0x0184AD00);
        MemoryProtect.dmcCtrl.mpLck = $addr(0x0184AD00);
        MemoryProtect.umcCtrl.mpLck = $addr(0x0184AD00);
    }

    /*  The module state controller array is init'ed in Module_startup */
    mod.controllers.length = 4;
    mod.controllers[0] = null;
    mod.controllers[1] = null;
    mod.controllers[2] = null;
    mod.controllers[3] = null;
}

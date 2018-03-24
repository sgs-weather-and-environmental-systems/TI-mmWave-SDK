/*
 * Copyright (c) 2013-2015, Texas Instruments Incorporated
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
 *  ======== CpIntc.xs ========
 *
 */

var CpIntc = null;
var Hwi = null;
var Ecm = null;
var numHostInterrupts;
var deviceName = null;
var catalog = null;
    
/*
 *  This table is indexed by GEM event ids and lists the
 *  CP_INTC host interrupts associated with each id.
 */    
if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "ti.catalog.c6000": {
            "TMS320C6670": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 208,
                numHostInterrupts: 104,
                numCores: 4,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    22: [64, 74, 84, 94],
                    23: [65, 75, 85, 95],
                    24: [66, 76, 86, 96],
                    25: [67, 77, 87, 97],
                    26: [68, 78, 88, 98],
                    27: [69, 79, 89, 99],
                    28: [70, 80, 90, 100],
                    29: [71, 81, 91, 101],
                    30: [72, 82, 92, 102],
                    31: [73, 83, 93, 103],
                    56: [0, 0, 0, 0],
                    57: [1, 1, 1, 1],
                    58: [2, 2, 2, 2],
                    59: [3, 3, 3, 3],
                    60: [4, 4, 4, 4],
                    61: [5, 5, 5, 5],
                    62: [6, 6, 6, 6],
                    63: [7, 7, 7, 7],
                    74: [8, 24, 40, 56],
                    75: [9, 25, 41, 57],
                    76: [10, 26, 42, 58],
                    77: [11, 27, 43, 59],
                    92: [12, 28, 44, 60],
                    93: [13, 29, 45, 61],
                    94: [14, 30, 46, 62],
                    95: [15, 31, 47, 63],
                }
            },
            "TMS320C6657": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 208,
                numHostInterrupts: 48,
                numCores: 2,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    22: [0, 20],
                    23: [1, 21],
                    24: [2, 22],
                    25: [3, 23],
                    26: [4, 24],
                    27: [5, 25],
                    28: [6, 26],
                    29: [7, 27],
                    30: [8, 28],
                    31: [9, 29],
                    56: [40, 40],
                    57: [41, 41],
                    58: [42, 42],
                    59: [43, 43],
                    60: [44, 44],
                    61: [45, 45],
                    62: [46, 46],
                    63: [47, 47],
                    92: [10, 30],
                    93: [11, 31],            
                }
            },
            "TMS320TCI6634": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 474,
                numHostInterrupts: 104,
                numCores: 8,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    23: [35, 35, 35, 35, 35, 35, 35, 35],
                    24: [102, 102, 102, 102, 102, 102, 102, 102],
                    25: [94, 95, 96, 97, 98, 99, 100, 101],
                    26: [68, 78, 88, 98, 68, 78, 88, 98],
                    27: [69, 79, 89, 99, 69, 79, 89, 99],
                    28: [70, 80, 90, 100, 70, 80, 90, 100],
                    29: [71, 81, 91, 101, 71, 81, 91, 101],
                    30: [72, 82, 92, 102, 72, 82, 92, 102],
                    31: [73, 83, 93, 103, 73, 83, 93, 103],
                    32: [16, 16, 16, 16, 16, 16, 16, 16],
                    33: [17, 17, 17, 17, 17, 17, 17, 17],
                    34: [18, 18, 18, 18, 18, 18, 18, 18],
                    35: [19, 19, 19, 19, 19, 19, 19, 19],
                    36: [20, 20, 20, 20, 20, 20, 20, 20],
                    37: [21, 21, 21, 21, 21, 21, 21, 21],
                    38: [22, 22, 22, 22, 22, 22, 22, 22],
                    39: [23, 23, 23, 23, 23, 23, 23, 23],
                    40: [32, 32, 32, 32, 32, 32, 32, 32],
                    41: [33, 33, 33, 33, 33, 33, 33, 33],
                    42: [13, 29, 45, 61, 13, 29, 45, 61],
                    43: [14, 30, 46, 62, 14, 30, 46, 62],
                    44: [15, 31, 47, 63, 15, 31, 47, 63],
                    45: [64, 74, 84, 94, 64, 74, 84, 94],
                    46: [65, 75, 85, 95, 65, 75, 85, 95],
                    47: [66, 76, 86, 96, 66, 76, 86, 96],
                    56: [0, 0, 0, 0, 0, 0, 0, 0],
                    57: [1, 1, 1, 1, 1, 1, 1, 1],
                    58: [2, 2, 2, 2, 2, 2, 2, 2],
                    59: [3, 3, 3, 3, 3, 3, 3, 3],
                    60: [4, 4, 4, 4, 4, 4, 4, 4],
                    61: [5, 5, 5, 5, 5, 5, 5, 5],
                    62: [6, 6, 6, 6, 6, 6, 6, 6],
                    63: [7, 7, 7, 7, 7, 7, 7, 7],
                    74: [8, 24, 40, 56, 8, 24, 40, 56],
                    75: [9, 25, 41, 57, 9, 25, 41, 57],
                    76: [10, 26, 42, 58, 10, 26, 42, 58],
                    77: [11, 27, 43, 59, 11, 27, 43, 59],
                    95: [67, 77, 87, 97, 67, 77, 87, 97],
                    99: [68, 14, 24, 52, 68, 14, 24, 52],
                   107: [12, 28, 44, 60, 12, 28, 44, 60],
                   108: [34, 34, 34, 34, 34, 34, 34, 34],
                   109: [13, 13, 13, 13, 13, 13, 13, 13],
                }
            },
            "TMS320C66AK2H06": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 474,
                numHostInterrupts: 104,
                numCores: 4,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    23: [35, 35, 35, 35],
                    24: [102, 102, 102, 102],
                    25: [94, 95, 96, 97],
                    26: [68, 78, 88, 98],
                    27: [69, 79, 89, 99],
                    28: [70, 80, 90, 100],
                    29: [71, 81, 91, 101],
                    30: [72, 82, 92, 102],
                    31: [73, 83, 93, 103],
                    32: [16, 16, 16, 16],
                    33: [17, 17, 17, 17],
                    34: [18, 18, 18, 18],
                    35: [19, 19, 19, 19],
                    36: [20, 20, 20, 20],
                    37: [21, 21, 21, 21],
                    38: [22, 22, 22, 22],
                    39: [23, 23, 23, 23],
                    40: [32, 32, 32, 32],
                    41: [33, 33, 33, 33],
                    42: [13, 29, 45, 61],
                    43: [14, 30, 46, 62],
                    44: [15, 31, 47, 63],
                    45: [64, 74, 84, 94],
                    46: [65, 75, 85, 95],
                    47: [66, 76, 86, 96],
                    56: [0, 0, 0, 0],
                    57: [1, 1, 1, 1],
                    58: [2, 2, 2, 2],
                    59: [3, 3, 3, 3],
                    60: [4, 4, 4, 4],
                    61: [5, 5, 5, 5],
                    62: [6, 6, 6, 6],
                    63: [7, 7, 7, 7],
                    74: [8, 24, 40, 56],
                    75: [9, 25, 41, 57],
                    76: [10, 26, 42, 58],
                    77: [11, 27, 43, 59],
                    95: [67, 77, 87, 97],
                    99: [68, 14, 24, 52],
                   107: [12, 28, 44, 60],
                   108: [34, 34, 34, 34],
                   109: [13, 13, 13, 13],
                }
            },
            "TMS320TCI6630K2L": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 475,
                numHostInterrupts: 104,
                numCores: 4,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    23: [35, 35, 35, 35],
                    24: [102, 102, 102, 102],
                    25: [94, 95, 96, 97],
                    26: [68, 78, 88, 98],
                    27: [69, 79, 89, 99],
                    28: [70, 80, 90, 100],
                    29: [71, 81, 91, 101],
                    30: [72, 82, 92, 102],
                    31: [73, 83, 93, 103],
                    32: [16, 16, 16, 16],
                    33: [17, 17, 17, 17],
                    34: [18, 18, 18, 18],
                    35: [19, 19, 19, 19],
                    36: [20, 20, 20, 20],
                    37: [21, 21, 21, 21],
                    38: [22, 22, 22, 22],
                    39: [23, 23, 23, 23],
                    40: [32, 32, 32, 32],
                    41: [33, 33, 33, 33],
                    42: [13, 29, 45, 61],
                    43: [14, 30, 46, 62],
                    44: [15, 31, 47, 63],
                    45: [64, 74, 84, 94],
                    46: [65, 75, 85, 95],
                    47: [66, 76, 86, 96],
                    56: [0, 0, 0, 0],
                    57: [1, 1, 1, 1],
                    58: [2, 2, 2, 2],
                    59: [3, 3, 3, 3],
                    60: [4, 4, 4, 4],
                    61: [5, 5, 5, 5],
                    62: [6, 6, 6, 6],
                    63: [7, 7, 7, 7],
                    74: [8, 24, 40, 56],
                    75: [9, 25, 41, 57],
                    76: [10, 26, 42, 58],
                    77: [11, 27, 43, 59],
                    95: [67, 77, 87, 97],
                    99: [68, 14, 24, 52],
                   107: [12, 28, 44, 60],
                   108: [34, 34, 34, 34],
                   109: [13, 13, 13, 13],
                }
            },
            "TMS320C66AK2E02": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 474,
                numHostInterrupts: 104,
                numCores: 1,
                numCpIntc: 3,
                gemEventsForHostInts: {
                    23: [35],
                    24: [102],
                    25: [94],
                    26: [68],
                    27: [69],
                    28: [70],
                    29: [71],
                    30: [72],
                    31: [73],
                    32: [16],
                    33: [17],
                    34: [18],
                    35: [19],
                    36: [20],
                    37: [21],
                    38: [22],
                    39: [23],
                    40: [32],
                    41: [33],
                    42: [13],
                    43: [14],
                    44: [15],
                    45: [64],
                    46: [65],
                    47: [66],
                    56: [0],
                    57: [1],
                    58: [2],
                    59: [3],
                    60: [4],
                    61: [5],
                    62: [6],
                    63: [7],
                    74: [8],
                    75: [9],
                    76: [10],
                    77: [11],
                    95: [67],
                    99: [68],
                   107: [12],
                   108: [34],
                   109: [13],
                }
            },
	    "TCI66AK2G02" : {
                baseAddr: 0x02600000,
                numSystemInterrupts: 416,
                numHostInterrupts: 104,
                numCores: 1,
                numCpIntc: 1,
                gemEventsForHostInts: {
                    48: [32],
                    49: [33],
                    50: [34],
                    51: [35],
                    52: [36],
                    53: [37],
                    54: [38],
                    55: [39],
                    56: [40],
                    57: [41],
                    58: [42],
                    59: [43],
                    60: [44],
                    61: [45],
                    62: [46],
                    63: [47],
                    64: [48],
                    65: [49],
                    66: [50],
                    67: [51],
                    68: [52],
                    69: [53],
                    70: [54],
                    71: [55],
                    72: [56],
                    73: [57],
                    74: [58],
                    75: [59],
                    76: [60],
                    77: [61],
                    78: [62],
                    79: [63],
                    80: [64],
                    81: [65],
                    82: [66],
                    83: [67],
                    84: [68],
                    85: [69],
                    86: [70],
                    87: [71],
                    88: [72],
                    89: [73],
                    90: [74],
                    91: [75],
                    92: [76],
                    93: [77],
                    94: [78],
                    95: [79],
	        }
	    },
            "TMS320C6678": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 160,
                numHostInterrupts: 76,
                numCores: 8,
                numCpIntc: 4,
                gemEventsForHostInts: {
                    21: [32, 43, 54, 65, 32, 43, 54, 65],
                    22: [33, 44, 55, 66, 33, 44, 55, 66],
                    23: [34, 45, 56, 67, 34, 45, 56, 67],
                    24: [35, 46, 57, 68, 35, 46, 57, 68],
                    25: [36, 47, 58, 69, 36, 47, 58, 69],
                    26: [37, 48, 59, 70, 37, 48, 59, 70],
                    27: [38, 49, 60, 71, 38, 49, 60, 71],
                    28: [39, 50, 61, 72, 39, 50, 61, 72],
                    29: [40, 51, 62, 73, 40, 51, 62, 73],
                    30: [41, 52, 63, 74, 41, 52, 63, 74],
                    31: [42, 53, 64, 75, 42, 53, 64, 75],
                    62: [2, 10, 18, 26, 2, 10, 18, 26],
                    63: [3, 11, 19, 27, 3, 11, 19, 27],
                    92: [4, 12, 20, 28, 4, 12, 20, 28],
                    93: [5, 13, 21, 29, 5, 13, 21, 29],
                    94: [6, 14, 22, 30, 6, 14, 22, 30],
                    95: [7, 15, 23, 31, 7, 15, 23, 31],
                    102: [0, 0, 0, 0, 0, 0, 0, 0],
                    103: [1, 1, 1, 1, 1, 1, 1, 1],
                    104: [8, 8, 8, 8, 8, 8, 8, 8],
                    105: [9, 9, 9, 9, 9, 9, 9, 9],
                    106: [16, 16, 16, 16, 16, 16, 16, 16],
                    107: [17, 17, 17, 17, 17, 17, 17, 17],
                    108: [24, 24, 24, 24, 24, 24, 24, 24],
                    109: [25, 25, 25, 25, 25, 25, 25, 25],
                }
            }
        }
    }
    
    deviceTable["ti.catalog.c6000"]["TMS320TCI6614"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6616"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6618"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];

    deviceTable["ti.catalog.c6000"]["TMS320TCI6608"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6678"];
    deviceTable["ti.catalog.c6000"]["TMS320C6671"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6678"];
    deviceTable["ti.catalog.c6000"]["TMS320C6672"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6678"];
    deviceTable["ti.catalog.c6000"]["TMS320C6674"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6678"];

    deviceTable["ti.catalog.c6000"]["TMS320C6654"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6657"];
    deviceTable["ti.catalog.c6000"]["TMS320C6655"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6657"];

    deviceTable["ti.catalog.c6000"]["Kepler"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6636"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6638"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320C66AK2H12"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320C66AK2E05"] =
        deviceTable["ti.catalog.c6000"]["TMS320C66AK2E02"];
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.family.c64p.Hwi');
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
    
    CpIntc = this;
    var deviceSupported = false;
    
    catalog = Program.cpu.catalogName;
    /* loop through the device table */
    for (deviceName in deviceTable[catalog]) {
        if (deviceName == Program.cpu.deviceName) {
            deviceSupported = true;
            break;
        }
    }
    
    if (!(deviceSupported)) {
        print("CpIntc is not supported for the specified device (" +
              Program.cpu.deviceName + ")");
            
        throw new Error ("CpIntc unsupported on device!");
    }
    
    numSystemInterrupts = deviceTable[catalog][deviceName].numSystemInterrupts;
    numHostInterrupts = deviceTable[catalog][deviceName].numHostInterrupts;
    var numCores = deviceTable[catalog][deviceName].numCores;
    var gemEvents = deviceTable[catalog][deviceName].gemEventsForHostInts;
    
    CpIntc.numSysInts = numSystemInterrupts;
    CpIntc.sysInts.length = numSystemInterrupts;
    CpIntc.sysIntToHostInt.length = numSystemInterrupts;
    CpIntc.hostInts.length = numHostInterrupts;
    
    /* each core has its own host interrupt to event id mapping */
    CpIntc.hostIntToEventId.length = numCores;

    /* init the host interrupt and event id table */
    for (var i in gemEvents) {
        /* create the event id table */
        var len = CpIntc.eventId.length++;
        CpIntc.eventId[len] = parseInt(i);

        /* create the host interrupt table */
        for (var j = 0; j < CpIntc.hostIntToEventId.length; j++) {
            CpIntc.hostIntToEventId[j].length++;
            CpIntc.hostIntToEventId[j][len] = gemEvents[i][j];
        }
    }
    
    /* set the number of GEM events for each core */
    CpIntc.numEvents = CpIntc.eventId.length;

    /* initialize all system interrupts */
    for (var i = 0; i < numSystemInterrupts; i++) {
        CpIntc.sysInts[i].fxn = '&ti_sysbios_family_c66_tci66xx_CpIntc_unused';
        CpIntc.sysInts[i].arg = i;
        CpIntc.sysInts[i].hostInt = -1;
        CpIntc.sysInts[i].enable = false;
        CpIntc.sysIntToHostInt[i] = -1;
    }
    
    /* initialize the host interrupts */
    for (var i = 0; i < numHostInterrupts; i++) {
        CpIntc.hostInts[i].hwiNum = -1;
        CpIntc.hostInts[i].useEventCombiner = false;
    }

    /*  
     *  Based on the number of system interrupt in the system, we can
     *  calculate the number of System Interrupt Status Registers required.
     *  Each SISR can be used for 32 system interrupts.
     */
    CpIntc.numStatusRegs = ((numSystemInterrupts - 1) / 32) + 1;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.initSIER.length = CpIntc.numStatusRegs;
    mod.dispatchTab.length = CpIntc.numSysInts;
    mod.hostIntToSysInt.length = numHostInterrupts;
    mod.controller.length = deviceTable[catalog][deviceName].numCpIntc;
    
    /* 
     *  set the base address of each INTC in the device.
     *  each INTC is 8K bytes and is separated by 8K bytes.
     */
    mod.controller[0] = $addr(deviceTable[catalog][deviceName].baseAddr);
    for (var i = 1; i < mod.controller.length; i++) {
        mod.controller[i] = $addr(mod.controller[i - 1] + 0x4000);
    }
    
    /* Set the default system interrupt status register to 0 */
    for (var i = 0; i < mod.initSIER.length; i++) {
        mod.initSIER[i] = 0;
    }
    
    /* Set the default system to host interrupt to 0 */
    for (var i = 0; i < numHostInterrupts; i++) {
        mod.hostIntToSysInt[i] = -1;
    }

    /* initialize the dipatcher table */
    for (var i = 0; i < CpIntc.numSysInts; i++) {
        var regIndex = Math.floor(i / 32);
        mod.dispatchTab[i].fxn = CpIntc.sysInts[i].fxn;
        mod.dispatchTab[i].arg = CpIntc.sysInts[i].arg;
        
        if (CpIntc.sysInts[i].enable) {
            mod.initSIER[regIndex] |= 1 << (i % 32);
        }
        
        /*
         *  If only one system interrupt is mapped to one host interrupt,
         *  The dispatch() can look at the sysToHost[] and determine
         *  the system interrupt which caused the host interrupt to trigger.
         *  This will be used to set the module state at runtime.
         */
        if (CpIntc.sysInts[i].hostInt != -1) {
            CpIntc.sysIntToHostInt[i] = CpIntc.sysInts[i].hostInt;
        }
    }
    
    /* 
     *  If mapHostIntToHwiMeta() was called for the host interrupt,
     *  then create a Hwi.  If mapHostIntToEventCombinerMeta was
     *  called then plug the Event Combiner.  If both were called
     *  log an error.
     */
    for (var i = 0; i < numHostInterrupts; i++) {
        var hwiNum = CpIntc.hostInts[i].hwiNum;
        var useEventCombiner = CpIntc.hostInts[i].useEventCombiner;

        if ((hwiNum != -1) && useEventCombiner) {
            CpIntc.$logError("CpIntc.module$static$init: Both Hwi " +
                "was set to " + hwiNum + " and Event Combiner was " +
                "specified to be used.", CpIntc);
        }
        else {
            if (hwiNum != -1) {
                var evtId = getEventIdMeta(i);
                
                if (evtId != -1) {
                    /* if a valid event id is found */
                    if (useEventCombiner) {
                        /* use Event Combiner */
                        plugEventCombiner(i, evtId);
                    }
                    else {
                        /* create Hwi */
                        createHwi(i, evtId, hwiNum);
                    }
                }
                else {
                    /* no valid event id was found */
                    CpIntc.$logError("CpIntc.module$static$init: " +
                        "Cannot plug hwiNum: " + hwiNum + ". " +
                        "No event id was found associated with " +
                        "host interrupt " + i + ".", CpIntc);
                }
            }
        }
    }
}

/*
 *  ======== getEventId ========
 */
function getEventIdMeta(hostInt)
{
    var gemEvents = deviceTable[catalog][deviceName].gemEventsForHostInts;
    var evtId = -1;
    
    /* find the event Id associated with Host interrupt */
    for (var j in gemEvents) {
        for (var z = 0; z < gemEvents[j].length; z++) {
            if (hostInt == gemEvents[j][z]) {
                if ((evtId != -1) &&
                    (evtId != parseInt(j))) {
                    CpIntc.$logWarning("More than one event id was found " +
                        "for this host interrupt.  The event id should be " +
                        "set explicitly or the host interrupt should be " +
                        "plugged at runtime.", CpIntc, "getEventId");
                }
                else {
                    evtId = parseInt(j);
                    break;
                }
            }
        }
    }
    
    return (evtId);
}

/*
 *  ======== mapHostIntToEventCombinerMeta ========
 */
function mapHostIntToEventCombinerMeta(hostInt)
{
    if (hostInt < 0 || hostInt >= numHostInterrupts) {
        CpIntc.$logError("CpIntc.mapHostIntToEventCombinerMeta: host int " +
            "must be between 0 -> " + CpIntc.NUM_HOSTINTS + " (attempting " +
            "to map host int " + hostInt + ").", CpIntc);
    }
    
    CpIntc.hostInts[hostInt].useEventCombiner = true;
}

/*
 *  ======== mapHostIntToHwiMeta ========
 *  function sets the hostInts[] which is used in module$static$init
 *  to create a Hwi.
 */
function mapHostIntToHwiMeta(hostInt, hwiNum)
{
    if (hwiNum < 4 || hwiNum > 15) {
        CpIntc.$logError("CpIntc.mapHostInterruptToHwi: hwi vector number " +
            "must be between 4 -> 15 inclusive (attempting to set vector " +
            "number " + hwiNum + ").", CpIntc);
    }

    if (hostInt < 0 || hostInt >= numHostInterrupts) {
        CpIntc.$logError("CpIntc.mapHostInterruptToHwi: host int must be " +
            "between 0 -> " + CpIntc.NUM_HOSTINTS + " (attempting to map " +
            "host int " + hostInt + ").", CpIntc);
    }

    CpIntc.hostInts[hostInt].hwiNum = hwiNum;
}

/*
 *  ======== createHwi ========
 */
function createHwi(hostInt, evtId, hwiNum)
{
    if (hwiNum < 4 || hwiNum > 15) {
        CpIntc.$logError("CpIntc.createHwi: hwi vector number must be " +
            "between 4 -> 15 inclusive (attempting to set vector number " +
            hwiNum + ").", CpIntc);
    }

    var hwiParams = new Hwi.Params();
    hwiParams.eventId = evtId;
    hwiParams.arg = hostInt;
    hwiParams.enableInt = true;
    Hwi.create(hwiNum, '&ti_sysbios_family_c66_tci66xx_CpIntc_dispatch',
        hwiParams);
}

/*
 *  ======== plugEventCombiner ========
 */
function plugEventCombiner(hostInt, evtId)
{
    Ecm = xdc.useModule('ti.sysbios.family.c64p.EventCombiner');
    
    Ecm.events[evtId].fxn = '&ti_sysbios_family_c66_tci66xx_CpIntc_dispatch';
    Ecm.events[evtId].arg = hostInt;
    Ecm.events[evtId].unmask = true;
}

 
/*
 *  ======== module$validate ========
 *  Combined events should be plugged with the CpIntc dispatch function.
 *  If they aren't, then print a warning.
 */
function module$validate()
{
}

/*
 *  ======== viewInitSystemInts ========
 */
function viewInitSystemInts(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var CpIntc = xdc.useModule('ti.sysbios.family.c66.tci66xx.CpIntc');

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.c66.tci66xx.CpIntc');
    }
    catch (e) {
        // TODO - report problem.
        print("Caught exception while retrieving raw view: " + e);
    }

    var mod = rawView.modState;

    /* Retrieve the module configuration. */
    var modCfg = Program.getModuleConfig('ti.sysbios.family.c66.tci66xx.CpIntc');

    /* Retrieve the dispatch table for system interrupts */
    try {
        var sysInts = Program.fetchArray(mod.dispatchTab$fetchDesc,
                                         mod.dispatchTab,
                                         modCfg.numSysInts);
    }
    catch (e) {
        // TODO - Report problem
        print("Caught exception while trying to retrieve dispatch table: " + e);
    }

    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    /* Retrieve the controller base address */
    try {
        var controller = Program.fetchStruct(ScalarStructs.S_UInt32$fetchDesc,
                                             mod.controller);
    }
    catch (e) {
        // TODO - Report problem
        print("Caught exception while trying to retrieve base address: " + e);
    }

    var CallStack = xdc.useModule('xdc.rov.CallStack');
    CallStack.clearRegisters();
    CallStack.fetchRegisters(["DNUM"]);
    var dnum = CallStack.getRegister("DNUM");

    /* Retrieve the CpIntc controller register */
    try {
        if (dnum < 4) {
            var controlReg = Program.fetchStruct(CpIntc.RegisterMap$fetchDesc,
                                             controller.elem,
                                             false);
        }
	else {
            var controlReg = Program.fetchStruct(CpIntc.RegisterMap$fetchDesc,
                                             controller.elem + 0x4000,
                                             false);
	}
    }
    catch (e) {
        // TODO - Report problem
        print("Caught exception while trying to retrieve controlReg: " + e);
    }

    /* Display each of the system interrupt's settings. */
    for (var i = 0; i < modCfg.numSysInts; i++) {
        var fxnName = Program.lookupFuncName(Number(sysInts[i].fxn))[0];
        var arg     = sysInts[i].arg;
        var group   = parseInt(i / 32);
        var bitpos  = i % 32;

        /* ignore system interrupts that are not plugged */
        if (fxnName == "ti_sysbios_family_c66_tci66xx_CpIntc_unused__E") {
            continue;
        }

        var entryView =
            Program.newViewStruct('ti.sysbios.family.c66.tci66xx.CpIntc',
                                  'SysInts');

        entryView.systemInt = i;
        entryView.hostInt   = controlReg.CMR[i];
        entryView.fxn       = fxnName; 
        entryView.arg       = arg;
        entryView.enabled   = (controlReg.ECR[group]) & (1 << bitpos);

        view.elements.$add(entryView);
    }
}

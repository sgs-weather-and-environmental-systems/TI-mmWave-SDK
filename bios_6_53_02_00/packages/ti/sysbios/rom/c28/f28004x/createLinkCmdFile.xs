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

var romMapArr;

/*
 *  ======== readFile ========
 */
function readFile(filename)
{
    var line, idx = 0;
    var lineArr = new Array();

    /* Open file */
    var file = new java.io.BufferedReader(new java.io.FileReader(filename));

    /* Read file */
    while ((line = file.readLine()) != null) {
        lineArr[idx++] = line;
    }

    return lineArr;
}

/*
 *  ======== writeXdtFile ========
 */
function writeXdtFile(filename, content)
{
    var idx = 0;

    /* Open/Create file */
    var file = new java.io.FileWriter(filename);

    for(idx = 0; idx < content.length; idx++) {
        file.write(content[idx] + "\n");
    }

    file.flush();
}

/*
 *  ======== buildUndefSegment ========
 */
function buildUndefSegment(objDumpArray)
{
    var idx = 0;
    var symbolName;
    var tokens = new Array();
    var lineArray = new Array();

    lineArray[lineArray.length] = "";

    for (idx = 0; idx < objDumpArray.length; idx++) {
        tokens = String(objDumpArray[idx]).split(/\s+/);
        symbolName = String(tokens[6]);
        if (symbolName[0] != '_') {
           symbolName = "_" + symbolName;
        }
        lineArray[lineArray.length] = "-u " + symbolName;
    }

    return (lineArray);
}

/*
 *  ======== buildRomSegment ========
 */
function buildRomSegment(objDumpArray)
{
    var idx = 0;
    var virtualAddr, symbolName;
    var tokens = new Array();
    var lineArray = new Array();

    lineArray[lineArray.length] = "";

    for (idx = 0; idx < objDumpArray.length; idx++) {
        tokens = String(objDumpArray[idx]).split(/\s+/);
        virtualAddr = "0x" + String(tokens[0]);
        virtualAddr = (parseInt(virtualAddr)).toString(16);
        symbolName = String(tokens[6]);

        /* !!! hack to workaround TI linker warning regarding redefinition of memcpy and memset !!! */
	if (symbolName == "memset" || symbolName == "memcpy") {
	    continue;
	}

        /* do not include assignment of REVISION const to avoid redefinition warning */
	if (symbolName.match("REVISION__C")) {
	    continue;
	}

	lineArray[lineArray.length] = "_" + symbolName + " = 0x" + virtualAddr + ";";
    }

    return (lineArray);
}

/*
 *  ======== buildPlacementSegment ========
 */
function buildPlacementSegment(constArray, dataArray)
{
    var idx = 0;
    var virtualAddr, symbolName;
    var tokens = new Array();
    var lineArray = new Array();
    var startAddress;

    lineArray[lineArray.length] = "";
    lineArray[lineArray.length] = "SECTIONS";
    lineArray[lineArray.length] = "{";
    lineArray[lineArray.length] = "    .sysbios_rom_const: {";

    for (idx = 0; idx < constArray.length; idx++) {
        tokens = String(constArray[idx]).split(/\s+/);
        virtualAddr = "0x" + String(tokens[0]);
        if (idx == 0) {
            startAddress = virtualAddr;
        }
        symbolName = String(tokens[6]);
        lineArray[lineArray.length] = "        *(.econst:" + symbolName + ")";
    }

    lineArray[lineArray.length] = "    } LOAD > " + startAddress + ", PAGE 0";
    lineArray[lineArray.length] = "";
    lineArray[lineArray.length] = "    .sysbios_rom_data: {";

    for (idx = 0; idx < dataArray.length; idx++) {
        tokens = String(dataArray[idx]).split(/\s+/);
        virtualAddr = "0x" + String(tokens[0]);
        if (idx == 0) {
            startAddress = virtualAddr;
        }
        symbolName = String(tokens[6]);
        lineArray[lineArray.length] =
                "        *(.ebss:" + symbolName + ")";
    }

    lineArray[lineArray.length] = "    } LOAD > " + startAddress + ", PAGE 1";
    lineArray[lineArray.length] = "}";

    return (lineArray);
}

function main(args)
{
    var romTextFile = args[0];
    var romConstFile = args[1];
    var romDataFile = args[2];
    var linkCmdFile = args[3];

    var romMapFile;
    var romTextArr, romConstArr, romDataArr;
    var romTextIdx, romConstIdx, romDataIdx;

    var undefSegment;
    var romSymbolSegment;
    var placementSegment;

    romTextArr = readFile(romTextFile);
    romConstArr = readFile(romConstFile);
    romDataArr = readFile(romDataFile);

    /*
     * the linkcmd.xdt template has 3 main segments:
     *
     *  the -u segment which forces the inclusion of all the ROM referenced
     *  symbols (consts and data) by -u undefining them.
     *
     *  the API function address assignment segment which defines all
     *  the symbols in the ROM and assigns their addresses to them.
     *
     *  the placement segment where all the ROM referenced symbols'
     *  (consts and data) sections are placed at specific addresses.
     */

    undefSegment = buildUndefSegment(romConstArr.concat(romDataArr));
    romSymbolSegment = buildRomSegment(romTextArr);
    placementSegment = buildPlacementSegment(romConstArr, romDataArr);

print("Writing linkcmd.xdt");

    writeXdtFile(linkCmdFile, undefSegment.concat(romSymbolSegment, placementSegment));
}

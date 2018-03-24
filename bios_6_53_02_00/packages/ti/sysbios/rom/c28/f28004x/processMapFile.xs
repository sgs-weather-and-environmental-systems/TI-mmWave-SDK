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
 *  ======== writeFile ========
 */
function writeFile(filename, content)
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
 *  ======== buildRomTextFile ========
 */
function buildRomTextFile(mapFile, textFile)
{
    var textFileArr = new Array();
    var tokens = new Array();
    var mapIdx, virtualAddr, symbolName;
    var addr, start, end;

    mapFileArr = readFile(mapFile);

    /* 
     * The C28x linker doesn't show symbol aliases in the .sysbios_rom_text
     * section lists. Must use symbols sorted by address segment of the map
     * file to extract ALL the symbols in the .sysbios_rom_text section
     */
    
    for (mapIdx = 0; mapIdx < mapFileArr.length; mapIdx++) {

	/* extract start and end address of RTOS_ROM region */
        if (String(mapFileArr[mapIdx]).match("RTOS_ROM")) {
            tokens = String(mapFileArr[mapIdx++]).split(/\s+/);
	    start = Number("0x" + tokens[2]);
	    end = start + Number("0x" + tokens[4]);
	}

        /* skip to symbols sorted by address section of .map file */
        if (String(mapFileArr[mapIdx]).match("SORTED BY Symbol Address")) {
            mapIdx += 4; /* skip past the section summary line */
            while (String(mapFileArr[mapIdx]) != "") {
                /* skip .switch symbols */
		if (String(mapFileArr[mapIdx]).match(/\.switch/)) {
                    mapIdx++;
                    continue;
                }
                tokens = String(mapFileArr[mapIdx++]).split(/\s+/);
		addr = Number("0x" + tokens[1]);
		/* include only those symbols within the RTOS_ROM region (ie .sysbios_rom_text) */
		if ((addr >= start) && (addr < end)) {
                    symbolName = String(tokens[2]);
                    symbolName = symbolName.substr(1); /* trim leading underscore */
		    /* convert to format expected by createLinkCmdFile.xs */
                    textFileArr[textFileArr.length] = tokens[1] + " 1 2 3 4 5 " + symbolName;
		}
            }
        }
    }

    writeFile(textFile, textFileArr);
}

/*
 *  ======== buildRomConstFile ========
 */
function buildRomConstFile(mapFile, constFile)
{
    var constFileArr = new Array();
    var tokens = new Array();
    var mapIdx, virtualAddr, symbolName;

    mapFileArr = readFile(mapFile);
    
    for (mapIdx = 0; mapIdx < mapFileArr.length; mapIdx++) {
        if (String(mapFileArr[mapIdx]).match(".sysbios_rom_const")) {
            mapIdx += 2; /* skip past the section summary line */
            while (String(mapFileArr[mapIdx]) != "") {
                tokens = String(mapFileArr[mapIdx++]).split(/\s+/);
                symbolName = String(tokens[4]);
                symbolName = symbolName.substring(symbolName.indexOf(":")+1,
                             symbolName.lastIndexOf(")"));
                constFileArr[constFileArr.length] = tokens[1] + " 1 2 3 4 5 " + symbolName;
            }
        }
    }
    writeFile(constFile, constFileArr);
}

/*
 *  ======== buildRomDataFile ========
 */
function buildRomDataFile(mapFile, dataFile)
{
    var dataFileArr = new Array();
    var tokens = new Array();
    var mapIdx, virtualAddr, symbolName;

    mapFileArr = readFile(mapFile);
    
    for (mapIdx = 0; mapIdx < mapFileArr.length; mapIdx++) {
        if (String(mapFileArr[mapIdx]).match(".sysbios_rom_data")) {
            mapIdx += 2; /* skip past the section summary line */
            while (String(mapFileArr[mapIdx]) != "") {
                tokens = String(mapFileArr[mapIdx++]).split(/\s+/);
                symbolName = String(tokens[4]);
                symbolName = symbolName.substring(symbolName.indexOf(":")+1,
                             symbolName.lastIndexOf(")"));
                dataFileArr[dataFileArr.length] = tokens[1] + " 1 2 3 4 5 " + symbolName;
            }
        }
    }
    writeFile(dataFile, dataFileArr);
}

function main(args)
{
    var romMapFile = args[0];
    var romTextFile = args[1];
    var romConstFile = args[2];
    var romDataFile = args[3];

    buildRomTextFile(romMapFile, romTextFile);
    buildRomConstFile(romMapFile, romConstFile);
    buildRomDataFile(romMapFile, romDataFile);
}

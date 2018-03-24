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

/*
 *  ======== package.xs ========
 *
 *! 27-Aug-2008 sasha   skip the stack base address check if BIOS 5 is present
 *! 31-May-2007 sasha   added check for stack base address (CQ13032)
 */

/*
 *  ======== Package.close ========
 *  This function is called when this package is closed
 */
function close()
{

    /* Nothing to do, unless we are in Config Object Model */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* If this package is accidently loaded when some other architecture is
     * actually used, we don't want to look into stack segment.
     */
    if (Program.build.target.isa.substring(0, 2) != "28") {
        return;
    }

    var stack = Program.getSectMap()[".stack"];
    if (stack == null || stack.loadSegment == null) {
        return;
    }
    var stackSegName = stack.loadSegment;

    /* sectMap entry may include 'page' description, so we need only the
     * first token until a first whitespace is found.
     */
    var stackSegNameArr = stackSegName.split(/\s+/);
    stackSegName = stackSegNameArr[0];

    /* look for the stack memory object and find out its base + len address.
     * It mustn't go over 64K.
     */
    var stackSeg = Program.cpu.memoryMap[stackSegName];

    if (stackSeg == null) {
        return;
    }

    if (stackSeg.base + stackSeg.len > 0x10000) {
        Program.platform.$module.$logError("The section .stack must be " +
            "placed within low 64K of data memory", Program.platform, null);
    }

}

/*
 *  ======== Package.getLibs ========
 *  Get this package's libraries (This package's implementation of
 *  xdc.IPackage.getLibs)
 */
function getLibs()
{
    return (null);    /* no libraries for this package */
}

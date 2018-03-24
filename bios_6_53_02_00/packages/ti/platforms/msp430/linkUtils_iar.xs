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
 *  ======== genSections ========
 *
 *  This function generates section allocations.
 *
 *  This is not used as IAR does not support NOLOAD/COPY sections yet.
 */
function genSections(prog)
{
    var res = "";

    /* the section map is constructed from the target and program info */
    var sectMap = prog.getSectMap();

    if (sectMap['xdc.meta'] == undefined) {
        sectMap['xdc.meta'] = new prog.SectionSpec();
        sectMap['xdc.meta'].loadAddress = 40000;
    }

    if ("xdc.runtime" in xdc.om && xdc.om['xdc.runtime.Text'].isLoaded != true
        && sectMap['xdc.noload'] == undefined) {
        sectMap['xdc.noload'] = new prog.SectionSpec();
        sectMap['xdc.noload'].loadAddress = 50000;
    }

    var exclude = ("sectionsExclude" in prog)
                    ? new RegExp(prog.sectionsExclude): null;
    for (var sn in sectMap) {
        if (exclude != null && sn.match(exclude) != null) {
            /* don't generate this section; the user will take care of this */
            continue;
        }

        if (sectMap[sn].loadAddress != undefined) {
            res += "-Z" + sn + "=" + sectMap[sn].loadAddress;
        }
        else {
            res += "-Z" + sn + "=_" + sectMap[sn].loadSegment + "_START-_"
                + sectMap[sn].loadSegment + "_END\n";
        }
    }

    /* filter content using Program.sectionsTemplate */
    if ("sectionsTemplate" in prog && prog.sectionsTemplate != null) {
        var tplt = xdc.loadTemplate(prog.sectionsTemplate);
        var bout = new java.io.ByteArrayOutputStream();
        var out = new java.io.PrintStream(bout);
        tplt.genStream(out, prog, [sectMap, res]);
        res = bout.toString();
    }

    return (res);
}

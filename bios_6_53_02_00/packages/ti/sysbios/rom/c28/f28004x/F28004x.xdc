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
 *  ======== F28004x.xdc ========
 *  F28004x device specific ROM support module.
 */

/*
 *
 *  These proxy bindings are fixed in ROM:
 *
 *   ti.sysbios.BIOS.RtsGateProxy is fixed and bound to GateMutex (non-issue for IAR and GNU)
 *   ti.sysbios.hal.Timer.TimerProxy is fixed and bound to c28.Timer.
 *   ti.sysbios.hal.Hwi.HwiProxy is fixed and bound to c28.Hwi.
 *   ti.sysbios.heaps.HeapMem.Module_GateProxy is fixed and bound to GateMutex
 *   ti.sysbios.knl.Clock.TimerProxy is fixed and bound to f28004x.Timer.
 *   ti.sysbios.knl.Task.SupportProxy is fixed and bound to c28.TaskSupport.
 *   xdc.runtime.Memory_HeapProxy is fixed and bound to HeapMem.
 *   xdc.runtime.System_Module_GateProxy is fixed and bound to GateHwi
 *   xdc.runtime.Timestamp.SupportProxy is fixed and bound to f28004x.Timestamp 

 *  These proxy bindings are configurable:
 *
 *   System.SupportProxy is configurable.
 *
 *  This module's C file (F28004x.c) will not be included in the 
 *  string returned by Build.getCFiles() because the 
 *  ti.sysbios.rom.c28.f28004x package is deliberately not
 *  included in the "Build.biosPackages[]" table.
 */

@Template('./F28004x.xdt')
module F28004x inherits ti.sysbios.interfaces.IRomDevice
{
    override metaonly config String libDir = null;
    override metaonly config String templateName = "F28004x_rom_makefile.xdt";
    
    /*
     *  Set this constant to a magic value unique to the ROM.romName.
     */
    config UInt32 REVISION;
    metaonly config UInt32 REVISION_WORD_ADDRESS;

internal:   /* not for client use */

    /*
     *  when set to true, an application will be linked against an image of
     *  of the ROM made to be placed in FLASH memory.
     */
    metaonly config Bool useFlash = false;

    /*
     *  when set to false, an application will be linked against an image of
     *  the ROM from the work build area.
     */
    metaonly config Bool useGolden = true;
}

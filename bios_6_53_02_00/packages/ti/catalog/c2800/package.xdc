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

requires xdc.platform;

/*!
 *  ======== ti.catalog.c2800 ========
 *  Package of devices for the c2800 family of DSPs.
 *
 *  Each module in this package implements the xdc.platform.ICpuDataSheet
 *  interface. This interface is used by platforms (modules that implement
 *  xdc.platform.IPlatform) to obtain the memory map supported by each CPU.
 */
package ti.catalog.c2800 [1,0,0,0] {
    interface ITMS320C28xx,ITMS320C283xx;

    module TMS320C2801, TMS320C2802, TMS320C2806, TMS320C2808, TMS320C2809;
    module TMS320C2810, TMS320C2811, TMS320C2812, TMS320C28015, TMS320C28016;
    module TMS320C28232, TMS320C28234, TMS320C28235;
    module TMS320C28332, TMS320C28334, TMS320C28335;

    /* Piccolo Devices */
    module TMS320C28020, TMS320C28021;
    interface ITMS320C28026;
    module TMS320C28022, TMS320C28026;
    interface ITMS320C28027;
    module TMS320C28023, TMS320C28027;

    /* Piccolo-B Devices */
    module TMS320C28030, TMS320C28031;
    interface ITMS320C28032;
    module TMS320C28032, TMS320C28033;
    interface ITMS320C28034;
    module TMS320C28034, TMS320C28035;

    module TMS320C28044;

    /* Delfino Devices */
    interface ITMS320C28342;
    module TMS320C28341, TMS320C28342;
    interface ITMS320C28344;
    module TMS320C28343, TMS320C28344;
    interface ITMS320C28346;
    module TMS320C28345, TMS320C28346;

    /* Octave Devices */
    module TMS320F28062, TMS320F28063;
    interface ITMS320F28065;
    module TMS320F28064, TMS320F28065;
    module TMS320F28066;
    interface ITMS320F28069;
    module TMS320F28067, TMS320F28068, TMS320F28069;

    module F28M35x;
}

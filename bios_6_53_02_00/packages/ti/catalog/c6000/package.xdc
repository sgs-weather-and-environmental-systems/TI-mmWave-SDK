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
 *  ======== ti.catalog.c6000 ========
 *  Package of devices for the c6000 family of DSPs.
 *
 *  Each module in this package implements the xdc.platform.ICpuDataSheet
 *  interface.  This interface is used by platforms (modules that implement
 *  xdc.platform.IPlatform) to obtain the memory map supported by each CPU.
 */
package ti.catalog.c6000 [1,0,0,0] {
    interface ICacheInfo;
    interface ITMS320C6x0x, ITMS320C6x1x;
    interface ITMS320C64_1M, ITMS320C64_128K, ITMS320C64_256K, ITMS320C64_512K;
    interface IAntara, IDaVinci, IHimalaya;
    interface ITMS320C642x;
    interface ITMS320CTCI648x, ITMS320CTCI6484, ITMS320CTCI6486;
    interface ITMS320CTCI6497;
    interface ITMS320TCI6608, ITMS320TCI6616;
    interface ITMS320CDRx40x, ITMS320CDRA44x, ITMS320CDRA45x;
    interface ITMS320DA8xx;
    interface ITMS320C6452, ITMS320CDM6467;
    module TMS320C6452, TMS320CDM647, TMS320CDM648, TMS320CTNETV2685;
    module TMS320C6428;
    module TMS320C6711;
    module TMS320C6711B;
    module TMS320C6712;
    module TMS320C6713;
    module TMS320C6211;
    module TMS320C6211B;
    module TMS320C6410;
    module TMS320C6411;
    module TMS320C6412;
    module TMS320C6413;
    module TMS320C6414;
    module TMS320C6415;
    module TMS320C6416;
    module TMS320C6418;
    module TMS320C6421, TMS320C6424;
    module TMS320CDM640;
    module TMS320CDM641;
    module TMS320CDM642;
    module TMS320CDA700;
    module TMS320CDA705;
    module TMS320CDA707;
    module TMS320CDA710;
    module TMS320CDA700SIM;
    module TMS320CDRA442, TMS320CDRA444, TMS320CDRA446, TMS320CDRA447;
    module TMS320CDRA457, TMS320CDRA459;
    module TMS320C6722, TMS320C6726, TMS320C6727;
    module TMS320CDM415;
    module TMS320CDM420;
    module TMS320CDM421;
    module TMS320CDM425;
    module TMS320CDM426;
    module TMS320CDM6431, TMS320CDM6433, TMS320CDM6435, TMS320CDM6437;
    module TMS320CDM6441, TMS320CDM6443;
    module TMS320CDM6446, TMS320DM357;
    module TMS320CDM6467;
    module TMS320CDRI300;
    module TMS320CTCI6482, TMS320CTCI6484;
    module TMS320CTCI6486;
    module TMS320TCI6485, TMS320CTCI6487, TMS320CTCI6488, TMS320TCI6489;
    module TMS320CTCI6498;
    module TMS320TCI6608, TMS320TCI6614, TMS320TCI6616, TMS320TCI6618;
    module TMS320C6670, TMS320C6671, TMS320C6672, TMS320C6674, TMS320C6678;
    module Kepler;
    module TMS320C6454, TMS320C6455;
    module TMS320C2430;
    module TMS320C3430;
    module TMS320C6701, TMS320C6201, TMS320C6202, TMS320C6203, TMS320C6203B;
    module TMS320C6204;
    module TMS320C6205;
    module TMS320CDRA406, TMS320CDRA402, TMS320CDRA404;
    module TMS320CDRA414, TMS320CDRA416;
    module TMS320CF761990;

    interface IOMAP2x3x, IOMAP3xxx;
    module OMAP2431, OMAP2530, OMAP2531, OMAP3425, OMAP3525, OMAP3530, OMAP4430, OMAP5430;
    module TMS320DA802, TMS320DA803, TMS320DA804;
    module TMS320DA805, TMS320DA807, TMS320DA808, TMS320DA810;
    module TMS320DA828, TMS320DA830;
    module TMS320C6472, TMS320C6474;
    module TMS320C6747, TMS320C6745, TMS320C6743;
    module OMAPL137, OMAPL138;
    module TMS320C6457;
    module TMS320DA840, TMS320DA850;
    module TMS320C6742, TMS320C6746, TMS320C6748;
    module TNETV107X;

    interface ITI8168;
    module TMS320TI816X;
    module TMS320CDM740, TMS320CDM730, TMS320DM8168;
    module TMS320C6A8168;

    interface ITI8148;
    module TMS320TI814X;
    module TMS320DM8148;

    interface ITI811X;
    module TMS320TI811X;

    module Arctic;
    module TMS320C6A8149;

    interface ITMS320C6655;
    module TMS320C6654;
    module TMS320C6655;
    module TMS320C6657;

    module Vayu;
    module DRA7XX;
    module TDA3XX;

    interface ITMS320TCI663x;
    module TMS320TCI6634;
    module TMS320TCI6636;
    module TMS320TCI6638;
    module TMS320TCI6630K2L;
    module TMS320C66AK2H06;
    module TMS320C66AK2H12;
    module TMS320C66AK2E02;
    module TMS320C66AK2E05;
    module TCI66AK2G02;

    interface IC6x;
    module C64;
    module C64P;
    module C66;
    module C67;
    module C674;

    module DM37XX;
}

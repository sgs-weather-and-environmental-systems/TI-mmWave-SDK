/* ============================================================================ */
/* Copyright (c) 2014, Texas Instruments Incorporated                           */
/*  All rights reserved.                                                        */
/*                                                                              */
/*  Redistribution and use in source and binary forms, with or without          */
/*  modification, are permitted provided that the following conditions          */
/*  are met:                                                                    */
/*                                                                              */
/*  *  Redistributions of source code must retain the above copyright           */
/*     notice, this list of conditions and the following disclaimer.            */
/*                                                                              */
/*  *  Redistributions in binary form must reproduce the above copyright        */
/*     notice, this list of conditions and the following disclaimer in the      */
/*     documentation and/or other materials provided with the distribution.     */
/*                                                                              */
/*  *  Neither the name of Texas Instruments Incorporated nor the names of      */
/*     its contributors may be used to endorse or promote products derived      */
/*     from this software without specific prior written permission.            */
/*                                                                              */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" */
/*  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,       */
/*  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR      */
/*  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR            */
/*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,       */
/*  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,         */
/*  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; */
/*  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,    */
/*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR     */
/*  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,              */
/*  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          */
/* ============================================================================ */

/******************************************************************************/
/* msp430c315.cmd                                                             */
/*    - Linker Command File for defintions in the header file                 */
/*    Please do not change !                                                  */
/*                                                                            */
/******************************************************************************/
/* Version: 1.121                                                             */
/******************************************************************************/


/************************************************************
* STANDARD BITS
************************************************************/
/************************************************************
* STATUS REGISTER BITS
************************************************************/
/************************************************************
* PERIPHERAL FILE MAP
************************************************************/
/************************************************************
* SPECIAL FUNCTION REGISTER ADDRESSES + CONTROL BITS
************************************************************/
IE1                = 0x0000;
IFG1               = 0x0002;
IE2                = 0x0001;
IFG2               = 0x0003;
/************************************************************
* WATCHDOG TIMER
************************************************************/
WDTCTL             = 0x0120;
/************************************************************
* DIGITAL I/O PORT0
************************************************************/
P0IN               = 0x0010;
P0OUT              = 0x0011;
P0DIR              = 0x0012;
P0IFG              = 0x0013;
P0IES              = 0x0014;
P0IE               = 0x0015;
/************************************************************
* LCD REGISTER
************************************************************/
LCDCTL             = 0x0030;
LCDM1              = 0x0031;
LCDM2              = 0x0032;
LCDM3              = 0x0033;
LCDM4              = 0x0034;
LCDM5              = 0x0035;
LCDM6              = 0x0036;
LCDM7              = 0x0037;
LCDM8              = 0x0038;
LCDM9              = 0x0039;
LCDM10             = 0x003A;
LCDM11             = 0x003B;
LCDM12             = 0x003C;
LCDM13             = 0x003D;
LCDM14             = 0x003E;
LCDM15             = 0x003F;
/************************************************************
* BASIC TIMER
************************************************************/
BTCTL              = 0x0040;
BTCNT1             = 0x0046;
BTCNT2             = 0x0047;
/************************************************************
* SYSTEM CLOCK GENERATOR
************************************************************/
SCFI0              = 0x0050;
SCFI1              = 0x0051;
SCFQCTL            = 0x0052;
CBCTL              = 0x0053;
/************************************************************
* 8BIT TIMER/COUNTER
************************************************************/
TCCTL              = 0x0042;
TCPLD              = 0x0043;
TCDAT              = 0x0044;
/************************************************************
* TIMER/PORT
************************************************************/
TPCTL              = 0x004B;
TPCNT1             = 0x004C;
TPCNT2             = 0x004D;
TPD                = 0x004E;
TPE                = 0x004F;
/* Source select of clock input coded with Bits 6-7 in TPE
   NOTE: If the control bit B16 in TPD is set, TPSSEL2/3
         are 'don't care' and the clock source of counter
         TPCNT2 is the same as of the counter TPCNT1. */
/************************************************************
* EPROM CONTROL
************************************************************/
EPCTL              = 0x0054;
/************************************************************
* Interrupt Vectors (offset from 0xFFE0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

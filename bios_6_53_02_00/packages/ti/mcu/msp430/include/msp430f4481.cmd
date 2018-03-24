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
/* msp430f4481.cmd                                                            */
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
ME1                = 0x0004;
IE2                = 0x0001;
IFG2               = 0x0003;
ME2                = 0x0005;
/************************************************************
* BASIC TIMER
************************************************************/
BTCTL              = 0x0040;
BTCNT1             = 0x0046;
BTCNT2             = 0x0047;
/************************************************************
* Comparator A
************************************************************/
CACTL1             = 0x0059;
CACTL2             = 0x005A;
CAPD               = 0x005B;
/*************************************************************
* Flash Memory
*************************************************************/
FCTL1              = 0x0128;
FCTL2              = 0x012A;
FCTL3              = 0x012C;
/************************************************************
* SYSTEM CLOCK, FLL+
************************************************************/
SCFI0              = 0x0050;
SCFI1              = 0x0051;
SCFQCTL            = 0x0052;
FLL_CTL0           = 0x0053;
FLL_CTL1           = 0x0054;
/************************************************************
* LCD
************************************************************/
LCDCTL             = 0x0090;
LCDM1              = 0x0091;
LCDM2              = 0x0092;
LCDM3              = 0x0093;
LCDM4              = 0x0094;
LCDM5              = 0x0095;
LCDM6              = 0x0096;
LCDM7              = 0x0097;
LCDM8              = 0x0098;
LCDM9              = 0x0099;
LCDM10             = 0x009A;
LCDM11             = 0x009B;
LCDM12             = 0x009C;
LCDM13             = 0x009D;
LCDM14             = 0x009E;
LCDM15             = 0x009F;
LCDM16             = 0x00A0;
LCDM17             = 0x00A1;
LCDM18             = 0x00A2;
LCDM19             = 0x00A3;
LCDM20             = 0x00A4;
/************************************************************
* HARDWARE MULTIPLIER
************************************************************/
MPY                = 0x0130;
MPYS               = 0x0132;
MAC                = 0x0134;
MACS               = 0x0136;
OP2                = 0x0138;
RESLO              = 0x013A;
RESHI              = 0x013C;
SUMEXT             = 0x013E;
/************************************************************
* DIGITAL I/O Port1/2
************************************************************/
P1IN               = 0x0020;
P1OUT              = 0x0021;
P1DIR              = 0x0022;
P1IFG              = 0x0023;
P1IES              = 0x0024;
P1IE               = 0x0025;
P1SEL              = 0x0026;
P2IN               = 0x0028;
P2OUT              = 0x0029;
P2DIR              = 0x002A;
P2IFG              = 0x002B;
P2IES              = 0x002C;
P2IE               = 0x002D;
P2SEL              = 0x002E;
/************************************************************
* DIGITAL I/O Port3/4
************************************************************/
P3IN               = 0x0018;
P3OUT              = 0x0019;
P3DIR              = 0x001A;
P3SEL              = 0x001B;
P4IN               = 0x001C;
P4OUT              = 0x001D;
P4DIR              = 0x001E;
P4SEL              = 0x001F;
/************************************************************
* DIGITAL I/O Port5/6
************************************************************/
P5IN               = 0x0030;
P5OUT              = 0x0031;
P5DIR              = 0x0032;
P5SEL              = 0x0033;
P6IN               = 0x0034;
P6OUT              = 0x0035;
P6DIR              = 0x0036;
P6SEL              = 0x0037;
/************************************************************
* Brown-Out, Supply Voltage Supervision (SVS)
************************************************************/
SVSCTL             = 0x0056;
/************************************************************
* USART
************************************************************/
/************************************************************
* USART 0
************************************************************/
U0CTL              = 0x0070;
U0TCTL             = 0x0071;
U0RCTL             = 0x0072;
U0MCTL             = 0x0073;
U0BR0              = 0x0074;
U0BR1              = 0x0075;
U0RXBUF            = 0x0076;
U0TXBUF            = 0x0077;
/************************************************************
* USART 1
************************************************************/
U1CTL              = 0x0078;
U1TCTL             = 0x0079;
U1RCTL             = 0x007A;
U1MCTL             = 0x007B;
U1BR0              = 0x007C;
U1BR1              = 0x007D;
U1RXBUF            = 0x007E;
U1TXBUF            = 0x007F;
/************************************************************
* Timer A3
************************************************************/
TAIV               = 0x012E;
TACTL              = 0x0160;
TACCTL0            = 0x0162;
TACCTL1            = 0x0164;
TACCTL2            = 0x0166;
TAR                = 0x0170;
TACCR0             = 0x0172;
TACCR1             = 0x0174;
TACCR2             = 0x0176;
/************************************************************
* Timer B7
************************************************************/
TBIV               = 0x011E;
TBCTL              = 0x0180;
TBCCTL0            = 0x0182;
TBCCTL1            = 0x0184;
TBCCTL2            = 0x0186;
TBCCTL3            = 0x0188;
TBCCTL4            = 0x018A;
TBCCTL5            = 0x018C;
TBCCTL6            = 0x018E;
TBR                = 0x0190;
TBCCR0             = 0x0192;
TBCCR1             = 0x0194;
TBCCR2             = 0x0196;
TBCCR3             = 0x0198;
TBCCR4             = 0x019A;
TBCCR5             = 0x019C;
TBCCR6             = 0x019E;
/************************************************************
* WATCHDOG TIMER
************************************************************/
WDTCTL             = 0x0120;
/************************************************************
* Interrupt Vectors (offset from 0xFFE0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

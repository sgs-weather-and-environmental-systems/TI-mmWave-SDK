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
/* msp430fg4270.cmd                                                           */
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
* BASIC TIMER
************************************************************/
BTCTL              = 0x0040;
BTCNT1             = 0x0046;
BTCNT2             = 0x0047;
/************************************************************
* SYSTEM CLOCK, FLL+ (x41x)
************************************************************/
SCFI0              = 0x0050;
SCFI1              = 0x0051;
SCFQCTL            = 0x0052;
FLL_CTL0           = 0x0053;
FLL_CTL1           = 0x0054;
/************************************************************
* LCD_A
************************************************************/
LCDACTL            = 0x0090;
LCDAPCTL0          = 0x00AC;
LCDAPCTL1          = 0x00AD;
LCDAVCTL0          = 0x00AE;
LCDAVCTL1          = 0x00AF;
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
/*************************************************************
* Flash Memory
*************************************************************/
FCTL1              = 0x0128;
FCTL2              = 0x012A;
FCTL3              = 0x012C;
/************************************************************
* SD16_A1 - Sigma Delta 16 Bit
************************************************************/
SD16INCTL0         = 0x00B0;
SD16AE             = 0x00B7;
SD16CONF0          = 0x00F7;
SD16CONF1          = 0x00BF;
                                      /* Please use only the recommended settings */
SD16CTL            = 0x0100;
SD16CCTL0          = 0x0102;
SD16IV             = 0x0110;
SD16MEM0           = 0x0112;
/************************************************************
* DAC12
************************************************************/
DAC12_0CTL         = 0x01C0;
DAC12_0DAT         = 0x01C8;
/************************************************************
* Operational Amplifier
************************************************************/
OA0CTL0            = 0x00C0;
OA0CTL1            = 0x00C1;
OA1CTL0            = 0x00C2;
OA1CTL1            = 0x00C3;
SWCTL              = 0x00CF;
/************************************************************
* Interrupt Vectors (offset from 0xFFE0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

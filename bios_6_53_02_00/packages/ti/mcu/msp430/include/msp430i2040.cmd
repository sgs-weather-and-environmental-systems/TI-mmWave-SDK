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
/* msp430i2040.cmd                                                            */
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
* CPU
************************************************************/
/************************************************************
* PERIPHERAL FILE MAP
************************************************************/
/************************************************************
* SPECIAL FUNCTION REGISTER ADDRESSES + CONTROL BITS
************************************************************/
IE1                = 0x0000;
IFG1               = 0x0002;
SYSJTAGDIS         = 0x01FE;
/************************************************************
* CLOCK SYSTEM
************************************************************/
CSCTL0             = 0x0050;
CSCTL1             = 0x0051;
CSIRFCAL           = 0x0052;
CSIRTCAL           = 0x0053;
CSERFCAL           = 0x0054;
CSERTCAL           = 0x0055;
/*************************************************************
* Flash Memory
*************************************************************/
FCTL1              = 0x0128;
FCTL2              = 0x012A;
FCTL3              = 0x012C;
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
* PMM - Power Management System
************************************************************/
LPM45CTL           = 0x0060;
VMONCTL            = 0x0061;
REFCAL0            = 0x0062;
REFCAL1            = 0x0063;
/************************************************************
* DIGITAL I/O Port1_2
************************************************************/
P1IN               = 0x0010;
P1OUT              = 0x0012;
P1DIR              = 0x0014;
P1SEL0             = 0x001A;
P1SEL1             = 0x001C;
P1IV               = 0x001E;
P1IES              = 0x0028;
P1IE               = 0x002A;
P1IFG              = 0x002C;
P2IN               = 0x0011;
P2OUT              = 0x0013;
P2DIR              = 0x0015;
P2SEL0             = 0x001B;
P2SEL1             = 0x001D;
P2IV               = 0x002E;
P2IES              = 0x0029;
P2IE               = 0x002B;
P2IFG              = 0x002D;
/************************************************************
* SD24_4 - Sigma Delta 24 Bit
************************************************************/
SD24INCTL0         = 0x00B0;
SD24INCTL1         = 0x00B1;
SD24INCTL2         = 0x00B2;
SD24INCTL3         = 0x00B3;
SD24PRE0           = 0x00B8;
SD24PRE1           = 0x00B9;
SD24PRE2           = 0x00BA;
SD24PRE3           = 0x00BB;
SD24TRIM           = 0x00BF;
SD24CTL            = 0x0100;
SD24CCTL0          = 0x0102;
SD24CCTL1          = 0x0104;
SD24CCTL2          = 0x0106;
SD24CCTL3          = 0x0108;
SD24MEM0           = 0x0110;
SD24MEM1           = 0x0112;
SD24MEM2           = 0x0114;
SD24MEM3           = 0x0116;
SD24IV             = 0x01F0;
/************************************************************
* Timer0_A3
************************************************************/
TA0IV              = 0x012E;
TA0CTL             = 0x0160;
TA0CCTL0           = 0x0162;
TA0CCTL1           = 0x0164;
TA0CCTL2           = 0x0166;
TA0R               = 0x0170;
TA0CCR0            = 0x0172;
TA0CCR1            = 0x0174;
TA0CCR2            = 0x0176;
/************************************************************
* Timer1_A3
************************************************************/
TA1IV              = 0x011E;
TA1CTL             = 0x0180;
TA1CCTL0           = 0x0182;
TA1CCTL1           = 0x0184;
TA1CCTL2           = 0x0186;
TA1R               = 0x0190;
TA1CCR0            = 0x0192;
TA1CCR1            = 0x0194;
TA1CCR2            = 0x0196;
/************************************************************
* USCI A0
************************************************************/
UCA0CTLW0          = 0x0140;
UCA0CTLW0_L        = 0x0140;
UCA0CTLW0_H        = 0x0141;
UCA0CTLW1          = 0x0142;
UCA0CTLW1_L        = 0x0142;
UCA0CTLW1_H        = 0x0143;
UCA0BRW            = 0x0146;
UCA0BRW_L          = 0x0146;
UCA0BRW_H          = 0x0147;
UCA0MCTLW          = 0x0148;
UCA0MCTLW_L        = 0x0148;
UCA0MCTLW_H        = 0x0149;
UCA0STATW          = 0x014A;
UCA0RXBUF          = 0x014C;
UCA0RXBUF_L        = 0x014C;
UCA0RXBUF_H        = 0x014D;
UCA0TXBUF          = 0x014E;
UCA0TXBUF_L        = 0x014E;
UCA0TXBUF_H        = 0x014F;
UCA0ABCTL          = 0x0150;
UCA0IRCTL          = 0x0152;
UCA0IRCTL_L        = 0x0152;
UCA0IRCTL_H        = 0x0153;
UCA0IE             = 0x015A;
UCA0IE_L           = 0x015A;
UCA0IE_H           = 0x015B;
UCA0IFG            = 0x015C;
UCA0IFG_L          = 0x015C;
UCA0IFG_H          = 0x015D;
UCA0IV             = 0x015E;
/************************************************************
* USCI B0
************************************************************/
UCB0CTLW0          = 0x01C0;
UCB0CTLW0_L        = 0x01C0;
UCB0CTLW0_H        = 0x01C1;
UCB0CTLW1          = 0x01C2;
UCB0CTLW1_L        = 0x01C2;
UCB0CTLW1_H        = 0x01C3;
UCB0BRW            = 0x01C6;
UCB0BRW_L          = 0x01C6;
UCB0BRW_H          = 0x01C7;
UCB0STATW          = 0x01C8;
UCB0STATW_L        = 0x01C8;
UCB0STATW_H        = 0x01C9;
UCB0TBCNT          = 0x01CA;
UCB0TBCNT_L        = 0x01CA;
UCB0TBCNT_H        = 0x01CB;
UCB0RXBUF          = 0x01CC;
UCB0RXBUF_L        = 0x01CC;
UCB0RXBUF_H        = 0x01CD;
UCB0TXBUF          = 0x01CE;
UCB0TXBUF_L        = 0x01CE;
UCB0TXBUF_H        = 0x01CF;
UCB0I2COA0         = 0x01D4;
UCB0I2COA0_L       = 0x01D4;
UCB0I2COA0_H       = 0x01D5;
UCB0I2COA1         = 0x01D6;
UCB0I2COA1_L       = 0x01D6;
UCB0I2COA1_H       = 0x01D7;
UCB0I2COA2         = 0x01D8;
UCB0I2COA2_L       = 0x01D8;
UCB0I2COA2_H       = 0x01D9;
UCB0I2COA3         = 0x01DA;
UCB0I2COA3_L       = 0x01DA;
UCB0I2COA3_H       = 0x01DB;
UCB0ADDRX          = 0x01DC;
UCB0ADDRX_L        = 0x01DC;
UCB0ADDRX_H        = 0x01DD;
UCB0ADDMASK        = 0x01DE;
UCB0ADDMASK_L      = 0x01DE;
UCB0ADDMASK_H      = 0x01DF;
UCB0I2CSA          = 0x01E0;
UCB0I2CSA_L        = 0x01E0;
UCB0I2CSA_H        = 0x01E1;
UCB0IE             = 0x01EA;
UCB0IE_L           = 0x01EA;
UCB0IE_H           = 0x01EB;
UCB0IFG            = 0x01EC;
UCB0IFG_L          = 0x01EC;
UCB0IFG_H          = 0x01ED;
UCB0IV             = 0x01EE;
/************************************************************
* WATCHDOG TIMER
************************************************************/
WDTCTL             = 0x0120;
/************************************************************
* TLV Descriptors
************************************************************/
/************************************************************
* Interrupt Vectors (offset from 0xFFE0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

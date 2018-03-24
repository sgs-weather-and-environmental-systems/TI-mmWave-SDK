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
/* msp430f2418.cmd                                                            */
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
IE2                = 0x0001;
IFG2               = 0x0003;
UC1IE              = 0x0006;
UC1IFG             = 0x0007;
/************************************************************
* ADC12
************************************************************/
ADC12CTL0          = 0x01A0;
ADC12CTL1          = 0x01A2;
ADC12IFG           = 0x01A4;
ADC12IE            = 0x01A6;
ADC12IV            = 0x01A8;
ADC12MEM0          = 0x0140;
ADC12MEM1          = 0x0142;
ADC12MEM2          = 0x0144;
ADC12MEM3          = 0x0146;
ADC12MEM4          = 0x0148;
ADC12MEM5          = 0x014A;
ADC12MEM6          = 0x014C;
ADC12MEM7          = 0x014E;
ADC12MEM8          = 0x0150;
ADC12MEM9          = 0x0152;
ADC12MEM10         = 0x0154;
ADC12MEM11         = 0x0156;
ADC12MEM12         = 0x0158;
ADC12MEM13         = 0x015A;
ADC12MEM14         = 0x015C;
ADC12MEM15         = 0x015E;
ADC12MCTL0         = 0x0080;
ADC12MCTL1         = 0x0081;
ADC12MCTL2         = 0x0082;
ADC12MCTL3         = 0x0083;
ADC12MCTL4         = 0x0084;
ADC12MCTL5         = 0x0085;
ADC12MCTL6         = 0x0086;
ADC12MCTL7         = 0x0087;
ADC12MCTL8         = 0x0088;
ADC12MCTL9         = 0x0089;
ADC12MCTL10        = 0x008A;
ADC12MCTL11        = 0x008B;
ADC12MCTL12        = 0x008C;
ADC12MCTL13        = 0x008D;
ADC12MCTL14        = 0x008E;
ADC12MCTL15        = 0x008F;
/************************************************************
* Basic Clock Module
************************************************************/
DCOCTL             = 0x0056;
BCSCTL1            = 0x0057;
BCSCTL2            = 0x0058;
BCSCTL3            = 0x0053;
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
FCTL4              = 0x01BE;
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
* DIGITAL I/O Port1/2 Pull up / Pull down Resistors
************************************************************/
P1IN               = 0x0020;
P1OUT              = 0x0021;
P1DIR              = 0x0022;
P1IFG              = 0x0023;
P1IES              = 0x0024;
P1IE               = 0x0025;
P1SEL              = 0x0026;
P1REN              = 0x0027;
P2IN               = 0x0028;
P2OUT              = 0x0029;
P2DIR              = 0x002A;
P2IFG              = 0x002B;
P2IES              = 0x002C;
P2IE               = 0x002D;
P2SEL              = 0x002E;
P2REN              = 0x002F;
/************************************************************
* DIGITAL I/O Port3/4 Pull up / Pull down Resistors
************************************************************/
P3IN               = 0x0018;
P3OUT              = 0x0019;
P3DIR              = 0x001A;
P3SEL              = 0x001B;
P3REN              = 0x0010;
P4IN               = 0x001C;
P4OUT              = 0x001D;
P4DIR              = 0x001E;
P4SEL              = 0x001F;
P4REN              = 0x0011;
/************************************************************
* DIGITAL I/O Port5/6 Pull up / Pull down Resistors
************************************************************/
P5IN               = 0x0030;
P5OUT              = 0x0031;
P5DIR              = 0x0032;
P5SEL              = 0x0033;
P5REN              = 0x0012;
P6IN               = 0x0034;
P6OUT              = 0x0035;
P6DIR              = 0x0036;
P6SEL              = 0x0037;
P6REN              = 0x0013;
/************************************************************
* DIGITAL I/O Port7/8 Pull up / Pull down Resistors
************************************************************/
P7IN               = 0x0038;
P7OUT              = 0x003A;
P7DIR              = 0x003C;
P7SEL              = 0x003E;
P7REN              = 0x0014;
P8IN               = 0x0039;
P8OUT              = 0x003B;
P8DIR              = 0x003D;
P8SEL              = 0x003F;
P8REN              = 0x0015;
PAIN               = 0x0038;
PAOUT              = 0x003A;
PADIR              = 0x003C;
PASEL              = 0x003E;
PAREN              = 0x0014;
/************************************************************
* Brown-Out, Supply Voltage Supervision (SVS)
************************************************************/
SVSCTL             = 0x0055;
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
* USCI
************************************************************/
UCA0CTL0           = 0x0060;
UCA0CTL1           = 0x0061;
UCA0BR0            = 0x0062;
UCA0BR1            = 0x0063;
UCA0MCTL           = 0x0064;
UCA0STAT           = 0x0065;
UCA0RXBUF          = 0x0066;
UCA0TXBUF          = 0x0067;
UCA0ABCTL          = 0x005D;
UCA0IRTCTL         = 0x005E;
UCA0IRRCTL         = 0x005F;
UCB0CTL0           = 0x0068;
UCB0CTL1           = 0x0069;
UCB0BR0            = 0x006A;
UCB0BR1            = 0x006B;
UCB0I2CIE          = 0x006C;
UCB0STAT           = 0x006D;
UCB0RXBUF          = 0x006E;
UCB0TXBUF          = 0x006F;
UCB0I2COA          = 0x0118;
UCB0I2CSA          = 0x011A;
UCA1CTL0           = 0x00D0;
UCA1CTL1           = 0x00D1;
UCA1BR0            = 0x00D2;
UCA1BR1            = 0x00D3;
UCA1MCTL           = 0x00D4;
UCA1STAT           = 0x00D5;
UCA1RXBUF          = 0x00D6;
UCA1TXBUF          = 0x00D7;
UCA1ABCTL          = 0x00CD;
UCA1IRTCTL         = 0x00CE;
UCA1IRRCTL         = 0x00CF;
UCB1CTL0           = 0x00D8;
UCB1CTL1           = 0x00D9;
UCB1BR0            = 0x00DA;
UCB1BR1            = 0x00DB;
UCB1I2CIE          = 0x00DC;
UCB1STAT           = 0x00DD;
UCB1RXBUF          = 0x00DE;
UCB1TXBUF          = 0x00DF;
UCB1I2COA          = 0x017C;
UCB1I2CSA          = 0x017E;
/************************************************************
* WATCHDOG TIMER
************************************************************/
WDTCTL             = 0x0120;
/************************************************************
* Calibration Data in Info Mem
************************************************************/
TLV_CHECKSUM       = 0x10C0;
TLV_DCO_30_TAG     = 0x10F6;
TLV_DCO_30_LEN     = 0x10F7;
TLV_ADC12_1_TAG    = 0x10DA;
TLV_ADC12_1_LEN    = 0x10DB;
/************************************************************
* Calibration Data in Info Mem
************************************************************/
CALDCO_16MHZ       = 0x10F8;
CALBC1_16MHZ       = 0x10F9;
CALDCO_12MHZ       = 0x10FA;
CALBC1_12MHZ       = 0x10FB;
CALDCO_8MHZ        = 0x10FC;
CALBC1_8MHZ        = 0x10FD;
CALDCO_1MHZ        = 0x10FE;
CALBC1_1MHZ        = 0x10FF;
/************************************************************
* Interrupt Vectors (offset from 0xFFC0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

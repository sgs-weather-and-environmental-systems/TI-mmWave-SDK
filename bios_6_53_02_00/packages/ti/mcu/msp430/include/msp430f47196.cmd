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
/* msp430f47196.cmd                                                           */
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
* BASIC TIMER with Real Time Clock
************************************************************/
BTCTL              = 0x0040;
RTCCTL             = 0x0041;
RTCNT1             = 0x0042;
RTCNT2             = 0x0043;
RTCNT3             = 0x0044;
RTCNT4             = 0x0045;
BTCNT1             = 0x0046;
BTCNT2             = 0x0047;
RTCDAY             = 0x004C;
RTCMON             = 0x004D;
RTCYEARL           = 0x004E;
RTCYEARH           = 0x004F;
RTCTL              = 0x0040;
RTCTIM0            = 0x0042;
RTCTIM1            = 0x0044;
BTCNT12            = 0x0046;
RTCDATE            = 0x004C;
RTCYEAR            = 0x004E;
/************************************************************
* Comparator A
************************************************************/
CACTL1             = 0x0059;
CACTL2             = 0x005A;
CAPD               = 0x005B;
/************************************************************
* DMA_X
************************************************************/
DMACTL0            = 0x0122;
DMACTL1            = 0x0124;
DMAIV              = 0x0126;
DMA0CTL            = 0x01D0;
DMA1CTL            = 0x01DC;
DMA2CTL            = 0x01E8;
DMA0SA             = 0x01D2;
DMA0SAL            = 0x01D2;
DMA0DA             = 0x01D6;
DMA0DAL            = 0x01D6;
DMA0SZ             = 0x01DA;
DMA1SA             = 0x01DE;
DMA1SAL            = 0x01DE;
DMA1DA             = 0x01E2;
DMA1DAL            = 0x01E2;
DMA1SZ             = 0x01E6;
DMA2SA             = 0x01EA;
DMA2SAL            = 0x01EA;
DMA2DA             = 0x01EE;
DMA2DAL            = 0x01EE;
DMA2SZ             = 0x01F2;
/*************************************************************
* Flash Memory
*************************************************************/
FCTL1              = 0x0128;
FCTL2              = 0x012A;
FCTL3              = 0x012C;
FCTL4              = 0x01BE;
/************************************************************
* SYSTEM CLOCK, FLL+
************************************************************/
SCFI0              = 0x0050;
SCFI1              = 0x0051;
SCFQCTL            = 0x0052;
FLL_CTL0           = 0x0053;
FLL_CTL1           = 0x0054;
FLL_CTL2           = 0x0055;
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
* HARDWARE MULTIPLIER 32Bit
************************************************************/
MPY_B              = 0x0130;
MPYS_B             = 0x0132;
MAC_B              = 0x0134;
MACS_B             = 0x0136;
OP2_B              = 0x0138;
MPY                = 0x0130;
MPYS               = 0x0132;
MAC                = 0x0134;
MACS               = 0x0136;
OP2                = 0x0138;
RESLO              = 0x013A;
RESHI              = 0x013C;
SUMEXT             = 0x013E;
MPY32L_B           = 0x0140;
MPY32H_B           = 0x0142;
MPYS32L_B          = 0x0144;
MPYS32H_B          = 0x0146;
MAC32L_B           = 0x0148;
MAC32H_B           = 0x014A;
MACS32L_B          = 0x014C;
MACS32H_B          = 0x014E;
OP2L_B             = 0x0150;
OP2H_B             = 0x0152;
MPY32L             = 0x0140;
MPY32H             = 0x0142;
MPYS32L            = 0x0144;
MPYS32H            = 0x0146;
MAC32L             = 0x0148;
MAC32H             = 0x014A;
MACS32L            = 0x014C;
MACS32H            = 0x014E;
OP2L               = 0x0150;
OP2H               = 0x0152;
RES0               = 0x0154;
RES1               = 0x0156;
RES2               = 0x0158;
RES3               = 0x015A;
MPY32CTL0          = 0x015C;
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
* DIGITAL I/O Port5 Pull up / Pull down Resistors
************************************************************/
P5IN               = 0x0030;
P5OUT              = 0x0031;
P5DIR              = 0x0032;
P5SEL              = 0x0033;
P5REN              = 0x0012;
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
* DIGITAL I/O Port9/10 Pull up / Pull down Resistors
************************************************************/
P9IN               = 0x0008;
P9OUT              = 0x000A;
P9DIR              = 0x000C;
P9SEL              = 0x000E;
P9REN              = 0x0016;
P10IN              = 0x0009;
P10OUT             = 0x000B;
P10DIR             = 0x000D;
P10SEL             = 0x000F;
P10REN             = 0x0017;
PBIN               = 0x0008;
PBOUT              = 0x000A;
PBDIR              = 0x000C;
PBSEL              = 0x000E;
PBREN              = 0x0016;
/************************************************************
* Brown-Out, Supply Voltage Supervision (SVS)
************************************************************/
SVSCTL             = 0x0056;
/************************************************************
* SD16_A6 - Sigma Delta 16 Bit
************************************************************/
SD16INCTL0         = 0x00B0;
SD16INCTL1         = 0x00B1;
SD16INCTL2         = 0x00B2;
SD16INCTL3         = 0x00B3;
SD16INCTL4         = 0x00B4;
SD16INCTL5         = 0x00B5;
SD16PRE0           = 0x00B8;
SD16PRE1           = 0x00B9;
SD16PRE2           = 0x00BA;
SD16PRE3           = 0x00BB;
SD16PRE4           = 0x00BC;
SD16PRE5           = 0x00BD;
SD16CONF0          = 0x00B7;
SD16CONF1          = 0x00BF;
                                      /* Please use only the recommended settings */
SD16CTL            = 0x0100;
SD16CCTL0          = 0x0102;
SD16CCTL1          = 0x0104;
SD16CCTL2          = 0x0106;
SD16CCTL3          = 0x0108;
SD16CCTL4          = 0x010A;
SD16CCTL5          = 0x010C;
SD16MEM0           = 0x0110;
SD16MEM1           = 0x0112;
SD16MEM2           = 0x0114;
SD16MEM3           = 0x0116;
SD16MEM4           = 0x0118;
SD16MEM5           = 0x011A;
SD16IV             = 0x01AE;
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
* Timer B3
************************************************************/
TBIV               = 0x011E;
TBCTL              = 0x0180;
TBCCTL0            = 0x0182;
TBCCTL1            = 0x0184;
TBCCTL2            = 0x0186;
TBR                = 0x0190;
TBCCR0             = 0x0192;
TBCCR1             = 0x0194;
TBCCR2             = 0x0196;
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
UCB0I2COA          = 0x016C;
UCB0I2CSA          = 0x016E;
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
* Interrupt Vectors (offset from 0xFFC0)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

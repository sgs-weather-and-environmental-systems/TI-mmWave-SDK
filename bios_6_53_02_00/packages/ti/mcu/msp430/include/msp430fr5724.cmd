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
/* msp430fr5724.cmd                                                           */
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
* ADC10_B
************************************************************/
ADC10CTL0          = 0x0700;
ADC10CTL0_L        = 0x0700;
ADC10CTL0_H        = 0x0701;
ADC10CTL1          = 0x0702;
ADC10CTL1_L        = 0x0702;
ADC10CTL1_H        = 0x0703;
ADC10CTL2          = 0x0704;
ADC10CTL2_L        = 0x0704;
ADC10CTL2_H        = 0x0705;
ADC10LO            = 0x0706;
ADC10LO_L          = 0x0706;
ADC10LO_H          = 0x0707;
ADC10HI            = 0x0708;
ADC10HI_L          = 0x0708;
ADC10HI_H          = 0x0709;
ADC10MCTL0         = 0x070A;
ADC10MCTL0_L       = 0x070A;
ADC10MCTL0_H       = 0x070B;
ADC10MEM0          = 0x0712;
ADC10MEM0_L        = 0x0712;
ADC10MEM0_H        = 0x0713;
ADC10IE            = 0x071A;
ADC10IE_L          = 0x071A;
ADC10IE_H          = 0x071B;
ADC10IFG           = 0x071C;
ADC10IFG_L         = 0x071C;
ADC10IFG_H         = 0x071D;
ADC10IV            = 0x071E;
ADC10IV_L          = 0x071E;
ADC10IV_H          = 0x071F;
/************************************************************
* CLOCK SYSTEM
************************************************************/
CSCTL0             = 0x0160;
CSCTL0_L           = 0x0160;
CSCTL0_H           = 0x0161;
CSCTL1             = 0x0162;
CSCTL1_L           = 0x0162;
CSCTL1_H           = 0x0163;
CSCTL2             = 0x0164;
CSCTL2_L           = 0x0164;
CSCTL2_H           = 0x0165;
CSCTL3             = 0x0166;
CSCTL3_L           = 0x0166;
CSCTL3_H           = 0x0167;
CSCTL4             = 0x0168;
CSCTL4_L           = 0x0168;
CSCTL4_H           = 0x0169;
CSCTL5             = 0x016A;
CSCTL5_L           = 0x016A;
CSCTL5_H           = 0x016B;
CSCTL6             = 0x016C;
CSCTL6_L           = 0x016C;
CSCTL6_H           = 0x016D;
/************************************************************
* Comparator D
************************************************************/
CDCTL0             = 0x08C0;
CDCTL0_L           = 0x08C0;
CDCTL0_H           = 0x08C1;
CDCTL1             = 0x08C2;
CDCTL1_L           = 0x08C2;
CDCTL1_H           = 0x08C3;
CDCTL2             = 0x08C4;
CDCTL2_L           = 0x08C4;
CDCTL2_H           = 0x08C5;
CDCTL3             = 0x08C6;
CDCTL3_L           = 0x08C6;
CDCTL3_H           = 0x08C7;
CDINT              = 0x08CC;
CDINT_L            = 0x08CC;
CDINT_H            = 0x08CD;
CDIV               = 0x08CE;
CDIV_L             = 0x08CE;
CDIV_H             = 0x08CF;
/*************************************************************
* CRC Module
*************************************************************/
CRCDI              = 0x0150;
CRCDI_L            = 0x0150;
CRCDI_H            = 0x0151;
CRCDIRB            = 0x0152;
CRCDIRB_L          = 0x0152;
CRCDIRB_H          = 0x0153;
CRCINIRES          = 0x0154;
CRCINIRES_L        = 0x0154;
CRCINIRES_H        = 0x0155;
CRCRESR            = 0x0156;
CRCRESR_L          = 0x0156;
CRCRESR_H          = 0x0157;
/************************************************************
* DMA_X
************************************************************/
DMACTL0            = 0x0500;
DMACTL0_L          = 0x0500;
DMACTL0_H          = 0x0501;
DMACTL1            = 0x0502;
DMACTL1_L          = 0x0502;
DMACTL1_H          = 0x0503;
DMACTL2            = 0x0504;
DMACTL2_L          = 0x0504;
DMACTL2_H          = 0x0505;
DMACTL3            = 0x0506;
DMACTL3_L          = 0x0506;
DMACTL3_H          = 0x0507;
DMACTL4            = 0x0508;
DMACTL4_L          = 0x0508;
DMACTL4_H          = 0x0509;
DMAIV              = 0x050E;
DMAIV_L            = 0x050E;
DMAIV_H            = 0x050F;
DMA0CTL            = 0x0510;
DMA0CTL_L          = 0x0510;
DMA0CTL_H          = 0x0511;
DMA0SA             = 0x0512;
DMA0SAL            = 0x0512;
DMA0DA             = 0x0516;
DMA0DAL            = 0x0516;
DMA0SZ             = 0x051A;
DMA1CTL            = 0x0520;
DMA1CTL_L          = 0x0520;
DMA1CTL_H          = 0x0521;
DMA1SA             = 0x0522;
DMA1SAL            = 0x0522;
DMA1DA             = 0x0526;
DMA1DAL            = 0x0526;
DMA1SZ             = 0x052A;
DMA2CTL            = 0x0530;
DMA2CTL_L          = 0x0530;
DMA2CTL_H          = 0x0531;
DMA2SA             = 0x0532;
DMA2SAL            = 0x0532;
DMA2DA             = 0x0536;
DMA2DAL            = 0x0536;
DMA2SZ             = 0x053A;
/*************************************************************
* FRAM Memory
*************************************************************/
FRCTL0             = 0x0140;
FRCTL0_L           = 0x0140;
FRCTL0_H           = 0x0141;
GCCTL0             = 0x0144;
GCCTL0_L           = 0x0144;
GCCTL0_H           = 0x0145;
GCCTL1             = 0x0146;
GCCTL1_L           = 0x0146;
GCCTL1_H           = 0x0147;
/************************************************************
* Memory Protection Unit
************************************************************/
MPUCTL0            = 0x05A0;
MPUCTL0_L          = 0x05A0;
MPUCTL0_H          = 0x05A1;
MPUCTL1            = 0x05A2;
MPUCTL1_L          = 0x05A2;
MPUCTL1_H          = 0x05A3;
MPUSEG             = 0x05A4;
MPUSEG_L           = 0x05A4;
MPUSEG_H           = 0x05A5;
MPUSAM             = 0x05A6;
MPUSAM_L           = 0x05A6;
MPUSAM_H           = 0x05A7;
/************************************************************
* HARDWARE MULTIPLIER 32Bit
************************************************************/
MPY                = 0x04C0;
MPY_L              = 0x04C0;
MPY_H              = 0x04C1;
MPYS               = 0x04C2;
MPYS_L             = 0x04C2;
MPYS_H             = 0x04C3;
MAC                = 0x04C4;
MAC_L              = 0x04C4;
MAC_H              = 0x04C5;
MACS               = 0x04C6;
MACS_L             = 0x04C6;
MACS_H             = 0x04C7;
OP2                = 0x04C8;
OP2_L              = 0x04C8;
OP2_H              = 0x04C9;
RESLO              = 0x04CA;
RESLO_L            = 0x04CA;
RESLO_H            = 0x04CB;
RESHI              = 0x04CC;
RESHI_L            = 0x04CC;
RESHI_H            = 0x04CD;
SUMEXT             = 0x04CE;
SUMEXT_L           = 0x04CE;
SUMEXT_H           = 0x04CF;
MPY32L             = 0x04D0;
MPY32L_L           = 0x04D0;
MPY32L_H           = 0x04D1;
MPY32H             = 0x04D2;
MPY32H_L           = 0x04D2;
MPY32H_H           = 0x04D3;
MPYS32L            = 0x04D4;
MPYS32L_L          = 0x04D4;
MPYS32L_H          = 0x04D5;
MPYS32H            = 0x04D6;
MPYS32H_L          = 0x04D6;
MPYS32H_H          = 0x04D7;
MAC32L             = 0x04D8;
MAC32L_L           = 0x04D8;
MAC32L_H           = 0x04D9;
MAC32H             = 0x04DA;
MAC32H_L           = 0x04DA;
MAC32H_H           = 0x04DB;
MACS32L            = 0x04DC;
MACS32L_L          = 0x04DC;
MACS32L_H          = 0x04DD;
MACS32H            = 0x04DE;
MACS32H_L          = 0x04DE;
MACS32H_H          = 0x04DF;
OP2L               = 0x04E0;
OP2L_L             = 0x04E0;
OP2L_H             = 0x04E1;
OP2H               = 0x04E2;
OP2H_L             = 0x04E2;
OP2H_H             = 0x04E3;
RES0               = 0x04E4;
RES0_L             = 0x04E4;
RES0_H             = 0x04E5;
RES1               = 0x04E6;
RES1_L             = 0x04E6;
RES1_H             = 0x04E7;
RES2               = 0x04E8;
RES2_L             = 0x04E8;
RES2_H             = 0x04E9;
RES3               = 0x04EA;
RES3_L             = 0x04EA;
RES3_H             = 0x04EB;
MPY32CTL0          = 0x04EC;
MPY32CTL0_L        = 0x04EC;
MPY32CTL0_H        = 0x04ED;
/************************************************************
* PMM - Power Management System
************************************************************/
PMMCTL0            = 0x0120;
PMMCTL0_L          = 0x0120;
PMMCTL0_H          = 0x0121;
PMMIFG             = 0x012A;
PMMIFG_L           = 0x012A;
PMMIFG_H           = 0x012B;
PM5CTL0            = 0x0130;
PM5CTL0_L          = 0x0130;
PM5CTL0_H          = 0x0131;
/************************************************************
* DIGITAL I/O Port1/2 Pull up / Pull down Resistors
************************************************************/
PAIN               = 0x0200;
PAIN_L             = 0x0200;
PAIN_H             = 0x0201;
PAOUT              = 0x0202;
PAOUT_L            = 0x0202;
PAOUT_H            = 0x0203;
PADIR              = 0x0204;
PADIR_L            = 0x0204;
PADIR_H            = 0x0205;
PAREN              = 0x0206;
PAREN_L            = 0x0206;
PAREN_H            = 0x0207;
PASEL0             = 0x020A;
PASEL0_L           = 0x020A;
PASEL0_H           = 0x020B;
PASEL1             = 0x020C;
PASEL1_L           = 0x020C;
PASEL1_H           = 0x020D;
PASELC             = 0x0216;
PASELC_L           = 0x0216;
PASELC_H           = 0x0217;
PAIES              = 0x0218;
PAIES_L            = 0x0218;
PAIES_H            = 0x0219;
PAIE               = 0x021A;
PAIE_L             = 0x021A;
PAIE_H             = 0x021B;
PAIFG              = 0x021C;
PAIFG_L            = 0x021C;
PAIFG_H            = 0x021D;
P1IV               = 0x020E;
P2IV               = 0x021E;
/************************************************************
* DIGITAL I/O PortJ Pull up / Pull down Resistors
************************************************************/
PJIN               = 0x0320;
PJIN_L             = 0x0320;
PJIN_H             = 0x0321;
PJOUT              = 0x0322;
PJOUT_L            = 0x0322;
PJOUT_H            = 0x0323;
PJDIR              = 0x0324;
PJDIR_L            = 0x0324;
PJDIR_H            = 0x0325;
PJREN              = 0x0326;
PJREN_L            = 0x0326;
PJREN_H            = 0x0327;
PJSEL0             = 0x032A;
PJSEL0_L           = 0x032A;
PJSEL0_H           = 0x032B;
PJSEL1             = 0x032C;
PJSEL1_L           = 0x032C;
PJSEL1_H           = 0x032D;
PJSELC             = 0x0336;
PJSELC_L           = 0x0336;
PJSELC_H           = 0x0337;
/************************************************************
* Shared Reference
************************************************************/
REFCTL0            = 0x01B0;
REFCTL0_L          = 0x01B0;
REFCTL0_H          = 0x01B1;
/************************************************************
* Real Time Clock
************************************************************/
RTCCTL01           = 0x04A0;
RTCCTL01_L         = 0x04A0;
RTCCTL01_H         = 0x04A1;
RTCCTL23           = 0x04A2;
RTCCTL23_L         = 0x04A2;
RTCCTL23_H         = 0x04A3;
RTCPS0CTL          = 0x04A8;
RTCPS0CTL_L        = 0x04A8;
RTCPS0CTL_H        = 0x04A9;
RTCPS1CTL          = 0x04AA;
RTCPS1CTL_L        = 0x04AA;
RTCPS1CTL_H        = 0x04AB;
RTCPS              = 0x04AC;
RTCPS_L            = 0x04AC;
RTCPS_H            = 0x04AD;
RTCIV              = 0x04AE;
RTCTIM0            = 0x04B0;
RTCTIM0_L          = 0x04B0;
RTCTIM0_H          = 0x04B1;
RTCTIM1            = 0x04B2;
RTCTIM1_L          = 0x04B2;
RTCTIM1_H          = 0x04B3;
RTCDATE            = 0x04B4;
RTCDATE_L          = 0x04B4;
RTCDATE_H          = 0x04B5;
RTCYEAR            = 0x04B6;
RTCYEAR_L          = 0x04B6;
RTCYEAR_H          = 0x04B7;
RTCAMINHR          = 0x04B8;
RTCAMINHR_L        = 0x04B8;
RTCAMINHR_H        = 0x04B9;
RTCADOWDAY         = 0x04BA;
RTCADOWDAY_L       = 0x04BA;
RTCADOWDAY_H       = 0x04BB;
BIN2BCD            = 0x04BC;
BCD2BIN            = 0x04BE;
/************************************************************
* SFR - Special Function Register Module
************************************************************/
SFRIE1             = 0x0100;
SFRIE1_L           = 0x0100;
SFRIE1_H           = 0x0101;
SFRIFG1            = 0x0102;
SFRIFG1_L          = 0x0102;
SFRIFG1_H          = 0x0103;
SFRRPCR            = 0x0104;
SFRRPCR_L          = 0x0104;
SFRRPCR_H          = 0x0105;
/************************************************************
* SYS - System Module
************************************************************/
SYSCTL             = 0x0180;
SYSCTL_L           = 0x0180;
SYSCTL_H           = 0x0181;
SYSBSLC            = 0x0182;
SYSBSLC_L          = 0x0182;
SYSBSLC_H          = 0x0183;
SYSJMBC            = 0x0186;
SYSJMBC_L          = 0x0186;
SYSJMBC_H          = 0x0187;
SYSJMBI0           = 0x0188;
SYSJMBI0_L         = 0x0188;
SYSJMBI0_H         = 0x0189;
SYSJMBI1           = 0x018A;
SYSJMBI1_L         = 0x018A;
SYSJMBI1_H         = 0x018B;
SYSJMBO0           = 0x018C;
SYSJMBO0_L         = 0x018C;
SYSJMBO0_H         = 0x018D;
SYSJMBO1           = 0x018E;
SYSJMBO1_L         = 0x018E;
SYSJMBO1_H         = 0x018F;
SYSBERRIV          = 0x0198;
SYSBERRIV_L        = 0x0198;
SYSBERRIV_H        = 0x0199;
SYSUNIV            = 0x019A;
SYSUNIV_L          = 0x019A;
SYSUNIV_H          = 0x019B;
SYSSNIV            = 0x019C;
SYSSNIV_L          = 0x019C;
SYSSNIV_H          = 0x019D;
SYSRSTIV           = 0x019E;
SYSRSTIV_L         = 0x019E;
SYSRSTIV_H         = 0x019F;
/************************************************************
* Timer0_A3
************************************************************/
TA0CTL             = 0x0340;
TA0CCTL0           = 0x0342;
TA0CCTL1           = 0x0344;
TA0CCTL2           = 0x0346;
TA0R               = 0x0350;
TA0CCR0            = 0x0352;
TA0CCR1            = 0x0354;
TA0CCR2            = 0x0356;
TA0IV              = 0x036E;
TA0EX0             = 0x0360;
/************************************************************
* Timer1_A3
************************************************************/
TA1CTL             = 0x0380;
TA1CCTL0           = 0x0382;
TA1CCTL1           = 0x0384;
TA1CCTL2           = 0x0386;
TA1R               = 0x0390;
TA1CCR0            = 0x0392;
TA1CCR1            = 0x0394;
TA1CCR2            = 0x0396;
TA1IV              = 0x03AE;
TA1EX0             = 0x03A0;
/************************************************************
* Timer0_B3
************************************************************/
TB0CTL             = 0x03C0;
TB0CCTL0           = 0x03C2;
TB0CCTL1           = 0x03C4;
TB0CCTL2           = 0x03C6;
TB0R               = 0x03D0;
TB0CCR0            = 0x03D2;
TB0CCR1            = 0x03D4;
TB0CCR2            = 0x03D6;
TB0EX0             = 0x03E0;
TB0IV              = 0x03EE;
/************************************************************
* USCI A0
************************************************************/
UCA0CTLW0          = 0x05C0;
UCA0CTLW0_L        = 0x05C0;
UCA0CTLW0_H        = 0x05C1;
UCA0CTLW1          = 0x05C2;
UCA0CTLW1_L        = 0x05C2;
UCA0CTLW1_H        = 0x05C3;
UCA0BRW            = 0x05C6;
UCA0BRW_L          = 0x05C6;
UCA0BRW_H          = 0x05C7;
UCA0MCTLW          = 0x05C8;
UCA0MCTLW_L        = 0x05C8;
UCA0MCTLW_H        = 0x05C9;
UCA0STATW          = 0x05CA;
UCA0RXBUF          = 0x05CC;
UCA0RXBUF_L        = 0x05CC;
UCA0RXBUF_H        = 0x05CD;
UCA0TXBUF          = 0x05CE;
UCA0TXBUF_L        = 0x05CE;
UCA0TXBUF_H        = 0x05CF;
UCA0ABCTL          = 0x05D0;
UCA0IRCTL          = 0x05D2;
UCA0IRCTL_L        = 0x05D2;
UCA0IRCTL_H        = 0x05D3;
UCA0IE             = 0x05DA;
UCA0IE_L           = 0x05DA;
UCA0IE_H           = 0x05DB;
UCA0IFG            = 0x05DC;
UCA0IFG_L          = 0x05DC;
UCA0IFG_H          = 0x05DD;
UCA0IV             = 0x05DE;
/************************************************************
* USCI B0
************************************************************/
UCB0CTLW0          = 0x0640;
UCB0CTLW0_L        = 0x0640;
UCB0CTLW0_H        = 0x0641;
UCB0CTLW1          = 0x0642;
UCB0CTLW1_L        = 0x0642;
UCB0CTLW1_H        = 0x0643;
UCB0BRW            = 0x0646;
UCB0BRW_L          = 0x0646;
UCB0BRW_H          = 0x0647;
UCB0STATW          = 0x0648;
UCB0STATW_L        = 0x0648;
UCB0STATW_H        = 0x0649;
UCB0TBCNT          = 0x064A;
UCB0TBCNT_L        = 0x064A;
UCB0TBCNT_H        = 0x064B;
UCB0RXBUF          = 0x064C;
UCB0RXBUF_L        = 0x064C;
UCB0RXBUF_H        = 0x064D;
UCB0TXBUF          = 0x064E;
UCB0TXBUF_L        = 0x064E;
UCB0TXBUF_H        = 0x064F;
UCB0I2COA0         = 0x0654;
UCB0I2COA0_L       = 0x0654;
UCB0I2COA0_H       = 0x0655;
UCB0I2COA1         = 0x0656;
UCB0I2COA1_L       = 0x0656;
UCB0I2COA1_H       = 0x0657;
UCB0I2COA2         = 0x0658;
UCB0I2COA2_L       = 0x0658;
UCB0I2COA2_H       = 0x0659;
UCB0I2COA3         = 0x065A;
UCB0I2COA3_L       = 0x065A;
UCB0I2COA3_H       = 0x065B;
UCB0ADDRX          = 0x065C;
UCB0ADDRX_L        = 0x065C;
UCB0ADDRX_H        = 0x065D;
UCB0ADDMASK        = 0x065E;
UCB0ADDMASK_L      = 0x065E;
UCB0ADDMASK_H      = 0x065F;
UCB0I2CSA          = 0x0660;
UCB0I2CSA_L        = 0x0660;
UCB0I2CSA_H        = 0x0661;
UCB0IE             = 0x066A;
UCB0IE_L           = 0x066A;
UCB0IE_H           = 0x066B;
UCB0IFG            = 0x066C;
UCB0IFG_L          = 0x066C;
UCB0IFG_H          = 0x066D;
UCB0IV             = 0x066E;
/************************************************************
* WATCHDOG TIMER A
************************************************************/
WDTCTL             = 0x015C;
WDTCTL_L           = 0x015C;
WDTCTL_H           = 0x015D;
/************************************************************
* Interrupt Vectors (offset from 0xFF80 + 0x10 for Password)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

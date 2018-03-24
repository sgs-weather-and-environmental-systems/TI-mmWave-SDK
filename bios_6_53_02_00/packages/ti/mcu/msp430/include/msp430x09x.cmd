/******************************************************************************/
/* Legacy Linker Command File                                                 */
/* Not recommended for use in new projects.                                   */
/* Please use the device specific cmd file                                    */
/******************************************************************************/

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
/* msp430l092.cmd                                                             */
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
* A-POOL
************************************************************/
APCNF              = 0x01A0;
APCNF_L            = 0x01A0;
APCNF_H            = 0x01A1;
APCTL              = 0x01A2;
APCTL_L            = 0x01A2;
APCTL_H            = 0x01A3;
APOMR              = 0x01A4;
APOMR_L            = 0x01A4;
APOMR_H            = 0x01A5;
APVDIV             = 0x01A6;
APVDIV_L           = 0x01A6;
APVDIV_H           = 0x01A7;
APTRIM             = 0x01A8;
APTRIM_L           = 0x01A8;
APTRIM_H           = 0x01A9;
APINT              = 0x01B0;
APINT_L            = 0x01B0;
APINT_H            = 0x01B1;
APINTB             = 0x01B2;
APINTB_L           = 0x01B2;
APINTB_H           = 0x01B3;
APFRACT            = 0x01B4;
APFRACT_L          = 0x01B4;
APFRACT_H          = 0x01B5;
APFRACTB           = 0x01B6;
APFRACTB_L         = 0x01B6;
APFRACTB_H         = 0x01B7;
APIFG              = 0x01BA;
APIFG_L            = 0x01BA;
APIFG_H            = 0x01BB;
APIE               = 0x01BC;
APIE_L             = 0x01BC;
APIE_H             = 0x01BD;
APIV               = 0x01BE;
APIV_L             = 0x01BE;
APIV_H             = 0x01BF;
/************************************************************
* COMPACT CLOCK SYSTEM
************************************************************/
CCSCTL0            = 0x0160;
CCSCTL0_L          = 0x0160;
CCSCTL0_H          = 0x0161;
CCSCTL1            = 0x0162;
CCSCTL1_L          = 0x0162;
CCSCTL1_H          = 0x0163;
CCSCTL2            = 0x0164;
CCSCTL2_L          = 0x0164;
CCSCTL2_H          = 0x0165;
CCSCTL4            = 0x0168;
CCSCTL4_L          = 0x0168;
CCSCTL4_H          = 0x0169;
CCSCTL5            = 0x016A;
CCSCTL5_L          = 0x016A;
CCSCTL5_H          = 0x016B;
CCSCTL6            = 0x016C;
CCSCTL6_L          = 0x016C;
CCSCTL6_H          = 0x016D;
CCSCTL7            = 0x016E;
CCSCTL7_L          = 0x016E;
CCSCTL7_H          = 0x016F;
CCSCTL8            = 0x0170;
CCSCTL8_L          = 0x0170;
CCSCTL8_H          = 0x0171;
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
PADS               = 0x0208;
PADS_L             = 0x0208;
PADS_H             = 0x0209;
PASEL0             = 0x020A;
PASEL0_L           = 0x020A;
PASEL0_H           = 0x020B;
PASEL1             = 0x020C;
PASEL1_L           = 0x020C;
PASEL1_H           = 0x020D;
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
* COMPACT SYS - System Module
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
SYSCNF             = 0x0190;
SYSCNF_L           = 0x0190;
SYSCNF_H           = 0x0191;
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
* WATCHDOG TIMER A
************************************************************/
WDTCTL             = 0x015C;
WDTCTL_L           = 0x015C;
WDTCTL_H           = 0x015D;
/************************************************************
* Interrupt Vectors (offset from 0xFFFF - 0x20)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

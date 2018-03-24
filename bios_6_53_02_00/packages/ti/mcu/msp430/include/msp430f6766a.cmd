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
/* msp430f6766a.cmd                                                           */
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
* ADC10_A
************************************************************/
ADC10CTL0          = 0x0740;
ADC10CTL0_L        = 0x0740;
ADC10CTL0_H        = 0x0741;
ADC10CTL1          = 0x0742;
ADC10CTL1_L        = 0x0742;
ADC10CTL1_H        = 0x0743;
ADC10CTL2          = 0x0744;
ADC10CTL2_L        = 0x0744;
ADC10CTL2_H        = 0x0745;
ADC10LO            = 0x0746;
ADC10LO_L          = 0x0746;
ADC10LO_H          = 0x0747;
ADC10HI            = 0x0748;
ADC10HI_L          = 0x0748;
ADC10HI_H          = 0x0749;
ADC10MCTL0         = 0x074A;
ADC10MCTL0_L       = 0x074A;
ADC10MCTL0_H       = 0x074B;
ADC10MEM0          = 0x0752;
ADC10MEM0_L        = 0x0752;
ADC10MEM0_H        = 0x0753;
ADC10IE            = 0x075A;
ADC10IE_L          = 0x075A;
ADC10IE_H          = 0x075B;
ADC10IFG           = 0x075C;
ADC10IFG_L         = 0x075C;
ADC10IFG_H         = 0x075D;
ADC10IV            = 0x075E;
ADC10IV_L          = 0x075E;
ADC10IV_H          = 0x075F;
/************************************************************
* AES Accelerator
************************************************************/
AESACTL0           = 0x09C0;
AESACTL0_L         = 0x09C0;
AESACTL0_H         = 0x09C1;
AESASTAT           = 0x09C4;
AESASTAT_L         = 0x09C4;
AESASTAT_H         = 0x09C5;
AESAKEY            = 0x09C6;
AESAKEY_L          = 0x09C6;
AESAKEY_H          = 0x09C7;
AESADIN            = 0x09C8;
AESADIN_L          = 0x09C8;
AESADIN_H          = 0x09C9;
AESADOUT           = 0x09CA;
AESADOUT_L         = 0x09CA;
AESADOUT_H         = 0x09CB;
/************************************************************
* Auxilary Supply
************************************************************/
AUXCTL0            = 0x09E0;
AUXCTL0_L          = 0x09E0;
AUXCTL0_H          = 0x09E1;
AUXCTL1            = 0x09E2;
AUXCTL1_L          = 0x09E2;
AUXCTL1_H          = 0x09E3;
AUXCTL2            = 0x09E4;
AUXCTL2_L          = 0x09E4;
AUXCTL2_H          = 0x09E5;
AUX2CHCTL          = 0x09F2;
AUX2CHCTL_L        = 0x09F2;
AUX2CHCTL_H        = 0x09F3;
AUX3CHCTL          = 0x09F4;
AUX3CHCTL_L        = 0x09F4;
AUX3CHCTL_H        = 0x09F5;
AUXADCCTL          = 0x09F6;
AUXADCCTL_L        = 0x09F6;
AUXADCCTL_H        = 0x09F7;
AUXIFG             = 0x09FA;
AUXIFG_L           = 0x09FA;
AUXIFG_H           = 0x09FB;
AUXIE              = 0x09FC;
AUXIE_L            = 0x09FC;
AUXIE_H            = 0x09FD;
AUXIV              = 0x09FE;
AUXIV_L            = 0x09FE;
AUXIV_H            = 0x09FF;
/*************************************************************
* Backup RAM Module
*************************************************************/
BAKMEM0            = 0x0480;
BAKMEM0_L          = 0x0480;
BAKMEM0_H          = 0x0481;
BAKMEM1            = 0x0482;
BAKMEM1_L          = 0x0482;
BAKMEM1_H          = 0x0483;
BAKMEM2            = 0x0484;
BAKMEM2_L          = 0x0484;
BAKMEM2_H          = 0x0485;
BAKMEM3            = 0x0486;
BAKMEM3_L          = 0x0486;
BAKMEM3_H          = 0x0487;
/************************************************************
* Comparator B
************************************************************/
CBCTL0             = 0x08C0;
CBCTL0_L           = 0x08C0;
CBCTL0_H           = 0x08C1;
CBCTL1             = 0x08C2;
CBCTL1_L           = 0x08C2;
CBCTL1_H           = 0x08C3;
CBCTL2             = 0x08C4;
CBCTL2_L           = 0x08C4;
CBCTL2_H           = 0x08C5;
CBCTL3             = 0x08C6;
CBCTL3_L           = 0x08C6;
CBCTL3_H           = 0x08C7;
CBINT              = 0x08CC;
CBINT_L            = 0x08CC;
CBINT_H            = 0x08CD;
CBIV               = 0x08CE;
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
* Flash Memory
*************************************************************/
FCTL1              = 0x0140;
FCTL1_L            = 0x0140;
FCTL1_H            = 0x0141;
FCTL3              = 0x0144;
FCTL3_L            = 0x0144;
FCTL3_H            = 0x0145;
FCTL4              = 0x0146;
FCTL4_L            = 0x0146;
FCTL4_H            = 0x0147;
/************************************************************
* LCD_C
************************************************************/
LCDCCTL0           = 0x0A00;
LCDCCTL0_L         = 0x0A00;
LCDCCTL0_H         = 0x0A01;
LCDCCTL1           = 0x0A02;
LCDCCTL1_L         = 0x0A02;
LCDCCTL1_H         = 0x0A03;
LCDCBLKCTL         = 0x0A04;
LCDCBLKCTL_L       = 0x0A04;
LCDCBLKCTL_H       = 0x0A05;
LCDCMEMCTL         = 0x0A06;
LCDCMEMCTL_L       = 0x0A06;
LCDCMEMCTL_H       = 0x0A07;
LCDCVCTL           = 0x0A08;
LCDCVCTL_L         = 0x0A08;
LCDCVCTL_H         = 0x0A09;
LCDCPCTL0          = 0x0A0A;
LCDCPCTL0_L        = 0x0A0A;
LCDCPCTL0_H        = 0x0A0B;
LCDCPCTL1          = 0x0A0C;
LCDCPCTL1_L        = 0x0A0C;
LCDCPCTL1_H        = 0x0A0D;
LCDCPCTL2          = 0x0A0E;
LCDCPCTL2_L        = 0x0A0E;
LCDCPCTL2_H        = 0x0A0F;
LCDCCPCTL          = 0x0A12;
LCDCCPCTL_L        = 0x0A12;
LCDCCPCTL_H        = 0x0A13;
LCDCIV             = 0x0A1E;
LCDM1              = 0x0A20;
LCDM2              = 0x0A21;
LCDM3              = 0x0A22;
LCDM4              = 0x0A23;
LCDM5              = 0x0A24;
LCDM6              = 0x0A25;
LCDM7              = 0x0A26;
LCDM8              = 0x0A27;
LCDM9              = 0x0A28;
LCDM10             = 0x0A29;
LCDM11             = 0x0A2A;
LCDM12             = 0x0A2B;
LCDM13             = 0x0A2C;
LCDM14             = 0x0A2D;
LCDM15             = 0x0A2E;
LCDM16             = 0x0A2F;
LCDM17             = 0x0A30;
LCDM18             = 0x0A31;
LCDM19             = 0x0A32;
LCDM20             = 0x0A33;
LCDM21             = 0x0A34;
LCDM22             = 0x0A35;
LCDM23             = 0x0A36;
LCDM24             = 0x0A37;
LCDM25             = 0x0A38;
LCDM26             = 0x0A39;
LCDM27             = 0x0A3A;
LCDM28             = 0x0A3B;
LCDM29             = 0x0A3C;
LCDM30             = 0x0A3D;
LCDM31             = 0x0A3E;
LCDM32             = 0x0A3F;
LCDM33             = 0x0A40;
LCDM34             = 0x0A41;
LCDM35             = 0x0A42;
LCDM36             = 0x0A43;
LCDM37             = 0x0A44;
LCDM38             = 0x0A45;
LCDM39             = 0x0A46;
LCDM40             = 0x0A47;
LCDBM1             = 0x0A40;
LCDBM2             = 0x0A41;
LCDBM3             = 0x0A42;
LCDBM4             = 0x0A43;
LCDBM5             = 0x0A44;
LCDBM6             = 0x0A45;
LCDBM7             = 0x0A46;
LCDBM8             = 0x0A47;
LCDBM9             = 0x0A48;
LCDBM10            = 0x0A49;
LCDBM11            = 0x0A4A;
LCDBM12            = 0x0A4B;
LCDBM13            = 0x0A4C;
LCDBM14            = 0x0A4D;
LCDBM15            = 0x0A4E;
LCDBM16            = 0x0A4F;
LCDBM17            = 0x0A50;
LCDBM18            = 0x0A51;
LCDBM19            = 0x0A52;
LCDBM20            = 0x0A53;
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
* DIGITAL I/O Port3/4 Pull up / Pull down Resistors
************************************************************/
PBIN               = 0x0220;
PBIN_L             = 0x0220;
PBIN_H             = 0x0221;
PBOUT              = 0x0222;
PBOUT_L            = 0x0222;
PBOUT_H            = 0x0223;
PBDIR              = 0x0224;
PBDIR_L            = 0x0224;
PBDIR_H            = 0x0225;
PBREN              = 0x0226;
PBREN_L            = 0x0226;
PBREN_H            = 0x0227;
PBDS               = 0x0228;
PBDS_L             = 0x0228;
PBDS_H             = 0x0229;
PBSEL0             = 0x022A;
PBSEL0_L           = 0x022A;
PBSEL0_H           = 0x022B;
/************************************************************
* DIGITAL I/O Port5/6 Pull up / Pull down Resistors
************************************************************/
PCIN               = 0x0240;
PCIN_L             = 0x0240;
PCIN_H             = 0x0241;
PCOUT              = 0x0242;
PCOUT_L            = 0x0242;
PCOUT_H            = 0x0243;
PCDIR              = 0x0244;
PCDIR_L            = 0x0244;
PCDIR_H            = 0x0245;
PCREN              = 0x0246;
PCREN_L            = 0x0246;
PCREN_H            = 0x0247;
PCDS               = 0x0248;
PCDS_L             = 0x0248;
PCDS_H             = 0x0249;
PCSEL0             = 0x024A;
PCSEL0_L           = 0x024A;
PCSEL0_H           = 0x024B;
PCSEL1             = 0x024C;
PCSEL1_L           = 0x024C;
PCSEL1_H           = 0x024D;
/************************************************************
* DIGITAL I/O Port7/8 Pull up / Pull down Resistors
************************************************************/
PDIN               = 0x0260;
PDIN_L             = 0x0260;
PDIN_H             = 0x0261;
PDOUT              = 0x0262;
PDOUT_L            = 0x0262;
PDOUT_H            = 0x0263;
PDDIR              = 0x0264;
PDDIR_L            = 0x0264;
PDDIR_H            = 0x0265;
PDREN              = 0x0266;
PDREN_L            = 0x0266;
PDREN_H            = 0x0267;
PDDS               = 0x0268;
PDDS_L             = 0x0268;
PDDS_H             = 0x0269;
PDSEL0             = 0x026A;
PDSEL0_L           = 0x026A;
PDSEL0_H           = 0x026B;
/************************************************************
* DIGITAL I/O Port9/10 Pull up / Pull down Resistors
************************************************************/
PEIN               = 0x0280;
PEIN_L             = 0x0280;
PEIN_H             = 0x0281;
PEOUT              = 0x0282;
PEOUT_L            = 0x0282;
PEOUT_H            = 0x0283;
PEDIR              = 0x0284;
PEDIR_L            = 0x0284;
PEDIR_H            = 0x0285;
PEREN              = 0x0286;
PEREN_L            = 0x0286;
PEREN_H            = 0x0287;
PEDS               = 0x0288;
PEDS_L             = 0x0288;
PEDS_H             = 0x0289;
PESEL0             = 0x028A;
PESEL0_L           = 0x028A;
PESEL0_H           = 0x028B;
/************************************************************
* DIGITAL I/O Port11 Pull up / Pull down Resistors
************************************************************/
PFIN               = 0x02A0;
PFIN_L             = 0x02A0;
PFIN_H             = 0x02A1;
PFOUT              = 0x02A2;
PFOUT_L            = 0x02A2;
PFOUT_H            = 0x02A3;
PFDIR              = 0x02A4;
PFDIR_L            = 0x02A4;
PFDIR_H            = 0x02A5;
PFREN              = 0x02A6;
PFREN_L            = 0x02A6;
PFREN_H            = 0x02A7;
PFDS               = 0x02A8;
PFDS_L             = 0x02A8;
PFDS_H             = 0x02A9;
PFSEL0             = 0x02AA;
PFSEL0_L           = 0x02AA;
PFSEL0_H           = 0x02AB;
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
PJDS               = 0x0328;
PJDS_L             = 0x0328;
PJDS_H             = 0x0329;
PJSEL              = 0x032A;
PJSEL_L            = 0x032A;
PJSEL_H            = 0x032B;
/************************************************************
* PORT MAPPING CONTROLLER
************************************************************/
PMAPKEYID          = 0x01C0;
PMAPKEYID_L        = 0x01C0;
PMAPKEYID_H        = 0x01C1;
PMAPCTL            = 0x01C2;
PMAPCTL_L          = 0x01C2;
PMAPCTL_H          = 0x01C3;
/************************************************************
* PORT 2 MAPPING CONTROLLER
************************************************************/
P2MAP01            = 0x01D0;
P2MAP01_L          = 0x01D0;
P2MAP01_H          = 0x01D1;
P2MAP23            = 0x01D2;
P2MAP23_L          = 0x01D2;
P2MAP23_H          = 0x01D3;
P2MAP45            = 0x01D4;
P2MAP45_L          = 0x01D4;
P2MAP45_H          = 0x01D5;
P2MAP67            = 0x01D6;
P2MAP67_L          = 0x01D6;
P2MAP67_H          = 0x01D7;
/************************************************************
* PORT 3 MAPPING CONTROLLER
************************************************************/
P3MAP01            = 0x01D8;
P3MAP01_L          = 0x01D8;
P3MAP01_H          = 0x01D9;
P3MAP23            = 0x01DA;
P3MAP23_L          = 0x01DA;
P3MAP23_H          = 0x01DB;
P3MAP45            = 0x01DC;
P3MAP45_L          = 0x01DC;
P3MAP45_H          = 0x01DD;
P3MAP67            = 0x01DE;
P3MAP67_L          = 0x01DE;
P3MAP67_H          = 0x01DF;
/************************************************************
* PORT 4 MAPPING CONTROLLER
************************************************************/
P4MAP01            = 0x01E0;
P4MAP01_L          = 0x01E0;
P4MAP01_H          = 0x01E1;
P4MAP23            = 0x01E2;
P4MAP23_L          = 0x01E2;
P4MAP23_H          = 0x01E3;
P4MAP45            = 0x01E4;
P4MAP45_L          = 0x01E4;
P4MAP45_H          = 0x01E5;
P4MAP67            = 0x01E6;
P4MAP67_L          = 0x01E6;
P4MAP67_H          = 0x01E7;
/************************************************************
* PMM - Power Management System
************************************************************/
PMMCTL0            = 0x0120;
PMMCTL0_L          = 0x0120;
PMMCTL0_H          = 0x0121;
PMMCTL1            = 0x0122;
PMMCTL1_L          = 0x0122;
PMMCTL1_H          = 0x0123;
SVSMHCTL           = 0x0124;
SVSMHCTL_L         = 0x0124;
SVSMHCTL_H         = 0x0125;
SVSMLCTL           = 0x0126;
SVSMLCTL_L         = 0x0126;
SVSMLCTL_H         = 0x0127;
SVSMIO             = 0x0128;
SVSMIO_L           = 0x0128;
SVSMIO_H           = 0x0129;
PMMIFG             = 0x012C;
PMMIFG_L           = 0x012C;
PMMIFG_H           = 0x012D;
PMMRIE             = 0x012E;
PMMRIE_L           = 0x012E;
PMMRIE_H           = 0x012F;
PM5CTL0            = 0x0130;
PM5CTL0_L          = 0x0130;
PM5CTL0_H          = 0x0131;
/*************************************************************
* RAM Control Module
*************************************************************/
RCCTL0             = 0x0158;
RCCTL0_L           = 0x0158;
RCCTL0_H           = 0x0159;
/************************************************************
* Shared Reference
************************************************************/
REFCTL0            = 0x01B0;
REFCTL0_L          = 0x01B0;
REFCTL0_H          = 0x01B1;
/************************************************************
* Real Time Clock
************************************************************/
RTCCTL0            = 0x0C80;
RTCCTL0_L          = 0x0C80;
RTCCTL0_H          = 0x0C81;
RTCCTL13           = 0x0C82;
RTCCTL13_L         = 0x0C82;
RTCCTL13_H         = 0x0C83;
RTCOCAL            = 0x0C84;
RTCOCAL_L          = 0x0C84;
RTCOCAL_H          = 0x0C85;
RTCTCMP            = 0x0C86;
RTCTCMP_L          = 0x0C86;
RTCTCMP_H          = 0x0C87;
RTCPS0CTL          = 0x0C88;
RTCPS0CTL_L        = 0x0C88;
RTCPS0CTL_H        = 0x0C89;
RTCPS1CTL          = 0x0C8A;
RTCPS1CTL_L        = 0x0C8A;
RTCPS1CTL_H        = 0x0C8B;
RTCPS              = 0x0C8C;
RTCPS_L            = 0x0C8C;
RTCPS_H            = 0x0C8D;
RTCIV              = 0x0C8E;
RTCTIM0            = 0x0C90;
RTCTIM0_L          = 0x0C90;
RTCTIM0_H          = 0x0C91;
RTCTIM1            = 0x0C92;
RTCTIM1_L          = 0x0C92;
RTCTIM1_H          = 0x0C93;
RTCDATE            = 0x0C94;
RTCDATE_L          = 0x0C94;
RTCDATE_H          = 0x0C95;
RTCYEAR            = 0x0C96;
RTCYEAR_L          = 0x0C96;
RTCYEAR_H          = 0x0C97;
RTCAMINHR          = 0x0C98;
RTCAMINHR_L        = 0x0C98;
RTCAMINHR_H        = 0x0C99;
RTCADOWDAY         = 0x0C9A;
RTCADOWDAY_L       = 0x0C9A;
RTCADOWDAY_H       = 0x0C9B;
BIN2BCD            = 0x0C9C;
BCD2BIN            = 0x0C9E;
RTCTCCTL0          = 0x0CA0;
RTCTCCTL1          = 0x0CA1;
RTCCAP0CTL         = 0x0CA2;
RTCCAP1CTL         = 0x0CA3;
RTCSECBAK0         = 0x0CB0;
RTCMINBAK0         = 0x0CB1;
RTCHOURBAK0        = 0x0CB2;
RTCDAYBAK0         = 0x0CB3;
RTCMONBAK0         = 0x0CB4;
RTCYEARBAK0        = 0x0CB6;
RTCSECBAK1         = 0x0CB8;
RTCMINBAK1         = 0x0CB9;
RTCHOURBAK1        = 0x0CBA;
RTCDAYBAK1         = 0x0CBB;
RTCMONBAK1         = 0x0CBC;
RTCYEARBAK1        = 0x0CBE;
/************************************************************
* SD24_B - Sigma Delta 24 Bit
************************************************************/
SD24BCTL0          = 0x0800;
SD24BCTL0_L        = 0x0800;
SD24BCTL0_H        = 0x0801;
SD24BCTL1          = 0x0802;
SD24BCTL1_L        = 0x0802;
SD24BCTL1_H        = 0x0803;
SD24BTRGCTL        = 0x0804;
SD24BTRGCTL_L      = 0x0804;
SD24BTRGCTL_H      = 0x0805;
SD24BTRGOSR        = 0x0806;
SD24BTRGOSR_L      = 0x0806;
SD24BTRGOSR_H      = 0x0807;
SD24BTRGPRE        = 0x0808;
SD24BTRGPRE_L      = 0x0808;
SD24BTRGPRE_H      = 0x0809;
SD24BIFG           = 0x080A;
SD24BIFG_L         = 0x080A;
SD24BIFG_H         = 0x080B;
SD24BIE            = 0x080C;
SD24BIE_L          = 0x080C;
SD24BIE_H          = 0x080D;
SD24BIV            = 0x080E;
SD24BIV_L          = 0x080E;
SD24BIV_H          = 0x080F;
SD24BCCTL0         = 0x0810;
SD24BCCTL0_L       = 0x0810;
SD24BCCTL0_H       = 0x0811;
SD24BINCTL0        = 0x0812;
SD24BINCTL0_L      = 0x0812;
SD24BINCTL0_H      = 0x0813;
SD24BOSR0          = 0x0814;
SD24BOSR0_L        = 0x0814;
SD24BOSR0_H        = 0x0815;
SD24BPRE0          = 0x0816;
SD24BPRE0_L        = 0x0816;
SD24BPRE0_H        = 0x0817;
SD24BCCTL1         = 0x0818;
SD24BCCTL1_L       = 0x0818;
SD24BCCTL1_H       = 0x0819;
SD24BINCTL1        = 0x081A;
SD24BINCTL1_L      = 0x081A;
SD24BINCTL1_H      = 0x081B;
SD24BOSR1          = 0x081C;
SD24BOSR1_L        = 0x081C;
SD24BOSR1_H        = 0x081D;
SD24BPRE1          = 0x081E;
SD24BPRE1_L        = 0x081E;
SD24BPRE1_H        = 0x081F;
SD24BCCTL2         = 0x0820;
SD24BCCTL2_L       = 0x0820;
SD24BCCTL2_H       = 0x0821;
SD24BINCTL2        = 0x0822;
SD24BINCTL2_L      = 0x0822;
SD24BINCTL2_H      = 0x0823;
SD24BOSR2          = 0x0824;
SD24BOSR2_L        = 0x0824;
SD24BOSR2_H        = 0x0825;
SD24BPRE2          = 0x0826;
SD24BPRE2_L        = 0x0826;
SD24BPRE2_H        = 0x0827;
SD24BCCTL3         = 0x0828;
SD24BCCTL3_L       = 0x0828;
SD24BCCTL3_H       = 0x0829;
SD24BINCTL3        = 0x082A;
SD24BINCTL3_L      = 0x082A;
SD24BINCTL3_H      = 0x082B;
SD24BOSR3          = 0x082C;
SD24BOSR3_L        = 0x082C;
SD24BOSR3_H        = 0x082D;
SD24BPRE3          = 0x082E;
SD24BPRE3_L        = 0x082E;
SD24BPRE3_H        = 0x082F;
SD24BMEML0         = 0x0850;
SD24BMEML0_L       = 0x0850;
SD24BMEML0_H       = 0x0851;
SD24BMEMH0         = 0x0852;
SD24BMEMH0_L       = 0x0852;
SD24BMEMH0_H       = 0x0853;
SD24BMEML1         = 0x0854;
SD24BMEML1_L       = 0x0854;
SD24BMEML1_H       = 0x0855;
SD24BMEMH1         = 0x0856;
SD24BMEMH1_L       = 0x0856;
SD24BMEMH1_H       = 0x0857;
SD24BMEML2         = 0x0858;
SD24BMEML2_L       = 0x0858;
SD24BMEML2_H       = 0x0859;
SD24BMEMH2         = 0x085A;
SD24BMEMH2_L       = 0x085A;
SD24BMEMH2_H       = 0x085B;
SD24BMEML3         = 0x085C;
SD24BMEML3_L       = 0x085C;
SD24BMEML3_H       = 0x085D;
SD24BMEMH3         = 0x085E;
SD24BMEMH3_L       = 0x085E;
SD24BMEMH3_H       = 0x085F;
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
* Timer1_A2
************************************************************/
TA1CTL             = 0x0380;
TA1CCTL0           = 0x0382;
TA1CCTL1           = 0x0384;
TA1R               = 0x0390;
TA1CCR0            = 0x0392;
TA1CCR1            = 0x0394;
TA1IV              = 0x03AE;
TA1EX0             = 0x03A0;
/************************************************************
* Timer2_A2
************************************************************/
TA2CTL             = 0x0400;
TA2CCTL0           = 0x0402;
TA2CCTL1           = 0x0404;
TA2R               = 0x0410;
TA2CCR0            = 0x0412;
TA2CCR1            = 0x0414;
TA2IV              = 0x042E;
TA2EX0             = 0x0420;
/************************************************************
* Timer3_A2
************************************************************/
TA3CTL             = 0x0440;
TA3CCTL0           = 0x0442;
TA3CCTL1           = 0x0444;
TA3R               = 0x0450;
TA3CCR0            = 0x0452;
TA3CCR1            = 0x0454;
TA3IV              = 0x046E;
TA3EX0             = 0x0460;
/************************************************************
* UNIFIED CLOCK SYSTEM
************************************************************/
UCSCTL0            = 0x0160;
UCSCTL0_L          = 0x0160;
UCSCTL0_H          = 0x0161;
UCSCTL1            = 0x0162;
UCSCTL1_L          = 0x0162;
UCSCTL1_H          = 0x0163;
UCSCTL2            = 0x0164;
UCSCTL2_L          = 0x0164;
UCSCTL2_H          = 0x0165;
UCSCTL3            = 0x0166;
UCSCTL3_L          = 0x0166;
UCSCTL3_H          = 0x0167;
UCSCTL4            = 0x0168;
UCSCTL4_L          = 0x0168;
UCSCTL4_H          = 0x0169;
UCSCTL5            = 0x016A;
UCSCTL5_L          = 0x016A;
UCSCTL5_H          = 0x016B;
UCSCTL6            = 0x016C;
UCSCTL6_L          = 0x016C;
UCSCTL6_H          = 0x016D;
UCSCTL7            = 0x016E;
UCSCTL7_L          = 0x016E;
UCSCTL7_H          = 0x016F;
UCSCTL8            = 0x0170;
UCSCTL8_L          = 0x0170;
UCSCTL8_H          = 0x0171;
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
* USCI A1
************************************************************/
UCA1CTLW0          = 0x05E0;
UCA1CTLW0_L        = 0x05E0;
UCA1CTLW0_H        = 0x05E1;
UCA1CTLW1          = 0x05E2;
UCA1CTLW1_L        = 0x05E2;
UCA1CTLW1_H        = 0x05E3;
UCA1BRW            = 0x05E6;
UCA1BRW_L          = 0x05E6;
UCA1BRW_H          = 0x05E7;
UCA1MCTLW          = 0x05E8;
UCA1MCTLW_L        = 0x05E8;
UCA1MCTLW_H        = 0x05E9;
UCA1STATW          = 0x05EA;
UCA1RXBUF          = 0x05EC;
UCA1RXBUF_L        = 0x05EC;
UCA1RXBUF_H        = 0x05ED;
UCA1TXBUF          = 0x05EE;
UCA1TXBUF_L        = 0x05EE;
UCA1TXBUF_H        = 0x05EF;
UCA1ABCTL          = 0x05F0;
UCA1IRCTL          = 0x05F2;
UCA1IRCTL_L        = 0x05F2;
UCA1IRCTL_H        = 0x05F3;
UCA1IE             = 0x05FA;
UCA1IE_L           = 0x05FA;
UCA1IE_H           = 0x05FB;
UCA1IFG            = 0x05FC;
UCA1IFG_L          = 0x05FC;
UCA1IFG_H          = 0x05FD;
UCA1IV             = 0x05FE;
/************************************************************
* USCI A2
************************************************************/
UCA2CTLW0          = 0x0600;
UCA2CTLW0_L        = 0x0600;
UCA2CTLW0_H        = 0x0601;
UCA2CTLW1          = 0x0602;
UCA2CTLW1_L        = 0x0602;
UCA2CTLW1_H        = 0x0603;
UCA2BRW            = 0x0606;
UCA2BRW_L          = 0x0606;
UCA2BRW_H          = 0x0607;
UCA2MCTLW          = 0x0608;
UCA2MCTLW_L        = 0x0608;
UCA2MCTLW_H        = 0x0609;
UCA2STATW          = 0x060A;
UCA2RXBUF          = 0x060C;
UCA2RXBUF_L        = 0x060C;
UCA2RXBUF_H        = 0x060D;
UCA2TXBUF          = 0x060E;
UCA2TXBUF_L        = 0x060E;
UCA2TXBUF_H        = 0x060F;
UCA2ABCTL          = 0x0610;
UCA2IRCTL          = 0x0612;
UCA2IRCTL_L        = 0x0612;
UCA2IRCTL_H        = 0x0613;
UCA2IE             = 0x061A;
UCA2IE_L           = 0x061A;
UCA2IE_H           = 0x061B;
UCA2IFG            = 0x061C;
UCA2IFG_L          = 0x061C;
UCA2IFG_H          = 0x061D;
UCA2IV             = 0x061E;
/************************************************************
* USCI A3
************************************************************/
UCA3CTLW0          = 0x0620;
UCA3CTLW0_L        = 0x0620;
UCA3CTLW0_H        = 0x0621;
UCA3CTLW1          = 0x0622;
UCA3CTLW1_L        = 0x0622;
UCA3CTLW1_H        = 0x0623;
UCA3BRW            = 0x0626;
UCA3BRW_L          = 0x0626;
UCA3BRW_H          = 0x0627;
UCA3MCTLW          = 0x0628;
UCA3MCTLW_L        = 0x0628;
UCA3MCTLW_H        = 0x0629;
UCA3STATW          = 0x062A;
UCA3RXBUF          = 0x062C;
UCA3RXBUF_L        = 0x062C;
UCA3RXBUF_H        = 0x062D;
UCA3TXBUF          = 0x062E;
UCA3TXBUF_L        = 0x062E;
UCA3TXBUF_H        = 0x062F;
UCA3ABCTL          = 0x0630;
UCA3IRCTL          = 0x0632;
UCA3IRCTL_L        = 0x0632;
UCA3IRCTL_H        = 0x0633;
UCA3IE             = 0x063A;
UCA3IE_L           = 0x063A;
UCA3IE_H           = 0x063B;
UCA3IFG            = 0x063C;
UCA3IFG_L          = 0x063C;
UCA3IFG_H          = 0x063D;
UCA3IV             = 0x063E;
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
* USCI B1
************************************************************/
UCB1CTLW0          = 0x0680;
UCB1CTLW0_L        = 0x0680;
UCB1CTLW0_H        = 0x0681;
UCB1CTLW1          = 0x0682;
UCB1CTLW1_L        = 0x0682;
UCB1CTLW1_H        = 0x0683;
UCB1BRW            = 0x0686;
UCB1BRW_L          = 0x0686;
UCB1BRW_H          = 0x0687;
UCB1STATW          = 0x0688;
UCB1STATW_L        = 0x0688;
UCB1STATW_H        = 0x0689;
UCB1TBCNT          = 0x068A;
UCB1TBCNT_L        = 0x068A;
UCB1TBCNT_H        = 0x068B;
UCB1RXBUF          = 0x068C;
UCB1RXBUF_L        = 0x068C;
UCB1RXBUF_H        = 0x068D;
UCB1TXBUF          = 0x068E;
UCB1TXBUF_L        = 0x068E;
UCB1TXBUF_H        = 0x068F;
UCB1I2COA0         = 0x0694;
UCB1I2COA0_L       = 0x0694;
UCB1I2COA0_H       = 0x0695;
UCB1I2COA1         = 0x0696;
UCB1I2COA1_L       = 0x0696;
UCB1I2COA1_H       = 0x0697;
UCB1I2COA2         = 0x0698;
UCB1I2COA2_L       = 0x0698;
UCB1I2COA2_H       = 0x0699;
UCB1I2COA3         = 0x069A;
UCB1I2COA3_L       = 0x069A;
UCB1I2COA3_H       = 0x069B;
UCB1ADDRX          = 0x069C;
UCB1ADDRX_L        = 0x069C;
UCB1ADDRX_H        = 0x069D;
UCB1ADDMASK        = 0x069E;
UCB1ADDMASK_L      = 0x069E;
UCB1ADDMASK_H      = 0x069F;
UCB1I2CSA          = 0x06A0;
UCB1I2CSA_L        = 0x06A0;
UCB1I2CSA_H        = 0x06A1;
UCB1IE             = 0x06AA;
UCB1IE_L           = 0x06AA;
UCB1IE_H           = 0x06AB;
UCB1IFG            = 0x06AC;
UCB1IFG_L          = 0x06AC;
UCB1IFG_H          = 0x06AD;
UCB1IV             = 0x06AE;
/************************************************************
* WATCHDOG TIMER A
************************************************************/
WDTCTL             = 0x015C;
WDTCTL_L           = 0x015C;
WDTCTL_H           = 0x015D;
/************************************************************
* TLV Descriptors
************************************************************/
/************************************************************
* Interrupt Vectors (offset from 0xFF80)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

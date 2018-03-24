/* ============================================================================ */
/* Copyright (c) 2015, Texas Instruments Incorporated                           */
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
/* msp430fr5987.cmd                                                           */
/*    - Linker Command File for defintions in the header file                 */
/*    Please do not change !                                                  */
/*                                                                            */
/******************************************************************************/
/* Version: 1.167                                                             */
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
* ADC12_B
************************************************************/
ADC12CTL0          = 0x0800;
ADC12CTL0_L        = 0x0800;
ADC12CTL0_H        = 0x0801;
ADC12CTL1          = 0x0802;
ADC12CTL1_L        = 0x0802;
ADC12CTL1_H        = 0x0803;
ADC12CTL2          = 0x0804;
ADC12CTL2_L        = 0x0804;
ADC12CTL2_H        = 0x0805;
ADC12CTL3          = 0x0806;
ADC12CTL3_L        = 0x0806;
ADC12CTL3_H        = 0x0807;
ADC12LO            = 0x0808;
ADC12LO_L          = 0x0808;
ADC12LO_H          = 0x0809;
ADC12HI            = 0x080A;
ADC12HI_L          = 0x080A;
ADC12HI_H          = 0x080B;
ADC12IFGR0         = 0x080C;
ADC12IFGR0_L       = 0x080C;
ADC12IFGR0_H       = 0x080D;
ADC12IFGR1         = 0x080E;
ADC12IFGR1_L       = 0x080E;
ADC12IFGR1_H       = 0x080F;
ADC12IFGR2         = 0x0810;
ADC12IFGR2_L       = 0x0810;
ADC12IFGR2_H       = 0x0811;
ADC12IER0          = 0x0812;
ADC12IER0_L        = 0x0812;
ADC12IER0_H        = 0x0813;
ADC12IER1          = 0x0814;
ADC12IER1_L        = 0x0814;
ADC12IER1_H        = 0x0815;
ADC12IER2          = 0x0816;
ADC12IER2_L        = 0x0816;
ADC12IER2_H        = 0x0817;
ADC12IV            = 0x0818;
ADC12IV_L          = 0x0818;
ADC12IV_H          = 0x0819;
ADC12MCTL0         = 0x0820;
ADC12MCTL0_L       = 0x0820;
ADC12MCTL0_H       = 0x0821;
ADC12MCTL1         = 0x0822;
ADC12MCTL1_L       = 0x0822;
ADC12MCTL1_H       = 0x0823;
ADC12MCTL2         = 0x0824;
ADC12MCTL2_L       = 0x0824;
ADC12MCTL2_H       = 0x0825;
ADC12MCTL3         = 0x0826;
ADC12MCTL3_L       = 0x0826;
ADC12MCTL3_H       = 0x0827;
ADC12MCTL4         = 0x0828;
ADC12MCTL4_L       = 0x0828;
ADC12MCTL4_H       = 0x0829;
ADC12MCTL5         = 0x082A;
ADC12MCTL5_L       = 0x082A;
ADC12MCTL5_H       = 0x082B;
ADC12MCTL6         = 0x082C;
ADC12MCTL6_L       = 0x082C;
ADC12MCTL6_H       = 0x082D;
ADC12MCTL7         = 0x082E;
ADC12MCTL7_L       = 0x082E;
ADC12MCTL7_H       = 0x082F;
ADC12MCTL8         = 0x0830;
ADC12MCTL8_L       = 0x0830;
ADC12MCTL8_H       = 0x0831;
ADC12MCTL9         = 0x0832;
ADC12MCTL9_L       = 0x0832;
ADC12MCTL9_H       = 0x0833;
ADC12MCTL10        = 0x0834;
ADC12MCTL10_L      = 0x0834;
ADC12MCTL10_H      = 0x0835;
ADC12MCTL11        = 0x0836;
ADC12MCTL11_L      = 0x0836;
ADC12MCTL11_H      = 0x0837;
ADC12MCTL12        = 0x0838;
ADC12MCTL12_L      = 0x0838;
ADC12MCTL12_H      = 0x0839;
ADC12MCTL13        = 0x083A;
ADC12MCTL13_L      = 0x083A;
ADC12MCTL13_H      = 0x083B;
ADC12MCTL14        = 0x083C;
ADC12MCTL14_L      = 0x083C;
ADC12MCTL14_H      = 0x083D;
ADC12MCTL15        = 0x083E;
ADC12MCTL15_L      = 0x083E;
ADC12MCTL15_H      = 0x083F;
ADC12MCTL16        = 0x0840;
ADC12MCTL16_L      = 0x0840;
ADC12MCTL16_H      = 0x0841;
ADC12MCTL17        = 0x0842;
ADC12MCTL17_L      = 0x0842;
ADC12MCTL17_H      = 0x0843;
ADC12MCTL18        = 0x0844;
ADC12MCTL18_L      = 0x0844;
ADC12MCTL18_H      = 0x0845;
ADC12MCTL19        = 0x0846;
ADC12MCTL19_L      = 0x0846;
ADC12MCTL19_H      = 0x0847;
ADC12MCTL20        = 0x0848;
ADC12MCTL20_L      = 0x0848;
ADC12MCTL20_H      = 0x0849;
ADC12MCTL21        = 0x084A;
ADC12MCTL21_L      = 0x084A;
ADC12MCTL21_H      = 0x084B;
ADC12MCTL22        = 0x084C;
ADC12MCTL22_L      = 0x084C;
ADC12MCTL22_H      = 0x084D;
ADC12MCTL23        = 0x084E;
ADC12MCTL23_L      = 0x084E;
ADC12MCTL23_H      = 0x084F;
ADC12MCTL24        = 0x0850;
ADC12MCTL24_L      = 0x0850;
ADC12MCTL24_H      = 0x0851;
ADC12MCTL25        = 0x0852;
ADC12MCTL25_L      = 0x0852;
ADC12MCTL25_H      = 0x0853;
ADC12MCTL26        = 0x0854;
ADC12MCTL26_L      = 0x0854;
ADC12MCTL26_H      = 0x0855;
ADC12MCTL27        = 0x0856;
ADC12MCTL27_L      = 0x0856;
ADC12MCTL27_H      = 0x0857;
ADC12MCTL28        = 0x0858;
ADC12MCTL28_L      = 0x0858;
ADC12MCTL28_H      = 0x0859;
ADC12MCTL29        = 0x085A;
ADC12MCTL29_L      = 0x085A;
ADC12MCTL29_H      = 0x085B;
ADC12MCTL30        = 0x085C;
ADC12MCTL30_L      = 0x085C;
ADC12MCTL30_H      = 0x085D;
ADC12MCTL31        = 0x085E;
ADC12MCTL31_L      = 0x085E;
ADC12MCTL31_H      = 0x085F;
ADC12MEM0          = 0x0860;
ADC12MEM0_L        = 0x0860;
ADC12MEM0_H        = 0x0861;
ADC12MEM1          = 0x0862;
ADC12MEM1_L        = 0x0862;
ADC12MEM1_H        = 0x0863;
ADC12MEM2          = 0x0864;
ADC12MEM2_L        = 0x0864;
ADC12MEM2_H        = 0x0865;
ADC12MEM3          = 0x0866;
ADC12MEM3_L        = 0x0866;
ADC12MEM3_H        = 0x0867;
ADC12MEM4          = 0x0868;
ADC12MEM4_L        = 0x0868;
ADC12MEM4_H        = 0x0869;
ADC12MEM5          = 0x086A;
ADC12MEM5_L        = 0x086A;
ADC12MEM5_H        = 0x086B;
ADC12MEM6          = 0x086C;
ADC12MEM6_L        = 0x086C;
ADC12MEM6_H        = 0x086D;
ADC12MEM7          = 0x086E;
ADC12MEM7_L        = 0x086E;
ADC12MEM7_H        = 0x086F;
ADC12MEM8          = 0x0870;
ADC12MEM8_L        = 0x0870;
ADC12MEM8_H        = 0x0871;
ADC12MEM9          = 0x0872;
ADC12MEM9_L        = 0x0872;
ADC12MEM9_H        = 0x0873;
ADC12MEM10         = 0x0874;
ADC12MEM10_L       = 0x0874;
ADC12MEM10_H       = 0x0875;
ADC12MEM11         = 0x0876;
ADC12MEM11_L       = 0x0876;
ADC12MEM11_H       = 0x0877;
ADC12MEM12         = 0x0878;
ADC12MEM12_L       = 0x0878;
ADC12MEM12_H       = 0x0879;
ADC12MEM13         = 0x087A;
ADC12MEM13_L       = 0x087A;
ADC12MEM13_H       = 0x087B;
ADC12MEM14         = 0x087C;
ADC12MEM14_L       = 0x087C;
ADC12MEM14_H       = 0x087D;
ADC12MEM15         = 0x087E;
ADC12MEM15_L       = 0x087E;
ADC12MEM15_H       = 0x087F;
ADC12MEM16         = 0x0880;
ADC12MEM16_L       = 0x0880;
ADC12MEM16_H       = 0x0881;
ADC12MEM17         = 0x0882;
ADC12MEM17_L       = 0x0882;
ADC12MEM17_H       = 0x0883;
ADC12MEM18         = 0x0884;
ADC12MEM18_L       = 0x0884;
ADC12MEM18_H       = 0x0885;
ADC12MEM19         = 0x0886;
ADC12MEM19_L       = 0x0886;
ADC12MEM19_H       = 0x0887;
ADC12MEM20         = 0x0888;
ADC12MEM20_L       = 0x0888;
ADC12MEM20_H       = 0x0889;
ADC12MEM21         = 0x088A;
ADC12MEM21_L       = 0x088A;
ADC12MEM21_H       = 0x088B;
ADC12MEM22         = 0x088C;
ADC12MEM22_L       = 0x088C;
ADC12MEM22_H       = 0x088D;
ADC12MEM23         = 0x088E;
ADC12MEM23_L       = 0x088E;
ADC12MEM23_H       = 0x088F;
ADC12MEM24         = 0x0890;
ADC12MEM24_L       = 0x0890;
ADC12MEM24_H       = 0x0891;
ADC12MEM25         = 0x0892;
ADC12MEM25_L       = 0x0892;
ADC12MEM25_H       = 0x0893;
ADC12MEM26         = 0x0894;
ADC12MEM26_L       = 0x0894;
ADC12MEM26_H       = 0x0895;
ADC12MEM27         = 0x0896;
ADC12MEM27_L       = 0x0896;
ADC12MEM27_H       = 0x0897;
ADC12MEM28         = 0x0898;
ADC12MEM28_L       = 0x0898;
ADC12MEM28_H       = 0x0899;
ADC12MEM29         = 0x089A;
ADC12MEM29_L       = 0x089A;
ADC12MEM29_H       = 0x089B;
ADC12MEM30         = 0x089C;
ADC12MEM30_L       = 0x089C;
ADC12MEM30_H       = 0x089D;
ADC12MEM31         = 0x089E;
ADC12MEM31_L       = 0x089E;
ADC12MEM31_H       = 0x089F;
/************************************************************
* AES256 Accelerator
************************************************************/
AESACTL0           = 0x09C0;
AESACTL0_L         = 0x09C0;
AESACTL0_H         = 0x09C1;
AESACTL1           = 0x09C2;
AESACTL1_L         = 0x09C2;
AESACTL1_H         = 0x09C3;
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
AESAXDIN           = 0x09CC;
AESAXDIN_L         = 0x09CC;
AESAXDIN_H         = 0x09CD;
AESAXIN            = 0x09CE;
AESAXIN_L          = 0x09CE;
AESAXIN_H          = 0x09CF;
/************************************************************
* Capacitive_Touch_IO 0
************************************************************/
CAPTIO0CTL         = 0x043E;
CAPTIO0CTL_L       = 0x043E;
CAPTIO0CTL_H       = 0x043F;
/************************************************************
* Capacitive_Touch_IO 1
************************************************************/
CAPTIO1CTL         = 0x047E;
CAPTIO1CTL_L       = 0x047E;
CAPTIO1CTL_H       = 0x047F;
/************************************************************
* Comparator E
************************************************************/
CECTL0             = 0x08C0;
CECTL0_L           = 0x08C0;
CECTL0_H           = 0x08C1;
CECTL1             = 0x08C2;
CECTL1_L           = 0x08C2;
CECTL1_H           = 0x08C3;
CECTL2             = 0x08C4;
CECTL2_L           = 0x08C4;
CECTL2_H           = 0x08C5;
CECTL3             = 0x08C6;
CECTL3_L           = 0x08C6;
CECTL3_H           = 0x08C7;
CEINT              = 0x08CC;
CEINT_L            = 0x08CC;
CEINT_H            = 0x08CD;
CEIV               = 0x08CE;
CEIV_L             = 0x08CE;
CEIV_H             = 0x08CF;
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
/*************************************************************
* CRC Module
*************************************************************/
CRC32DIW0          = 0x0980;
CRC32DIW0_L        = 0x0980;
CRC32DIW0_H        = 0x0981;
CRC32DIW1          = 0x0982;
CRC32DIW1_L        = 0x0982;
CRC32DIW1_H        = 0x0983;
CRC32DIRBW1        = 0x0984;
CRC32DIRBW1_L      = 0x0984;
CRC32DIRBW1_H      = 0x0985;
CRC32DIRBW0        = 0x0986;
CRC32DIRBW0_L      = 0x0986;
CRC32DIRBW0_H      = 0x0987;
CRC32INIRESW0      = 0x0988;
CRC32INIRESW0_L    = 0x0988;
CRC32INIRESW0_H    = 0x0989;
CRC32INIRESW1      = 0x098A;
CRC32INIRESW1_L    = 0x098A;
CRC32INIRESW1_H    = 0x098B;
CRC32RESRW1        = 0x098C;
CRC32RESRW1_L      = 0x098C;
CRC32RESRW1_H      = 0x098D;
CRC32RESRW0        = 0x098E;
CRC32RESRW0_L      = 0x098E;
CRC32RESRW0_H      = 0x098F;
CRC16DIW0          = 0x0990;
CRC16DIW0_L        = 0x0990;
CRC16DIW0_H        = 0x0991;
CRC16DIW1          = 0x0992;
CRC16DIW1_L        = 0x0992;
CRC16DIW1_H        = 0x0993;
CRC16DIRBW1        = 0x0994;
CRC16DIRBW1_L      = 0x0994;
CRC16DIRBW1_H      = 0x0995;
CRC16DIRBW0        = 0x0996;
CRC16DIRBW0_L      = 0x0996;
CRC16DIRBW0_H      = 0x0997;
CRC16INIRESW0      = 0x0998;
CRC16INIRESW0_L    = 0x0998;
CRC16INIRESW0_H    = 0x0999;
CRC16RESRW0        = 0x099E;
CRC16RESRW0_L      = 0x099E;
CRC16RESRW0_H      = 0x099F;
CRC16RESRW1        = 0x099C;
CRC16RESRW1_L      = 0x099C;
CRC16RESRW1_H      = 0x099D;
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
DMA0SAH            = 0x0514;
DMA0DA             = 0x0516;
DMA0DAL            = 0x0516;
DMA0DAH            = 0x0518;
DMA0SZ             = 0x051A;
DMA1CTL            = 0x0520;
DMA1CTL_L          = 0x0520;
DMA1CTL_H          = 0x0521;
DMA1SA             = 0x0522;
DMA1SAL            = 0x0522;
DMA1SAH            = 0x0524;
DMA1DA             = 0x0526;
DMA1DAL            = 0x0526;
DMA1DAH            = 0x0528;
DMA1SZ             = 0x052A;
DMA2CTL            = 0x0530;
DMA2CTL_L          = 0x0530;
DMA2CTL_H          = 0x0531;
DMA2SA             = 0x0532;
DMA2SAL            = 0x0532;
DMA2SAH            = 0x0534;
DMA2DA             = 0x0536;
DMA2DAL            = 0x0536;
DMA2DAH            = 0x0538;
DMA2SZ             = 0x053A;
/************************************************************
* EXTENDED SCAN INTERFACE
************************************************************/
ESIDEBUG1          = 0x0D00;
ESIDEBUG1_L        = 0x0D00;
ESIDEBUG1_H        = 0x0D01;
ESIDEBUG2          = 0x0D02;
ESIDEBUG2_L        = 0x0D02;
ESIDEBUG2_H        = 0x0D03;
ESIDEBUG3          = 0x0D04;
ESIDEBUG3_L        = 0x0D04;
ESIDEBUG3_H        = 0x0D05;
ESIDEBUG4          = 0x0D06;
ESIDEBUG4_L        = 0x0D06;
ESIDEBUG4_H        = 0x0D07;
ESIDEBUG5          = 0x0D08;
ESIDEBUG5_L        = 0x0D08;
ESIDEBUG5_H        = 0x0D09;
ESICNT0            = 0x0D10;
ESICNT0_L          = 0x0D10;
ESICNT0_H          = 0x0D11;
ESICNT1            = 0x0D12;
ESICNT1_L          = 0x0D12;
ESICNT1_H          = 0x0D13;
ESICNT2            = 0x0D14;
ESICNT2_L          = 0x0D14;
ESICNT2_H          = 0x0D15;
ESICNT3            = 0x0D16;
ESICNT3_L          = 0x0D16;
ESICNT3_H          = 0x0D17;
ESIIV              = 0x0D1A;
ESIIV_L            = 0x0D1A;
ESIIV_H            = 0x0D1B;
ESIINT1            = 0x0D1C;
ESIINT1_L          = 0x0D1C;
ESIINT1_H          = 0x0D1D;
ESIINT2            = 0x0D1E;
ESIINT2_L          = 0x0D1E;
ESIINT2_H          = 0x0D1F;
ESIAFE             = 0x0D20;
ESIAFE_L           = 0x0D20;
ESIAFE_H           = 0x0D21;
ESIPPU             = 0x0D22;
ESIPPU_L           = 0x0D22;
ESIPPU_H           = 0x0D23;
ESITSM             = 0x0D24;
ESITSM_L           = 0x0D24;
ESITSM_H           = 0x0D25;
ESIPSM             = 0x0D26;
ESIPSM_L           = 0x0D26;
ESIPSM_H           = 0x0D27;
ESIOSC             = 0x0D28;
ESIOSC_L           = 0x0D28;
ESIOSC_H           = 0x0D29;
ESICTL             = 0x0D2A;
ESICTL_L           = 0x0D2A;
ESICTL_H           = 0x0D2B;
ESITHR1            = 0x0D2C;
ESITHR1_L          = 0x0D2C;
ESITHR1_H          = 0x0D2D;
ESITHR2            = 0x0D2E;
ESITHR2_L          = 0x0D2E;
ESITHR2_H          = 0x0D2F;
ESIDAC1R0          = 0x0D40;
ESIDAC1R0_L        = 0x0D40;
ESIDAC1R0_H        = 0x0D41;
ESIDAC1R1          = 0x0D42;
ESIDAC1R1_L        = 0x0D42;
ESIDAC1R1_H        = 0x0D43;
ESIDAC1R2          = 0x0D44;
ESIDAC1R2_L        = 0x0D44;
ESIDAC1R2_H        = 0x0D45;
ESIDAC1R3          = 0x0D46;
ESIDAC1R3_L        = 0x0D46;
ESIDAC1R3_H        = 0x0D47;
ESIDAC1R4          = 0x0D48;
ESIDAC1R4_L        = 0x0D48;
ESIDAC1R4_H        = 0x0D49;
ESIDAC1R5          = 0x0D4A;
ESIDAC1R5_L        = 0x0D4A;
ESIDAC1R5_H        = 0x0D4B;
ESIDAC1R6          = 0x0D4C;
ESIDAC1R6_L        = 0x0D4C;
ESIDAC1R6_H        = 0x0D4D;
ESIDAC1R7          = 0x0D4E;
ESIDAC1R7_L        = 0x0D4E;
ESIDAC1R7_H        = 0x0D4F;
ESIDAC2R0          = 0x0D50;
ESIDAC2R0_L        = 0x0D50;
ESIDAC2R0_H        = 0x0D51;
ESIDAC2R1          = 0x0D52;
ESIDAC2R1_L        = 0x0D52;
ESIDAC2R1_H        = 0x0D53;
ESIDAC2R2          = 0x0D54;
ESIDAC2R2_L        = 0x0D54;
ESIDAC2R2_H        = 0x0D55;
ESIDAC2R3          = 0x0D56;
ESIDAC2R3_L        = 0x0D56;
ESIDAC2R3_H        = 0x0D57;
ESIDAC2R4          = 0x0D58;
ESIDAC2R4_L        = 0x0D58;
ESIDAC2R4_H        = 0x0D59;
ESIDAC2R5          = 0x0D5A;
ESIDAC2R5_L        = 0x0D5A;
ESIDAC2R5_H        = 0x0D5B;
ESIDAC2R6          = 0x0D5C;
ESIDAC2R6_L        = 0x0D5C;
ESIDAC2R6_H        = 0x0D5D;
ESIDAC2R7          = 0x0D5E;
ESIDAC2R7_L        = 0x0D5E;
ESIDAC2R7_H        = 0x0D5F;
ESITSM0            = 0x0D60;
ESITSM0_L          = 0x0D60;
ESITSM0_H          = 0x0D61;
ESITSM1            = 0x0D62;
ESITSM1_L          = 0x0D62;
ESITSM1_H          = 0x0D63;
ESITSM2            = 0x0D64;
ESITSM2_L          = 0x0D64;
ESITSM2_H          = 0x0D65;
ESITSM3            = 0x0D66;
ESITSM3_L          = 0x0D66;
ESITSM3_H          = 0x0D67;
ESITSM4            = 0x0D68;
ESITSM4_L          = 0x0D68;
ESITSM4_H          = 0x0D69;
ESITSM5            = 0x0D6A;
ESITSM5_L          = 0x0D6A;
ESITSM5_H          = 0x0D6B;
ESITSM6            = 0x0D6C;
ESITSM6_L          = 0x0D6C;
ESITSM6_H          = 0x0D6D;
ESITSM7            = 0x0D6E;
ESITSM7_L          = 0x0D6E;
ESITSM7_H          = 0x0D6F;
ESITSM8            = 0x0D70;
ESITSM8_L          = 0x0D70;
ESITSM8_H          = 0x0D71;
ESITSM9            = 0x0D72;
ESITSM9_L          = 0x0D72;
ESITSM9_H          = 0x0D73;
ESITSM10           = 0x0D74;
ESITSM10_L         = 0x0D74;
ESITSM10_H         = 0x0D75;
ESITSM11           = 0x0D76;
ESITSM11_L         = 0x0D76;
ESITSM11_H         = 0x0D77;
ESITSM12           = 0x0D78;
ESITSM12_L         = 0x0D78;
ESITSM12_H         = 0x0D79;
ESITSM13           = 0x0D7A;
ESITSM13_L         = 0x0D7A;
ESITSM13_H         = 0x0D7B;
ESITSM14           = 0x0D7C;
ESITSM14_L         = 0x0D7C;
ESITSM14_H         = 0x0D7D;
ESITSM15           = 0x0D7E;
ESITSM15_L         = 0x0D7E;
ESITSM15_H         = 0x0D7F;
ESITSM16           = 0x0D80;
ESITSM16_L         = 0x0D80;
ESITSM16_H         = 0x0D81;
ESITSM17           = 0x0D82;
ESITSM17_L         = 0x0D82;
ESITSM17_H         = 0x0D83;
ESITSM18           = 0x0D84;
ESITSM18_L         = 0x0D84;
ESITSM18_H         = 0x0D85;
ESITSM19           = 0x0D86;
ESITSM19_L         = 0x0D86;
ESITSM19_H         = 0x0D87;
ESITSM20           = 0x0D88;
ESITSM20_L         = 0x0D88;
ESITSM20_H         = 0x0D89;
ESITSM21           = 0x0D8A;
ESITSM21_L         = 0x0D8A;
ESITSM21_H         = 0x0D8B;
ESITSM22           = 0x0D8C;
ESITSM22_L         = 0x0D8C;
ESITSM22_H         = 0x0D8D;
ESITSM23           = 0x0D8E;
ESITSM23_L         = 0x0D8E;
ESITSM23_H         = 0x0D8F;
ESITSM24           = 0x0D90;
ESITSM24_L         = 0x0D90;
ESITSM24_H         = 0x0D91;
ESITSM25           = 0x0D92;
ESITSM25_L         = 0x0D92;
ESITSM25_H         = 0x0D93;
ESITSM26           = 0x0D94;
ESITSM26_L         = 0x0D94;
ESITSM26_H         = 0x0D95;
ESITSM27           = 0x0D96;
ESITSM27_L         = 0x0D96;
ESITSM27_H         = 0x0D97;
ESITSM28           = 0x0D98;
ESITSM28_L         = 0x0D98;
ESITSM28_H         = 0x0D99;
ESITSM29           = 0x0D9A;
ESITSM29_L         = 0x0D9A;
ESITSM29_H         = 0x0D9B;
ESITSM30           = 0x0D9C;
ESITSM30_L         = 0x0D9C;
ESITSM30_H         = 0x0D9D;
ESITSM31           = 0x0D9E;
ESITSM31_L         = 0x0D9E;
ESITSM31_H         = 0x0D9F;
/************************************************************
* EXTENDED SCAN INTERFACE RAM
************************************************************/
ESIRAM0            = 0x0E00;
ESIRAM1            = 0x0E01;
ESIRAM2            = 0x0E02;
ESIRAM3            = 0x0E03;
ESIRAM4            = 0x0E04;
ESIRAM5            = 0x0E05;
ESIRAM6            = 0x0E06;
ESIRAM7            = 0x0E07;
ESIRAM8            = 0x0E08;
ESIRAM9            = 0x0E09;
ESIRAM10           = 0x0E0A;
ESIRAM11           = 0x0E0B;
ESIRAM12           = 0x0E0C;
ESIRAM13           = 0x0E0D;
ESIRAM14           = 0x0E0E;
ESIRAM15           = 0x0E0F;
ESIRAM16           = 0x0E10;
ESIRAM17           = 0x0E11;
ESIRAM18           = 0x0E12;
ESIRAM19           = 0x0E13;
ESIRAM20           = 0x0E14;
ESIRAM21           = 0x0E15;
ESIRAM22           = 0x0E16;
ESIRAM23           = 0x0E17;
ESIRAM24           = 0x0E18;
ESIRAM25           = 0x0E19;
ESIRAM26           = 0x0E1A;
ESIRAM27           = 0x0E1B;
ESIRAM28           = 0x0E1C;
ESIRAM29           = 0x0E1D;
ESIRAM30           = 0x0E1E;
ESIRAM31           = 0x0E1F;
ESIRAM32           = 0x0E20;
ESIRAM33           = 0x0E21;
ESIRAM34           = 0x0E22;
ESIRAM35           = 0x0E23;
ESIRAM36           = 0x0E24;
ESIRAM37           = 0x0E25;
ESIRAM38           = 0x0E26;
ESIRAM39           = 0x0E27;
ESIRAM40           = 0x0E28;
ESIRAM41           = 0x0E29;
ESIRAM42           = 0x0E2A;
ESIRAM43           = 0x0E2B;
ESIRAM44           = 0x0E2C;
ESIRAM45           = 0x0E2D;
ESIRAM46           = 0x0E2E;
ESIRAM47           = 0x0E2F;
ESIRAM48           = 0x0E30;
ESIRAM49           = 0x0E31;
ESIRAM50           = 0x0E32;
ESIRAM51           = 0x0E33;
ESIRAM52           = 0x0E34;
ESIRAM53           = 0x0E35;
ESIRAM54           = 0x0E36;
ESIRAM55           = 0x0E37;
ESIRAM56           = 0x0E38;
ESIRAM57           = 0x0E39;
ESIRAM58           = 0x0E3A;
ESIRAM59           = 0x0E3B;
ESIRAM60           = 0x0E3C;
ESIRAM61           = 0x0E3D;
ESIRAM62           = 0x0E3E;
ESIRAM63           = 0x0E3F;
ESIRAM64           = 0x0E40;
ESIRAM65           = 0x0E41;
ESIRAM66           = 0x0E42;
ESIRAM67           = 0x0E43;
ESIRAM68           = 0x0E44;
ESIRAM69           = 0x0E45;
ESIRAM70           = 0x0E46;
ESIRAM71           = 0x0E47;
ESIRAM72           = 0x0E48;
ESIRAM73           = 0x0E49;
ESIRAM74           = 0x0E4A;
ESIRAM75           = 0x0E4B;
ESIRAM76           = 0x0E4C;
ESIRAM77           = 0x0E4D;
ESIRAM78           = 0x0E4E;
ESIRAM79           = 0x0E4F;
ESIRAM80           = 0x0E50;
ESIRAM81           = 0x0E51;
ESIRAM82           = 0x0E52;
ESIRAM83           = 0x0E53;
ESIRAM84           = 0x0E54;
ESIRAM85           = 0x0E55;
ESIRAM86           = 0x0E56;
ESIRAM87           = 0x0E57;
ESIRAM88           = 0x0E58;
ESIRAM89           = 0x0E59;
ESIRAM90           = 0x0E5A;
ESIRAM91           = 0x0E5B;
ESIRAM92           = 0x0E5C;
ESIRAM93           = 0x0E5D;
ESIRAM94           = 0x0E5E;
ESIRAM95           = 0x0E5F;
ESIRAM96           = 0x0E60;
ESIRAM97           = 0x0E61;
ESIRAM98           = 0x0E62;
ESIRAM99           = 0x0E63;
ESIRAM100          = 0x0E64;
ESIRAM101          = 0x0E65;
ESIRAM102          = 0x0E66;
ESIRAM103          = 0x0E67;
ESIRAM104          = 0x0E68;
ESIRAM105          = 0x0E69;
ESIRAM106          = 0x0E6A;
ESIRAM107          = 0x0E6B;
ESIRAM108          = 0x0E6C;
ESIRAM109          = 0x0E6D;
ESIRAM110          = 0x0E6E;
ESIRAM111          = 0x0E6F;
ESIRAM112          = 0x0E70;
ESIRAM113          = 0x0E71;
ESIRAM114          = 0x0E72;
ESIRAM115          = 0x0E73;
ESIRAM116          = 0x0E74;
ESIRAM117          = 0x0E75;
ESIRAM118          = 0x0E76;
ESIRAM119          = 0x0E77;
ESIRAM120          = 0x0E78;
ESIRAM121          = 0x0E79;
ESIRAM122          = 0x0E7A;
ESIRAM123          = 0x0E7B;
ESIRAM124          = 0x0E7C;
ESIRAM125          = 0x0E7D;
ESIRAM126          = 0x0E7E;
ESIRAM127          = 0x0E7F;
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
MPUSEGB2           = 0x05A4;
MPUSEGB2_L         = 0x05A4;
MPUSEGB2_H         = 0x05A5;
MPUSEGB1           = 0x05A6;
MPUSEGB1_L         = 0x05A6;
MPUSEGB1_H         = 0x05A7;
MPUSAM             = 0x05A8;
MPUSAM_L           = 0x05A8;
MPUSAM_H           = 0x05A9;
MPUIPC0            = 0x05AA;
MPUIPC0_L          = 0x05AA;
MPUIPC0_H          = 0x05AB;
MPUIPSEGB2         = 0x05AC;
MPUIPSEGB2_L       = 0x05AC;
MPUIPSEGB2_H       = 0x05AD;
MPUIPSEGB1         = 0x05AE;
MPUIPSEGB1_L       = 0x05AE;
MPUIPSEGB1_H       = 0x05AF;
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
* PMM - Power Management System for FRAM
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
PBSEL0             = 0x022A;
PBSEL0_L           = 0x022A;
PBSEL0_H           = 0x022B;
PBSEL1             = 0x022C;
PBSEL1_L           = 0x022C;
PBSEL1_H           = 0x022D;
PBSELC             = 0x0236;
PBSELC_L           = 0x0236;
PBSELC_H           = 0x0237;
PBIES              = 0x0238;
PBIES_L            = 0x0238;
PBIES_H            = 0x0239;
PBIE               = 0x023A;
PBIE_L             = 0x023A;
PBIE_H             = 0x023B;
PBIFG              = 0x023C;
PBIFG_L            = 0x023C;
PBIFG_H            = 0x023D;
P3IV               = 0x022E;
P4IV               = 0x023E;
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
PCSEL0             = 0x024A;
PCSEL0_L           = 0x024A;
PCSEL0_H           = 0x024B;
PCSEL1             = 0x024C;
PCSEL1_L           = 0x024C;
PCSEL1_H           = 0x024D;
PCSELC             = 0x0256;
PCSELC_L           = 0x0256;
PCSELC_H           = 0x0257;
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
PDSEL0             = 0x026A;
PDSEL0_L           = 0x026A;
PDSEL0_H           = 0x026B;
PDSEL1             = 0x026C;
PDSEL1_L           = 0x026C;
PDSEL1_H           = 0x026D;
PDSELC             = 0x0276;
PDSELC_L           = 0x0276;
PDSELC_H           = 0x0277;
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
PESEL0             = 0x028A;
PESEL0_L           = 0x028A;
PESEL0_H           = 0x028B;
PESEL1             = 0x028C;
PESEL1_L           = 0x028C;
PESEL1_H           = 0x028D;
PESELC             = 0x0296;
PESELC_L           = 0x0296;
PESELC_H           = 0x0297;
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
/*************************************************************
* RAM Control Module for FRAM
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
RTCCTL0            = 0x04A0;
RTCCTL0_L          = 0x04A0;
RTCCTL0_H          = 0x04A1;
RTCCTL13           = 0x04A2;
RTCCTL13_L         = 0x04A2;
RTCCTL13_H         = 0x04A3;
RTCOCAL            = 0x04A4;
RTCOCAL_L          = 0x04A4;
RTCOCAL_H          = 0x04A5;
RTCTCMP            = 0x04A6;
RTCTCMP_L          = 0x04A6;
RTCTCMP_H          = 0x04A7;
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
* Timer3_A5
************************************************************/
TA3CTL             = 0x0440;
TA3CCTL0           = 0x0442;
TA3CCTL1           = 0x0444;
TA3CCTL2           = 0x0446;
TA3CCTL3           = 0x0448;
TA3CCTL4           = 0x044A;
TA3R               = 0x0450;
TA3CCR0            = 0x0452;
TA3CCR1            = 0x0454;
TA3CCR2            = 0x0456;
TA3CCR3            = 0x0458;
TA3CCR4            = 0x045A;
TA3IV              = 0x046E;
TA3EX0             = 0x0460;
/************************************************************
* Timer0_B7
************************************************************/
TB0CTL             = 0x03C0;
TB0CCTL0           = 0x03C2;
TB0CCTL1           = 0x03C4;
TB0CCTL2           = 0x03C6;
TB0CCTL3           = 0x03C8;
TB0CCTL4           = 0x03CA;
TB0CCTL5           = 0x03CC;
TB0CCTL6           = 0x03CE;
TB0R               = 0x03D0;
TB0CCR0            = 0x03D2;
TB0CCR1            = 0x03D4;
TB0CCR2            = 0x03D6;
TB0CCR3            = 0x03D8;
TB0CCR4            = 0x03DA;
TB0CCR5            = 0x03DC;
TB0CCR6            = 0x03DE;
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
* Interrupt Vectors (offset from 0xFF80 + 0x10 for Password)
************************************************************/
/************************************************************
* End of Modules
************************************************************/

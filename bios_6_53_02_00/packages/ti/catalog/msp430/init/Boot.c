/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *  ======== Boot.c ========
 *
 *  Perform the following critical 430 initializations prior to cinit:
 *
 *  1) Optionally disable the watchdog timer.
 *  2) Optionally configure the DCO and clocks.
 */

#include <xdc/std.h>
#if defined(__ICC430__)
    #include <intrinsics.h>
#endif

#define REG(x)      (*(volatile UInt *)(x))
#define BYTEREG(x)  (*(volatile Char *)(x))

#define Boot_disableWatchdog   ti_catalog_msp430_init_Boot_disableWatchdog
#define Boot_configureDCO      ti_catalog_msp430_init_Boot_configureDCO
#define Boot_configureDCO_CS_A ti_catalog_msp430_init_Boot_configureDCO_CS_A
#define Boot_configureDCO_CS_A_useLFXT ti_catalog_msp430_init_Boot_configureDCO_CS_A_useLFXT

#define WDTPW           0x5a00  /* WDT password */
#define WDTHOLD         0x0080  /* WDT hold bit */

/* UCS defines */
#define UCSCTL0         0x160   /* UCS control reg 0 */
#define UCSCTL1         0x162   /* UCS control reg 1 */
#define UCSCTL2         0x164   /* UCS control reg 2 */
#define UCSCTL3         0x166   /* UCS control reg 3 */
#define UCSCTL4         0x168   /* UCS control reg 4 */
#define UCSCTL7         0x16E   /* UCS control reg 7 */
#define SFRIFG1         0x102   /* interrupt flag register */

#define SELREF_2        0x20    /* FLL ref clock select */
#define SELA_2          0x200   /* ACLK source select */
#define DCORSEL_5       0x50    /* freq range select */
#define FLLD_1          0x1000  /* multiply select */
#define XT2OFFG         0x8     /* XT2 fault flag */
#define XT1LFOFFG       0x2     /* XT1 low freq fault flag */
#define XT1HFOFFG       0x4     /* XT1 high freq fault flag */
#define DCOFFG          0x1     /* DCO fault flag */
#define OFIFG           0x2     /* Osc fault flag */
#define SCG0            0x40    /* system clock generator 0 control bit  */

/* CS_A defines */
#define CSCTL0_H        0x161   /* CS control reg 0 (high) */
#define CSCTL1          0x162   /* CS control reg 1 */
#define CSCTL2          0x164   /* CS control reg 2 */
#define CSCTL3          0x166   /* CS control reg 3 */
#define CSCTL4          0x168   /* CS control reg 3 */
#define CSCTL5          0x16A   /* CS control reg 3 */

#define DCOFSEL_6       0x000C  /* DCO freq select (8MHz) */
#define SELM_3          0x0003  /* MCLK source select (DCO) */
#define SELS_3          0x0030  /* SMCLK source select (DCO) */
#define DIVM_0          0x0     /* MCLK clock divider */
#define DIVS_0          0x0     /* SMCLK clock divider */
#define DIVA_0          0x0     /* ACLK clock divider */

#define LFXTDRIVE_0     0x0     /* lowest drive strength */
#define LFXTOFF         0x1     /* enable LFXT */
#define LFXTOFFG        0x1     /* clear XT1 fault flag */
#define PJSEL0          0x032A  /* Port PJ select register */
#define BIT4            0x10    /* LFXIN crystal mode select */

#if defined(__MSP430__)
    #pragma CODE_SECTION(Boot_disableWatchdog, ".text:.bootCodeSection")
    #pragma CODE_SECTION(Boot_configureDCO, ".text:.bootCodeSection")
    #pragma CODE_SECTION(Boot_configureDCO_CS_A, ".text:.bootCodeSection")
    #pragma CODE_SECTION(Boot_configureDCO_CS_A_useLFXT, ".text:.bootCodeSection")
#endif
/*
 *  ======== Boot_disableWatchdog ========
 */
#if defined(__ICC430__)
    #pragma location="CSTART"
#endif
Void Boot_disableWatchdog(UInt address)
{
    REG(address) = WDTPW + WDTHOLD;     /* disable watchdog */
}

/*
 *  ======== Boot_configureDCO ========
 *  Initializes MSP430F5xxx clocks and DCO for:
 *      ACLK = REFO = 32768Hz
 *      MCLK = SMCLK = 8.192MHz
 *  Derived from the msp430x54x_UCS_3.c and MSP430F552x_UCS_03.c examples.
 */
#if defined(__ICC430__)
    #pragma location="CSTART"
#endif
Void Boot_configureDCO(Void)
{
    REG(UCSCTL3) |= SELREF_2;           /* set FLL ref to REF0 */
    REG(UCSCTL4) |= SELA_2;             /* set ACLK to REF0 */

    __bis_SR_register(SCG0);            /* disable FLL */
    REG(UCSCTL0) = 0x0000;              /* set lowest DCOx and MODx bits */
    REG(UCSCTL1) = DCORSEL_5;           /* select 24 MHz range */

    REG(UCSCTL2)  = FLLD_1 + 249;       /*
                                         * set multiplier for 8.192MHz:
                                         *     (N + 1) * FLLRef = Fdco
                                         *   (249 + 1) * 32768  = 8.192 MHz
                                         *      FLL Div = fDCOCLK/2
                                         */

    __bic_SR_register(SCG0);            /* enable FLL */

    /*
     * worst-case settling time (MCLK cylces)
     *    =  N x 32 x 32 x f_MCLK / f_FLL_ref
     *
     * 250000 =  32 x 32 x 8 MHz / 32768 Hz
     */
    __delay_cycles(250000);

    /* wait until XT1, XT2, and DCO fault flags are cleared... */
    do {
       REG(UCSCTL7) &= ~(XT2OFFG + XT1LFOFFG + XT1HFOFFG + DCOFFG);
       REG(SFRIFG1) &= ~OFIFG;
    } while (REG(UCSCTL7) & (XT2OFFG + XT1LFOFFG + XT1HFOFFG + DCOFFG));
}

/*
 *  ======== Boot_configureDCO_CS_A ========
 *  Initializes MSP430FR58x and FR430FR59x clocks and DCO for:
 *      MCLK = SMCLK = 8MHz
 *      ACLK = MODOSC/128 = ~39063Hz
 *
 *  Derived from the msp430fr59xx_CS_01.c and msp430fr59xx_CS_03.c examples.
 */
#if defined(__ICC430__)
    #pragma location="CSTART"
#endif
Void Boot_configureDCO_CS_A(Void)
{
    BYTEREG(CSCTL0_H) = 0xA5;               /* set password for CS access */

    REG(CSCTL1) = DCOFSEL_6;                /* select 8MHz */
    REG(CSCTL2) = SELA_2 + SELS_3 + SELM_3; /* MCLK=SMCLK=DCO,ACLK=LFMODCLK */
    REG(CSCTL3) = DIVS_0 + DIVM_0;          /* select dividers for /1 */

    BYTEREG(CSCTL0_H) = 0;                  /* reset password to lock access */
}

/*
 *  ======== Boot_configureDCO_CS_A_useLFXT ========
 *  Initializes MSP430FR58x and FR430FR59x clocks and DCO for:
 *      MCLK = SMCLK = 8MHz
 *      ACLK = LFXT = 32768Hz (crystal required)
 *
 *  Derived from the msp430fr59xx_CS_01.c and msp430fr59xx_CS_03.c examples.
 */
#if defined(__ICC430__)
    #pragma location="CSTART"
#endif
Void Boot_configureDCO_CS_A_useLFXT(Void)
{
    BYTEREG(CSCTL0_H) = 0xA5;           /* set password for CS access */

    REG(PJSEL0) |= BIT4;                /* select LFXIN crystal mode */
    REG(CSCTL1) = DCOFSEL_6;            /* select 8MHz */
    REG(CSCTL2) = SELS_3 + SELM_3;      /* select DCO for MCLK and SMCLK */
    REG(CSCTL3) = DIVS_0 + DIVM_0;      /* select dividers for /1 */
    REG(CSCTL4) |= LFXTDRIVE_0;         /* select lowest drive strength */
    REG(CSCTL4) &= ~LFXTOFF;            /* enable LFXT */

    do {
        REG(CSCTL5) &= ~LFXTOFFG;       /* clear XT1 fault flag */
        REG(SFRIFG1) &= ~OFIFG;         /* clear oscillator fault flag */
    }
    while(REG(SFRIFG1) & OFIFG);

    BYTEREG(CSCTL0_H) = 0;              /* reset password to lock access */
}

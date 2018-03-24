/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *  Perform the following critical 28x initializations prior to cinit:
 *
 *  1) Disable the watchdog timer.
 *  2) Initialize the PLL.
 *
 *  The code below contains excerpts from the examples provided with
 *  this development platform.
 *
 */

#include <xdc/std.h>

#include "_SysCtrl.h"        /* System Control/Power Modes */
#include "_Gpio.h"
#include "_Xintf.h"

#define sysCtrlRegs (*(volatile struct SysCtrlRegs *)(0x7010))
#define xintfRegs (*(volatile XINTF_REGS *)(0x0b20))
#define gpioCtrlRegs (*(volatile struct GPIO_CTRL_REGS *)(0x6F80))

#define Boot_disableWatchdog   ti_catalog_c2800_init_Boot_disableWatchdog
#define Boot_configurePll280x  ti_catalog_c2800_init_Boot_configurePll280x
#define Boot_configurePll281x  ti_catalog_c2800_init_Boot_configurePll281x
#define Boot_configurePll2802x ti_catalog_c2800_init_Boot_configurePll2802x
#define Boot_configurePll2834x ti_catalog_c2800_init_Boot_configurePll2834x
#define Boot_50usDelay         ti_catalog_c2800_init_Boot_50usDelay
#define Boot_limpAbort         ti_catalog_c2800_init_Boot_limpAbort
#define Boot_defaultLimpAbortFunction  ti_catalog_c2800_init_Boot_defaultLimpAbortFunction
#define Boot_configEzdspXintf  ti_catalog_c2800_init_Boot_configEzdspXintf
#define Boot_configEzdspGpio   ti_catalog_c2800_init_Boot_configEzdspGpio

#define EALLOW asm(" EALLOW")
#define EDIS   asm(" EDIS")
#define ESTOP0 asm(" ESTOP0")

#pragma CODE_SECTION(Boot_disableWatchdog, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePll280x, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePll281x, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePll2802x, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configurePll2834x, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configEzdspXintf, ".text:.bootCodeSection")
#pragma CODE_SECTION(Boot_configEzdspGpio, ".text:.bootCodeSection")

extern Void Boot_50usDelay();

extern Fxn Boot_limpAbort();

#define REG(x)  (*(volatile UInt *)(x))

#define PLLCR_REG               0x7021
#define PLLSTS_REG              0x7011
#define PLLSTS_DIVSEL_BITS      0x0180
#define PLLSTS_DIVSEL_SHIFTBITS 7
#define PLLSTS_MCLKOFF_BIT      0x0040
#define PLLSTS_MCLKSTS_BIT      0x0008
#define PLLSTS_PLLLOCKS_BIT     0x0001


/*
 *  ======== Boot_disableWatchdog ========
 */
Void Boot_disableWatchdog(Void)
{
    EALLOW;
    sysCtrlRegs.WDCR |= 0x0068; /* disable it */
    sysCtrlRegs.WDKEY = 0x0055; /* service it once */
    sysCtrlRegs.WDKEY = 0x00AA; /* to be sure */
    EDIS;
}

/*
 *  ======== Boot_configurePll280x ========
 */
Void Boot_configurePll280x(UInt16 pllcrDIV)
{
    /* Not implemented. */
}

/*
 *  ======== Boot_configurePll281x ========
 */
Void Boot_configurePll281x(UInt16 pllcrDIV, UInt16 pllstsDIVSEL)
{
    /* Not implemented. */
}

/*
 *  ======== Boot_configurePll2802x ========
 */
Void Boot_configurePll2802x(UInt16 pllcrDIV, UInt16 pllstsDIVSEL)
{
    /* check if running in Limp mode; if yes, abort */
    if (REG(PLLSTS_REG) & PLLSTS_MCLKSTS_BIT) {
        Boot_limpAbort();
    }

    EALLOW;

    /* set max divide select (DIVSEL = 0) */
    REG(PLLSTS_REG) &= ~PLLSTS_DIVSEL_BITS;

    /* temporarily disable failed oscillator detect */
    REG(PLLSTS_REG) |= PLLSTS_MCLKOFF_BIT;

    /* set the new PLL multiplier value */
    REG(PLLCR_REG) = pllcrDIV;

    /* wait for the PLL to relock */
    while (!(REG(PLLSTS_REG) & PLLSTS_PLLLOCKS_BIT)) {
    };

    /* re-enable failed oscillator detection */
    REG(PLLSTS_REG) &= ~PLLSTS_MCLKOFF_BIT;

    /* TODO: add stepped shift to lowest div value, like previous impl? */

    /* set divide select bits (DIVSEL) */
    REG(PLLSTS_REG) |= pllstsDIVSEL << PLLSTS_DIVSEL_SHIFTBITS;

    EDIS;
}

/*
 *  ======== Boot_configurePll2834x ========
 */
Void Boot_configurePll2834x(UInt16 pllcrDIV, UInt16 pllstsDIVSEL)
{
    /* check if running in Limp mode; if yes, abort */
    if (REG(PLLSTS_REG) & PLLSTS_MCLKSTS_BIT) {
        Boot_limpAbort();
    }

    EALLOW;

    /* set max divide select (DIVSEL = 0) */
    REG(PLLSTS_REG) &= ~PLLSTS_DIVSEL_BITS;

    /* temporarily disable failed oscillator detect */
    REG(PLLSTS_REG) |= PLLSTS_MCLKOFF_BIT;

    /* set the new PLL multiplier value */
    REG(PLLCR_REG) = pllcrDIV;

    /* wait for the PLL to relock */
    while (!(REG(PLLSTS_REG) & PLLSTS_PLLLOCKS_BIT)) {
    };

    /* re-enable failed oscillator detection */
    REG(PLLSTS_REG) &= ~PLLSTS_MCLKOFF_BIT;

    /* set divide select bits (DIVSEL) */
    REG(PLLSTS_REG) |= pllstsDIVSEL << PLLSTS_DIVSEL_SHIFTBITS;

    EDIS;
}

/*
 *  ======== Boot_configEzdspGpio ========
 *  Configure the GPIO for XINTF with a 16-bit data bus.
 *  This function was taken from 'InitXintf16Gpio' in DSP2833x_Xintf.c of
 *  the 283xx examples.
 */
void Boot_configEzdspGpio()
{
     EALLOW;
     gpioCtrlRegs.GPCMUX1.bit.GPIO64 = 3;  /* XD15 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO65 = 3;  /* XD14 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO66 = 3;  /* XD13 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO67 = 3;  /* XD12 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO68 = 3;  /* XD11 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO69 = 3;  /* XD10 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO70 = 3;  /* XD19 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO71 = 3;  /* XD8 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO72 = 3;  /* XD7 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO73 = 3;  /* XD6 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO74 = 3;  /* XD5 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO75 = 3;  /* XD4 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO76 = 3;  /* XD3 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO77 = 3;  /* XD2 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO78 = 3;  /* XD1 */
     gpioCtrlRegs.GPCMUX1.bit.GPIO79 = 3;  /* XD0 */

     gpioCtrlRegs.GPBMUX1.bit.GPIO40 = 3;  /* XA0/XWE1n */
     gpioCtrlRegs.GPBMUX1.bit.GPIO41 = 3;  /* XA1 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO42 = 3;  /* XA2 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO43 = 3;  /* XA3 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO44 = 3;  /* XA4 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO45 = 3;  /* XA5 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO46 = 3;  /* XA6 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO47 = 3;  /* XA7 */

     gpioCtrlRegs.GPCMUX2.bit.GPIO80 = 3;  /* XA8 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO81 = 3;  /* XA9 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO82 = 3;  /* XA10 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO83 = 3;  /* XA11 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO84 = 3;  /* XA12 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO85 = 3;  /* XA13 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO86 = 3;  /* XA14 */
     gpioCtrlRegs.GPCMUX2.bit.GPIO87 = 3;  /* XA15 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO39 = 3;  /* XA16 */
     gpioCtrlRegs.GPAMUX2.bit.GPIO31 = 3;  /* XA17 */
     gpioCtrlRegs.GPAMUX2.bit.GPIO30 = 3;  /* XA18 */
     gpioCtrlRegs.GPAMUX2.bit.GPIO29 = 3;  /* XA19 */

     gpioCtrlRegs.GPBMUX1.bit.GPIO34 = 3;  /* XREADY */
         gpioCtrlRegs.GPBMUX1.bit.GPIO35 = 3;  /* XRNW */
     gpioCtrlRegs.GPBMUX1.bit.GPIO38 = 3;  /* XWE0 */

     gpioCtrlRegs.GPBMUX1.bit.GPIO36 = 3;  /* XZCS0 */
     gpioCtrlRegs.GPBMUX1.bit.GPIO37 = 3;  /* XZCS7 */
     gpioCtrlRegs.GPAMUX2.bit.GPIO28 = 3;  /* XZCS6 */
     EDIS;
}

/*
 * Configure the timing paramaters for Zone 7.
 * Notes:
 *    This function should not be executed from XINTF
 *    Adjust the timing based on the data manual and
 *    external device requirements.
 */
void Boot_configEzdspXintf(void)
{
    /* Make sure the XINTF clock is enabled */
        sysCtrlRegs.PCLKCR3.bit.XINTFENCLK = 1;

        /* Configure the GPIO for XINTF with a 16-bit data bus */
        Boot_configEzdspGpio();

    EALLOW;
    /* All Zones */

    /* Timing for all zones based on XTIMCLK = SYSCLKOUT */
    xintfRegs.XINTCNF2.bit.XTIMCLK = 0;

    /* Buffer up to 3 writes */
    xintfRegs.XINTCNF2.bit.WRBUFF = 3;

    /* XCLKOUT is enabled */
    xintfRegs.XINTCNF2.bit.CLKOFF = 0;

    /* XCLKOUT = XTIMCLK */
    xintfRegs.XINTCNF2.bit.CLKMODE = 0;

    /*
     * Zone 7
     * When using ready, ACTIVE must be 1 or greater
     * Lead must always be 1 or greater
     */

    /* Zone write timing */
    xintfRegs.XTIMING7.bit.XWRLEAD = 1;
    xintfRegs.XTIMING7.bit.XWRACTIVE = 2;
    xintfRegs.XTIMING7.bit.XWRTRAIL = 1;

    /* Zone read timing */
    xintfRegs.XTIMING7.bit.XRDLEAD = 1;
    xintfRegs.XTIMING7.bit.XRDACTIVE = 3;
    xintfRegs.XTIMING7.bit.XRDTRAIL = 0;

    /* don't double all Zone read/write lead/active/trail timing */
    xintfRegs.XTIMING7.bit.X2TIMING = 0;

    /* Zone will not sample XREADY signal */
    xintfRegs.XTIMING7.bit.USEREADY = 0;
    xintfRegs.XTIMING7.bit.READYMODE = 0;

    /*
     * 1,1 = x16 data bus
     * 0,1 = x32 data bus
     * other values are reserved
     */
    xintfRegs.XTIMING7.bit.XSIZE = 3;
    EDIS;

   /*
    * Force a pipeline flush to ensure that the write to
    * the last register configured occurs before returning.
    */
   asm(" RPT #7 || NOP");
}

/*
 *  ======== Boot_defaultLimpAbortFunction ========
 */
void Boot_defaultLimpAbortFunction(void)
{
    ESTOP0;

    while(1) {
    }
}

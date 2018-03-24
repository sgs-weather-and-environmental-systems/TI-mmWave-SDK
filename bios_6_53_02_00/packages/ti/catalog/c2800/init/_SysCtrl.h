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


#ifndef DSP2833x_SYS_CTRL_H
#define DSP2833x_SYS_CTRL_H

#ifdef __cplusplus
extern "C" {
#endif

/*
 * System Control Individual Register Bit Definitions:
 */

/* PLL Status Register */
struct PLLSTS_BITS   {  /* bits  description */
    UInt16 PLLLOCKS:1;  /* 0     PLL lock status */
    UInt16 rsvd1:1;     /* 1     reserved */
    UInt16 PLLOFF:1;    /* 2     PLL off bit */
    UInt16 MCLKSTS:1;   /* 3     Missing clock status bit */
    UInt16 MCLKCLR:1;   /* 4     Missing clock clear bit */
    UInt16 OSCOFF:1;    /* 5     Oscillator clock off */
    UInt16 MCLKOFF:1;   /* 6     Missing clock detect */
    UInt16 DIVSEL:2;    /* 7     Divide Select */
    UInt16 rsvd2:7;     /* 15:7  reserved */
};

union PLLSTS_REG {
    UInt16              all;
    struct PLLSTS_BITS  bit;
};

/* High speed peripheral clock register bit definitions: */
struct HISPCP_BITS  {   /* bits  description */
    UInt16 HSPCLK:3;    /* 2:0   Rate relative to SYSCLKOUT */
    UInt16 rsvd1:13;    /* 15:3  reserved */
};

union HISPCP_REG {
    UInt16              all;
    struct HISPCP_BITS  bit;
};

/* Low speed peripheral clock register bit definitions: */
struct LOSPCP_BITS  {   /* bits  description */
    UInt16 LSPCLK:3;    /* 2:0   Rate relative to SYSCLKOUT */
    UInt16 rsvd1:13;    /* 15:3  reserved */
};

union LOSPCP_REG {
    UInt16              all;
    struct LOSPCP_BITS  bit;
};

/* Peripheral clock control register 0 bit definitions: */
struct PCLKCR0_BITS  {      /* bits  description */
    UInt16 rsvd1:2;         /* 1:0   reserved */
    UInt16 TBCLKSYNC:1;     /* 2     EWPM Module TBCLK enable/sync */
    UInt16 ADCENCLK:1;      /* 3     Enable high speed clk to ADC */
    UInt16 I2CAENCLK:1;     /* 4     Enable SYSCLKOUT to I2C-A */
    UInt16 SCICENCLK:1;     /* 5     Enalbe low speed clk to SCI-C */
    UInt16 rsvd2:2;         /* 7:6   reserved */
    UInt16 SPIAENCLK:1;     /* 8     Enable low speed clk to SPI-A */
    UInt16 rsvd3:1;         /* 9     reserved */
    UInt16 SCIAENCLK:1;     /* 10    Enable low speed clk to SCI-A */
    UInt16 SCIBENCLK:1;     /* 11    Enable low speed clk to SCI-B */
    UInt16 MCBSPAENCLK:1;   /* 12    Enable low speed clk to McBSP-A */
    UInt16 MCBSPBENCLK:1;   /* 13    Enable low speed clk to McBSP-B */
    UInt16 ECANAENCLK:1;    /* 14    Enable system clk to eCAN-A */
    UInt16 ECANBENCLK:1;    /* 15    Enable system clk to eCAN-B */
};

union PCLKCR0_REG {
    UInt16              all;
    struct PCLKCR0_BITS bit;
};

/* Peripheral clock control register 1 bit definitions: */
struct PCLKCR1_BITS  {        /* bits  description */
    UInt16 EPWM1ENCLK:1;      /* 0     Enable SYSCLKOUT to EPWM1 */
    UInt16 EPWM2ENCLK:1;      /* 1     Enable SYSCLKOUT to EPWM2 */
    UInt16 EPWM3ENCLK:1;      /* 2     Enable SYSCLKOUT to EPWM3 */
    UInt16 EPWM4ENCLK:1;      /* 3     Enable SYSCLKOUT to EPWM4 */
    UInt16 EPWM5ENCLK:1;      /* 4     Enable SYSCLKOUT to EPWM5 */
    UInt16 EPWM6ENCLK:1;      /* 5     Enable SYSCLKOUT to EPWM6 */
    UInt16 rsvd1:2;           /* 7:6   reserved */
    UInt16 ECAP1ENCLK:1;      /* 8     Enable SYSCLKOUT to ECAP1 */
    UInt16 ECAP2ENCLK:1;      /* 9     Enable SYSCLKOUT to ECAP2 */
    UInt16 ECAP3ENCLK:1;      /* 10    Enable SYSCLKOUT to ECAP3 */
    UInt16 ECAP4ENCLK:1;      /* 11    Enable SYSCLKOUT to ECAP4 */
    UInt16 ECAP5ENCLK:1;      /* 12    Enable SYSCLKOUT to ECAP5 */
    UInt16 ECAP6ENCLK:1;      /* 13    Enable SYSCLKOUT to ECAP6 */
    UInt16 EQEP1ENCLK:1;      /* 14    Enable SYSCLKOUT to EQEP1 */
    UInt16 EQEP2ENCLK:1;      /* 15    Enable SYSCLKOUT to EQEP2 */
};

union PCLKCR1_REG {
    UInt16              all;
    struct PCLKCR1_BITS bit;
};


/* Peripheral clock control register 2 bit definitions: */
struct PCLKCR3_BITS  {          /* bits  description */
    UInt16 rsvd1:8;             /* 7:0   reserved */
    UInt16 CPUTIMER0ENCLK:1;    /* 8     Enable SYSCLKOUT to CPU-Timer 0 */
    UInt16 CPUTIMER1ENCLK:1;    /* 9     Enable SYSCLKOUT to CPU-Timer 1 */
    UInt16 CPUTIMER2ENCLK:1;    /* 10    Enable SYSCLKOUT to CPU-Timer 2 */
    UInt16 DMAENCLK:1;          /* 11    Enable the DMA clock */
    UInt16 XINTFENCLK:1;        /* 12    Enable SYSCLKOUT to XINTF */
    UInt16 GPIOINENCLK:1;       /* 13    Enable GPIO input clock */
    UInt16 rsvd2:2;             /* 15:14 reserved */
};

union PCLKCR3_REG {
    UInt16              all;
    struct PCLKCR3_BITS bit;
};



/* PLL control register bit definitions: */
struct PLLCR_BITS {             /* bits  description, DIV used to be 4 bits,
                                 * but for 2806x we had to increment it to 5
                                 */
    UInt16 DIV:5;               /* 4:0   Set clock ratio for the PLL */
    UInt16 rsvd1:11;            /* 15:5  reserved */
};

union PLLCR_REG {
    UInt16             all;
    struct PLLCR_BITS  bit;
};

/* Low Power Mode 0 control register bit definitions: */
struct LPMCR0_BITS {            /* bits  description */
    UInt16 LPM:2;               /* 1:0   Set the low power mode */
    UInt16 QUALSTDBY:6;         /* 7:2   Qualification */
    UInt16 rsvd1:7;             /* 14:8  reserved */
    UInt16 WDINTE:1;            /* 15    Enables WD to wake the device from STANDBY */
};

union LPMCR0_REG {
    UInt16              all;
    struct LPMCR0_BITS  bit;
};

/* Dual-mapping configuration register bit definitions: */
struct MAPCNF_BITS {            /* bits  description */
    UInt16 MAPEPWM:1;           /* 0     EPWM dual-map enable */
    UInt16 rsvd1:15;            /* 15:1  reserved */
};

union MAPCNF_REG {
    UInt16             all;
    struct MAPCNF_BITS bit;
};

/*
 *  System Control Register File:
 */
struct SysCtrlRegs {
    UInt16              rsvd1;     /* 0 */
    union   PLLSTS_REG  PLLSTS;    /* 1 */
    UInt16              rsvd2[8];  /* 2-9 */
    union   HISPCP_REG  HISPCP;    /* 10: High-speed peripheral clock pre-scaler */
    union   LOSPCP_REG  LOSPCP;    /* 11: Low-speed peripheral clock pre-scaler */
    union   PCLKCR0_REG PCLKCR0;   /* 12: Peripheral clock control register */
    union   PCLKCR1_REG PCLKCR1;   /* 13: Peripheral clock control register */
    union   LPMCR0_REG  LPMCR0;    /* 14: Low-power mode control register 0 */
    UInt16              rsvd3;     /* 15: reserved */
    union   PCLKCR3_REG PCLKCR3;   /* 16: Peripheral clock control register */
    union   PLLCR_REG   PLLCR;     /* 17: PLL control register */
    /* No bit definitions are defined for SCSR because */
    /* a read-modify-write instruction can clear the WDOVERRIDE bit */
    UInt16              SCSR;      /* 18: System control and status register */
    UInt16              WDCNTR;    /* 19: WD counter register */
    UInt16              rsvd4;     /* 20 */
    UInt16              WDKEY;     /* 21: WD reset key register */
    UInt16              rsvd5[3];  /* 22-24 */
    /* No bit definitions are defined for WDCR because */
    /* the proper value must be written to the WDCHK field */
    /* whenever writing to this register. */
    UInt16              WDCR;      /* 25: WD timer control register */
    UInt16              rsvd6[4];  /* 26-29 */
    union   MAPCNF_REG  MAPCNF;    /* 30: Dual-mapping configuration register */
    UInt16              rsvd7[1];  /* 31 */
};

#ifdef __cplusplus
}
#endif /* extern "C" */

#endif /* end of DSP2833x_SYS_CTRL_H definition */

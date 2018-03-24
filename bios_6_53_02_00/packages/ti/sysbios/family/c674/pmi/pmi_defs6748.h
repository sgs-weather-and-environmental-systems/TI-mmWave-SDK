/*
 *  ======== pmi_defs6748.h ========
 *
 *  PMI defines for C6748.
 *
 */

#ifndef PMI_DEFS_
#define PMI_DEFS_

#ifdef __cplusplus
extern "C" {
#endif

/******** power sleep controller definitions ********/
#define GO_BIT_PD0              0x1
#define GO_BIT_PD1              0x2

#define GOSTAT_BIT_PD0          0x1
#define GOSTAT_BIT_PD1          0x2

#define PTCMD_REG_PSC0          0x01C10120
#define PTCMD_REG_PSC1          0x01E27120

#define PTSTAT_REG_PSC0         0x01C10128
#define PTSTAT_REG_PSC1         0x01E27128

#define MDCTL_BASE_PSC0         0x01C10A00
#define MDCTL_BASE_PSC1         0x01E27A00

#define MDSTAT_BASE_PSC0        0x01C10800
#define MDSTAT_BASE_PSC1        0x01E27800

#define MODULE_STATE_MASK       0x3F


/******** power down controller definitions ********/
#define PDCCMD_REG      0x01810000
#define PDCCMD_STANDBY  0x00015555


/******** PINMUX0 definitions ********/
#define PMI_EXTERNAL    0x8
#define PMI_RTC_ALARM   0x10
#define PINMUX0_REG     0x01C14120
#define MASK_31_29      0xF0000000
#define FXN_RTC_ALARM   0x20000000
#define FXN_DEEPSLEEP   0x00000000


/******** DEEPSLEEP definitions ********/
#define DEEPSLEEP_REG      0x01E2C008
#define SLEEPCOUNT_MASK    0x0000FFFF
#define SLEEPENABLE_BIT    0x80000000
#define SLEEPCOMPLETE_BIT  0x40000000

/******** PLL and SYSCLK definitions ********/
#define BASE_PLL0               0x01C11000
#define BASE_PLL1               0x01E1A000

#define CFGCHIP0                0x01C1417C
#define PLL_MASTER_LOCK_BIT     0x10
#define CFGCHIP3                0x01C14188
#define PLL1_MASTER_LOCK_BIT    0x20

#define PLLCTL                  0x0100
#define PREDIV                  0x0114
#define POSTDIV                 0x0128
#define PLLM                    0x0110
#define DCHANGE                 0x0144
#define PLLCMD                  0x0138
#define PLLSTAT                 0x013C
#define PLLDIV1                 0x0118
#define PLLDIV2                 0x011C
#define PLLDIV3                 0x0120
#define PLLDIV4                 0x0160
#define PLLDIV5                 0x0164
#define PLLDIV6                 0x0168
#define PLLDIV7                 0x016C

#define PLL_CLKMODE_OSCIN       0x00000000
#define PLL_CLKMODE_CLKIN       0x00000100
#define PLL_CLKMODE_BIT         0x00000100
#define CLKMODE_CLKIN           PLL_CLKMODE_CLKIN
#define CLKMODE_OSCIN           PLL_CLKMODE_OSCIN

#define PLL_EXTCLKSRC_OSCIN     0x00000000
#define PLL_EXTCLKSRC_PLL1      0x00000200
#define PLL_EXTCLKSRC_BIT       0x00000200
#define EXTCLKSRC_OSCIN         PLL_EXTCLKSRC_OSCIN
#define EXTCLKSRC_PLL1          PLL_EXTCLKSRC_PLL1

#define PLL_PLLENSRC_BIT        0x00000020
#define PLL_PLLDIS_BIT          0x00000010
#define PLL_PLLRST_BIT          0x00000008
#define PLL_PLLPWRDN_BIT        0x00000002
#define PLL_PLLEN_BIT           0x00000001
#define PLL_GOSTAT_BIT          0x00000001
#define PLL_GOSET_BIT           0x00000001
#define PLL_RATIO_MASK          0x0000001F
#define PLL_ENABLE_MASK         0x00008000

#define SYSCLK_ENABLE_BIT       0x00008000

#define OSC_SLEEPCOUNT          4092 /* DEEPSLEEP osc stabilization count */

#define PLL_MAXLOCKCYCLES       486  /* max OSCIN cycles for a PLL relock */

/******** EMIFA clock select definitions ********/
#define DIV45PENA_BIT           0x00000004
#define EMA_CLKSRC_SYSCLK3      0x00000000
#define EMA_CLKSRC_DIV4P5       0x00000002
#define EMA_CLKSRC_BIT          0x00000002

/******** DDR controller definitions ********/
#define SDRCR_REG               0xB000000C
#define SR_PD_BIT               0x00800000
#define LPMODEN_BIT             0x80000000
#define MCLKSTOPEN_BIT          0x40000000

#define SDRSTAT_REG             0xB0000004
#define PHYRDY_BIT              0x00000004

#define DDR_PSC                 0x1
#define DDR_LPSC                0x6
#define DDR_LPSC_ENABLE_STATE   0x3
#define DDR_LPSC_DISABLE_STATE  0x2


/******** data structure definitions ********/

typedef enum {
    PMI_CPU,
    PMI_PER
} PMI_Pll;

typedef struct {
    unsigned pllm;
    unsigned postdiv;
    unsigned prediv;
    unsigned mode;
    unsigned lockCycles;
    unsigned powerDown;
} PMI_PllCfg;

typedef struct {
    unsigned div1;
    unsigned div2;              /* fixed /2 of div1 on PLL0 */
    unsigned div3;              
    unsigned div7;              /* PLL0 only */
} PMI_ClkDivCfg;

typedef struct {                /* clock source selects (PLL0 only) */
    unsigned clkmode;           /* CLKMODE */
    unsigned bypassClksrc;      /* EXTCLKSRC */
    unsigned emifaClksrc;       /* EMA_CLKSRC */
} PMI_ClkSourceCfg;

typedef struct {
    unsigned pllctl;
    unsigned prediv;
    unsigned postdiv;
    unsigned pllm;
    unsigned pllstat;
    unsigned plldiv1;
    unsigned plldiv2;
    unsigned plldiv3;
    unsigned plldiv4;
    unsigned plldiv5;
    unsigned plldiv6;
    unsigned plldiv7;
} PMI_PllState;

typedef enum {
    PMI_STANDBY,
    PMI_SLEEP,
    PMI_DEEPSLEEP
} PMI_Sleep;

typedef struct {
    unsigned sleepVoltage;
    unsigned bypassedPLLs;
} PMI_SleepOverride;

#define PMI_PLL0        0x1
#define PMI_PLL1        0x2

#ifdef __cplusplus
}
#endif

#endif /* PMIDEFS_ */

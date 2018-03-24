/*
 *  ======== pmi_i2cdefs.h ========
 *
 *  PMI defines for C6748 I2C0.
 *
 */

#ifndef PMI_I2CDEFS_
#define PMI_I2CDEFS_

#ifdef __cplusplus
extern "C" {
#endif

#define PMIC_ADDR               0x48

/* PINMUX defines to select I2C function */
#define PINMUX4                 0x01C14130
#define SELECT_I2C_MASK         0xFFFF00FF
#define SELECT_I2C_VALUE        0x00002200

/* PINMUX defines to drive GPIO2[6] */
#define PINMUX6                 0x01C14138
#define SELECT_6_7_4_MASK       0x000000F0
#define SELECT_GP2_FXN          0x00000080

/* GPIO defines */
#define GPIO_DIR23              0x01E26038
#define GPIO_CLR_DATA23         0x01E26044
#define GPIO_BIT6               0x00000040
#define GPIO_PSC                0x1
#define GPIO_LPSC               0x3
#define GPIO_LPSC_ENABLE_STATE  0x3

/* I2C control/status registers */
#define ICOAR                   0x01C22000
#define ICSTR                   0x01C22008
#define ICCLKL                  0x01C2200c
#define ICCLKH                  0x01C22010
#define ICCNT                   0x01C22014
#define ICDRR                   0x01C22018
#define ICSAR                   0x01C2201C
#define ICDXR                   0x01C22020
#define ICMDR                   0x01C22024
#define ICPSC                   0x01C22030

/* ICMDR control bits */
#define IRS_BIT                 0x20
#define TRX_BIT                 0x200
#define NACKMOD_BIT             0x8000
#define STT_BIT                 0x2000
#define STP_BIT                 0x800
#define MST_BIT                 0x400

/* ICSTR status bits */
#define BUSY_BIT                0x1000
#define ICXRDY_BIT              0x10
#define ICRRDY_BIT              0x8
#define ARDY_BIT                0x4

#define PRESCALEDIVIDE          0x2         /* prescaled clock = 24MHz/3 */
#define CLOCKDIVIDE_LO          0x5         /* SCL clock = 8MHz/20 = 400kHz */
#define CLOCKDIVIDE_HI          0x5
#define MASTERCONFIG            0x00004400  /* initial I2C mode register */

#ifdef __cplusplus
}
#endif

#endif /* PMI_I2CDEFS_ */

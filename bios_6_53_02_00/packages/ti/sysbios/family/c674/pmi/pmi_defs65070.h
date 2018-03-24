/*
 *  ======== pmi_defs65070.h ========
 *
 *  PMI defines for the TPS65070 on the C6748 EVM.
 *
 */

#ifndef PMI_DEFS_V_
#define PMI_DEFS_V_

#ifdef __cplusplus
extern "C" {
#endif

#define PMIC_ADDR       0x48    /* TPS65070 slave address on EVM */
        
#define DEFDCDC3_REG    0x14    /* DCDC3 voltage level specification register */

#define DEFSLEW_REG     0x15    /* VDCDC3 slew rate register ID */
#define DEFSLEW_VALUE   0x03    /* rate of .9mv/usec (closest <= 1mv/usec) */

#define PGOODMASK_REG   0x0C    /* power good mask register ID */ 
#define PGOODMASK_BITS  0x24    /* bits enabling DCDC3 to trigger reset */

#define PGOOD_REG       0x0B    /* power good register ID */ 
#define PGOOD_BIT       0x04    /* DCDC3 voltage in nominal range */

#define SP_1_3_VOLT     0x17    /* 1.300 volts for DCDC3 */
#define SP_1_2_VOLT     0x13    /* 1.200 volts for DCDC3 */
#define SP_1_1_VOLT     0x0F    /* 1.100 volts for DCDC3 */
#define SP_1_0_VOLT     0x0B    /* 1.000 volts for DCDC3 */


#ifdef __cplusplus
}
#endif

#endif /* PMIDEFSV_ */


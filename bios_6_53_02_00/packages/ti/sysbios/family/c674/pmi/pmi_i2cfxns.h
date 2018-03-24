/*
 *  ======== pmi_i2cfxns.h ========
 *
 *  PMI I2C function prototypes for the C6748 EVM.
 *
 */

#ifndef PMI_I2CFXNS
#define PMI_I2CFXNS

#ifdef __cplusplus
extern "C" {
#endif

/*
 *  ======== PMI_initI2C ========
 *  Initialize raw I2C control.
 *
 */
PMI_Status PMI_initI2C(void);

/*
 *  ======== PMI_readI2C ========
 *  Read a register of an I2C slave device.
 *
 */
PMI_Status PMI_readI2C(unsigned addr, unsigned reg, unsigned * data);

/*
 *  ======== PMI_writeI2C ========
 *  Write a register of an I2C slave device.
 *
 */
PMI_Status PMI_writeI2C(unsigned addr, unsigned reg, unsigned data);


#ifdef __cplusplus
}
#endif

#endif /* PMI_I2CFXNS */

/*----------------------------------------------------------------------------*/
/* SIMMAXWELL.cmd                                                             */
/*                                                                            */
/* (c) Texas Instruments 2016-2017, All rights reserved.                      */
/*                                                                            */

/* USER CODE BEGIN (0) */
/* USER CODE END */


/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"
--retain="*(.intvecsNew)"

/*----------------------------------------------------------------------------*/
/* Memory Map                                                                 */
MEMORY{
    VECTORS    (X)   : origin=0x00000000 length=0x00000040
    ATCM       (RWX) : origin=0x00550000 length=0x8000
    BTCM       (RWX) : origin=0x00560000 length=0x8000
    RAM0       (RW)  : origin=0x41C00000 length=0x00080000
}

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS{
    .intvecs          : {} > VECTORS
    .text    align(8) : {} > ATCM | BTCM | RAM0
    .const   align(8) : {} > ATCM | BTCM | RAM0
    .cinit   align(8) : {} > ATCM | BTCM | RAM0
    .pinit   align(8) : {} > ATCM | BTCM | RAM0
    .bss              : {} > RAM0
    .data             : {} > ATCM | BTCM | RAM0
    .sysmem           : {} > RAM0
    .args             : {} > RAM0
    .stack            : {} > ATCM | BTCM | RAM0
}
/*----------------------------------------------------------------------------*/

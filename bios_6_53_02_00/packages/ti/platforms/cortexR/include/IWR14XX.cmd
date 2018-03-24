/*----------------------------------------------------------------------------*/
/* IWR14XX.cmd                                                                */
/*                                                                            */
/* (c) Texas Instruments 2016-2017, All rights reserved.                      */
/*                                                                            */

/* USER CODE BEGIN (0) */
/* USER CODE END */


/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

/*----------------------------------------------------------------------------*/
/* Memory Map                                                                 */
MEMORY{
    VECTORS  (X)  : origin=0x00000000 length=0x00000100
    PROG_RAM (RX) : origin=0x00000100 length=0x0001FF00
    DATA_RAM (RW) : origin=0x08000000 length=0x00010000
    L3_RAM (RW)   : origin=0x51020000 length=0x00040000
}

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS{
    .intvecs : {} > VECTORS

    .text    : {} > PROG_RAM ALIGN(16)
    .const   : {} > PROG_RAM ALIGN(16)
    .cinit   : {} > PROG_RAM ALIGN(16)
    .pinit   : {} > PROG_RAM ALIGN(16)

    .bss     : {} > DATA_RAM
    .data    : {} > DATA_RAM
    .stack   : {} > DATA_RAM
}
/*----------------------------------------------------------------------------*/

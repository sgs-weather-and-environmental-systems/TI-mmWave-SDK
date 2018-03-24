/*----------------------------------------------------------------------------*/
/* r4f_linker.cmd                                                                 */
/*                                                                            */
/* (c) Texas Instruments 2016, All rights reserved.                           */
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
    PROG_RAM (RX) : origin=0x00000100 length=0x0003FF00
    DATA_RAM (RW) : origin=0x08000000 length=0x00030000
    L3_RAM (RW)   : origin=0x51000000 length=0x000A0000
    HS_RAM (RW)   : origin=0x52080000 length=0x8000
}

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS{
    .intvecs : {} > VECTORS
    .text    : {} > PROG_RAM ALIGN(8)
    .const   : {} > PROG_RAM ALIGN(8)
    .cinit   : {} > PROG_RAM ALIGN(8)
    .pinit   : {} > PROG_RAM ALIGN(8)
    .bss     : {} > DATA_RAM
    .data    : {} > DATA_RAM
    .stack   : {} > DATA_RAM ALIGN(32)
}
/*----------------------------------------------------------------------------*/


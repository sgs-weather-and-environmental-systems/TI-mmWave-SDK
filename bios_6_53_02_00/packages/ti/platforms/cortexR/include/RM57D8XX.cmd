/*----------------------------------------------------------------------------*/
/* RM57D8XX.cmd                                                               */
/*                                                                            */
/* (c) Texas Instruments 2015, All rights reserved.                           */
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
    VECTORS    (X)  : origin=0x00000000 length=0x00000100 fill=0xFFFFFFFF
    VECTORSNEW (X)  : origin=0x00000100 length=0x00000020 fill=0xFFFFFFFF
    FLASH0     (RX) : origin=0x00000120 length=0x001FFEE0 vfill=0xFFFFFFFF
    RAM        (RW) : origin=0x08000000 length=0x00040000
    SHAREDRAM  (RW) : origin=0x08070000 length=0x00010000

    ECC_VEC    (R)  : origin=0xF0400000 length=0x00000020 ECC={input_range=VECTORS}
    ECC_VECNEW (R)  : origin=0xF0400020 length=0x00000004 ECC={input_range=VECTORSNEW}
    ECC_FLA0   (R)  : origin=0xF0400024 length=0x0003FFDC ECC={input_range=FLASH0}
}

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS{
    .intvecs          : {} > VECTORS
    .intvecsNew       : {} > VECTORSNEW
    .text    align(8) : {} > FLASH0
    .const   align(8) : {} > FLASH0
    .cinit   align(8) : {} > FLASH0
    .pinit   align(8) : {} > FLASH0
    .bss              : {} > RAM
    .data             : {} > RAM
    .sysmem           : {} > RAM
    .args             : {} > RAM
    .stack            : {} > RAM
    .sharedData       : {} > SHAREDRAM
}
/*----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------*/
/* Misc                                                                       */
ECC{
    algo_name : address_mask = 0xFFFFFFF8
    hamming_mask = R4
    parity_mask = 0x0C
    mirroring = F021
}
/*----------------------------------------------------------------------------*/

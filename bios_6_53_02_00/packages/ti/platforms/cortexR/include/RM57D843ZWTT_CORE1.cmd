/*----------------------------------------------------------------------------*/
/* RM57D843ZWTT_CORE1.cmd                                                     */
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
    VECTORSNEW (X)  : origin=0x00200000 length=0x00000020 fill=0xFFFFFFFF
    FLASH1     (RX) : origin=0x00200020 length=0x001FFFE0 vfill=0xFFFFFFFF
    RAM        (RW) : origin=0x08040000 length=0x00030000
    SHAREDRAM  (RW) : origin=0x08070000 length=0x00010000

    ECC_VECNEW (R)  : origin=0xF0440000 length=0x00000004 ECC={input_range=VECTORSNEW}
    ECC_FLA1   (R)  : origin=0xF0440004 length=0x0003FFFC ECC={input_range=FLASH1}
}

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS{
    .intvecsNew       : {} > VECTORSNEW
    .text    align(8) : {} > FLASH1
    .const   align(8) : {} > FLASH1
    .cinit   align(8) : {} > FLASH1
    .pinit   align(8) : {} > FLASH1
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

/*----------------------------------------------------------------------------*/
/* sys_link.cmd                                                               */
/*                                                                            */

/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */

--retain="*(.intvecs)"

/*----------------------------------------------------------------------------*/
/* Memory Map                                                                 */

MEMORY
{
    VECS    (RWX) : origin=0x00000000 length=0x000000C0
    FRAM    (RWX) : origin=0x000000C0 length=0x00007F40
    ROM     (RX)  : origin=0x10000000 length=0x00008000
    RAM     (RW)  : origin=0x20000000 length=0x00000800
 }

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */

SECTIONS
{
    /* Interrupt Vectors at 0x00000000 */
    .intvecs      : {} > 0x00000000
    .text         : {} > FRAM
#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc   : {} > FRAM
#endif
#endif
    .const        : {} > FRAM
    .cinit        : {} > FRAM
    .pinit        : > FRAM
    .init_array   : > FRAM
    .stack        : {} > RAM
    .bss          : {} > FRAM
    .data         : {} > FRAM
}

/*----------------------------------------------------------------------------*/

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
    STACKS  (RW)  : origin=0x20000000 length=0x000000A0
    RAM     (RW)  : origin=0x200000A0 length=0x00000340
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
    .FRAM         : {} > FRAM
    .stack        : {} > STACKS
    .bss          : {} > RAM
    .data         : {} > RAM
}

/*----------------------------------------------------------------------------*/

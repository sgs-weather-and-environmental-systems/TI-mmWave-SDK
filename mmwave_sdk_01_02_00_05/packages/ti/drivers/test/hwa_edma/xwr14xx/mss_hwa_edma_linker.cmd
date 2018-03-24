/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS
{
    systemHeap : {} > DATA_RAM
    .l3ram > L3_RAM
    .MCPILogBuffer  : { } > DATA_RAM | L3_RAM
    .hwaBufs: load = HWA_RAM, type = NOINIT
	
}
/*----------------------------------------------------------------------------*/


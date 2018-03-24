//*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

-stack 0x1000
-heap 0x1000
/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS
{
    systemHeap : {} > L2SRAM_UMAP0
    .l2data : {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .l3data : {} > L3SRAM
    .MCPILogBuffer : {} > L3SRAM
}

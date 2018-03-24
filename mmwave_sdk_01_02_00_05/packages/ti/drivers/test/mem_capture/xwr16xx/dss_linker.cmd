/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

-stack 0x1000

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS
{
    systemHeap : {}  > L2SRAM_UMAP0 | L2SRAM_UMAP1

    /*
     * The capture profile requires the data cube data to be placed. The
     * application used this data and placed it in L3 memory
     */
    .dataCubeMemory : { } > L3SRAM
}
/*----------------------------------------------------------------------------*/



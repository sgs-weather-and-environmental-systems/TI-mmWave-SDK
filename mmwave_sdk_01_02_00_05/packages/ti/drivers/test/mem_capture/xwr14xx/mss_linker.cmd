/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS
{
    systemHeap : {}  > DATA_RAM

    /*
     * The capture profile requires the data cube data to be placed. The
     * application used this data and placed it in L3 memory
     */
    .dataCubeMemory : { } > L3_RAM
}
/*----------------------------------------------------------------------------*/


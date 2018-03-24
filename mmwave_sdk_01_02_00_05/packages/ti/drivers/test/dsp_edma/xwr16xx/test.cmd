/*----------------------------------------------------------------------------*/
/* Linker Settings                                                            */
--retain="*(.intvecs)"

/*----------------------------------------------------------------------------*/
/* Section Configuration                                                      */
SECTIONS
{
    systemHeap : {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .l2data : {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .MCPILogBuffer  : { } > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .l3data : {} > L3SRAM
    .l1data : {} > L1DSRAM
    
    .fastCode: 
    {
        dsplib.ae64P(.text)
        libmmwavealg_xwr16xx.ae674(.text)
        mathlib.ae674(.text)
        dss_data_path.oe674 (.text:MmwDemo_interFrameProcessing)
        dss_data_path.oe674 (.text:MmwDemo_processChirp)
        dss_data_path.oe674 (.text:MmwDemo_interChirpProcessing)
        dss_data_path.oe674 (.text:MmwDemo_XYestimation)
        dss_data_path.oe674 (.text:MmwDemo_cfarPeakGrouping)
    } >> L1PSRAM | L2SRAM_UMAP1 | L2SRAM_UMAP0
}
/*----------------------------------------------------------------------------*/


import xdc.rov.ViewInfo;

/*!
 *  ======== Monitor ========
 *  ROV support for the pure C "module" Mod.c[h]
 *
 *  The file `Board_serialMon.txt` (contained in this package) illustrates
 *  how to use the runtime monitor `Mon.[ch]` with a TI-RTOS UART driver.
 */
//@NoRuntime
//@HeaderName("")
module Monitor
{
    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            argsMap: [
                ['VariableNameOrAddr',
                    {
                        description: "Variable Name/Address",
                        args: [
                            {
                                name: "name/addr",
                                type: "number",
                                defaultValue: "0"
                            },
                            {
                                name: "check",
                                type: "boolean",
                                defaultValue: "true"
                            }
                        ]
                     }
                ],
                ['ReadMemory',
                    {
                        description: "Read Memory",
                        args: [
                            {
                                name: "addr",
                                type: "number",
                                defaultValue: "0"
                            },
                            {
                                name: "length",
                                type: "number",
                                defaultValue: "0"
                            },
                            {
                                name: "check",
                                type: "boolean",
                                defaultValue: "true"
                            }
                        ]
                    }
                ],
                ['FindSymbols',
                    {
                        description: "Find Symbols",
                        args: [
                            {
                                name: "addr",
                                type: "number",
                                defaultValue: "0"
                            },
                            {
                                name: "radius",
                                type: "number",
                                defaultValue: "0"
                            },
                            {
                                name: "check",
                                type: "boolean",
                                defaultValue: "true"
                            }
                        ]
                    }
                 ]
                
            ],
            viewMap: [
                ['Module',
                    {
                        type: ViewInfo.MODULE,
                        viewInitFxn: 'viewInitModule',
                        structName: 'ModuleView'
                    }
                ],
                ['Variable',
                    {
                        type: ViewInfo.MODULE,
                        viewInitFxn: 'viewInitVariable',
                        structName: 'VariableView',
                        argsName: 'VariableNameOrAddr'
                    }
                ],
                ['UChar',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitUChar',
                        structName: 'UCharView',
                        argsName: 'ReadMemory'
                    }
                ],
                ['Bits16',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitBits16',
                        structName: 'Bits16View',
                        argsName: 'ReadMemory'
                    }
                ],
                ['Bits32',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitBits32',
                        structName: 'Bits32View',
                        argsName: 'ReadMemory'
                    }
                ],
                ['Sections',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitSections',
                        structName: 'SectionView'
                    }
                ],
                ['Symbols',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitSymbols',
                        structName: 'SymbolView',
                        argsName: 'FindSymbols'
                    }
                ],
            ]
        });

    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String command;   /* current monitor command */
        String readFxn;   /* monitor's read function */   
        String writeFxn;  /* monitor's write function */
    }

    /*!
     *  ======== SectionView ========
     *  @_nodoc
     */
    metaonly struct SectionView {
        String name;
        Ptr    start;    /* first valid address of this section */
        Ptr    end;      /* last valid address of this section */
        UInt   len;      /* bytes on this section */
        UInt   gap;      /* gap between the previous section's end and start */
        String kind;     /* "code" or "data" */
        String startSym; /* symbol name (if any) whose address equals start */
    };

    /*!
     *  ======== SymbolView ========
     *  @_nodoc
     */
    metaonly struct SymbolView {
        String name;
        Ptr    addr;
        String type;
    };
    
    /*!
     *  ======== VariableView ========
     *  @_nodoc
     */
    metaonly struct VariableView {
        String name;      /* variable's symbolic name */
        String character; /* variable as a char */
        String int8_t;    /* variable as a int8_t */
        String int16_t;   /* variable as a int16_t */
        String int32_t;   /* variable as a int32_t */
        String uint8_t;   /* variable as a uint8_t */
        String uint16_t;  /* variable as a uint16_t */
        String uint32_t;  /* variable as a uint32_t */
    }

    /*!
     *  ======== Bits16View ========
     *  One row of Bits16 values
     *  @_nodoc
     */
    metaonly struct Bits16View {
        Ptr    addr;
        Bits16 word0;
        Bits16 word1;
        Bits16 word2;
        Bits16 word3;
        Bits16 word4;
        Bits16 word5;
        Bits16 word6;
        Bits16 word7;
    };

    /*!
     *  ======== Bits32View ========
     *  One row of Bits32 values
     *  @_nodoc
     */
    metaonly struct Bits32View {
        Ptr    addr;
        Bits32 word0;
        Bits32 word1;
        Bits32 word2;
        Bits32 word3;
    };

    /*!
     *  ======== UCharView ========
     *  One row of UChar values
     *  @_nodoc
     */
    metaonly struct UCharView {
        Ptr   addr;
        UChar byte0;
        UChar byte1;
        UChar byte2;
        UChar byte3;
        UChar byte4;
        UChar byte5;
        UChar byte6;
        UChar byte7;
    };

    /*! @_nodoc - target datatype used to fetch data for UCharView */
    struct UCharBuffer {
        UChar elem;
    };
    
    /*! @_nodoc - target datatype used to fetch data for Bits16View */
    struct Bits16Buffer {
        Bits16 elem;
    };
    
    /*! @_nodoc - target datatype used to fetch data for Bits32View */
    struct Bits32Buffer {
        Bits32 elem;
    };
    
    /*! @_nodoc - matches Mon command size */
    config Int MAXCMDSIZE = 128;
    
    /*! @_nodoc - Mon state structure address */
    config Ptr STATEADDR = "&monObject";
    
    /*! @_nodoc - matches Mon state structure */
    struct MonState {
        Char *buffer; /* command buffer (of length MAXCMDSIZE) */
        Fxn  read;
        Fxn  write;
    };
}

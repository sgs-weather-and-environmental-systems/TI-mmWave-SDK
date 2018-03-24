/****************************************************************************/
/*  sample lnk.cmd   v#####                                                 */
/*  Copyright (c) 1996@%%%%  Texas Instruments Incorporated                 */
/*                                                                          */
/*  Usage: cl6x  <src files...> -z -o <out file> -m <map file> lnk.cmd      */
/*                                                                          */
/*    Description: THIS FILE IS A SAMPLE linker command file that can be    */
/*                 used for linking programs built with the C compiler and  */
/*                 running the resulting .out file on a C620x/C670x         */
/*                 simulator.  Use it as a guideline.  You will want to     */
/*                 change the memory layout to match your specific C6xxx    */
/*                 target system.  You may want to change the allocation    */
/*                 scheme according to the size of your program.            */
/*                                                                          */
/*    Notes: (1)   You must specify a directory in which your library is    */
/*                 located.  either add a -i"<directory>" line to this      */
/*                 file or use the system environment variable C_DIR to     */
/*                 specify a search path for the libraries.                 */
/*                                                                          */
/*           (2)   You may need to specify your library name with           */
/*                 -llibrary.lib if the correct library is not found        */
/*                 automatically.                                           */
/*                                                                          */
/****************************************************************************/
-c
-heap  0x3000
-stack 0x6000
--args 0x1000

MEMORY
{
        PMEM:   o = 00000020h   l = 0020ffe0h
        EXT0:   o = 00400000h   l = 01000000h
        EXT1:   o = 01400000h   l = 00400000h
        EXT2:   o = 02000000h   l = 01000000h
        EXT3:   o = 03000000h   l = 01000000h
        BMEM:   o = 80000000h   l = 02000000h
}

SECTIONS
{
    .text       >       PMEM

    .stack      >       BMEM
    .args       >       BMEM

    GROUP
    {
            .neardata   /* Move .bss after .neardata and .rodata.  ELF allows */
            .rodata     /* uninitialized data to follow initialized data in a */
            .bss        /* single segment. This order facilitates a single    */
                        /* segment for the near DP sections.                  */
    }>BMEM

    .cinit      >       BMEM
    .cio        >       BMEM
    .const      >       BMEM
    .data       >       BMEM
    .switch     >       BMEM
    .sysmem     >       BMEM
    .far        >       BMEM
    .fardata    >       BMEM
    .ppinfo     >       BMEM
    .ppdata     >       BMEM, palign(32) /* Work-around kelvin bug */
}

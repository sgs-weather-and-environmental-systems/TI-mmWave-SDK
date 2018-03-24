/****************************************************************************/
/*  lnk.cmd   v#.##                                                         */
/*  Copyright (c) 2014-%%%%  Texas Instruments Incorporated                 */
/*                                                                          */
/*  Usage: cl7x  <src files...> -z -o <out file> -m <map file> lnk.cmd      */
/*                                                                          */
/*    Description: THIS FILE IS A SAMPLE linker command file that can be    */
/*                 used for linking programs built with the C compiler and  */
/*                 running the resulting .out file on a C7100 simulator.    */
/*                 Use it as a guideline.  You will want to change the      */
/*                 memory layout to match your specific C7xxx target        */
/*                 system.  You may want to change the allocation scheme    */
/*                 according to the size of your program.                   */
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
-heap  0x20000
-stack 0x60000
--args 0x1000

MEMORY
{
        PMEM:   o = 00000020h   l = 00800000h
        BMEM:   o = 40000000h   l = 00800000h
}

SECTIONS
{
    .text       >       PMEM

    .bss        >       BMEM  /* Zero-initialized data */
    .data       >       BMEM  /* Initialized data */

    .cinit      >       BMEM  /* could be part of const */
    .init_array >       BMEM  /* C++ initializations */
    .stack      >       BMEM
    .args       >       BMEM
    .cio        >       BMEM
    .const      >       BMEM
    .switch     >       BMEM /* For exception handling. */
                             /* Not a default ELF section -- remove?  */
                             /* could be part of const */
    .sysmem     >       BMEM /* heap */

 /*
    .tbss       >       BMEM  TLS static
    .tdata      >       BMEM  TLS initialized data

    .got        >       BMEM
    .plt        >       BMEM

    .ppinfo     >       BMEM Need default behavior for non-common sections?
    .ppdata     >       BMEM Need default behavior for non-common sections?
 */
}

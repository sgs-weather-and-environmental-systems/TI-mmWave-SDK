/****************************************************************************/
/* LNK32.CMD - V1.20  COMMAND FILE FOR LINKING TMS470 32BIS C PROGRAMS      */
/*                                                                          */
/*   Usage:  lnk470 <obj files...>    -o <out file> -m <map file> lnk32.cmd */
/*           cl470  <src files...> -z -o <out file> -m <map file> lnk32.cmd */
/*                                                                          */
/*   Description: This file is a sample command file that can be used       */
/*                for linking programs built with the TMS470 C              */
/*                Compiler.   Use it as a guideline; you may want to change */
/*                the allocation scheme according to the size of your       */
/*                program and the memory layout of your target system.      */
/*                                                                          */
/*   Notes: (1)   You must specify the directory in which rts.lib is        */
/*                located.  Either add a "-i<directory>" line to this       */
/*                file, or use the system environment variable C_DIR to     */
/*                specify a search path for libraries.                      */
/*                                                                          */
/*          (2)   If the run-time support library you are using is not      */
/*                named rts32.lib, be sure to use the correct name here.    */
/*                                                                          */
/****************************************************************************/
-c                                         /* LINK USING C CONVENTIONS      */
-stack  0x8000                             /* SOFTWARE STACK SIZE           */
-heap   0x2000                             /* HEAP AREA SIZE                */
--args 0x1000

/* SPECIFY THE SYSTEM MEMORY MAP */

MEMORY
{
    P_MEM    : org = 0x00000020   len = 0x20000000  /* PROGRAM MEMORY (ROM) */
    D_MEM    : org = 0x20000020   len = 0x20000000  /* DATA MEMORY    (RAM) */
}

/* SPECIFY THE SECTIONS ALLOCATION INTO MEMORY */

SECTIONS
{
    .intvecs : {} > 0x0                /* INTERRUPT VECTORS                 */
    .bss     : {} > D_MEM              /* GLOBAL & STATIC VARS              */
    .data    : {} > D_MEM
    .sysmem  : {} > D_MEM              /* DYNAMIC MEMORY ALLOCATION AREA    */
    .stack   : {} > D_MEM              /* SOFTWARE SYSTEM STACK             */

    .text    : {} > P_MEM              /* CODE                              */
    .cinit   : {} > P_MEM              /* INITIALIZATION TABLES             */
    .const   : {} > P_MEM              /* CONSTANT DATA                     */

    .pinit   : {} > P_MEM              /* C++ CONSTRUCTOR TABLES            */
}


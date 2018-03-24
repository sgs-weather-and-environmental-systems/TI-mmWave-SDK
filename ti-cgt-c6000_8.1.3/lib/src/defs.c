/*****************************************************************************/
/*  DEFS.C v8.1.3                                                            */
/*                                                                           */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/

/*****************************************************************************/
/*    This file defines some data structures declared in stdio.h.            */
/*****************************************************************************/
#include <stdio.h>

/*---------------------------------------------------------------------------*/
/* Define the streams for stdin, stdout, and stderr, and assign them as the  */
/* first three streams in _FTABLE upon its initialization.                   */
/* The other entries will be initialize if needed in _search_fp().           */
/*---------------------------------------------------------------------------*/
_DATA_ACCESS
FILE _ftable[_NFILE] = {{  0, NULL, NULL, NULL, NULL, (_MODER | _IOLBF) },
                        {  1, NULL, NULL, NULL, NULL, (_MODEW | _IOLBF) },
                        {  2, NULL, NULL, NULL, NULL, (_MODEW | _IONBF) } };

/*---------------------------------------------------------------------------*/
/* Allocate a table to store the filenames of temporary files, so they can   */
/* be deleted when they are closed.                                          */
/*---------------------------------------------------------------------------*/
_DATA_ACCESS char __TI_tmpnams[_NFILE][L_tmpnam];

/*---------------------------------------------------------------------------*/
/* This global variable __TI_ft_end is used to mark the end of used streams  */
/* in the file table.                                                        */
/*---------------------------------------------------------------------------*/
_DATA_ACCESS int __TI_ft_end = 3; 

/*---------------------------------------------------------------------------*/
/* Under EABI define __aeabi_xxxx variables as required by the CLIB ABI      */
/*---------------------------------------------------------------------------*/

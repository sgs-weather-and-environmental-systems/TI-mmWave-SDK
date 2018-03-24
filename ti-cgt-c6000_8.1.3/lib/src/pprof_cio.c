/*****************************************************************************/
/*  PPROF_CIO.C v8.1.3                                                       */
/*                                                                           */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                    */
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

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <file.h>
#include <pprof.h>

extern _CODE_ACCESS int HOSTopen(const char *path, unsigned flags, int llv_fd),
                        HOSTclose(int dev_fd),
                        HOSTread(int dev_fd, char *buf, unsigned count),
                        HOSTwrite(int dev_fd, const char *buf, unsigned count),
                        HOSTunlink(const char *path),
                        HOSTrename(const char *old_name, const char *new_name);

static _CODE_ACCESS int ppcio_open(const char *filename, unsigned flags, 
                                   int mode);
_CODE_ACCESS void __TI_path_prof_out();

extern _CODE_ACCESS void* find_registered_device(const char *devname);

/******************************************************************************/
/*                                                                            */
/* Top-level handler for ouputting profile info using CIO                     */
/*                                                                            */
/******************************************************************************/
_CODE_ACCESS void __TI_path_prof_out()
{
    __TI_init_pphandler();
    _output_path_profile_info();
}

/******************************************************************************/
/*                                                                            */
/* PPCIO_OPEN()=> Open the profile output file for writing. Check             */
/* environment flags for the profile filename override                        */
/*                                                                            */
/******************************************************************************/
static _CODE_ACCESS int ppcio_open(const char *filename, unsigned flags, 
                                   int mode)
{
    far char *environment_filename = NULL;

    /*------------------------------------------------------------------------*/
    /* Get a user-specified output profile data file name                     */
    /*------------------------------------------------------------------------*/
    environment_filename = getenv("TI_PROFDATA");

    if (environment_filename)   filename = environment_filename;

    return HOSTopen(filename, flags, mode);
}

/******************************************************************************/
/*                                                                            */
/* INIT_PPHANDLER()=> Initialize the handler for CIO                          */
/*                                                                            */
/******************************************************************************/
_CODE_ACCESS void __TI_init_pphandler()
{
    /*------------------------------------------------------------------------*/
    /* add_device() will use an existing PPROF CIO handler, if there already  */
    /* is one in the device table (_device[] in lowlev.c).                    */
    /*------------------------------------------------------------------------*/
    add_device(PPROF_HANDLER_NAME,
               0,
               ppcio_open,
               HOSTclose,
               HOSTread,
               HOSTwrite,
               NULL,
               NULL,
               NULL);
}



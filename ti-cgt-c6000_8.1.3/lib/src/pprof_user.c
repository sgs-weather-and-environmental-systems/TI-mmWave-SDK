/*****************************************************************************/
/*  PPROF_USER.C v8.1.3                                                      */
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

#include <string.h>
#include <pprof.h>

/******************************************************************************/
/*                                                                            */
/* TI_START_PPROF_COLLECTION()=> User interface to start profile collection   */
/*                                                                            */
/******************************************************************************/
void _TI_start_pprof_collection()
{
    char *prof_array_addr = (char*)_symval(&__TI_prof_data_start);
    unsigned int pdsize = _symval(&__TI_prof_data_size);

    /*------------------------------------------------------------------------*/
    /* Nothing to do if we do not have a handler or empty ppdata section      */
    /*------------------------------------------------------------------------*/
    if (_symval(&__TI_pprof_out_hndl) == (unsigned)-1)  return;

    if (_symval(&__TI_prof_data_start) == (unsigned)-1) return;

    if (_symval(&__TI_prof_data_size) == (unsigned)-1) return;


    /*------------------------------------------------------------------------*/
    /* Zero-out existing profile data arrays                                  */
    /*------------------------------------------------------------------------*/
    memset(prof_array_addr, 0, pdsize);

    /*------------------------------------------------------------------------*/
    /* Enable output of profile data                                          */
    /*------------------------------------------------------------------------*/
    __TI_enable_exit_profile_output = 1;
}

/******************************************************************************/
/*                                                                            */
/* TI_STOP_PPROF_COLLECTION()=> User interface to stop profiling and dump     */
/* profile data into file                                                     */
/*                                                                            */
/******************************************************************************/
void _TI_stop_pprof_collection()
{
    static _DATA_ACCESS int first_time = 1;

    /*------------------------------------------------------------------------*/
    /* Nothing to do if we do not have a handler or empty ppdata section      */
    /*------------------------------------------------------------------------*/
    if (_symval(&__TI_pprof_out_hndl) == (unsigned)-1)
        return;

    if (_symval(&__TI_prof_data_start) == (unsigned)-1) return;

    if (_symval(&__TI_prof_data_size) == (unsigned)-1) return;

    /*------------------------------------------------------------------------*/
    /* If this it the first time, initialize the handler for path-prof        */
    /*------------------------------------------------------------------------*/
    if (first_time)
    {
        __TI_init_pphandler();
        first_time = 0;
    }

    /*------------------------------------------------------------------------*/
    /* Output profile data into datafile                                      */
    /*------------------------------------------------------------------------*/
    _output_path_profile_info();

    /*------------------------------------------------------------------------*/
    /* Disable profile data output during exit()                              */
    /*------------------------------------------------------------------------*/
    __TI_enable_exit_profile_output = 0;
}

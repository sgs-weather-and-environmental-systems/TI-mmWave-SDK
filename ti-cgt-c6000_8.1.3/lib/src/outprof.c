/*****************************************************************************/
/*  OUTPROF.C v8.1.3                                                         */
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
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <limits.h>
#include <file.h>
#include <pprof.h>

static void dump_pprof_header(int prof_out_file, unsigned int pdsize,
			      int file_exists);

/******************************************************************************/
/*                                                                            */
/* OUTPUT_PATH_PROFILE_INFO()=> RTS routine to read path-profile counter      */
/* data from ppdata section and output it into appropriate handler/file       */
/*                                                                            */
/******************************************************************************/
void _output_path_profile_info()
{
    far char *prof_array_addr;
    int prof_out_file;
    int i;      
    unsigned int pdsize = _symval(&__TI_prof_data_size);
    int file_exists = 0;
    char fil_name[32];

    /*------------------------------------------------------------------------*/
    /* Set the filename to default file name                                  */
    /*------------------------------------------------------------------------*/
    char *filename = "pprofout.pdat";

    /*------------------------------------------------------------------------*/
    /* We expect a device called PPHNDL to be registered.                     */
    /*------------------------------------------------------------------------*/
    strcpy(fil_name, PPROF_HANDLER_NAME);
    strcat(fil_name, ":");
    strcat(fil_name, filename);
    filename = fil_name;

    /*------------------------------------------------------------------------*/
    /* See if the file exists                                                 */
    /*------------------------------------------------------------------------*/
    prof_out_file = open(filename, O_RDONLY, 0);

    if (prof_out_file != -1) file_exists = 1;

    close(prof_out_file);

    /*------------------------------------------------------------------------*/
    /* Open the profile output file in append mode                            */
    /*------------------------------------------------------------------------*/
    prof_out_file = open(filename, O_BINARY|O_APPEND|O_CREAT|O_RDWR, 0);

    /*------------------------------------------------------------------------*/
    /* If open fails for any reason, return                                   */
    /*------------------------------------------------------------------------*/
    if (prof_out_file == -1)
    {
        /*--------------------------------------------------------------------*/
        /* We cannot print out error messages due to the problem of           */
        /* linking-in unneeded RTS routines                                   */
        /*--------------------------------------------------------------------*/
        return;
    }

    /*------------------------------------------------------------------------*/
    /* Do nothing if profile data section is empty                            */
    /*------------------------------------------------------------------------*/
    if (_symval(&__TI_prof_data_start) == (unsigned) -1) return;

    if (_symval(&__TI_prof_data_size) ==  (unsigned) -1) return;

    /*------------------------------------------------------------------------*/
    /* Write the header first                                                 */
    /*------------------------------------------------------------------------*/
    dump_pprof_header(prof_out_file, pdsize, file_exists);

    prof_array_addr = (char*)_symval(&__TI_prof_data_start);

#define MIN(a, b) ( (a) < (b) ? (a) : (b))

    for (i = 0; i < pdsize; i += BUFSIZ)
    {
        int cnt = MIN(pdsize - i, BUFSIZ);
        write(prof_out_file, prof_array_addr + i, cnt);
    }

    close(prof_out_file);

}

/******************************************************************************/
/*                                                                            */
/* DUMP_PPROF_HEADER => Dump header for the data file and pprof dataset       */
/*                                                                            */
/******************************************************************************/
static void dump_pprof_header(int prof_out_file, unsigned int pdsize,
			      int file_exists)
{
    char *fl_magic = PPROF_FILE_MAGIC;
    int num_hdr = PPROF_NUM_HDR_FIELDS;
    char *dset_magic = PPROF_DSET_MAGIC;
    int one = 1, zero = 0;
    int version = PPROF_VERSION;
    unsigned char endian = LITTLE_ENDIAN_CODE;
    unsigned int tot_len = (num_hdr+1) * sizeof(int) + pdsize ;
    unsigned int elem_size = sizeof(unsigned int);

#ifdef _BIG_ENDIAN
    endian = BIG_ENDIAN_CODE;
#endif

    /*------------------------------------------------------------------------*/
    /* If the file exists, don't write the file header                        */
    /*------------------------------------------------------------------------*/
    if (!file_exists)
        write(prof_out_file, fl_magic, strlen(fl_magic));
    
    /*------------------------------------------------------------------------*/
    /* Write the file header                                                  */
    /*                                                                        */
    /* DATASET MAGIC "TI_PDD" - 6 chars                                       */
    /*                                                                        */
    /* ENDIANNESS - 1 byte                                                    */
    /*                                                                        */
    /* VERSION ID - 4 bytes                                                   */
    /*                                                                        */
    /* TOTAL LENGTH (OF DATASET HEADER + RAW DATA IN BYTES) - 4 bytes         */
    /*------------------------------------------------------------------------*/
    write(prof_out_file, dset_magic, strlen(dset_magic));
    write(prof_out_file, (char*)&endian, sizeof(endian));
    write(prof_out_file, (char*)&version, sizeof(version));
    write(prof_out_file, (char*)&tot_len, sizeof(tot_len));

    /*------------------------------------------------------------------------*/
    /* The pprof dataset header consists of                                   */
    /*                                                                        */
    /* Header len                                                             */
    /*                                                                        */
    /* - Data item size (i.e., array element size of ppdata array = 4 bytes)  */
    /*                                                                        */
    /* - Weight (default:1)                                                   */
    /*                                                                        */
    /* - Id (zero)                                                            */
    /*------------------------------------------------------------------------*/
    write(prof_out_file, (char*)&num_hdr, sizeof(num_hdr));
    write(prof_out_file, (char*)&elem_size, sizeof(elem_size));
    write(prof_out_file, (char*)&one, sizeof(one));
    write(prof_out_file, (char*)&zero, sizeof(zero));
}


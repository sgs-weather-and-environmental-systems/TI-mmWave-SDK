/****************************************************************************/
/*  EXIT.C v16.9.6                                                          */
/*                                                                          */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#include <stdlib.h>
#include <_lock.h>
#include <pprof.h>

void                     (*__TI_cleanup_ptr)(void) = NULL;
void   _DATA_ACCESS      (*__TI_dtors_ptr)(int)    = NULL;

typedef void (*PTRFUNC)();
int __TI_enable_exit_profile_output = 1;
/****************************************************************************/
/*                                                                          */
/* LOADER_EXIT -							    */
/* 									    */
/* SET C$$EXIT LABEL SO THE DEBUGGER KNOWS WHEN THE C++ PROGRAM HAS	    */
/* COMPLETED.  THIS CAN BE REMOVED IF THE DEBUGGER IS NOT USED.		    */
/*                                                                          */
/****************************************************************************/
static void loader_exit(void)
{
#if defined(EMBED_CIO_BP)
   __asm("         .global C$$EXITE");
#if defined(__32bis__)
   __asm("C$$EXITE:.word 0xDEFED0FE");
#else
   __asm("	 .align  4");
#if defined(__big_endian__)
   __asm("C$$EXITE:.half 0xDEFE");
#else
   __asm("C$$EXITE:.half 0xD0FE");
#endif /* __big_endian__ */
#endif /* __32bis__      */

#else  /* !EMBED_CIO_BP */
   __asm("        .global C$$EXIT");
   __asm("C$$EXIT: nop");
#endif
}

/****************************************************************************/
/* EXIT() - NORMAL PROGRAM TERMINATION.                                     */
/****************************************************************************/
extern void exit(int status)        
{
   /*----------------------------------------------------------------------*/
   /* Output profile info if we have a valid path profile output handler   */
   /*----------------------------------------------------------------------*/
   if (__TI_enable_exit_profile_output &&
       _symval(&__TI_pprof_out_hndl) != (unsigned)-1)
   {
       PTRFUNC ppfunc = (PTRFUNC)(_symval(&__TI_pprof_out_hndl));
       (ppfunc)();
   }
  
   /*-------------------------------------------------------------------*/
   /* MUST LOCK WHEN ACCESSING GLOBALS, like __TI_dtors_ptr,            */
   /* __TI_cleanup_ptr                                                  */
   /*-------------------------------------------------------------------*/  
   _lock();

   /*-------------------------------------------------------------------*/
   /* BOTH ATEXIT FUNCTIONS AND STATIC OBJECT DESTRUCTORS ARE           */
   /* REGISTERED IN A LINK LIST TO BE PROCESSED BY THE FUNCTION POINTED */
   /* TO BY __TI_dtors_ptr.  PROCESS THEM NOW.                          */
   /*-------------------------------------------------------------------*/
   if (__TI_dtors_ptr)  (*__TI_dtors_ptr)(status);

#if defined(_C_IN_NS)
   /*-------------------------------------------------------------------*/
   /* _C_IN_NS IS A FLAG WE SET ONLY IN DINKUMWARE HEADERS. SO US IT TO */
   /* TELL IF IT IS IN DINKUMWARE.                                      */
   /* FOR DINKUMWARE LIBRARY, CALL CLOSEALL() TO CLOSE ALL IO STREAMS.  */
   /* CLOSEALL() is a DINKUMWARE FUNCTION DEFINED IN FCLOSE.C TO CLOSE  */
   /* ALL OPENED IOSTREAMS.                                             */
   /*-------------------------------------------------------------------*/
   closeall(); 
#else
   /*-------------------------------------------------------------------*/
   /* IF FILES ARE POSSIBLY OPEN, __TI_cleanup_ptr() WILL BE SETUP TO   */
   /* CLOSE THEM.                                                       */
   /*-------------------------------------------------------------------*/
   if (__TI_cleanup_ptr)  (*__TI_cleanup_ptr)();
#endif

   _unlock();
   abort();
}

/****************************************************************************/
/* ABORT - ABNORMAL PROGRAM TERMINATION.  CURRENTLY JUST HALTS EXECUTION.   */
/****************************************************************************/
void abort(void)
{
    loader_exit();
    for (;;);   /* SPINS FOREVER */
}

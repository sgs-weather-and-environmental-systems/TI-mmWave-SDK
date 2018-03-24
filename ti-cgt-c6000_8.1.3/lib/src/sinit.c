/****************************************************************************/
/*  sinit     v8.1.3                                                        */
/*                                                                          */
/* Copyright (c) 1996-2017 Texas Instruments Incorporated                   */
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
#include <_data_synch.h>
#include "_dtor_list.h"

extern _DATA_ACCESS void (*__TI_dtors_ptr)(int);
extern _DATA_ACCESS int __atexit_func_id__;

static _DATA_ACCESS DTOR_LIST *dtors = NULL;
	 
/****************************************************************************/
/* call_dtors() - PERFORM STATIC DESTRUCTION.                               */
/****************************************************************************/
static void call_dtors(int status)
{
   while (dtors)
   {
      /*-----------------------------------------------------------------*/
      /* SINCE A DESTRUCTOR MAY ADD NEW DESTRUCTORS TO THE LIST, NOTE    */
      /* AND REMOVE THE HEAD OF THE DESTRUCTOR LIST NOW.                 */
      /*-----------------------------------------------------------------*/
      DTOR_LIST *curr_dtor = dtors;
      dtors = dtors->next;

      /*-----------------------------------------------------------------*/
      /* IF A SINGLE OBJECT, AND IT IS NOT AN ATEXIT FUNCTION, CALL ITS  */
      /* DESTRUCTOR ON ITSELF (A FLAG VALUE OF 2 INDICATES THAT OPERATOR */
      /* DELETE SHOULD NOT BE CALLED). IF MULTIPLE OBJECTS OR            */
      /* ATEXIT_FUNCTIONS, JUST CALL THE SUPPLIED FUNCTION.              */
      /*-----------------------------------------------------------------*/
      if (curr_dtor->object)
      {
	 if (IS_ATEXIT_FUNC(curr_dtor->object))  
	    curr_dtor->fun.dfun();
	 else
	    curr_dtor->fun.dtor(curr_dtor->object, 2);
      }
      else 
	 curr_dtor->fun.dfun();
   }
}

/****************************************************************************/
/* __add_dtor() - ADD A DESTRUCTOR TO THE LIST OF STATIC DESTRUCTIONS.      */
/****************************************************************************/
void __add_dtor(DTOR_LIST *dtor_entry)
{
   /*-----------------------------------------------------------------------*/
   /* REGISTER call_dtors() SO exit() WILL CALL IT.  call_dtors() ISN'T     */
   /* CALLED DIRECTLY FROM exit() SO THAT IT ISN'T LINKED IN IF NOT USED.   */
   /*-----------------------------------------------------------------------*/
   __TI_dtors_ptr = call_dtors;
   __TI_data_synch_WBINV(&__TI_dtors_ptr, sizeof(__TI_dtors_ptr));

   /*-----------------------------------------------------------------------*/
   /* ADD THE DESTRUCTOR TO THE LIST.                                       */
   /*-----------------------------------------------------------------------*/
   dtor_entry->next = dtors;
   dtors = dtor_entry;
   __TI_data_synch_WBINV(&dtors, sizeof(dtors));
}

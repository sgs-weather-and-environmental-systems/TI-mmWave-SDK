/****************************************************************************/
/*  _DTOR_LIST.H v16.9.6                                                    */
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
/****************************************************************************/
/* THIS DATA STRUCTURE IS DEFINED BY EDG IN LOWER_INIT.C AT                 */
/* RECORD_NEEDED_DESTRUCTION(). EDG WILL GENERATE A STATIC INSTANCE OF THIS */
/* DATA STRUCTURE TO RECORD ANY GLOBAL OBJECT CREATED.                      */
/* LIST OF REQUIRED STATIC DESTRUCTIONS.  object POINTS TO THE OBJECT TO BE */
/* DESTROYED, OR NULL IF THERE ARE SEVERAL.  dtor IS THE DESTRUCTOR FOR THE */
/* OBJECT, AND dfun IS A FUNCTION THAT WILL CALL ALL OF THE DESTRUCTORS IS  */
/* THERE ARE SEVERAL. ALWAYS ADD TO THE HEAD OF THE LIST TO ENSURE THE      */
/* PROPER ORDER OF DESTRUCTION.                                             */
/* WE BORROW THIS DATA STRUCTURE TO RECORD ATEXIT FUNCTIONS ALSO. WHEN      */
/* ATEXIT FUNCTIONS ARE RECORDED, OBJECT FIELD WILL HOLDS A POINTER POINTS  */
/* TO A UNIQUE GLOBAL VARIABLE, CALLED ATEXIT_FUNC_ID. AND DFUN WILL HOLD   */
/* HOLD THE POINTER TO THE ATEXIT FUNCTION.                                 */
/****************************************************************************/
typedef struct dtor_list
{
   struct dtor_list *next;
   void             *object;
   union
   {
      void  (*dtor)(void *, int);
      void  (*dfun)(void);
   } fun;
} DTOR_LIST;

#define IS_ATEXIT_FUNC(x) (x == &__atexit_func_id__)

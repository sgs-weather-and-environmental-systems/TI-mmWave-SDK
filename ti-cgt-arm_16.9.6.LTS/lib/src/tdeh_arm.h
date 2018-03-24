/*****************************************************************************/
/*  tdeh_arm.h v16.9.6                                                       */
/*                                                                           */
/* Copyright (c) 2005-2017 Texas Instruments Incorporated                    */
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
/*                                                                           */
/*  Target-Specific header for Table-Driven Exception Handling               */
/*                                                                           */
/*****************************************************************************/
#ifndef _TDEH_ARM_H_
#define _TDEH_ARM_H_

#include "tdeh_common.h"

#ifdef __cplusplus
extern "C" {
#endif
    _Unwind_Reason_Code __aeabi_unwind_cpp_pr0 (_Unwind_Phase      phase,
					        _Unwind_Exception *uexcep, 
					        _Unwind_Context   *context);
    _Unwind_Reason_Code __aeabi_unwind_cpp_pr1 (_Unwind_Phase      phase,
					        _Unwind_Exception *uexcep, 
					        _Unwind_Context   *context);
    _Unwind_Reason_Code __aeabi_unwind_cpp_pr2 (_Unwind_Phase      phase,
					        _Unwind_Exception *uexcep, 
					        _Unwind_Context   *context);
#ifdef __cplusplus
}
#endif

#define UWINS_FINISH	(0xb0)

typedef enum
{
    _UR_R0   =  0,
    _UR_R4   =  4,
    _UR_SP   = 13,
    _UR_LR   = 14,
    _UR_PC   = 15,
    _UR_LAST = _UR_PC
} _Unwind_Reg_Id;


/*****************************************************************************/
/* Register Buffer - Used to store copy of the machine regs during unwinding */
/*                   _Unwind_Context is an opaque handle used to access the  */
/*                   register buffer. The unwinder passes _Unwind_Context*   */
/*                   to the personality routine.                             */
/*****************************************************************************/
typedef struct
{
    _UINT32 core[16];
} _Unwind_Register_Buffer;


#endif /* _TDEH_ARM_H_ */

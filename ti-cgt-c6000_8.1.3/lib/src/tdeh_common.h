/*****************************************************************************/
/*  tdeh_common.h v8.1.3                                                     */
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
/*  Target-Independent header for Table-Driven Exception Handling            */
/*                                                                           */
/*****************************************************************************/
#ifndef _TDEH_COMMON_H_
#define _TDEH_COMMON_H_

typedef unsigned long long _UINT64;
typedef unsigned int       _UINT32;
typedef int                _INT32;
typedef unsigned short     _UINT16;
typedef unsigned char      _UINT8 ;


typedef enum {_UP_Phase1=0, _UP_Phase2_Start, _UP_Phase2_Resume} _Unwind_Phase;


typedef enum {
    _URC_SUCCESS                  = 0,
    _URC_FOREIGN_EXCEPTION_CAUGHT = 1,
    _URC_FATAL_PHASE2_ERROR       = 9 /*2*/,
    _URC_FATAL_PHASE1_ERROR       = 9 /*3*/,
    _URC_NORMAL_STOP              = 4,
    _URC_END_OF_STACK             = 5,
    _URC_HANDLER_FOUND            = 6,
    _URC_INSTALL_CONTEXT          = 7,
    _URC_CONTINUE_UNWIND          = 8,
    _URC_FAILURE                  = 9,
    _URC_BAD_UNWIND_INSTR         =10
} _Unwind_Reason_Code;


/*****************************************************************************/
/* _Unwind_Context - Opaque handle used to access the register buffer. The   */
/*                   unwinder passes _Unwind_Context* to the PR              */
/*****************************************************************************/
typedef struct _Unwind_Context _Unwind_Context;

struct _Unwind_Exception_s;

typedef void (*_UE_Cleanup_Fn)(_Unwind_Reason_Code reason,
					     struct _Unwind_Exception_s *exc);

/*****************************************************************************/
/* _Unwind_Exception - Used by the unwinder and pr routines to store data    */
/*                     when an exception is processed                        */
/*****************************************************************************/
typedef struct _Unwind_Exception_s
{
    _UINT64        exception_class;   /* Set to "TI  C++" for this impl */
    _UE_Cleanup_Fn exception_cleanup; /* To destroy foreign exceptions  */

    struct {
	_UINT32 saved_callsite_addr;  /* Stores PC over calls to PR     */
	_UINT32 pr_addr;              /* Address of the PR to be used   */
    } unwinder_data;

    struct {
	_UINT32 sp;
	_UINT32 data[5]; /* Phase 1, data[0] - type matched		*/
			 /*          data[1] - EHT ptr			*/
			 /* Phase 2, FESPEC Only:			*/
			 /*	    data[0] - Dont Care			*/
			 /*	    data[1] - rtti type count		*/
			 /*	    data[2] - Segment Base		*/
			 /*	    data[3] - Stride			*/
			 /*	    data[4] - Ptr to rtti types		*/
    } barrier_data;

    struct {
	_UINT32 cleanup_ehtp; /* Save EHT ptr to resume after cleanup   */
    } cleanup_data;

    struct
    {
	_UINT32  func_start;  /* Address of the function                */
	_UINT32 *eht_start;   /* Address of the EHT for the function    */
	_UINT32  additional;  /* Only bit 0 used, == 1 => inline EHT    */
    } pr_data;

} _Unwind_Exception;


/*****************************************************************************/
/* _PR_TYPE - Typedef for the personality routine                            */
/*****************************************************************************/
typedef _Unwind_Reason_Code (*_PR_TYPE) (_Unwind_Phase, _Unwind_Exception *, 
					 _Unwind_Context   *);


/*****************************************************************************/
/* _Unwind_PR_Kind - Enum of the PR variants currently defined               */
/*****************************************************************************/
typedef enum { _UPK_Su16=0, _UPK_Lu16, _UPK_Lu32, _UPK_PR3, _UPK_PR4 } _Unwind_PR_Kind;


/*****************************************************************************/
/* _Unwind_Table - Struct used to associate a PC value with a procedure and  */
/*                 its exception table                                       */
/*****************************************************************************/
typedef struct 
{
    _UINT32 UT_base;
    _UINT32 UT_limit;
} _Unwind_Table;

/*****************************************************************************/
/* _Unwind_Table_Entry - A single entry in the _Unwind_Table, stores the     */
/*                       function offset and EHT offset/Inlined EHT          */
/*****************************************************************************/
typedef struct
{
    _UINT32 fn_offset;
    _UINT32 et_offset;
} _Unwind_Table_Entry;


/*****************************************************************************/
/* Target-specific functions (must be defined for each supported target)     */
/*****************************************************************************/
_UINT32 __TI_targ_regbuf_get_sp    (_Unwind_Context *);
_UINT32 __TI_targ_regbuf_get_pc    (_Unwind_Context *);
void    __TI_targ_regbuf_set_pc    (_Unwind_Context *, _UINT32);
_UINT32 __TI_targ_regbuf_get_sb    (_Unwind_Context *);
void    __TI_targ_regbuf_install   (_Unwind_Context *);
_UINT32 __TI_targ_rtti_address     (_UINT32 offset, _Unwind_Context *);

bool    __TI_targ_set_pr           (_Unwind_Exception *);

void    __TI_targ_setup_call_parm0(_Unwind_Context *, _UINT32);
_UINT32 __TI_prel2abs(const _UINT32 *p_offset);



#define CATCH_ANY		(0xffffffff)
#define CATCH_ANY_TERMINATE	(0xfffffffe)

#define UT_CANT_UNWIND	        (0x1)

#define INLINE 

/* #define DEBUG_TDEH 1 */

#ifdef DEBUG_TDEH
#define DEBUG_PR
#define DEBUG_UW_INSTRS
#define DEBUG_UNWINDER
#define DEBUG_TM
#define DEBUG_CPPABI
#define DEBUG_BSEARCH
void __TI_dump_regbuf_context(_Unwind_Context *);
#endif

#endif /* _TDEH_COMMON_H_ */

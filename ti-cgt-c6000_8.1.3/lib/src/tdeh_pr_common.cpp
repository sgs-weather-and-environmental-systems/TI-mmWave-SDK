/*****************************************************************************/
/*  tdeh_pr_common.cpp v8.1.3                                                */
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
/*  Contains the target-independent routines of the Personality Routine (PR) */
/*  implementation (descriptor processing) required by Table-Driven          */
/*  Exception Handling                                                       */
/*                                                                           */
/*****************************************************************************/
#if __EXCEPTIONS && defined(__TI_TABLE_DRIVEN_EXCEPTIONS)

#include <stdint.h>
#include <typeinfo>
#include "tdeh_common.h"

#if defined(DEBUG_CPPABI)
#include <stdio.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*****************************************************************************/
/* EXTERNS - C++ EH Compiler Helper Functions                                */
/*****************************************************************************/
bool __cxa_begin_cleanup(_Unwind_Exception *);
bool __cxa_type_match   (_Unwind_Exception *, const std::type_info *, void **);

#ifdef __cplusplus
}
#endif

/*****************************************************************************/
/* Scope16, Scope32 - Descriptor Scope place-holders, used to read 16/32-bit */
/*                    length/offset fields from a descriptor entry           */
/*****************************************************************************/
typedef struct
{
    _UINT16 length;
    _UINT16 offset;
} _PR_Scope16;

typedef struct
{
    _UINT32 length;
    _UINT32 offset;
} _PR_Scope32;


/*****************************************************************************/
/* PR helper functions: The following funcs are used by __TI_unwind_cpp_pr   */
/* to process descriptors and unwind instructions                            */
/*****************************************************************************/
INLINE static bool process_cleanup(_Unwind_Exception  *uexcep, 
				   _Unwind_Phase       phase, 
				   _Unwind_Context    *context,
				   _UINT32           **descr_ptr, 
				   _UINT32             length, 
				   _UINT32             offset);

INLINE static bool process_catch(_Unwind_Exception   *uexcep, 
				 _Unwind_Phase        phase, 
				 _Unwind_Context     *context,
				 _UINT32            **descr_ptr, 
				 _UINT32              length, 
				 _UINT32              offset,
				 _Unwind_Reason_Code *reason);

INLINE static bool process_fespec(_Unwind_Exception   *uexcep, 
				  _Unwind_Phase        phase, 
				  _Unwind_Context     *context,
				  _UINT32            **descr_ptr, 
				  _UINT32              length, 
				  _UINT32              offset,
				  _Unwind_Reason_Code *reason,
				  bool                *call_unexpected);


/*****************************************************************************/
/*                                                                           */
/* __TI_process_descriptors -                                                */
/*                                                                           */
/*****************************************************************************/
bool __TI_process_descriptors(_Unwind_Phase        phase, 
			      _Unwind_Exception   *uexcep, 
			      _Unwind_Context     *context, 
			      _Unwind_PR_Kind      pr_kind, 
			      _UINT32             *descr_ptr, 
			      _Unwind_Reason_Code *reason, 
			      bool                *ph2_call_unexpected)
{

    bool reason_code_valid = false;

    #ifdef DEBUG_PR
    printf("PD: descriptor @ %p\n", descr_ptr);
    #endif /* DEBUG_PR */

    /*-------------------------------------------------------------------*/
    /* Process each descriptor. The descriptor list is terminated by a   */
    /* 0 word (first word of a valid descriptor, length, is never 0)     */
    /*-------------------------------------------------------------------*/
    while (*descr_ptr)
    {
	_UINT32 length; 
	_UINT32 offset;

	/*---------------------------------------------------------------*/
	/* Based of PR kind, read in length and offset (16/32 bit)       */
	/*---------------------------------------------------------------*/
	switch (pr_kind)
	{
	    case _UPK_Su16: 
	    case _UPK_Lu16: 
	    case _UPK_PR3:
	    case _UPK_PR4:
		length = ((_PR_Scope16 *)descr_ptr)->length;
		offset = ((_PR_Scope16 *)descr_ptr)->offset;
		descr_ptr += sizeof(_PR_Scope16)/sizeof(_UINT32);
		break;

	    case _UPK_Lu32:
		length = ((_PR_Scope32 *)descr_ptr)->length;
		offset = ((_PR_Scope32 *)descr_ptr)->offset;
		descr_ptr += sizeof(_PR_Scope32)/sizeof(_UINT32);
		break;

	    default:
		*reason = _URC_FAILURE;
		reason_code_valid = true;
		break;
	}

	/*---------------------------------------------------------------*/
	/* Use LSB of length and offset to determine descriptor type     */
	/* 0,0 => cleanup, 0,1 => func espec, 1,0 => catch               */
	/*---------------------------------------------------------------*/
	switch (((length & 1) << 1) | (offset & 1))
	{
	    case 0:	    /* Process a Cleanup Descriptor*/
	    {
		if (process_cleanup(uexcep, phase, context,&descr_ptr,
				    length, offset))
		{
		    *reason = _URC_INSTALL_CONTEXT;
		    reason_code_valid = true;
		}
		break;
	    }
	    case 1:	    /* Process a Function Exception Spec Descriptor */
	    {
		offset -= 1; /* Clear LSB */
		if (process_fespec(uexcep, phase, context,&descr_ptr,
				    length, offset, reason, 
				    ph2_call_unexpected))
		    reason_code_valid = true;
		break;
	    }
	    case 2:	    /* Process a Catch Descriptor*/
	    {
		length -= 1; /* Clear LSB */
		if (process_catch(uexcep, phase, context,&descr_ptr,
				  length, offset, reason))
		    reason_code_valid = true;
		break;
	    }
	    default:
		*reason = _URC_FAILURE;
		reason_code_valid = true;
		break;
	}

	if (reason_code_valid == true) break;
    }
	
    return reason_code_valid;
}





/*****************************************************************************/
/*                                                                           */
/* process_cleanup - This function is used to process the variant part of a  */
/*                   cleanup record. Returns true if there is any action to  */
/*                   be performed for the cleanup record processed.          */
/*                                                                           */
/*****************************************************************************/
INLINE static bool process_cleanup(_Unwind_Exception  *uexcep, 
				   _Unwind_Phase       phase, 
				   _Unwind_Context    *context,
				   _UINT32           **descr_ptr, 
				   _UINT32             length, 
				   _UINT32             offset)
{
     
    _UINT32 *p_lp       = *descr_ptr;
    _UINT32 range_start = uexcep->pr_data.func_start + offset;
    _UINT32 curr_pc     = __TI_targ_regbuf_get_pc(context);
	    
    #ifdef DEBUG_PR
    printf("PR: (@ %p) Clean, Phase %d, "
           "Len %"PRId32", Off %"PRIx32", lp %"PRIx32"\n", 
	    *descr_ptr, phase, length, offset, **descr_ptr);
    #endif /* DEBUG_PR */

    /*-----------------------------------------------------------------------*/
    /* Increment desc ptr beyond landing pad                                 */
    /*-----------------------------------------------------------------------*/
    (*descr_ptr)++;

    /*-----------------------------------------------------------------------*/
    /* Phase 2, and PC is within the range, set up reg buff to call handler  */
    /*-----------------------------------------------------------------------*/
    if (phase != _UP_Phase1 && 
	curr_pc >= range_start && curr_pc < range_start+length)
    {

	/*-------------------------------------------------------------------*/
	/* Save address of next EHT descriptor, to resume processing later   */
	/*-------------------------------------------------------------------*/
	uexcep->cleanup_data.cleanup_ehtp = (_UINT32)(*descr_ptr);

	/*-------------------------------------------------------------------*/
	/* __cxa_begin_cleanup must be called before starting any cleanups   */
	/*-------------------------------------------------------------------*/
	__cxa_begin_cleanup(uexcep);

	/*-------------------------------------------------------------------*/
	/* Set up registers to call cleanup landing pad                      */
	/*-------------------------------------------------------------------*/
	__TI_targ_regbuf_set_pc(context, __TI_prel2abs(p_lp));
		      
	return true;
    }

    return false;
}


/*****************************************************************************/
/*                                                                           */
/* process_catch - This function is used to process the variant part of a    */
/*                 catch descriptor. Returns true if there is a valid reason */
/*                 code in reason.                                           */
/*                                                                           */
/*****************************************************************************/
INLINE static bool process_catch(_Unwind_Exception   *uexcep, 
				 _Unwind_Phase        phase, 
				 _Unwind_Context     *context,
				 _UINT32            **descr_ptr, 
				 _UINT32              length, 
				 _UINT32              offset,
				 _Unwind_Reason_Code *reason)
{
    bool reason_valid = false;

    _UINT32 *p_lp_offset = *descr_ptr;
    _UINT32 rtti_offset  = *(*descr_ptr+1);
    _UINT32 range_start  = uexcep->pr_data.func_start + offset;

    _UINT32 curr_pc      = __TI_targ_regbuf_get_pc(context);
    _UINT32 sp           = __TI_targ_regbuf_get_sp(context);
    _UINT32 rtti_address = __TI_targ_rtti_address(rtti_offset, context);

    #ifdef DEBUG_PR
    printf("PR: (@ %p) Catch, Phase %d, "
           "Len %"PRId32", Off %#"PRIx32", (%"PRIx32" - %"PRIx32") "
	   "lp %"PRIx32", type %"PRIx32" (offset = %"PRIx32")\n", 
	   *descr_ptr, phase, length, offset, range_start, range_start+length,
	   *p_lp_offset, rtti_address, rtti_offset);
    #endif /* DEBUG_PR */

    /*-----------------------------------------------------------------------*/
    /* Phase 1, Check if catch forms propagation barrier                     */
    /*-----------------------------------------------------------------------*/
    if (phase == _UP_Phase1)
    {
	/*-------------------------------------------------------------------*/
	/* Check if PC is in range                                           */
	/*-------------------------------------------------------------------*/
	if (curr_pc >= range_start && curr_pc < range_start+length)
	{
	    /*---------------------------------------------------------------*/
	    /* Check for a type match, also check for catch all/terminate    */
	    /*---------------------------------------------------------------*/
	    void *matched;
	    if (rtti_offset == CATCH_ANY_TERMINATE)
	    {
		*reason = _URC_FAILURE;
		reason_valid = true;
	    }
            #pragma diag_suppress 1107
	    else if (rtti_offset == CATCH_ANY || 
		     __cxa_type_match(uexcep, 
                                      (std::type_info *)(uintptr_t)rtti_address,
				      &matched))
            #pragma diag_default 1107
	    {
		#ifdef DEBUG_PR
		printf("PR: Found catch propagation barrier\n");
		#endif /* DEBUG_PR */

		/*-----------------------------------------------------------*/
		/* Save propagation barrier: SP and ptr to descr (Sec 7.3/5) */
		/*-----------------------------------------------------------*/
		uexcep->barrier_data.sp      = sp;
		uexcep->barrier_data.data[1] = (_UINT32)*descr_ptr;

		/*-----------------------------------------------------------*/
		/* cxa_begin_catch requires matched type in 0, Sec 8.2       */
		/*-----------------------------------------------------------*/
		uexcep->barrier_data.data[0] = (_UINT32)matched;

		*reason      = _URC_HANDLER_FOUND;
		reason_valid = true;
	    }
	}
    }
    /*-----------------------------------------------------------------------*/
    /* Phase 2 Start or Resume, check for barrier, set up catch handler      */
    /*-----------------------------------------------------------------------*/
    else 
    {
	/*-------------------------------------------------------------------*/
	/* Check for a previously saved propagation barrier                  */
	/*-------------------------------------------------------------------*/
	if (sp == uexcep->barrier_data.sp && 
		(_UINT32)*descr_ptr == uexcep->barrier_data.data[1])
	{
	    /*---------------------------------------------------------------*/
	    /* Set up PC to call catch handler, set up UE ptr in R0          */
	    /*---------------------------------------------------------------*/
	    __TI_targ_regbuf_set_pc(context, __TI_prel2abs(p_lp_offset));
	    __TI_targ_setup_call_parm0(context, (_UINT32)uexcep);

	    *reason      = _URC_INSTALL_CONTEXT;
	    reason_valid = true;
	}
    }

    /*-----------------------------------------------------------------------*/
    /* Increment desc ptr beyond landing pad & rtti offset                   */
    /*-----------------------------------------------------------------------*/
    (*descr_ptr) += 2;

    return reason_valid;
}


/*****************************************************************************/
/*                                                                           */
/* process_fespec - This function is used to process the variant part of a   */
/*                  Function Exception SPECification descriptor.  Returns    */
/*                  true if there is a valid reason code in reason.          */
/*                                                                           */
/*****************************************************************************/
INLINE static bool process_fespec (_Unwind_Exception   *uexcep, 
				   _Unwind_Phase        phase, 
				   _Unwind_Context     *context,
				   _UINT32            **descr_ptr, 
				   _UINT32              length, 
				   _UINT32              offset,
				   _Unwind_Reason_Code *reason,
				   bool                *ph2_call_unexpected)
{
    bool reason_valid = false;

    _UINT32 rtti_count      = **descr_ptr;
    _UINT32 range_start     = uexcep->pr_data.func_start + offset;
    bool   call_unexpected;

    _UINT32 curr_pc = __TI_targ_regbuf_get_pc(context);
    _UINT32 sp      = __TI_targ_regbuf_get_sp(context);
    _UINT32 sb      = __TI_targ_regbuf_get_sb(context);

    /*-----------------------------------------------------------------------*/
    /* The MSB in rtti_count is used to indicate a call to call_unexpected   */
    /* MSB ==0, use call_unexpected, MSB ==1, use handler supplied in descr  */
    /*-----------------------------------------------------------------------*/
    call_unexpected  = (rtti_count & 0x80000000) ? false : true;
    rtti_count      &= 0x7fffffff;

    #ifdef DEBUG_PR
    printf("PR: (@ %p) Fspec, Len %"PRId32", "
           "Off %"PRIx32", Count %"PRIx32"\n", 
	    *descr_ptr, length, offset, rtti_count);
    #endif /* DEBUG_PR */

    /*-----------------------------------------------------------------------*/
    /* Phase 1, check if fespec forms a propagation barrier                  */
    /*-----------------------------------------------------------------------*/
    if (phase == _UP_Phase1)
    {
	if (curr_pc >= range_start && curr_pc < range_start+length)
	{
	    /*---------------------------------------------------------------*/
	    /* Check list of rtti types for match                            */
	    /*---------------------------------------------------------------*/
	    void   *matched;
	    _UINT32  idx;
	    for (idx=0; idx < rtti_count; idx++)
	    { 
		_UINT32 rtti_offset  = (_UINT32)*((*descr_ptr) + idx + 1);
                _UINT32 rtti_address = __TI_targ_rtti_address(rtti_offset, 
		                                              context);
                #pragma diag_suppress 1107
		if (__cxa_type_match(uexcep, 
                                     (std::type_info *)(uintptr_t)rtti_address,
				     &matched))
		    break;
                #pragma diag_default 1107
	    }

	    /*---------------------------------------------------------------*/
	    /* If no match, exception should not propagate beyond this func  */
	    /* save propagation barrier                                      */
	    /*---------------------------------------------------------------*/
	    if (idx == rtti_count)
	    {
		#ifdef DEBUG_PR
		printf("PR: Found fespec propagation barrier\n");
		#endif /* DEBUG_PR */

		/*-----------------------------------------------------------*/
		/* Save propagation barrier: SP and ptr to descr (Sec 7.3/5) */
		/*-----------------------------------------------------------*/
		uexcep->barrier_data.sp = sp;
		uexcep->barrier_data.data[1] = (_UINT32)*descr_ptr;

		/*-----------------------------------------------------------*/
		/* cxa_begin_catch requires matched type in 0, Sec 8.2 - it  */
		/* is called from cxa_call_unexpected.                       */
		/*-----------------------------------------------------------*/
		uexcep->barrier_data.data[0] = (_UINT32)matched;

		*reason = _URC_HANDLER_FOUND;
		reason_valid = true;
	    }
	}
    }
    /*-----------------------------------------------------------------------*/
    /* Phase 2, check for a previously saved propagation barrier             */
    /*-----------------------------------------------------------------------*/
    else 
    {
	if (sp == uexcep->barrier_data.sp && 
		(_UINT32)*descr_ptr == uexcep->barrier_data.data[1])
	{
	    /*---------------------------------------------------------------*/
	    /* Set up barrier cache with required data - Sec 8.2             */
	    /*---------------------------------------------------------------*/
	    uexcep->barrier_data.data[1] = rtti_count;
	    uexcep->barrier_data.data[2] = sb;
	    uexcep->barrier_data.data[3] = 4;
	    uexcep->barrier_data.data[4] = (_UINT32)((*descr_ptr)+1);

	    /*---------------------------------------------------------------*/
	    /* If descriptor specifies a landing pad, call landing pad else  */
	    /* call cxa_call_unexpected _after_ unwinding                    */
	    /* Sec 8.5.3 -  any permitted throw out of unexpected() must     */
	    /* behave as if unwinding resumes at the call site to the func   */
	    /* whose exception specification was violated.                   */
	    /*---------------------------------------------------------------*/
	    if (!call_unexpected)
	    {
		_UINT32 *p_lp_offset = ((*descr_ptr) + 1 + rtti_count);

		__TI_targ_regbuf_set_pc(context, __TI_prel2abs(p_lp_offset));
		__TI_targ_setup_call_parm0(context, (_UINT32)uexcep);

		*reason      = _URC_INSTALL_CONTEXT;
		reason_valid = true;
	    }
	    else
		*ph2_call_unexpected = true;
	}
    }
	

    /*-----------------------------------------------------------------------*/
    /* Skip over rtti count field, list of types & lp offset if any          */
    /*-----------------------------------------------------------------------*/
    (*descr_ptr) += (rtti_count + 1 + (call_unexpected ? 0 : 1));

    return reason_valid;
}


#endif /* __EXCEPTIONS */

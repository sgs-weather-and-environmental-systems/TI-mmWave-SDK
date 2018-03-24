/*****************************************************************************/
/*  tdeh_unwinder.cpp v8.1.3                                                 */
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
/*  Implements the unwinder functionality required by Table-Driven           */
/*  Exception Handling                                                       */
/*                                                                           */
/*****************************************************************************/
#if __EXCEPTIONS && defined(__TI_TABLE_DRIVEN_EXCEPTIONS)

#include <stdlib.h>
#include <stdint.h>
#include "tdeh_common.h"

#if defined(DEBUG_CPPABI)
#include <stdio.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#endif

extern "C" {

/*****************************************************************************/
/* EXTERNS - Unwinder Routines - external entry points                       */
/*****************************************************************************/
_Unwind_Reason_Code __TI_Unwind_RaiseException2(_Unwind_Exception *uexcep, 
					        _Unwind_Context  *ph1_context,
					        _Unwind_Context  *ph2_context);
void __TI_Unwind_Resume(_Unwind_Exception *uexcep, _Unwind_Context *context);

/*****************************************************************************/
/* EXTERNS - Comparison routine used by binary search                        */
/*****************************************************************************/
int __TI_ut_entry_cmp(const void *key, const void *entry);

/*****************************************************************************/
/* EXTERNS - ASM Routine to compute abs address from relative, vice versa    */
/*****************************************************************************/

}


/*****************************************************************************/
/* __TI_UT_BaseLimit - This struct holds the base and limit pointers for the */
/*                     Unwind Table. Initialized in file tdeh_lnksym_arm.cpp,*/
/*                     compiled using armcc - It refers to symbols           */
/*                     .ARM.exidx$$Base & .ARM.exidx$$Limit inserted by the  */
/*                     ARM Ltd linker. Update to conform to TI ELF Linker    */
/*****************************************************************************/
extern "C" const _UINT32 __TI_UNWIND_TABLE_START;
extern "C" const _UINT32 __TI_UNWIND_TABLE_END;
const _Unwind_Table __TI_UT_BaseLimit = { (_UINT32)&__TI_UNWIND_TABLE_START,
					  (_UINT32)&__TI_UNWIND_TABLE_END} ;


/*****************************************************************************/
/* STATIC helper functions                                                   */
/*****************************************************************************/
static _Unwind_Reason_Code find_et_setup_pr(_Unwind_Exception *,_UINT32);
static void __TI_unwind_frame(_Unwind_Exception *, _Unwind_Context *);

/*****************************************************************************/
/*                                                                           */
/* __TI_Unwind_RaiseException2 - This function performs Phase 1 unwinding,   */
/*	    and if successful, starts Phase 2 unwind. __cxa_throw calls      */
/*	    __TI_Unwind_RaiseException via an asm wrapper                    */
/*          _Unwind_RaiseException, that creates a Register Buffer on the    */
/*          stack, and passes a ptr to this area as the 2nd parameter        */
/*          to __TI_Unwind_RaiseException.  That function makes a copy of    */
/*          the context for Phase 1 to scribble on.  We can't make the copy  */
/*          here because _Unwind_Context is an opaque type.                  */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __TI_Unwind_RaiseException2(_Unwind_Exception *uexcep, 
                                                _Unwind_Context   *ph1_context,
                                                _Unwind_Context   *ph2_context)
{
    #ifdef DEBUG_UNWINDER
    printf("UW: In __TI_Unwind_RaiseException2, UE @ %p, ph1_context @ %p, ph2_context @ %p\n", 
           uexcep, ph1_context, ph2_context);
    #endif

    /*-----------------------------------------------------------------------*/
    /* Search for a handler                                                  */
    /*-----------------------------------------------------------------------*/
    _Unwind_Reason_Code reason_code;
    while (1)
    {
	/*-------------------------------------------------------------------*/
	/* Look up Unwind Table using PC to find the EHT, set up PR to call  */
	/*-------------------------------------------------------------------*/
	if (find_et_setup_pr(uexcep, __TI_targ_regbuf_get_pc(ph1_context)) != 
		_URC_SUCCESS)
        {
            #ifdef DEBUG_UNWINDER
            printf("UW: find_et_setup_pr() != _URC_SUCCESS\n");
            #endif

	    return _URC_FATAL_PHASE1_ERROR;
        }

	/*-------------------------------------------------------------------*/
	/* Call PR with phase set to Phase1                                  */
	/*-------------------------------------------------------------------*/
        #pragma diag_suppress 1107
	reason_code = ((_PR_TYPE)(uexcep->unwinder_data.pr_addr))(_UP_Phase1, 
								  uexcep, 
								  ph1_context);
        #pragma diag_default 1107

        #ifdef DEBUG_UNWINDER
        printf("UW: PR returned to __TI_Unwind_RaiseException\n");
        #endif

	if (reason_code != _URC_CONTINUE_UNWIND)  break;
    }

    #ifdef DEBUG_UNWINDER
    printf("UW: Unwind phase 1 finished\n");
    #endif

    /*-----------------------------------------------------------------------*/
    /* At this point, we should have found a handler for the exception       */
    /*-----------------------------------------------------------------------*/
    if (reason_code != _URC_HANDLER_FOUND) return _URC_FATAL_PHASE1_ERROR;

    /*-----------------------------------------------------------------------*/
    /* Start phase 2 unwinding                                               */
    /*-----------------------------------------------------------------------*/
    __TI_unwind_frame(uexcep, ph2_context);

    /*-----------------------------------------------------------------------*/
    /* Should not get here, if we do, indicate failure                       */
    /*-----------------------------------------------------------------------*/
    return _URC_FATAL_PHASE2_ERROR;
}


/*****************************************************************************/
/*                                                                           */
/* find_et_setup_pr - Use the PC to search the Unwind Table for the entry    */
/*                    corresponding to the function that contains PC. The    */
/*                    Unwind Table entry contains the function offset and    */
/*                    a pointer to the EHT for the function or the EHT itself*/
/*                    Use the EHT to compute the PR used to process the EHT  */
/*                                                                           */
/*****************************************************************************/
static _Unwind_Reason_Code find_et_setup_pr(_Unwind_Exception *uexcep, 
					    _UINT32 pc)
{

    #pragma diag_suppress 1107
    const _Unwind_Table_Entry *ut_base  = 
        (_Unwind_Table_Entry *)(uintptr_t)__TI_UT_BaseLimit.UT_base;
    const _Unwind_Table_Entry *ut_limit = 
        (_Unwind_Table_Entry *)(uintptr_t)__TI_UT_BaseLimit.UT_limit;
    #pragma diag_default 1107

    size_t num_entries = ut_limit - ut_base;

    uexcep->unwinder_data.pr_addr = NULL;
    
    /*-----------------------------------------------------------------------*/
    /* Search for matching Unwind Table entry using pc                       */
    /*-----------------------------------------------------------------------*/
    _Unwind_Table_Entry *match_entry =
	(_Unwind_Table_Entry *)bsearch((void *)&pc, (void *)ut_base, 
				       num_entries, sizeof(_Unwind_Table_Entry),
				       __TI_ut_entry_cmp);

    if (match_entry == NULL)
    {
        #ifdef DEBUG_UNWINDER
        printf("UW: bsearch did not find PC %"PRIx32" in EXIDX\n", pc);
        #endif /* DEBUG_UNWINDER */

        return _URC_FAILURE; 
    }

    #ifdef DEBUG_UNWINDER
    printf("UW: PC=%"PRIx32" -> UTEntry @ %p, "
           "Func %"PRIxMAX", Off %"PRIx32"\n",
           pc, match_entry, (uintmax_t)__TI_prel2abs(&match_entry->fn_offset), 
           match_entry->et_offset);
    #endif /* DEBUG_UNWINDER */

    /*-----------------------------------------------------------------------*/
    /* If entry indicates cant unwind, return failure                        */
    /*-----------------------------------------------------------------------*/
    if (match_entry->et_offset == UT_CANT_UNWIND) return _URC_FAILURE;

    /*-----------------------------------------------------------------------*/
    /* Store function start address (absolute)                               */
    /*-----------------------------------------------------------------------*/
    uexcep->pr_data.func_start = __TI_prel2abs(&match_entry->fn_offset);

    /*-----------------------------------------------------------------------*/
    /* Set up EHT related info in the UE. If et_offset MSB==1, EHT inlined   */
    /*-----------------------------------------------------------------------*/
    if ((match_entry->et_offset & 0x80000000) != 0)
    {
        #ifdef DEBUG_UNWINDER
        printf("UW: Inlined EHT\n");
        #endif /* DEBUG_UNWINDER */

	uexcep->pr_data.eht_start = (_UINT32 *)&match_entry->et_offset;
	uexcep->pr_data.additional = 1;
    }
    else
    {
        #pragma diag_suppress 1107
	uexcep->pr_data.eht_start = 
            (_UINT32 *)(uintptr_t)__TI_prel2abs(&match_entry->et_offset);
	uexcep->pr_data.additional = 0;
        #pragma diag_default 1107

        #ifdef DEBUG_UNWINDER
        printf("UW: Non-inlined EHT at %p\n", uexcep->pr_data.eht_start);
        #endif /* DEBUG_UNWINDER */
    }

    /*-----------------------------------------------------------------------*/
    /* Compute PR to call from the EHT entry, update UE with this PR         */
    /*-----------------------------------------------------------------------*/
    if (!__TI_targ_set_pr(uexcep)) return _URC_FAILURE;

    #ifdef DEBUG_UNWINDER
    printf("UW: FAddr %"PRIx32", EAddr %p, I? %d, PAddr %"PRIx32"\n",
           uexcep->pr_data.func_start, uexcep->pr_data.eht_start,
           (int)uexcep->pr_data.additional, uexcep->unwinder_data.pr_addr);
    #endif /* DEBUG_UNWINDER */

    return _URC_SUCCESS;
}


/*****************************************************************************/
/*                                                                           */
/* __TU_ut_entry_cmp - Comparator for bsearch, to search for matching        */
/*                     Unwind Table entry using PC offset                    */
/*                                                                           */
/*****************************************************************************/
int __TI_ut_entry_cmp(const void *key, const void *entry)
{ 
    #pragma diag_suppress 1107
    const _Unwind_Table_Entry *ut_limit = 
        (_Unwind_Table_Entry *)(uintptr_t)__TI_UT_BaseLimit.UT_limit;
    #pragma diag_default 1107

    const _Unwind_Table_Entry *ut_entry      = (_Unwind_Table_Entry *)entry; 
    const _Unwind_Table_Entry *ut_next_entry = ut_entry + 1; 

    _UINT32 pc_abs = *(_UINT32 *)key; 

    /*-----------------------------------------------------------------------*/
    /* Only function start offsets are stored in the entries. For the last   */
    /* entry in the table, there is no "end" address for the function. Any   */
    /* PC value greater that the func start address will match the entry for */
    /* that function                                                         */
    /*-----------------------------------------------------------------------*/
    _UINT32 next_func_abs = 
	(ut_next_entry != ut_limit) ? 
        __TI_prel2abs(&ut_next_entry->fn_offset) : 0xffffffff;

    _UINT32 this_addr = __TI_prel2abs(&ut_entry->fn_offset);

    #ifdef DEBUG_BSEARCH
    printf("UW/BS: PC=%"PRIx32" entry=%p, "
           "this_addr=%"PRIx32" next_addr=%"PRIx32"\n", 
           pc_abs, entry, this_addr, next_func_abs);
    #endif /* DEBUG_BSEARCH */

    if      (pc_abs < this_addr) return -1; 
    else if (pc_abs >= next_func_abs)                     return  1; 
    else                                                  return  0;
}


/*****************************************************************************/
/*                                                                           */
/* __TI_unwind_frame - Used to start a Phase 2 unwind - will unwind frames   */
/*                     until a frame with a cleaup/catch handler is found,   */
/*                     and then copies the Register Buffer registers into    */
/*                     machine regs, resulting in a call to the handler      */
/*                                                                           */
/*****************************************************************************/
static void __TI_unwind_frame(_Unwind_Exception *uexcep, 
			      _Unwind_Context   *context)
{
    _Unwind_Reason_Code reason_code;

    /*-----------------------------------------------------------------------*/
    /* Start Phase 2 unwinding, will unwind frames till we find a handler    */
    /* that needs to be run.                                                 */
    /*-----------------------------------------------------------------------*/
    while (1)
    {
	/*-------------------------------------------------------------------*/
	/* Look up Unwind Table using PC to find the EHT, set up PR to call  */
	/*-------------------------------------------------------------------*/
	_UINT32 v_pc = __TI_targ_regbuf_get_pc(context);
	if (find_et_setup_pr(uexcep, v_pc) != _URC_SUCCESS) abort();

	/*-------------------------------------------------------------------*/
	/* Save regbuf PC, it will be overwritten by PR                      */
	/*-------------------------------------------------------------------*/
	uexcep->unwinder_data.saved_callsite_addr = v_pc;

        #ifdef DEBUG_UNWINDER
        printf("UW: saved PC: %"PRIx32"\n", v_pc);
        #endif

	/*-------------------------------------------------------------------*/
	/* Call PR with phase set to Phase2 Start                            */
	/*-------------------------------------------------------------------*/
        #pragma diag_suppress 1107
	reason_code =
	    ((_PR_TYPE)(uexcep->unwinder_data.pr_addr))(_UP_Phase2_Start, 
							uexcep, 
							context);
        #pragma diag_default 1107

        #ifdef DEBUG_UNWINDER
        printf("UW: PR returned to __TI_unwind_frame\n");
        #endif

	if (reason_code != _URC_CONTINUE_UNWIND)  break;
    }

    if (reason_code != _URC_INSTALL_CONTEXT) abort();

    /*-----------------------------------------------------------------------*/
    /* Copy register buffer regs into machine regs, results in call to       */
    /* handler set up by the PR                                              */
    /*-----------------------------------------------------------------------*/
    __TI_targ_regbuf_install(context);
}


/*****************************************************************************/
/*                                                                           */
/* __TI_Unwind_Resume - Used to resume processing a frame after a cleanup    */
/*                      handler has been run. Called from _Unwind_Resume     */
/*                                                                           */
/*****************************************************************************/
void __TI_Unwind_Resume(_Unwind_Exception *uexcep, _Unwind_Context *context)
{
    #ifdef DEBUG_UNWINDER
    printf("UW: __TI_Unwind_Resume\n");
    #endif

    /*-----------------------------------------------------------------------*/
    /* Resuming after running a cleanup, restore PC from saved area in UE    */
    /*-----------------------------------------------------------------------*/
    __TI_targ_regbuf_set_pc(context, 
			    uexcep->unwinder_data.saved_callsite_addr);

    #ifdef DEBUG_UNWINDER
    printf("UW: restored PC: %"PRIx32"\n", 
           uexcep->unwinder_data.saved_callsite_addr);
    #endif

    /*-----------------------------------------------------------------------*/
    /* Call PR with phase set to Phase2 Resume (PR set up by Phase 2 Start)  */
    /*-----------------------------------------------------------------------*/
    #pragma diag_suppress 1107
    _Unwind_Reason_Code reason_code =
	((_PR_TYPE)(uexcep->unwinder_data.pr_addr))(_UP_Phase2_Resume, 
						    uexcep, 
						    context);
    #pragma diag_default 1107

    #ifdef DEBUG_UNWINDER
    printf("UW: PR returned to __TI_Unwind_Resume\n");
    #endif

    /*-----------------------------------------------------------------------*/
    /* If PR returns CONTINUE, call __TI_unwind_frame to unwind next frame   */
    /* If PR returns INSTALL, copy register buffer regs to machine regs      */
    /*-----------------------------------------------------------------------*/
    if (reason_code == _URC_CONTINUE_UNWIND) 
	__TI_unwind_frame(uexcep, context); /* Process next frame */
    else if (reason_code == _URC_INSTALL_CONTEXT)
	__TI_targ_regbuf_install(context);
    else
	abort();

}

/*****************************************************************************/
/*                                                                           */
/* __TI_prel2abs - Translate prel31 relative address into an absolute        */
/*                 address.                                                  */
/*                                                                           */
/* General:        PREL31 is a "place relative" offset.  The offset encoded  */
/*                 is a signed delta offset from the address where the       */
/*                 offset is encoded.  Thus, the relocation is S + A - P.    */
/*                                                                           */
/*                 In the basic form, the offset of the PREL31 is a 32-bit   */
/*                 value shifted right one bit to fit in 31 bits to reserve  */
/*                 the upper bit for a flag which serves differnent purposes */
/*                 for different contexts.  The basic form requires that the */
/*                 shifted-out bit is always 0.                              */
/*                                                                           */
/* C6000/MSP:      Follows the basic form.  Uses only unsigned arithmetic    */
/*                 because modulo math for unsigned rules will handle        */
/*                 negative offsets correctly through wraparound.            */
/*                                                                           */
/* ARM:            Encodes the ARM/Thumb state in the low bit of pointers,   */
/*                 so the range of the offset is reduced.  We do the         */
/*                 shifting differently to clear the MSB.  The operation for */
/*                 R_ARM_PREL31 is ((S + A) | T) - P), so we can get the     */
/*                 absolute address from                                     */
/*                 ((offset << 1) >> 1) + addr_of(offset)                    */
/*                                                                           */
/*****************************************************************************/
#include <assert.h>
_UINT32 __TI_prel2abs(const _UINT32 *p_offset)
{
   return ((_UINT32)*p_offset << 1) + (_UINT32)p_offset;
}

#endif /* __EXCEPTIONS */

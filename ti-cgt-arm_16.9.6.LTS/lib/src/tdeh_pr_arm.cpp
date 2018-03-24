/*****************************************************************************/
/*  tdeh_pr_arm.cpp v16.9.6                                                  */
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
/*  Contains the target-dependent routines of the Personality Routine (PR)   */
/*  implementation (PR entry points pr0, pr1 & pr2, unwind processing)       */
/*  required by Table-Driven Exception Handling                              */
/*                                                                           */
/*****************************************************************************/
#if __EXCEPTIONS && defined(__TI_TABLE_DRIVEN_EXCEPTIONS)

#include <stdlib.h>
#include "tdeh_common.h"
#include "tdeh_arm.h"

#ifdef __cplusplus
extern "C" {
#endif

/*****************************************************************************/
/* EXTERNS - C++ EH Compiler Helper Functions                                */
/*****************************************************************************/
void __cxa_call_unexpected(_Unwind_Exception *);

/*****************************************************************************/
/* EXTERNS - ASM Routine to copy register buffer regs into machine regs      */
/*****************************************************************************/
void  __TI_Install_CoreRegs(void *core_regs);

_Unwind_Reason_Code __TI_Unwind_RaiseException(_Unwind_Exception *uexcep, 
                                               _Unwind_Context  *ph2_context);

_Unwind_Reason_Code __TI_Unwind_RaiseException2(_Unwind_Exception *uexcep, 
                                                _Unwind_Context  *ph1_context,
                                                _Unwind_Context  *ph2_context);

/*****************************************************************************/
/* EXTERNS - ASM routines to move VFP D registers to and from memory.        */
/*****************************************************************************/
#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
void __TI_preserve_low_VFP(void *vvfp);
void __TI_restore_low_VFP(void *vvfp);
#endif
#if __TI_VFPV3_SUPPORT__ || __TI_NEON_SUPPORT__
void __TI_preserve_high_VFP(void *vvfp);
void __TI_restore_high_VFP(void *vvfp);
#endif

/*****************************************************************************/
/* EXTERNS - printf, used only by debug                                      */
/*****************************************************************************/
#if defined(DEBUG_PR) || defined(DEBUG_UW_INSTRS)
int printf(const char *, ...);
#endif

void *memcpy(void *s1, const void *s2, size_t n);

#ifdef __cplusplus
}
#endif


/*****************************************************************************/
/* Functions used to access the Register Buffer                              */
/*****************************************************************************/
typedef enum { _URB_Failure=0, _URB_Success } _URB_Status;
static _URB_Status regb_core_get(_Unwind_Context *, _Unwind_Reg_Id, _UINT32 *);
static _URB_Status regb_core_set(_Unwind_Context *, _Unwind_Reg_Id, _UINT32);
static _URB_Status regb_core_pop(_Unwind_Context *, _UINT32);

#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
static _URB_Status regb_Dreg_pop(_Unwind_Context *context, _UINT32 start, 
				 _UINT32 count, bool vfpx);
#endif
/*****************************************************************************/
/* Unwind Instr Handle  - Used to keep track of unwind instructions when a   */
/*                        frame is unwound. The function next_uw_byte uses   */
/*                        this struct to return the next unwind instr byte   */
/*****************************************************************************/
typedef struct
{
    _UINT32 *curr_pos;
    _UINT32  curr_word;

    _UINT32  words_remaining;
    _UINT32  bytes_remaining;
} _Unwind_Instr_Handle;

       static _UINT8  next_uw_byte(_Unwind_Instr_Handle *);
INLINE static _UINT32 read_uleb128(_Unwind_Instr_Handle *);


/*****************************************************************************/
/* Personality Routine  - main entry                                         */
/*****************************************************************************/
static _Unwind_Reason_Code __TI_unwind_cpp_pr(_Unwind_Phase      phase,
					      _Unwind_Exception *uexcep,
					      _Unwind_Context   *context,
					      _Unwind_PR_Kind    pr_kind);


extern bool __TI_process_descriptors(_Unwind_Phase        phase,
				_Unwind_Exception   *uexcep,
				_Unwind_Context     *context,
				_Unwind_PR_Kind      pr_kind,
				_UINT32             *descr_ptr,
				_Unwind_Reason_Code *reason,
				bool                *ph2_call_unexpected);


INLINE static _Unwind_Reason_Code process_unwind(_Unwind_Context *context, 
						 _Unwind_PR_Kind pr_kind, 
						 _UINT32 *estart_addr,
						 bool *pc_updated_from_lr);


/*****************************************************************************/
/*                                                                           */
/* __aeabi_unwind_cpp_pr0 - PR handling short frame unwinding, 16-bit scope  */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __aeabi_unwind_cpp_pr0 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Su16);
}


/*****************************************************************************/
/*                                                                           */
/* __aeabi_unwind_cpp_pr1 - PR handling long frame unwinding, 16-bit scope   */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __aeabi_unwind_cpp_pr1 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Lu16);
}


/*****************************************************************************/
/*                                                                           */
/* __aeabi_unwind_cpp_pr2 - PR handling long frame unwinding, 32-bit scope   */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __aeabi_unwind_cpp_pr2 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Lu32);
}


/*****************************************************************************/
/*                                                                           */
/* __TI_unwind_cpp_pr - Implements pr0, pr1 and pr2.                         */
/*                      The personality routine for a frame is used by the   */
/*                      language-independent unwinder to:                    */
/*                      (1) Detect whether a barrier to exception propagation*/
/*                          exists in a given frame - Phase 1                */
/*                      (2) Set up internal state to perform the actual      */
/*                          unwinding i.e set up registers to invoke         */
/*                          cleanup/catch handlers for the frame, remove the */
/*                          frame from the stack using unwind instructions - */
/*                          Phase 2                                          */
/*                                                                           */
/*****************************************************************************/
static _Unwind_Reason_Code __TI_unwind_cpp_pr(_Unwind_Phase      phase,
					      _Unwind_Exception *uexcep,
					      _Unwind_Context   *context,
					      _Unwind_PR_Kind    pr_kind)
{
    _UINT32 *estart_addr;
    _UINT32 *descr_ptr;

    bool ph2_call_unexpected = false;
    bool pc_updated_from_lr  = false;


    /*-----------------------------------------------------------------------*/
    /* If the phase or pr_kind is not supported, return failure              */
    /*-----------------------------------------------------------------------*/
    if (phase != _UP_Phase1 && phase != _UP_Phase2_Start && 
	phase != _UP_Phase2_Resume)
	return _URC_FAILURE;
    if (pr_kind != _UPK_Su16 && pr_kind != _UPK_Lu16 && pr_kind != _UPK_Lu32)
	return _URC_FAILURE;

    estart_addr = uexcep->pr_data.eht_start;

    #ifdef DEBUG_PR
    printf("PR:14 I %d, Phase %d, Fn Start %8.8x, EHT Start %8.8x\n", 
	    pr_kind, phase, uexcep->pr_data.func_start, estart_addr);
    #endif /* DEBUG_PR */


    /*-----------------------------------------------------------------------*/
    /* Process descriptors if the EHT is not an inline EHT - inline EHTs do  */
    /* not have descriptors, only unwind instructions. Bit 0 of the          */
    /* additional field in pr_data is set to 1 if the EHT is inline          */
    /*-----------------------------------------------------------------------*/
    if ((uexcep->pr_data.additional & 1) != 1)
    {

	/*-------------------------------------------------------------------*/
	/* Compute address to start processing descriptors from, this depends*/
	/* on the phase: Phase1, Phase2 start, compute from start of EHT     */
	/* Phase2 resume, restore saved value                                */
	/*-------------------------------------------------------------------*/
	if (phase == _UP_Phase1 || phase == _UP_Phase2_Start)
	{
	    _UINT8 additional_words = 0;

	    /*---------------------------------------------------------------*/
	    /* If long unwind format, compute additional words to skip over  */
	    /*---------------------------------------------------------------*/
	    if (pr_kind == _UPK_Lu16 || pr_kind == _UPK_Lu32)
		additional_words = (*estart_addr & 0x00ff0000) >> 16;

	    descr_ptr = estart_addr + 1 + additional_words;
	}
	else
	    descr_ptr = (_UINT32*)uexcep->cleanup_data.cleanup_ehtp;

	_Unwind_Reason_Code reason;
	if (__TI_process_descriptors(phase, uexcep, context, pr_kind, descr_ptr,
				     &reason, &ph2_call_unexpected))
	    return reason;
    }

    /*-----------------------------------------------------------------------*/
    /* Process unwind instructions                                           */
    /*-----------------------------------------------------------------------*/
    if (process_unwind(context, pr_kind, estart_addr,
		       &pc_updated_from_lr) == _URC_FAILURE)
	return _URC_FAILURE;

    /*-----------------------------------------------------------------------*/
    /* If fespec forms a propagation barrier, and __cxa_call_unexpected has  */
    /* to be called, perform setup required                                  */
    /*-----------------------------------------------------------------------*/
    if (ph2_call_unexpected)
    {
	#ifdef DEBUG_PR
	printf("PR: Phase 2 Fespec barrier, calling __cxa_call_unexpected\n"); 
	#endif /* DEBUG_PR */
	/*-------------------------------------------------------------------*/
	/* If the PC has been updated directly by an unwind instruction,     */
	/* copy this PC value into LR to set up the return address for the   */
	/* call to __cxa_call_unexpected. From Section 8.5.3, any permitted  */
	/* throw out of unexpected() must behave as if unwinding resumes at  */
	/* the call site to the func whose exception spec was violated.      */
	/*-------------------------------------------------------------------*/
	if (!pc_updated_from_lr)
	{
	    _UINT32 pc;
	    regb_core_get(context, _UR_PC, &pc);
	    regb_core_set(context, _UR_LR, pc);
	}

	/*-------------------------------------------------------------------*/
	/* Set R0, PC to call __cxa_call_unexpected                          */
	/*-------------------------------------------------------------------*/
	regb_core_set(context, _UR_PC, (_UINT32)&__cxa_call_unexpected);
	regb_core_set(context, _UR_R0, (_UINT32)uexcep);

	return _URC_INSTALL_CONTEXT;
    }

    /*-----------------------------------------------------------------------*/
    /* If we get here, ask the unwinder to process the next frame            */
    /*-----------------------------------------------------------------------*/
    return _URC_CONTINUE_UNWIND;
}


/*****************************************************************************/
/*                                                                           */
/* process_unwind - Performs virtual unwind for this frame by processing     */
/*                  unwind instructions in the EHT.                          */
/*                                                                           */
/*****************************************************************************/
INLINE static _Unwind_Reason_Code process_unwind(_Unwind_Context *context, 
						 _Unwind_PR_Kind  pr_kind, 
						 _UINT32         *estart_addr,
						 bool *pc_updated_from_lr)
{
    _Unwind_Instr_Handle uh;

    bool  pc_updated;
    _UINT8 uw_byte;
    _UINT8 uw_next_byte;

    pc_updated          = false;
    *pc_updated_from_lr = false;

    /*-----------------------------------------------------------------------*/
    /* Set up unwinder instruction handle based on PR kind. For long variants*/
    /* bits 16-23 contain a count of the number of additional 4-byte words   */
    /*-----------------------------------------------------------------------*/
    uh.curr_pos = estart_addr;
    if (pr_kind == _UPK_Su16)
    {
	uh.words_remaining = 0;
	uh.bytes_remaining = 3;
	uh.curr_word       = *estart_addr << 8;
    }
    else
    {
	uh.words_remaining = (*estart_addr & 0x00ff0000) >> 16;
	uh.bytes_remaining = 2;
	uh.curr_word       = *estart_addr << 16;
    }

    /*-----------------------------------------------------------------------*/
    /* Process unwind instructions                                           */
    /*-----------------------------------------------------------------------*/
    while (1)
    {
	_UINT32 rval;
	_UINT32 reg_mask;

	uw_byte = next_uw_byte(&uh);

	/*-------------------------------------------------------------------*/
	/* 10110000 -> Finish                                                */
	/*-------------------------------------------------------------------*/
	if (uw_byte == UWINS_FINISH)
	{
	    /*---------------------------------------------------------------*/
	    /* Copy LR to PC iff PC has not been updated during unwinding    */
	    /*---------------------------------------------------------------*/
	    if (!pc_updated)
	    {
		regb_core_get(context, _UR_LR, &rval);
		regb_core_set(context, _UR_PC, rval);
		*pc_updated_from_lr = true;
	    }
	    #ifdef DEBUG_UW_INSTRS
	    printf("FINISH");
	    if (*pc_updated_from_lr) 
		printf(", copied LR=0x%8.8x to PC\n", rval);
	    else
		printf("\n");
	    #endif /* DEBUG_UW_INSTRS */
	    break;
	}

	/*-------------------------------------------------------------------*/
	/* 00xxxxxx -> vsp = vsp + (xxxxxx << 2) + 4 [0x04-0x100]            */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0x3f)
	{
	    #ifdef DEBUG_UW_INSTRS
	    printf("vsp = vsp + (%d << 2) + 4, (%d)\n", uw_byte & 0x3f,
		    ((uw_byte & 0x3f) << 2) + 4);
	    #endif /* DEBUG_UW_INSTRS */
	    regb_core_get(context, _UR_SP, &rval);
	    regb_core_set(context, _UR_SP, rval + ((uw_byte & 0x3f) << 2) + 4);
	    continue;
	}
	
	/*-------------------------------------------------------------------*/
	/* 00xxxxxx -> vsp = vsp - (xxxxxx << 2) + 4 [0x04-0x100]            */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0x7f)
	{
	    #ifdef DEBUG_UW_INSTRS
	    printf("vsp = vsp - (%d << 2) + 4\n", uw_byte & 0x3f);
	    #endif /* DEBUG_UW_INSTRS */
	    regb_core_get(context, _UR_SP, &rval);
	    regb_core_set(context, _UR_SP, rval-(((uw_byte & 0x3f) << 2) + 4));
	    continue;
	}

	if (uw_byte <= 0x8f)
	{
	    uw_next_byte = next_uw_byte(&uh);

	    /*---------------------------------------------------------------*/
	    /* 10000000 00000000 -> Cant Unwind                              */
	    /* 1000iiii iiiiiiii -> Pop upto 12 regs {r15-r12}, {r11-r4}     */
	    /*---------------------------------------------------------------*/
	    if (uw_byte == 0x80 && uw_next_byte == 0x00)
	    {
		#ifdef DEBUG_UW_INSTRS
		printf("CANT UNWIND\n");
		#endif /* DEBUG_UW_INSTRS */
		return _URC_FAILURE;
	    }
	    else
	    {
		reg_mask = (uw_byte & 0xf) << 12;   /* R0 at bit 0 */
		reg_mask |= (uw_next_byte << 4);
		#ifdef DEBUG_UW_INSTRS
		printf("pop %lx\n", reg_mask);
		#endif /* DEBUG_UW_INSTRS */
		regb_core_pop(context, reg_mask);
		if (reg_mask & (1 << _UR_PC)) pc_updated = true;
	    }
	    continue;
	}

	/*-------------------------------------------------------------------*/
	/* 1001nnnn, nnnn != 13, 15 -> vsp = r[nnnn]                         */
	/* 10011101 -> Reserved (prefix for ARM reg to reg moves)            */
	/* 10011111 -> Reserved (prefix for Wireless MMX reg to reg moves)   */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0x9f)
	{
	    _UINT8 reg = uw_byte & 0xf;
	    if (uw_byte == 0x9d || uw_byte == 0x9f)
	    {
		#ifdef DEBUG_UW_INSTRS
		printf("Reserved Instruction [%8.8x]\n", uw_byte);
		#endif /* DEBUG_UW_INSTRS */
		return _URC_FAILURE;
	    }
	    if (reg == _UR_LR || reg == _UR_PC)
	    {
		#ifdef DEBUG_UW_INSTRS
		printf("Error, R13/R15 cannot be used [%8.8x]\n", uw_byte);
		#endif /* DEBUG_UW_INSTRS */
		return _URC_FAILURE;
	    }
	    else
	    {
		#ifdef DEBUG_UW_INSTRS
		printf("vsp = r[%d]\n", reg);
		#endif /* DEBUG_UW_INSTRS */
		regb_core_get(context, (_Unwind_Reg_Id)reg, &rval);
		regb_core_set(context, _UR_SP, rval);
	    }
	    continue;
	}

	/*-------------------------------------------------------------------*/
	/* 10100nnn -> Pop r4-r[4+nnn]                                       */
	/* 10101nnn -> Pop r4-r[4+nnn], r14                                  */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0xaf)
	{
	    _UINT8 reg_range = uw_byte & 0x7;
	    _UINT8 idx;

	    reg_mask = 0;
	    if ((uw_byte & 0x8)) 
	    {
		reg_mask |= (1 << _UR_LR);
	    }
	    for (idx = 0; idx <= reg_range; idx++)
		reg_mask |= (1 << (_UR_R4 + idx));

	    regb_core_pop(context, reg_mask);

	    #ifdef DEBUG_UW_INSTRS
	    if ((uw_byte & 0x8) == 0)
		printf("pop r4-[4+%d] (%8.8x)\n", reg_range, reg_mask);
	    else
		printf("pop r4-[4+%d], r14 (%8.8x)\n", reg_range, reg_mask);
	    #endif /* DEBUG_UW_INSTRS */
	    continue;
	}

	if (uw_byte <= 0xb7)
	{
	    /*---------------------------------------------------------------*/
	    /* 10110000 -> Finish (already handled)                          */
	    /* 10110001 00000000 -> Spare                                    */
	    /* 10110001 0000iiii (i not all 0) -> Pop {r3, r2, r1, r0}       */
	    /* 10110001 xxxxyyyy (xxxx != 0000) -> Spare                     */
	    /* 10110010  uleb128 -> vsp = vsp + 0x204 + (uleb128 << 2)       */
	    /* 10110011 SsssCccc -> Pop VFP				     */
	    /*---------------------------------------------------------------*/
	    if (uw_byte == 0xb1)
	    {
		uw_next_byte = next_uw_byte(&uh);
		reg_mask = uw_next_byte & 0xf;
		if (reg_mask == 0 || reg_mask > 0xf)
		{
		    #ifdef DEBUG_UW_INSTRS
		    printf("Incorrect instruction [%8.8x, %8.8x]\n", 
			    uw_byte, uw_next_byte);
		    #endif /* DEBUG_UW_INSTRS */
		    return _URC_FAILURE;
		}
		else
		{
		    regb_core_pop(context, reg_mask);
		    #ifdef DEBUG_UW_INSTRS
		    printf("pop %lx\n", reg_mask);
		    #endif /* DEBUG_UW_INSTRS */
		}
	    }
	    else if (uw_byte == 0xb2)
	    {
		_UINT32 uval = read_uleb128(&uh);
		regb_core_get(context, _UR_SP, &rval);
		regb_core_set(context, _UR_SP, rval + (uval << 2) + 0x204);

		#ifdef DEBUG_UW_INSTRS
		printf("vsp = vsp + 0x204 + (%ld << 2), (%ld)\n", uval,
			(uval << 2) + 0x204);
		#endif /* DEBUG_UW_INSTRS */
	    }

            /*---------------------------------------------------------------*/
            /* 10110011 SsssCccc -> Pop VFP. start from Ssss and pop Cccc    */
            /* double regs.  Assumes registers were stored with FSTMFDX.     */
            /*---------------------------------------------------------------*/
	    else if (uw_byte == 0xb3)
	    {
	        uw_next_byte = next_uw_byte(&uh);
#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
		int start = (uw_next_byte & 0xF0) >> 4;
		int count = (uw_next_byte & 0xF) + 1;
                #ifdef DEBUG_UW_INSTRS
		printf("VFPX Dreg pop: D%d-D%d\n", start, start+count-1);
                #endif /* DEBUG_UW_INSTRS */
		regb_Dreg_pop(context, start, count, true);
#else
		#ifdef DEBUG_UW_INSTRS
 		printf("VFP Not Supported: VFPX Dreg pop [%8.8x]\n", uw_byte);
		#endif /* DEBUG_UW_INSTRS */
		return _URC_FAILURE;
#endif
	    }
	    continue;
	}

        /*-------------------------------------------------------------------*/
        /* 101101nn -> Pop FPA (we should not be generating these)	     */
        /*-------------------------------------------------------------------*/
	if (uw_byte <= 0xb8)
	{
	    #ifdef DEBUG_UW_INSTRS
	    printf("VFP Not Supported: Pop FPA/VFP [%8.8x]\n", uw_byte);
	    #endif /* DEBUG_UW_INSTRS */
	    return _URC_FAILURE;
	}

        /*-------------------------------------------------------------------*/
        /* 10111nnn -> Pop VFP double precision registers, starting from D8  */
	/* Assume registers were stored with FSTMFDX.                        */
        /*-------------------------------------------------------------------*/
	if (uw_byte <= 0xbf)
	{
#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
	    int count = (uw_byte & 0x7) + 1;
            #ifdef DEBUG_UW_INSTRS
	    printf("VFPX Dreg pop: D8-D[8+%d]\n", count-1);
            #endif /* DEBUG_UW_INSTRS */
	    regb_Dreg_pop(context, 8, count, true);
	    continue;
#else
	    #ifdef DEBUG_UW_INSTRS
	    printf("VFP Not Supported: VFPX Dreg pop from D8 [%8.8x]\n", 
		   uw_byte);
	    #endif /* DEBUG_UW_INSTRS */
	    return _URC_FAILURE;
#endif
	}

	if (uw_byte <= 0xc7)
	{
	    /*---------------------------------------------------------------*/
	    /* 11000nnn (nnn != 6,7) -> Wireless MMX Pop (should not gen)    */
	    /* 11000110 sssscccc -> Intel Wireless MMX Pop (should not gen)  */
	    /* 11000111 00000000 -> Spare                                    */
	    /* 11000111 0000iiii -> Intel Wireless MMX Pop (should not gen)  */
	    /* 11000111 xxxxyyyy (xxxx != 0000) -> Spare                     */
	    /*---------------------------------------------------------------*/
	    if (uw_byte == 0xc7 || uw_byte == 0xc6)
	    {
		uw_next_byte = next_uw_byte(&uh);
		#ifdef DEBUG_UW_INSTRS
		printf("Instr not supported [%8.8x, %8.8x]\n", 
			uw_byte, uw_next_byte);
		#endif /* DEBUG_UW_INSTRS */
	    }
	    else
	    {
		#ifdef DEBUG_UW_INSTRS
		printf("Instr not supported [%8.8x]\n", uw_byte);
		#endif /* DEBUG_UW_INSTRS */
	    }
	    return _URC_FAILURE;
	}

	/*-------------------------------------------------------------------*/
	/* 11001000 sssscccc -> Pop high VFP registers.                      */
	/* 11001001 sssscccc -> Pop low VFP registers.                       */
	/*-------------------------------------------------------------------*/
	if (uw_byte == 0xc8 || uw_byte == 0xc9)
	{
	   uw_next_byte = next_uw_byte(&uh);
#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
	   int start = ((uw_next_byte & 0xF0) >> 4) + 
	      ((uw_byte & 0x1) ? 0 : 16);
	   int count = (uw_next_byte & 0xF) + 1;
           #ifdef DEBUG_UW_INSTRS
	   printf("VFP Dreg pop: D%d-D%d\n", start, start + count - 1);
           #endif /* DEBUG_UW_INSTRS */
	   regb_Dreg_pop(context, start, count, false);
	   continue;
#else
	   #ifdef DEBUG_UW_INSTRS
	   printf("VFP not supported: VFP Dreg pop [%8.8x]\n",uw_byte); 
	   #endif /* DEBUG_UW_INSTRS */
	   return _URC_FAILURE;
#endif
	}

	/*-------------------------------------------------------------------*/
	/* 11001yyy -> Spare                                                 */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0xcf)
	{
	   #ifdef DEBUG_UW_INSTRS
	   printf("Instr not supported [%8.8x]\n", uw_byte);
	   #endif /* DEBUG_UW_INSTRS */
	   return _URC_FAILURE;
	}

	/*-------------------------------------------------------------------*/
	/* 11010nnn -> Pop VFP double registers starting from D8.            */
	/*-------------------------------------------------------------------*/
	if (uw_byte <= 0xd7)
	{
#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
	   int count = (uw_byte & 0x7) + 1;
           #ifdef DEBUG_UW_INSTRS
	   printf("VFP Dreg pop: D8-D[8+%d]\n", count-1);
           #endif /* DEBUG_UW_INSTRS */
	   regb_Dreg_pop(context, 8, count, false);
	   continue;
#else
           #ifdef DEBUG_UW_INSTRS
	   printf("VFP Not Supported: VFP Dreg pop from D8 [%8.8x]\n", 
		  uw_byte);
           #endif /* DEBUG_UW_INSTRS */
	   return _URC_FAILURE;
#endif	   
	}
	
	/*-------------------------------------------------------------------*/
	/* If we get here, the instruction is spare/invalid                  */
	/* 11xxxyyy (xxx != 000, 001, 010) -> Spare                          */
	/*-------------------------------------------------------------------*/
	#ifdef DEBUG_UW_INSTRS
	printf("Instr not supported [%8.8x]\n", uw_byte);
	#endif /* DEBUG_UW_INSTRS */
	return _URC_FAILURE;
    }

    return _URC_CONTINUE_UNWIND;
}


/*****************************************************************************/
/*                                                                           */
/* next_uw_byte - Returns the next unwind instruction, returns FINISH (0xb0) */
/*                if there are 0 instructions remaining,                     */
/*                                                                           */
/*****************************************************************************/
static _UINT8 next_uw_byte(_Unwind_Instr_Handle *uwh)
{
    _UINT8 uw_byte;

    if (uwh->bytes_remaining == 0)
    {
	if (uwh->words_remaining == 0)
	    return UWINS_FINISH;
	else
	{
	    uwh->curr_word = *(++uwh->curr_pos);
	    uwh->words_remaining--;
	    uwh->bytes_remaining = 4;
	}
    }
    uw_byte = (uwh->curr_word & 0xff000000) >> 24;
    uwh->curr_word <<= 8;
    uwh->bytes_remaining--;

    return uw_byte;
}


/*****************************************************************************/
/*                                                                           */
/* read_uleb128 - Read a ULEB128 encoded offset stored in the unwind area    */
/*                                                                           */
/*****************************************************************************/
INLINE static _UINT32 read_uleb128(_Unwind_Instr_Handle *uh)
{
    _UINT8  uw_byte;
    _UINT32 val       = 0;
    _UINT8  shift_amt = 0;

    while (1)
    {
	uw_byte = next_uw_byte(uh);
	val |= (uw_byte & 0x7f) << shift_amt;
	/*-------------------------------------------------------------------*/
	/* The last group does not have MSB set to 1                         */
	/*-------------------------------------------------------------------*/
	if ((uw_byte & 0x80) == 0) break;
	shift_amt += 7;
    }
    return val;
}


/*****************************************************************************/
/*                                                                           */
/* regb_core_get - Returns value stored in register "index" in val           */
/*                                                                           */
/*****************************************************************************/
static _URB_Status regb_core_get(_Unwind_Context *context, 
			         _Unwind_Reg_Id   index, 
				 _UINT32          *val)
{
    _Unwind_Register_Buffer *reg_buf = (_Unwind_Register_Buffer *)context;

    if (index > _UR_LAST) return _URB_Failure;

    *val = reg_buf->core[index];

    return _URB_Success;
}

/*****************************************************************************/
/*                                                                           */
/* regb_core_set - Update value stored in register "index" using val         */
/*                                                                           */
/*****************************************************************************/
static _URB_Status regb_core_set(_Unwind_Context *context, 
				 _Unwind_Reg_Id   index, 
				 _UINT32           val)
{
    _Unwind_Register_Buffer *reg_buf = (_Unwind_Register_Buffer *)context;

    if (index > _UR_LAST) return _URB_Failure;

    reg_buf->core[index] = val;

    return _URB_Success;
}

/*****************************************************************************/
/*                                                                           */
/* regb_core_pop - Starting at stack address contained in SP, pop registers  */
/*                 from stack into the Register Buffer using the mask        */
/*                                                                           */
/*****************************************************************************/
static _URB_Status regb_core_pop(_Unwind_Context *context, _UINT32 mask)
{
    _Unwind_Register_Buffer *reg_buf = (_Unwind_Register_Buffer *)context;
    _UINT32 *vsp;
    _UINT32 *corep;
    _UINT32  sp_popped;

    if (mask > 0xffff) return _URB_Failure;

    /*-----------------------------------------------------------------------*/
    /* If SP is one of the registers popped, use this value for SP           */
    /*-----------------------------------------------------------------------*/
    sp_popped = mask & (1 << _UR_SP);
    //printf("sp_popped=%d, mask=%x, spmask=%x\n",sp_popped,mask,(1 << _UR_SP));

    vsp   = (_UINT32 *)reg_buf->core[_UR_SP];
    corep = (_UINT32 *)reg_buf->core;

    while (mask > 0)
    {
	if (mask & 1) *corep = *vsp++;
	corep++;
	mask >>= 1;
    }

    /*-----------------------------------------------------------------------*/
    /* If SP has not been popped, update SP to stack pointer value after pop */
    /*-----------------------------------------------------------------------*/
    if (!sp_popped) reg_buf->core[_UR_SP] = (_UINT32)vsp;

    return _URB_Success;
}

#if __TI_VFP_SUPPORT__ || __TI_NEON_SUPPORT__
/*****************************************************************************/
/*                                                                           */
/* regb_Dreg_pop - Pop values from the stack to the VFP D registers.         */
/*                                                                           */
/*****************************************************************************/
static _URB_Status regb_Dreg_pop(_Unwind_Context *context, _UINT32 start, 
				 _UINT32 count, bool vfpx)
{
    _Unwind_Register_Buffer *reg_buf = (_Unwind_Register_Buffer *)context;
    _DBL64 *vsp;
    _DBL64 *corep;

#if __TI_VFPV3_SUPPORT__ || __TI_NEON_SUPPORT__
    struct { _DBL64 r[32]; } vdregs;
#else
    struct { _DBL64 r[16]; } vdregs;
#endif

    /*-----------------------------------------------------------------------*/
    /* Copy the VFP D registers to memory, update the registers that are     */
    /* being popped in memory and then restore all of the VFP registers.     */
    /*-----------------------------------------------------------------------*/
    __TI_preserve_low_VFP(&(vdregs.r[0]));
#if __TI_VFPV3_SUPPORT__ || __TI_NEON_SUPPORT__
    if (start+count >= 16) __TI_preserve_high_VFP(&(vdregs.r[16]));
#endif

    vsp   = (_DBL64 *)reg_buf->core[_UR_SP];
    corep = (_DBL64 *)(&(vdregs.r[start]));

    for (int i = 0; i < count; i++)
	*corep++ = *vsp++;

    __TI_restore_low_VFP(&(vdregs.r[0]));
#if __TI_VFPV3_SUPPORT__ || __TI_NEON_SUPPORT__
    if (start+count >= 16) __TI_restore_high_VFP(&(vdregs.r[16]));
#endif
    
    /*-----------------------------------------------------------------------*/
    /* If the unwind instruction is mimicing a FLDMFDX instruction then      */
    /* increment the stack pointer by an extra word to account for the       */
    /* extra offset.                                                         */
    /*-----------------------------------------------------------------------*/
    reg_buf->core[_UR_SP] = (_UINT32)vsp + (vfpx ? 4 : 0);
    return _URB_Success;
}
#endif

/*****************************************************************************/
/*                                                                           */
/* __TI_targ_set_pr - Compute PR address from the EHT, update UE             */
/*                                                                           */
/*****************************************************************************/
bool __TI_targ_set_pr(_Unwind_Exception *uexcep)
{
    if (uexcep->pr_data.eht_start == (void *)0) return false;

    /*-----------------------------------------------------------------------*/
    /* The first word of the EHT encodes PR variant used to process eht      */
    /*-----------------------------------------------------------------------*/
    _UINT32 eht_first_word = *(uexcep->pr_data.eht_start);

    #ifdef DEBUG_UNWINDER
    printf("UW: EHT First Word 0x%8.8x, PR %d\n", 
	    eht_first_word, (eht_first_word & 0x0f000000) >> 24);
    #endif /* DEBUG_UNWINDER */

    /*-----------------------------------------------------------------------*/
    /* If MSB==1, Bits 27-24 contain index of PR used                        */
    /*-----------------------------------------------------------------------*/
    if ((eht_first_word & 0x80000000) != 0)
    {
	switch ((eht_first_word & 0x0f000000) >> 24)
	{
	    case 0: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__aeabi_unwind_cpp_pr0;
		break;
	    case 1: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__aeabi_unwind_cpp_pr1;
		break;
	    case 2: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__aeabi_unwind_cpp_pr2;
		break;
	    default:
		return false;
	}
    }
    /*-----------------------------------------------------------------------*/
    /* If MSB==0, Bits 30-0 contain the PR offset, conv from segrel to abs   */
    /*-----------------------------------------------------------------------*/
    else
	uexcep->unwinder_data.pr_addr =__TI_prel2abs(uexcep->pr_data.eht_start);

    return true;
}


/*****************************************************************************/
/*                                                                           */
/* __TI_targ_regbuf_get_sp - Return SP from RegBuffer pointed to by context  */
/*                                                                           */
/*****************************************************************************/
_UINT32 __TI_targ_regbuf_get_sp(_Unwind_Context *context)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    return regbuf->core[_UR_SP];
}


/*****************************************************************************/
/*                                                                           */
/* __TI_targ_regbuf_get_pc - Return PC from RegBuffer pointed to by context  */
/*                                                                           */
/*****************************************************************************/
_UINT32 __TI_targ_regbuf_get_pc(_Unwind_Context *context)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    return regbuf->core[_UR_PC];
}


/*****************************************************************************/
/*                                                                           */
/* __TI_targ_regbuf_set_pc - Store into RegBuffer PC pointed by context      */
/*                                                                           */
/*****************************************************************************/
void __TI_targ_regbuf_set_pc(_Unwind_Context *context, _UINT32 val)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    regbuf->core[_UR_PC] = val;
    return;
}

/*****************************************************************************/
/*                                                                           */
/* __TI_targ_regbuf_get_sb - Return Static Base (DP) from RegBuffer          */
/*                                                                           */
/*    This function is used to get the base address for type_info pointers   */
/*    encoded as SB-relative offsets. This implementation of TDEH does not   */
/*    use relative encodings; it uses absolute addresses. So return 0.       */
/*                                                                           */
/*****************************************************************************/
_UINT32 __TI_targ_regbuf_get_sb(_Unwind_Context *context)
{
   return 0; 
}

/*****************************************************************************/
/*                                                                           */
/* __TI_targ_rtti_address - Return address of referenced typeinfo object     */
/*                                                                           */
/*****************************************************************************/
_UINT32 __TI_targ_rtti_address(_UINT32 offset, _Unwind_Context *context)
{
   return offset;            // This implementation uses absolute addressing
}

/*****************************************************************************/
/*                                                                           */
/* __TI_targ_regbuf_install - Copy RegBuffer into machine registers          */
/*                                                                           */
/*****************************************************************************/
void __TI_targ_regbuf_install(_Unwind_Context *context)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    __TI_Install_CoreRegs(&regbuf->core);
    /*************************************************************************/
    /* __TI_Install_CoreRegs transfers control out of the unwinder.  Do not  */
    /* add any code after this point.  It will not be executed.              */
    /*************************************************************************/

}


/*****************************************************************************/
/*                                                                           */
/* __TI_targ_setup_call_parm0 - Set up register buffer to make "val" the     */
/*                              first parameter to a function whose address  */
/*                              will be stored in the register buffer PC     */
/*                                                                           */
/*****************************************************************************/
void __TI_targ_setup_call_parm0(_Unwind_Context *context, _UINT32 val)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    regbuf->core[_UR_R0] = val;
    return;
}

/*****************************************************************************/
/*                                                                           */
/* __TI_Unwind_RaiseException - This function exists to allocate the         */
/*          register context for __TI_Unwind_RaiseException2, which does     */
/*          all of the work, but doesn't need to know the size of the        */
/*          register context.                                                */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __TI_Unwind_RaiseException(_Unwind_Exception *uexcep, 
					       _Unwind_Context   *ph2_context)
{
    #ifdef DEBUG_UNWINDER
    printf("UW: In __TI_Unwind_RaiseException, UE @ %p, ph2_context @ %p\n", 
           uexcep, ph2_context);
    #endif

    /*-----------------------------------------------------------------------*/
    /* Make a copy of the register context for use by the Phase 1 unwinder.  */
    /* This needs to be a copy because we're going to simulate unwinding by  */
    /* writing to it, and we don't want to scribble on the original yet.     */
    /* Phase 2 will use the original, since at that time we are committed    */
    /* to unwinding the frame.                                               */
    /*-----------------------------------------------------------------------*/
    _Unwind_Register_Buffer ph1_regs;
    _Unwind_Context *ph1_context = (_Unwind_Context *)&ph1_regs;

    memcpy(ph1_context, ph2_context, sizeof(_Unwind_Register_Buffer));

    return __TI_Unwind_RaiseException2(uexcep,
                                      ph1_context,
                                      ph2_context);
}

#endif /* __EXCEPTIONS */

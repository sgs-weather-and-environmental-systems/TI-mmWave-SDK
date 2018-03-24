/*****************************************************************************/
/*  tdeh_pr_c6000.cpp v8.1.3                                                 */
/*                                                                           */
/* Copyright (c) 2008-2017 Texas Instruments Incorporated                    */
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
/*  implementation (PR entry points pr0 - pr4, unwind processing)            */
/*  required by Table-Driven Exception Handling                              */
/*                                                                           */
/*****************************************************************************/
#if __EXCEPTIONS && defined(__TI_TABLE_DRIVEN_EXCEPTIONS)

#include <stdlib.h>
#include "tdeh_common.h"
#include "tdeh_c6000.h"

extern "C" {

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
/* EXTERNS - printf, used only by debug                                      */
/*****************************************************************************/
#if defined(DEBUG_PR) || defined(DEBUG_UW_INSTRS)
#include <stdio.h>
#endif

#include <string.h>

}


/*****************************************************************************/
/* Functions used to access the Register Buffer                              */
/*****************************************************************************/
typedef enum { _URB_Failure=0, _URB_Success } _URB_Status;
static _URB_Status regb_core_get(_Unwind_Context *, _Unwind_Reg_Id, _UINT32 *);
static _URB_Status regb_core_set(_Unwind_Context *, _Unwind_Reg_Id, _UINT32);

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
						 _UINT32 *estart_addr);


/*****************************************************************************/
/*                                                                           */
/* __c6xabi_unwind_cpp_pr0 - PR handling short frame unwinding, 16-bit scope */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __c6xabi_unwind_cpp_pr0 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Su16);
}


/*****************************************************************************/
/*                                                                           */
/* __c6xabi_unwind_cpp_pr1 - PR handling long frame unwinding, 16-bit scope  */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __c6xabi_unwind_cpp_pr1 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Lu16);
}


/*****************************************************************************/
/*                                                                           */
/* __c6xabi_unwind_cpp_pr2 - PR handling long frame unwinding, 32-bit scope  */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __c6xabi_unwind_cpp_pr2 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_Lu32);
}


/*****************************************************************************/
/*                                                                           */
/* __c6xabi_unwind_cpp_pr3 - PR handling 24-bit encoding, 16-bit scope       */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __c6xabi_unwind_cpp_pr3 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_PR3);
}


/*****************************************************************************/
/*                                                                           */
/* __c6xabi_unwind_cpp_pr4 - PR handling 24-bit "compact frame" encoding     */
/*                                                                           */
/*****************************************************************************/
_Unwind_Reason_Code __c6xabi_unwind_cpp_pr4 (_Unwind_Phase      phase,
					    _Unwind_Exception *uexcep, 
					    _Unwind_Context   *context)
{
    return __TI_unwind_cpp_pr(phase, uexcep, context, _UPK_PR4);
}


/*****************************************************************************/
/*                                                                           */
/* __TI_unwind_cpp_pr - Implements pr0 - pr4.                                */
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

    /*-----------------------------------------------------------------------*/
    /* If the phase or pr_kind is not supported, return failure              */
    /*-----------------------------------------------------------------------*/
    if (phase != _UP_Phase1 && phase != _UP_Phase2_Start && 
	phase != _UP_Phase2_Resume)
	return _URC_FAILURE;
    if (pr_kind != _UPK_Su16 && pr_kind != _UPK_Lu16 && pr_kind != _UPK_Lu32 &&
	pr_kind != _UPK_PR3 && pr_kind != _UPK_PR4)
	return _URC_FAILURE;

    estart_addr = uexcep->pr_data.eht_start;

    #ifdef DEBUG_PR
    printf("PR: U %08x, uw exception object\n", uexcep);
    printf("PR: Kind %d, Phase %d, Fn Start %08x, EHT Start %08x\n", 
	    pr_kind, phase, uexcep->pr_data.func_start, estart_addr);
    #endif /* DEBUG_PR */

    /*-----------------------------------------------------------------------*/
    /* Process descriptors if the EHT is not an inline EHT - inline EHTs do  */
    /* not have descriptors, only unwind instructions. Bit 0 of the          */
    /* additional field in pr_data is set to 1 if the EHT is inline          */
    /*-----------------------------------------------------------------------*/
    if ((uexcep->pr_data.additional & 1) != 1)
    {
        #ifdef DEBUG_PR
	printf("PR: Looking for process descriptors\n");
        #endif /* DEBUG_PR */

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

            #ifdef DEBUG_PR
	    printf("PR: Unwinding uses %d addl words\n", additional_words);
            #endif /* DEBUG_PR */

	    descr_ptr = estart_addr + 1 + additional_words;
	}
	else
	    descr_ptr = (_UINT32*)uexcep->cleanup_data.cleanup_ehtp;

	_Unwind_Reason_Code reason;
	if (__TI_process_descriptors(phase, uexcep, context, pr_kind, 
                                     descr_ptr, &reason, 
                                     &ph2_call_unexpected))
	{
            #ifdef DEBUG_PR
            printf("PR: __TI_unwind_cpp_pr returning because"
                   " a descriptor was found\n");
            #endif /* DEBUG_PR */

	    return reason;
	}
    }

    /*-----------------------------------------------------------------------*/
    /* Process unwind instructions                                           */
    /*-----------------------------------------------------------------------*/
    if (process_unwind(context, pr_kind, estart_addr) == _URC_FAILURE)
    {
	#ifdef DEBUG_PR
	printf("PR: __TI_unwind_cpp_pr returning because"
               " process_unwind returned _URC_FAILURE\n"); 
	#endif /* DEBUG_PR */
        
	return _URC_FAILURE;
    }

    /*-----------------------------------------------------------------------*/
    /* If fespec forms a propagation barrier, and __cxa_call_unexpected has  */
    /* to be called, perform setup required                                  */
    /*-----------------------------------------------------------------------*/
    if (ph2_call_unexpected)
    {
	#ifdef DEBUG_PR
	printf("PR: Phase 2 FEspec barrier, calling __cxa_call_unexpected\n"); 
	#endif /* DEBUG_PR */

        /*-------------------------------------------------------------------*/
        /* Copy this PC value into RETA to set up the return address for the */
        /* call to __cxa_call_unexpected. From Section 8.5.3, any permitted  */
        /* throw out of unexpected() must behave as if unwinding resumes at  */
        /* the call site to the func whose exception spec was violated.      */
        /*-------------------------------------------------------------------*/
        _UINT32 pc;
        regb_core_get(context, _UR_PC, &pc);
        regb_core_set(context, _UR_RETA, pc);

	/*-------------------------------------------------------------------*/
	/* Set A4, PC to call __cxa_call_unexpected                          */
	/*-------------------------------------------------------------------*/
	regb_core_set(context, _UR_PC, (_UINT32)&__cxa_call_unexpected);
	regb_core_set(context, _UR_ARG1, (_UINT32)uexcep);

	return _URC_INSTALL_CONTEXT;
    }

    /*-----------------------------------------------------------------------*/
    /* If we get here, ask the unwinder to process the next frame            */
    /*-----------------------------------------------------------------------*/
    return _URC_CONTINUE_UNWIND;
}

/*****************************************************************************/
/*                                                                           */
/* setup_uh - Set up unwinder instruction handle based on PR kind.           */
/*                                                                           */
/*****************************************************************************/
INLINE static void setup_uh(_Unwind_PR_Kind pr_kind, _UINT32 *estart_addr,
                            _Unwind_Instr_Handle *uh)
{
    /*-----------------------------------------------------------------------*/
    /* For PR3 and PR4, the lower 24 bits are interpreted as a combined      */
    /* instrucion.  For Lu16 and Lu32, bits 16-23 contain a count of the     */
    /* number of additional 4-byte words                                     */
    /*-----------------------------------------------------------------------*/
    uh->curr_pos = estart_addr;

    _UINT32 tmp = *estart_addr;

    if (pr_kind == _UPK_PR3 || pr_kind == _UPK_PR4)
    {
	uh->words_remaining = 0;
	uh->curr_word       = tmp & 0xffffff;
    }
    else if (pr_kind == _UPK_Su16)
    {
	uh->words_remaining = 0;
	uh->bytes_remaining = 3;
	uh->curr_word       = tmp << 8;
    }
    else
    {
	uh->words_remaining = (tmp & 0x00ff0000) >> 16;
	uh->bytes_remaining = 2;
	uh->curr_word       = tmp << 16;
    }
}

#if defined(_BIG_ENDIAN)
#define BIG_ENDIAN_CODE 1
#else
#define BIG_ENDIAN_CODE 0
#endif

/*---------------------------------------------------------------------------*/
/* Printable names of the registers.                                         */
/*---------------------------------------------------------------------------*/
#ifdef DEBUG_UW_INSTRS
static const char *name_from_id_data[] = 
{ 
    "A4",  "A5",  
    "A10", "A11", "A12", "A13", "A14", "A15",
    "B2",  "B3", 	
    "B10", "B11", "B12", "B13", "B14", "B15",
};

#define name_from_id(id) name_from_id_data[id ^ BIG_ENDIAN_CODE]
#endif /* DEBUG_UW_INSTRS */

/*---------------------------------------------------------------------------*/
/* Since it is required that _Unwind_Reg_Id is number such that if (x:y) is  */
/* a pair, (x^y==1), then from an id we can quickly determine what the other */
/* register in the pair is.                                                  */
/*---------------------------------------------------------------------------*/
#define REGPAIR_COMPLEMENT(id) ((_Unwind_Reg_Id)((id) ^ 1))

/*---------------------------------------------------------------------------*/
/* This is the "Safe debug" order, which is in the order the function prolog */
/* pushes registers onto the stack, starting at the old value of the SP and  */
/* decrementing SP as it goes.  This order is slightly perturbed in big      */
/* endian mode.                                                              */
/*---------------------------------------------------------------------------*/
static const unsigned char id_from_SD_data[] =
{
    _UR_A15,
    _UR_B15, _UR_B14, _UR_B13, _UR_B12, _UR_B11, _UR_B10, 
    _UR_B3, 
    _UR_A14, _UR_A13, _UR_A12, _UR_A11, _UR_A10
};
#define id_from_SD(SD) ((_Unwind_Reg_Id)id_from_SD_data[SD])

/*---------------------------------------------------------------------------*/
/* For all id, it must be the case that id_from_BM(BM_from_id(id)) == id     */
/*---------------------------------------------------------------------------*/
const unsigned char BM_from_id_data[] =
{
    0xff, /* _UR_A4 */
    0xff, /* _UR_A5 */
    12,   /* _UR_A10 */
    11,   /* _UR_A11 */
    10,   /* _UR_A12 */
    9,    /* _UR_A13 */
    8,    /* _UR_A14 */
    0,    /* _UR_A15 */
    0xff, /* _UR_B2 */
    7,    /* _UR_B3 */
    6,    /* _UR_B10 */
    5,    /* _UR_B11 */
    4,    /* _UR_B12 */
    3,    /* _UR_B13 */
    2,    /* _UR_B14 */
    1,    /* _UR_B15 */
};
#define BM_from_id(id) BM_from_id_data[id ^ BIG_ENDIAN_CODE]

/*---------------------------------------------------------------------------*/
/* "id_from_BM" tells us how to interpret each bit in the bitmask.  Note     */
/* that the ordering is the same as id_from_SD, but for potential future     */
/* personalities or other architectures they might not be the same.          */
/*---------------------------------------------------------------------------*/
#define id_from_BM(BM) id_from_SD(BM)

/*---------------------------------------------------------------------------*/
/* "BM_from_SD" maps the position in id_from_SD to the corresponding         */
/* position in id_from_BM.  For all SD, it must be the case that             */
/* (id_from_SD[SD] == id_from_BM[BM_from_SD(SD)]).                           */
/*---------------------------------------------------------------------------*/
#define BM_from_SD(SD) (SD)

/*---------------------------------------------------------------------------*/
/* "id_from_F4" tells us how to interpret the 4-bit field in POP unwinding   */
/* instructions that don't use bitmask.  Note that the ordering is the same  */
/* as id_from_SD, but for potential future personalities or other            */
/* architectures they might not be the same.                                 */
/*---------------------------------------------------------------------------*/
#define id_from_F4(F4) id_from_SD(F4)
                    
/*****************************************************************************/
/*                                                                           */
/* process_unwind_pop_bitmask - handle bitmasks for POP unwind instrucions   */
/*                                                                           */
/*****************************************************************************/
static void process_unwind_pop_bitmask(_Unwind_Context *context, 
                                       _Unwind_PR_Kind  pr_kind,
                                       _UINT32          mask,
                                       bool             compact_frame,
                                       bool             mv_fp_sp_seen)
{
    _UINT32 rval;

#define BM_BITS 13
#define BM_IS_SAVED(BM, mask) (mask & (1 << ((BM_BITS - 1) - BM)))
#define ID_IS_SAVED(id, mask) BM_IS_SAVED(BM_from_id(id), mask)

    /*-----------------------------------------------------------------------*/
    /* First, implicitly increment the stack.  For this, we will need to     */
    /* know the size of the SOE save area.  For PR3, this is simply the      */
    /* register save count rounded up, but for PR4, there may be holes in    */
    /* the register save area for the "compact frame" scheme.                */
    /*-----------------------------------------------------------------------*/
    int reg_count = 0, save_slots = 0;

    for (unsigned int BM = 0; BM < BM_BITS; BM++)
        if (BM_IS_SAVED(BM, mask)) 
            reg_count++;

    #ifdef DEBUG_UW_INSTRS
    printf("PUW: PR%d: POP bitmask %d registers%s\n", 
           pr_kind, reg_count,
           compact_frame ? ", compact frame" : "");
    #endif /* DEBUG_UW_INSTRS */

    if (!mv_fp_sp_seen)
    {
        if (pr_kind == _UPK_PR3) save_slots = reg_count;
        else
        {
            /*---------------------------------------------------------------*/
            /* Add holes for the "compact frame" scheme.  If a register pair */
            /* is saved, it takes up 8 bytes.  If a single register is saved */
            /* and its complement is not, it still takes up 8 bytes.  The    */
            /* first register saved is considered a single register.         */
            /*---------------------------------------------------------------*/
            bool first_reg_seen = false;
            _Unwind_Reg_Id first_reg_id;    

            for (unsigned int BM = 0; BM < BM_BITS; BM++) 
            {
                if (BM_IS_SAVED(BM, mask))
                {
                    _Unwind_Reg_Id id = id_from_BM(BM);
                    _Unwind_Reg_Id comp_id = REGPAIR_COMPLEMENT(id);

                    reg_count++;
                    save_slots++;

                    if (!first_reg_seen)
                    {
                        first_reg_seen = true;
                        first_reg_id = id;
                    }
                
                    if (id == first_reg_id || !ID_IS_SAVED(comp_id, mask) || 
                        comp_id == first_reg_id) 
                    {
                        save_slots++;
                    }
                }
            }
        }

        /*-------------------------------------------------------------------*/
        /* Round up to doublewords before performing the implicit increment. */
        /*-------------------------------------------------------------------*/
        _UINT32 addend = (save_slots + 1) / 2 * 8;
        regb_core_get(context, _UR_SP, &rval);
        regb_core_set(context, _UR_SP, rval + addend);

        #ifdef DEBUG_UW_INSTRS
        printf("PUW: PR%d: implicit SP += %u [%#x]\n", 
               pr_kind, addend, rval + addend);
        #endif /* DEBUG_UW_INSTRS */
    }

    /*-----------------------------------------------------------------------*/
    /* Now pop each register.                                                */
    /*-----------------------------------------------------------------------*/
    _Unwind_Register_Buffer *reg_buf = (_Unwind_Register_Buffer *)context; 
    _UINT32 *vsp = (_UINT32 *)reg_buf->core[_UR_SP];

    /*-----------------------------------------------------------------------*/
    /* Iterate over the bitmask ordering.                                    */
    /*-----------------------------------------------------------------------*/
    bool first_reg_handled = false;
    _Unwind_Reg_Id first_reg_id;

    int pos = 0;

    for (unsigned int i = 0; i < BM_BITS; i++)
    {
        unsigned int BM = i;

        _Unwind_Reg_Id id = id_from_BM(BM);
        _Unwind_Reg_Id comp_id = REGPAIR_COMPLEMENT(id);

#if defined(_BIG_ENDIAN) 
        /*-------------------------------------------------------------------*/
        /* The compiler will use double-word loads to restore the stack if   */
        /* possible, so the words might be swapped for endianness.  If big   */
        /* endian, the parts of register pairs are swapped on the stack.     */
        /*-------------------------------------------------------------------*/
        /* For all but the first register restored and its pair complement,  */
        /* restore the complement instead.  The two registers must also be   */
        /* adjacent in the safe debug order, but all of the saved registers  */
        /* are except for A15:A14.  If A15 is being saved, it will be the    */
        /* first register saved, so we don't have to check for it.  B3       */
        /* doesn't get swapped because B2 is never saved.                    */
        /*-------------------------------------------------------------------*/
        if (id != _UR_B3 && id != _UR_A14 &&
            first_reg_handled && comp_id != first_reg_id)
        {
            BM = BM_from_id(comp_id);
            id = id_from_BM(BM);
            comp_id = REGPAIR_COMPLEMENT(id);
        }
#endif

        if (BM_IS_SAVED(BM, mask))
        {
            if (compact_frame && first_reg_handled &&
                (comp_id == first_reg_id || !ID_IS_SAVED(comp_id, mask)))
                {
                    pos++;
                }

            reg_buf->core[id] = *(vsp - pos);

            #ifdef DEBUG_UW_INSTRS
            printf("PUW: PR%d: POP: %s = *SP[-%d] (*(%#x) == %#x)\n",
                   pr_kind, name_from_id(id), pos, vsp - pos, *(vsp - pos));
            #endif

            pos++;

            if (!first_reg_handled)
            {
                first_reg_handled = true;
                first_reg_id = id;
            }
        }
    }
}

/*****************************************************************************/
/*                                                                           */
/* process_unwind_pr3_pr4 - handle the compact PR3/4 encoding                */
/*                                                                           */
/*****************************************************************************/
static void process_unwind_pr3_pr4(_Unwind_Context *context, 
                                   _Unwind_PR_Kind  pr_kind, 
                                   _UINT32         *estart_addr)
{
    _Unwind_Instr_Handle uh;

    _UINT32 rval;

    setup_uh(pr_kind, estart_addr, &uh);

    /*-----------------------------------------------------------------------*/
    /* PR3 and PR4 pack three things into 24 bits: an SP increment, a        */
    /* register pop bitmask, and a register which holds the return address.  */
    /*-----------------------------------------------------------------------*/

    /*-----------------------------------------------------------------------*/
    /* If the return address is in an SOE register, move it to B3.  This     */
    /* needs to be done before the SOE register is overwritten.              */
    /*-----------------------------------------------------------------------*/
    _Unwind_Reg_Id id = id_from_F4(uh.curr_word & 0xf);

    if (id != _UR_RETA)
    {
        regb_core_get(context, id, &rval);
        regb_core_set(context, _UR_RETA, rval);

        #ifdef DEBUG_UW_INSTRS
        printf("PUW: PR%d: MV %s, B3 [%#x]\n", 
               pr_kind, name_from_id(id), rval);
        #endif /* DEBUG_UW_INSTRS */
    }

    bool mv_fp_sp_seen = false;

    /*-----------------------------------------------------------------------*/
    /* Perform the stack increment.  If it is the special value 0x7f,        */
    /* instead restore the SP from the FP.                                   */
    /*-----------------------------------------------------------------------*/
    _UINT32 sp_inc_bits = uh.curr_word >> 17;

    if (sp_inc_bits == 0x7f)
    {
        regb_core_get(context, _UR_FP, &rval);
        regb_core_set(context, _UR_SP, rval);

        #ifdef DEBUG_UW_INSTRS
        printf("PUW: PR%d: MOV FP, SP\n", pr_kind);
        #endif /* DEBUG_UW_INSTRS */

        mv_fp_sp_seen = true;
    }
    else 
    {
        _UINT32 addend = sp_inc_bits << 3;
        regb_core_get(context, _UR_SP, &rval);
        regb_core_set(context, _UR_SP, rval + addend);

        #ifdef DEBUG_UW_INSTRS
        printf("PUW: PR%d: SP += (%u << 3) [%#x]\n", 
               pr_kind, sp_inc_bits, rval + addend);
        #endif /* DEBUG_UW_INSTRS */

        mv_fp_sp_seen = false;
    }

    /*-----------------------------------------------------------------------*/
    /* POP SOE registers.                                                    */
    /*-----------------------------------------------------------------------*/
    unsigned int mask = (uh.curr_word >> 4) & 0x1fff;

    /*-----------------------------------------------------------------------*/
    /* The bitmask for PR3 and PR4 is the same order as the bitmask for the  */
    /* POP BITMASK unwind instruction.                                       */
    /*-----------------------------------------------------------------------*/
    process_unwind_pop_bitmask(context, pr_kind, mask, 
                               pr_kind == _UPK_PR4, mv_fp_sp_seen);

    /*-----------------------------------------------------------------------*/
    /* Return through RETA                                                   */
    /*-----------------------------------------------------------------------*/
    regb_core_get(context, _UR_RETA, &rval);
    regb_core_set(context, _UR_PC, rval);

    #ifdef DEBUG_UW_INSTRS
    printf("PUW: PR%d: RET B3 [%#x]\n", pr_kind, rval);
    #endif /* DEBUG_UW_INSTRS */
}

/*****************************************************************************/
/*                                                                           */
/* process_unwind - decode and simulate frame unwinding instructions.        */
/*                                                                           */
/*****************************************************************************/
INLINE static _Unwind_Reason_Code process_unwind(_Unwind_Context *context, 
						 _Unwind_PR_Kind  pr_kind, 
						 _UINT32         *estart_addr)
{
    #ifdef DEBUG_UW_INSTRS
    printf("PUW: Entering process_unwind\n");
    #endif /* DEBUG_UW_INSTRS */

    _Unwind_Instr_Handle uh;

    _UINT8 uw_byte;
    _UINT8 uw_next_byte;

    setup_uh(pr_kind, estart_addr, &uh);

    bool sp_restored_from_fp = false;

    _UINT32 rval;

    /*-----------------------------------------------------------------------*/
    /* Process unwind instructions                                           */
    /*-----------------------------------------------------------------------*/
    if (pr_kind == _UPK_PR3 || pr_kind == _UPK_PR4)
    {
        process_unwind_pr3_pr4(context, pr_kind, estart_addr);
    }
    else while (1)
    {
	uw_byte = next_uw_byte(&uh);

        /*-------------------------------------------------------------------*/
        /* 00xx xxxx -> SP = SP + (xxxxxx << 3) + 8 [0x08-0x200]	     */
        /*-------------------------------------------------------------------*/
	if ((uw_byte & 0xc0) == 0x00)
	{
            _UINT32 sp_inc_bits = uw_byte & 0x3f;
            _UINT32 addend = (sp_inc_bits << 3) + 8;
	    regb_core_get(context, _UR_SP, &rval);
	    regb_core_set(context, _UR_SP, rval + addend);

	    #ifdef DEBUG_UW_INSTRS
	    printf("PUW: SP += (%d << 3) + 8, [%#x]\n", 
                   sp_inc_bits, rval + addend);
	    #endif /* DEBUG_UW_INSTRS */

	    continue;
	}

        /*-------------------------------------------------------------------*/
        /* 1110 xxxx -> RET B3 (if x == B3) or MV SOE, B3                    */
        /*-------------------------------------------------------------------*/
	else if ((uw_byte == UWINS_FINISH) || ((uw_byte & 0xf0) == 0xe0))
	{
            _Unwind_Reg_Id id = id_from_F4(uw_byte & 0xf);

	    if (id != _UR_RETA)
	    {
                /*-----------------------------------------------------------*/
                /* This is "MV SOE, B3" instruction.  Set RETA.              */
                /*-----------------------------------------------------------*/
		regb_core_get(context, id, &rval);
		regb_core_set(context, _UR_RETA, rval);

                #ifdef DEBUG_UW_INSTRS
		printf("PUW: MV %s, B3 [%#x]\n", name_from_id(id), rval);
                #endif /* DEBUG_UW_INSTRS */
	    }
	    else
	    {
                /*-----------------------------------------------------------*/
                /* This is a "RET SOC" instruction.   Set PC and return.     */
                /*-----------------------------------------------------------*/
                /* A stream of unwinding instructions ends with an explicit  */
                /* or implicit RET.  Implicit RET is always interpreted as   */
                /* "FINISH," which is just "RET B3."  next_uw_byte() returns */
                /* "FINISH" when there are no more bytes available.          */
                /*-----------------------------------------------------------*/
                regb_core_get(context, id, &rval);
                regb_core_set(context, _UR_PC, rval);

                #ifdef DEBUG_UW_INSTRS
                printf("PUW: RET %s [%#x]\n", name_from_id(id), rval);
                #endif /* DEBUG_UW_INSTRS */

                /*-----------------------------------------------------------*/
                /* Once we've seen a RET, we are done.			     */
                /*-----------------------------------------------------------*/
		break;
	    }
	}

	/*-------------------------------------------------------------------*/
        /* 1000 0000 0000 0000 CANTUNWIND				     */
        /*-------------------------------------------------------------------*/
        /* 100x xxxx xxxx xxxx POP bitmask A15,B15-B10,B3,A14-A10	     */
	/*-------------------------------------------------------------------*/
	else if ((uw_byte & 0xe0) == 0x80)
	{
	    uw_next_byte = next_uw_byte(&uh);

	    if ((uw_byte == 0x80) && (uw_next_byte == 0x00))
	    {
	        #ifdef DEBUG_UW_INSTRS
		printf("PUW: CANTUNWIND\n");
                #endif /* DEBUG_UW_INSTRS */

		return _URC_FAILURE;
	    }
	    else
	    {
		unsigned int mask = (uw_byte << 8) | uw_next_byte;

                process_unwind_pop_bitmask(context, pr_kind, mask, false,
                                           sp_restored_from_fp);
	    }
	}

        /*-------------------------------------------------------------------*/
        /* 1010 0000 0000 0000 reserved					     */
        /*-------------------------------------------------------------------*/
        /* 101x xxxx xxxx xxxx POP bitmask CI A15,B15-B10,B3,A14-A10	     */
        /*-------------------------------------------------------------------*/
	else if ((uw_byte & 0xe0) == 0xa0)
	{
	    uw_next_byte = next_uw_byte(&uh);

            unsigned int mask = (uw_byte << 8) | uw_next_byte;

            process_unwind_pop_bitmask(context, pr_kind, mask, true,
                                       sp_restored_from_fp);
	}

        /*-------------------------------------------------------------------*/
        /* 1100 xxxx -> ...  POP SOE (x regs encoded in 4 bit fields)	     */
        /*-------------------------------------------------------------------*/
	else if ((uw_byte & 0xf0) == 0xc0)
	{
	    int count = uw_byte & 0x0f;

	    #ifdef DEBUG_UW_INSTRS
	    printf("PUW: POP %d registers:\n", count);
            #endif /* DEBUG_UW_INSTRS */
	    
            /*---------------------------------------------------------------*/
            /* First, increment SP by the size of the regsave area, unless   */
            /* we've restored the SP from FP.				     */
            /*---------------------------------------------------------------*/
	    if (!sp_restored_from_fp)
	    {
                _UINT32 addend = (count + 1) / 2 * 8;
		regb_core_get(context, _UR_SP, &rval);
		regb_core_set(context, _UR_SP, rval + addend);
		
                #ifdef DEBUG_UW_INSTRS
		printf("PUW: implicit SP += %u [%#x]\n", 
                       addend, rval + addend);
                #endif /* DEBUG_UW_INSTRS */
	    }

            /*---------------------------------------------------------------*/
            /* Now retrieve the SOE registers.  The first register listed is */
            /* fetched from *SP[0], the next from *SP[-1], and so on.	     */
            /*---------------------------------------------------------------*/
            _Unwind_Register_Buffer *reg_buf = 
                (_Unwind_Register_Buffer *)context;      
            _UINT32 *vsp = (_UINT32 *)reg_buf->core[_UR_SP];

	    for (int j=0; j < count; j++)
	    {
		if ((j % 2) == 0) uw_byte = next_uw_byte(&uh);

		unsigned char byte = uw_byte;

		if ((j % 2) == 0) byte >>= 4;
		else              byte &= 0xf;

		if (byte != 0xf) /* HOLE */
		{
                    _Unwind_Reg_Id id = id_from_F4(byte);
		    reg_buf->core[id] = *(vsp-j);

	            #ifdef DEBUG_UW_INSTRS
		    printf("PUW: POP: %s = *SP[-%d] (*(%#x) == %#x)\n", 
			   name_from_id(id), j, vsp - j, *(vsp - j));
                    #endif /* DEBUG_UW_INSTRS */
		}
	    }
	}

        /*-------------------------------------------------------------------*/
        /* 1101 0000 -> MV FP, SP					     */
        /*-------------------------------------------------------------------*/
	else if (uw_byte == 0xd0)
	{
	    regb_core_get(context, _UR_FP, &rval);
	    regb_core_set(context, _UR_SP, rval);

	    #ifdef DEBUG_UW_INSTRS
	    printf("PUW: MOV FP, SP\n");
	    #endif /* DEBUG_UW_INSTRS */

	    sp_restored_from_fp = true;
	}

        /*-------------------------------------------------------------------*/
        /* 1101 0001 __c6xabi_pop_rts					     */
        /*-------------------------------------------------------------------*/
	else if (uw_byte == 0xd1)
	{
	    regb_core_get(context, _UR_SP, &rval);

            /*---------------------------------------------------------------*/
            /* Stack is aligned to 64-bits, so stack usage is 56 bytes.      */
            /*---------------------------------------------------------------*/
	    regb_core_set(context, _UR_SP, rval + 56);

            #ifdef DEBUG_UW_INSTRS
	    printf("PUW: __c6xabi_pop_rts, "
                   "implicit SP += 56 [%#x], "
                   "POP all SOE, ", rval + 56);
            #endif /* DEBUG_UW_INSTRS */

	    _Unwind_Register_Buffer *reg_buf = 
		(_Unwind_Register_Buffer *)context;      
	    _UINT32 *vsp = (_UINT32 *)reg_buf->core[_UR_SP];

            /*---------------------------------------------------------------*/
            /* This is the order that __c6xabi_push_rts saves the registers, */
            /* starting at the old value of SP and decrementing as it goes.  */
            /*---------------------------------------------------------------*/
            #if defined(_BIG_ENDIAN)
            const unsigned char POP_RTS_ORDER[] =
                {
                    _UR_B14,
                    _UR_A14, _UR_A15,
                    _UR_B12, _UR_B13,
                    _UR_A12, _UR_A13,
                    _UR_B10, _UR_B11,
                    _UR_A10, _UR_A11,
                    _UR_B2,  _UR_B3
                };
	    #else
            const unsigned char POP_RTS_ORDER[] =
                {
                    _UR_B14,
                    _UR_A15, _UR_A14,
                    _UR_B13, _UR_B12,
                    _UR_A13, _UR_A12,
                    _UR_B11, _UR_B10,
                    _UR_A11, _UR_A10,
                    _UR_B3,  _UR_B2
                };
	    #endif

            size_t count = sizeof(POP_RTS_ORDER) / sizeof(*POP_RTS_ORDER);

            for (size_t i=0; i < count; i++)
                reg_buf->core[POP_RTS_ORDER[i]] = *vsp--;

	    regb_core_get(context, _UR_RETA, &rval);
	    regb_core_set(context, _UR_PC, rval);

            #ifdef DEBUG_UW_INSTRS
	    printf("RET B3 [%#x]\n", rval);
            #endif /* DEBUG_UW_INSTRS */

	    break;
	}

        /*-------------------------------------------------------------------*/
        /* 1101 0010 xxxx ... -> SP += (ULEB128 << 3) + 0x408 [0x408-max]    */
        /*-------------------------------------------------------------------*/
	else if (uw_byte == 0xd2)
	{
	    _UINT32 sp_inc_bits = read_uleb128(&uh);
            _UINT32 addend = (sp_inc_bits << 3) + 0x408;
	    regb_core_get(context, _UR_SP, &rval);
	    regb_core_set(context, _UR_SP, rval + addend);

	    #ifdef DEBUG_UW_INSTRS
	    printf("PUW: SP += (%u << 3) + 0x408, [%#x]\n", 
		   sp_inc_bits, rval + addend);
	    #endif /* DEBUG_UW_INSTRS */
	}

	/*-------------------------------------------------------------------*/
	/* If we get here, the instruction is spare/invalid                  */
	/*-------------------------------------------------------------------*/
	else
	{
	    #ifdef DEBUG_UW_INSTRS
	    printf("PUW: Instr not supported [%#x]\n", uw_byte);
	    #endif /* DEBUG_UW_INSTRS */
	    return _URC_FAILURE;
	}
    }

    #ifdef DEBUG_UW_INSTRS
    printf("PUW: Leaving process_unwind\n");
    #endif /* DEBUG_UW_INSTRS */

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

    if (index > _UR_REG_LAST) return _URB_Failure;

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

    if (index > _UR_REG_LAST) return _URB_Failure;

    reg_buf->core[index] = val;

    return _URB_Success;
}

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
    printf("UW: EHT First Word %08x, PR %d\n", 
	    eht_first_word, (eht_first_word & 0x0f000000) >> 24);
    fflush(stdout);
    #endif /* DEBUG_UNWINDER */

    /*-----------------------------------------------------------------------*/
    /* If MSB==1, Bits 27-24 contain index of PR used                        */
    /*-----------------------------------------------------------------------*/
    if ((eht_first_word & 0x80000000) != 0)
    {
        #ifdef DEBUG_UNWINDER
        printf("UW: (Compact) EHT First Word %08x, PR %d\n", 
               eht_first_word, (eht_first_word & 0x0f000000) >> 24);
        #endif /* DEBUG_UNWINDER */

	switch ((eht_first_word & 0x0f000000) >> 24)
	{
	    case 0: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__c6xabi_unwind_cpp_pr0;
		break;
	    case 1: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__c6xabi_unwind_cpp_pr1;
		break;
	    case 2: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__c6xabi_unwind_cpp_pr2;
		break;
	    case 3: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__c6xabi_unwind_cpp_pr3;
		break;
	    case 4: 
		uexcep->unwinder_data.pr_addr = 
					    (_UINT32)&__c6xabi_unwind_cpp_pr4;
		break;
	    default:
		return false;
	}
    }
    /*-----------------------------------------------------------------------*/
    /* If MSB==0, Bits 30-0 contain the PR offset, conv from segrel to abs   */
    /*-----------------------------------------------------------------------*/
    else
    {
	uexcep->unwinder_data.pr_addr =__TI_prel2abs(uexcep->pr_data.eht_start);
    #ifdef DEBUG_UNWINDER
    printf("UW: (Generic) EHT First Word %08x, (addr %08x)\n", 
	   eht_first_word, uexcep->unwinder_data.pr_addr);
    #endif /* DEBUG_UNWINDER */

    }

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
/*****************************************************************************/
_UINT32 __TI_targ_regbuf_get_sb(_Unwind_Context *context)
{
    _Unwind_Register_Buffer *regbuf = (_Unwind_Register_Buffer*)context;
    return regbuf->core[_UR_DP];
}

/*****************************************************************************/
/*                                                                           */
/* __TI_targ_rtti_address - Return address of referenced typeinfo object     */
/*                                                                           */
/*****************************************************************************/
_UINT32 __TI_targ_rtti_address(_UINT32 offset, _Unwind_Context *context)
{
    return offset + __TI_targ_regbuf_get_sb(context);
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
    regbuf->core[_UR_ARG1] = val;
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

/*****************************************************************************/
/*  tdeh_cpp_abi.cpp v8.1.3                                                  */
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
/*  Implements the Generic C++ ABI - Exception Handling interface functions  */
/*  required by Table-Driven Exception Handling                              */
/*                                                                           */
/*  Note:                                                                    */
/*  1. No support for catching/rethrowing foreign (non-C++) exceptions       */
/*  2. No support for nested simultaneous propagations i.e. throws from      */
/*     cleanup not required for C++ because throws from a cleanup result in  */
/*     call to __cxa_call_terminate via CATCH_ALL_AND_TERMINATE descriptor   */
/*                                                                           */
/*****************************************************************************/

#if __EXCEPTIONS && defined(__TI_TABLE_DRIVEN_EXCEPTIONS)

#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <typeinfo>
#include <exception>	// for bad_cast and bad_typeid
#include <new>		// for bad_alloc

#include <_tls.h>

#ifdef __EDG_IA64_ABI
#include "cxxabi.h"
#endif /* __EDG_IA64_ABI */
#include "tdeh_common.h"

#if defined(DEBUG_CPPABI)
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#endif

#include "basics.h"	// Has to be included before error.h, for EXTERN_C
#include "error.h"	// for __abort_execution
#include "rtti.h"       // for __derived_to_base_conversion

#define EXCEPTIONS_CLASS "TI  C++\0"

typedef void *(*_dtor_ptr)   (void *);
typedef void  (*_handler_ptr)(void);


/*****************************************************************************/
/*                                                                           */
/* __cxa_exception - Used to store information about an exception as it is   */
/*                   being handled (CE - cxa_exception)                      */
/*                   exception_type - Type of the exception thrown           */
/*                   exception_dtor - Destructor for exception obj (if any)  */
/*                   unexp_handler  - Unexpected handler in force when the   */
/*                                    exception was thrown                   */
/*                   term_handler   - Terminate handler in force when the    */
/*                                    exception was thrown                   */
/*                   handler_count  - Number of handlers the CE is caught in */
/*                   exception_rethrown - =1 if the exception is rethrown    */
/*                   unwind_header  - Struct used to store Unwind info       */
/*                                                                           */
/*****************************************************************************/
struct __cxa_exception
{ 
    std::type_info          *exception_type;
    _dtor_ptr                exception_dtor; 
    std::unexpected_handler  unexp_handler;
    std::terminate_handler   term_handler;
    __cxa_exception         *next_exception;
    _UINT32		     handler_count;
    _UINT32		     exception_rethrown;
    _Unwind_Exception	     unwind_header;
};


/*****************************************************************************/
/*                                                                           */
/* __cxa_eh_globals - Used to store exception related information, one of    */
/*                    these structs exists per-thread                        */
/*                    caught_exceptions - List of exceptions being handled   */
/*                    cleanup_exception - Used to store a ptr to the UE      */
/*                                        during dtor calls in landing pad   */
/*                    handler           - Ptr to function to be called by    */
/*                                        terminate/unexpected               */
/*                    unexp_handler     - Global unexpected handler          */
/*                    term-handler      - Global terminate handler           */
/*                    emergency_buffer  - Space to throw bad_alloc if we run */
/*                                        out of memory                      */
/*                    terminate_called  - True if terminate was called       */
/*                                                                           */
/*****************************************************************************/
struct __cxa_eh_globals
{
    __cxa_exception         *caught_exceptions;
    __cxa_exception         *cleanup_exception;
    _UINT32	             uncaught_exceptions;
    _handler_ptr             handler; 
    std::unexpected_handler  unexp_handler;
    std::terminate_handler   term_handler;
    void	            *emergency_buffer;
    bool	             terminate_called;
};



extern "C"
{

/*****************************************************************************/
/* C++ EH Helper Functions defined in this file                              */
/*****************************************************************************/
void *__cxa_allocate_exception(size_t);
void  __cxa_free_exception    (void *);

void __cxa_throw  (void *, std::type_info *, _dtor_ptr);
void __cxa_rethrow();

void *__cxa_begin_catch(_Unwind_Exception *);
void  __cxa_end_catch  ();

bool __cxa_begin_cleanup(_Unwind_Exception *);
void __cxa_end_cleanup  (void);
_Unwind_Exception *__TI_cxa_end_cleanup();

bool __cxa_type_match(_Unwind_Exception *, const std::type_info *, void **);

const std::type_info *__cxa_current_exception_type();

void __cxa_call_terminate (_Unwind_Exception *);
void __cxa_call_unexpected(_Unwind_Exception *);

__cxa_eh_globals *__cxa_get_globals();

void __cxa_bad_cast  ();
void __cxa_bad_typeid();

/*****************************************************************************/
/* EXTERNS used by the implementation                                        */
/*****************************************************************************/
_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *);

#if defined(DEBUG_CPPABI) || defined(DEBUG_TM)
int printf(const char *, ...);
#endif

void *memcpy(void *s1, const void *s2, size_t n);


}

/*****************************************************************************/
/* _Emergency_Buffer - layout of struct used to throw a bad_alloc            */
/*****************************************************************************/
struct _Emergency_Buffer
{
    __cxa_exception ce;
    std::bad_alloc  ba;
    bool            used;
};


/*****************************************************************************/
/* STATICS                                                                   */
/*****************************************************************************/
static void __TI_default_term_handler(void);
static void __TI_default_unexp_handler(void);
static void __TI_setup_handler_and_call_terminate(_Unwind_Exception *ue);

static void *__TI_eb_init   ();
static void *__TI_eb_acquire(size_t thrown_size);
static bool  __TI_eb_release(__cxa_exception *ce);

/*---------------------------------------------------------------------------*/
/* Each thread will maintain its own exception stack via a thread-local      */
/* EH_GLOBAL_PTR (the pointer to the stack header).                          */
/*---------------------------------------------------------------------------*/
__TI_TLS_DATA_DEF(static, __cxa_eh_globals *, EH_GLOBAL_PTR, NULL);


/*****************************************************************************/
/*                                                                           */
/* __cxa_get_globals - Returns a ptr to the __cxa_eh_globals struct          */
/*                     Allocates space if required                           */
/*                                                                           */
/*****************************************************************************/
__cxa_eh_globals *__cxa_get_globals()
{
    if (!EH_GLOBAL_PTR)
    {
	EH_GLOBAL_PTR = (__cxa_eh_globals *)malloc(sizeof(__cxa_eh_globals));

        if (!EH_GLOBAL_PTR) __abort_execution(ec_abort_header);

	EH_GLOBAL_PTR->caught_exceptions   = NULL;
	EH_GLOBAL_PTR->uncaught_exceptions = 0;
	EH_GLOBAL_PTR->handler             = NULL;

	/*-------------------------------------------------------------------*/
	/* Set up default terminate and unexpected handlers                  */
	/*-------------------------------------------------------------------*/
	EH_GLOBAL_PTR->term_handler        = __TI_default_term_handler;
	EH_GLOBAL_PTR->unexp_handler       = __TI_default_unexp_handler;

	/*-------------------------------------------------------------------*/
	/* Allocate space for the emergency buffer                           */
	/*-------------------------------------------------------------------*/
	EH_GLOBAL_PTR->emergency_buffer    = __TI_eb_init();

	EH_GLOBAL_PTR->terminate_called    = false;
    }

    return EH_GLOBAL_PTR;
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_allocate_exception - Storage reqd for exception processing is       */
/*                            allocated on the heap.                         */
/*                                                                           */
/*****************************************************************************/
void *__cxa_allocate_exception(size_t thrown_size)
{
    size_t space_required = sizeof(__cxa_exception) + thrown_size;

    #ifdef DEBUG_CPPABI
    printf("CA: Allocing %"PRIdMAX" + %"PRIdMAX" bytes\n",
           (uintmax_t)sizeof(__cxa_exception), (uintmax_t)thrown_size);
    #endif /* DEBUG_CPPABI */

    /*-----------------------------------------------------------------------*/
    /* Allocate space for the exception object                               */
    /*-----------------------------------------------------------------------*/
    __cxa_exception *ce = (__cxa_exception *)malloc(space_required);

    /*-----------------------------------------------------------------------*/
    /* If space is null, try emergency buffer                                */
    /*-----------------------------------------------------------------------*/
    if (!ce) ce = (__cxa_exception *)__TI_eb_acquire(thrown_size);
	
    /*-----------------------------------------------------------------------*/
    /* If no space there, call terminate()                                   */
    /*-----------------------------------------------------------------------*/
    if (!ce)
    {
        #ifdef DEBUG_CPPABI
        printf("CA: allocate_exception calling __TI_setup_handler_and_call_terminate\n");
        #endif /* DEBUG_CPPABI */

        __TI_setup_handler_and_call_terminate(NULL);           
    }

    /*-----------------------------------------------------------------------*/
    /* Init fields in case copy ctor for throw object raises an exception    */
    /*-----------------------------------------------------------------------*/
    ce->exception_type = NULL;
    ce->exception_dtor = NULL;

    /*-----------------------------------------------------------------------*/
    /* Save current unexpected, terminate handlers in cxa_exception          */
    /*-----------------------------------------------------------------------*/
    __cxa_eh_globals *ceg = __cxa_get_globals();
    ce->unexp_handler = ceg->unexp_handler;
    ce->term_handler  = ceg->term_handler;

    ce->handler_count      = 0;
    ce->exception_rethrown = 0;

    /*-----------------------------------------------------------------------*/
    /* Set exception_class  - "TI  C++\0" */
    /*-----------------------------------------------------------------------*/
    _Unwind_Exception *ue = &ce->unwind_header;
    memcpy((void *)&ue->exception_class, EXCEPTIONS_CLASS, 
	    sizeof(ue->exception_class));

    /*-----------------------------------------------------------------------*/
    /* Return ptr to thrown exception area                                   */
    /*-----------------------------------------------------------------------*/
    return ce + 1;
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_free_exception - Free storage allocated for exception processing    */
/*                                                                           */
/*****************************************************************************/
void __cxa_free_exception(void *thrown_exception)
{
    __cxa_exception *ce = (__cxa_exception *)thrown_exception - 1;

    /*-----------------------------------------------------------------------*/
    /* If storage was obtained from emergency buff, release it & return      */
    /*-----------------------------------------------------------------------*/
    if (__TI_eb_release(ce)) return;

    free(ce);
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_throw - Begin handling an exception, starts the unwinding process   */
/*                                                                           */
/*****************************************************************************/
void __cxa_throw(void *thrown_exception, std::type_info *tinfo, _dtor_ptr dtor)
{
    #ifdef DEBUG_CPPABI
    printf("CA: __cxa_throw ====================================\n");
    #endif /* DEBUG_CPPABI */

    /*-----------------------------------------------------------------------*/
    /* Obtain CE, UE address from thrown_exception                           */
    /*-----------------------------------------------------------------------*/
    __cxa_exception *ce = (__cxa_exception *)thrown_exception - 1;

    _Unwind_Exception *ue = &ce->unwind_header;

    __cxa_eh_globals *ehg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* Save typeinfo, dtor in cxa_exception header                           */
    /*-----------------------------------------------------------------------*/
    #ifdef DEBUG_CPPABI
    printf("CA: Setting exception RTTI to %p (%s)\n", tinfo, tinfo->name());
    #endif /* DEBUG_CPPABI */

    ce->exception_type = tinfo;
    ce->exception_dtor = dtor;

    /*-----------------------------------------------------------------------*/
    /* Increment uncaught_exception                                          */
    /*-----------------------------------------------------------------------*/
    ehg->uncaught_exceptions++;

    /*-----------------------------------------------------------------------*/
    /* Call _Unwind_RaiseException, with ptr to _Unwind_Exception as parm    */
    /*-----------------------------------------------------------------------*/
    _Unwind_RaiseException(ue);

    #ifdef DEBUG_CPPABI
    printf("CA: _Unwind_RaiseException(%p) returned!\n", ue);
    printf("CA: throw calling __TI_setup_handler_and_call_terminate\n");
    #endif /* DEBUG_CPPABI */

    /*-----------------------------------------------------------------------*/
    /* Call terminate if we get here                                         */
    /*-----------------------------------------------------------------------*/
    __cxa_call_terminate(ue);

}


/*****************************************************************************/
/*                                                                           */
/* __cxa_rethrow - The exception on top of the exception "stack" is raised,  */
/*                 if no such exception, terminate                           */
/*                                                                           */
/*****************************************************************************/
void __cxa_rethrow()
{
    /*-----------------------------------------------------------------------*/
    /* Get the exception on top of the stack                                 */
    /*-----------------------------------------------------------------------*/
    __cxa_eh_globals *ceg = __cxa_get_globals();
    __cxa_exception  *ce  = ceg->caught_exceptions;

    /*-----------------------------------------------------------------------*/
    /* If there is no exception, call terminate                              */
    /*-----------------------------------------------------------------------*/
    if (ce == NULL) 
    {
        #ifdef DEBUG_CPPABI
        printf("CA: Rethrow calling __TI_setup_handler_and_call_terminate (1)\n");
        #endif /* DEBUG_CPPABI */

        __TI_setup_handler_and_call_terminate(NULL); 
    }

    _Unwind_Exception *ue = &ce->unwind_header;

    #ifdef DEBUG_CPPABI
    printf("CA: Rethrowing exception UE @ %p, type @ %p\n",
	    ue, ce->exception_type);
    #endif /* DEBUG_CPPABI */

    ceg->uncaught_exceptions++;

    /*-----------------------------------------------------------------------*/
    /* Set rethrown ==1 so prevent end_catch from calling dtor,freeing space */
    /*-----------------------------------------------------------------------*/
    ce->exception_rethrown = 1;

    /*-----------------------------------------------------------------------*/
    /* Start unwinding, will not return unless there is an error             */
    /*-----------------------------------------------------------------------*/
    _Unwind_RaiseException(ue);

    #ifdef DEBUG_CPPABI
    printf("CA: _Unwind_RaiseException(%p) returned!\n", ue);
    printf("CA: Rethrow calling __TI_setup_handler_and_call_terminate (2)\n");
    #endif /* DEBUG_CPPABI */

    /*-----------------------------------------------------------------------*/
    /* If we get here, terminate                                             */
    /*-----------------------------------------------------------------------*/
    __cxa_call_terminate(ue);
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_begin_catch - Called on entry into a handler (including terminate,  */
/*                     unexpected handlers)                                  */
/*                                                                           */
/*****************************************************************************/
void *__cxa_begin_catch(_Unwind_Exception *ue)
{

    __cxa_exception *ce = ((__cxa_exception *)((_UINT8 *)(ue) 
			         - offsetof(__cxa_exception, unwind_header)));

    /*-----------------------------------------------------------------------*/
    /* Increment the exception's handler count                               */
    /*-----------------------------------------------------------------------*/
    ce->handler_count++;

    #ifdef DEBUG_CPPABI
    printf("CA: begin_catch, pushing exception UE @ %p, type @ %p\n",
	    ue, ce->exception_type);
    #endif /* DEBUG_CPPABI */

    /*-----------------------------------------------------------------------*/
    /* Place the exception on the stack of currently caught exceptions       */
    /*-----------------------------------------------------------------------*/
    __cxa_eh_globals *ceg = __cxa_get_globals();

    ce->next_exception = ceg->caught_exceptions;
    ceg->caught_exceptions = ce;

    /*-----------------------------------------------------------------------*/
    /* Reset rethrown field so the dtor can be called, and ce freed by       */ 
    /* __cxa_end_catch                                                       */ 
    /*-----------------------------------------------------------------------*/
    ce->exception_rethrown = 0;

    /*-----------------------------------------------------------------------*/
    /* Decrements the uncaught_exception count                               */
    /*-----------------------------------------------------------------------*/
    ceg->uncaught_exceptions--;

    /*-----------------------------------------------------------------------*/
    /* Returns a pointer to the thrown exception (Saved by the PR in         */
    /* _Unwind_Exception)                                                    */
    /*-----------------------------------------------------------------------*/
    #pragma diag_suppress 1107
    return (void *)(uintptr_t)ue->barrier_data.data[0];
    #pragma diag_default 1107
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_end_catch - Called upon exit from a handler for any reason          */
/*                                                                           */
/*****************************************************************************/
void __cxa_end_catch()
{

    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* Locate most recently caught exception and decrement its handler count */
    /*-----------------------------------------------------------------------*/
    __cxa_exception *most_recent_ce = ceg->caught_exceptions;
    most_recent_ce->handler_count--;

    void *thrown_exception = (void *)(most_recent_ce + 1);

    if (most_recent_ce->handler_count == 0)
    {
	/*-------------------------------------------------------------------*/
	/* Remove the exception from the caught exceptions stack, if the     */
	/* handler count is zero                                             */
	/*-------------------------------------------------------------------*/
	ceg->caught_exceptions = most_recent_ce->next_exception;
	most_recent_ce->next_exception = NULL;

	/*-------------------------------------------------------------------*/
	/* Destroy the exception if handler count ==0, and if the exception  */
	/* was not rethrown. Exception Object destroyed by calling the dtor  */
	/* on the thrown object, and calling __cxa_free_exception            */
	/*-------------------------------------------------------------------*/
	if (most_recent_ce->exception_rethrown == 0)
	{
	    if (most_recent_ce->exception_dtor != NULL)
	    {
		/*-----------------------------------------------------------*/
		/* If dtor throws, propagate the exception raised by dtor    */
		/*-----------------------------------------------------------*/
		try
		{
		    (most_recent_ce->exception_dtor)(thrown_exception);
		}
		catch (...)
		{
		    __cxa_free_exception(thrown_exception);
		    throw;
		}
	    }
	    __cxa_free_exception(thrown_exception);
	}
    }
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_begin_cleanup - Save the CE corresp. to UE to use by end cleanup    */
/*                                                                           */
/*****************************************************************************/
bool __cxa_begin_cleanup(_Unwind_Exception *ue)
{
    __cxa_exception  *ce  = ((__cxa_exception *)((_UINT8 *)(ue) 
			         - offsetof(__cxa_exception, unwind_header)));

    __cxa_eh_globals *ceg = __cxa_get_globals();
    ceg->cleanup_exception = ce;

    #ifdef DEBUG_CPPABI
    printf("CA: In begin cleanup with UE @ %p\n", ue);
    #endif /* DEBUG_CPPABI */

    return true;
}


/*****************************************************************************/
/*                                                                           */
/* __TI_cxa_end_cleanup - Called from __cxa_end_cleanup. Returns UE corresp. */
/*                        to CE saved by __cxa_begin_cleanup                 */
/*                                                                           */
/*****************************************************************************/
_Unwind_Exception *__TI_cxa_end_cleanup()
{
    __cxa_eh_globals *ceg = __cxa_get_globals();
    __cxa_exception  *ce  = ceg->cleanup_exception;

    #ifdef DEBUG_CPPABI
    printf("CA: In end cleanup with UE @ %p\n", &ce->unwind_header);
    #endif /* DEBUG_CPPABI */

    return &ce->unwind_header;
}


#ifdef __EDG_IA64_ABI
/*****************************************************************************/
/* Static helper functions used by __cxa_type_match, based on                */
/* Generic C++ ABI, Sec 2.9, RTTI                                            */
/*****************************************************************************/
INLINE static bool is_similar(const std::type_info *t1, 
			      const std::type_info *t2)
{
    return (t1 == t2 || t1->name() == t2->name());
}


INLINE static bool any_qualifier_missing(_UINT32 tp1_quals, 
					 _UINT32 tp2_quals)
{
    return ((~tp1_quals & tp2_quals) != 0);
}


INLINE static bool is_const(_UINT32 quals)
{
    return ((quals & abi::__pbase_type_info::__const_mask) != 0);
}

INLINE static _UINT32 cv_quals_of_pointee(const std::type_info *tinfo)
{
    return (((const abi::__pbase_type_info *)tinfo)->__flags &
		                (abi::__pbase_type_info::__const_mask | 
		                 abi::__pbase_type_info::__volatile_mask));
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_type_match - Returns true if the thrown type can be caught by the   */
/*                    handler (using handler_type)                           */
/*                                                                           */
/*****************************************************************************/
bool __cxa_type_match(_Unwind_Exception     *ue, 
		      const std::type_info  *handler_type, 
		      void                 **matched_object)
{
    __cxa_exception *ce = ((__cxa_exception *)((_UINT8 *)(ue) 
			         - offsetof(__cxa_exception, unwind_header)));
    
    const std::type_info *throw_type = ce->exception_type;
    void *thrown_object  = ce + 1;
    void *current_object = thrown_object;            /* copy for ptr chasing */

    bool previous_qualifiers_include_const = true;
    bool is_reference_type                 = false;  /* will be passed as parm
							in v2.0 of EH ABI */

    #ifdef DEBUG_TM
    printf("TM: Comparing TT @ %p with HT @ %p\n", throw_type, handler_type);
    #endif /* DEBUG_TM */

    const std::type_info *ptr_type_info = &typeid(abi::__pointer_type_info);

    /*-----------------------------------------------------------------------*/
    /* Loop to handle multi-level pointers                                   */
    /*-----------------------------------------------------------------------*/
    _UINT32 ptr_level = 0;
    while (true)
    {
	/*-------------------------------------------------------------------*/
	/* Check for identical types                                         */
	/*-------------------------------------------------------------------*/
	if (is_similar(throw_type, handler_type))
	{
	    #ifdef DEBUG_TM
	    printf("TM: Types matched\n");
	    #endif /* DEBUG_TM */
	    *matched_object = thrown_object;
	    return true;
	}
	
	#ifdef DEBUG_TM
	printf("TM: TT = %s [%p], HT = %s\n", 
               throw_type->name(), throw_type->name(), handler_type->name());
	#endif /* DEBUG_TM */

	const std::type_info *type_throw_type   = &typeid(*throw_type);
	const std::type_info *type_handler_type = &typeid(*handler_type);

	#ifdef DEBUG_TM
	printf("TM: T_TT = %s, T_HT = %s\n", 
		type_throw_type->name(), type_handler_type->name());
	#endif /* DEBUG_TM */

	/*-------------------------------------------------------------------*/
	/* If one type is a ptr, and the other is not, no match              */
	/*-------------------------------------------------------------------*/
	if ((is_similar(type_throw_type, ptr_type_info) || 
	     is_similar(type_handler_type, ptr_type_info)) &&
	    !is_similar(type_throw_type, type_handler_type))
	{
	    #ifdef DEBUG_TM
	    printf("TM: No match, ptr/non-ptr types\n");
	    #endif /* DEBUG_TM */
	    return false;
	}

	/*-------------------------------------------------------------------*/
	/* both are pointers or neither is                                   */
	/*-------------------------------------------------------------------*/
	if (is_similar(type_throw_type, ptr_type_info))
	{
	    ptr_level++;
	    _UINT32 h_cvquals = cv_quals_of_pointee(handler_type); 
	    _UINT32 t_cvquals = cv_quals_of_pointee(throw_type);

	    /*---------------------------------------------------------------*/
	    /* 15.3/3 match if throw type can be converted into handler type */
	    /* by standard pointer conversion/qualification conversion       */
	    /* 4.4/1, "ptr to cv1 T" can be converted to "ptr to cv2 T" if   */
	    /* cv2 is more qualified than cv1                                */
	    /* => handler type should be atleast as qualified as thrown type */
	    /*                                                               */
	    /* If there are quals not in H, present in T, no match           */
	    /*---------------------------------------------------------------*/
	    if (any_qualifier_missing(h_cvquals, t_cvquals)) 
	    {
		#ifdef DEBUG_TM
		printf("TM: Match failed, qualifiers missing from handler\n");
		#endif /* DEBUG_TM */
		return false;
	    }

	    /*---------------------------------------------------------------*/
	    /* Conversion from TT to HT (ISO 4.4/4)                          */
	    /*  TT - cv(1,0) ptr to cv(1,1) ... ptr to cv(1,n) T1            */
	    /*  HT - cv(2,0) ptr to cv(2,1) ... ptr to cv(2,n) T2            */
	    /*  - T1 and T2 are similar types                                */
	    /*  - for every j>0, if const in cv(1,j), const is in cv(2,j)    */
	    /*  - if cv(1,j) and cv(2,j) are different, const in every       */
	    /*    cv(2,k) for 0<k<j                                          */
	    /*  e.g. TT - int **, HT int volatile * const * will match       */
	    /*  e.g. TT - int **, HT int volatile ** will NOT match          */
	    /*                                                               */
	    /* If there are quals not in t, present in h, check for const    */
	    /*---------------------------------------------------------------*/
	    if (any_qualifier_missing(t_cvquals, h_cvquals) && 
		    !previous_qualifiers_include_const) 
	    {
		#ifdef DEBUG_TM
		printf("TM: Match failed, qualifiers differ(no prev const)\n");
		#endif /* DEBUG_TM */
		return false;
	    }

	    /*---------------------------------------------------------------*/
	    /* If handler type at this point does not contain a const        */
	    /* qualifer, every cv that follows in the types of TT and HT     */
	    /* should match                                                  */
	    /*---------------------------------------------------------------*/
	    if (!is_const(h_cvquals)) 
		previous_qualifiers_include_const = false;

	    throw_type = 
		    ((const abi::__pbase_type_info *)throw_type)->__pointee;
	    handler_type = 
		    ((const abi::__pbase_type_info *)handler_type)->__pointee;

	    /*---------------------------------------------------------------*/
	    /* Dereference the ptr stored in the thrown exception area       */
	    /*---------------------------------------------------------------*/
	    if (current_object != NULL) 
		current_object = *(void **)current_object;

	    continue;
	}

	/*-------------------------------------------------------------------*/
	/* For single level pointers, throw type T* will match handler type  */
	/* void*  - we have already                                          */
	/* stripped the ptr type, check if handler type is void              */
	/*-------------------------------------------------------------------*/
	if (ptr_level == 1 && is_similar(handler_type, &typeid(void)))
	{
	    if (is_reference_type)
	    {
		return false;
	    }
	    else
	    {
		#ifdef DEBUG_TM
		printf("TM: Matched void *\n");
		#endif /* DEBUG_TM */
		*matched_object = thrown_object;
		return true;
	    }
	}

	#ifdef DEBUG_TM
	printf("TM: Before D2B, TT = %s, HT = %s\n", 
		throw_type->name(), handler_type->name());
	#endif /* DEBUG_TM */
	/*-------------------------------------------------------------------*/
	/* Check if derived to base conversion can be performed from thrown  */
	/* type to handler type                                              */
	/*-------------------------------------------------------------------*/
	void *base_object;
	if ((ptr_level == 0 || (ptr_level == 1 && !is_reference_type)) &&
	    (is_similar(type_throw_type, &typeid(abi::__si_class_type_info)) ||
	     is_similar(type_throw_type, &typeid(abi::__vmi_class_type_info))
	    )
	   )
	{
	    #ifdef DEBUG_TM
	    printf("TM: Trying derived to base conversion\n");
	    #endif /* DEBUG_TM */
	    if (__derived_to_base_conversion(&current_object, &base_object, 
                                             (a_type_info_impl_ptr)throw_type,
                                             (a_type_info_impl_ptr)handler_type,
                                             NULL, 0))
	    {
		if (ptr_level == 0) *matched_object = base_object;
		else                *matched_object = thrown_object;
		return true;
	    }
	}

	/*-------------------------------------------------------------------*/
	/* If we get here, the types do not match, no conversions possible   */
	/*-------------------------------------------------------------------*/
	#ifdef DEBUG_TM
	printf("TM: No match, types differ\n");
	#endif /* DEBUG_TM */
	return false;
    }
}

#endif /* __EDG_IA64_ABI */

/*****************************************************************************/
/*                                                                           */
/* __cxa_current_exception_type - Return the type of the current exception   */
/*                                                                           */
/*****************************************************************************/
const std::type_info *__cxa_current_exception_type()
{
    __cxa_eh_globals *ceg = __cxa_get_globals();
    __cxa_exception  *ce  = ceg->caught_exceptions;

    if (ce == NULL) return NULL;

    return ce->exception_type;
}


/*****************************************************************************/
/*                                                                           */
/* __cxa_call_terminate - Calls terminate after setting up the right handler */
/*                                                                           */
/*****************************************************************************/
void __cxa_call_terminate(_Unwind_Exception *ue)
{ 
    /*-----------------------------------------------------------------------*/
    /* We are in a handler, call begin catch to mark exception as caught     */
    /*-----------------------------------------------------------------------*/
    if (ue != NULL) __cxa_begin_catch(ue);

    /*-----------------------------------------------------------------------*/
    /* Does not return                                                       */
    /*-----------------------------------------------------------------------*/
    #ifdef DEBUG_CPPABI
    printf("CA: call_terminate calling __TI_setup_handler_and_call_terminate\n");
    #endif /* DEBUG_CPPABI */

    __TI_setup_handler_and_call_terminate(ue);
}


/*****************************************************************************/
/*                                                                           */
/* __TI_setup_handler_and_call_terminate - Used to set up a terminate handler*/
/*                                         and call std::terminate()         */
/*                                                                           */
/*****************************************************************************/
static void __TI_setup_handler_and_call_terminate(_Unwind_Exception *ue)
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    #if defined(DEBUG_CPPABI)
    printf("CA: __TI_setup_handler_and_call_terminate with UE @ %p\n", ue);
    #endif

    /*-----------------------------------------------------------------------*/
    /* Set up the handler to call in std::terminate. If UE is valid, use the */
    /* handler specified in the CE, else use the global terminate handler    */
    /*-----------------------------------------------------------------------*/
    if (ue != NULL)
    {
	__cxa_exception *ce = ((__cxa_exception *)((_UINT8 *)(ue) 
			         - offsetof(__cxa_exception, unwind_header)));
	ceg->handler = ce->term_handler;
    }
    else
	ceg->handler = ceg->term_handler;

    /*-----------------------------------------------------------------------*/
    /* This field is used by std::uncaught_exception()                       */
    /*-----------------------------------------------------------------------*/
    ceg->terminate_called = true;

    /*-----------------------------------------------------------------------*/
    /* Does not return                                                       */
    /*-----------------------------------------------------------------------*/
    std::terminate();
}


#if defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
/*****************************************************************************/
/*                                                                           */
/* std::terminate - Called by the impl. when exception handling must be      */
/*                  must be abandoned for any of several reasons. May also   */
/*                  be called directly by the application                    */
/*                  ISO/IEC 14882:1998(E) 18.6.3.3                           */
/*                                                                           */
/*****************************************************************************/
void std::terminate(void)
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* If a handler has been set up, call it. Else, call the global handler  */
    /*-----------------------------------------------------------------------*/
    if (ceg->handler != NULL)
    {
        #if defined(DEBUG_CPPABI)
        printf("CA: calling terminate handler %#"PRIxMAX"\n", 
               (uintmax_t)ceg->handler);
        #endif

	_handler_ptr func_to_call = ceg->handler;
	ceg->handler = NULL;
	func_to_call();
    }
    else
	ceg->term_handler();

    /*-----------------------------------------------------------------------*/
    /* If the terminate handler returns, call abort                          */
    /*-----------------------------------------------------------------------*/
    __abort_execution(ec_terminate_called);
}


/*****************************************************************************/
/*                                                                           */
/* std::set_terminate - Set up terminate handler that will be called         */
/*                      ISO/IEC 14882:1998(E) 18.6.3.2                       */
/*                                                                           */
/*****************************************************************************/
std::terminate_handler std::set_terminate(std::terminate_handler f) throw()
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* Save current terminate handler (to return)                            */
    /*-----------------------------------------------------------------------*/
    std::terminate_handler old_handler = ceg->term_handler;

    /*-----------------------------------------------------------------------*/
    /* Set terminate handler in __cxa_eh_globals to handler, f               */
    /*-----------------------------------------------------------------------*/
    ceg->term_handler = f;

    #if defined(DEBUG_CPPABI)
    printf("CA: terminate handler is now %#"PRIxMAX"\n", (intmax_t)f);
    #endif /* DEBUG_CPPABI */

    return old_handler;
}
#endif /* __TI_TABLE_DRIVEN_EXCEPTIONS */


/*****************************************************************************/
/*                                                                           */
/* __cxa_call_unexpected - This function is called when a function violates  */
/*                         its exception specification. It does not return,  */
/*                         but can throw an exception                        */
/*                                                                           */
/*****************************************************************************/
void __cxa_call_unexpected(_Unwind_Exception *ue)
{ 
    #if defined(DEBUG_CPPABI)
    printf("CA: __cxa_call_unexpected\n");
    #endif

    /*-----------------------------------------------------------------------*/
    /* Save RTTI type_info stored in barrier cache for later use             */
    /*-----------------------------------------------------------------------*/
    _UINT32  rtti_count  = ue->barrier_data.data[1];
    _UINT32  seg_base    = ue->barrier_data.data[2];
    _UINT32  rtti_stride = ue->barrier_data.data[3];
    _UINT32  rtti_base   = ue->barrier_data.data[4];

    /*-----------------------------------------------------------------------*/
    /* Get the cxa_eh_global handler, CE corresponding to UE                 */
    /*-----------------------------------------------------------------------*/
    __cxa_eh_globals *ceg = __cxa_get_globals();
    __cxa_exception  *ce  = ((__cxa_exception *)((_UINT8 *)(ue) 
			         - offsetof(__cxa_exception, unwind_header)));

    try
    {
	/*-------------------------------------------------------------------*/
	/* Call __cxa_begin_catch, since we are in a "handler"               */
	/*-------------------------------------------------------------------*/
	__cxa_begin_catch(ue);

	/*-------------------------------------------------------------------*/
	/* Set the function to call for unexpected in cxa_eh_globals, handler*/
	/*-------------------------------------------------------------------*/
	ceg->handler = ce->unexp_handler;

	/*-------------------------------------------------------------------*/
	/* Call std::unexpected(), will not return, can throw (C++ 15.5.2)   */
	/*-------------------------------------------------------------------*/
	std::unexpected();
    }
    catch (...)
    {
	/*-------------------------------------------------------------------*/
	/* Get the __cxa_exception object of the exception that was just     */
	/* thrown and caught (on top of the "stack" of exceptions)           */
	/* Can be rethrow of the same type, or a new type                    */
	/*-------------------------------------------------------------------*/
	__cxa_exception *new_ce = ceg->caught_exceptions;

	/*-------------------------------------------------------------------*/
	/* If same type, call __cxa_end_catch                                */
	/*-------------------------------------------------------------------*/
	if (ce == new_ce) 
	{
	    __cxa_end_catch();
	}
	/*-------------------------------------------------------------------*/
	/* If not same type, the new exception is on top of the stack        */
	/*-------------------------------------------------------------------*/
	else
	{
	    /*---------------------------------------------------------------*/
	    /* Remove it and call __cxa_end_catch, if dtor called from end   */
	    /* catch throws, std::call terminate()                           */
	    /*---------------------------------------------------------------*/
	    ceg->caught_exceptions = new_ce->next_exception;
	    try
	    {
		__cxa_end_catch();
	    }
	    catch (...)
	    {
                #ifdef DEBUG_CPPABI
                printf("CA: call_unexpected calling __TI_setup_handler_and_call_terminate (1)\n");
                #endif /* DEBUG_CPPABI */

		__TI_setup_handler_and_call_terminate(&new_ce->unwind_header);
	    }

	    /*---------------------------------------------------------------*/
    	    /* Put the exception back on top of the "stack"                  */
	    /*---------------------------------------------------------------*/
	    new_ce->next_exception = ceg->caught_exceptions;
	    ceg->caught_exceptions = new_ce;
	}

	/*-------------------------------------------------------------------*/
	/* Now, check if the exception thrown is permitted by the FESPEC     */
	/* using the RTTI info available                                     */
	/*-------------------------------------------------------------------*/
	void *matched;
	bool  bad_exception_found = false;
	for (_UINT32 idx=0; idx < rtti_count; idx++)
	{ 
            #pragma diag_suppress 1107
	    const std::type_info *fespec_rtti = (std::type_info *)(uintptr_t)
                (seg_base + (*(_UINT32*)(uintptr_t)(rtti_base + 
                                                    rtti_stride*idx)));
            #pragma diag_default 1107

	    #ifdef DEBUG_CPPABI
	    printf("CA: Cmp fespec rtti @ %p "
                   "(%"PRIx32" + *(%"PRIx32" + %"PRIx32"))\n",
		    fespec_rtti, seg_base, rtti_base, rtti_stride*idx);
	    #endif /* DEBUG_CPPABI */

	    /*---------------------------------------------------------------*/
	    /* If the exception is allowed, rethrow it                       */
	    /*---------------------------------------------------------------*/
	    if (__cxa_type_match(&new_ce->unwind_header,fespec_rtti,&matched))
		throw;

	    /*---------------------------------------------------------------*/
	    /* Check for std::bad_exception in FESPEC. If present, any       */
	    /* exception thrown not on the FESPEC list can be replaced by    */
	    /* bad exception (ISO/IEC 14882:1998(E) 15.5.2/3)                */
	    /*---------------------------------------------------------------*/
	    if (fespec_rtti == &typeid(std::bad_exception))
		bad_exception_found = true;
	}

	/*-------------------------------------------------------------------*/
	/* If bad_exception is present in FESPEC,throw bad_exception instead */
	/*-------------------------------------------------------------------*/
	if (bad_exception_found) throw std::bad_exception();

	/*-------------------------------------------------------------------*/
	/* If we get here, call terminate with the terminate handler set to  */
	/* that in the new exception (unexp threw exception not in FESPEC)   */
	/*-------------------------------------------------------------------*/
        #ifdef DEBUG_CPPABI
        printf("CA: call_unexpected calling __TI_setup_handler_and_call_terminate (2)\n");
        #endif /* DEBUG_CPPABI */

	__TI_setup_handler_and_call_terminate(&new_ce->unwind_header);
    
    }

}


#if defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
/*****************************************************************************/
/*                                                                           */
/* std::unexpected -  Called by the impl. when a func exits via an exception */
/*                    not allowed in the fespec. May also be called directly */
/*                    by the application ISO/IEC 14882:1998(E) 18.6.2.4      */
/*                                                                           */
/*****************************************************************************/
void std::unexpected(void)
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* If a handler has been set up, call it. Else, call the global handler  */
    /*-----------------------------------------------------------------------*/
    if (ceg->handler != NULL)
    {
	_handler_ptr func_to_call = ceg->handler;
	ceg->handler = NULL;
	func_to_call();
    }
    else
	ceg->unexp_handler();

    /*-----------------------------------------------------------------------*/
    /* If the unexpected handler returns, call abort                         */
    /*-----------------------------------------------------------------------*/
    __abort_execution(ec_terminate_called);
}


/*****************************************************************************/
/*                                                                           */
/* std::set_unexpected - Set up the unexpected handler that will be called   */
/*                       ISO/IEC 14882:1998(E) 18.6.2.3                      */
/*                                                                           */
/*****************************************************************************/
std::unexpected_handler std::set_unexpected(std::unexpected_handler f) throw()
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* Save current unexpected handler (to return)                           */
    /*-----------------------------------------------------------------------*/
    std::unexpected_handler old_handler = ceg->unexp_handler;

    /*-----------------------------------------------------------------------*/
    /* Set unexpected handler in __cxa_eh_globals to handler, f              */
    /*-----------------------------------------------------------------------*/
    ceg->unexp_handler = f;

    return old_handler;
}
#endif /* __TI_TABLE_DRIVEN_EXCEPTIONS */


/*****************************************************************************/
/*                                                                           */
/* __TI_default_term_handler - Default terminate handler, calls abort()      */
/*                             as per ISO/IEC 14882:1998(E), 18.6.3.1/3      */
/*                                                                           */
/*****************************************************************************/
static void __TI_default_term_handler(void)
{
    __abort_execution(ec_terminate_called);
}


/*****************************************************************************/
/*                                                                           */
/* __TI_default_unexp_handler - Default unexpected handler, calls terminate()*/
/*                              as per ISO/IEC 14882:1998(E), 18.6.2.2/3     */
/*                                                                           */
/*****************************************************************************/
static void __TI_default_unexp_handler(void)
{
    std::terminate();
}




#if defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
/*****************************************************************************/
/*                                                                           */
/* std::uncaught_exception - Return true if an exception is in the process   */
/*                           of being thrown                                 */
/*                                                                           */
/*****************************************************************************/
bool std::uncaught_exception(void) throw()
{
    __cxa_eh_globals *ceg = __cxa_get_globals();

    /*-----------------------------------------------------------------------*/
    /* True should be returned if uncaught_exception() is called after       */
    /* terminate() has been called by the impl (or) if there are any         */
    /* uncaught exceptions (__cxa_begin_catch has not been called)           */
    /*-----------------------------------------------------------------------*/
    return ceg->terminate_called || ceg->uncaught_exceptions;
}
#endif /* __TI_TABLE_DRIVEN_EXCEPTIONS */


/*****************************************************************************/
/*                                                                           */
/* __TI_eb_init - Allocate space for the emergency buffer, return ptr to it  */
/*                                                                           */
/*****************************************************************************/
static void *__TI_eb_init()
{
    _Emergency_Buffer *eb = 
			(_Emergency_Buffer *)malloc(sizeof(_Emergency_Buffer));
    if (eb) eb->used = false;

    return eb;
}


/*****************************************************************************/
/*                                                                           */
/* __TI_eb_acquire - Acquire the buffer for use by the thrown exception      */
/*                   returns ptr to buffer if successful                     */
/*                                                                           */
/*****************************************************************************/
static void *__TI_eb_acquire(size_t thrown_size)
{
    __cxa_eh_globals  *ceg = __cxa_get_globals();
    _Emergency_Buffer *eb  = (_Emergency_Buffer *)ceg->emergency_buffer;

    /*-----------------------------------------------------------------------*/
    /* Buffer not present, in use or if the size is insufficient, ret NULL   */
    /*-----------------------------------------------------------------------*/
    if (eb == NULL || eb->used || thrown_size > sizeof(std::bad_alloc)) 
	return NULL;

    #ifdef DEBUG_CPPABI
    printf("CA: Acquiring emergency buffer for bad_alloc\n");
    #endif /* DEBUG_CPPABI */

    eb->used = true;

    return eb;
}


/*****************************************************************************/
/*                                                                           */
/* __TI_eb_release - Release the buffer, returns true if buffer released     */
/*                                                                           */
/*****************************************************************************/
static bool __TI_eb_release(__cxa_exception *ce)
{
    __cxa_eh_globals  *ceg = __cxa_get_globals();
    _Emergency_Buffer *eb  = (_Emergency_Buffer *)ceg->emergency_buffer;

    /*-----------------------------------------------------------------------*/
    /* If the CE was allocated from the Emergency Buffer, release the buffer */
    /*-----------------------------------------------------------------------*/
    if (eb && ((__cxa_exception *)eb == ce))
    {
	#ifdef DEBUG_CPPABI
	printf("CA: Releasing emergency buffer\n");
	#endif /* DEBUG_CPPABI */

	eb->used = false;
	return true;
    }

    return false;
}

#endif /* __EXCEPTIONS */


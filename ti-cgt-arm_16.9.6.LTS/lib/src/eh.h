/*****************************************************************************/
/* eh.h v16.9.6                                                              */
/* Copyright (c) 1996-2017 Texas Instruments Inc., all rights reserved       */
/*****************************************************************************/
/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
/*
Redistribution and use in source and binary forms are permitted
provided that the above copyright notice and this paragraph are
duplicated in all source code forms.  The name of Edison Design
Group, Inc. may not be used to endorse or promote products derived
from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
Any use of this software is at the user's own risk.
*/
/*

Declarations for exception handling.

*/

#ifndef _EH_H
#define _EH_H 1

#include <stdlib.h>
#include "runtime.h"
#include <exception>
#include "rtti.h"
#include "vec_newdel.h"

/*** START TI REPLACE ***/
#if EXCEPTION_HANDLING && !defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
/*** END TI REPLACE ***/

#ifndef NULL
#define NULL (0)
#endif /* NULL */

#include <setjmp.h>

typedef long an_element_count;
			/* Type used to represent a count of the number of
			   elements in an array.  Must be signed because
			   -1 is used to represent an array whose size is
			   only known at run time. */

typedef int	a_conditional_flag;
			/* Type of a flag used for conditional region
			   entries. */

typedef __EDG_VAR_HANDLE_TYPE an_object_handle;
			/* An offset into the object address array. */

typedef void *an_object_ptr;
			/* An address of an object. */

typedef __EDG_REGION_NUMBER_TYPE a_region_number;
			/* Type used to represent a region number.
			   Must be an unsigned type. */

/* Definitions of the values in the flags field of the region description
   entry. */
typedef a_byte a_region_descr_flag_set;
#define RDF_NO_FLAGS		0x0
			/* Value used when no flags are set. */
#define RDF_INDIRECT		0x01
			/* TRUE if the address provided by handle
			   is a pointer to the object. */
#define RDF_CONDITIONAL_FLAG	0x02
			/* TRUE if the object is conditionally constructed.
			   When this flag is TRUE the next entry on the list
			   contains a handle that can be used to get the
			   address of the flag that indicates whether the
			   object has been constructed.  When this flag is
			   set the value of the conditional flag (pointed
			   to by the handle in the region entry) should be
			   tested before trying to make use of the handle
			   in the next region entry. */
#define RDF_NEW_ALLOCATION	0x04
			/* TRUE if the object was allocated by new and
			   is to be freed in the event of a throw. */
#define RDF_ARRAY		0x08
			/* TRUE if the complete object information can
			   be found in the array supplement.  This is used
			   for arrays and for new allocations that require
			   a two-argument operator delete call. */
#define RDF_THIS_PARAM_OFFSET	0x10
			/* TRUE if the object is at an address relative to
			   the "this" parameter of the current routine, i.e.,
			   it's a base class or member being handled in
			   a constructor or destructor.  Not used in the
			   portable scheme. */
#define RDF_SUBOBJECT_VTABLE		0x20
			/* When RDF_BASE_CLASS_SUBOBJECT is TRUE, this
			   flag indicates that a region entry following this
			   one gives the address of the subobject virtual
			   function table table to be used when calling the
			   destructor.  If there is also an extra entry for a
			   conditional flag, the subobject vtable entry
			   follows the flag entry.  Note that this uses the
			   same bit as RDF_LET_THIS. */


#define RDF_BASE_CLASS_SUBOBJECT	0x40
			/* TRUE if the object is a base class of some other
			   object and therefore is not a complete object.  Note
			   that this shares the same value with RDF_VLA.  A
			   base class subobject is never an array so the
			   RDF_ARRAY flag can be used to distinguish
			   which meaning the 0x40 value has. */
#define RDF_VLA				0x40
			/* TRUE when RDF_ARRAY is set and the array is a
			   variable length array.  Note that this shares the
			   same value with RDF_BASE_CLASS_SUBOBJECT.  When
			   this flag is set, the next entry in the region
			   table provides a handle to a size_t variable
			   that provides the number of elements in the array.
			   For a multi-dimensional array, it is the total
			   number of elements for all of the dimensions. */
#define RDF_GUARD_VAR_FOR_LOCAL_STATIC	0x80
			/* TRUE if the object is the guard variable associated
			   with the initialization of a local static variable.
			   The cleanup action is to set the variable back to
			   zero. */

/*
Macro used to test the base class subobject bit.  The RDF_ARRAY test is
included because RDF_BASE_CLASS_SUBOBJECT shares the same value with
RDF_VLA.
*/
#define is_base_class_subobject(flags)					\
  (((flags) & RDF_BASE_CLASS_SUBOBJECT) != 0 &&				\
   ((flags) & RDF_ARRAY) == 0)

#define NULL_REGION_NUMBER ((a_region_number)__EDG_NULL_EH_REGION_NUMBER)
			/* The value used when there is no active EH
			   region.  Also the value used as the next
			   region number when there is no next region. */


/* Supplement to a region description entry for array entries and for
   entries for new allocations that must be deleted using the
   two-argument form of operator delete. */
typedef struct an_eh_array_supplement *an_eh_array_supplement_ptr;
typedef struct an_eh_array_supplement {
  an_object_handle
		handle;
			/* Offset in stack from or index into
			   the object address array. */
  a_sizeof_t	element_size;
			/* Size of each element in the array. */
  an_element_count	array_size;
			/* Number of elements in an array.  -1 if the
			   size is not known at compile time.  Zero for
			   objects that are not arrays but that must be
			   deleted using the two-argument operator
			   delete. */
} an_eh_array_supplement;


/* Structure that describes a single destructable object. */
typedef struct an_eh_region_descr *an_eh_region_descr_ptr;
typedef struct an_eh_region_descr {
  a_void_function_ptr
		destructor_or_delete_routine;
			/* When new_allocation is FALSE this points to
			   the destructor for the object.  When
			   new_allocation is TRUE this points to the
			   delete operator for the object. */
  an_object_handle
		handle;
			/* Offset in stack from or index into
			   the object address array. When RDF_ARRAY is
			   set the handle contains the index into the
			   array supplement.  When
			   RDF_THIS_PARAM_OFFSET is set the handle
			   contains an offset to be added to the this
			   parameter to get the address of a base
			   class. */
  a_region_number
	        index_of_next_region;
			/* Index of the region description of the
			   next region.  This region will be
			   processed after the processing for this
			   region has been completed. */
  a_region_descr_flag_set
		flags;
			/* A collection of bits that specify how the
			   region entry is to be used.  See the
			   descriptions of the RDF flags above. */
} an_eh_region_descr;


/* Definitions of the values in the flags field of the exception type
   specification entry. */
typedef a_byte an_ETS_flag_set;
#define ETS_NO_FLAGS		0x0
			/* Value used when no flags are set. */
#define ETS_IS_POINTER		0x01
			/* A pointer to an object of the type specified
			   by type_info is being caught. */
#define ETS_CONST		0x02
#define ETS_VOLATILE		0x04
			/* Indication of the type qualifiers on the type
			   pointed to, in the pointer case. */
#define ETS_IS_REFERENCE	0x08
			/* A reference to an object of the type specified
			   by type_info is being caught. */
#define ETS_IS_ELLIPSIS		0x10
			/* The catch clause contains an ellipsis. */
#define ETS_LAST		0x20
			/* TRUE if this is the last catch clause associated
			   with a given try block (i.e., there are no more
			   entries in the array.) */
/*** START TI ADD ***/
/******************************************************************************/
/* These macro values are redefined in the parser. Therefore, their values    */
/* must be consistent to avoid object incompatibilities since they will show  */
/* up in both ICODE and compiled objects. When modifying these flags, make    */
/* sure that their values do not change and that they are the same as the     */
/* definitions within lower_eh.c in the parser.                               */
/******************************************************************************/
#define ETS_IS_FUNC_POINTER     0x40
                        /* TRUE if the catch clause is a pointer to 
			   function  */
/*** END TI ADD ***/
/*** START TI REPLACE ***/
#define ETS_IS_POINTER_TO_DATA_MEMBER 0x400
/*** END TI REPLACE ***/
			/* A pointer to data member type is specified by
			   typeinfo.  Note that this differs from the pointer
			   case: the typeinfo refers to the pointer to data
			   member type. */
/*** START TI REPLACE ***/
#define ETS_IS_POINTER_TO_MEMBER_FUNCTION 0x800
/*** END TI REPLACE ***/
			/* A pointer to member function type is specified by
			   typeinfo.  Note that this differs from the pointer
			   case: the typeinfo refers to the pointer to
			   member function type. */
#define ETS_QUALIFIERS	(ETS_CONST | ETS_VOLATILE)
			/* The flags bits that comprise the type qualifiers
			   that must be checked to determine a match. */

/* Macros used for checking ETS flags. */
/* The pointer flags are not used prior to the 2.41 ABI. */
#if ABI_COMPATIBILITY_VERSION >= 241
#define is_pointer(flag, ptr_flags)  ((flag & ETS_IS_POINTER) != 0 ||	\
                                      ptr_flags != NULL)
/*** START TI ADD ***/ 
#define is_pointer_to_func(flag, ptr_flags)  ((flag & ETS_IS_FUNC_POINTER) != 0 ||	\
                                      ptr_flags != NULL)
/*** END TI ADD ***/
#else /* !(ABI_COMPATIBILITY_VERSION >= 241) */
#define is_pointer(flag, ptr_flags)  ((flag & ETS_IS_POINTER) != 0)
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */

/* is_single_level_pointer returns TRUE only if the pointer bit is set in
   the primary flags field, and does not consider the ptr_flags. */
#define is_single_level_pointer(flag)					\
  is_pointer(flag, NULL)

/* is_single_level_pointer_to_member returns TRUE only if the pointer to
   data member or pointer to member function bit is set in the primary flags
   field, and does not consider the ptr_flags. */
#define is_single_level_pointer_to_member(flag)				\
  ((flag & (ETS_IS_POINTER_TO_DATA_MEMBER |				\
            ETS_IS_POINTER_TO_MEMBER_FUNCTION)) != 0)

#define is_const(flag)               ((flag & ETS_CONST) != 0)
#define is_volatile(flag)            ((flag & ETS_VOLATILE) != 0)
#define is_reference(flag)           ((flag & ETS_IS_REFERENCE) != 0)
#define is_ellipsis(flag)            ((flag & ETS_IS_ELLIPSIS) != 0)
#define is_last(flag)                ((flag & ETS_LAST) != 0)

/* Return the qualifiers from a flag entry. */
#define get_qualifiers(flag)         (flag & ETS_QUALIFIERS)


/* Exception type specifications are used to describe throw specifications
   for functions and are also used to describe the list of types used in
   the catch clauses associated with a given try block. */
typedef struct an_exception_type_specification
		*an_exception_type_specification_ptr;
typedef struct an_exception_type_specification {
  a_type_info_impl_ptr
		type_info;
			/* Pointer to the type information for the entry.
			   NULL if the entry has no associated type (for
			   ellipsis entries or for empty throw specification
			   lists). */
  an_ETS_flag_set
		flags;
			/* A collection of bits that specify how the
			   catch entry is to be used.  See the
			   descriptions of the ETS flags above. */
#if ABI_COMPATIBILITY_VERSION >= 241
  an_ETS_flag_set
		*ptr_flags;
			/* Present for types that have more than one level
			   of pointer.  Points to an array of flags, terminated
			   by an entry with the ETS_LAST bit set.  This
			   information is used to do qualification conversions
			   on multi-level pointers. */
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
} an_exception_type_specification;


/* The kinds of stack entries that may exist. */
enum an_eh_stack_entry_kind_tag {
  ehsek_old_try_block,	/* Used for a try block up to version 3.10. */
  ehsek_function,
  ehsek_throw_spec,
  ehsek_throw_processing_marker,
  ehsek_vec_new_or_delete,
  ehsek_try_block	/* Used for try blocks in versions after 3.10. */
};

typedef a_byte an_eh_stack_entry_kind;

/*** START TI REPLACE ***/
typedef struct __an_eh_stack_entry *an_eh_stack_entry_ptr;
typedef struct __an_eh_stack_entry {
/*** END TI REPLACE ***/
  an_eh_stack_entry_ptr
		next;
			/* The next stack entry. */
  an_eh_stack_entry_kind
		kind;
			/* The kind of stack entry. */
  union {
    /* When kind == ehsek_try_block. */
    struct {
#if USE_SYSTEM_JMP_BUF_DEFINITION
      jmp_buf	setjmp_buffer;
			/* Buffer used by setjmp to save state information.
			   The jmp_buf type is defined in setjmp.h. */
#else /* !USE_SYSTEM_JMP_BUF_DEFINITION */
      __EDG_JMP_BUF_ELEMENT_TYPE
                setjmp_buffer[__EDG_JMP_BUF_NUM_ELEMENTS];
			/* Buffer used by setjmp to save state
			   information.  The element type and size are
			   passed from the front end using predefined
			   macros. */
#endif /* USE_SYSTEM_JMP_BUF_DEFINITION */
      an_exception_type_specification_ptr
		catch_entries;
			/* Pointer to an array of entries that describe the
			   types that can be caught. */
      void*	catch_info;
			/* Pointer to catch information maintained by the
			   runtime system.  Initialized to NULL by the
			   code generated by the compiler. */
      a_region_number
		region_number;
			/* EH region number upon entry to the try block.
			   Used to clean up objects declared in the try
			   block. */
    } try_block;

    /* When kind == ehsek_function. */
    struct {
      an_eh_region_descr
		*regions;
			/* Pointer to an array of region
			   descriptions. */
      an_object_ptr
		*object_address_table;
			/* Pointer to an array of object addresses. */
      an_eh_array_supplement
		*array_table;
			/* Pointer to an array of array description
			   entries. */
      a_region_number
		saved_region_number;
			/* Previous value of eh_curr_region saved on
			   entry to this function. */
    } function;
    /* When kind == ehsek_throw_spec. */
    an_exception_type_specification_ptr
		throw_specification;
			/* Pointer to an array of entries that specify the
			   types that can be thrown. */
    /* When kind == ehsek_vec_new_or_delete. */
    an_array_alloc_eh_info_ptr
		array_alloc_eh_info;
			/* Pointer to a structure used to handle exceptions
			   that occur while processing an array new or delete
			   operation. */
  } variant;
} an_eh_stack_entry;


/*** START TI REPLACE ***/
EXTERN _DATA_ACCESS_NEAR a_region_number
		__eh_curr_region initial_value(0);
			/* Number of the current region in topmost function
			   entry on the EH stack. */

EXTERN _DATA_ACCESS_NEAR an_eh_stack_entry_ptr
		__curr_eh_stack_entry initial_value(NULL);
			/* The pointer to the top of the stack of EH
			   entries. */
EXTERN _DATA_ACCESS_NEAR int	__catch_clause_number;
			/* Contains the sequence number of the catch clause
			   associated with a given try block. */

EXTERN _DATA_ACCESS_NEAR void*	__caught_object_address;
			/* The address of the object to be used as the value
			   of the parameter in the catch clause. */
/*** END TI REPLACE ***/

EXTERN_C void __call_terminate(void);
EXTERN_C void __default_terminate(void);

EXTERN a_void_function_ptr
		__default_terminate_routine
                       initial_value((a_void_function_ptr)__default_terminate);
			/* Pointer to the terminate routine to be used. */

EXTERN_C void __call_unexpected(void);

EXTERN a_void_function_ptr
		__default_unexpected_routine
                                       initial_value(STD_NAMESPACE::terminate);
			/* Pointer to the unexpected routine to be used. */

EXTERN_C void __cleanup_vec_new_or_delete(an_eh_stack_entry_ptr ehsep);

EXTERN_C void __eh_exit_processing(void);

EXTERN_C void __type_of_thrown_object(a_type_info_impl_ptr	*type,
				      an_ETS_flag_set		*flags,
				      an_ETS_flag_set		**ptr_flags);

EXTERN_C a_boolean __can_throw_type(a_type_info_impl_ptr	type,
				    an_ETS_flag_set		flags,
				    an_ETS_flag_set		*ptr_flags);


EXTERN_C an_eh_stack_entry_ptr __get_curr_eh_stack_entry(void);

/*** START TI REPLACE ***/
#endif /* EXCEPTION_HANDLING && !defined(__TI_TABLE_DRIVEN_EXCEPTIONS) */
/*** END TI REPLACE ***/

#endif /* ifndef _EH_H */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/

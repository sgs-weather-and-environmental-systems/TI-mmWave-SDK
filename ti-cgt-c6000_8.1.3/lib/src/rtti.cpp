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

Run-time type identification.

*/

#include "basics.h"
#include "runtime.h"
#pragma hdrstop
#include "rtti.h"

#if ABI_CHANGES_FOR_RTTI
#include <typeinfo>
#include "vtbl.h"
#endif /* ABI_CHANGES_FOR_RTTI */
/*** START TI ADD ***/
#include "stdint.h"
/*** END TI ADD ***/

/* Forward declaration. */
typedef struct a_base_class_traversal_block *a_base_class_traversal_block_ptr;

/*
The type of the function called to process a base class entry.
*/
typedef void a_base_class_process_function(
		void					*ptr,
		a_type_info_impl_ptr			class_info,
		a_base_class_traversal_block_ptr	bctbp,
		a_base_class_spec_ptr			curr_base_info);

typedef a_base_class_process_function
			*a_base_class_process_function_ptr;

/*
Entry used to pass information used during base class traversal.
*/
typedef struct a_base_class_traversal_block {
  a_base_class_process_function_ptr
		process_function;
			/* The function to be called for each base class
			   encountered, before its base classes have been
			   processed.  May not be NULL. */
  a_base_class_process_function_ptr
		process_post_function;
			/* The function to be called for each base class
			   encountered, after its base classes have been
			   processed.  May be NULL. */
  a_boolean
		not_direct_only;
			/* TRUE if all base classes (not just the direct ones)
			   should be considered.  This has no effect in the
			   IA-64 ABI. */
  a_boolean	public_only;
			/* TRUE if only public base classes should be
			   visited. */
  a_boolean	terminate;
			/* TRUE if the traversal should be discontinued. */
  /* Fields used by tbc_downcast: */
  a_type_info_impl_ptr
		downcast_dest_tiip;
			/* The result type of the cast. */
  a_type_info_impl_ptr
		downcast_source_tiip;
			/* The source type of the cast. */
  void		*downcast_source_ptr;
			/* The pointer to the source subobject. */
  void		*downcast_dest_ptr;
			/* If we've found an eligible destination class
			   and should begin looking for a matching source
			   subobject, this points to the destination subobject
			   that was found. */
  void		*downcast_result;
			/* The result of the downcast, or NULL if no result
			   was found. */
} a_base_class_traversal_block;


/* Forward declarations. */
EXTERN_C void __db_type_info(const STD_NAMESPACE::type_info& info);
EXTERN_C void __db_type_info_impl(a_type_info_impl_ptr	tiip);

#ifdef __EDG_IA64_ABI

/*
Macro to extract the offset value from the combined offset/flags field.
*/
#define get_offset(bcsp) ((bcsp)->__offset_flags >>			\
                                  abi::__base_class_type_info::__offset_shift)

/*
Macros used to test for flags from the __vmi_class_tyupe_info.
*/
#define diamond_shaped(flags) \
  ((flags & abi::__vmi_class_type_info::__diamond_shaped_mask) != 0)
#define non_diamond_repeat(flags) \
  ((flags & abi::__vmi_class_type_info::__non_diamond_repeat_mask) != 0)

/*
Values used to record the way in which a given base class was found during
the derived to base conversion search.
*/
enum a_result_virtuality { rv_unknown, rv_nonvirtual, rv_directvirtual };

#endif /* ifdef __EDG_IA64_ABI */


static void clear_base_class_traversal_block(
				a_base_class_traversal_block_ptr	bctbp)
/*
Initialize the fields of a base class traversal block.
*/
{
  bctbp->process_function = NULL;
  bctbp->process_post_function = NULL;
  bctbp->not_direct_only = FALSE;
  bctbp->public_only = FALSE;
  bctbp->terminate = FALSE;
  /* Fields used by tbc_downcast. */
  bctbp->downcast_dest_tiip = NULL;
  bctbp->downcast_source_tiip = NULL;
  bctbp->downcast_source_ptr = NULL;
  bctbp->downcast_dest_ptr = NULL;
  bctbp->downcast_result = NULL;
}  /* clear_base_class_traversal_block */


static a_boolean is_virtual(a_base_class_spec_ptr	base_info)
/*
Return TRUE if base_info is a base class specification entry for a virtual
base class.  Note that base_info may be NULL.
*/
{
  a_boolean	result = FALSE;

  if (base_info != NULL) {
#ifdef __EDG_IA64_ABI
    result = (base_info->__offset_flags & BCS_VIRTUAL) != 0;
#else /* ifndef __EDG_IA64_ABI */
    result = (base_info->flags & BCS_VIRTUAL) != 0;
#endif /* ifdef __EDG_IA64_ABI */
  }  /* if */
  return result;
}  /* is_virtual */

#ifdef __EDG_IA64_ABI

static void *get_virtual_base_pointer(void                  *ptr,
                                      a_base_class_spec_ptr bcsp)
/*
Return a pointer to the virtual base class of the derived object ptr as
specified by bcsp.
*/
{
  a_vtbl_entry_ptr vtbl, vbase_offset;

  vtbl = *((a_vtbl_entry_ptr *)ptr);
  vbase_offset = (a_vtbl_entry_ptr)(((char *)vtbl) + get_offset(bcsp));
  return (void *)(((char *)ptr) + *vbase_offset);
}  /* get_virtual_base_pointer */

#endif /* ifdef __EDG_IA64_ABI */

static void traverse_base_classes(
			void					*ptr,
			a_type_info_impl_ptr			class_info,
			a_base_class_traversal_block_ptr	bctbp,
			a_base_class_spec_ptr			curr_base_info)
/*
Walk the base classes of the object specified by "ptr" of the type specified
by "class_info".  Call user-supplied routines as specified in the traversal
block.  This routine is called for the most derived class and then calls itself
recursively for all of the base classes.  When called for a base class,
"curr_base_info" points to the base class specification entry for the current
base class.  This will be NULL for the most derived class, and may also be NULL
for certain base classes in the IA-64 ABI.
*/
{
#ifdef __EDG_IA64_ABI
  /* IA-64 ABI version. */
  a_base_class_spec_ptr	bcsp;
  void                  *new_ptr;

  /* Call the processing function on this base class. */
  bctbp->process_function(ptr, class_info, bctbp, curr_base_info);
  if (typeid(*class_info) == typeid(abi::__si_class_type_info)) {
    abi::__si_class_type_info *si_obj_info = 
                                      (abi::__si_class_type_info *)class_info;
    /* Call the traversal routine on the base class. */
    traverse_base_classes(ptr, si_obj_info->__base_type, bctbp,
                          (a_base_class_spec_ptr)NULL);
  } else if (typeid(*class_info) == typeid(abi::__vmi_class_type_info)) {
    abi::__vmi_class_type_info *vmi_obj_info = 
                                     (abi::__vmi_class_type_info *)class_info;
    for (bcsp = vmi_obj_info->__base_info;
         bcsp < vmi_obj_info->__base_info + vmi_obj_info->__base_count;
         bcsp++) {
      /* If this base class is not public, skip it if only processing public
         bases. */
      if (bctbp->public_only && (bcsp->__offset_flags & BCS_PUBLIC) == 0) {
        continue;
      }  /* if */
      if (is_virtual(bcsp)) {
        new_ptr = get_virtual_base_pointer(ptr, bcsp);
      } else {
        new_ptr = (void *)(((char *)ptr) + get_offset(bcsp));
      }  /* if */
      /* Call the traversal routine on the base class. */
      traverse_base_classes(new_ptr, bcsp->__base_type, bctbp, bcsp);
      /* Stop the traversal if the terminate flag has been set. */
      if (bctbp->terminate) goto end_of_routine;
    }  /* for */
  }  /* if */
  /* Call the post-processing function on this base class. */
  if (bctbp->process_post_function != NULL) {
    bctbp->process_post_function(ptr, class_info, bctbp, curr_base_info);
  }  /* if */
end_of_routine:;
#else /* ifndef __EDG_IA64_ABI */
  /* Extended cfront ABI version. */
  a_base_class_spec_ptr	bcsp;
  void                  *new_ptr;
  a_boolean		done;

  /* Call the processing function on this base class. */
  bctbp->process_function(ptr, class_info, bctbp, curr_base_info);
  for (done = FALSE, bcsp = class_info->base_class_entries;
       bcsp != NULL && !done; done = (bcsp->flags & BCS_LAST) != 0, bcsp++) {
    /* Skip this base class if we are only processing direct bases. */
    if (!bctbp->not_direct_only && (bcsp->flags & BCS_DIRECT) == 0) continue;
    /* If this base class is not public, skip it if only processing public
       bases. */
    if (bctbp->public_only && (bcsp->flags & BCS_PUBLIC) == 0) continue;
    /* Adjust the pointer by the offset provided in the base class
       specification. */
    new_ptr = (void*) (((char *) ptr) + bcsp->offset);
    if (is_virtual(bcsp)) {
      /* If this is a virtual base class then the offset provides the
         location of a pointer to the base class.  Dereference the
         pointer and use that value. */
      new_ptr = *((void **)new_ptr);
    }  /* if */
    traverse_base_classes(new_ptr, bcsp->type_info, bctbp, bcsp);
    /* Stop the traversal if the terminate flag has been set. */
    if (bctbp->terminate) goto end_of_routine;
  }  /* for */
  /* Call the post-processing function on this base class. */
  if (bctbp->process_post_function != NULL) {
    bctbp->process_post_function(ptr, class_info, bctbp, curr_base_info);
  }  /* if */
end_of_routine:;
#endif /* ifdef __EDG_IA64_ABI */
}  /* traverse_base_classes */


#ifdef __EDG_IA64_ABI

static a_boolean derived_to_base_conversion_r(
			void			*ptr,
			void			**p_new_ptr,
			a_type_info_impl_ptr	class_info,
			a_type_info_impl_ptr	base_info,
			unsigned int		vmi_flags,
			a_boolean		*p_is_ambiguous,
			a_boolean		is_accessible,
			a_type_info_impl_ptr    *p_virtual_class_above_result,
			a_result_virtuality     *p_result_virtuality,
			a_boolean		*result_is_accessible)
/* 
Perform a derived to base conversion from ptr (the derived object, whose type
is given by class_info) to the base indicated by base_info.  If the base is
unambiguous, the address of the base is stored in *p_new_ptr, and TRUE is
returned.  On entry *p_new_ptr should be NULL, or the address of the base if
it has already been found.  is_accessible is TRUE if the current class is
accessible.  result_is_accessible is set to indicate whether the base class
that is found (if any) is accessible from the ultimately derived object.
If the base is ambiguous,  *p_is_ambiguous i set to TRUE, and FALSE is
returned.  If the base is unambiguous, but inaccessible, TRUE is returned but
result_is_accessible is set to FALSE.  vmi_flags is a bit set of flags that
are used to optimize the base class search.  These flags are passed by
the initial caller of this routine and are passed down when the routine
is called recursively.

p_result_virtuality records whether the matching base class that was found
was virtual.  If the matching base class is an indirect virtual base,
p_virtual_class_above_result records the direct virtual base under which
the indirect virtual base was located.  These values are used to determine
whether two matching base classes actually represent the same virtual base
class.  These are needed in the case where "ptr" is NULL.  When ptr is
non-NULL, the address of the matching base class can be used to identify
redundant matching virtual base classes.
*/
{
  a_boolean result = FALSE;

#if DEBUG
  if (__debug_level >= 4) {
    fprintf(__f_debug, "derived_to_base_conversion_r:\n");
    fprintf(__f_debug, "  conversion from:\n");
    __db_type_info(*class_info);
    fprintf(__f_debug, "  conversion to:\n");
    __db_type_info(*base_info);
  }  /* if */
#endif /* DEBUG */
  if (typeid(*class_info) == typeid(abi::__si_class_type_info)) {
    /* Single, non-virtual, public inheritance. */
    abi::__si_class_type_info *si_obj_info = 
                                       (abi::__si_class_type_info *)class_info;
    if (matching_type_info(si_obj_info->__base_type, base_info)) {
      if ((*p_new_ptr != NULL && *p_new_ptr != ptr) ||
	  *p_result_virtuality == rv_directvirtual ||
          *p_is_ambiguous) {
        /* The base class is ambiguous. */
        *p_is_ambiguous = TRUE;
        *p_new_ptr = NULL;
        result = FALSE;
      } else {
        *p_result_virtuality = rv_nonvirtual;
        *result_is_accessible = is_accessible;
        *p_new_ptr = ptr;
        result = TRUE;
      }  /* if */
    } else if (derived_to_base_conversion_r(ptr, p_new_ptr,
                                            si_obj_info->__base_type,
                                            base_info, vmi_flags,
                                            p_is_ambiguous, is_accessible,
					    p_virtual_class_above_result,
					    p_result_virtuality,
					    result_is_accessible) ||
               *p_is_ambiguous) {
      if ((*p_is_ambiguous)) {
        result = FALSE;
      } else {
        result = TRUE;
      }  /* if */
    }  /* if */
  } else if (typeid(*class_info) == typeid(abi::__vmi_class_type_info)) {
    /* Complex inheritance. */
    abi::__vmi_class_type_info *vmi_obj_info = 
                                      (abi::__vmi_class_type_info *)class_info;
    a_base_class_spec_ptr      bcsp;
    void                       *base_ptr;
    /* Loop over all of the base classes. */
    for (bcsp = vmi_obj_info->__base_info;
         bcsp < vmi_obj_info->__base_info + vmi_obj_info->__base_count;
         bcsp++) {
      a_boolean base_is_accessible;
      a_boolean	is_virtual = (bcsp->__offset_flags & BCS_VIRTUAL) != 0;
      if (ptr == NULL) {
        /* Don't try to add an offset to a NULL pointer. */
        base_ptr = NULL;
      } else if (is_virtual) {
        base_ptr = get_virtual_base_pointer(ptr, bcsp);
      } else {
        base_ptr = (void *)(((char *)ptr) + get_offset(bcsp));
      }  /* if */
      base_is_accessible = is_accessible &&
                           (bcsp->__offset_flags & BCS_PUBLIC);
      if (matching_type_info(bcsp->__base_type, base_info)) {
        /* We found the base for which we were looking. */
        if ((*p_new_ptr != NULL && base_ptr != *p_new_ptr) || 
	    ((bcsp->__offset_flags & BCS_VIRTUAL) &&
             *p_result_virtuality == rv_nonvirtual) ||
            *p_is_ambiguous) {
          /* The base class is ambiguous. */
          *p_is_ambiguous = TRUE;
          *p_new_ptr = NULL;
          result = FALSE;
          break;
        } else {
          /* The base class is unambiguous -- at least so far. */
	  *p_result_virtuality = (bcsp->__offset_flags & BCS_VIRTUAL) ?
                                              rv_directvirtual : rv_nonvirtual;
          *result_is_accessible = base_is_accessible;
          *p_new_ptr = base_ptr;
          result = TRUE;
          /* We can stop searching if the vmi_flags indicate that this
             base class is known to be unique. */
          if (*result_is_accessible) {
            if (is_virtual ? !diamond_shaped(vmi_flags)
                           : !non_diamond_repeat(vmi_flags)) {
              break;
            }  /* if */
          }  /* if */
        }  /* if */
      } else {
	a_type_info_impl_ptr virtual_class_above_result_here = NULL;
	a_result_virtuality result_virtuality_here = rv_unknown;
	if (derived_to_base_conversion_r(base_ptr, p_new_ptr,
					 bcsp->__base_type,
					 base_info, vmi_flags,
					 p_is_ambiguous,
					 base_is_accessible,
					 &virtual_class_above_result_here,
					 &result_virtuality_here,
					 result_is_accessible) ||
	    *p_is_ambiguous) {
	  if (*p_is_ambiguous) {
	    result = FALSE;
	    break;
	  } else {
	    if (virtual_class_above_result_here == NULL &&
                (bcsp->__offset_flags & BCS_VIRTUAL) != 0) {
	      virtual_class_above_result_here = bcsp->__base_type;
            }  /* if */
	    if (/* The result virtuality will be unknown on the first match. */
                *p_result_virtuality == rv_unknown ||
		/* All of the matches are direct virtual. */
		(result_virtuality_here == rv_directvirtual &&
		 *p_result_virtuality == rv_directvirtual) ||
                /* An indirect virtual base with the same virtual parent as
                   the earlier match. */
		(*p_virtual_class_above_result != NULL &&
		 *p_virtual_class_above_result ==
                                            virtual_class_above_result_here)) {
	      *p_result_virtuality = result_virtuality_here;
	      *p_virtual_class_above_result = virtual_class_above_result_here;
	      result = TRUE;
	      /* We can stop searching if the vmi_flags indicate that this
		 base class is known to be unique. */
	      if (*result_is_accessible) {
		if (is_virtual ? !diamond_shaped(vmi_flags)
		    : !non_diamond_repeat(vmi_flags)) {
		  break;
		}  /* if */
	      }  /* if */
	    } else {
	      *p_is_ambiguous = TRUE;
	      result = FALSE;
	      break;
	    }
	  } /* if */
	}
      } /* if */
    }  /* for */
  }  /* if */
  return result;
}  /* derived_to_base_conversion_r */

#endif /* ifdef __EDG_IA64_ABI */

#ifdef __EDG_IA64_ABI
/*ARGSUSED*/ /* <-- access_flags and use_access_flags are unused in that
                    case. */
#endif /* ifdef __EDG_IA64_ABI */
EXTERN_C
a_boolean __derived_to_base_conversion(void**		     p_ptr,
		  		       void**                p_new_ptr,
				       a_type_info_impl_ptr  class_info,
				       a_type_info_impl_ptr  base_info,
				       an_access_flag_string *access_flags,
				       a_boolean             use_access_flags)
/*
Converts p_ptr from a pointer to a derived class (described by class_info)
to a pointer to a base class (described by base_info) and stores
the resulting pointer in p_new_ptr.  Returns TRUE if the base class was
found and the conversion was done; otherwise returns FALSE. 

p_ptr may be NULL when this routine is called simply to determine whether
the conversion is possible.  This is the case when exception specifications
are being tested.

The access_flags string contains one byte for each base class.  The
byte contains either "Y" (the base class is accessible) or "N" (the
base class is not accessible).  The base class may be inaccessible
either because of access protection or because the base class
is ambiguous.

use_access_flags indicates whether the access_flags string should be used
when checking for accessible (and unambiguous) bases.  If use_access_flags
is FALSE, the BCS_PUBLIC and BCS_AMBIGUOUS flags in the base class entry
are used.  These flags were added when RTTI was implemented in version 2.29.
The access_flags string was retained for backward compatibility.
*/
{
  a_boolean		result = FALSE;
  void                  *ptr;
  a_boolean		is_ambiguous = FALSE;
#ifdef __EDG_IA64_ABI
  a_boolean             result_is_accessible = TRUE;
#else /* !defined(__EDG_IA64_ABI) */
  a_base_class_spec_ptr	bcsp;
#endif /* !defined(__EDG_IA64_ABI) */

  /* Get the actual derived class pointer.  If no pointer was provided,
     use NULL. */
  ptr = p_ptr == NULL ? NULL : *p_ptr;
  *p_new_ptr = NULL;
#ifndef __EDG_IA64_ABI
  bcsp = class_info->base_class_entries;
  if (bcsp != NULL) {
    /* A base class list is present. */
    a_boolean	done = FALSE;
    /* Loop through the direct base classes and look for one that matches
       the specified base class.  We look through all of the direct bases
       first because the direct base list also includes any virtual bases.
       We want to make sure that we find the virtual base classes at
       the top level when possible. */
    do {
      void*		   new_ptr = NULL;
      a_type_info_impl_ptr test_info = bcsp->type_info;
      a_boolean            is_accessible;
      if (ptr != NULL) {
        /* Adjust the pointer by the offset provided in the base class
           specification. */
        new_ptr = (void*) (((char *) ptr) + bcsp->offset);
      }  /* if */
      if (use_access_flags) {
        /* See if this base class is accessible.  *access_flags either points
           to a string of characters associated with each base class in the
  	   tree, or is NULL if none of the base classes are accessible. */
        if (*access_flags != NULL) {
          is_accessible = **access_flags == BASE_ACCESSIBLE;
          (*access_flags)++;
        } else {
          is_accessible = FALSE;
        }  /* if */
      } else {
        /* The base is accessible if it is public and not ambiguous. */
        is_accessible = ((bcsp->flags & BCS_PUBLIC) != 0);
      }  /* if */
      if (matching_type_info(test_info, base_info)) {
        /* If the base class is ambiguous, stop the search but don't
           consider the conversion "successful".  The BCS_AMBIGUOUS flag is
           only used with ABI versions >= 2.29.  In previous versions of
           the ABI, ambiguous bases were indicated by marking all
           instances of the base as inaccessible in the access
           string. */
        is_ambiguous = ((bcsp->flags & BCS_AMBIGUOUS) != 0);
        if (!is_ambiguous && is_accessible) {
          result = TRUE;
          if (ptr != NULL) {
            if (bcsp->flags & BCS_VIRTUAL) {
              /* If this is a virtual base class then the offset provides the
                 location of a pointer to the base class.  Dereference the
                 pointer and return that value. */
              *p_new_ptr = *((void **)new_ptr);
            } else {
              /* A nonvirtual base class.  new_ptr has already been
                 adjusted to point to the start of the base class.
                 Return this value to the caller. */
              *p_new_ptr = new_ptr;
            }  /* if */
          }  /* if */
        }  /* if */
      }  /* if */
      /* The last entry in the array will have the BCS_LAST flag set. */
      done = bcsp->flags & BCS_LAST || result || is_ambiguous;
      /* Advance the pointer to the next element in the array of base
         class specifications. */
      bcsp++;
    } while (!done);
    if (!result && !is_ambiguous) {
      /* The specified base class is not one of the direct or virtual bases.
         Search the indirect base classes. */
      bcsp = class_info->base_class_entries;
      do {
        void*		     new_ptr = NULL;
        a_type_info_impl_ptr test_info = bcsp->type_info;
	a_boolean            is_accessible;
	if (ptr != NULL) {
	  /* Adjust the pointer by the offset provided in the base class
	     specification. */
	  new_ptr = (void*) (((char *) ptr) + bcsp->offset);
          if (bcsp->flags & BCS_VIRTUAL) {
            /* If this is a virtual base class then the offset provides the
               location of a pointer to the base class.  Dereference the
               pointer and use that value. */
            new_ptr = *((void **)new_ptr);
          }  /* if */
	}  /* if */
        /* This is not the base class we are looking for.  Look at the
           base classes of this base class. */
        if (use_access_flags) {
          /* When using access strings, a base class further up in the
             derivation tree may be accessible even if this class is not.
             Always call the derived_to_base_conversion routine and let
             it check the access flag.  This is done by setting the
	     is_accessible flag to TRUE at this level. */
          is_accessible = TRUE;
        } else {
          /* When using the newer access flags in the base class entry
             (instead of the access flag string) don't look into 
             inaccessible or ambiguous bases. */
          is_accessible = ((bcsp->flags & BCS_PUBLIC) != 0) &&
                          ((bcsp->flags & BCS_AMBIGUOUS) == 0);
        }  /* if */
        if (test_info->base_class_entries != NULL && is_accessible) {
          /* This base class has its own bases.  Call this routine
             recursively. */
	  void* local_new_ptr;
          if (__derived_to_base_conversion(&new_ptr, &local_new_ptr, test_info,
					   base_info, access_flags,
                                           use_access_flags)) {
	    if (ptr != NULL) {
	      /* We have found a match.  Update the pointer passed to us
		 to reflect the value found by the recursive call. */
	      *p_new_ptr = local_new_ptr;
	    }  /* if */
            result = TRUE;
            break;
          }  /* if */
        }  /* if */
        /* The last entry in the array will have the BCS_LAST flag set. */
        done = (bcsp->flags & BCS_LAST) != 0;
        /* Advance the pointer to the next element in the array of base
           class specifications. */
        bcsp++;
      } while (!done);
    }  /* if */
  }  /* if */
#else /* defined(__EDG_IA64_ABI) */
  {
    int	vmi_flags;
    /* If the type information is represented by the VMI form of type_info,
       get the flags that are used to optimize the base class search.
       Otherwise, use the safe value of having both flags set. */
    if (typeid(*class_info) == typeid(abi::__vmi_class_type_info)) {
      abi::__vmi_class_type_info *vmi_obj_info = 
                                      (abi::__vmi_class_type_info *)class_info;
      vmi_flags = vmi_obj_info->__flags;
    } else {
      vmi_flags = abi::__vmi_class_type_info::__non_diamond_repeat_mask |
                  abi::__vmi_class_type_info::__diamond_shaped_mask;
    }  /* if */
    a_type_info_impl_ptr virtual_class_above_result = NULL;
    a_result_virtuality result_virtuality = rv_unknown;
    if (derived_to_base_conversion_r(ptr, p_new_ptr, class_info, base_info,
                                     vmi_flags, &is_ambiguous,
                                     /*is_accessible=*/TRUE,
				     &virtual_class_above_result,
				     &result_virtuality,
                                     &result_is_accessible) &&
        result_is_accessible) {
      result = TRUE;
    }  /* if */
  }
#endif /* defined(__EDG_IA64_ABI) */
  return result;
}  /* __derived_to_base_conversion */

#if ABI_CHANGES_FOR_RTTI

static a_base_class_spec_ptr find_base_class_at_addr(
					void			*obj_ptr,
					void			*base_ptr,
					a_type_info_impl_ptr	obj_info,
					a_type_info_impl_ptr	base_info,
                                        a_boolean               *found)
/*
Find the base class specification entry that corresponds to the base
class pointed to by "base_ptr", whose type is specified by "base_info"
in the object pointed to by "obj_ptr".  The base class must be accessible,
but need not be unambiguous.  *found should be initialized to FALSE before
this function is called; it is set to TRUE If the base class is found.
*/
{
  a_base_class_spec_ptr	bcsp;
  void                  *ptr;
  void                  *new_ptr;
  a_base_class_spec_ptr	result = NULL;
#ifndef __EDG_IA64_ABI
  a_boolean		done;
#endif /* ifndef __EDG_IA64_ABI */

  ptr = obj_ptr;
#if DEBUG
  if (__debug_level >= 4) {
    fprintf(__f_debug, "find_base_class_at_addr:\n");
    fprintf(__f_debug, "  looking in:\n");
    __db_type_info(*(type_info_for_impl(obj_info)));
    fprintf(__f_debug, "  for base class:\n");
    __db_type_info(*(type_info_for_impl(base_info)));
  }  /* if */
#endif /* DEBUG */
#ifdef __EDG_IA64_ABI
  if (typeid(*obj_info) == typeid(abi::__si_class_type_info)) {
    abi::__si_class_type_info *si_obj_info = 
                                      (abi::__si_class_type_info *)obj_info;
    if (ptr == base_ptr && 
        matching_type_info(si_obj_info->__base_type, base_info)) {
      /* The current class is the one we are looking for. */
      *found = TRUE;
    } else {
      /* The current class is not the one we are looking for.  Check its
         base class. */
      result = find_base_class_at_addr(ptr, base_ptr,
                                       si_obj_info->__base_type,
                                       base_info, found);
    }  /* if */
  } else if (typeid(*obj_info) == typeid(abi::__vmi_class_type_info)) {
    abi::__vmi_class_type_info *vmi_obj_info = 
                                     (abi::__vmi_class_type_info *)obj_info;
    for (bcsp = vmi_obj_info->__base_info;
         bcsp < vmi_obj_info->__base_info + vmi_obj_info->__base_count;
         bcsp++) {
      if (bcsp->__offset_flags & BCS_VIRTUAL) {
        new_ptr = get_virtual_base_pointer(ptr, bcsp);
      } else {
        new_ptr = (void *)(((char *)ptr) + get_offset(bcsp));
      }  /* if */
      if (new_ptr == base_ptr &&
          matching_type_info(bcsp->__base_type, base_info)) {
        /* We found a match.  Note that both the address and type must match
           because base classes can share an address. */
        result = bcsp;
        if (bcsp->__offset_flags & BCS_PUBLIC) *found = TRUE;
        break;
      }  /* if */
      if ((bcsp->__offset_flags & BCS_PUBLIC) != 0) {
        /* No match, check the base classes of this base class. */
        result = find_base_class_at_addr(new_ptr, base_ptr,
                                         bcsp->__base_type, base_info,
                                         found);
        /* Exit if the recursive call found a match. */
        if (*found) break;
      }  /* if */
    }  /* for */
  }  /* if */
#else /* !defined(__EDG_IA64_ABI) */
  for (done = FALSE, bcsp = obj_info->base_class_entries;
       bcsp != NULL && !done; done = (bcsp->flags & BCS_LAST) != 0, bcsp++) {
    /* Adjust the pointer by the offset provided in the base class
       specification. */
    new_ptr = (void*) (((char *) ptr) + bcsp->offset);
    if (bcsp->flags & BCS_VIRTUAL) {
      /* If this is a virtual base class then the offset provides the
         location of a pointer to the base class.  Dereference the
         pointer and use that value. */
      new_ptr = *((void **)new_ptr);
    }  /* if */
    if (new_ptr == base_ptr &&
        matching_type_info(bcsp->type_info, base_info)) {
      /* We found a match.  Note that both the address and type must match
         because base classes can share an address. */
      result = bcsp;
      if (bcsp->flags & BCS_PUBLIC) *found = TRUE;
      break;
    }  /* if */
    if ((bcsp->flags & BCS_PUBLIC) != 0) {
      /* No match, check the base classes of this base class. */
      result = find_base_class_at_addr(new_ptr, base_ptr,
                                       bcsp->type_info, base_info,
                                       found);
      /* Exit if the recursive call found a match. */
      if (result != NULL) break;
    }  /* if */
  }  /* for */
#endif /* !defined(__EDG_IA64_ABI) */
  return result;
}  /* find_base_class_at_addr */


/*ARGSUSED*/ /* <-- curr_base_info is not used. */
static void tbc_downcast(
		void					*ptr,
		a_type_info_impl_ptr			class_info,
		a_base_class_traversal_block_ptr	bctbp,
		a_base_class_spec_ptr			curr_base_info)
/*
This routine is called by traverse_base_classes to perform the functions
required for try_downcast.  This routine first determines whether we
are within a portion of the class hierarchy that represents the base
classes of the destination type of the case.  Once we enter that portion
of the hierarchy, we search for a public base class subobject that
matches the type and location of the source of the cast.

See try_downcast for more information.
*/
{
  if (matching_type_info(bctbp->downcast_dest_tiip, class_info)) {
    /* We have found a matching destination class and should begin looking
       for the source subobject.  The source subobject must be a public base
       so only consider public classes. */
    bctbp->downcast_dest_ptr = ptr;
    bctbp->public_only = TRUE;
#if DEBUG
    if (__debug_level >= 4) {
      fprintf(__f_debug, "Entering matching class %s (%p)\n",
              type_info_for_impl(class_info)->name(), ptr);
    }  /* if */
#endif /* DEBUG */
  } else if (bctbp->downcast_dest_ptr != NULL &&
             ptr == bctbp->downcast_source_ptr &&
             matching_type_info(class_info, bctbp->downcast_source_tiip)) {
    /* We have found the matching subobject. */
    if (bctbp->downcast_result != NULL) {
      /* A result has already been found -- this means there is more than one
         possible conversion.  Reset the result and terminate the search. */
      bctbp->downcast_result = NULL;
      bctbp->terminate = TRUE;
    } else {
      /* A result has been found (for the first time). */
      bctbp->downcast_result = bctbp->downcast_dest_ptr;
    }  /* if */
  }  /* if */
}  /* tbc_downcast */


/*ARGSUSED*/ /* <-- curr_base_info is not used. */
static void tbc_post_downcast(
		void					*ptr,
		a_type_info_impl_ptr			class_info,
		a_base_class_traversal_block_ptr	bctbp,
		a_base_class_spec_ptr			curr_base_info)
/*
This routine is called by traverse_base_classes to perform the functions
required for try_downcast.  This is the post-process routine that is
called after all base classes of the class specified by "ptr" and "class_info"
have been processed.
*/
{
  if (matching_type_info(bctbp->downcast_dest_tiip, class_info)) {
    /* We're leaving the part of the hierarchy under the destination class.
       Reset the flags set when we entered the class. */
    bctbp->downcast_dest_ptr = NULL;
    bctbp->public_only = FALSE;
#if DEBUG
    if (__debug_level >= 4) {
      fprintf(__f_debug, "Leaving matching class %s (%p)\n",
              type_info_for_impl(class_info)->name(), ptr);
    }  /* if */
#endif /* DEBUG */
  }  /* if */
}  /* tbc_post_downcast */


static void *try_downcast(void			*complete_object_ptr,
			  a_type_info_impl_ptr	object_tiip,
			  void			*source_ptr,
			  a_type_info_impl_ptr	source_tiip,
			  a_type_info_impl_ptr	dest_tiip)
/*
This routine performed the first portion of the dynamic_cast operation
as described in 5.2.7 paragraph 8:

  If, in the most derived object pointed (referred) to by v, v points
  (refers) to a public base class sub-object of a T object, and if
  only one object of type T is derived from the sub-object pointed
  (referred) to by v, the result is a pointer (an lvalue referring) to
  that T object.

This is done by walking the base classes of the complete object and
noting when we are within the derived class specified by "dest_tiip".
While within that derived class, we see if we encounter the source subobject
specified by "source_ptr".  If we find a virtual base class, we must keep
searching for a possible second matching instance.  If one is found, the
cast cannot be done.
*/
{
  a_base_class_traversal_block	block;

  clear_base_class_traversal_block(&block);
  block.process_function = tbc_downcast;
  block.process_post_function = tbc_post_downcast;
  block.downcast_dest_tiip = dest_tiip;
  block.downcast_source_tiip = source_tiip;
  block.downcast_source_ptr = source_ptr;
  traverse_base_classes(complete_object_ptr, object_tiip, &block,
                        (a_base_class_spec_ptr)NULL);
  return block.downcast_result;
}  /* try_downcast */

/*** START TI ADD ***/
#ifdef __EDG_IA64_ABI
#define DYNAMIC_CAST_ROUTINE_NAME ABI_NAMESPACE::__dynamic_cast
#else /* !defined(__EDG_IA64_ABI) */
#define DYNAMIC_CAST_ROUTINE_NAME __dynamic_cast
#endif /* !defined(__EDG_IA64_ABI) */
/*** END TI ADD ***/

#ifdef __EDG_IA64_ABI
/*ARGSUSED*/ /* <-- hint is not used in that case. */
#endif /* __EDG_IA64_ABI */
/*** START TI REPLACE ***/
EXTERN_C void *DYNAMIC_CAST_ROUTINE_NAME (void	        *class_ptr,
/*** END TI REPLACE ***/
#ifndef __EDG_IA64_ABI
			      a_vtbl_entry_ptr		vtbl_ptr,
		              a_type_info_impl_ptr	dest_tiip
#if ABI_COMPATIBILITY_VERSION >= 241
			    , void			*source_ptr,
			      a_type_info_impl_ptr	source_tiip
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
#else /* defined(__EDG_IA64_ABI) */
                              a_type_info_impl_ptr      source_tiip,
                              a_type_info_impl_ptr      dest_tiip,
                              __EDG_PTRDIFF_TYPE__      hint
#endif /* defined(__EDG_IA64_ABI) */
                              )
/*
Runtime support for dynamic_cast operations.  This routine handles

  - casts of a polymorphic objects type to void*, which is defined as
    returning a pointer to the complete object type

  - polymorphic base to derived casts

  - polymorphic cross casts

class_ptr is the source operand of the cast.  If the source is
an object (and not a pointer) then a pointer to the source operand
is used.  vtbl_ptr is a pointer to the virtual function table from
the source operand.  dest_tiip is a pointer to the type_info_impl
structure associated with the destination type.  If the source
operand is being cast to void*, dest_tiip will be NULL.

source_ptr is the original pointer being cast.  It is different from
class_ptr if the original type did not have a virtual function table
associated with it.  source_tiip is the type info pointer for the static
type of the pointer being cast.  These parameters are used to check the
access of the base class associated with the pointer being cast.

The information about the dynamic type of the source object is obtained
from entry zero of the virtual function table.

Entry zero of the virtual function table is organized differently than the
other table entries.  The information in that entry is provided to support
the dynamic_cast and typeinfo operations.  Entry zero contains the
following information:

	delta:		The offset from the complete object pointer to
			class_ptr (i.e., the value to be subtracted from
			class_ptr to get the complete object pointer.

	index:		Unused.

	function:	Pointer to the typeinfo_impl structure that
		        for the dynamic type of class_ptr.
*/
{
  void			*complete_object_ptr;
#ifndef __EDG_IA64_ABI
  size_t		offset_to_complete_object;
#else /* defined(__EDG_IA64_ABI) */
  void                  *source_ptr = class_ptr;
#endif /* defined(__EDG_IA64_ABI) */
  a_type_info_impl_ptr	object_tiip;
  void			*result = NULL;

  /* Get a pointer to the complete object. */
#ifndef __EDG_IA64_ABI
  offset_to_complete_object = vtbl_ptr->delta;
  complete_object_ptr =
                     (void*)(((char *)class_ptr) - offset_to_complete_object);
#else /* defined(__EDG_IA64_ABI) */
  complete_object_ptr = 
    (void *)(((char *)class_ptr) + (*((a_vtbl_entry_ptr *)class_ptr))[-2]);
#endif /* defined(__EDG_IA64_ABI) */
#if DEBUG
  if (__debug_level >= 3) {
    fprintf(__f_debug, "dynamic_cast: orig ptr=%p, complete obj=%p\n",
            class_ptr, complete_object_ptr);
  }  /* if */
#endif /* DEBUG */
  /* Get the pointer to the type_info associated with the source object.  */
/*** START TI ADD ***/
#pragma diag_suppress 1107
/*** END TI ADD ***/
#ifndef __EDG_IA64_ABI
  /* This is stored in the function pointer field of the vtbl entry. */
/*** START TI REPLACE ***/
  object_tiip = (a_type_info_impl_ptr) (intptr_t) vtbl_ptr->func;
/*** END TI REPLACE ***/
#else /* defined(__EDG_IA64_ABI) */
   /* In the IA-64 ABI, this is stored in the -1 entry of the vtable. */
  object_tiip = (a_type_info_impl_ptr)((*((a_vtbl_entry_ptr *)class_ptr))[-1]);
#endif /* defined(__EDG_IA64_ABI) */
/*** START TI ADD ***/
#pragma diag_default 1107
/*** END TI ADD ***/
  if (dest_tiip == NULL) {
    /* When dest_tiip is NULL, the pointer is being cast to void*.  This
       means that class_ptr is to be converted to a pointer to the
       complete object type. */
    result = complete_object_ptr;
#if ABI_COMPATIBILITY_VERSION >= 241
  } else {
    /* First attempt a downcast from the base class to one of its derived
       classes. */
    result = try_downcast(complete_object_ptr, object_tiip,
                          source_ptr, source_tiip,
                          dest_tiip);
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
  }  /* if */
  /* If this was not a cast to void* or a downcast, try the cross-cast
     processing. */
  if (result == NULL) {
    a_boolean	access_okay = TRUE;
#if ABI_COMPATIBILITY_VERSION >= 241
    /* Before doing the conversion, find the base class pointed to by the
       source pointer.  Make sure this points to an accessible base class.
       find_base_class_at_addr will return NULL if the base class is an
       indirect base class of a private base class.  It will return a pointer
       to the base class entry if it is a base class of an accessible
       base class (or if it is a direct base class).  Check the returned base
       class entry to make sure the base class is public.  The conversions
       that follow are done only if the source class is a public base class. */
    if (object_tiip == source_tiip) {
      /* The static type of the source is the same as the dynamic type. */
      access_okay = TRUE;
    } else {
      access_okay = FALSE;
      (void)find_base_class_at_addr(complete_object_ptr, source_ptr,
                                    object_tiip, source_tiip, &access_okay);
    }  /* if */
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
    if (access_okay) {
      if (matching_type_info(object_tiip, dest_tiip)) {
        /* The object is being cast to the type it actually is.  For example,
           a Base* that actually points to a Derived is being cast to a
           Derived*.  Simply return the complete object pointer. */
        result = complete_object_ptr;
      } else {
        /* The object is being cast to one of its base classes. */
        a_boolean	conversion_done;
        void		*new_ptr = NULL;
        conversion_done = __derived_to_base_conversion(
                               &complete_object_ptr, &new_ptr,
			       object_tiip, dest_tiip,
			       (an_access_flag_string*)NULL,
			       /*use_access_flags=*/FALSE);
        if (conversion_done) result = new_ptr;
      }  /* if */
    }  /* if */
  }  /* if */
  return result;
}  /* __dynamic_cast */

#ifdef __EDG_IA64_ABI
#define BAD_CAST_ROUTINE_NAME ABI_NAMESPACE::__cxa_bad_cast
#define BAD_CAST_ROUTINE_LINKAGE /*extern*/
#else /* !defined(__EDG_IA64_ABI) */
#define BAD_CAST_ROUTINE_NAME __throw_bad_cast
#define BAD_CAST_ROUTINE_LINKAGE static
#endif /* !defined(__EDG_IA64_ABI) */ 

BAD_CAST_ROUTINE_LINKAGE
void BAD_CAST_ROUTINE_NAME(void)
/*
Throw a bad cast exception.  If exception handling is not supported in
this version of the runtime, then simply abort.
*/
{
#if EXCEPTION_HANDLING
  throw STD_NAMESPACE::bad_cast();
#else /* !EXCEPTION_HANDLING */
  __abort_execution(ec_bad_cast);
#endif /* EXCEPTION_HANDLING */
}  /* BAD_CAST_ROUTINE_NAME */


#ifdef __EDG_IA64_ABI
#define BAD_TYPEID_ROUTINE_NAME ABI_NAMESPACE::__cxa_bad_typeid
#else /* !defined(__EDG_IA64_ABI) */
#define BAD_TYPEID_ROUTINE_NAME __throw_bad_typeid
#endif /* !defined(__EDG_IA64_ABI) */

EXTERN_C void BAD_TYPEID_ROUTINE_NAME(void)
/*
Throw a bad typeid exception.  If exception handling is not supported in
this version of the runtime, then simply abort.
*/
{
#if EXCEPTION_HANDLING
  throw STD_NAMESPACE::bad_typeid();
#else /* !EXCEPTION_HANDLING */
  __abort_execution(ec_bad_typeid);
#endif /* EXCEPTION_HANDLING */
}  /* BAD_TYPEID_ROUTINE_NAME */

#ifndef __EDG_IA64_ABI

EXTERN_C void *__dynamic_cast_ref(void                  *class_ptr,
			          a_vtbl_entry_ptr      vtbl_ptr,
			          a_type_info_impl_ptr  dest_tiip
#if ABI_COMPATIBILITY_VERSION >= 241
			        , void			*source_ptr,
			          a_type_info_impl_ptr	source_tiip
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
                                  )
/*
Interface to __dynamic_cast used when casting references.  This calls
__dynamic_cast and throws an exception if the cast failed.
*/
{
  void*		result;

  result = __dynamic_cast(class_ptr, vtbl_ptr, dest_tiip
#if ABI_COMPATIBILITY_VERSION >= 241
                          , source_ptr, source_tiip
#endif /* ABI_COMPATIBILITY_VERSION >= 241 */
                         );
  if (result == NULL) {
    __throw_bad_cast();
  }  /* if */
  return result;
}  /* __dynamic_cast_ref */


EXTERN_C void *__get_typeid(a_vtbl_entry_ptr	vtbl_ptr)
/*
Return the user type_info pointer from the specified virtual function
table.  If the pointer to the vtable is NULL, throw a bad_typeid
exception.
*/
{
  a_type_info_impl_ptr	tiip;

  if (vtbl_ptr == NULL) __throw_bad_typeid();
  /* Get the pointer to the type_info_impl associated with the source object. 
     This is stored in the function pointer field of the vtbl entry. */
/*** START TI REPLACE ***/
  #pragma diag_suppress 1107
  tiip = (a_type_info_impl_ptr)(intptr_t)vtbl_ptr->func;
  #pragma diag_default 1107
/*** START TI REPLACE ***/
  /* Return the address of the user type_info. */
  return (void*)&tiip->user_type_info;
}  /* __get_typeid */


#if DEBUG
EXTERN_C void __r_db_type_info(const STD_NAMESPACE::type_info&	info,
                               int				indent)
/*
Display debugging information about type information (non-IA-64 version).
*/
{
/* Define a macro used to indent the output lines. */
#define do_indent() fprintf(__f_debug, "%*s", indent, " ")
  /* Convert the user type_info pointer to a_info_impl_ptr. */
  a_type_info_impl_ptr	tiip = (a_type_info_impl_ptr)&info;
  if (indent != 0) fprintf(__f_debug, "\n");
  do_indent();
  fprintf(__f_debug, "Type information for: %s\n",
          tiip->name == NULL ? "<NULL>" : tiip->name);
  do_indent();
  fprintf(__f_debug, "  unique_id: %p\n", (void*)tiip->unique_id);
#if ABI_COMPATIBILITY_VERSION <= 237
  do_indent();
  fprintf(__f_debug, "  dtor addr: %p\n", (void*)tiip->destructor);
#endif /* ABI_COMPATIBILITY_VERSION <= 237 */
  if (tiip->base_class_entries != NULL) {
    a_base_class_spec_ptr	bcsp;
    do_indent();
    fprintf(__f_debug, "  base classes:\n");
    for (bcsp = tiip->base_class_entries;; bcsp++) {
      const char	*name = bcsp->type_info->name;
      do_indent();
      fprintf(__f_debug, "    name=%s\n", name == NULL ? "<NULL>" : name);
      do_indent();
      fprintf(__f_debug, "    offset=%0ld\n", (long)bcsp->offset);
      do_indent();
      fprintf(__f_debug, "    flags:");
      if (bcsp->flags & BCS_VIRTUAL) fprintf(__f_debug, " virtual");
      if (bcsp->flags & BCS_LAST) fprintf(__f_debug, " last");
      if (bcsp->flags & BCS_PUBLIC) fprintf(__f_debug, " public");
      if (bcsp->flags & BCS_AMBIGUOUS) fprintf(__f_debug, " ambiguous");
      if (bcsp->flags & BCS_DIRECT) fprintf(__f_debug, " direct");
      fprintf(__f_debug, "\n");
      if (bcsp->flags & BCS_LAST) break;
    }  /* for */
    /* Now display the full type information for the base classes. */
    for (bcsp = tiip->base_class_entries;; bcsp++) {
      __r_db_type_info(bcsp->type_info->user_type_info, indent + 2);
      if (bcsp->flags & BCS_LAST) break;
    }  /* for */
  }  /* if */
#undef do_indent
}  /* __r_db_type_info */


EXTERN_C void __db_type_info(const STD_NAMESPACE::type_info& info)
/*
Display debugging information about type information.  This routine
calls __r_db_type_info and supplies a zero indent value.
*/
{
  __r_db_type_info(info, 0);
  fprintf(__f_debug, "\n");
}  /* __db_type_info */
#endif /* DEBUG */

#else /* ifdef IA64_ABI */

#if DEBUG
EXTERN_C void __r_db_type_info(const STD_NAMESPACE::type_info&	info,
                               int				indent)
/*
Display debugging information about type information (IA-64 version).
*/
{
/* Define a macro used to indent the output lines. */
#define do_indent() fprintf(__f_debug, "%*s", indent, " ")
  if (indent != 0) fprintf(__f_debug, "\n");
  do_indent();
  fprintf(__f_debug, "Type information for: %s\n", info.name());
#undef do_indent
}  /* __r_db_type_info */


EXTERN_C void __db_type_info(const STD_NAMESPACE::type_info& info)
/*
Display debugging information about type information.  This routine
calls __r_db_type_info and supplies a zero indent value.
*/
{
  __r_db_type_info(info, 0);
  fprintf(__f_debug, "\n");
}  /* __db_type_info */

#endif /* DEBUG */

#endif /* ifndef IA64_ABI */

#if DEBUG

EXTERN_C void __db_type_info_impl(a_type_info_impl_ptr	tiip)
/*
Given a type info impl. entry, display the name for debugging purposes.
*/
{
  fprintf(__f_debug, "%s\n", type_info_for_impl(tiip)->name());
}  /* __db_type_info_impl */

#endif /* DEBUG */

#endif /* ABI_CHANGES_FOR_RTTI */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/

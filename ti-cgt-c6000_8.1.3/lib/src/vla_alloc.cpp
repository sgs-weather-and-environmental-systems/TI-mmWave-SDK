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

/******************************************************************************/
/*                                                                            */
/* vla_alloc.c -- Runtime support for lowered VLA operations. This            */
/* implementation is for demonstration and testing purposes only. It is not   */
/* particularly efficient, but it it should perform considerably better than  */
/* direct calls to malloc/free.                                               */
/*                                                                            */
/******************************************************************************/

#include "basics.h"
#include "runtime.h"
#include "vla_alloc.h"

#if __EDG_LOWER_VARIABLE_LENGTH_ARRAYS

/******************************************************************************/
/* The general approach to allocating VLAs is to allocate relatively small    */
/* VLAs within "normal blocks" of storage allocated with malloc. Larger VLAs  */
/* are allocated their own "special block" using malloc. This should make the */
/* common case of relatively small VLAs much faster than malloc on average.   */
/******************************************************************************/
/******************************************************************************/
/* MIN_SPECIAL_BLOCK_SIZE determines the boundary between what is considered  */
/* "relatively small" and "larger."                                           */
/******************************************************************************/
#define MIN_SPECIAL_BLOCK_SIZE  -1

/******************************************************************************/
/* Relatively small VLAs are allocated within blocks of NORMAL_BLOCK_SIZE     */
/* bytes. It is usually a good idea to choose this number to be a little      */
/* smaller than a power of 2 since many malloc implementations handle those   */
/* values best.                                                               */
/******************************************************************************/
#define NORMAL_BLOCK_SIZE       32700

typedef struct a_vla_allocation *a_vla_allocation_ptr;
typedef struct a_vla_allocation
{
   /*-------------------------------------------------------------------------*/
   /* A description of a single VLA allocation. Each call to __vla_alloc      */
   /* fills an entry like this.                                               */
   /*-------------------------------------------------------------------------*/
   a_byte *block;
   /*-------------------------------------------------------------------------*/
   /* A pointer to storage parceled out to VLAs. NULL for special blocks.     */
   /*-------------------------------------------------------------------------*/
   a_byte *storage;
   /*-------------------------------------------------------------------------*/
   /* A pointer to the storage allocated for a VLA variable.                  */
   /*-------------------------------------------------------------------------*/
   void   *frame_marker;
   /*-------------------------------------------------------------------------*/
   /* A pointer to a specific local variable of __vla_alloc. This allows for  */
   /* a more precise detection of dead allocations (allocations that are no   */
   /* longer accessible but which were not freed because of a longjmp).       */
   /*-------------------------------------------------------------------------*/
}
a_vla_allocation;

typedef struct a_vla_pool *a_vla_pool_ptr;
typedef struct a_vla_pool
{
   /*-------------------------------------------------------------------------*/
   /* Bookkeeping information for all allocations in a thread.                */
   /*-------------------------------------------------------------------------*/
   a_vla_allocation_ptr
   allocations;
   /*-------------------------------------------------------------------------*/
   /* A pointer to an array of entries describing the storage allocated to    */
   /* VLAs. The array is managed as a stack.                                  */
   /*-------------------------------------------------------------------------*/
   ptrdiff_t last_allocation;
   /*-------------------------------------------------------------------------*/
   /* The index of the next entry available in allocations.                   */
   /*-------------------------------------------------------------------------*/
   ptrdiff_t capacity;
   /*-------------------------------------------------------------------------*/
   /* The number of entries allocated in the array pointed to by allocations. */
   /*-------------------------------------------------------------------------*/
   a_byte *normal_block;
   /*-------------------------------------------------------------------------*/
   /* A pointer to the currently active normal block.                         */
   /*-------------------------------------------------------------------------*/
   ptrdiff_t normal_offset;
   /*-------------------------------------------------------------------------*/
   /* The next available offset within the currently active normal block.     */
   /*-------------------------------------------------------------------------*/
   a_byte *spare_block;
   /*-------------------------------------------------------------------------*/
   /* A previously inactive normal block available for reuse.                 */
   /*-------------------------------------------------------------------------*/
}
a_vla_pool;

/******************************************************************************/
/* A pointer to a description of a pool of VLA allocations. In a              */
/* multithreaded environment this must either be define with thread-local     */
/* storage, or it must be a macro or function that selects the appropriate    */
/* pool.                                                                      */
/******************************************************************************/
static  a_vla_pool_ptr
        curr_vla_pool;

/******************************************************************************/
/* Initialize the settings for the current VLA storage pool. This code needs  */
/* to be changed if it is to deal safely with multiple threads.               */
/******************************************************************************/
static void init_curr_vla_pool(void)
{
   static a_vla_pool pool;

   pool.last_allocation = -1;
   pool.capacity = 250;
   pool.allocations = (a_vla_allocation_ptr) malloc(
                                    pool.capacity * sizeof(a_vla_allocation));
   if (pool.allocations == NULL)
   {
      __abort_execution(ec_vla_allocation_failed);
   }                            /* if */
   pool.normal_block = NULL;
   pool.normal_offset = NORMAL_BLOCK_SIZE;
   pool.spare_block = NULL;
   curr_vla_pool = &pool;
}                               /* init_curr_vla_pool */

/******************************************************************************/
/* Double the number of allocation entries in the current pool.               */
/******************************************************************************/
static void increase_curr_vla_pool_capacity(void)
{
   curr_vla_pool->capacity *= 2;
   curr_vla_pool->allocations = (a_vla_allocation_ptr)
      realloc(curr_vla_pool->allocations,
              curr_vla_pool->capacity * sizeof(a_vla_allocation));
   if (curr_vla_pool->allocations == NULL)
   {
      __abort_execution(ec_vla_allocation_failed);
   }                            /* if */
}                               /* increase_curr_vla_pool_capacity */

/******************************************************************************/
/* ptr points into a live stack frame of the run-time support library. Free   */
/* all allocations which cannot possibly be live because they're "above" ptr  */
/* on the call stack. (This can happen as a result of longjmp calls.) This    */
/* routine is very similar to __vla_dealloc, but to keep the latter as        */
/* efficient as possible the two use separate code.                           */
/******************************************************************************/
static void free_dead_allocations(void *ptr)
{
   ptrdiff_t alloc_idx = curr_vla_pool->last_allocation;

   /*-------------------------------------------------------------------------*/
   /* Pop the stack until we find the VLA allocation that may still be live.  */
   /*-------------------------------------------------------------------------*/
   for (; alloc_idx >= 0; --alloc_idx)
   {
      a_vla_allocation_ptr allocation = &curr_vla_pool->allocations[alloc_idx];

      if ((char *)&alloc_idx > (char *)ptr)
      {
         /*-------------------------------------------------------------------*/
         /* The call stack grows with increasing addresses.                   */
         /*-------------------------------------------------------------------*/
         if ((char *)allocation->frame_marker < (char *)ptr)
         {
            break;
         }                      /* if */
      }
      else
      {
         /*-------------------------------------------------------------------*/
         /* The call stack grows with decreasing addresses.                   */
         /*-------------------------------------------------------------------*/
         if ((char *)allocation->frame_marker > (char *)ptr)
         {
            break;
         }                      /* if */
      }                         /* if */
      if (allocation->block == NULL)
      {
         /*-------------------------------------------------------------------*/
         /* A special block: Delete it right away.                            */
         /*-------------------------------------------------------------------*/
         free((void *)allocation->storage);
      }
      else
      {
         /*-------------------------------------------------------------------*/
         /* An allocation in a normal block: Compute the offset of the VLA    */
         /* storage within the block.                                         */
         /*-------------------------------------------------------------------*/
         ptrdiff_t offset = allocation->storage - allocation->block;

         if (offset == 0)
         {
            /*----------------------------------------------------------------*/
            /* All the allocations within this block should now be freed.     */
            /* Either free this block, or keep it as a spare. (The spare      */
            /* avoids pathological situations where a small VLA in a loop     */
            /* causes a large number of malloc/free calls.)                   */
            /*----------------------------------------------------------------*/
            if (curr_vla_pool->spare_block == NULL)
            {
               curr_vla_pool->spare_block = allocation->block;
            }
            else
            {
               free((void *)allocation->block);
            }                   /* if */
            curr_vla_pool->normal_block = NULL;
            curr_vla_pool->normal_offset = NORMAL_BLOCK_SIZE;
         }
         else
         {
            curr_vla_pool->normal_offset = offset;
         }                      /* if */
         curr_vla_pool->normal_offset = offset;
      }                         /* if */
   }                            /* for */
   curr_vla_pool->last_allocation = alloc_idx;
}                               /* free_dead_allocations */

/******************************************************************************/
/* ptr points to a pointer variable. Allocate n_bytes of storage and make     */
/* *ptr point to that storage.                                                */
/******************************************************************************/
EXTERN_C void __vla_alloc(void *ptr,
                          ptrdiff_t n_bytes)
{
   ptrdiff_t alloc_idx, padding;
   a_vla_allocation_ptr allocation;

   if (n_bytes == 0)
   {
      /*----------------------------------------------------------------------*/
      /* If a zero-length array is requested, allocate a single byte of       */
      /* storage.                                                             */
      /*----------------------------------------------------------------------*/
      n_bytes = 1;
   }
   else if (n_bytes < 0)
   {
      __abort_execution(ec_negative_vla_size);
   }                            /* if */
   padding = MOST_STRICT_ALIGNMENT - n_bytes % MOST_STRICT_ALIGNMENT;
   if (padding != MOST_STRICT_ALIGNMENT)
   {
      /*----------------------------------------------------------------------*/
      /* We need to make sure all allocations can accommodate the type with   */
      /* the strictest alignment.                                             */
      /*----------------------------------------------------------------------*/
      n_bytes += padding;
   }                            /* if */
   if (curr_vla_pool == NULL)
   {
      /*----------------------------------------------------------------------*/
      /* Presumably the first time a VLA is allocated in this thread.         */
      /*----------------------------------------------------------------------*/
      init_curr_vla_pool();
   }
   else
   {
      /*----------------------------------------------------------------------*/
      /* Clean up any allocations associated with (dead) local variables      */
      /* further up the call stack. Normally such allocations should have     */
      /* been deallocated already, but longjmp calls may cause leaks.         */
      /*----------------------------------------------------------------------*/
      ptrdiff_t last_idx = curr_vla_pool->last_allocation;

      if (last_idx >= 0)
      {
         if ((char *)&last_idx > (char *)ptr)
         {
            /*----------------------------------------------------------------*/
            /* The call stack grows with increasing addresses.                */
            /*----------------------------------------------------------------*/
            if ((char *)curr_vla_pool->allocations[last_idx].frame_marker >
                (char *)&alloc_idx)
            {
               free_dead_allocations((void *)&alloc_idx);
            }                   /* if */
         }
         else
         {
            /*----------------------------------------------------------------*/
            /* The call stack grows with decreasing addresses.                */
            /*----------------------------------------------------------------*/
            if ((char *)curr_vla_pool->allocations[last_idx].frame_marker <
                (char *)&alloc_idx)
            {
               free_dead_allocations((void *)&alloc_idx);
            }                   /* if */
         }                      /* if */
      }                         /* if */
   }                            /* if */
   alloc_idx = ++curr_vla_pool->last_allocation;
   if (alloc_idx == curr_vla_pool->capacity)
   {
      /*----------------------------------------------------------------------*/
      /* We ran out of allocation entries.                                    */
      /*----------------------------------------------------------------------*/
      increase_curr_vla_pool_capacity();
   }                            /* if */
   allocation = &curr_vla_pool->allocations[alloc_idx];
   allocation->frame_marker = (void *)&alloc_idx;
   if (n_bytes >= MIN_SPECIAL_BLOCK_SIZE)
   {
      /*----------------------------------------------------------------------*/
      /* Allocate a special block for this (relatively large) VLA.            */
      /*----------------------------------------------------------------------*/
      a_byte *special_block = (a_byte *) malloc(n_bytes);

      if (special_block == NULL)
      {
         __abort_execution(ec_vla_allocation_failed);
      }                         /* if */
      allocation->storage = *(a_byte **) ptr = special_block;
      /*----------------------------------------------------------------------*/
      /* Special blocks are recognizable because they are pointed to by an    */
      /* allocation entry whose block pointer is NULL.                        */
      /*----------------------------------------------------------------------*/
      allocation->block = NULL;
   }
   else
   {
      /*----------------------------------------------------------------------*/
      /* Parcel out a normal block for smaller VLAs.                          */
      /*----------------------------------------------------------------------*/
      if (curr_vla_pool->normal_block == NULL ||
          NORMAL_BLOCK_SIZE - curr_vla_pool->normal_offset < n_bytes - 1)
      {
         /*-------------------------------------------------------------------*/
         /* The currently active normal block does not have sufficient        */
         /* storage for the new VLA variable: Allocate a new block or reuse   */
         /* the spare if one is available.                                    */
         /*-------------------------------------------------------------------*/
         if (curr_vla_pool->spare_block != NULL)
         {
            curr_vla_pool->normal_block = curr_vla_pool->spare_block;
            curr_vla_pool->spare_block = NULL;
         }
         else
         {
            curr_vla_pool->normal_block = (a_byte *) malloc(NORMAL_BLOCK_SIZE);
            if (curr_vla_pool->normal_block == NULL)
            {
               __abort_execution(ec_vla_allocation_failed);
            }                   /* if */
         }                      /* if */
         curr_vla_pool->normal_offset = 0;
      }                         /* if */
      allocation->storage = *(a_byte **) ptr =
         (a_byte *) (curr_vla_pool->normal_block +
                     curr_vla_pool->normal_offset);
      allocation->block = curr_vla_pool->normal_block;
      curr_vla_pool->normal_offset += n_bytes;
   }                            /* if */
}                               /* __vla_alloc */

/******************************************************************************/
/* ptr points to a pointer variable. Deallocate the storage pointed to by     */
/* *ptr.                                                                      */
/******************************************************************************/
EXTERN_C void __vla_dealloc(void *ptr)
{
   ptrdiff_t alloc_idx = curr_vla_pool->last_allocation;

   /*-------------------------------------------------------------------------*/
   /* Pop the stack until we find the VLA allocation corresponding to the     */
   /* given pointer.                                                          */
   /*-------------------------------------------------------------------------*/
   for (;; --alloc_idx)
   {
      a_vla_allocation_ptr allocation = &curr_vla_pool->allocations[alloc_idx];

      check_assertion(alloc_idx >= 0);
      if (allocation->block == NULL)
      {
         /*-------------------------------------------------------------------*/
         /* A special block: Delete it right away.                            */
         /*-------------------------------------------------------------------*/
         free((void *)allocation->storage);
         if (allocation->storage == *(a_byte **) ptr)
         {
            break;
         }                      /* if */
      }
      else
      {
         /*-------------------------------------------------------------------*/
         /* An allocation in a normal block: Compute the offset of the VLA    */
         /* storage within the block.                                         */
         /*-------------------------------------------------------------------*/
         ptrdiff_t offset = allocation->storage - allocation->block;

         if (offset == 0)
         {
            /*----------------------------------------------------------------*/
            /* All the allocations within this block should now be freed.     */
            /* Either free this block, or keep it as a spare. (The spare      */
            /* avoids pathological situations where a small VLA in a loop     */
            /* causes a large number of malloc/free calls.)                   */
            /*----------------------------------------------------------------*/
            if (curr_vla_pool->spare_block == NULL)
            {
               curr_vla_pool->spare_block = allocation->block;
            }
            else
            {
               free((void *)allocation->block);
            }                   /* if */
            curr_vla_pool->normal_block = NULL;
            curr_vla_pool->normal_offset = NORMAL_BLOCK_SIZE;
         }
         else
         {
            curr_vla_pool->normal_offset = offset;
         }                      /* if */
         if (allocation->storage == *(a_byte **) ptr)
         {
            break;
         }                      /* if */
      }                         /* if */
   }                            /* for */
   curr_vla_pool->last_allocation = alloc_idx - 1;
}                               /* __vla_dealloc */

/******************************************************************************/
/* Interface to __vla_dealloc that takes a pointer to the array, instead of   */
/* the address of a pointer to the array.                                     */
/******************************************************************************/
EXTERN_C void __vla_dealloc_eh(void *ptr)
{
   __vla_dealloc(&ptr);
}                               /* __vla_dealloc_eh */

#if DEBUG

/******************************************************************************/
/* Return the number of active allocations (useful for complex tests).        */
/******************************************************************************/
EXTERN_C long __vla_number_of_active_allocations(void)
{
   return curr_vla_pool == NULL ? 0 : curr_vla_pool->last_allocation + 1;
}                               /* __vla_number_of_active_allocations */

#endif /* DEBUG */

#endif /* __EDG_LOWER_VARIABLE_LENGTH_ARRAYS */

/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/

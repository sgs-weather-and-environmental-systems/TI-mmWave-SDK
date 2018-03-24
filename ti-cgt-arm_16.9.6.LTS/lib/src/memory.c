/*****************************************************************************/
/*  memory.c  v16.9.6                                                        */
/*                                                                           */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                    */
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
/*****************************************************************************/
/*									     */
/*  This module contains the functions which implement the dynamic memory    */
/*  management routines. The following assumptions/rules apply:              */
/*									     */
/*   1) Packets are allocated a minimum of _M_MIN_BLOCK + _M_BLOCK_OVERHEAD  */
/*      bytes.                                                               */
/*   2) The size of the heap is set at link time, using the -heap flag       */
/*      The allocation and sizing of the heap is a cooperative effort        */
/*      involving the linker, this file, and "sysmem.c".                     */
/*   3) The heap can be reset at any time by calling the function "minit"    */
/*									     */
/*  The following items are defined in this module :			     */
/*    minit()	 : Function to initialize dynamic memory management	     */
/*    malloc()	 : Function to allocate memory from mem mgmt system.	     */
/*    calloc()	 : Allocate an clear memory from mem mgmt system.	     */
/*    realloc()  : Reallocate a packet					     */
/*    free()	 : Function to free allocated memory.			     */
/*    memalign() : Function to allocate aligned memory from mem mgmt system. */
/*---------------------------------------------------------------------------*/
/*    minsert()  : Insert a packet into free list, sorted by size	     */
/*    mremove()  : Remove a packet from the free list.			     */
/*    sys_free	 : Pointer to free list 				     */
/*									     */
/*****************************************************************************/
#include <stdlib.h>
#include <string.h>
#include <_lock.h>
#include <stdint.h>        /* For SIZE_MAX. */

/*---------------------------------------------------------------------------*/
/* UTILITY MACRO TO ROUND UP THE VALUE TO BE A MULTIPLE OF ALN.               */
/*---------------------------------------------------------------------------*/
#define _M_RNDUP(val,aln)	(((val) + (aln-1)) & ~(aln-1))

/*---------------------------------------------------------------------------*/
/* Type that is used to initialize memory in calloc. If we make sure that    */
/* the block allocated is always                                             */
/* 1) a multiple of the size of this type                                    */
/* 2) aligned at the alignment requirement of this type                      */
/* then we could use this type to zero out the memory which would be more    */
/* efficient than using char.                                                */
/* In essence, this is the largest type that can be safely used to access    */
/* the memory blocks. In other words, the type of the minimum block.         */
/*---------------------------------------------------------------------------*/
#define _M_MIN_BLOCK_TYPE		long

/*---------------------------------------------------------------------------*/
/* _M_MIN_ALN macro determines the minimum alignment required for any memory */
/* allocated by the allocation routines. This minimum alignment should be    */
/* strong enough for the largest type the target supports. For ARM long long */
/* is the largest type supported.                                            */
/*---------------------------------------------------------------------------*/
#define _M_MIN_ALN   (__ALIGNOF__(long long))

/*---------------------------------------------------------------------------*/
/* _M_MIN_BLOCK      - The size of the smallest block that can be allocated. */
/*                     In other words, the block is allocated in multiples   */
/*                     of this value.                                        */
/*                                                                           */
/* _M_BLOCK_OVERHEAD - The size of the overhead for each block. For each     */
/*                     block allocated we keep the size of the block in a    */
/*                     size_t type variable (PACKET::packet_size) and hence  */
/*                     the actual overhead is sizeof(size_t). Since we       */
/*                     always need to allocate memory in multiples of        */
/*                     _M_MIN_BLOCK, the block overhead should be            */
/*                     _M_RNDUP(sizeof(size_t), _M_MIN_BLOCK) which in ARM's */
/*                     case happens to be _M_MIN_BLOCK.                      */
/*---------------------------------------------------------------------------*/
#define _M_MIN_BLOCK       sizeof(_M_MIN_BLOCK_TYPE)
#define _M_BLOCK_OVERHEAD  _M_MIN_BLOCK
#define _M_BLOCK_USED      1

/*---------------------------------------------------------------------------*/
/*                 HEAP setup for 64-bit alignment                           */
/*                                                                           */
/* If _M_MIN_ALN is 8-bytes (say long long is aligned at 8-byte), then       */
/* the memory allocated should always be 8-byte aligned. The optimal way     */
/* to implement 8-byte alignment is as follows:                              */
/*                                                                           */
/* 1. Align _sys_memory to 8-bytes.                                          */
/* 2. Allocate the first block at an ODD 8-byte alignment by allocating a    */
/*    one time padding of 4-bytes.                                           */
/* 3. Allocating block overhead of 4-bytes in this block makes the actual    */
/*    memory allocated for the user 8-byte aligned.                          */
/* 4. For the consecutive blocks if we make sure the block is ODD 8-bytes    */
/*    aligned, we would always align the user allocated memory at 8-bytes.   */
/*    This odd alignment of the block is achieved by rounding up the size    */
/*    of block including the overhead to 8-bytes.                            */
/*                                                                           */
/* The heap starts as follows in this case:                                  */
/*                                                                           */
/*                                     +-----------------------------+       */
/*                                     |       size_ptr              |       */
/*    mem alloced; 64-bit aligned <----+-----------------------------+       */
/*                                     |      packet_size            |       */
/*            Odd 64-bi alignment <----+-----------------------------+       */
/*                                     | one time 4 byte padding     |       */
/*    _sys_memory (64-bit aligned)     +-----------------------------+       */
/*                                                                           */
/* _M_ONE_TIME_PAD - The macro that calculates the one time padding required */
/*                   This is 4 for 8-byte minimum alignment and 0 otherwise. */
/*                                                                           */
/*---------------------------------------------------------------------------*/
#define _M_ONE_TIME_PAD	((_M_MIN_ALN) - (_M_BLOCK_OVERHEAD))

/*---------------------------------------------------------------------------*/
/* _M_SYS_FIRST - The address of the first block. Account for the one time   */
/*                padding from _sys_memory.                                  */
/*---------------------------------------------------------------------------*/
#define _M_SYS_FIRST	((PACKET *)((char *)_sys_memory + _M_ONE_TIME_PAD))

/*---------------------------------------------------------------------------*/
/* "PACKET" is the template for a data packet.  Packet size contains         */
/* the number of bytes allocated for the user, excluding the size required   */
/* for management of the packet (_M_BLOCK_OVERHEAD bytes).  Packets are      */
/* always allocated memory in _M_MIN_BLOCK byte chunks. The lowest order bit */
/* of the size field is used to indicate whether the packet is free(0) or    */
/* used(1). The size_ptr field is used to manage the free list, and is a     */
/* pointer to the next element in the free list.  The free list is sorted by */
/* size.                                                                     */
/*---------------------------------------------------------------------------*/
typedef struct pack 
{
    size_t        packet_size;     /* number of bytes        */
    struct pack  *size_ptr;        /* next elem in free list */
} PACKET;

/*---------------------------------------------------------------------------*/
/* _SYSMEM_SIZE is a symbol whose *address* is set by the linker to the      */
/* size of the heap, via the -heap flag.                                     */
/*---------------------------------------------------------------------------*/
#ifdef __TI_EABI_SUPPORT__
#define _SYSMEM_SIZE __SYSMEM_SIZE
#endif

extern int _SYSMEM_SIZE;              /* address = size of heap */

/*---------------------------------------------------------------------------*/
/* Size of the heap area as defined by the linker.                           */
/*---------------------------------------------------------------------------*/
static int _memory_size = (int)&_SYSMEM_SIZE;

/*---------------------------------------------------------------------------*/
/* Define the heap memory area.  Note that allocated space is actually       */
/* (re)allocated in the linker.  The object must appear in the ".sysmem"     */
/* data section, and it must be aligned properly.                            */
/*---------------------------------------------------------------------------*/
/* Autoinitialize the first packet to indicate a single heap packet whose    */
/* size is equal to the total heap minus the size of the header (a PACKET).  */
/* This is equivalent to calling minit() at boot time.                       */
/*---------------------------------------------------------------------------*/
#pragma DATA_SECTION(_sys_memory, ".sysmem")

PACKET _sys_memory[1];

#define heap_mem ((char *)_sys_memory)

/*---------------------------------------------------------------------------*/
/* Align _sys_memory_to the alignment requirement of the long long type.     */
/*---------------------------------------------------------------------------*/
#pragma DATA_ALIGN(_sys_memory, __ALIGNOF__(long long));

/*---------------------------------------------------------------------------*/
/* SYS_FREE - This variable is a pointer to the free list.                   */
/*---------------------------------------------------------------------------*/
static PACKET *sys_free = _sys_memory;

/*---------------------------------------------------------------------------*/
/* If we have a one time padding, then we can not use autoinitialization to  */
/* set up the first packet. We need to call minit() to initialize the first  */
/* packet.                                                                   */
/*---------------------------------------------------------------------------*/
static int need_mem_init = 1;

/*---------------------------------------------------------------------------*/
/* Function declarations                                                     */
/*---------------------------------------------------------------------------*/
static void minsert(PACKET *);         /* insert a packet into the free list */
static void mremove(PACKET *);         /* delete packet from the free list   */
void minit(void);         

/*****************************************************************************/
/*                                                                           */
/*  CHECK_ALLOC_SIZE - Verify that an allocation of the requested size is    */
/*                     possible without an overflow during the process.      */
/*                                                                           */
/*****************************************************************************/
inline static int check_alloc_size(size_t size)
{
    /*-----------------------------------------------------------------------*/
    /* Make sure the value of size is small enough that we will not overflow */
    /* the size_t type in the malloc/realloc calculations.  SDSCM00049633.   */
    /*-----------------------------------------------------------------------*/
    if (size > (SIZE_MAX - _M_BLOCK_OVERHEAD - _M_MIN_ALN - 1))
        return 0;
    return 1;
}

/*****************************************************************************/
/*									     */
/*  MINSERT - Insert a packet into the free list.  This list is sorted by    */
/*	      size in increasing order. 				     */
/*									     */
/*****************************************************************************/
static void minsert(PACKET *ptr)
{
    register PACKET *current = (PACKET *) sys_free;
    register PACKET *last    = NULL;

    /*-----------------------------------------------------------------------*/
    /* CHECK SPECIAL CASE, EMPTY FREE LIST.				     */
    /*-----------------------------------------------------------------------*/
    if (current == NULL)
    {
        sys_free      = ptr;
        ptr->size_ptr = NULL;
        return;
    }

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH LIST, LOOKING FOR A LARGER PACKET.			     */
    /*-----------------------------------------------------------------------*/
    while (current && current->packet_size < ptr->packet_size)
    {
	last	= current;
	current = current->size_ptr;
    }

    /*-----------------------------------------------------------------------*/
    /* LINK THE NEW PACKET INTO THE LIST. THERE ARE THREE CASES :	     */
    /*	 THE NEW POINTER WILL EITHER BE THE FIRST, THE LAST, OR IN THE	     */
    /*	 MIDDLE SOMEWHERE.						     */
    /*-----------------------------------------------------------------------*/
    if (current == NULL) 	        /* PTR WILL BE LAST IN LIST          */
    {
        last->size_ptr = ptr;
        ptr->size_ptr  = NULL;
    }
    else if (last == NULL)	        /* PTR WILL BE FIRST IN THE LIST     */
    {
        ptr->size_ptr  = sys_free;
        sys_free       = ptr;
    }
    else			        /* PTR IS IN THE MIDDLE OF THE LIST  */
    {
        ptr->size_ptr  = current;
        last->size_ptr = ptr;
    }
}


/*****************************************************************************/
/*									     */
/* MREMOVE - REMOVE AN ITEM FROM THE FREE LIST. 			     */
/*									     */
/*****************************************************************************/
static void mremove(PACKET *ptr)
{
    register PACKET *current = sys_free;
    register PACKET *last    = NULL;

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH LIST, LOOKING FOR PACKET TO REMOVE                       */
    /*-----------------------------------------------------------------------*/
    while (current && current != ptr)
    {
	last	= current;
	current = current->size_ptr;
    }

    /*-----------------------------------------------------------------------*/
    /* REMOVE THE PACKET FROM THE LIST.   THERE ARE TWO CASES :              */
    /*   THE OLD POINTER WILL EITHER BE THE FIRST, OR NOT THE FIRST.         */
    /*-----------------------------------------------------------------------*/
    if      (current == NULL) sys_free       = NULL;          /* NOT FOUND   */
    else if (last    == NULL) sys_free       = ptr->size_ptr; /* 1ST IN LIST */
    else                      last->size_ptr = ptr->size_ptr; /* MID OF LIST */
}

/*****************************************************************************/
/*									     */
/*  MINIT - This function can be called by the user to completely reset the  */
/*	    memory management system.					     */
/*									     */
/*****************************************************************************/
void minit(void)
{
    _lock();

    /*-----------------------------------------------------------------------*/
    /* TO INITIALIZE THE MEMORY SYSTEM, SET UP THE FREE LIST TO POINT TO     */
    /* THE ENTIRE HEAP, AND INITIALIZE HEAP TO A SINGLE EMPTY PACKET.        */
    /*-----------------------------------------------------------------------*/
    sys_free = _M_SYS_FIRST;

    sys_free->packet_size = _memory_size - _M_BLOCK_OVERHEAD - _M_ONE_TIME_PAD;
    sys_free->size_ptr	  = NULL;

    need_mem_init = 0;              /* Mark that memory has been initialized */

    _unlock();
}

/*****************************************************************************/
/*									     */
/*  MALLOC - Allocate a packet of a given size, and return a pointer to it.  */
/*	     This function only allocates in multiples of _M_MIN_BLOCK bytes.*/
/*									     */
/*****************************************************************************/
void *malloc(size_t size)
{
    register PACKET *current;
    register size_t  newsize;
    register size_t  oldsize;

    if (size <= 0) return NULL;

    if (check_alloc_size(size) == 0) return 0;

    if (need_mem_init)  minit();

    _lock();

    /*-----------------------------------------------------------------------*/
    /* SIZE IS CALCULATED BY FIRST ALIGNING (SIZE + BLOCK OVERHEAD) TO THE   */
    /* REQUIRED MINIMUM ALIGNMENT AND THEN SUBTRACTING THE BLOCK OVERHEAD.   */
    /*-----------------------------------------------------------------------*/
    newsize = _M_RNDUP((size + _M_BLOCK_OVERHEAD), _M_MIN_ALN) - 
	                                                    _M_BLOCK_OVERHEAD;

    current = sys_free;

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH FREE LIST FOR PACKET LARGE ENOUGH TO CONTAIN PACKET      */
    /*-----------------------------------------------------------------------*/
    while (current && current->packet_size < newsize)
       current = current->size_ptr;

    if (!current)
    {
	_unlock();
	return NULL;
    }
    
    oldsize = current->packet_size;	    /* REMEMBER OLD SIZE	     */
    mremove(current);		            /* REMOVE PACKET FROM FREE LIST  */

    /*-----------------------------------------------------------------------*/
    /* IF PACKET IS LARGER THAN NEEDED, FREE EXTRA SPACE AT END	             */
    /* BY INSERTING REMAINING SPACE INTO FREE LIST.			     */
    /*-----------------------------------------------------------------------*/
    if (oldsize - newsize >= (_M_MIN_BLOCK + _M_BLOCK_OVERHEAD))
    {
       register PACKET *next = 
	       (PACKET *) ((char *) current + _M_BLOCK_OVERHEAD + newsize);
 
       next->packet_size    = oldsize - newsize - _M_BLOCK_OVERHEAD;
       minsert(next);
       current->packet_size = newsize;
    }

   current->packet_size |= _M_BLOCK_USED;
   _unlock();
   return (char *)current + _M_BLOCK_OVERHEAD;
}

/*****************************************************************************/
/*									     */
/*  CALLOC - Allocate a packet of a given size, set the data in the packet   */
/*	     to nulls, and return a pointer to it.			     */
/*									     */
/*****************************************************************************/
void *calloc(size_t num, size_t size)
{
    register size_t      i	 = size * num;
    register _M_MIN_BLOCK_TYPE *current = (_M_MIN_BLOCK_TYPE *)malloc(i);
    register void       *save    = current;

    if (current == 0) return NULL;

    i = _M_RNDUP(i, _M_MIN_BLOCK) / sizeof(_M_MIN_BLOCK_TYPE);

    while (i--) *current++ = 0;
    return save;
}

/*****************************************************************************/
/*									     */
/*  REALLOC - Reallocate a packet to a new size.			     */
/*									     */
/*****************************************************************************/
void *realloc(void *packet, size_t size)
{
    register char    *pptr    = (char *) packet - _M_BLOCK_OVERHEAD;
    register size_t   newsize;
    register size_t   oldsize;

    if (packet == 0)  return malloc(size);
    if (size   == 0)  { free(packet); return NULL; }

    if (check_alloc_size(size) == 0) return 0;

    if (need_mem_init)  minit();

    _lock();

    /*-----------------------------------------------------------------------*/
    /* NEW SIZE IS CALCULATED BY FIRST ALIGNING (SIZE+BLOCK OVERHEAD) TO THE */
    /* REQUIRED MINIMUM ALIGNMENT AND THEN SUBTRACTING THE BLOCK OVERHEAD.   */
    /*-----------------------------------------------------------------------*/
    newsize = _M_RNDUP((size + _M_BLOCK_OVERHEAD), _M_MIN_ALN) - 
	                                                    _M_BLOCK_OVERHEAD;

    oldsize = ((PACKET *)pptr)->packet_size;

    if (!(oldsize & _M_BLOCK_USED)) { _unlock(); return NULL; }
    if (newsize == --oldsize)       { _unlock(); return packet; }

    /*-----------------------------------------------------------------------*/
    /* IF NEW SIZE IS LESS THAN CURRENT SIZE, TRUNCATE PACKET AND RETURN END */
    /* TO FREE LIST		                                             */
    /*-----------------------------------------------------------------------*/
    if (newsize < oldsize)
    {
       if (oldsize - newsize < (_M_MIN_BLOCK + _M_BLOCK_OVERHEAD))
       {
	  _unlock();
	  return packet;
       }
       ((PACKET *)pptr)->packet_size = newsize | _M_BLOCK_USED;

       oldsize -= newsize + _M_BLOCK_OVERHEAD;
       pptr    += newsize + _M_BLOCK_OVERHEAD;
       ((PACKET *)pptr)->packet_size = oldsize | _M_BLOCK_USED;
       free(pptr + _M_BLOCK_OVERHEAD);
       _unlock();
       return packet;
    }

    /*-----------------------------------------------------------------------*/
    /* IF NEW SIZE IS BIGGER THAN CURRENT PACKET,		             */
    /*	1) CHECK NEXT PACKET IN LIST, SEE IF PACKET CAN BE EXPANDED          */
    /*	2) IF NOT, MOVE PACKET TO NEW LOCATION. 		             */
    /*-----------------------------------------------------------------------*/
    else
    {
	PACKET *next = (PACKET *)(pptr + oldsize + _M_BLOCK_OVERHEAD);
	int     temp;

	if (((char *)next < &heap_mem[_memory_size - _M_BLOCK_OVERHEAD]) &&
           (!(next->packet_size & _M_BLOCK_USED))                        &&
           ((temp = oldsize + next->packet_size +_M_BLOCK_OVERHEAD - newsize) 
	                                                      >= 0))
	{
	    mremove(next);
	    if (temp < _M_MIN_BLOCK + _M_BLOCK_OVERHEAD)
	    {
	       ((PACKET *)pptr)->packet_size = newsize + temp | _M_BLOCK_USED;
	       _unlock();
	       return packet;
	    }

	    ((PACKET *)pptr)->packet_size = newsize | _M_BLOCK_USED;
	    pptr += newsize + _M_BLOCK_OVERHEAD;
	    ((PACKET *)pptr)->packet_size = temp - _M_BLOCK_OVERHEAD;
	    minsert((PACKET *)pptr);
	    _unlock();
	    return packet;
	}
	else
	{
            /*---------------------------------------------------------------*/
	    /* ALLOCATE NEW PACKET AND MOVE DATA INTO IT. 	             */
            /*---------------------------------------------------------------*/
	    register char *new_packet = (char *)malloc(size);
	    if (new_packet == 0) { _unlock(); return NULL; }
	    memcpy(new_packet, packet, oldsize);
	    free(packet);
	    _unlock();
	    return new_packet;
	}
    }
}

/*****************************************************************************/
/*									     */
/*  FREE - Return a packet allocated by malloc to free memory pool.	     */
/*	   Return NULL if successful, -1 if not successful.		     */
/*									     */
/*****************************************************************************/
void free(void *packet)
{
    register char   *ptr = (char *)packet;
    register PACKET *last;	      /* POINT TO PREVIOUS PACKET            */
    register PACKET *current;	      /* POINTER TO THIS PACKET              */
    register PACKET *next;	      /* POINTER TO NEXT PACKET              */

    if (ptr == NULL) return;

    last = next = NULL;		      /* INITIALIZE POINTERS                 */
    ptr -= _M_BLOCK_OVERHEAD;	      /* ADJUST POINT TO BEGINNING OF PACKET */

    if (need_mem_init)  minit();

    _lock();

    current = _M_SYS_FIRST;

    /*-----------------------------------------------------------------------*/
    /* SEARCH FOR THE POINTER IN THE PACKET POINTED TO			     */
    /*-----------------------------------------------------------------------*/
    while (current < (PACKET *) ptr)
    {
        last    = current;
        current = (PACKET *)((char *)current + 
		  (current->packet_size & ~_M_BLOCK_USED) + _M_BLOCK_OVERHEAD);
    }

    /*-----------------------------------------------------------------------*/
    /* CHECK FOR POINTER OR PACKET ERRORS.				     */
    /*-----------------------------------------------------------------------*/
    if ((current != (PACKET *)ptr) || (!(current->packet_size & _M_BLOCK_USED)))
    {
	 _unlock();
         return;
    }

    current->packet_size &= ~_M_BLOCK_USED;   /* MARK PACKET AS FREE */

    /*-----------------------------------------------------------------------*/
    /* GET POINTER TO NEXT PACKET IN MEMORY, IF ANY.			     */
    /*-----------------------------------------------------------------------*/
    next = (PACKET *)((char *)current + _M_BLOCK_OVERHEAD + 
	                                             current->packet_size);
    if (next > (PACKET *) &heap_mem[_memory_size - _M_BLOCK_OVERHEAD]) 
	next = NULL;

    if (last && last->packet_size & _M_BLOCK_USED) last = NULL;
    if (next && next->packet_size & _M_BLOCK_USED) next = NULL;

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE THREE PACKETS (PREVIOUS, CURRENT, NEXT)	     */
    /*-----------------------------------------------------------------------*/
    if (last && next)
    {
	mremove(last);
	mremove(next);
	last->packet_size += current->packet_size + next->packet_size + 
			     _M_BLOCK_OVERHEAD + _M_BLOCK_OVERHEAD;
	minsert(last);
	_unlock();
	return;
    }

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE CURRENT WITH LAST PACKET. (LAST, CURRENT)     */
    /*-----------------------------------------------------------------------*/
    if (last)
    {
	mremove(last);
	last->packet_size += current->packet_size + _M_BLOCK_OVERHEAD;
	minsert(last);
	_unlock();
	return;
    }

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE CURRENT WITH NEXT PACKET. (CURRENT, NEXT)     */
    /*-----------------------------------------------------------------------*/
    if (next)
    {
       mremove(next);
       current->packet_size += next->packet_size + _M_BLOCK_OVERHEAD;
       minsert(current);
	_unlock();
       return;
    }

    /*-----------------------------------------------------------------------*/
    /* NO COLLESCENCE POSSIBLE, JUST INSERT THIS PACKET INTO LIST	     */
    /*-----------------------------------------------------------------------*/
    minsert(current);
    _unlock();
}

/*****************************************************************************/
/*                                                                           */
/*  MEMALIGN - Allocate a packet of a given size, and on a given boundary.   */
/*                                                                           */
/*****************************************************************************/
void *memalign(size_t alignment, size_t size)
{
    PACKET *aln_packet;
    PACKET *current;
    size_t  newsize;
    size_t  aln_mask = alignment - 1;
    int     leftover = -1;
    char   *aln_start;
    char   *un_aln_start;
 
    if (size <= 0) return NULL;

    if (check_alloc_size(size) == 0) return NULL;
      
    /*--------------------------------------------------------------------*/
    /* IF ALIGNMENT IS NOT A POWER OF TWO OR IS LESS THAN THE DEFAULT     */
    /* ALIGNMENT OF MALLOC, THEN SIMPLY RETURN WHAT MALLOC RETURNS.       */
    /*--------------------------------------------------------------------*/
    if (alignment <= _M_MIN_ALN || (alignment & (alignment-1)))
	  return malloc(size);

    if (need_mem_init)  minit();

    _lock();

    newsize = _M_RNDUP((size + _M_BLOCK_OVERHEAD), _M_MIN_ALN) - 
	                                                    _M_BLOCK_OVERHEAD;

    current = sys_free;

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH FREE LIST FOR PACKET LARGE ENOUGH TO CONTAIN ALIGNED     */
    /* PACKET                                                                */
    /*-----------------------------------------------------------------------*/
    for ( ; current ; current = current->size_ptr)
    {
       un_aln_start = (char *) current + _M_BLOCK_OVERHEAD;
       /*--------------------------------------------------------------------*/
       /* IT IS POSSIBLE THAT WE COULD OVERFLOW THE size_t TYPE BELOW, BUT   */
       /* ADDING A CHECK HERE WOULD LIKELY BE A SIGNIFICANT PERFORMANCE HIT. */
       /*--------------------------------------------------------------------*/
       aln_start    = (char *)(((size_t) un_aln_start + aln_mask) & ~aln_mask);
       leftover     = un_aln_start + current->packet_size - aln_start -newsize;

       /*--------------------------------------------------------------------*/
       /* MAKE SURE THAT THE PRE BLOCK SPACE IS LARGE ENOUGH TO BE A BLOCK   */
       /* OF ITS OWN.                                                        */
       /*--------------------------------------------------------------------*/
       for ( ; (char *)current+sizeof(PACKET) > aln_start-_M_BLOCK_OVERHEAD ;
	       aln_start += alignment, leftover -= alignment);

       if (leftover >= 0) break;
    }

    if (!current) { _unlock(); return NULL; }

    /*-----------------------------------------------------------------------*/
    /* SETUP NEW PACKET FOR ALIGNED MEMORY.                                  */
    /*-----------------------------------------------------------------------*/
    mremove(current);
    aln_packet              = (PACKET *) (aln_start - _M_BLOCK_OVERHEAD);
    aln_packet->packet_size = newsize | _M_BLOCK_USED;

    /*-----------------------------------------------------------------------*/
    /* HANDLE THE FREE SPACE BEFORE THE ALIGNED BLOCK.  IF THE ORIGINAL      */
    /* BLOCK WAS ALIGNED, THERE WON'T BE FREE SPACE BEFORE THE ALIGNED BLOCK.*/
    /*-----------------------------------------------------------------------*/
    if (aln_start != un_aln_start) 
    {
	current->packet_size = (char *)aln_packet - un_aln_start;
	minsert(current);
    }

    /*-----------------------------------------------------------------------*/
    /* HANDLE THE FREE SPACE AFTER THE ALIGNED BLOCK. IF IT IS LARGE ENOUGH  */
    /* TO BE A BLOCK OF ITS OWN, THEN MAKE IT ONE, OTHERWISE ADD THE         */
    /* LEFTOVER SIZE TO THE ALIGNED BLOCK.                                   */ 
    /*-----------------------------------------------------------------------*/ 
    if (leftover >= _M_BLOCK_OVERHEAD + _M_MIN_BLOCK)
    {
       register PACKET *next = (PACKET *) (aln_start + newsize);
       next->packet_size     = leftover - _M_BLOCK_OVERHEAD;
       minsert(next);
    }
    else aln_packet->packet_size += leftover;

    _unlock();
    return aln_start;
}
       

#ifdef MALLOC_DEBUG
/*****************************************************************************/
/*									     */
/*  MEMMAP -  Print dynamic memory allocation statistics                     */
/*									     */
/*****************************************************************************/
#include <stdio.h>
#ifndef MAX
#define MAX(a,b) ((a) > (b) ? (a) : (b))
#endif

void memmap()
{
    PACKET *current;
    int free_block_num		= 0;
    int free_block_space	= 0;
    int free_block_max		= 0;
    int used_block_num		= 0;
    int used_block_space	= 0;
    int used_block_max		= 0;

    if (need_mem_init)  minit();

    _lock();

    current = _M_SYS_FIRST;

    /*-----------------------------------------------------------------------*/
    /* LOOP THROUGH ALL PACKETS                                              */
    /*-----------------------------------------------------------------------*/
    while (current < (PACKET *) &heap_mem[_memory_size-_M_BLOCK_OVERHEAD]) 
    {
	int size = current->packet_size & ~_M_BLOCK_USED;
        int used = current->packet_size & _M_BLOCK_USED;

        printf(">> Used:%1d size:%d addr:%x\n", used, size, current);

        if (used)
	{
	    used_block_num++;
	    used_block_space += size;
	    used_block_max   = MAX(used_block_max, size);
	}
	else
	{
	    free_block_num++;
	    free_block_space += size;
	    free_block_max   = MAX(free_block_max, size);
	}

        current = (PACKET *)((char *)current + size + _M_BLOCK_OVERHEAD);
    }

    printf("fr_nm:%d fr_sp:%d fr_mx:%d us_nm:%d us_sp:%d us_mx:%d ovr:%d\n\n", 
	    free_block_num, free_block_space, free_block_max,
	    used_block_num, used_block_space, used_block_max,
	    (free_block_num + used_block_num) * _M_BLOCK_OVERHEAD);

    _unlock();
    fflush(stdout);
}
#endif

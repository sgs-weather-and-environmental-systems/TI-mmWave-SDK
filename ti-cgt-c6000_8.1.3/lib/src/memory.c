/*****************************************************************************/
/*  memory.c v8.1.3							     */
/*                                                                           */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                    */
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
/*  IMPORTANT!!!                                                             */
/*									     */
/*  This module contains the functions which implement the dynamic memory    */
/*  management routines. The following assumptions/rules apply:              */
/*									     */
/*   1) Packets are allocated a minimum of MIN_BLOCK + BLOCK_OVERHEAD bytes. */
/*                                                                           */
/*   2) The size of the heap is set at link time, using the -heap flag       */
/*      The allocation and sizing of the heap is a cooperative effort        */
/*      involving the linker, this file, and "sysmem.c".                     */
/*                                                                           */
/*   3) The heap can be reset at any time by calling the function "minit"    */
/*                                                                           */
/*   4) For multi-threaded applications, the heap is considered a SHARED     */
/*      resource. RTS takes responsibility for ensuring single-threaded      */
/*      access to the packet free list via use of the __TI_LOCK_HEAP_ALLOC   */
/*      mutex. The RTS does not support coherency of dynamically allocated   */
/*      objects at this time (which includes the packet free list itself).   */
/*      It is anticipated that a multi-threaded application will use a       */
/*      shared heap memory system provided by the underlying runtime OS      */
/*      (instead of the RTS heap memory system).                             */
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
#include <limits.h>
#include <_mutex.h>
#include <_data_synch.h>

/*---------------------------------------------------------------------------*/
/* MIN_BLOCK MUST BE A MULTIPLE OF THE SIZEOF (LARGE_TYPE)                   */
/*---------------------------------------------------------------------------*/
#define LARGE_TYPE      long double
#define MIN_BLOCK       sizeof(LARGE_TYPE)
#define BLOCK_OVERHEAD  MIN_BLOCK
#define BLOCK_USED      1
#define BLOCK_MASK      (MIN_BLOCK-1)

/*---------------------------------------------------------------------------*/
/* "PACKET" is the template for a data packet.  Packet size contains         */
/* the number of bytes allocated for the user, excluding the size required   */
/* for management of the packet (BLOCK_OVERHEAD bytes).  Packets are always  */
/* allocated memory in MIN_BLOCK byte chunks. The lowest order bit of the    */
/* size field is used to indicate whether the packet is free(0) or used(1).  */
/* The size_ptr field is used to manage the free list, and is a pointer      */
/* to the next element in the free list.  The free list is sorted by size.   */
/*---------------------------------------------------------------------------*/
typedef struct pack 
{
    unsigned int packet_size;     /* number of bytes        */
    struct pack  *size_ptr;       /* next elem in free list */
} PACKET;

/*---------------------------------------------------------------------------*/
/* _SYSMEM_SIZE is a symbol whose *address* is set by the linker to the      */
/* size of the heap, via the -heap flag.                                     */
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/
/* Rename _SYSMEM_SIZE so that the linkage name remains __SYSMEM_SIZE in ELF */
/*---------------------------------------------------------------------------*/
#ifdef __TI_EABI__
#define _SYSMEM_SIZE __TI_SYSMEM_SIZE
#endif

extern _DATA_ACCESS int _SYSMEM_SIZE;              /* address = size of heap */
 
/*---------------------------------------------------------------------------*/
/* Size of the heap area as defined by the linker.                           */
/*---------------------------------------------------------------------------*/
static _DATA_ACCESS int _memory_size = (int)&_SYSMEM_SIZE;
 
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
#pragma DATA_ALIGN(_sys_memory, 8)

#ifdef __TI_EABI__
far PACKET _sys_memory[1];
#define minit _minit
static int need_mem_init = 1;
#else
#pragma diag_suppress 172
far PACKET _sys_memory[1] = { ((size_t)&_SYSMEM_SIZE) - sizeof(PACKET), 0 };
#pragma diag_default 172
#endif
 
#define heap_mem ((char *)_sys_memory)

/*---------------------------------------------------------------------------*/
/* SYS_FREE - This variable is a pointer to the free list.                   */
/*---------------------------------------------------------------------------*/
static _DATA_ACCESS PACKET *sys_free = _sys_memory;

/*---------------------------------------------------------------------------*/
/* Function declarations                                                     */
/*---------------------------------------------------------------------------*/
static void minsert(PACKET *);         /* insert a packet into the free list */
static void mremove(PACKET *);         /* delete packet from the free list   */

extern _CODE_ACCESS void minit(void);         

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
    /* the unsigned int type in the memory size calculations.  SDSCM00049633.*/
    /*-----------------------------------------------------------------------*/
    if (size > (UINT_MAX - BLOCK_OVERHEAD - BLOCK_MASK - 1))
        return 0;
    return 1;
}

/*****************************************************************************/
/*									     */
/*  MINSERT - Insert a packet into the free list.  This list is sorted by    */
/*	      size in increasing order. 				     */
/*									     */
/*---------------------------------------------------------------------------*/
/* NOTE: All calls to minsert() should occur inside a critical section that  */
/*       is guarded by the __TI_LOCK_HEAP_ALLOC resource mutex.              */
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
/*---------------------------------------------------------------------------*/
/* NOTE: All calls to mremove() should occur inside a critical section that  */
/*       is guarded by the __TI_LOCK_HEAP_ALLOC resource mutex.                     */
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
/*---------------------------------------------------------------------------*/
/* NOTE: All calls to minit() in this file are within a __TI_LOCK_HEAP_ALLOC */
/*       critical section. However, minit() is part of the public API for    */
/*       whatever reason, so we need to protect access to the packet list    */
/*       and the need_mem_init flag using a __TI_LOCK_HEAP_ALLOC mutex.      */
/*****************************************************************************/
_CODE_ACCESS void minit(void)
{
    /*-----------------------------------------------------------------------*/
    /* TO INITIALIZE THE MEMORY SYSTEM, SET UP THE FREE LIST TO POINT TO     */
    /* THE ENTIRE HEAP, AND INITIALIZE HEAP TO A SINGLE EMPTY PACKET.        */
    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list and           */
    /* need_mem_init flag (see note #4 in file header comment).              */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

#ifdef __TI_EABI__
    if (!need_mem_init) 
    { 
       __TI_data_synch_INV(&need_mem_init, sizeof(need_mem_init)); 
       __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
       return;
    }
#endif

    sys_free = _sys_memory;

    sys_free->packet_size = _memory_size - BLOCK_OVERHEAD;
    sys_free->size_ptr	  = NULL;
#ifdef __TI_EABI__
    need_mem_init = 0;
    __TI_data_synch_WBINV(&need_mem_init, sizeof(need_mem_init));
#endif
    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
}

/*****************************************************************************/
/*									     */
/*  MALLOC - Allocate a packet of a given size, and return a pointer to it.  */
/*	     This function only allocates in multiples of MIN_BLOCK bytes.   */
/*									     */
/*****************************************************************************/
_CODE_ACCESS void *malloc(size_t size)
{
    register PACKET       *current;
    register unsigned int  newsize;
    register unsigned int  oldsize;

    if (check_alloc_size(size) == 0) return 0;

    newsize = (unsigned int)((size + BLOCK_MASK) & ~BLOCK_MASK);

    if (size <= 0) return 0;

    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list that are made */
    /* by minsert() and/or mremove() (see note #4 in file header comment).   */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

#ifdef __TI_EABI__
    minit();
#endif

    current = sys_free;

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH FREE LIST FOR PACKET LARGE ENOUGH TO CONTAIN PACKET      */
    /*-----------------------------------------------------------------------*/
    while (current && current->packet_size < newsize)
       current = current->size_ptr;

    if (!current) { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return 0; }
    
    oldsize = current->packet_size;	    /* REMEMBER OLD SIZE	     */
    mremove(current);		            /* REMOVE PACKET FROM FREE LIST  */

    /*-----------------------------------------------------------------------*/
    /* IF PACKET IS LARGER THAN NEEDED, FREE EXTRA SPACE AT END	             */
    /* BY INSERTING REMAINING SPACE INTO FREE LIST.			     */
    /*-----------------------------------------------------------------------*/
    if (oldsize - newsize >= (MIN_BLOCK + BLOCK_OVERHEAD))
    {
       register PACKET *next = 
	       (PACKET *) ((char *) current + BLOCK_OVERHEAD + newsize);
 
       next->packet_size    = oldsize - newsize - BLOCK_OVERHEAD;
       minsert(next);
       current->packet_size = newsize;
    }

   current->packet_size |= BLOCK_USED;

   __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);

   return (char *)current + BLOCK_OVERHEAD;
}

/*****************************************************************************/
/*									     */
/*  CALLOC - Allocate a packet of a given size, set the data in the packet   */
/*	     to nulls, and return a pointer to it.			     */
/*									     */
/*****************************************************************************/
_CODE_ACCESS void *calloc(size_t num, size_t size)
{
    register size_t      i	 = size * num;
    register LARGE_TYPE *current = malloc(i);
    register char       *save    = (char *) current;

    if (current == 0) return 0;

    i = ((i + BLOCK_MASK) & ~BLOCK_MASK) / sizeof(LARGE_TYPE);

    while (i--) *current++ = 0;
    return save;
}

/*****************************************************************************/
/*									     */
/*  REALLOC - Reallocate a packet to a new size.			     */
/*									     */
/*****************************************************************************/
_CODE_ACCESS void *realloc(void *packet, size_t size)
{
    register char          *pptr    = (char *) packet - BLOCK_OVERHEAD;
    register unsigned int   newsize;
    register unsigned int   oldsize;

    if (check_alloc_size(size) == 0) return 0;

    newsize = (unsigned int)((size + BLOCK_MASK) & ~BLOCK_MASK);

    if (packet == 0)  return malloc(size);
    if (size   == 0)  { free(packet); return 0; }

    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list that are made */
    /* by minsert() and/or mremove() (see note #4 in file header comment).   */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

    oldsize = ((PACKET *)pptr)->packet_size;

    if (!(oldsize & BLOCK_USED))  
       { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return 0; }

    if (newsize == --oldsize)
       { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return packet; }

    /*-----------------------------------------------------------------------*/
    /* IF NEW SIZE IS LESS THAN CURRENT SIZE, TRUNCATE PACKET AND RETURN END */
    /* TO FREE LIST		                                             */
    /*-----------------------------------------------------------------------*/
    if (newsize < oldsize)
    {
       if ((oldsize - newsize) >= (MIN_BLOCK + BLOCK_OVERHEAD)) 
       {
          ((PACKET *)pptr)->packet_size = newsize | BLOCK_USED;

          oldsize -= newsize + BLOCK_OVERHEAD;
          pptr    += newsize + BLOCK_OVERHEAD;
          ((PACKET *)pptr)->packet_size = oldsize | BLOCK_USED;
          free(pptr + BLOCK_OVERHEAD);
       }
       __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
       return packet;
    }

    /*-----------------------------------------------------------------------*/
    /* IF NEW SIZE IS BIGGER THAN CURRENT PACKET,		             */
    /*	1) CHECK NEXT PACKET IN LIST, SEE IF PACKET CAN BE EXPANDED          */
    /*	2) IF NOT, MOVE PACKET TO NEW LOCATION. 		             */
    /*-----------------------------------------------------------------------*/
    else
    {
	PACKET *next = (PACKET *)(pptr + oldsize + BLOCK_OVERHEAD);
	int     temp;

	if (((char *)next < &heap_mem[_memory_size - BLOCK_OVERHEAD]) &&
           (!(next->packet_size & BLOCK_USED))                           &&
           ((temp = oldsize +next->packet_size +BLOCK_OVERHEAD -newsize) >= 0))
	{
	    mremove(next);
	    if (temp < MIN_BLOCK + BLOCK_OVERHEAD)
	    {
	       ((PACKET *)pptr)->packet_size = newsize + temp | BLOCK_USED;
	       __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
	       return packet;
	    }

	    ((PACKET *)pptr)->packet_size = newsize | BLOCK_USED;
	    pptr += newsize + BLOCK_OVERHEAD;
	    ((PACKET *)pptr)->packet_size = temp - BLOCK_OVERHEAD;
	    minsert((PACKET *)pptr);
	    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
	    return packet;
	}
	else
	{
            /*---------------------------------------------------------------*/
	    /* ALLOCATE NEW PACKET AND MOVE DATA INTO IT. 	             */
            /*---------------------------------------------------------------*/
	    register char *new = malloc(size);
	    if (new != 0) 
	    {
	       memcpy(new, packet, oldsize);
	       free(packet);
	    }
	    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
	    return new;
	}
    }
}

/*****************************************************************************/
/*									     */
/*  FREE - Return a packet allocated by malloc to free memory pool.	     */
/*	   Return 0 if successful, -1 if not successful.		     */
/*									     */
/*****************************************************************************/
_CODE_ACCESS void free(void *packet)
{
    register char   *ptr = (char *)packet;
    register PACKET *last;	      /* POINT TO PREVIOUS PACKET            */
    register PACKET *current;	      /* POINTER TO THIS PACKET              */
    register PACKET *next;	      /* POINTER TO NEXT PACKET              */

    if (ptr == NULL) return;

    last = next = NULL;		      /* INITIALIZE POINTERS                 */
    ptr -= BLOCK_OVERHEAD;	      /* ADJUST POINT TO BEGINNING OF PACKET */

    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list that are made */
    /* by minsert() and/or mremove() (see note #4 in file header comment).   */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

    current = _sys_memory;

    /*-----------------------------------------------------------------------*/
    /* SEARCH FOR THE POINTER IN THE PACKET POINTED TO			     */
    /*-----------------------------------------------------------------------*/
    while (current < (PACKET *) ptr)
    {
        last    = current;
        current = (PACKET *)((char *)current + 
		  (current->packet_size & ~BLOCK_USED) + BLOCK_OVERHEAD);
    }

    /*-----------------------------------------------------------------------*/
    /* CHECK FOR POINTER OR PACKET ERRORS.				     */
    /*-----------------------------------------------------------------------*/
    if ((current != (PACKET *) ptr) || (!(current->packet_size & BLOCK_USED)))
       { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return; }

    current->packet_size &= ~BLOCK_USED;   /* MARK PACKET AS FREE */

    /*-----------------------------------------------------------------------*/
    /* GET POINTER TO NEXT PACKET IN MEMORY, IF ANY.			     */
    /*-----------------------------------------------------------------------*/
    next = (PACKET *)((char *)current + BLOCK_OVERHEAD + current->packet_size);
    if (next > (PACKET *) &heap_mem[_memory_size-BLOCK_OVERHEAD]) 
	next = NULL;

    if (last && (last->packet_size & BLOCK_USED)) last = NULL;
    if (next && (next->packet_size & BLOCK_USED)) next = NULL;

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE THREE PACKETS (PREVIOUS, CURRENT, NEXT)	     */
    /*-----------------------------------------------------------------------*/
    if (last && next)
    {
	mremove(last);
	mremove(next);
	last->packet_size += current->packet_size + next->packet_size + 
			     BLOCK_OVERHEAD + BLOCK_OVERHEAD;
	minsert(last);
	__TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
	return;
    }

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE CURRENT WITH LAST PACKET. (LAST, CURRENT)     */
    /*-----------------------------------------------------------------------*/
    if (last)
    {
        mremove(last);
        last->packet_size += current->packet_size + BLOCK_OVERHEAD;
        minsert(last);
        __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
        return;
    }

    /*-----------------------------------------------------------------------*/
    /* ATTEMPT TO COLLESCE THE CURRENT WITH NEXT PACKET. (CURRENT, NEXT)     */
    /*-----------------------------------------------------------------------*/
    if (next)
    {
        mremove(next);
        current->packet_size += next->packet_size + BLOCK_OVERHEAD;
        minsert(current);
        __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
        return;
    }

    /*-----------------------------------------------------------------------*/
    /* NO COLLESCENCE POSSIBLE, JUST INSERT THIS PACKET INTO LIST	     */
    /*-----------------------------------------------------------------------*/
    minsert(current);
    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
}

/*****************************************************************************/
/*                                                                           */
/*  MEMALIGN - Allocate a packet of a given size, and on a given boundary.   */
/*                                                                           */
/*****************************************************************************/
_CODE_ACCESS void *memalign(size_t alignment, size_t size)
{
    PACKET       *aln_packet;
    PACKET       *current;
    unsigned int  newsize;
    size_t        aln_mask = alignment - 1;
    int           leftover = -1;
    char         *aln_start;
    char         *un_aln_start;

    if (check_alloc_size(size) == 0) return 0;

    newsize = (unsigned int)((size + BLOCK_MASK) & ~BLOCK_MASK);

    if (size <= 0) return 0;

    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list that are made */
    /* by minsert() and/or mremove() (see note #4 in file header comment).   */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

#ifdef __TI_EABI__
    minit();
#endif

    current = sys_free;

    /*--------------------------------------------------------------------*/
    /* IF ALIGNMENT IS NOT A POWER OF TWO OR IS LESS THAN THE DEFAULT     */
    /* ALIGNMENT OF MALLOC, THEN SIMPLY RETURN WHAT MALLOC RETURNS.       */
    /*--------------------------------------------------------------------*/
    if (alignment <= BLOCK_OVERHEAD || (alignment & (alignment-1))) 
       { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return malloc(size); }

    /*-----------------------------------------------------------------------*/
    /* SCAN THROUGH FREE LIST FOR PACKET LARGE ENOUGH TO CONTAIN ALIGNED     */
    /* PACKET                                                                */
    /*-----------------------------------------------------------------------*/
    for ( ; current ; current = current->size_ptr)
    {
       un_aln_start = (char *) current + BLOCK_OVERHEAD;
       /*--------------------------------------------------------------------*/
       /* IT IS POSSIBLE THAT WE COULD OVERFLOW THE size_t TYPE BELOW, BUT   */
       /* ADDING A CHECK HERE WOULD LIKELY BE A SIGNIFICANT PERFORMANCE HIT. */
       /*--------------------------------------------------------------------*/
       aln_start   = (char *) (((size_t) un_aln_start + aln_mask) & ~aln_mask);
       leftover    = un_aln_start + current->packet_size - aln_start - newsize;

       /*--------------------------------------------------------------------*/
       /* MAKE SURE THAT THE PRE BLOCK SPACE IS LARGE ENOUGH TO BE A BLOCK   */
       /* OF ITS OWN.                                                        */
       /*--------------------------------------------------------------------*/
       for ( ; (char *)current+sizeof(PACKET) > aln_start-BLOCK_OVERHEAD ;
	       aln_start += alignment, leftover -= alignment);

       if (leftover >= 0) break;
    }

    if (!current) 
       { __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC); return 0; }

    /*-----------------------------------------------------------------------*/
    /* SETUP NEW PACKET FOR ALIGNED MEMORY.                                  */
    /*-----------------------------------------------------------------------*/
    mremove(current);
    aln_packet              = (PACKET *) (aln_start - BLOCK_OVERHEAD);
    aln_packet->packet_size = newsize | BLOCK_USED;

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
    if (leftover >= BLOCK_OVERHEAD + MIN_BLOCK)
    {
       register PACKET *next = (PACKET *) (aln_start + newsize);
       next->packet_size     = leftover - BLOCK_OVERHEAD;
       minsert(next);
    }
    else aln_packet->packet_size += leftover;

    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
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

_CODE_ACCESS void memmap()
{
    PACKET *current;

    /*-----------------------------------------------------------------------*/
    /* Critical region to protect accesses to packet free list while writing */
    /* heap memory usage stats (see note #4 in file header comment).         */
    /*-----------------------------------------------------------------------*/
    __TI_resource_lock(__TI_LOCK_HEAP_ALLOC);

#ifdef __TI_EABI__
    minit();
#endif

    current = _sys_memory;

    int free_block_num		= 0;
    int free_block_space	= 0;
    int free_block_max		= 0;
    int used_block_num		= 0;
    int used_block_space	= 0;
    int used_block_max		= 0;

    /*-----------------------------------------------------------------------*/
    /* LOOP THROUGH ALL PACKETS                                              */
    /*-----------------------------------------------------------------------*/
    while (current < (PACKET *) &heap_mem[_memory_size-BLOCK_OVERHEAD]) 
    {
	int size = current->packet_size & ~BLOCK_USED;
        int used = current->packet_size & BLOCK_USED;

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

        current = (PACKET *)((char *)current + size + BLOCK_OVERHEAD);
    }

    printf("fr_nm:%d fr_sp:%d fr_mx:%d us_nm:%d us_sp:%d us_mx:%d ovr:%d\n\n", 
	    free_block_num, free_block_space, free_block_max,
	    used_block_num, used_block_space, used_block_max,
	    (free_block_num + used_block_num) * BLOCK_OVERHEAD);

    fflush(stdout);

    __TI_resource_unlock(__TI_LOCK_HEAP_ALLOC);
}
#endif

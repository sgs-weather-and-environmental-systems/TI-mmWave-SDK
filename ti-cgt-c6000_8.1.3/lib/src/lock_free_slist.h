/******************************************************************************/
/* This file was taken from STLport <www.stlport.org> and modified by         */
/* Texas Instruments.                                                         */
/******************************************************************************/

/*
 * Copyright (c) 1997-1999
 * Silicon Graphics Computer Systems, Inc.
 *
 * Copyright (c) 1999
 * Boris Fomitchev
 *
 * Copyright (c) 2014-2014 Texas Instruments Incorporated
 *
 * This material is provided "as is", with absolutely no warranty expressed
 * or implied. Any use is at your own risk.
 *
 * Permission to use or copy this software for any purpose is hereby granted
 * without fee, provided the above notices are retained on all copies.
 * Permission to modify the code and to distribute modified code is granted,
 * provided the above notices are retained, and a notice that the code was
 * modified is included with the above copyright notice.
 *
 */

#ifndef _STLP_LOCK_FREE_SLIST_H
#define _STLP_LOCK_FREE_SLIST_H

#if defined(_STLP_PTHREADS)
#  include <pthread.h>


#elif defined (_STLP_WIN32THREADS)

#  if !defined (_WIN64)
#    define _STLP_USE_ASM_IMPLEMENTATION
#  endif

// Here are the compiler/platform requirements for the thread safe and
// lock free singly linked list implementation:
#  if defined (_STLP_USE_ASM_IMPLEMENTATION)
// For the asm version:
#  else
// For the API based version:
#    if defined (_STLP_NEW_PLATFORM_SDK) && (!defined (WINVER) || (WINVER >= 0x0501)) && \
                                            (!defined (_WIN32_WINNT) || (_WIN32_WINNT >= 0x0501))
#      define _STLP_HAS_ATOMIC_FREELIST
#    endif
#  endif

#  if defined (_STLP_HAS_ATOMIC_FREELIST)
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
#      if defined (_STLP_MSVC) && (_STLP_MSVC < 1300) || defined (__ICL)
#        pragma warning (push)
#        pragma warning (disable : 4035) //function has no return value
#      endif
#    endif
/**
 * Class that implements a non-blocking and thread-safe freelist.
 * It is used for the lock-free node allocation engine.
 *
 * @author felixw@inin.com
 */
class _STLP_atomic_freelist {
public:
  /**
   * Type representing items of the freelist
   */
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
  struct item {
      item*   _M_next;
  };
#    else
  typedef SLIST_ENTRY item;
#    endif

  _STLP_atomic_freelist() {
    // Statically assert layout of member is as expected by assembly code
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
    _STLP_STATIC_ASSERT((sizeof(item) == sizeof(item*)) && (sizeof(_M) == 8))
    _M._M_data._M_top       = 0;
    _M._M_data._M_sequence  = 0;
#    else
    InitializeSListHead(&_M_head);
#    endif
  }

  /**
   * Atomically pushes the specified item onto the freelist.
   *
   * @param __item [in] Item to add to the front of the list
   */
  void push(item* __item) {
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
    __asm
    {
        mov             esi, this
        mov             ebx, __item
        mov             eax, [esi]              // _M._M_data._M_top
        mov             edx, [esi+4]            // _M._M_data._M_sequence
    L1: mov             [ebx], eax              // __item._M_next = _M._M_data._M_top
        lea             ecx, [edx+1]            // new sequence = _M._M_data._M_sequence + 1
        lock cmpxchg8b  qword ptr [esi]
        jne             L1                      // Failed, retry! (edx:eax now contain most recent _M_sequence:_M_top)
    }
#    else
    InterlockedPushEntrySList(&_M_head, __item);
#    endif
  }

  /**
   * Atomically removes the topmost item from the freelist and returns a
   * pointer to it.  Returns NULL if the list is empty.
   *
   * @return Item that was removed from front of list; NULL if list empty
   */
  item* pop() {
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
    __asm
    {
        mov             esi, this
        mov             eax, [esi]              // _M._M_data._M_top
        mov             edx, [esi+4]            // _M._M_data._M_sequence
    L1: test            eax, eax                // _M_top == NULL?
        je              L2                      // Yes, we're done
        mov             ebx, [eax]              // new top = _M._M_data._M_top->_M_next
        lea             ecx, [edx+1]            // new sequence = _M._M_data._M_sequence + 1
        lock cmpxchg8b  qword ptr [esi]
        jne             L1                      // Failed, retry! (edx:eax now contain most recent _M_sequence:_M_top)
    L2:
    }
#    else
    return InterlockedPopEntrySList(&_M_head);
#    endif
  }

  /**
   * Atomically detaches all items from the list and returns pointer to the
   * topmost.  The items are still chained and may be traversed safely as
   * they're now "owned" by the calling thread.
   *
   * @return Pointer to topmost item in the list; NULL if list empty
   */
  item* clear() {
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
    __asm
    {
        mov             esi, this
        mov             eax, [esi]              // _M._M_data._M_top
        mov             edx, [esi+4]            // _M._M_data._M_sequence
    L1: test            eax, eax                // _M_top == NULL?
        je              L2                      // Yes, we're done
        xor             ebx,ebx                 // We're attempting to set _M._M_data._M_top to NULL
        lea             ecx, [edx+1]            // new sequence = _M._M_data._M_sequence + 1
        lock cmpxchg8b  qword ptr [esi]
        jne             L1                      // Failed, retry! (edx:eax now contain most recent _M_sequence:_M_top)
    L2:
    }
#    else
    return InterlockedFlushSList(&_M_head);
#    endif
  }

private:
#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
  union {
    __int64     _M_align;
    struct {
      item*           _M_top;         // Topmost element in the freelist
      unsigned int    _M_sequence;    // Sequence counter to prevent "ABA problem"
    } _M_data;
  } _M;
#    else
  SLIST_HEADER _M_head;
#    endif

  _STLP_atomic_freelist(const _STLP_atomic_freelist&);
  _STLP_atomic_freelist& operator = (const _STLP_atomic_freelist&);
};

#    if defined (_STLP_USE_ASM_IMPLEMENTATION)
#      if defined (_STLP_MSVC) && (_STLP_MSVC < 1300) || defined (__ICL)
#        pragma warning (pop)
#      endif
#    endif

#  endif /* _STLP_HAS_ATOMIC_FREELIST */

#endif

#endif /* _STLP_LOCK_FREE_SLIST_H */

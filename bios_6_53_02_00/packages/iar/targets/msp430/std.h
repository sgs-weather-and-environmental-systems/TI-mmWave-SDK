/* 
 *  Copyright (c) 2012 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
/*
 *  ======== iar/targets/msp430/std.h ========
 *
 */

#ifndef iar_targets_msp430_STD_
#define iar_targets_msp430_STD_

/* include target-specific "portable" macros */
#if defined(xdc_target_name__) & !defined(xdc_target_macros_include__)
#include xdc__local_include(xdc_target_name__)
#endif

#include <stdint.h>     /* C99 standard integer types */

/*
 * xdc__LONGLONG__ indicates if compiler supports 'long long' type
 * xdc__BITS<n> __ indicates if compiler supports 'uint<n>_t' type
 */
#define xdc__LONGLONG__
#define xdc__BITS8__
#define xdc__BITS16__
#define xdc__BITS32__
#define xdc__BITS64__
#define xdc__INT64__
/*
 *  ======== [U]Int<n> ========
 */
typedef int_least8_t        xdc_Int8;
typedef uint_least8_t       xdc_UInt8;
typedef int_least16_t       xdc_Int16;
typedef uint_least16_t      xdc_UInt16;
typedef int_least32_t       xdc_Int32;
typedef uint_least32_t      xdc_UInt32;
typedef int_least64_t       xdc_Int64;
typedef uint_least64_t      xdc_UInt64;

/*
 *  ======== Bits<n> ========
 */
typedef uint8_t       xdc_Bits8;
typedef uint16_t      xdc_Bits16;
typedef uint32_t      xdc_Bits32;
typedef uint64_t      xdc_Bits64;

/*
 *  ======== [UI]Arg ========
 */
#if (__CORE__==__430X__ && __DATA_MODEL__==__DATA_MODEL_SMALL__)
typedef long            xdc_IArg;
typedef unsigned long   xdc_UArg;
#else
typedef intptr_t        xdc_IArg;
typedef uintptr_t       xdc_UArg;
#endif

/*
 *  ======== [ui]argToPtr ========
 *  Special case for MSP430X small data model
 */
#if (__CORE__==__430X__ && __DATA_MODEL__==__DATA_MODEL_SMALL__)
#define xdc__ARGTOPTR
static inline xdc_Ptr xdc_iargToPtr(xdc_IArg a) { return ((xdc_Ptr)(int)a); }
static inline xdc_Ptr xdc_uargToPtr(xdc_UArg a) { return ((xdc_Ptr)(int)a); }
#endif

/*
 *  ======== xdc__META ========
 */
#if (__VER__ >= 610)
#define xdc__META(n,s) __no_alloc const char (n)[] @ "xdc.meta" = {(s)}
#endif

#endif /* iar_targets_msp430_STD_ */
/*
 *  @(#) iar.targets.msp430; 1, 0, 0,0; 11-8-2017 17:20:38; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */


/*****************************************************************************/
/*  TRGCIO.H v8.1.3                                                          */
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
#ifndef _TRGCIO_H
#define _TRGCIO_H

#include <stdio.h>
#include <limits.h>
#include <stdint.h>

/*****************************************************************************/
/*  This file contains OTIS-driven CIO constant definitions                  */
/*****************************************************************************/

/*---------------------------------------------------------------------------*/
/* constants for the data transfer functions for the predefined driver       */
/*---------------------------------------------------------------------------*/
#define _DTOPEN      (0xF0)
#define _DTCLOSE     (0xF1)
#define _DTREAD      (0xF2)
#define _DTWRITE     (0xF3)
#define _DTLSEEK     (0xF4)
#define _DTUNLINK    (0xF5)
#define _DTGETENV    (0xF6)
#define _DTRENAME    (0xF7)
#define _DTGETTIME   (0xF8)
#define _DTGETCLK    (0xF9)
#define _DTGETTIME64 (0xFA)
#define _DTSYNC      (0xFF)

#define CIOBUFSIZ ((BUFSIZ)+32)

/*---------------------------------------------------------------------------*/
/* THESE MACROS PACK AND UNPACK SHORTS AND LONGS INTO CHARACTER ARRAYS       */
/*                                                                           */
/* THIS IS DONE BYTE REVERSED TO MAKE THE PC'S JOB EASIER AND SINCE THE      */
/*     DEVICE COULD BE BIG OR LITTLE ENDIAN                                  */
/*---------------------------------------------------------------------------*/
#define LSB(x) ((x)&0xff)

#define LOADSHORT(x,y,z)  do { x[(z)]   = LSB((y)); \
			       x[(z)+1] = LSB((y) >> 8); } while(0)

#define UNLOADSHORT(x,z) ( (uint16_t) LSB(x[(z)]) + \
                          ((uint16_t) LSB(x[(z)+1]) << 8))

#define LOAD32(x,y,z) do { x[(z)]   = LSB((y)); \
	                   x[(z)+1] = LSB((y) >> 8); \
                           x[(z)+2] = LSB((y) >> 16); \
                           x[(z)+3] = LSB((y) >> 24); } while(0)

#define UNLOAD32(x,z) ( (uint32_t) LSB(x[(z)])           +  \
                       ((uint32_t) LSB(x[(z)+1]) << 8)   +  \
                       ((uint32_t) LSB(x[(z)+2]) << 16)  +  \
		       ((uint32_t) LSB(x[(z)+3]) << 24))

#define UNLOAD64(x,z) ( (uint64_t) LSB(x[(z)])           +  \
                       ((uint64_t) LSB(x[(z)+1]) << 8)   +  \
                       ((uint64_t) LSB(x[(z)+2]) << 16)  +  \
		       ((uint64_t) LSB(x[(z)+3]) << 24)  +  \
		       ((uint64_t) LSB(x[(z)+4]) << 32)  +  \
		       ((uint64_t) LSB(x[(z)+5]) << 40)  +  \
		       ((uint64_t) LSB(x[(z)+6]) << 48)  +  \
                       ((uint64_t) LSB(x[(z)+7]) << 56))

/*---------------------------------------------------------------------------*/
/* THESE MACROS CAN BE USED TO PACK AND UNPACK CHARACTER STREAMS INTO TARGET */
/* WORDS FOR MORE EFFICIENT TRANSFER.                                        */
/*---------------------------------------------------------------------------*/
#if CHAR_BIT == 16
#define PACKCHAR(val, base, byte) ( ((byte)%2 == 0) ?  \
	 (*((base) + ((byte)/2))  = ((val) & 0xFF)) : \
	 (*((base) + ((byte)/2)) |= ((val) & 0xFF) << (((byte)%2) * 8)) )
#define UNPACKCHAR(base, byte) \
         ( (*((base) + ((byte)/2)) >> (((byte)%2) * 8)) & 0xFF )
#else
#define PACKCHAR(val, base, byte) ( (base)[(byte)] = (val) )
#define UNPACKCHAR(base, byte)    ( (base)[byte] )
#endif

/*---------------------------------------------------------------------------*/
/* Reduce the size of the target-side buffer for getenv system call.         */
/*---------------------------------------------------------------------------*/

#endif /* _TRGCIO_H */

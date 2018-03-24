/*****************************************************************************/
/* copy_decompress_lzss.c   v16.9.6                                          */
/*                                                                           */
/* Copyright (c) 2006-2017 Texas Instruments Incorporated                    */
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
/* Decompress routine for Lempel-Ziv-Storer-Szymanski (LZSS) compression.    */
/* Given an input buffer with data compressed using LZSS encoding and an     */
/* output buffer, this routine decompresses the data in the output buffer.   */
/*                                                                           */
/* NOTE:                                                                     */
/* 1. This routine could be used to copy uninitialized or initialized global */
/*    data space of a program. Hence this routine cannot define any global   */
/*    variable.                                                              */
/* 2. This routine will never be used to initialize stack space and hence    */
/*    all the variables are allocated to stack.                              */
/* 3. The calling application should ensure the output buffer is big         */
/*    enough to hold the uncompressed data.                                  */
/*                                                                           */
/*****************************************************************************/
#include <stdint.h>
#include <limits.h>

#define LZSS_EOD             4095
#define LZSS_WINDOW_SIZE     4095

/*****************************************************************************/
/* The offset is always 12-bits so use a 16-bit type.                        */
/*****************************************************************************/
typedef uint_fast16_t offset_t;

#if CHAR_BIT == 8

/*****************************************************************************/
/* The max length is 2^15-1+18, which can fit in a 16-bit type.              */
/*****************************************************************************/
typedef uint_fast16_t length_t;

/*****************************************************************************/
/* Flags is always of length 1 char.                                         */
/*****************************************************************************/
typedef uint_fast8_t  flags_t;

#elif CHAR_BIT == 16

/*****************************************************************************/
/* The max length =s 2^16-1+17, which may not fit in a 16-bit type, so use a */
/* 32-bit type.                                                              */
/*****************************************************************************/
typedef uint_fast32_t length_t;

/*****************************************************************************/
/* Flags is always of length 1 char.                                         */
/*****************************************************************************/
typedef uint_fast16_t flags_t;

#else
#error Illegal value for CHAR_BIT
#endif

/*****************************************************************************/
/* MSP copy tables can handle moving functions even in small data model +    */
/* large code model, where data pointers are not big enough to represent     */
/* function pointers.  This requires the EABI decompression functions        */
/* (SHARED/copy_*.c) to be changed to accept "far" pointers.  For this       */
/* memory model combination, the decompression functions are changed to use  */
/* "unsigned long" to represent function pointers, so function pointers      */
/* through which we call these functions also needs to have a prototype      */
/* accepting "unsigned long" instead of pointer types.  All other memory     */
/* model combinations use the same prototype that all the other targets use: */
/* two data pointer arguments.  Ultimately we use MSP peek/poke intrinsics   */
/* to read/write the "far" memory.                                           */
/*****************************************************************************/
typedef       unsigned char *pointer_t;
typedef const unsigned char *pointer_to_const_t;
#define READ_CHAR_ADV(x)    (*x++)
#define WRITE_CHAR_ADV(x,c) (*x++ = (c))

/*****************************************************************************/
/*                                                                           */
/* __TI_DECOMPRESS_LZSS() - Decompress data encoded using LZSS encoding.     */
/*                          Input buffer (inbuf) has the encoded data and    */
/*                          uncompressed data is returned in outbuf.         */
/*                                                                           */
/*****************************************************************************/
__attribute__((section(".text:decompress:lzss")))
void __TI_decompress_lzss(pointer_to_const_t inbuf, pointer_t outbuf)
{
    while (1)
    {
        flags_t flags = READ_CHAR_ADV(inbuf);

        int i;
        for (i=0; i<CHAR_BIT ; i++)
        {
           if (flags & 0x1)
           {
              /*---------------------------------------------------------------*/
              /* We have an uncoded byte, just write it out.                   */
              /*---------------------------------------------------------------*/
              WRITE_CHAR_ADV(outbuf, READ_CHAR_ADV(inbuf));
           }
           else
           {
              /*---------------------------------------------------------------*/
              /* Read and unpack the offset and length                         */
              /*---------------------------------------------------------------*/              
              offset_t offset;
              length_t length;
              
#if CHAR_BIT == 8
              offset = READ_CHAR_ADV(inbuf);
              length = READ_CHAR_ADV(inbuf);
              offset <<= 4;
              offset |= ((length & 0x00F0) >> 4);
              length = (length & 0x000F) + 3;

              /*---------------------------------------------------------------*/
              /* If the length is 3->17, we only use 4 bits. If the length is  */
              /* >= 18, we read an additional 8 bits and add it to the length. */
              /*                                                               */
              /* If the msb of the second byte is 1, we read an additional     */
              /* 8 bits and use that for bits 7-14 of the length. This gives   */
              /* us a range of 3->32785.                                       */
              /*---------------------------------------------------------------*/
              if (length == 18)
              {
                 length_t length2 = READ_CHAR_ADV(inbuf);
                 if (length2 & 0x80)
                 {
                    length_t length3 = READ_CHAR_ADV(inbuf);
                    length2 = (length2 & 0x7f) | (length3 << 7);
                 }
                 length += length2;
              }
              
#elif CHAR_BIT == 16
              unsigned char temp = READ_CHAR_ADV(inbuf);
              length = (temp & 0xf) + 2;
              offset = temp >> 4;

              /*---------------------------------------------------------------*/
              /* If the length is the maximum value encoded in 4 bits, read an */
              /* additional 16-bit value and add it to the length.             */
              /*---------------------------------------------------------------*/              
              if (length == 17)
                 length += READ_CHAR_ADV(inbuf);
#endif

              /*---------------------------------------------------------------*/
              /* If the offset indicates end of data, exit.                    */
              /*---------------------------------------------------------------*/
              if (offset == LZSS_EOD)
                 return;                           

              /*---------------------------------------------------------------*/
              /* Copy the decoded string from sliding window to output buffer. */
              /*---------------------------------------------------------------*/
              length_t j;
              pointer_t pos = outbuf - offset - 1;
              for (j = 0; j < length; j++)
                 WRITE_CHAR_ADV(outbuf, READ_CHAR_ADV(pos));
           }

           flags >>= 1;
        }
    }
}



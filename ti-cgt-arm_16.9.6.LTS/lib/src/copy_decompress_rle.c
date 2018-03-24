/*****************************************************************************/
/* copy_decompress_rle.c    v16.9.6                                          */
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
/* Decompress routine for the Run-length encoding compression. Given an      */
/* input buffer with data compressed using run-length encoding and an        */
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
#include <string.h>

/*****************************************************************************/
/*                                                                           */
/* __TI_DECOMPRESS_RLE() - Decompress the run length encoding.               */
/*                                                                           */
/* NOTE: More recent versions of the linker (circa 10/2010) will generate a  */
/*       call to __TI_decompress_rle24() (or _TI_decompress_rle24() for      */
/*       TMS470 non-EABI applications). We are keeping the old version of    */
/*       the RLE decompression around so that newer libraries will work with */
/*       older tools.                                                        */
/*                                                                           */
/*****************************************************************************/
#if defined(__TMS470__) && !defined(__TI_EABI_SUPPORT__)
#define RLE_FUNCTION _TI_decompress_rle
#define RLE24_FUNCTION _TI_decompress_rle24
#else
#define RLE_FUNCTION __TI_decompress_rle
#define RLE24_FUNCTION __TI_decompress_rle24
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
#define READ8_ADV(x)    (*x++)
#define WRITE8_ADV(x,c) (*x++ = (c))

static void __TI_decompress_rle_core(pointer_to_const_t inbuf, 
                                     pointer_t          outbuf, 
                                     int                is_rle24);

#pragma CODE_SECTION(RLE_FUNCTION, ".text:decompress:rle")

void RLE_FUNCTION(const pointer_t inbuf, pointer_t outbuf)
{
   __TI_decompress_rle_core(inbuf, outbuf, 0);
}

#pragma CODE_SECTION(RLE24_FUNCTION, ".text:decompress:rle24")

void RLE24_FUNCTION(const pointer_t inbuf, pointer_t outbuf)
{
   __TI_decompress_rle_core(inbuf, outbuf, 1);
}

static void __TI_decompress_rle_core(pointer_to_const_t inbuf, 
                                     pointer_t          outbuf, int is_rle24)
{
   /*------------------------------------------------------------------------*/
   /* The first byte is the delimiter. Save it to 'delim'.                   */
   /*------------------------------------------------------------------------*/
   unsigned char  delim = READ8_ADV(inbuf);
   unsigned char  ch;
   unsigned int   run_len;

   while(1)
   {
      /*---------------------------------------------------------------------*/
      /* Read the next byte.                                                 */
      /*---------------------------------------------------------------------*/
      ch = READ8_ADV(inbuf);

      /*---------------------------------------------------------------------*/
      /* If this byte is not delimiter, we have no-repeat byte. Just write i */
      /* to output and continue.                                             */
      /*---------------------------------------------------------------------*/
      if (ch != delim)
      {
         WRITE8_ADV(outbuf, ch);
         continue;
      }

      /*---------------------------------------------------------------------*/
      /* The current byte is the delimiter. We could have one of the         */
      /* following sequences:                                                */
      /* 1. zero, 16-bit run length, repeated char.                          */
      /* 2. zero, zero, 24-bit run length, repeated char.                    */
      /* 3. 8-bit length with value less then 4. This means delimiter is     */
      /*    repeated by the run length times.                                */
      /* 4. 8-bit run length followed by repeat char.                        */
      /*---------------------------------------------------------------------*/
      run_len = READ8_ADV(inbuf);
      if (run_len == 0)
      {
         run_len = ((unsigned int)(READ8_ADV(inbuf)))<<8;
         run_len += READ8_ADV(inbuf);

         /*------------------------------------------------------------------*/
         /* Exit if we reached the end of data. The sequence 'delim, 0, 0, 0'*/
         /* marks the end of data.                                           */
         /*------------------------------------------------------------------*/
         if (run_len == 0) break;

         /*------------------------------------------------------------------*/
	 /* At this point, if the run length is <= 255, then we have read    */
	 /* sequence: 'delim, 0, 0, msb of 24-bit length', so now we need to */
	 /* read in the remaining 2 bytes of the 24-bit run length field.    */
         /*------------------------------------------------------------------*/
	 if (is_rle24 && (run_len <= 0xff))
	 {
	    int i;
	    for (i = 1; i < 3; i++)
	       run_len = ((run_len << 8) | READ8_ADV(inbuf));
	 }

         ch = READ8_ADV(inbuf);
      }
      else if (run_len < 4)
         ch = delim;
      else
         ch = READ8_ADV(inbuf);

      memset(outbuf, ch, run_len);
      outbuf += run_len;
   }

   return;
}














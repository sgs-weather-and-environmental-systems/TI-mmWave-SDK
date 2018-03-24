/*****************************************************************************/
/* copy_decompress_lzss.c   v8.1.3                                           */
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
#define LZSS_EOD             4095
#define LZSS_WINDOW_SIZE     4095   
#define LZSS_MAX_UNCODED     2
#define LZSS_MAX_CODED       (15 + LZSS_MAX_UNCODED + 1)

/*****************************************************************************/
/*                                                                           */
/* __TI_DECOMPRESS_LZSS() - Decompress data encoded using LZSS encoding.     */
/*                          Input buffer (inbuf) has the encoded data and    */
/*                          uncompressed data is returned in outbuf.         */
/*                                                                           */
/*****************************************************************************/
#define LZSS_FUNCTION __TI_decompress_lzss

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

#pragma CODE_SECTION(LZSS_FUNCTION, ".text:decompress:lzss")

void LZSS_FUNCTION(pointer_to_const_t inbuf, pointer_t outbuf)
{
    unsigned char  sliding_window[LZSS_WINDOW_SIZE];
    unsigned char  c;
    pointer_t      encode_ptr;
    unsigned int   offset, length;
    unsigned int   i;
    unsigned char  flags = 0;                            /* Code bit flags */
    unsigned char  flagsUsed = 7; 
    unsigned int   sliding_index = 0;    

    /*-----------------------------------------------------------------------*/
    /* Fill the sliding window buffer with some known vales.  The encoder    */
    /* should use the same values.  We fill half the buffer with '\0' and    */
    /* the remaining half with ' ', hoping we have repeated zero and spaces  */
    /* in the input.                                                         */
    /*-----------------------------------------------------------------------*/
    for (i = 0; i < LZSS_WINDOW_SIZE/2; i++)
        sliding_window[i] = '\0';
    for (i = LZSS_WINDOW_SIZE/2; i < LZSS_WINDOW_SIZE; i++)
        sliding_window[i] = ' ';

    while (1)
    {
        flags >>= 1;
        flagsUsed++;

        if (flagsUsed == 8)
        {
            /*---------------------------------------------------------------*/
            /* Shifted out all the flag bits, read a new set of code bits    */
            /*---------------------------------------------------------------*/
            c = READ8_ADV(inbuf);
            flags = c;
            flagsUsed = 0;
        }

        if (flags & 0x01)
        {
            /*---------------------------------------------------------------*/
            /* We have uncoded byte, just write it out and copy to the       */
            /* sliding window.                                               */
            /*---------------------------------------------------------------*/
            c = READ8_ADV(inbuf);
            WRITE8_ADV(outbuf, c);
            sliding_window[sliding_index] = c;
            sliding_index = (sliding_index + 1) % LZSS_WINDOW_SIZE;
        }
        else
        {
            /*---------------------------------------------------------------*/
            /* Read and unpack the offset and length                         */
            /*---------------------------------------------------------------*/
            offset = READ8_ADV(inbuf);
            length = READ8_ADV(inbuf);
            offset <<= 4;
            offset |= ((length & 0x00F0) >> 4);
            length = (length & 0x000F) + LZSS_MAX_UNCODED + 1;

            /*---------------------------------------------------------------*/
            /* If the offset indicates end of data, exit.                    */
            /*---------------------------------------------------------------*/
            if (offset == LZSS_EOD)
               break;

            /*---------------------------------------------------------------*/
            /* Copy the decoded string from sliding window to output buffer. */
            /* We need to wait to copy the decoded data to sliding window to */
            /* avoid data corruption.                                        */
            /*---------------------------------------------------------------*/
            encode_ptr = outbuf;
            for (i = 0; i < length; i++)
                WRITE8_ADV(outbuf, sliding_window[(offset + i) % LZSS_WINDOW_SIZE]);

            /*---------------------------------------------------------------*/
            /* Now, copy the decoded string to the sliding window.           */
            /*---------------------------------------------------------------*/
            for (i = 0; i < length; i++)
                sliding_window[(sliding_index + i) % LZSS_WINDOW_SIZE] = 
                    READ8_ADV(encode_ptr);

            sliding_index = (sliding_index + length) % LZSS_WINDOW_SIZE;
        }
    }

    return;
}

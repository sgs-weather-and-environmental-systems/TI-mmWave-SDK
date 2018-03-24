/****************************************************************************/
/*  _FMT_SPECIFIER.H v16.9.6                                                */
/*                                                                          */
/* Copyright (c) 2006-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
/* 7.8.1 Macros for format specifiers */

#define PRId8 		"hhd"
#define PRIi8 		"hhi"
#define PRIo8 		"hho"
#define PRIu8 		"hhu"
#define PRIx8 		"hhx"
#define PRIX8 		"hhX"
#define SCNd8 		"hhd"
#define SCNi8 		"hhi"
#define SCNo8 		"hho"
#define SCNu8 		"hhu"
#define SCNx8 		"hhx"

#define PRIdLEAST8     	"hhd"
#define PRIiLEAST8     	"hhi"
#define PRIoLEAST8     	"hho"
#define PRIuLEAST8     	"hhu"
#define PRIxLEAST8     	"hhx"
#define PRIXLEAST8     	"hhX"
#define SCNdLEAST8 	"hhd"
#define SCNiLEAST8 	"hhi"
#define SCNoLEAST8 	"hho"
#define SCNuLEAST8 	"hhu"
#define SCNxLEAST8 	"hhx"
#define SCNd16		"hd"
#define SCNi16		"hi"
#define SCNo16		"ho"
#define SCNu16		"hu"
#define SCNx16		"hx"
#define SCNdLEAST16 	"hd"
#define SCNiLEAST16 	"hi"
#define SCNoLEAST16 	"ho"
#define SCNuLEAST16 	"hu"
#define SCNxLEAST16 	"hx"

#define PRIdFAST8     	"d"
#define PRIiFAST8     	"i"
#define PRIoFAST8     	"o"
#define PRIuFAST8     	"u"
#define PRIxFAST8     	"x"
#define PRIXFAST8     	"X"
#define PRIdFAST16    	"d"
#define PRIiFAST16    	"i"
#define PRIoFAST16    	"o"
#define PRIuFAST16    	"u"
#define PRIxFAST16    	"x"
#define PRIXFAST16    	"X"
#define SCNdFAST8 	"d"
#define SCNiFAST8 	"i"
#define SCNoFAST8 	"o"
#define SCNuFAST8 	"u"
#define SCNxFAST8 	"x"
#define SCNdFAST16 	"d"
#define SCNiFAST16 	"i"
#define SCNoFAST16 	"o"
#define SCNuFAST16 	"u"
#define SCNxFAST16 	"x"

#define PRId16		"hd"
#define PRIi16		"hi"
#define PRIo16		"ho"
#define PRIu16		"hu"
#define PRIx16		"hx"
#define PRIX16		"hX"
#define PRIdLEAST16    	"hd"
#define PRIiLEAST16    	"hi"
#define PRIoLEAST16    	"ho"
#define PRIuLEAST16    	"hu"
#define PRIxLEAST16    	"hx"
#define PRIXLEAST16    	"hX"

#define PRId32		"d"
#define PRIi32		"i"
#define PRIo32		"o"
#define PRIu32		"u"
#define PRIx32		"x"
#define PRIX32		"X"
#define PRIdLEAST32    	"d"
#define PRIiLEAST32    	"i"
#define PRIoLEAST32    	"o"
#define PRIuLEAST32    	"u"
#define PRIxLEAST32    	"x"
#define PRIXLEAST32    	"X"
#define PRIdFAST32    	"d"
#define PRIiFAST32    	"i"
#define PRIoFAST32    	"o"
#define PRIuFAST32    	"u"
#define PRIxFAST32    	"x"
#define PRIXFAST32    	"X"
#define SCNd32		"d"
#define SCNi32		"i"
#define SCNo32		"o"
#define SCNu32		"u"
#define SCNx32		"x"
#define SCNdLEAST32    	"d"
#define SCNiLEAST32    	"i"
#define SCNoLEAST32    	"o"
#define SCNuLEAST32    	"u"
#define SCNxLEAST32    	"x"
#define SCNdFAST32    	"d"
#define SCNiFAST32    	"i"
#define SCNoFAST32    	"o"
#define SCNuFAST32    	"u"
#define SCNxFAST32    	"x"


#define PRId64		"lld"
#define PRIi64		"lli"
#define PRIo64		"llo"
#define PRIu64		"llu"
#define PRIx64		"llx"
#define PRIX64		"llX"
#define PRIdLEAST64    	"lld"
#define PRIiLEAST64    	"lli"
#define PRIoLEAST64    	"llo"
#define PRIuLEAST64    	"llu"
#define PRIxLEAST64    	"llx"
#define PRIXLEAST64    	"llX"
#define PRIdFAST64    	"lld"
#define PRIiFAST64    	"lli"
#define PRIoFAST64    	"llo"
#define PRIuFAST64    	"llu"
#define PRIxFAST64    	"llx"
#define PRIXFAST64    	"llX"
#define SCNd64		"lld"
#define SCNi64		"lli"
#define SCNo64		"llo"
#define SCNu64		"llu"
#define SCNx64		"llx"
#define SCNdLEAST64    	"lld"
#define SCNiLEAST64    	"lli"
#define SCNoLEAST64    	"llo"
#define SCNuLEAST64    	"llu"
#define SCNxLEAST64    	"llx"
#define SCNdFAST64    	"lld"
#define SCNiFAST64    	"lli"
#define SCNoFAST64    	"llo"
#define SCNuFAST64    	"llu"
#define SCNxFAST64    	"llx"

#define PRIdPTR		"d"
#define PRIiPTR		"i"
#define PRIoPTR		"o"
#define PRIuPTR		"u"
#define PRIxPTR		"x"
#define PRIXPTR		"X"
#define SCNdPTR		"d"
#define SCNiPTR		"i"
#define SCNoPTR		"o"
#define SCNuPTR		"u"
#define SCNxPTR		"x"

#define PRIdMAX		"lld"
#define PRIiMAX		"lli"
#define PRIoMAX		"llo"
#define PRIuMAX		"llu"
#define PRIxMAX		"llx"
#define PRIXMAX		"llX"
#define SCNdMAX		"lld"
#define SCNiMAX		"lli"
#define SCNoMAX		"llo"
#define SCNuMAX		"llu"
#define SCNxMAX		"llx"

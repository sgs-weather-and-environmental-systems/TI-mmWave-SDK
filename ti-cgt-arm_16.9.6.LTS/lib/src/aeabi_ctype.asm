;/****************************************************************************/
;/*  aeabi_ctype.asm v16.9.6                                                 */
;* 
;* Copyright (c) 2006-2017 Texas Instruments Incorporated
;* http://www.ti.com/ 
;* 
;*  Redistribution and  use in source  and binary forms, with  or without
;*  modification,  are permitted provided  that the  following conditions
;*  are met:
;* 
;*     Redistributions  of source  code must  retain the  above copyright
;*     notice, this list of conditions and the following disclaimer.
;* 
;*     Redistributions in binary form  must reproduce the above copyright
;*     notice, this  list of conditions  and the following  disclaimer in
;*     the  documentation  and/or   other  materials  provided  with  the
;*     distribution.
;* 
;*     Neither the  name of Texas Instruments Incorporated  nor the names
;*     of its  contributors may  be used to  endorse or  promote products
;*     derived  from   this  software  without   specific  prior  written
;*     permission.
;* 
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;* 
;/****************************************************************************/
;/****************************************************************************/
;/* ARM's CLIB ABI (GENC-003539) requires that a conforming toolset to       */
;/* supply the following ctype table.                                        */
;/****************************************************************************/
	.if !__TI_ARM_V7M__ & !__TI_ARM_V6M0__
        .arm
        .else
        .thumb
        .endif
	.global	__aeabi_ctype_table_
	.global	__aeabi_ctype_table_C
	.sect	".const:__aeabi_ctype_table"
	.align	4
__aeabi_ctype_table_:
__aeabi_ctype_table_C:
	.field  	0,8		;  -1   EOF   :  0
	.field  	128,8		; 0x00  NUL   : _ABI_C
	.field  	128,8		; 0x01  SOH   : _ABI_C
	.field  	128,8		; 0x02  STX   : _ABI_C
	.field  	128,8		; 0x03  ETX   : _ABI_C
	.field  	128,8		; 0x04  EOT   : _ABI_C
	.field  	128,8		; 0x05  ENQ   : _ABI_C
	.field  	128,8		; 0x06  ACK   : _ABI_C
	.field  	128,8		; 0x07  BEL   : _ABI_C
	.field  	128,8		; 0x08  BS    : _ABI_C
	.field  	144,8		; 0x09  HT    : _ABI_C | _ABI_S
	.field  	144,8		; 0x0A  LF    : _ABI_C | _ABI_S
	.field  	144,8		; 0x0B  VT    : _ABI_C | _ABI_S
	.field  	144,8		; 0x0C  FF    : _ABI_C | _ABI_S
	.field  	144,8		; 0x0D  CR    : _ABI_C | _ABI_S
	.field  	128,8		; 0x0E  SO    : _ABI_C
	.field  	128,8		; 0x0F  SI    : _ABI_C
	.field  	128,8		; 0x10  DLE   : _ABI_C
	.field  	128,8		; 0x11  DC1   : _ABI_C
	.field  	128,8		; 0x12  DC2   : _ABI_C
	.field  	128,8		; 0x13  DC3   : _ABI_C
	.field  	128,8		; 0x14  DC4   : _ABI_C
	.field  	128,8		; 0x15  NAK   : _ABI_C
	.field  	128,8		; 0x16  SYN   : _ABI_C
	.field  	128,8		; 0x17  ETB   : _ABI_C
	.field  	128,8		; 0x18  CAN   : _ABI_C
	.field  	128,8		; 0x19  EM    : _ABI_C
	.field  	128,8		; 0x1A  SUB   : _ABI_C
	.field  	128,8		; 0x1B  ESC   : _ABI_C
	.field  	128,8		; 0x1C  FS    : _ABI_C
	.field  	128,8		; 0x1D  GS    : _ABI_C
	.field  	128,8		; 0x1E  RS    : _ABI_C
	.field  	128,8		; 0x1F  US    : _ABI_C
	.field  	24,8		; 0x20  ' '   : _ABI_S | _ABI_B
	.field  	4,8		; 0x21  '!'   : _ABI_P
	.field  	4,8		; 0x22  '"'   : _ABI_P
	.field  	4,8		; 0x23  '#'   : _ABI_P
	.field  	4,8		; 0x24  '$'   : _ABI_P
	.field  	4,8		; 0x25  '%'   : _ABI_P
	.field  	4,8		; 0x26  '&'   : _ABI_P
	.field  	4,8		; 0x27  '''   : _ABI_P
	.field  	4,8		; 0x28  '('   : _ABI_P
	.field  	4,8		; 0x29  ')'   : _ABI_P
	.field  	4,8		; 0x2A  '*'   : _ABI_P
	.field  	4,8		; 0x2B  '+'   : _ABI_P
	.field  	4,8		; 0x2C  ','   : _ABI_P
	.field  	4,8		; 0x2D  '-'   : _ABI_P
	.field  	4,8		; 0x2E  '.'   : _ABI_P
	.field  	4,8		; 0x2F  '/'   : _ABI_P
	.field  	2,8		; 0x30  '0'   : _ABI_X
	.field  	2,8		; 0x31  '1'   : _ABI_X
	.field  	2,8		; 0x32  '2'   : _ABI_X
	.field  	2,8		; 0x33  '3'   : _ABI_X
	.field  	2,8		; 0x34  '4'   : _ABI_X
	.field  	2,8		; 0x35  '5'   : _ABI_X
	.field  	2,8		; 0x36  '6'   : _ABI_X
	.field  	2,8		; 0x37  '7'   : _ABI_X
	.field  	2,8		; 0x38  '8'   : _ABI_X
	.field  	2,8		; 0x39  '9'   : _ABI_X
	.field  	4,8		; 0x3A  ':'   : _ABI_P
	.field  	4,8		; 0x3B  ';'   : _ABI_P
	.field  	4,8		; 0x3C  '<'   : _ABI_P
	.field  	4,8		; 0x3D  '='   : _ABI_P
	.field  	4,8		; 0x3E  '>'   : _ABI_P
	.field  	4,8		; 0x3F  '?'   : _ABI_P
	.field  	4,8		; 0x40  '@'   : _ABI_P
	.field  	67,8		; 0x41  'A'   : _ABI_U | _ABI_X
	.field  	67,8		; 0x42  'B'   : _ABI_U | _ABI_X
	.field  	67,8		; 0x43  'C'   : _ABI_U | _ABI_X
	.field  	67,8		; 0x44  'D'   : _ABI_U | _ABI_X
	.field  	67,8		; 0x45  'E'   : _ABI_U | _ABI_X
	.field  	67,8		; 0x46  'F'   : _ABI_U | _ABI_X
	.field  	65,8		; 0x47  'G'   : _ABI_U
	.field  	65,8		; 0x48  'H'   : _ABI_U
	.field  	65,8		; 0x49  'I'   : _ABI_U
	.field  	65,8		; 0x4A  'J'   : _ABI_U
	.field  	65,8		; 0x4B  'K'   : _ABI_U
	.field  	65,8		; 0x4C  'L'   : _ABI_U
	.field  	65,8		; 0x4D  'M'   : _ABI_U
	.field  	65,8		; 0x4E  'N'   : _ABI_U
	.field  	65,8		; 0x4F  'O'   : _ABI_U
	.field  	65,8		; 0x50  'P'   : _ABI_U
	.field  	65,8		; 0x51  'Q'   : _ABI_U
	.field  	65,8		; 0x52  'R'   : _ABI_U
	.field  	65,8		; 0x53  'S'   : _ABI_U
	.field  	65,8		; 0x54  'T'   : _ABI_U
	.field  	65,8		; 0x55  'U'   : _ABI_U
	.field  	65,8		; 0x56  'V'   : _ABI_U
	.field  	65,8		; 0x57  'W'   : _ABI_U
	.field  	65,8		; 0x58  'X'   : _ABI_U
	.field  	65,8		; 0x59  'Y'   : _ABI_U
	.field  	65,8		; 0x5A  'Z'   : _ABI_U
	.field  	4,8		; 0x5B  '['   : _ABI_P
	.field  	4,8		; 0x5C  '\'   : _ABI_P
	.field  	4,8		; 0x5D  ']'   : _ABI_P
	.field  	4,8		; 0x5E  '^'   : _ABI_P
	.field  	4,8		; 0x5F  '_'   : _ABI_P
	.field  	4,8		; 0x60  '`'   : _ABI_P
	.field  	35,8		; 0x61  'a'   : _ABI_L | _ABI_X
	.field  	35,8		; 0x62  'b'   : _ABI_L | _ABI_X
	.field  	35,8		; 0x63  'c'   : _ABI_L | _ABI_X
	.field  	35,8		; 0x64  'd'   : _ABI_L | _ABI_X
	.field  	35,8		; 0x65  'e'   : _ABI_L | _ABI_X
	.field  	35,8		; 0x66  'f'   : _ABI_L | _ABI_X
	.field  	33,8		; 0x67  'g'   : _ABI_L
	.field  	33,8		; 0x68  'h'   : _ABI_L
	.field  	33,8		; 0x69  'i'   : _ABI_L
	.field  	33,8		; 0x6A  'j'   : _ABI_L
	.field  	33,8		; 0x6B  'k'   : _ABI_L
	.field  	33,8		; 0x6C  'l'   : _ABI_L
	.field  	33,8		; 0x6D  'm'   : _ABI_L
	.field  	33,8		; 0x6E  'n'   : _ABI_L
	.field  	33,8		; 0x6F  'o'   : _ABI_L
	.field  	33,8		; 0x70  'p'   : _ABI_L
	.field  	33,8		; 0x71  'q'   : _ABI_L
	.field  	33,8		; 0x72  'r'   : _ABI_L
	.field  	33,8		; 0x73  's'   : _ABI_L
	.field  	33,8		; 0x74  't'   : _ABI_L
	.field  	33,8		; 0x75  'u'   : _ABI_L
	.field  	33,8		; 0x76  'v'   : _ABI_L
	.field  	33,8		; 0x77  'w'   : _ABI_L
	.field  	33,8		; 0x78  'x'   : _ABI_L
	.field  	33,8		; 0x79  'y'   : _ABI_L
	.field  	33,8		; 0x7A  'z'   : _ABI_L
	.field  	4,8		; 0x7B  '{'   : _ABI_P
	.field  	4,8		; 0x7C  '|'   : _ABI_P
	.field  	4,8		; 0x7D  '}'   : _ABI_P
	.field  	4,8		; 0x7E  '~'   : _ABI_P
	.field  	128,8		; 0x7F  DEL   : _ABI_C
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;
	.field  	0,8		;

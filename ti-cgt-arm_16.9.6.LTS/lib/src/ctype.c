/****************************************************************************/
/*  ctype.c v16.9.6                                                         */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
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
#include <ctype.h>

/****************************************************************************/
/*  DECLARATION OF CHARACTER TYPING LOOKUP TABLE                            */
/****************************************************************************/
const _DATA_ACCESS unsigned char _ctypes_[257] = {
                     /*  -1   EOF   */      0,
                     /* 0x00  NUL   */     _C_,
                     /* 0x01  SOH   */     _C_,
                     /* 0x02  STX   */     _C_,
                     /* 0x03  ETX   */     _C_,
                     /* 0x04  EOT   */     _C_,
                     /* 0x05  ENQ   */     _C_,
                     /* 0x06  ACK   */     _C_,
                     /* 0x07  BEL   */     _C_,
                     /* 0x08  BS    */     _C_,
                     /* 0x09  HT    */     _C_ | _S_,
                     /* 0x0A  LF    */     _C_ | _S_,
                     /* 0x0B  VT    */     _C_ | _S_,
                     /* 0x0C  FF    */     _C_ | _S_,
                     /* 0x0D  CR    */     _C_ | _S_,
                     /* 0x0E  SO    */     _C_,
                     /* 0x0F  SI    */     _C_,

                     /* 0x10  DLE   */     _C_,
                     /* 0x11  DC1   */     _C_,
                     /* 0x12  DC2   */     _C_,
                     /* 0x13  DC3   */     _C_,
                     /* 0x14  DC4   */     _C_,
                     /* 0x15  NAK   */     _C_,
                     /* 0x16  SYN   */     _C_,
                     /* 0x17  ETB   */     _C_,
                     /* 0x18  CAN   */     _C_,
                     /* 0x19  EM    */     _C_,
                     /* 0x1A  SUB   */     _C_,
                     /* 0x1B  ESC   */     _C_,
                     /* 0x1C  FS    */     _C_,
                     /* 0x1D  GS    */     _C_,
                     /* 0x1E  RS    */     _C_,
                     /* 0x1F  US    */     _C_,

                     /* 0x20  ' '   */     _S_ | _B_,
                     /* 0x21  '!'   */     _P_,
                     /* 0x22  '"'   */     _P_,
                     /* 0x23  '#'   */     _P_,
                     /* 0x24  '$'   */     _P_,
                     /* 0x25  '%'   */     _P_,
                     /* 0x26  '&'   */     _P_,
                     /* 0x27  '''   */     _P_,
                     /* 0x28  '('   */     _P_,
                     /* 0x29  ')'   */     _P_,
                     /* 0x2A  '*'   */     _P_,
                     /* 0x2B  '+'   */     _P_,
                     /* 0x2C  ','   */     _P_,
                     /* 0x2D  '-'   */     _P_,
                     /* 0x2E  '.'   */     _P_,
                     /* 0x2F  '/'   */     _P_,

                     /* 0x30  '0'   */     _N_ | _H_,
                     /* 0x31  '1'   */     _N_ | _H_,
                     /* 0x32  '2'   */     _N_ | _H_,
                     /* 0x33  '3'   */     _N_ | _H_,
                     /* 0x34  '4'   */     _N_ | _H_,
                     /* 0x35  '5'   */     _N_ | _H_,
                     /* 0x36  '6'   */     _N_ | _H_,
                     /* 0x37  '7'   */     _N_ | _H_,
                     /* 0x38  '8'   */     _N_ | _H_,
                     /* 0x39  '9'   */     _N_ | _H_,
                     /* 0x3A  ':'   */     _P_,
                     /* 0x3B  ';'   */     _P_,
                     /* 0x3C  '<'   */     _P_,
                     /* 0x3D  '='   */     _P_,
                     /* 0x3E  '>'   */     _P_,
                     /* 0x3F  '?'   */     _P_,

                     /* 0x40  '@'   */     _P_,
                     /* 0x41  'A'   */     _U_ | _H_,
                     /* 0x42  'B'   */     _U_ | _H_,
                     /* 0x43  'C'   */     _U_ | _H_,
                     /* 0x44  'D'   */     _U_ | _H_,
                     /* 0x45  'E'   */     _U_ | _H_,
                     /* 0x46  'F'   */     _U_ | _H_,
                     /* 0x47  'G'   */     _U_,
                     /* 0x48  'H'   */     _U_,
                     /* 0x49  'I'   */     _U_,
                     /* 0x4A  'J'   */     _U_,
                     /* 0x4B  'K'   */     _U_,
                     /* 0x4C  'L'   */     _U_,
                     /* 0x4D  'M'   */     _U_,
                     /* 0x4E  'N'   */     _U_,
                     /* 0x4F  'O'   */     _U_,

                     /* 0x50  'P'   */     _U_,
                     /* 0x51  'Q'   */     _U_,
                     /* 0x52  'R'   */     _U_,
                     /* 0x53  'S'   */     _U_,
                     /* 0x54  'T'   */     _U_,
                     /* 0x55  'U'   */     _U_,
                     /* 0x56  'V'   */     _U_,
                     /* 0x57  'W'   */     _U_,
                     /* 0x58  'X'   */     _U_,
                     /* 0x59  'Y'   */     _U_,
                     /* 0x5A  'Z'   */     _U_,
                     /* 0x5B  '['   */     _P_,
                     /* 0x5C  '\'   */     _P_,
                     /* 0x5D  ']'   */     _P_,
                     /* 0x5E  '^'   */     _P_,
                     /* 0x5F  '_'   */     _P_,

                     /* 0x60  '`'   */     _P_,
                     /* 0x61  'a'   */     _L_ | _H_,
                     /* 0x62  'b'   */     _L_ | _H_,
                     /* 0x63  'c'   */     _L_ | _H_,
                     /* 0x64  'd'   */     _L_ | _H_,
                     /* 0x65  'e'   */     _L_ | _H_,
                     /* 0x66  'f'   */     _L_ | _H_,
                     /* 0x67  'g'   */     _L_,
                     /* 0x68  'h'   */     _L_,
                     /* 0x69  'i'   */     _L_,
                     /* 0x6A  'j'   */     _L_,
                     /* 0x6B  'k'   */     _L_,
                     /* 0x6C  'l'   */     _L_,
                     /* 0x6D  'm'   */     _L_,
                     /* 0x6E  'n'   */     _L_,
                     /* 0x6F  'o'   */     _L_,

                     /* 0x70  'p'   */     _L_,
                     /* 0x71  'q'   */     _L_,
                     /* 0x72  'r'   */     _L_,
                     /* 0x73  's'   */     _L_,
                     /* 0x74  't'   */     _L_,
                     /* 0x75  'u'   */     _L_,
                     /* 0x76  'v'   */     _L_,
                     /* 0x77  'w'   */     _L_,
                     /* 0x78  'x'   */     _L_,
                     /* 0x79  'y'   */     _L_,
                     /* 0x7A  'z'   */     _L_,
                     /* 0x7B  '{'   */     _P_,
                     /* 0x7C  '|'   */     _P_,
                     /* 0x7D  '}'   */     _P_,
                     /* 0x7E  '~'   */     _P_,
                     /* 0x7F  DEL   */     _C_,

		     /* 0x80-0x8F   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0x90-0x9F   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xA0-0xAF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xB0-0xBF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xC0-0xCF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xD0-0xDF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xE0-0xEF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		     /* 0xF0-0xFF   */     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  };

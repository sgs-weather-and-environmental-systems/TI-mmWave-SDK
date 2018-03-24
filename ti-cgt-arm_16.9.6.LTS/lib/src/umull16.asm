;*****************************************************************************
;* umull16.asm - 16 bit code 32x32 -> 64 multiply. v16.9.6                   *
;*                                                                           *
;* Copyright (c) 2012-2017 Texas Instruments Incorporated                    *
;* http://www.ti.com/                                                        *
;*                                                                           *
;*  Redistribution and  use in source  and binary forms, with  or without    *
;*  modification,  are permitted provided  that the  following conditions    *
;*  are met:                                                                 *
;*                                                                           *
;*     Redistributions  of source  code must  retain the  above copyright    *
;*     notice, this list of conditions and the following disclaimer.         *
;*                                                                           *
;*     Redistributions in binary form  must reproduce the above copyright    *
;*     notice, this  list of conditions  and the following  disclaimer in    *
;*     the  documentation  and/or   other  materials  provided  with  the    *
;*     distribution.                                                         *
;*                                                                           *
;*     Neither the  name of Texas Instruments Incorporated  nor the names    *
;*     of its  contributors may  be used to  endorse or  promote products    *
;*     derived  from   this  software  without   specific  prior  written    *
;*     permission.                                                           *
;*                                                                           *
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    *
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    *
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    *
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    *
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    *
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    *
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    *
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    *
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    *
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    *
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     *
;*                                                                           *
;*****************************************************************************

;*****************************************************************************
;* This routine does a 32x32->64 multiply by computing
;* four partial products and summing them, like so:
;*
;*                AAAABBBB     A:B = X
;*    x           CCCCDDDD     C:D = Y
;*   ---------------------
;*                LLLLLLLL     L = B*D
;*           MMMM MMMM         M = A*D
;*           NNNN NNNN         N = C*B
;*    +  HHHHHHHH              H = A*C
;*   ---------------------
;*       RRRRRRRR RRRRRRRR     R = X*Y
;*
;* This is useful in lieu of UMULL when only 16bit code is available.
;*
;*****************************************************************************
;* Calling convention:
;*    32 bit arguments X and Y are in r0 and r1
;*    64 bit result hi32:lo32 is left in r0:r1
;*    All other registers preserved
;*****************************************************************************

	.if __TI_ARM_V6M0__

	.thumbfunc __TI_umull
	.thumb
	.global __TI_umull

__TI_umull:	.asmfunc stack_usage(24)

	PUSH	{ R2-R7 }	; LR not modified
	
	; Move the hi/lo halves of the arguments into the
	; low portion of separate registers:
	
	LSRS	R2, R0, #16	; R2 = A 
	LSRS	R3, R1, #16	; R3 = C
	
	MOVS	R4, #0xFF	; R4 = 0xFFFF (temporary)
	LSLS	R4, R4, #8
	ADDS	R4, #0xFF
	
	ANDS	R0, R4		; R0 = B
	ANDS	R1, R4		; R1 = D
	
	; Now we compute the four partial products:
	
	MOVS	R4, R1
	MULS	R4, R0		; R4 = L
	
	MOVS	R5, R2
	MULS	R5, R3		; R5 = H
	 
	MOVS	R6, R0
	MULS	R6, R3		; R6 = N

	MOVS	R7, R1
	MULS	R7, R2		; R7 = M
	
	; From here, we use R0:R1 to accumulate the sum of
	; the partial products.
	
	LSRS	R2, R6, #16	; R2 = Nhi
	LSRS	R3, R7, #16	; R3 = Mhi
	
	ADDS	R0, R5, R2	; R0 = H + Mhi
	ADDS	R0, R0, R3	; R0 = H + Mhi + Nhi
	
	LSLS	R2, R6, #16	; R2 = Nlo
	LSLS	R3, R7, #16	; R3 = Mlo
	
	; For the low half of the result, we have to keep track
	; of overflow bits and add them to the high half.
	
	MOVS	R5, #0		; We need a zeroed register
	ADDS	R1, R4, R2	; R1 = L + Nlo
	ADCS	R0, R5		; H = H + carry
	ADDS	R1, R1, R3	; R1 = L + Nlo + Mlo
	ADCS	R0, R5		; H = H + carry
	
	; The full 64 bit result is now in R0:R1
	
	POP	{ R2-R7 }

	BX	LR

	.endasmfunc

	.endif


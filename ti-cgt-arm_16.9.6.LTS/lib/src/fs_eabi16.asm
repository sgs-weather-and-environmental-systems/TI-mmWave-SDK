;******************************************************************************
;* FS_EABI16.ASM   - EABI SPECIFIC FLOAT HELPER FUNCTIONS  -  v16.9.6         *
;*                 AS REQUIRED BY: Run-Time ABI for the ARM Architecture      *
;*                                                                            *
;* Copyright (c) 2012-2017 Texas Instruments Incorporated                     *
;* http://www.ti.com/                                                         *
;*                                                                            *
;*  Redistribution and  use in source  and binary forms, with  or without     *
;*  modification,  are permitted provided  that the  following conditions     *
;*  are met:                                                                  *
;*                                                                            *
;*     Redistributions  of source  code must  retain the  above copyright     *
;*     notice, this list of conditions and the following disclaimer.          *
;*                                                                            *
;*     Redistributions in binary form  must reproduce the above copyright     *
;*     notice, this  list of conditions  and the following  disclaimer in     *
;*     the  documentation  and/or   other  materials  provided  with  the     *
;*     distribution.                                                          *
;*                                                                            *
;*     Neither the  name of Texas Instruments Incorporated  nor the names     *
;*     of its  contributors may  be used to  endorse or  promote products     *
;*     derived  from   this  software  without   specific  prior  written     *
;*     permission.                                                            *
;*                                                                            *
;*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS     *
;*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT     *
;*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR     *
;*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT     *
;*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,     *
;*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT     *
;*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     *
;*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     *
;*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT     *
;*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE     *
;*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.      *
;*                                                                            *
;******************************************************************************

;******************************************************************************
;*
;* +--------------------------------------------------------------+
;* | SINGLE PRECISION FLOATING POINT FORMAT                       |
;* |								  |
;* |   31 30    23 22                    0			  |
;* |   +-+--------+-----------------------+			  |
;* |   |S|    E   |           M           +			  |
;* |   +-+--------+-----------------------+			  |
;* |								  |
;* |   <S>  SIGN FIELD    :        0 - POSITIVE VALUE		  |
;* |			           1 - NEGATIVE VALUE		  |
;* |								  |
;* |   <E>  EXPONENT FIELD:       00 - ZERO IFF M == 0		  |
;* |			     01...FE - EXPONENT VALUE (127 BIAS)  |
;* |				  FF - INFINITY			  |
;* |								  |
;* |   <M>  MANTISSA FIELD:  FRACTIONAL MAGNITUDE WITH IMPLIED 1  |
;* +--------------------------------------------------------------+
;*
;******************************************************************************

	.global  __aeabi_cfcmple
	.global  __aeabi_fsub

tmp	.set	r2

	.thumb

;****************************************************************************
;* __AEABI_FNEG -  FLOAT NEGATION
;****************************************************************************
	.sect ".text:__aeabi_fneg"
	.global  __aeabi_fneg
	.thumbfunc __aeabi_fneg
__aeabi_fneg: .asmfunc stack_usage(4)
	PUSH	{r1, lr}
        MOVS    r1, #0x80
        LSLS    r1, r1, #24
	EORS	r0, r1                  ; NEGATE OPERAND
	POP     {r1, pc} 	  
	.endasmfunc 

;****************************************************************************
;* __AEABI_FRSUB -  FLOAT REVERSE SUBTRACTION
;*                  SWAP INPUTS, CALL __AEABI_FSUB
;****************************************************************************
	.sect ".text:__aeabi_frsub"
	.global  __aeabi_frsub
	.thumbfunc __aeabi_frsub
__aeabi_frsub: .asmfunc stack_usage(4)
	PUSH	{lr}

	; SWAP INPUTS
	MOVS tmp, r0
	MOVS r0,  r1
	MOVS r1,  tmp

	BL __aeabi_fsub
	POP     {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPEQ -  FLOAT EQUALITY TEST     
;*                   RETURNS 1 IF INPUTS ARE EQUAL, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpeq"
	.global  __aeabi_fcmpeq
	.thumbfunc __aeabi_fcmpeq
__aeabi_fcmpeq: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cfcmple
        
        BNE     $ne
	MOVS	r0, #1			; Z set
	B       $eqend
$ne:    MOVS	r0, #0			; Z clear
$eqend:
	POP     {pc} 	  
	.endasmfunc

	
;****************************************************************************
;* __AEABI_FCMPLT -  FLOAT LESS-THAN TEST     
;*                   RETURNS 1 IF INP1 < INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmplt"
	.global  __aeabi_fcmplt
	.thumbfunc __aeabi_fcmplt
__aeabi_fcmplt: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cfcmple

        BCS     $cs
	MOVS	r0, #1			; C clear
        B       $ltend
$cs:	MOVS	r0, #0			; C set
$ltend:
	POP   {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPLE -  FLOAT LESS-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 <= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmple"
	.global  __aeabi_fcmple
	.thumbfunc __aeabi_fcmple
__aeabi_fcmple: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cfcmple

        BHI     $hi
	MOVS	r0, #1			; C clear or Z set
        B       $leend
$hi:	MOVS	r0, #0			; C set and Z clear
$leend:	
	POP   {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPGT -  FLOAT GREATER-THAN TEST     
;*                   RETURNS 1 IF INP1 > INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpgt"
	.global  __aeabi_fcmpgt
	.thumbfunc __aeabi_fcmpgt
__aeabi_fcmpgt: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cfcmple

        BLS     $ls
	MOVS	r0, #1			; C set and Z clear
        B       $gtend
$ls:	MOVS	r0, #0			; C clear or Z set
$gtend:
	POP   {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPGE -  FLOAT GREATER-THAN OR EQUAL TO TEST     
;*                   RETURNS 1 IF INP1 >= INP2, 0 OTHERWISE 
;****************************************************************************
	.sect ".text:__aeabi_fcmpge"
	.global  __aeabi_fcmpge
	.thumbfunc __aeabi_fcmpge
__aeabi_fcmpge: .asmfunc stack_usage(4)
	PUSH	{lr}
	BL	__aeabi_cfcmple

	BCC     $cc
	MOVS	r0, #1			; C set 
        B       $geend
$cc	MOVS	r0, #0			; C clear
$geend:	
	POP   {pc} 	  
	.endasmfunc


;****************************************************************************
;* __AEABI_FCMPUN -  FLOAT UNORDERED                         
;*                   RETURNS 1 IF EITHER NUMBER IS A NaN, 0 OTHERWISE 
;*                   FLOAT NaN: 
;*                         SIGN BIT: 0
;*                         EXPONENT: 11111111 
;*                         MANTISSA: At least one bit set in the 20 most
;*                                   significant bits (EABI, Section 4.1.1.1)
;****************************************************************************
tmp1	.set	r3

	.sect ".text:__aeabi_fcmpun"
	.global  __aeabi_fcmpun
	.thumbfunc __aeabi_fcmpun
__aeabi_fcmpun: .asmfunc stack_usage(8)
	PUSH	{tmp, r3, lr}
	; check for all 1s in exponent
	LSLS	tmp, r0, #1
	LSRS	tmp, tmp, #24
	CMP	tmp, #0xFF
	BNE	$op2

	; check for non-zero mantissa
	LSLS	tmp, r0, #9
	LSRS	tmp, tmp, #12		; Use only 20 MS bits of mantissa
	MOVS	tmp1, #0x1		; 0xFFFFF   
        LSLS    tmp1, tmp1, #16
        SUBS	tmp1, tmp1, #1            
	ANDS	tmp1, tmp1, tmp

	BEQ	$op2
	MOVS	r0, #1			; != 0 implies non-zero mantissa
	POP	{tmp, r3, pc} 	  

$op2:
	; repeat for op2
	; check for all 1s in exponent
	LSLS	tmp, r1, #1
	LSRS	tmp, tmp, #24
	CMP	tmp, #0xFF
	BNE	$fin

	; check for non-zero mantissa
	LSLS	tmp, r1, #9
	LSRS	tmp, tmp, #12		; Use only 20 MS bits of mantissa
	MOVS	tmp1, #0x1		; 0xFFFFF   
        LSLS    tmp1, tmp1, #16
        SUBS    tmp1, tmp1, #1            
	ANDS	tmp1, tmp1, tmp

        BEQ     $fin
	MOVS	r0, #1			; != 0 implies non-zero mantissa
	POP	{tmp, r3, pc} 	  

$fin:
	MOVS	r0, #0			
	POP     {tmp, r3, pc} 	  
	.endasmfunc

	.end
	


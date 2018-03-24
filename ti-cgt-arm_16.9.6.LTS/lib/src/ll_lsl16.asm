;******************************************************************************
;* LL_LSL16.ASM  - 16 BIT STATE -  v16.9.6                                    *
;*                                                                            *
;* Copyright (c) 1996-2017 Texas Instruments Incorporated                     *
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

;****************************************************************************
;* LL$LSL - LEFT SHIFT A 64 BIT LONG LONG NUMBER BY 1 to 64 bits
;****************************************************************************
;*
;*   o INPUT OP1 IS IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o INPUT OP2 IS IN r2   
;*   o RESULT IS RETURNED IN r0:r1 (r1:r0 IF LITTLE ENDIAN)
;*   o INPUT OP2 IN r2 IS NOT DESTROYED
;*
;****************************************************************************

	.thumb

        .if __TI_EABI_ASSEMBLER         ; ASSIGN EXTERNAL NAMES BASED ON
        .asg __aeabi_llsl, __TI_LL$LSL  ; RTS BEING BUILT
        .else
	.clink
        .asg LL$LSL, __TI_LL$LSL
        .endif

	.if .TMS470_LITTLE

hi	.set r1
lo	.set r0

	.else

hi	.set r0
lo	.set r1

	.endif

shft	.set r2

	.if __TI_ARM9ABI_ASSEMBLER  | __TI_EABI_ASSEMBLER
	.thumbfunc __TI_LL$LSL
	.endif

	.global	__TI_LL$LSL
__TI_LL$LSL:	.asmfunc stack_usage(12)
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
	PUSH	{r3-r4, lr}  		;
	.else
	PUSH	{r3-r4}
	.endif
        MOVS    r3, #32                 ;
        SUBS    r3, r3, shft            ;
        BHI     $1                      ;
        MOVS    hi, lo                  ;
        MOVS    lo, #0                  ;
        NEGS    r3, r3                  ;
        LSLS    hi, r3                  ;
        B       return                  ;
$1:      
        MOVS    r4, lo                  ;
        LSLS    hi, shft                ;
        LSRS    r4, r3                  ;
        ORRS    hi, r4                  ;
        LSLS    lo, shft                ;

return:
	.if __TI_ARM7ABI_ASSEMBLER | __TI_ARM9ABI_ASSEMBLER | !__TI_TMS470_V4__
        POP     {r3-r4, pc}             ;
	.else
	POP	{r3-r4}
	BX	lr
	.endif

	.endasmfunc

	.end

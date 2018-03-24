;******************************************************************************
;* UNALIGNED_T2.ASM  - THUMB-2 STATE -  v16.9.6                               *
;*                                                                            *
;* Copyright (c) 2004-2017 Texas Instruments Incorporated                     *
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
;*                                                                            *
;* Unaligned memory access functions required by			      *
;* Run-time ABI for the ARM Architecture, 30th Oct 2003, Section 4.3.3        *
;******************************************************************************


	.if __TI_EABI_ASSEMBLER        

	.thumb

	.if .TMS470_LITTLE
bit24_31    .set    3
bit16_23    .set    2
bit08_15    .set    1
bit00_07    .set    0
	.else
bit24_31    .set    0
bit16_23    .set    1
bit08_15    .set    2
bit00_07    .set    3
	.endif


;****************************************************************************
;* __aeabi_uread4 - UNALIGNED 4 BYTE READ
;* int __aeabi_uread4(void *address)
;****************************************************************************

	.thumbfunc __aeabi_uread4
	.global	 __aeabi_uread4
__aeabi_uread4: .asmfunc stack_usage(0)
        LDRB      V9, [A1, #bit24_31]	    ; LOAD TOP BYTE OF REGISTER         
        LDRB      A2, [A1, #bit16_23]       ; LOAD NEXT BYTE    
        ORR       V9, A2, V9, LSL #8	    ; SHIFT TOP BYTE, OR WITH NEXT
        LDRB      A2, [A1, #bit08_15]           
        LDRB      A1, [A1, #bit00_07]           
        ORR       V9, A2, V9, LSL #8     
        ORR       A1, A1, V9, LSL #8     
        BX        LR
	.endasmfunc
      
 
;****************************************************************************
;* __aeabi_uwrite4 - UNALIGNED 4 BYTE WRITE, RETURNS VALUE WRITTEN
;* int __aeabi_uwrite4(int value, void *address)
;****************************************************************************

	.thumbfunc __aeabi_uwrite4
	.global	 __aeabi_uwrite4
__aeabi_uwrite4: .asmfunc stack_usage(0)
        STRB      A1, [A2, #bit00_07]   

	ASR       V9, A1, #8        
        STRB      V9, [A2, #bit08_15]   

        ASR       V9, A1, #16       
        STRB      V9, [A2, #bit16_23]   

        ASR       V9, A1, #24       
        STRB      V9, [A2, #bit24_31]   
        BX        LR
	.endasmfunc


	.if .TMS470_LITTLE
reg_byte_0	.set	    0
reg_byte_1	.set	    1
reg_byte_2	.set	    2
reg_byte_3	.set	    3
reg_byte_4	.set	    4
reg_byte_5	.set	    5
reg_byte_6	.set	    6
reg_byte_7	.set	    7

hi_res	.set A2
lo_res	.set A1
	.else
reg_byte_0	.set	    7
reg_byte_1	.set	    6
reg_byte_2	.set	    5
reg_byte_3	.set	    4
reg_byte_4	.set	    3
reg_byte_5	.set	    2
reg_byte_6	.set	    1
reg_byte_7	.set	    0

hi_res	.set A1
lo_res	.set A2
	.endif


;****************************************************************************
;* __aeabi_uread8 - UNALIGNED 8 BYTE READ
;* long long __aeabi_uread8(void *address)
;****************************************************************************
;*
;*   o A1 CONTAINS THE ADDRESS TO BE READ FROM
;*   o RESULT IS RETURNED IN A0:A1 (A1:A0 IF LITTLE ENDIAN)
;*
;****************************************************************************

addr		.set	    lr

	.thumbfunc __aeabi_uread8
	.global	 __aeabi_uread8
__aeabi_uread8: .asmfunc stack_usage(4)
	PUSH	{lr}
	MOV	addr, A1

	; LOAD BYTES INTO LO REGISTER
        LDRB    V9, [addr, #reg_byte_3]           
        LDRB    A3, [addr, #reg_byte_2]           
        LDRB    A4, [addr, #reg_byte_1]           
        LDRB    lo_res, [addr, #reg_byte_0]           

	ORR  	V9, A3, V9, LSL #8
	ORR  	V9, A4, V9, LSL #8
	ORR	lo_res, lo_res, V9, LSL #8

	; LOAD BYTES INTO HI REGISTER
        LDRB    V9, [addr, #reg_byte_7]           
        LDRB    A3, [addr, #reg_byte_6]           
        LDRB    A4, [addr, #reg_byte_5]           
        LDRB    hi_res, [addr, #reg_byte_4]           

	ORR  	V9, A3, V9, LSL #8
	ORR  	V9, A4, V9, LSL #8
	ORR  	hi_res, hi_res, V9, LSL #8

	POP     {pc}
	.endasmfunc


;****************************************************************************
;* __aeabi_uwrite8 - UNALIGNED 8 BYTE WRITE, RETURNS VALUE WRITTEN
;* long long __aeabi_uwrite8(long long value, void *address)
;****************************************************************************
;*
;*   o VALUE TO BE WRITTEN IS IN A0:A1 (A1:A0 IF LITTLE ENDIAN)
;*   o A2 CONTAINS THE ADDRESS TO WRITE TO
;*   o RESULT IS RETURNED IN A0:A1 (A1:A0 IF LITTLE ENDIAN)
;*
;****************************************************************************

	.thumbfunc __aeabi_uwrite8
	.global	 __aeabi_uwrite8
__aeabi_uwrite8: .asmfunc stack_usage(0)
	STRB      lo_res, [A3, #reg_byte_0]   
	ASR       V9, lo_res, #8        
        STRB      V9, [A3, #reg_byte_1]   
        ASR       V9, lo_res, #16       
        STRB      V9, [A3, #reg_byte_2]   
        ASR       V9, lo_res, #24       
        STRB      V9, [A3, #reg_byte_3]   

	STRB      hi_res, [A3, #reg_byte_4]   
	ASR       V9, hi_res, #8        
        STRB      V9, [A3, #reg_byte_5]   
        ASR       V9, hi_res, #16       
        STRB      V9, [A3, #reg_byte_6]   
        ASR       V9, hi_res, #24       
        STRB      V9, [A3, #reg_byte_7]   
	BX	  LR
	.endasmfunc

	.endif				    ; __TI_EABI_ASSEMBLER

	.end

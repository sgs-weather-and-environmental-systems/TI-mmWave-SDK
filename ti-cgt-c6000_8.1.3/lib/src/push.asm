;******************************************************************************
;* push_rts/pop_rts v8.1.3                                                    *
;*                                                                            *
;* Copyright (c) 2000-2017 Texas Instruments Incorporated                     *
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

; The __push_rts routine saves the SOE registers on the stack
; The __pop_rts routine restores the SOE registers from the stack
; Each function modifies the SP appropriately

;******************************************************************************
; IMPORTANT NOTE:
;    The Table Driven Exception Handling needs to know the stack adjustment
;    in this routine and the order in which the registers are pushed to stack
;    to correctly unwind the stack. This unwinding is implemented in 
;    the function process_unwind() in tdeh_pr_c6000.cpp. Look for the unwinding
;    for the encoding __c6xabi_pop_rts in this function. 
;    If you make any changes to the following routines that either changes the 
;    stack usage or the order in which the registers are pushed, corresponding
;    changes should be made in the unwinding code mentioned above.
;******************************************************************************

 .if .TMS320C6400 | .TMS320C6740 | .TMS320C6600

        .global __push_rts, __c6xabi_push_rts
        .global __pop_rts, __c6xabi_pop_rts
        .global __push_all_rts, __c6xabi_push_all_rts
        .global __pop_all_rts, __c6xabi_pop_all_rts
	.sect	".text:__push_rts"
	.clink

__c6xabi_push_rts
__push_rts: .asmfunc

        stw   b14, *b15--[2]

        b     a3
 ||     stdw a15:a14, *b15--

        stdw b13:b12, *b15--

        stdw a13:a12, *b15--

        stdw b11:b10, *b15--

        stdw a11:a10, *b15--

        stdw b3:b2,   *b15--

        ; branch occurs

        .endasmfunc

	.sect	".text:__pop_rts"


__c6xabi_pop_rts
__pop_rts: .asmfunc

        lddw *++b15, b3:b2

        lddw *++b15, a11:a10

        lddw *++b15, b11:b10

        lddw *++b15, a13:a12

        lddw *++b15, b13:b12

        b    b3                 ; return chaining
 ||     lddw *++b15, a15:a14

        ldw  *++b15[2], b14

        nop  4

        ; branch occurs

        .endasmfunc

 .endif

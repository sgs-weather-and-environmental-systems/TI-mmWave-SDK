;******************************************************************************
;* tls_get_tp  v8.1.3                                                         *
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
;* __c6xabi_get_tp() - This function must return the Thread Pointer (TP) of   *
;*                     the current thread. The definition provided below is   *
;*                     a stub that returns the main thread's TP and supports  *
;*                     the usecase where there is only one thread.            *
;*                                                                            *
;*                     Multiple threads are usually supported by a thread     * 
;*                     library that creates and manages threads. Such a       *
;*                     thread library must provide a version of this function *
;*                     that returns the current thread's TP. This function is *
;*                     defined weak. Hence, if a strong (non-weak) definition *
;*                     is provide by the thread-library, it will be linked-in.*
;*                                                                            *
;*  NOTE: This function must not modify any register other than the return    *
;*        register A4.                                                        *
;******************************************************************************
;* 
;* #pragma CODE_SECTION(__c6xabi_get_tp, ".text:tls:get_tp")
;* #pragma WEAK(__TI_TLS_MAIN_THREAD_Base);
;* #pragma WEAK(__c6xabi_get_tp);
;* extern far const void * __TI_TLS_MAIN_THREAD_Base;
;* void * __c6xabi_get_tp(void)
;* {
;*    return &_TI_TLS_MAIN_THREAD_Base;
;* }
;******************************************************************************

	.sect	".text:tls:get_tp"
	.clink
	.global	__c6xabi_get_tp
	.weak	__c6xabi_get_tp

__c6xabi_get_tp:  .asmfunc
           RET     .S      B3 
           MVKL    .S      __TI_TLS_MAIN_THREAD_Base,A4
           MVKH    .S      __TI_TLS_MAIN_THREAD_Base,A4
           NOP             3

	.global	__TI_TLS_MAIN_THREAD_Base
	.weak	__TI_TLS_MAIN_THREAD_Base

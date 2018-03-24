;/*
; *
; * Copyright (c) 2012, Texas Instruments Incorporated
; * All rights reserved.
; *
; *  Redistribution and use in source and binary forms, with or without
; *  modification, are permitted provided that the following conditions
; *  are met:
; *
; *    Redistributions of source code must retain the above copyright
; *    notice, this list of conditions and the following disclaimer.
; *
; *    Redistributions in binary form must reproduce the above copyright
; *    notice, this list of conditions and the following disclaimer in the
; *    documentation and/or other materials provided with the
; *    distribution.
; *
; *    Neither the name of Texas Instruments Incorporated nor the names of
; *    its contributors may be used to endorse or promote products derived
; *    from this software without specific prior written permission.
; *
; *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
; *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
; *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
; *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
; *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; *
;*/
                .global     __SK_ns_disp
                .global     __SK_ns_wedge
                .global     __SK_ns_swenr

SK_SYSCALL_REGSWE	.set	-1
SK_SYSCALL_REGHWE	.set	-2
SK_SYSCALL_REGINT	.set	-3
SK_SYSCALL_DOWNCALL	.set	-4
SK_SYSCALL_REGSCWP	.set	-5
SK_SYSCALL_LOAD		.set	-6
SK_SYSCALL_UNLOAD	.set	-7
SK_SYSCALL_ALGOINVOKE	.set	-8
SK_SYSCALL_ALGORETURN	.set	-9
SK_SYSCALL_L1DSIZE	.set	-10
SK_SYSCALL_L1PSIZE	.set	-11
SK_SYSCALL_L2SIZE	.set	-12
SK_SYSCALL_ALLOCSC	.set	-13
SK_SYSCALL_FREESC	.set	-14
SK_SYSCALL_SETPDC	.set	-15
SK_SYSCALL_SETEVENTREG	.set	-16
SK_SYSCALL_GETUID	.set	-17
SK_SYSCALL_SETDELKEY	.set	-18
SK_SYSCALL_SETMAR	.set	-19
SK_SYSCALL_GETSECKEY 	.set	-20
SK_SYSCALL_SECUREKEY	.set    -21
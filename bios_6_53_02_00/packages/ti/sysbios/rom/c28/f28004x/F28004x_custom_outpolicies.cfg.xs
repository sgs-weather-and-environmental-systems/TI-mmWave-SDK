/*
 * Copyright (c) 2015, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/* 
 * For LibType_Custom build, force all ROM required modules to have
 * outPolicy = Types.SEPARATE_FILE
 */
var Types = xdc.useModule('xdc.runtime.Types');

var BIOS = xdc.useModule('ti.sysbios.BIOS');
BIOS.common$.outPolicy = Types.SEPARATE_FILE;

var BIOSRtsGateProxy = xdc.module('ti.sysbios.BIOS_RtsGateProxy');
BIOSRtsGateProxy.common$.outPolicy = Types.SEPARATE_FILE;

var Clock = xdc.useModule('ti.sysbios.knl.Clock');
Clock.common$.outPolicy = Types.SEPARATE_FILE;

var Task = xdc.useModule('ti.sysbios.knl.Task');
Task.common$.outPolicy = Types.SEPARATE_FILE;

var TaskSupportProxy = xdc.module('ti.sysbios.knl.Task_SupportProxy');
TaskSupportProxy.common$.outPolicy = Types.SEPARATE_FILE;

var Swi = xdc.useModule('ti.sysbios.knl.Swi');
Swi.common$.outPolicy = Types.SEPARATE_FILE;

var Semaphore = xdc.useModule('ti.sysbios.knl.Semaphore');
Semaphore.common$.outPolicy = Types.SEPARATE_FILE;

var Event = xdc.useModule('ti.sysbios.knl.Event');
Event.common$.outPolicy = Types.SEPARATE_FILE;

var Mailbox = xdc.useModule('ti.sysbios.knl.Mailbox');
Mailbox.common$.outPolicy = Types.SEPARATE_FILE;

var Queue = xdc.useModule('ti.sysbios.knl.Queue');
Queue.common$.outPolicy = Types.SEPARATE_FILE;

var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');
halHwi.common$.outPolicy = Types.SEPARATE_FILE;

var halHwiProxy = xdc.module('ti.sysbios.hal.Hwi_HwiProxy');
halHwiProxy.common$.outPolicy = Types.SEPARATE_FILE;

var halTimer = xdc.useModule('ti.sysbios.hal.Timer');
halTimer.common$.outPolicy = Types.SEPARATE_FILE;

var c28Hwi = xdc.useModule('ti.sysbios.family.c28.Hwi');
c28Hwi.common$.outPolicy = Types.SEPARATE_FILE;

var c28Intrinsics = xdc.useModule('ti.sysbios.family.c28.IntrinsicsSupport');
c28Intrinsics.common$.outPolicy = Types.SEPARATE_FILE;

var TaskSupport = xdc.useModule('ti.sysbios.family.c28.TaskSupport');
TaskSupport.common$.outPolicy = Types.SEPARATE_FILE;

var Intrinsics = xdc.useModule('ti.sysbios.knl.Intrinsics');
Intrinsics.common$.outPolicy = Types.SEPARATE_FILE;

var IntrinsicsSupportProxy = xdc.module('ti.sysbios.knl.Intrinsics_SupportProxy');
IntrinsicsSupportProxy.common$.outPolicy = Types.SEPARATE_FILE;

var GateHwi = xdc.useModule('ti.sysbios.gates.GateHwi');
GateHwi.common$.outPolicy = Types.SEPARATE_FILE;

var GateMutex = xdc.useModule('ti.sysbios.gates.GateMutex');
GateMutex.common$.outPolicy = Types.SEPARATE_FILE;

/* use the c28 Timer and TimestampProvider modules */
var c28Timer = xdc.useModule('ti.sysbios.family.c28.Timer');
c28Timer.common$.outPolicy = Types.SEPARATE_FILE;

var c28Timestamp = xdc.useModule('ti.sysbios.family.c28.f2837x.TimestampProvider');
c28Timestamp.common$.outPolicy = Types.SEPARATE_FILE;

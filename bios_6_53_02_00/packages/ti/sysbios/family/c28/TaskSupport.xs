/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
 *  ======== TaskSupport.xs ========
 */

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.C28_large":
        case "ti.targets.C28_float":
        case "ti.targets.elf.C28_float":
            return (["TaskSupport_asm.s28"]);
            break;

	default:
	    return (null);
	    break;
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    this.common$.fxntab = false;
}

/*
 *  ======== stackUsedMeta ========
 */
function stackUsed$view(stackData)
{
    var index = stackData.length - 1;

    while(stackData[index] == 0xbe) {
        index--;
    }

    return (index + 1);
}

/*
 *  ======== getCallStack$view ========
 */
function getCallStack$view(taskRawView, taskState, threadType)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Task = xdc.useModule('ti.sysbios.knl.Task');

    var CallStack = xdc.useModule('xdc.rov.CallStack');

    var stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt32', isScalar: true}, taskRawView.context-64, 32);

    var sp = 0;
    var pc = 0;
    var rpc = 0;

    /*
     * PC should be within TaskSupport_swap() but the debugger can't do
     * call stack for assembly coded functions. So, we set the PC to the
     * saved RPC.
     */
    if (Program.build.target.name == "C28F") {
        var contextStackOffset = 4;
    }
    else {
        var contextStackOffset = 0;
    }

    pc = stackData[31];
    rpc = stackData[31 - contextStackOffset - 4];
    sp = Number(taskRawView.context) - 2 * (5 + contextStackOffset);

    if (taskState == Task.Mode_RUNNING) {
        switch (threadType) {
            /* The program has called BIOS_exit(), use live registers */
            case "Main":
            /* This is the current thread, use live registers */
            case "Task":
                CallStack.clearRegisters();
                CallStack.fetchRegisters(["SP", "RPC", "PC"]);
                sp = CallStack.getRegister("SP");
                rpc = CallStack.getRegister("RPC");
                pc = CallStack.getRegister("PC");
                break;

            /*
             * The running task has been pre-empted by a Hwi and/or Swi.
             * Assume its a Hwi.
             */
            case "Hwi":
            case "Swi":
                /* fetch PC, RPC, SP from Hwi stack */
                try {
                    var hwiRawView = Program.scanRawView('ti.sysbios.family.c28.Hwi');
                    var taskSP = hwiRawView.modState.taskSP;
                    stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt32', isScalar: true}, taskSP-64, 32);
                }
                catch (e) {
                    return (e.toString);
                }

                if (Program.build.target.name == "C28F") {
                    var hwiStackOffset = 4;
                }
                else {
                    var hwiStackOffset = 0;
                }

                rpc = stackData[31 - 1 - hwiStackOffset];
                pc = stackData[7];
                sp = hwiRawView.modState.taskSP - 2 * (hwiStackOffset + 8);
                break;
        }
    }
    else {
    }

    CallStack.setRegister("PC", pc);
    CallStack.setRegister("RPC", rpc);
    CallStack.setRegister("SP", sp);

    var bts = "";

    var enumStrArray = String(taskState).split(".");
    bts += "Task_" + enumStrArray[enumStrArray.length - 1];

    bts += ", PC = 0x" + pc.toString(16);
    bts += ", SP = 0x" + sp.toString(16);
    bts += ", RPC = 0x" + rpc.toString(16);

    bts += "\n";

    bts += CallStack.toText();

    return (bts);
}

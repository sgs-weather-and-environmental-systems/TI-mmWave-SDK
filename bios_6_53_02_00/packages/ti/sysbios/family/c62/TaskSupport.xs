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
        case "ti.targets.elf.C64P":
        case "ti.targets.elf.C674":
            return (["TaskSupport_asm.s62"]);
            break;

        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
	    if (xdc.module('ti.sysbios.BIOS').useSK == true) {
		return (["TaskSupport_asm.s62", "../../../sk/sk_cwrap.asm"]);
	    }
	    else {
		return (["TaskSupport_asm.s62"]);
	    }
            break;

        case "ti.targets.elf.C64T":
            return (["TaskSupport_asm.s64T"]);
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

    this.common$.fxntab = false;
}

/*
 *  ======== stackUsedMeta ========
 */
function stackUsed$view(stackData)
{
    var size = stackData.length;
    var index = 0;
    /*
     * The stack is filled with 0xBE. Because the type is Char, not UChar,
     * ROV reads this value as signed: -66.
     */
    while(stackData[index] == -66) {
        index++;
    }

    return (size - index);
}

/*
 *  ======== getCallStack$view ========
 */
function getCallStack$view(taskRawView, taskState, threadType)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Task = xdc.useModule('ti.sysbios.knl.Task');

    var CallStack = xdc.useModule('xdc.rov.CallStack');

    var stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt', isScalar: true}, taskRawView.context, 32, false);

    var sp = 0;
    var pc = 0;
    var b3 = 0;

    /*
     * PC should be within TaskSupport_swap() but the debugger can't do call stack for
     * assembly coded functions. So, we set the PC to the saved B3.
     */
    pc = stackData[1]; /* set pc to saved b3 */
    sp = Number(taskRawView.context) + 12*4;
    b3 = stackData[12];

    if (taskState == Task.Mode_RUNNING) {
        switch (threadType) {
            /* The program has called BIOS_exit(), use live registers */
            case "Main":
            /* This is the current thread, use live registers */
            case "Task":
                CallStack.clearRegisters();
                CallStack.fetchRegisters(["SP", "PC",
                                          "A0", "A1", "A2", "A3",
                                          "A4", "A5", "A6", "A7",
                                          "B0", "B1", "B2", "B3",
                                          "B4", "B5", "B6", "B7"]);
                sp = CallStack.getRegister("SP");
                b3 = CallStack.getRegister("B3");
                pc = CallStack.getRegister("PC");
                break;

            /*
             * The running task has been pre-empted by a Hwi and/or Swi.
             * Assume its a Hwi.
             */
            case "Hwi":
            case "Swi":
                /* fetch PC, B3, SP from task stack */
                try {
                    var HwiProxy = Program.$modules['ti.sysbios.hal.Hwi'].HwiProxy.$name;
                    var hwiRawView = Program.scanRawView(HwiProxy);
                    var taskSP = hwiRawView.modState.taskSP;

                    /*
                     * Get the IRP contained in the currently
                     * executing Hwi's object.
                     *
                     * This logic only works on non-nested interrupts because
                     * the intNum saved in the Hwi module state is overwritten
                     * by each nested Hwi. Consequently, the IRP fetched from
                     * a nested Hwi object will NOT be from a task thread.
                     *
                     * A more robust algorithm would verify that the IRP
                     * fetched from the Hwi object is found in the taskSP
                     * and if not, check every Hwi object's IRP until one
                     * IS found in the taskSP.
                     */
                    var intNum = hwiRawView.modState.intNum;
                    var hwiHandle = hwiRawView.modState.dispatchTable[intNum];

                    /*
                     * fetch the Hwi object
                     */
                    var Hwi = xdc.useModule(HwiProxy);
                    var hwiObj = Program.fetchStruct(Hwi.Instance_State$fetchDesc, hwiHandle);
                    pc = Number(hwiObj.irp);

                    /*
                     * fetch 128 words of stack beginning at taskSP
                     */
                    var stackTaskSP = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UInt', isScalar: true}, taskSP, 128);
                }
                catch (e) {
                    return (e.toString);
                }

                /*
                 * See Hwi_dispatchAlways for stack structure details
                 *
                 * search for saved IRP on task stack
                 * pc = IRP
                 * sp = &IRP + 30 double words
                 * b3 = 39 words after saved IRP on task stack
                 */
                for (var i = 0; i < 128; i++) {
                    if (stackTaskSP[i] == pc) {
                        sp = taskSP + i*4 + 30*8;
                        b3 = stackTaskSP[i+39];
                        break;
                    }
                }
                break;
        }
    }

    CallStack.setRegister("PC", pc);
    CallStack.setRegister("B15", sp);
    CallStack.setRegister("SP", sp);
    CallStack.setRegister("FP", sp);
    CallStack.setRegister("B3", b3);

    var bts = "";

    var enumStrArray = String(taskState).split(".");
    bts += "Task_" + enumStrArray[enumStrArray.length - 1];

    bts += ", PC = 0x" + pc.toString(16);
    bts += ", SP = 0x" + sp.toString(16);
    bts += ", B3 = 0x" + b3.toString(16);

    bts += "\n";

    bts += CallStack.toText();

    return (bts);
}

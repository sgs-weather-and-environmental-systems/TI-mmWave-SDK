/*
 *  ======== error.c ========
 *  This example shows the use of xdc.runtime.Error module to catch errors.
 *  An Error_Block passed to Task_create() checked to see if the create 
 *  failed. In no Error_Block is passed, then the application will terminate
 *  when an error occurs. This is shown in the Memory_alloc() call when the 
 *  Error_Block passed in is NULL. The error.cfg file also shows how to plug
 *  and error hook function that will get called as soon as an error occurs.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Error.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>

#include <xdc/cfg/global.h>

Void task1(UArg arg0, UArg arg1);
Void task2(UArg arg0, UArg arg1);
Void timerFxn(UArg arg);
/* pre-configured hook function called when errors are raised */
Void errHook(Error_Block *eb);
Int canFail1(Error_Block *eb, UInt val);
Void canFail2(Error_Block *eb, UInt val);

Task_Handle tsk1, tsk2;
Int numTasksCreated = 0;

/*
 *  ======== main ========
 */
Int main()
{ 
    Task_Params taskParams;
    Error_Block eb;
    Memory_Stats stats;

    Error_init(&eb);
        
    /* Picking a stackSize such that the second Task_create() will fail */
    Memory_getStats(Memory_defaultHeapInstance, &stats);

    Task_Params_init(&taskParams);
    taskParams.priority = 1;
    taskParams.stackSize = (stats.totalFreeSize/2) + 64;

    /* 
     * Create two tasks, The first one succeeds and the second one fails
     * We catch the second failure in the Error_Block
     */
    tsk1 = Task_create(task1, &taskParams, &eb);
    
    if (Error_check(&eb)) {
        /* Should not get here */
        System_printf("First Task_create() failed\n");
        BIOS_exit(0);
    }
     
    Error_init(&eb);
    
    tsk2 = Task_create(task2, &taskParams, &eb);

    if (Error_check(&eb)) {
        /* Should get here */
        System_printf("Second Task_create() failed\n");
    }
   
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== task1 ========
 */
Void task1(UArg arg0, UArg arg1)
{
    Error_Block eb;
    Int value;

    Error_init(&eb);
    System_printf("Running task1 function\n");

    /*
     * Showing a case where we call a function that takes an Error_Block.
     * This function calls another function which can fail.
     * The Error_Block to passed up to the caller in case an error occurs.
     */
    value = canFail1(&eb, 11);
    System_printf("Value returned from canFail1 = %d\n", value);

    if (Error_check(&eb)) {
        /* Should get here */
        System_printf("Incorrect value used. Must be a multiple of 2\n");
    }

    /*
     * Showing a case where a Memory_alloc() is called but no Error_Block
     * is passed.  This Memory_alloc() will fail because the size is larger
     * than the available memory in the default heap.
     *
     * This call will cause the program to abort.  The error message can
     * be found in the LoggerBuf ROV view.
     */
    Memory_alloc(NULL, 0xffff, 0, NULL);
}

/*
 *  ======== timerFxn ========
 */
Void timerFxn(UArg arg)
{
    System_printf("Running timerFxn\n");
}

/*
 *  ======== task2 ========
 */
Void task2(UArg arg0, UArg arg1)
{
    System_printf("Running task2 function\n");
}

/*
 *  ======== errorHook ========
 */
Void errorHook(Error_Block *eb)
{
    System_printf(Error_getMsg(eb), Error_getData(eb)->arg[0], 
        Error_getData(eb)->arg[1]);
    System_printf("\n");
}

/*
 *  ======== canFail1 ========
 */
Int canFail1(Error_Block *eb, UInt val)
{
    canFail2(eb, val);

    if (Error_check(eb)) {
        return (-1);
    }
    else {
        return (val * 10);
    }
}

/*
 *  ======== canFail2 ========
 *  fails if val is not a mulitple of 2.
 */
Void canFail2(Error_Block *eb, UInt val)
{
    if (val % 2) {
        Error_raise(eb, Error_E_generic, "Value is not a multiple of 2", 0);
    }
}

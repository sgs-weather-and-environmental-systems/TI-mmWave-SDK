/*
 *  ======== mutex.c ========
 *  This example shows the use of two tasks and one semaphore to perform
 *  mutual exclusive data access.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>

#include <xdc/cfg/global.h>

Void task1(UArg arg0, UArg arg1);
Void task2(UArg arg0, UArg arg1);

Int resource = 0;
Semaphore_Handle sem;
Task_Handle tsk1;
Task_Handle tsk2;

Int finishCount = 0;

/*
 *  ======== main ========
 */
Int main()
{ 
    Task_Params taskParams;
        
    /* Create a Semaphore object to be use as a resource lock */
    sem = Semaphore_create(1, NULL, NULL);

    /* Create two tasks that share a resource*/
    Task_Params_init(&taskParams);
    taskParams.priority = 1;
    tsk1 = Task_create (task1, &taskParams, NULL);
    
    Task_Params_init(&taskParams);
    taskParams.priority = 2;
    tsk2 = Task_create (task2, &taskParams, NULL);

    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== task1 ========
 */
Void task1(UArg arg0, UArg arg1)
{
    UInt32 time;

    for (;;) {
        System_printf("Running task1 function\n");

        if (Semaphore_getCount(sem) == 0) {
            System_printf("Sem blocked in task1\n");
        }

        /* Get access to resource */
        Semaphore_pend(sem, BIOS_WAIT_FOREVER); 

        /* do work by waiting for 2 system ticks to pass */
        time = Clock_getTicks();
        while (Clock_getTicks() <= (time + 1)) {
            ;
        }

        /* do work on locked resource */
        resource += 1;
        /* unlock resource */

        Semaphore_post(sem);

        Task_sleep(10);
    }
}

/*
 *  ======== task2 ========
 */
Void task2(UArg arg0, UArg arg1)
{
    for (;;) {
        System_printf("Running task2 function\n");

        if (Semaphore_getCount(sem) == 0) {
            System_printf("Sem blocked in task2\n");
        }

        /* Get access to resource */
        Semaphore_pend(sem, BIOS_WAIT_FOREVER);

        /* do work on locked resource */
        resource += 1;
        /* unlock resource */
        
        Semaphore_post(sem);
        
        Task_sleep(10);
        
        finishCount++;
        if (finishCount == 5) {
            System_printf("Calling BIOS_exit from task2\n");
            BIOS_exit(0);
        }
    }
}


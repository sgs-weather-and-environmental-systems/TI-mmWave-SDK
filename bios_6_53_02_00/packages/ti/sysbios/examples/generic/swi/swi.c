/*
 *  ======== swi.c ========
 *  The swi example shows how to use the SYS/BIOS Swi module. It 
 *  demonstrates how the various Swi APIs work.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Semaphore.h>

#include <xdc/cfg/global.h>

Swi_Handle swi0, swi1;
Semaphore_Handle sem0;

/*
 *  ======== swi0Fxn =======
 */
Void swi0Fxn(UArg arg0, UArg arg1)
{
    System_printf("Enter swi0Fxn, a0 = %d, a1 = %d\n", (Int)arg0, (Int)arg1);
    System_printf("swi0 trigger = %d\n", Swi_getTrigger());
    System_printf("swi0 pri = %d\n", Swi_getPri(swi0));
    System_printf("Exit swi0Fxn\n");
}

/*
 *  ======== swi1Fxn =======
 */
Void swi1Fxn(UArg arg0, UArg arg1)
{
    System_printf("Enter swi1Fxn, a0 = %d, a1 = %d\n", (Int)arg0, (Int)arg1);
    System_printf("swi1 trigger = %d\n", Swi_getTrigger());
    System_printf("swi1 pri = %d\n", Swi_getPri(swi1));
    System_printf("Exit swi1Fxn\n");
}

/*
 *  ======== clk0Fxn =======
 */
Void clk0Fxn(UArg arg0)
{
    Swi_post(swi0);
    Swi_post(swi1);

    Semaphore_post(sem0);
}

/*
 *  ======== tsk0Fxn =======
 */
Void tsk0Fxn(UArg arg0, UArg arg1)
{
    UInt key;

    /* wait for swis to be posted from Clock function */
    Semaphore_pend(sem0, BIOS_WAIT_FOREVER);

    System_printf("Running tsk0Fxn\n");
         
    key = Swi_disable();        /* swis are disabled */
    Swi_inc(swi0);              /* swi0 trigger = 1 */
    Swi_inc(swi0);              /* swi0 trigger = 2 */
    Swi_restore(key);           /* swi0 runs */

    Swi_or(swi1, 0x100);        /* swi1 runs with trigger = 0x103 */

    Swi_andn(swi1, 0x1);        /* swi1 trigger = 0x10 */
    Swi_andn(swi1, 0x2);        /* swi1 runs with trigger = 0x00 */
        
    Swi_dec(swi1);              /* swi1 trigger = 2 */     
    Swi_dec(swi1);              /* swi1 trigger = 1 */
    Swi_dec(swi1);              /* swi1 runs with trigger = 0 */
        
    System_printf("Calling BIOS_exit\n");
    BIOS_exit(0);
}

/*
 *  ======== main ========
 */
Int main()
{       
    Swi_Params swiParams;
    Task_Params taskParams;
    Clock_Params clkParams;

    Swi_Params_init(&swiParams);
    swiParams.arg0 = 1;
    swiParams.arg1 = 0;
    swiParams.priority = 2;
    swiParams.trigger = 0;

    swi0 = Swi_create(swi0Fxn, &swiParams, NULL);

    swiParams.arg0 = 2;
    swiParams.arg1 = 0;
    swiParams.priority = 1;
    swiParams.trigger = 3;

    swi1 = Swi_create(swi1Fxn, &swiParams, NULL);

    Task_Params_init(&taskParams);
    taskParams.priority = 1;
    Task_create (tsk0Fxn, &taskParams, NULL);

    Clock_Params_init(&clkParams);
    clkParams.startFlag = TRUE;
    Clock_create(clk0Fxn, 2, &clkParams, NULL);

    sem0 = Semaphore_create(0, NULL, NULL);

    BIOS_start();    /* does not return */
    return(0);
}

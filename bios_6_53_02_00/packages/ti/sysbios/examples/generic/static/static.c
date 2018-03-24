/*
 *  ======== static.c ========
 *  The static example focuses on SYS/BIOS configuration. It shows how to
 *  - Use and configure various modules.
 *  - Create static Instances.
 *  - Modify Program level configuration parameters.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Clock.h>

#include <xdc/cfg/global.h>

Bool finishFlag = FALSE;

/*
 *  ======== main ========
 */
Int main()
{ 
    Swi_post(swi0);
    Swi_post(swi1);
    Clock_start(clk1);
    
    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== idl0Fxn ========
 */
Void idl0Fxn()
{
    if (finishFlag) {
        System_printf("Calling BIOS_exit from idl0Fxn\n");   
        BIOS_exit(0);
    }
}

/*
 *  ======== swi0Fxn ========
 */
Void swi0Fxn(UArg arg0, UArg arg1)
{
    System_printf("Running swi0Fxn\n");  
}

/*
 *  ======== swi1Fxn ========
 */
Void swi1Fxn(UArg arg0, UArg arg1)
{
    System_printf("Running swi1Fxn\n");  
}

/*
 *  ======== clk0Fxn ========
 */
Void clk0Fxn(UArg arg0)
{
    System_printf("Running clk0Fxn\n");  
}

/*
 *  ======== clk1Fxn ========
 */
Void clk1Fxn(UArg arg0)
{
    System_printf("Running clk1Fxn\n");
    finishFlag = TRUE; 
}

/*
 *  ======== timer0Fxn ========
 */
Void timer0Fxn()
{
    System_printf("Running timer0Fxn\n"); 
}

/*
 *  ======== task0Fxn ========
 */
Void task0Fxn(UArg arg0, UArg arg1)
{
    System_printf("Running task0Fxn\n");
}

/*
 *  ======== task1Fxn ========
 */
Void task1Fxn(UArg arg0, UArg arg1)
{
   System_printf("Running task1Fxn\n"); 
}


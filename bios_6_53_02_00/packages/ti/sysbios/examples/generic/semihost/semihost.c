/*
 *  ======== hello.c ========
 *  The hello example serves as a basic sanity check program for SYS/BIOS. It
 *  demonstrates how to print the string "hello world" to stdout.
 */

#include <xdc/std.h>

#include <xdc/runtime/System.h>
#include <ti/sysbios/BIOS.h>

/*
 *  ======== main ========
 */
Int main()
{
    System_printf("hello world\n");

    /*
     *  normal BIOS programs, would call BIOS_start() to enable interrupts
     *  and start the scheduler and kick BIOS into gear.  But, this program
     *  is a simple sanity test and calls BIOS_exit() instead.
     */
    BIOS_exit(0);  /* terminates program and dumps SysMin output */
    return(0);
}
